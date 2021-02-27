using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace web_app_assignment.admin
{
    public partial class dashboard : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            string s = "";
            string sql = "SELECT * FROM ToDoList";

            SqlConnection con = new SqlConnection(strcon);
            SqlCommand cmd = new SqlCommand(sql, con);

            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while(dr.Read())
            {
                s += string.Format("<div class='to-do-task mt-3'><h5 class='mb-0'>{0}</h5><p class='text-secondary mb-0'>{1}</p></div>",dr["task_name"],dr["task_remarks"]);
            }
            dr.Close();
            con.Close();

            litResultToDoList.Text = s;

        }

        protected void btnAddTask_Click(object sender, EventArgs e)
        {

        }

    }
}