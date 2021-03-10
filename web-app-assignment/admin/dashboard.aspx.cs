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
            
            Dictionary<string, string> UserDetails = (Dictionary<string, string>)Session["Admin"];
            
            if(Session["Admin"] != null)
            {
                SqlConnection con = new SqlConnection(strcon);

                //Get admin_id from database
                string sqlSession = @"SELECT admin_id FROM Admin WHERE admin_email = @email";
                SqlCommand cmdSession = new SqlCommand(sqlSession, con);
                con.Open();
                
                cmdSession.Parameters.AddWithValue("@email", UserDetails["Admin_Email"]);

                SqlDataReader drSession = cmdSession.ExecuteReader();

                string sqlDoList = @"SELECT * FROM ToDoList WHERE belongs_to = @id AND deleted_at IS NULL";
                SqlCommand cmdDoList = new SqlCommand(sqlDoList, con);

                int adminID = 0;

                while (drSession.Read())
                {
                    adminID = Int32.Parse(drSession["admin_id"].ToString());
                }
                cmdDoList.Parameters.AddWithValue("@id", adminID);

                drSession.Close();

                //To-Do-List
                string s = "";

                SqlDataReader drDoList = cmdDoList.ExecuteReader();
                while (drDoList.Read())
                {
                    s += string.Format("<div class='to-do-task mt-3'>" +
                                        "<h5 id='task-name' class='mb-0'>{0}</h5>" +
                                        "<p id='task-remarks' class='text-secondary mb-0'>{1}</p>" +
                                        "<a href='task-post.aspx?Id={2}' class='btn btn-light delete-task-btn'><img src='images/dashboard/delete.png' width='25px' height='25px'></a>" +
                                        "</div>", drDoList["task_name"], drDoList["task_remarks"],drDoList["task_id"]);
                }
                drDoList.Close();
                con.Close();

                litResultToDoList.Text = s;


                //Visitor count






                //Job Seeker count
                string sqlSeeker = "SELECT COUNT(*) FROM JobSeeker";

                SqlCommand cmdSeeker = new SqlCommand(sqlSeeker, con);
                con.Open();

                //read from db
                Int32 rows_countSeeker = Convert.ToInt32(cmdSeeker.ExecuteScalar());
                cmdSeeker.Dispose();
                con.Close();

                //display
                lblJobSeekerDisplay.Text = rows_countSeeker.ToString();

                //Recruiter count
                string sqlRecruiter = "SELECT COUNT(*) FROM Recruiter";

                SqlCommand cmdRecruiter = new SqlCommand(sqlRecruiter, con);
                con.Open();

                //read from db
                Int32 rows_countRecruiter = Convert.ToInt32(cmdRecruiter.ExecuteScalar());
                cmdRecruiter.Dispose();
                con.Close();

                //display
                lblRecruiterDisplay.Text = rows_countRecruiter.ToString();


                //Job Posted count
                string sqlJobPosted = "SELECT COUNT(*) FROM JobPost";

                SqlCommand cmdJobPosted = new SqlCommand(sqlJobPosted, con);
                con.Open();

                //read from db
                Int32 rows_countJobPosted = Convert.ToInt32(cmdJobPosted.ExecuteScalar());
                cmdJobPosted.Dispose();
                con.Close();

                //display
                lblJobPostedDisplay.Text = rows_countJobPosted.ToString();



                //Top 5 companies

                string company = "";
                string sqlTopCompany = "SELECT top 5 company_name, company_photo,rating FROM Recruiter ORDER BY rating desc; ";

                SqlCommand cmdTopCompany = new SqlCommand(sqlTopCompany, con);
                con.Open();
                SqlDataReader drTopCompany = cmdTopCompany.ExecuteReader();

                while (drTopCompany.Read())
                {
                    company += string.Format("<div class='media'>" +
                                                "<img src='{0}' class='mr-3 top-company-pic'/>" +
                                                "<div class='media-body'>" +
                                                    "<h5 class='mt-0'>{1}</h5>" +
                                                    "<p class='text-secondary'>{2}</p>" +
                                                "</div>" +
                                            "</div>", drTopCompany["company_photo"], drTopCompany["company_name"], drTopCompany["rating"]);
                }
                drTopCompany.Close();
                con.Close();

                litResultCompany.Text = company;
            }
            else 
            {
                Response.Redirect("login.aspx");
            }
            

        }

        protected void btnAddTask_Click(object sender, EventArgs e)
        {
            
            string taskName = txtTaskName.Text;
            string taskRemarks = txtTaskRemarks.Text;
            string taskStatus = "active";

            Dictionary<string, string> UserDetails = (Dictionary<string, string>)Session["Admin"];
            SqlConnection con = new SqlConnection(strcon);

            string sqlSession2 = @"SELECT admin_id FROM Admin WHERE admin_email = @email";
            SqlCommand cmdSession2 = new SqlCommand(sqlSession2, con);
            con.Open();
            cmdSession2.Parameters.AddWithValue("@email", UserDetails["Admin_Email"]);
            SqlDataReader drSession2 = cmdSession2.ExecuteReader();

            string sqlInsert = @"INSERT INTO ToDoList(task_name,task_remarks,task_status,belongs_to,created_at)
                            VALUES (@task_name, @task_remarks, @task_status, @belongs_to, @created_at)";
            
            
            SqlCommand cmd = new SqlCommand(sqlInsert, con);
            cmd.Parameters.AddWithValue("@task_name", taskName);
            cmd.Parameters.AddWithValue("@task_remarks", taskRemarks);
            cmd.Parameters.AddWithValue("@task_status", taskStatus);
            cmd.Parameters.AddWithValue("@created_at", DateTime.Now);

            while (drSession2.Read())
            {
                cmd.Parameters.AddWithValue("@belongs_to", drSession2["admin_id"]);
            }
            drSession2.Close();
            cmd.ExecuteNonQuery();
            con.Close();

            Response.Redirect("dashboard.aspx");

            
        }





    }
}