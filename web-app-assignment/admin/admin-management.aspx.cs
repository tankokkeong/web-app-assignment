using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Net.Mail;
using System.Text;
using System.IO;

namespace web_app_assignment.admin
{
    public partial class admin_management : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Dictionary<string, string> UserDetails = (Dictionary<string, string>)Session["Admin"];

                SqlConnection con = new SqlConnection(strcon);

                string sql = "SELECT * FROM Admin WHERE deleted_at IS NULL";

                SqlCommand cmd = new SqlCommand(sql, con);

                con.Open();
                SqlDataReader read = cmd.ExecuteReader();

                GridView1.DataSource = read;
                GridView1.DataBind();

                read.Close();
                con.Close();
            }
        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //Query String
                e.Row.Cells[4].Text = "<a class='badge badge-success action-btn'  href='admin-details.aspx?viewId=" + e.Row.Cells[4].Text + "' data-toggle='tooltip' data-placement='top' title='View'><i class='fas fa-eye'></i></a>" +
                    "<a class='badge badge-primary action-btn'  href='admin-details.aspx?editId=" + e.Row.Cells[4].Text + "' data-toggle='tooltip' data-placement='top' title='Edit'><i class='fas fa-edit'></i></a>" +
                    "<button class='badge badge-danger action-btn' data-toggle='modal' data-target='#deleteAdmin' type='button' onclick='deleteAdmin(" + e.Row.Cells[4].Text + ")'><i class='fas fa-trash'></i></button>";
            }
        }

        protected void btnAddAdmin_Click(object sender, EventArgs e)
        {
            string admin_email = txtAdminEmail.Text;
            string admin_right = listAdminRight.Text;
            Random random = new Random();
            int length = 16;
            var vkey2 = "";
            for (var i = 0; i < length; i++)
            {
                vkey2 += ((char)(random.Next(1, 26) + 64)).ToString().ToLower();
            }

            Dictionary<string, string> UserDetails = (Dictionary<string, string>)Session["Admin"];
            SqlConnection con = new SqlConnection(strcon);

            string sqlSession2 = @"SELECT admin_id FROM Admin WHERE admin_email = @admin_email";
            SqlCommand cmd2 = new SqlCommand(sqlSession2, con);
            con.Open();
            cmd2.Parameters.AddWithValue("@admin_email", UserDetails["Admin_Email"]);
            SqlDataReader read2 = cmd2.ExecuteReader();

            string sqlInsert = @"INSERT INTO Admin(admin_email, admin_right, created_at, verify_key)
                               VALUES (@admin_email, @admin_right, @created_at, @verify_key)";

            SqlCommand cmd = new SqlCommand(sqlInsert, con);
            cmd.Parameters.AddWithValue("@admin_email", admin_email);
            cmd.Parameters.AddWithValue("@admin_right", admin_right);
            cmd.Parameters.AddWithValue("@created_at", DateTime.Now);
            cmd.Parameters.AddWithValue("@verify_key", vkey2);

            Session["admin_verify_key"] = vkey2;

            //email
            string from = "webissue.emailus@gmail.com";

            MailMessage message = new MailMessage(from, admin_email);

            //Mail Subject
            message.Subject = "Jobs4U Admin Registration";
            message.Body = "Signup yourself " +
                "<a href = 'https://localhost:44329/admin/signup.aspx?v-key=" + vkey2 + "'" + " >here</a> <br />" +
                "Thanks, Jobs4U Team <br />" +
                "***This is a system generated email. Please do not reply to this address***";
            message.BodyEncoding = Encoding.UTF8;
            message.IsBodyHtml = true;

            //SMTP Client port 587 for gmail
            SmtpClient client = new SmtpClient("smtp.gmail.com", 587);

            System.Net.NetworkCredential basicCredential1 = new System.Net.NetworkCredential("webissue.emailus@gmail.com", "webissue123");

            client.EnableSsl = true;
            client.UseDefaultCredentials = false;
            client.Credentials = basicCredential1;
            try
            {
                //send email
                client.Send(message);
            }
            catch (Exception ex)
            {
                
            }

            read2.Close();
            cmd.ExecuteNonQuery();
            con.Close();

            Response.Redirect("admin-management.aspx");
        }

        protected void btnDeleteAdmin_Click(object sender, EventArgs e)
        {
            Dictionary<string, string> UserDetails = (Dictionary<string, string>)Session["Admin"];

            try
            {
                int admin_id = Convert.ToInt32(txtDeleteAdmin.Text);

                SqlConnection con = new SqlConnection(strcon);

                string sql = "UPDATE Admin SET deleted_at = @deleted_at WHERE admin_id = @admin_id";

                SqlCommand cmd = new SqlCommand(sql, con);

                con.Open();
                cmd.Parameters.AddWithValue("@deleted_at", DateTime.Now);
                cmd.Parameters.AddWithValue("@admin_id", admin_id);

                cmd.ExecuteNonQuery();
                con.Close();

                Response.Write("<script>alert('Admin deleted successfully!');</script>");
                Response.Redirect("admin-management.aspx");
            }
            catch (Exception error)
            {
                
            }
        }
    }
}