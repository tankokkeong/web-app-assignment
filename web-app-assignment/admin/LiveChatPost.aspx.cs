using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace web_app_assignment.admin
{
    public partial class LiveChatPost : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            //Read chat content from post submit
            var chat_content = Request.Form["chat_content"];
            var admin_id = Request.Form["admin_id"];
            //var user_id = Request.Form["user_id"];
            //var visitor_id = Request.Form["visitor_id"];

            //Insert Chat Record
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                string sql = "INSERT INTO LiveMessages(chat_content, admin_id, created_at) " +
                             "VALUES(@chat_content, @admin_id, @created_at)";

                //Connect to the database
                SqlCommand cmd = new SqlCommand(sql, con);

                //Insert parameters
                cmd.Parameters.AddWithValue("@chat_content", chat_content);
                cmd.Parameters.AddWithValue("@admin_id", admin_id);
                cmd.Parameters.AddWithValue("@created_at", DateTime.Now);

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