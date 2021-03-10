using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Text;
using System.IO;

namespace web_app_assignment.admin
{
    public partial class message_details : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            Dictionary<string, string> UserDetails = (Dictionary<string, string>)Session["Admin"];

            if(!Page.IsPostBack)
            {
                bool found = false;
                string id = Request.QueryString["Id"] ?? "";

                string sql = "SELECT * FROM ContactMessage WHERE contact_id = @Id AND deleted_at IS NULL";

                SqlConnection con = new SqlConnection(strcon);
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@Id", id);

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                if(dr.Read())
                {
                    found = true;
                    txtEmail.Text = (string)dr["company_email"];
                    txtSubject.Text = (string)dr["subject"];
                    txtMessage.Text = (string)dr["contact_message"];
                    txtEmailReply.Text = (string)dr["company_email"];
                    txtSubjectReply.Text = (string)dr["subject"];
                }

                dr.Close();
                con.Close();

                if(!found)
                {
                    Response.Redirect("contact-message.aspx");
                }
            }

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if(Page.IsValid)
            {
                Dictionary<string, string> UserDetails = (Dictionary<string, string>)Session["Admin"];
                SqlConnection con = new SqlConnection(strcon);

                string emailReply = txtEmailReply.Text.Trim();
                string from = "webissue.emailus@gmail.com";
                // can be used for email subject title also
                string subjectReply = txtSubjectReply.Text;
                // can be used for Mailbody also
                string messageReply = txtMessageReply.Text;

                string id = Request.QueryString["Id"] ?? "";

                string sqlSession = @"SELECT admin_id FROM Admin WHERE admin_email = @email";
                SqlCommand cmdSession = new SqlCommand(sqlSession, con);
                con.Open();
                cmdSession.Parameters.AddWithValue("@email", UserDetails["Admin_Email"]);
                SqlDataReader drSession = cmdSession.ExecuteReader();

                string sqlSubmit = @"UPDATE ContactMessage SET subject = @subject, reply_message = @replyMessage,
                                     replied_by = @reply , replied_date = @reply_date, deleted_at = @delete
                                    WHERE contact_id = @Id";

                SqlCommand cmd = new SqlCommand(sqlSubmit, con);
                cmd.Parameters.AddWithValue("@Id",id);
                cmd.Parameters.AddWithValue("@subject", subjectReply);
                cmd.Parameters.AddWithValue("@replyMessage", messageReply);
                cmd.Parameters.AddWithValue("@reply_date", DateTime.Now);
                cmd.Parameters.AddWithValue("@delete", DateTime.Now);

                while(drSession.Read())
                {
                    cmd.Parameters.AddWithValue("@reply", drSession["admin_id"]);
                }
                drSession.Close();
                cmd.ExecuteNonQuery();
                con.Close();

                MailMessage message = new MailMessage(from, emailReply);

                //Mail Subject
                message.Subject = subjectReply;
                message.Body = messageReply;
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
                    lblMailMessage.Visible = true;
                    lblMailMessage.Text = "Mail Send Successfully";
                    
                }
                catch (Exception ex)
                {
                    lblMailMessage.Visible = true;
                    lblMailMessage.Text = ex.Message;
                }


                //Response.Redirect("message-details.aspx");





            }

        }
    }
}