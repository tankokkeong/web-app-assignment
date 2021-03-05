using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace web_app_assignment.admin
{
    public partial class task_post : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            //Read task content from post submit
            var task_id = Request.Form["task_id"];
            if (task_id != null)
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                string sql = "UPDATE ToDoList SET deleted_at = @delete WHERE task_id = @Id";

                 //Connect to the database
                SqlCommand cmd = new SqlCommand(sql, con);

                //Insert parameters
                cmd.Parameters.AddWithValue("@delete", DateTime.Now);
                cmd.Parameters.AddWithValue("@Id", task_id);

                //Execute the queries
                cmd.ExecuteNonQuery();

                //Close connection
                con.Close();

                Response.Redirect("dashboard.aspx");

            }
            else 
            {
                Response.Redirect("dashboard.aspx");
            }
        }
    }
}