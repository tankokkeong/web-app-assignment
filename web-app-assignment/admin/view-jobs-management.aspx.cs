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
    public partial class view_management : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            //Open Connection
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }

            //Get post id
            string id = Request.QueryString["viewId"] ?? "";

            string sql_jobPosted = "SELECT * FROM JobPost JP, Recruiter R " +
                                   "WHERE JP.recruiter_id = R.recruiter_id " +
                                   "AND JP.post_id = @post_id " +
                                   "ORDER BY post_id DESC";

            SqlCommand cmd = new SqlCommand(sql_jobPosted, con);
            cmd.Parameters.AddWithValue("@post_id", id);
          
            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                txtJobTitle.Text = dr["job_title"].ToString();
                txtIndustry.Text = dr["industry"].ToString();
                txtSalary.Text = dr["salary"].ToString();
                txtJobDescription.InnerHtml = dr["job_description"].ToString();
                txtCompanyOverview.InnerHtml = dr["company_overview"].ToString();
                txtWorkingHours.Text = dr["working_hours"].ToString();
                txtJobSpecialization.Text = dr["job_specializations"].ToString();
                txtLocation.Text = dr["location"].ToString();
                txtQualification.Text = dr["qualification"].ToString();
                txtExperienceNeeded.Text = dr["experience_needed"].ToString();
                txtJobType.Text = dr["job_type"].ToString();
                txtHQ.Text = dr["head_quaters"].ToString();
                txtBenefits.Text = dr["benefits_others"].ToString();
                txtCompanySize.Text = dr["company_size"].ToString();
                txtProcessTime.Text = dr["process_time"].ToString();
                txtRating.Text = dr["job_rating"].ToString();
            }

            //Close connection
            con.Close();
        }
    }
}