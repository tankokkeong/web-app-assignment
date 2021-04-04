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
        Helper helper = new Helper();
        string strcon = ConfigurationManager.ConnectionStrings["con"].ToString();

        public int chartValue = 0;
        public int chartValue2 = 0;
        public int chartValue3 = 0;
        public int chartValueApp = 0;
        public int chartValuePremium = 0;
        public int chartValuePremium2 = 0;
        public string chartValuePayment = "";
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["Admin"] != null)
            {
                SqlConnection con = new SqlConnection(strcon);
                string adminID = helper.getAdminID();

                //Google Chart Recruiter, JobSeeker and Visitors
                string sqlChart = "SELECT COUNT(*) FROM Recruiter WHERE created_at BETWEEN '2021-01-01' AND '2021-12-31'";
                string sqlChart2 = "SELECT COUNT(*) FROM JobSeeker WHERE created_at BETWEEN '2021-01-01' AND '2021-12-31'";
                string sqlChart3 = "SELECT COUNT(*) FROM Visitors WHERE created_at BETWEEN '2021-01-01' AND '2021-12-31'";
                SqlCommand cmdChart = new SqlCommand(sqlChart, con);
                SqlCommand cmdChart2 = new SqlCommand(sqlChart2, con);
                SqlCommand cmdChart3 = new SqlCommand(sqlChart3, con);
                con.Open();

                this.chartValue = (int)(cmdChart.ExecuteScalar());
                this.chartValue2 = (int)(cmdChart2.ExecuteScalar());
                this.chartValue3 = (int)(cmdChart3.ExecuteScalar());

                //Google Chart Application Sent
                string sqlChartApp = "SELECT COUNT(*) FROM ApplicationStatus WHERE created_at BETWEEN '2021-01-01' AND '2021-12-31'";
                SqlCommand cmdChartApp = new SqlCommand(sqlChartApp, con);

                this.chartValueApp = (int)(cmdChartApp.ExecuteScalar());

                //Google Chart Premium
                string sqlChartPremium1 = "SELECT COUNT(*) FROM Recruiter WHERE created_at BETWEEN '2021-01-01' AND '2021-12-31' AND is_premium = 'true'";
                string sqlChartPremium2 = "SELECT COUNT(*) FROM Recruiter WHERE created_at BETWEEN '2021-01-01' AND '2021-12-31' AND is_premium IS NULL";
                SqlCommand cmdChartPremium1 = new SqlCommand(sqlChartPremium1, con);
                SqlCommand cmdChartPremium2 = new SqlCommand(sqlChartPremium2, con);

                this.chartValuePremium = (int)(cmdChartPremium1.ExecuteScalar());
                this.chartValuePremium2 = (int)(cmdChartPremium2.ExecuteScalar());

                //Google Chart Payment
                string sqlChartPayment = "SELECT SUM(payment_amount) FROM PaymentRecord WHERE created_at BETWEEN '2021-01-01' AND '2021-12-31'";
                SqlCommand cmdChartPayment = new SqlCommand(sqlChartPayment, con);

                this.chartValuePayment = cmdChartPayment.ExecuteScalar().ToString();

                //Get admin_id from database
                string sqlDoList = @"SELECT * FROM ToDoList WHERE belongs_to = @id AND deleted_at IS NULL";
                SqlCommand cmdDoList = new SqlCommand(sqlDoList, con);

                cmdDoList.Parameters.AddWithValue("@id", adminID);

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
                string sqlVisitor = "SELECT COUNT(*) FROM Visitors";

                SqlCommand cmdVisitor = new SqlCommand(sqlVisitor, con);
                con.Open();

                //read from db
                Int32 rows_countVisitor = Convert.ToInt32(cmdVisitor.ExecuteScalar());
                cmdVisitor.Dispose();
                con.Close();

                //display
                lblVisitorDisplay.Text = rows_countVisitor.ToString();



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

                string sqlTopCompany = "SELECT TOP 5 * FROM (SELECT AVG(job_rating) as average_rating, " +
                                        "JP.recruiter_id, R.company_name, R.company_photo " +
                                        "FROM JobPost JP, Recruiter R " +
                                        "WHERE JP.recruiter_id = R.recruiter_id " +
                                        "GROUP BY JP.recruiter_id, R.company_name, R.company_photo) " +
                                        "AS result ORDER BY average_rating DESC ";

                SqlCommand cmdTopCompany = new SqlCommand(sqlTopCompany, con);
                con.Open();
                SqlDataReader drTopCompany = cmdTopCompany.ExecuteReader();

                while (drTopCompany.Read())
                {
                    litResultCompany.Text += "<div class='media'>" +
                                                "<img src='../"+ drTopCompany["company_photo"] +"' class='mr-3 top-company-pic'/>" +
                                                "<div class='media-body'>" +
                                                    "<h5 class='mt-0'>"+ drTopCompany["company_name"] + "</h5>" +
                                                    "<p class='text-secondary'>"+ drTopCompany["average_rating"] + "</p>" +
                                                "</div>" +
                                             "</div>";
                }
                drTopCompany.Close();
                con.Close();

            }
            else 
            {
                Response.Redirect("login.aspx");
            }
            

        }

        protected void btnAddTask_Click(object sender, EventArgs e)
        {
            string adminID = helper.getAdminID();

            string taskName = txtTaskName.Text;
            string taskRemarks = txtTaskRemarks.Text;
            string taskStatus = "active";

            SqlConnection con = new SqlConnection(strcon);


            string sqlInsert = @"INSERT INTO ToDoList(task_name,task_remarks,task_status,belongs_to,created_at)
                            VALUES (@task_name, @task_remarks, @task_status, @belongs_to, @created_at)";
            con.Open();

            SqlCommand cmd = new SqlCommand(sqlInsert, con);
            cmd.Parameters.AddWithValue("@task_name", taskName);
            cmd.Parameters.AddWithValue("@task_remarks", taskRemarks);
            cmd.Parameters.AddWithValue("@task_status", taskStatus);
            cmd.Parameters.AddWithValue("@belongs_to", adminID);
            cmd.Parameters.AddWithValue("@created_at", DateTime.Now);

            cmd.ExecuteNonQuery();
            con.Close();

            Response.Redirect("dashboard.aspx");

            
        }





    }
}