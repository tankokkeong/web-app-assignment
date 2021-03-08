using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Text;
using System.Net.Mail;

namespace web_app_assignment
{
    public partial class Forgotten_Password : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ToString();
        DataTable dt = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void forgotPasswordFormEmailButtonSubmit_Click (object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection(strcon);

                Session["email"] = forgotPasswordFormEmail.Text;

                SqlDataAdapter adp = new SqlDataAdapter("select * from JobSeeker where email = @email " , conn);

                conn.Open();

                adp.SelectCommand.Parameters.AddWithValue("@email", forgotPasswordFormEmail.Text);

                adp.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    sendEmail();

                    lblresult.Text = "Successfully sent reset link on  your mail ,please check once! Thank you.";

                    conn.Close();

                    forgotPasswordFormEmail.Text = "";

                }
                else
                {

                    lblresult.Text = "Please enter vaild email ,please check once! Thank you.";

                }

            }

            catch (Exception ex)
            {

            }
        }

        private void sendEmail()
        {
            try
            {

                string from = "webissue.emailus@gmail.com";
                string to = forgotPasswordFormEmail.Text.Trim();

                MailMessage message = new MailMessage(from, to);

                //Mail Subject
                message.Subject = "Reset Password";
                message.Body = "Hi,<br/> Click on below given link to Reset Your Password<br/>" +
                               "<a href=https://localhost:44329/Reset_Password.aspx?" + GetVerifyKey(forgotPasswordFormEmail.Text) +
                               ">Click here to change your password</a><br/>" +
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
                //    StringBuilder sb = new StringBuilder();

                //    sb.Append("Hi,<br/> Click on below given link to Reset Your Password<br/>");
                //    sb.Append("<a href=" + GetUserEmail(forgotPasswordFormEmail.Text));
                //    sb.Append("&email=" + forgotPasswordFormEmail.Text + ">Click here to change your password</a><br/>");
                //    sb.Append("<b>Thanks</b>,<br> Web Issue <br/>");

                //    MailMessage message = new System.Net.Mail.MailMessage("webissue.emailus@gmail.com", forgotPasswordFormEmail.Text.Trim(), "Reset Your Password", sb.ToString());

                //    SmtpClient smtp = new SmtpClient();

                //    smtp.Host = "smtp.gmail.com";

                //    smtp.Port = 587;

                //    smtp.Credentials = new System.Net.NetworkCredential("webissue.emailus@gmail.com", "webissuedev123");

                //    smtp.EnableSsl = true;

                //    message.IsBodyHtml = true;

                //    smtp.Send(message);
                //}
            }
            catch (Exception error)
            {
                Response.Write(error.Message);
            }
        }

        private string GetVerifyKey (string Email)
        {

            SqlConnection con = new SqlConnection(strcon);
            con.Open();
            String query = "select verify_key from JobSeeker where email= @email";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@email", forgotPasswordFormEmail.Text);
            string verify_key = cmd.ExecuteScalar().ToString();
            con.Close();
            return verify_key;

            
        }
    }
}