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

                string sql = "SELECT * FROM Admin";

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
            string admin_name = txtAdminName.Text;
            string admin_email = txtAdminEmail.Text;
            string admin_right = listAdminRight.Text;

            Dictionary<string, string> UserDetails = (Dictionary<string, string>)Session["Admin"];
            SqlConnection con = new SqlConnection(strcon);

            string sqlSession2 = @"SELECT admin_id FROM Admin WHERE admin_email = @admin_email";
            SqlCommand cmd2 = new SqlCommand(sqlSession2, con);
            con.Open();
            cmd2.Parameters.AddWithValue("@admin_email", UserDetails["Admin_Email"]);
            SqlDataReader read2 = cmd2.ExecuteReader();

            string sqlInsert = @"INSERT INTO Admin(admin_name, admin_email, admin_right, created_at)
                            VALUES (@admin_name, @admin_email, @admin_right, @created_at)";

            SqlCommand cmd = new SqlCommand(sqlInsert, con);
            cmd.Parameters.AddWithValue("@admin_name", admin_name);
            cmd.Parameters.AddWithValue("@admin_email", admin_email);
            cmd.Parameters.AddWithValue("@admin_right", admin_right);
            cmd.Parameters.AddWithValue("@created_at", DateTime.Now);

            //email
            string from = "webissue.emailus@gmail.com";

            MailMessage message = new MailMessage(from, admin_email);

            //Mail Subject
            message.Subject = "Jobs4U Admin Registration";
            message.Body = "Signup yourself at (put link here) <br />" +
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

        //protected void btnDeleteMessage_Click(object sender, EventArgs e)
        //{
        //    string admin_id = txtDeleteAdmin.Text;

        //    Dictionary<string, string> UserDetails = (Dictionary<string, string>)Session["Admin"];

        //    try
        //    {
        //        int admin_id = Convert.ToInt32(txtDeleteAdmin.Text);

        //        SqlConnection con = new SqlConnection(strcon);

        //        //Read User profile Details
        //        string sql = "UPDATE Admin SET deleted_at = @delete WHERE admin_id = @adminID";

        //        SqlCommand cmd = new SqlCommand(sql, con);

        //        con.Open();
        //        //Insert parameters
        //        cmd.Parameters.AddWithValue("@delete", DateTime.Now);
        //        cmd.Parameters.AddWithValue("@adminID", admin_id);

        //        //Execute the queries
        //        cmd.ExecuteNonQuery();
        //        con.Close();

        //        Response.Write("<script>alert('Admin deleted successfully!');</script>");
        //        Response.Redirect("admin-management.aspx");
        //    }
        //    catch (Exception error)
        //    {
        //        Response.Write("<script>alert('" + error.Message + "');</script>");
        //    }
        //}

        //protected void btnDeleteAdmin_Click(object sender, EventArgs e)
        //{
        //    Dictionary<string, string> UserDetails = (Dictionary<string, string>)Session["Admin"];

        //    try
        //    {
        //        int admin_id = Convert.ToInt32(txtDeleteAdmin.Text);

        //        SqlConnection con = new SqlConnection(strcon);

        //        string sql = "UPDATE Admin SET deleted_at = @deleted_at WHERE admin_id = @admin_id";

        //        SqlCommand cmd = new SqlCommand(sql, con);

        //        con.Open();
        //        cmd.Parameters.AddWithValue("@deleted_at", DateTime.Now);
        //        cmd.Parameters.AddWithValue("@admin_id", admin_id);

        //        cmd.ExecuteNonQuery();
        //        con.Close();

        //        Response.Write("<script>alert('Record deleted successfully!');</script>");
        //        Response.Redirect("contact-message.aspx");
        //    }
        //    catch (Exception error)
        //    {
        //        Response.Write("<script>alert('" + error.Message + "');</script>");
        //    }
        //}

    }
}