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
                string emailReply = txtEmailReply.Text.Trim();
                string from = "webissue.emailus@gmail.com";
                // can be used for email subject title also
                string subjectReply = txtSubjectReply.Text;
                // can be used for Mailbody also
                string messageReply = txtMessageReply.Text;

                string id = Request.QueryString["Id"] ?? "";

                string sqlSubmit = @"UPDATE ContactMessage SET subject = @subject, reply_message = @replyMessage,
                                     deleted_at = @delete
                                    WHERE contact_id = @Id";

                SqlConnection con = new SqlConnection(strcon);
                SqlCommand cmd = new SqlCommand(sqlSubmit, con);
                cmd.Parameters.AddWithValue("@Id",id);
                cmd.Parameters.AddWithValue("@subject", subjectReply);
                cmd.Parameters.AddWithValue("@replyMessage", messageReply);
                cmd.Parameters.AddWithValue("@delete", DateTime.Now);

                con.Open();
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