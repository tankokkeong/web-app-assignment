using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace web_app_assignment
{
    public partial class chat_post : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            //Read chat content from post submit
            var chat_content = Request.Form["chat_content"];
            var seeker_id = Request.Form["seeker_id"];

            //Insert Chat Record
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                string sql = "INSERT INTO ChatMessages(chat_content, sent_time, sent, received, recruiter_id, seeker_id, created_at) " +
                             "VALUES(@chat_content, @sent_time, @sent, @received, @recruiter_id, @seeker_id, @created_at)";

                //Connect to the database
                SqlCommand cmd = new SqlCommand(sql, con);

                //Insert parameters
                cmd.Parameters.AddWithValue("@chat_content", chat_content);
                cmd.Parameters.AddWithValue("@sent_time", DateTime.Now);
                cmd.Parameters.AddWithValue("@recruiter_id", 1);
                cmd.Parameters.AddWithValue("@seeker_id", seeker_id);
                cmd.Parameters.AddWithValue("@created_at", DateTime.Now);

                //Check role
                if(Session["Recruiter"] != null)
                {
                    cmd.Parameters.AddWithValue("@sent", "Recruiter");
                    cmd.Parameters.AddWithValue("@received", "Job Seeker");
                }
                else
                {
                    cmd.Parameters.AddWithValue("@sent", "Job Seeker");
                    cmd.Parameters.AddWithValue("@received", "Recruiter");
                }

                //Execute the queries
                cmd.ExecuteNonQuery();

                //Close connection
                con.Close();
            }
            catch (Exception error)
            {
                Response.Write("<script>alert(' +" + error.Message + "'); </script>");
            }
        }
    }
}