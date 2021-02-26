using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace web_app_assignment
{
    public partial class job_lists : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                string sql = "SELECT * FROM JobPost JP, Recruiter R WHERE JP.recruiter_id = R.recruiter_id;";

                SqlCommand cmd = new SqlCommand(sql, con);

                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    lbl_JobListCompanyPosition.Text = dr["job_title"].ToString();
                    lbl_JobListCompanyLocation.Text = dr["location"].ToString();
                    lbl_JobListCompanySalary.Text = "MYR " + dr["salary"].ToString();
                    lbl_JobListCompanyJobType.Text = dr["job_type"].ToString();
                    lbl_JobListCompanyIndustry.Text = dr["company_name"].ToString();
                    img_JobListCompanyLogoPosition.ImageUrl = dr["company_photo"].ToString();
                }
            }
            catch (Exception error)
            {
                Response.Write("<script>alert('" + error.Message + "');</script>");
            }
        }

        protected void btn_jobListContentsContactNow2_Click(object sender, EventArgs e)
        {
            Response.Redirect("recruiter-profile.aspx");
        }

        protected void btn_jobListContentsApplyNow2_Click(object sender, EventArgs e)
        {
            Response.Redirect("job_description.aspx");
        }
    }
}