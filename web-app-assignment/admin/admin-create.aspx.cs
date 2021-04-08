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
    public partial class admin_create : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ToString();

        //Create Helper Class
        Helper helper = new Helper();

        protected void Page_Load(object sender, EventArgs e)
        {
            //Check Valid User
            helper.checkAdminLogin();
        }

        protected void btnAddAdmin_Click(object sender, EventArgs e)
        {
            Dictionary<string, string> UserDetails = (Dictionary<string, string>)Session["Admin"];

            if (UserDetails["Admin_Right"] == "Super Admin")
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
            else
            {

            }
        }
    }
}