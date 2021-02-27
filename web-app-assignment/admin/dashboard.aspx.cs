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
            string taskName = txtTaskName.Text;
            string taskRemarks = txtTaskRemarks.Text;
            string taskStatus = "active";

            string sqlInsert = @"INSERT INTO ToDoList(task_name,task_remarks,task_status,belongs_to,created_at)
                            VALUES (@task_name, @task_remarks, @task_status, @belongs_to, @created_at)";

            SqlConnection con = new SqlConnection(strcon);
            SqlCommand cmd = new SqlCommand(sqlInsert, con);
            cmd.Parameters.AddWithValue("@task_name", taskName);
            cmd.Parameters.AddWithValue("@task_remarks", taskRemarks);
            cmd.Parameters.AddWithValue("@task_status", taskStatus);
            cmd.Parameters.AddWithValue("@belongs_to", 1);
            cmd.Parameters.AddWithValue("@created_at", DateTime.Now);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            Response.Write("<script>alert(' Inserted successful!');</script>");
            Response.Redirect("dashboard.aspx");
        }

    }
}