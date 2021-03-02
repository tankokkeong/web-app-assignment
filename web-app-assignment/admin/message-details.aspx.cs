using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

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
                string emailReply = txtEmailReply.Text;
                string subjectReply = txtSubjectReply.Text;
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

                Response.Redirect("message-details.aspx");
            }

        }
    }
}