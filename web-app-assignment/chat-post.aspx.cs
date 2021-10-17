using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace web_app_assignment
{
    public partial class chat_post : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        [WebMethod]
        public static string submitLiveMessage(string chat_content, string sender_id, string sender_name)
        {
            //Declare the connection strings
            string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

            SqlConnection con = new SqlConnection(strcon);

            //Open Connection
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }

            string sql = "INSERT INTO LiveMessages(chat_content, seeker_id, recruiter_id, visitor_id, admin_id, seen_message, sender_name, created_at) " +
                             "VALUES(@chat_content, @seeker_id, @recruiter_id, @visitor_id, @admin_id, @seen_message, @sender_name, @created_at)";

            //Connect to the database
            SqlCommand cmd = new SqlCommand(sql, con);

            string sent_time = DateTime.Now.ToString("dd MMMM yyyy h:mm tt");



            if (sender_id.IndexOf("_") == 6)
            {
                //Insert parameters
                cmd.Parameters.AddWithValue("@seeker_id", sender_id.Substring(7));
                cmd.Parameters.AddWithValue("@recruiter_id", DBNull.Value);
                cmd.Parameters.AddWithValue("@visitor_id", DBNull.Value);
                cmd.Parameters.AddWithValue("@admin_id", DBNull.Value);
                cmd.Parameters.AddWithValue("@seen_message", "unseen");
                cmd.Parameters.AddWithValue("@sender_name", sender_name);
                cmd.Parameters.AddWithValue("@chat_content", chat_content);
                cmd.Parameters.AddWithValue("@created_at", DateTime.Now);

                //Execute the queries
                cmd.ExecuteNonQuery();
            }
            else if (sender_id.IndexOf("_") == 9)
            {
                //Insert parameters
                cmd.Parameters.AddWithValue("@seeker_id", DBNull.Value);
                cmd.Parameters.AddWithValue("@recruiter_id", sender_id.Substring(10));
                cmd.Parameters.AddWithValue("@visitor_id", DBNull.Value);
                cmd.Parameters.AddWithValue("@admin_id", DBNull.Value);
                cmd.Parameters.AddWithValue("@seen_message", "unseen");
                cmd.Parameters.AddWithValue("@sender_name", sender_name);
                cmd.Parameters.AddWithValue("@chat_content", chat_content);
                cmd.Parameters.AddWithValue("@created_at", DateTime.Now);

                //Execute the queries
                cmd.ExecuteNonQuery();
            }
            else
            {
                //Insert parameters
                cmd.Parameters.AddWithValue("@seeker_id", DBNull.Value);
                cmd.Parameters.AddWithValue("@recruiter_id", DBNull.Value);
                cmd.Parameters.AddWithValue("@visitor_id", sender_id);
                cmd.Parameters.AddWithValue("@admin_id", DBNull.Value);
                cmd.Parameters.AddWithValue("@seen_message", "unseen");
                cmd.Parameters.AddWithValue("@sender_name", sender_name);
                cmd.Parameters.AddWithValue("@chat_content", chat_content);
                cmd.Parameters.AddWithValue("@created_at", DateTime.Now);

                //Execute the queries
                cmd.ExecuteNonQuery();
            }



            //Close connection
            con.Close();

            return sent_time;
        }
    }
}