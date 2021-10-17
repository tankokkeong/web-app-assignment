using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace web_app_assignment.admin
{
    public partial class LiveChat : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        public string sender_id = "Admin";


        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                //find total admin sent messages
                string sentMessagesSQL = "SELECT (SELECT COUNT(*) FROM LiveMessages WHERE admin_id IS NOT NULL) as total_sent, " +
                                        "(SELECT COUNT(*) FROM LiveMessages WHERE visitor_id IS NOT NULL OR recruiter_id IS NOT NULL or seeker_id IS NOT NULL) as total_received";

                SqlCommand cmd = new SqlCommand(sentMessagesSQL, con);

                SqlDataReader dread = cmd.ExecuteReader();

                while (dread.Read())
                {
                    lblSentMessages.Text = dread["total_sent"].ToString();
                    lblReceivedMessages.Text = dread["total_received"].ToString();
                    lblTotalMessages.Text = (Convert.ToInt32(dread["total_sent"]) + Convert.ToInt32(dread["total_received"])).ToString();
                }

                con.Close();

                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                string chatSQL = "WITH added_row_number AS (" +
                                " SELECT *, " +
                                "ROW_NUMBER() OVER(PARTITION BY recruiter_id, seeker_id, admin_id, visitor_id ORDER BY created_at DESC) AS row_number" +
                                " FROM LiveMessages) " +
                                "SELECT * FROM added_row_number WHERE row_number = 1";

                SqlCommand cmd2 = new SqlCommand(chatSQL, con);

                SqlDataReader dread2 = cmd2.ExecuteReader();

                while (dread2.Read())
                {
                    if(dread2["recruiter_id"] != DBNull.Value)
                    {
                        ltrChatContent.Text = ltrChatContent.Text +
                        "<a href ='LiveChat.aspx?chat=Recruiter_" + dread2["recruiter_id"] + "' class='chat-content-link'>" +
                         "<div class='row chat-row' id='" + dread2["recruiter_id"].ToString() + "'>" +
                             "<div class='col-sm-4'>" +
                                dread2["sender_name"].ToString() +
                             "</div>" +

                             "<div class='col-sm-2'>" +
                                 "<span class='badge badge-secondary'>" + dread2["seen_message"].ToString() + "</span>" +
                             "</div>" +

                             "<div class='col-sm-6 user-message-dashboard'>" +
                                 "<span id = '' >" + dread2["chat_content"].ToString() + "</span>" +
                             "</div>" +

                         "</div></a>";
                    }
                    else if(dread2["seeker_id"] != DBNull.Value)
                    {
                        ltrChatContent.Text = ltrChatContent.Text +
                        "<a href ='LiveChat.aspx?chat=Seeker_" + dread2["seeker_id"] + "' class='chat-content-link'>" +
                         "<div class='row chat-row' id='" + dread2["seeker_id"].ToString() + "'>" +
                            "<div class='col-sm-4'>" +
                               dread2["sender_name"].ToString() +
                            "</div>" +

                            "<div class='col-sm-2'>" +
                                "<span class='badge badge-secondary'>" + dread2["seen_message"].ToString() + "</span>" +
                            "</div>" +

                            "<div class='col-sm-6 user-message-dashboard'>" +
                                "<span id = '' >" + dread2["chat_content"].ToString() + "</span>" +
                            "</div>" +

                        "</div></a>";
                    }
                    else
                    {
                        ltrChatContent.Text = ltrChatContent.Text +
                        "<a href ='LiveChat.aspx?chat=" + dread2["visitor_id"] + "' class='chat-content-link'>" +
                         "<div class='row chat-row' id='" + dread2["visitor_id"].ToString() + "'>" +
                            "<div class='col-sm-4'>" +
                               dread2["sender_name"].ToString() +
                            "</div>" +

                            "<div class='col-sm-2'>" +
                                "<span class='badge badge-secondary'>" + dread2["seen_message"].ToString() + "</span>" +
                            "</div>" +

                            "<div class='col-sm-6 user-message-dashboard'>" +
                                "<span id = '' >" + dread2["chat_content"].ToString() + "</span>" +
                            "</div>" +

                        "</div></a>";
                    }
                }

                con.Close();


            }
            catch (Exception error)
            {
                Response.Write("<script>alert('" + error.Message + "');</script>");
            }
        }
    }
}