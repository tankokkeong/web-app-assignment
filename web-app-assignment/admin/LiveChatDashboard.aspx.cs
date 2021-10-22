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
                string sentMessagesSQL = "SELECT COUNT(*) FROM LiveMessages WHERE admin_id IS NOT NULL";

                SqlCommand cmdSend = new SqlCommand(sentMessagesSQL, con);

                int totalSentMessages = Convert.ToInt32(cmdSend.ExecuteScalar());

                txtSentMessages.Text = totalSentMessages.ToString();

                con.Close();

                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                    
                //find total admin received messages
                string receivedMessagesSQL = "SELECT COUNT(*) FROM LiveMessages WHERE seeker_id IS NOT NULL OR recruiter_id IS NOT NULL OR visitor_id IS NOT NULL";

                SqlCommand cmdReceive = new SqlCommand(receivedMessagesSQL, con);

                int totalReceivedMessages = Convert.ToInt32(cmdReceive.ExecuteScalar());

                txtReceivedMessages.Text = totalReceivedMessages.ToString();

                con.Close();

                //find total messages
                int totalMessages = totalSentMessages + totalReceivedMessages;

                txtTotalMessages.Text = totalMessages.ToString();

            }
            catch (Exception error)
            {
                Response.Write("<script>alert('" + error.Message + "');</script>");
            }
        }
    }
}