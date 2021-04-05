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
                               "<a href=https://localhost:44329/Reset_Password.aspx?" + getSeeker_vkey(forgotPasswordFormEmail.Text) + "&Role=" + getSeekerRole() +
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
                    Response.Write(ex.Message);
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
                               "<a href=https://localhost:44329/Reset_Password.aspx?" + getRecruiter_vkey(forgotPasswordFormEmail.Text) + "&Role=" + getRecruiterRole() +
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

        //Get JobSeeker verify_key
        private string getSeeker_vkey(string Email)
        {

            SqlConnection con = new SqlConnection(strcon);

            //Connection Open
            con.Open();
            String query = "select verify_key from JobSeeker where email= @email";

            //Connection Close
            SqlCommand cmd = new SqlCommand(query, con);

            //Insert Parameters
            cmd.Parameters.AddWithValue("@email", forgotPasswordFormEmail.Text);

            //Get verify key
            string seekvkey = cmd.ExecuteScalar().ToString();

            //Connection Close
            con.Close();
            
            //return verify key
            return seekvkey;
            
        }

        //get recruiter verify key
        private string getRecruiter_vkey(string Email)
        {

            SqlConnection con = new SqlConnection(strcon);

            //Connection Open
            con.Open();
            String query = "select verify_key from Recruiter where email= @email";

            //Connect to the database
            SqlCommand cmd = new SqlCommand(query, con);

            //Add Parameter
            cmd.Parameters.AddWithValue("@email", forgotPasswordFormEmail.Text);

            //Get output
            string output = cmd.ExecuteScalar().ToString();

            //Connection Close
            con.Close();

            //return output
            return output;
            
        }

        //get role
        private string getSeekerRole()
        {
            string seekerrole = "job-seeker";
            return seekerrole;
        }
        private string getRecruiterRole()
        {
            string seekerrole = "recruiter";
            return seekerrole;
        }



        protected void forgotPasswordFormEmailButtonSubmit_Click(object sender, EventArgs e)
        {
            
            if (Role.SelectedItem.Value == "job_seeker")
            {
                SqlConnection conn = new SqlConnection(strcon);

                SqlDataAdapter adp = new SqlDataAdapter("select * from JobSeeker where email = @email ", conn);

                //Connection Open
                conn.Open();

                //Add Parameter
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
                    lblNoResult.Text = "Email does not exist. Please enter a correct email";
                    //Response.Write("<script>alert('Email does not exist');</script>");
                }
                conn.Close();
            }
            else if(Role.SelectedItem.Value == "recruiter")
            {
                SqlConnection connection = new SqlConnection(strcon);

                SqlDataAdapter adp = new SqlDataAdapter("select * from Recruiter where email = @email ", connection);

                connection.Open();

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
                    lblNoResult.Text = "Email does not exist. Please enter a correct email";
                    //Response.Write("<script>alert('Email does not exist');</script>");
                }
                connection.Close();
            }
            else
            {
                lblRoleSelect.Text = "Please Choose a role";

            }
        }
    }
}