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

                SqlDataAdapter adp = new SqlDataAdapter("select * from JobSeeker where email = @email ", conn);

                conn.Open();

                adp.SelectCommand.Parameters.AddWithValue("@email", forgotPasswordFormEmail.Text);

                adp.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    Session["seeker_verify_key"] = getSeeker_vkey(forgotPasswordFormEmail.Text);

                    sendSeekerEmail();

                    lblresult.Text = "Successfully sent reset link on your email! Thank you.";

                    forgotPasswordFormEmail.Text = "";

                }
                else
                {
                    adp = new SqlDataAdapter("select * from Recruiter where email = @email ", conn);

                    adp.SelectCommand.Parameters.AddWithValue("@email", forgotPasswordFormEmail.Text);

                    adp.Fill(dt);

                    if (dt.Rows.Count > 0)
                    {
                        Session["recruiter_verify_key"] = getRecruiter_vkey(forgotPasswordFormEmail.Text);

                        sendRecruiterEmail();

                        lblresult.Text = "Successfully sent reset link on your email! Thank you.";

                        forgotPasswordFormEmail.Text = "";

                    }
                    else
                    {
                        lblresult.Text = "The email mail You entered does not exist.";
                    }
                    conn.Close();
                }

            }

            catch (Exception error)
            {
                Response.Write(error.Message);
            }
        }

        private void sendSeekerEmail()
        {
            try
            {

                string from = "webissue.emailus@gmail.com";
                string to = forgotPasswordFormEmail.Text.Trim();

                MailMessage message = new MailMessage(from, to);

                //Mail Subject
                message.Subject = "Reset Password";
                message.Body = "Hi,<br/> Click on below given link to Reset Your Password<br/>" +
                               "<a href=https://localhost:44329/Reset_Password.aspx?" + getSeeker_vkey(forgotPasswordFormEmail.Text) +
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
            }
            catch (Exception error)
            {
                Response.Write(error.Message);
            }
        }

        private void sendRecruiterEmail()
        {
            try
            {

                string from = "webissue.emailus@gmail.com";
                string to = forgotPasswordFormEmail.Text.Trim();

                MailMessage message = new MailMessage(from, to);

                //Mail Subject
                message.Subject = "Reset Password";
                message.Body = "Hi,<br/> Click on below given link to Reset Your Password<br/>" +
                               "<a href=https://localhost:44329/Reset_Password.aspx?" + getRecruiter_vkey(forgotPasswordFormEmail.Text) +
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
            }
            catch (Exception error)
            {
                Response.Write(error.Message);
            }
        }

        private string getSeeker_vkey(string Email)
        {

            SqlConnection con = new SqlConnection(strcon);
            con.Open();
            String query = "select verify_key from JobSeeker where email= @email";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@email", forgotPasswordFormEmail.Text);
            string output = cmd.ExecuteScalar().ToString();
            con.Close();
            return output;
            
        }

        private string getRecruiter_vkey(string Email)
        {

            SqlConnection con = new SqlConnection(strcon);
            con.Open();
            String query = "select verify_key from Recruiter where email= @email";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@email", forgotPasswordFormEmail.Text);
            string output = cmd.ExecuteScalar().ToString();
            con.Close();
            return output;
            
        }
    }
}