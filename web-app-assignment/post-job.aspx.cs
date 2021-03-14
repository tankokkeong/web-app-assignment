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
    public partial class post_job : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            //Check Login
            if (Session["Recruiter"] == null)
            {
                Response.Redirect("home.aspx");
            }
        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {

                //Read input from the form
                var job_title = txtJobTitle.Text;
                var job_description = HttpUtility.UrlDecode(txtJobDescription.Text);
                var salary = txtSalary.Text;
                var industry = txtIndustry.Text;
                var qualifications = txtQualification.Text;
                var working_hours = txtWorkingHours.Text;
                var specilizations = txtSpecilization.Text;
                var company_overview = HttpUtility.UrlDecode(txtCompanyOverview.Text);
                var location = txtLocation.Text;
                var experience_needed = txtExperienceNeeded.Text;
                var job_type = ddlJobType.SelectedValue;
                var head_quaters = txtHeadQuarter.Text;
                var benefits = txtBenefits.Text;
                var company_size = ddlCompanySize.SelectedValue;
                var processing_time = txtProcessingTime.Text;

                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    //Get Recruiter ID

                    Dictionary<string, string> RecruiterDetails = (Dictionary<string, string>)Session["Recruiter"];

                    string recruiterID = "";

                    //GET Seeker ID from the seeker table
                    string selectRecruiterID = "SELECT recruiter_id FROM Recruiter WHERE email = @email";

                    SqlCommand cmd = new SqlCommand(selectRecruiterID, con);

                    cmd.Parameters.AddWithValue("@email", RecruiterDetails["recruiter_email"].ToString());

                    SqlDataReader dr = cmd.ExecuteReader();

                    while (dr.Read())
                    {
                        recruiterID = dr["recruiter_id"].ToString();
                    }

                    con.Close();

                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }


                    string sql = "INSERT INTO JobPost(job_title, job_description, salary, industry, qualification, working_hours, job_specializations," +
                                "company_overview, location, experience_needed, job_type, head_quaters, benefits_others, company_size, process_time, recruiter_id, created_at)" +
                                "VALUES(@job_title, @job_description, @salary, @industry, @qualification, @working_hours, @job_specializations, " +
                                "@company_overview, @location, @experience_needed, @job_type, @head_quaters, @benefits_others, @company_size, @process_time, @recruiter_id, @created_at)";

                    //Connect to the database
                    cmd = new SqlCommand(sql, con);


                    //Insert parameters
                    cmd.Parameters.AddWithValue("@job_title", job_title);
                    cmd.Parameters.AddWithValue("@job_description", job_description);
                    cmd.Parameters.AddWithValue("@salary", salary);
                    cmd.Parameters.AddWithValue("@industry", industry);
                    cmd.Parameters.AddWithValue("@qualification", qualifications);
                    cmd.Parameters.AddWithValue("@working_hours", working_hours);
                    cmd.Parameters.AddWithValue("@job_specializations", specilizations);
                    cmd.Parameters.AddWithValue("@company_overview", company_overview);
                    cmd.Parameters.AddWithValue("@location", location);
                    cmd.Parameters.AddWithValue("@experience_needed", experience_needed);
                    cmd.Parameters.AddWithValue("@job_type", job_type);
                    cmd.Parameters.AddWithValue("@head_quaters", head_quaters);
                    cmd.Parameters.AddWithValue("@benefits_others", benefits);
                    cmd.Parameters.AddWithValue("@company_size", company_size);
                    cmd.Parameters.AddWithValue("@process_time", processing_time);
                    cmd.Parameters.AddWithValue("@recruiter_id", recruiterID);
                    cmd.Parameters.AddWithValue("@created_at", DateTime.Now);

                    //Execute the queries
                    cmd.ExecuteNonQuery();
                    con.Close();

                    Response.Write("<script>alert('Record Inserted successful!');</script>");

                    //Clear the form
                    ClearForm();

                }
                catch (Exception error)
                {
                    lblError.Text = error.Message;
                }
            }
            else
            {
                lblError.Text = "FAILED";
            }
            
        }

        protected void ClearForm()
        {
            txtJobTitle.Text = "";
            txtJobDescription.Text = "";
            txtSalary.Text = "";
            txtIndustry.Text = "";
            txtQualification.Text = "";
            txtWorkingHours.Text = "";
            txtSpecilization.Text = "";
            txtCompanyOverview.Text = "";
            txtLocation.Text = "";
            txtExperienceNeeded.Text = "";
            ddlJobType.SelectedValue = "";
            txtHeadQuarter.Text = "";
            txtBenefits.Text = "";
            ddlCompanySize.SelectedValue = "";
            txtProcessingTime.Text = "";
        }
    }
}