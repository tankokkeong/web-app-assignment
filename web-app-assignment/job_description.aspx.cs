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
    public partial class job_description : System.Web.UI.Page
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

                string post_id = Request.QueryString["post_id"] ?? "";

                string sql = "SELECT * FROM JobPost JP, Recruiter R WHERE JP.post_id = @post_id AND JP.deleted_at IS NULL AND JP.recruiter_id = R.recruiter_id;";

                SqlCommand cmd = new SqlCommand(sql, con);

                cmd.Parameters.AddWithValue("@post_id", post_id);

                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    string benefitOthers = (string)dr["benefits_others"];
                    string jobSpec = (string)dr["job_specializations"];
                    string qualification = (string)dr["qualification"];
                    string industry = (string)dr["industry"];

                    string[] benefitOthersArr = benefitOthers.Split(',');
                    string[] jobSpecArr = jobSpec.Split(',');
                    string[] qualificationArr = qualification.Split(',');
                    string[] industryArr = industry.Split(',');

                    lbl_JobDescriptionDetailsHeader.Text = dr["company_name"].ToString();
                    img_JobDescriptionDetailsImage.ImageUrl = dr["company_photo"].ToString();
                    lbl_JobDescriptionDetailsJobTitle.Text = dr["job_title"].ToString();
                    lbl_JobDescriptionDetailsLocation.Text = dr["location"].ToString();
                    lbl_JobDescriptionDetailsJobSalary.Text = "MYR " + dr["salary"].ToString();

                    lbl_JobDescriptionDesc.Text = dr["job_description"].ToString();
                    lbl_JobDescriptionExpReq.Text = dr["experience_needed"].ToString();
                    lbl_JobDescriptionJobType.Text = dr["job_type"].ToString();
                    lbl_JobDescriptionWorkingHours.Text = dr["working_hours"].ToString();
                    lbl_JobDescriptionCompOverview.Text = dr["company_overview"].ToString();
                    lbl_JobDescriptionCompSize.Text = dr["company_size"].ToString();
                    lbl_JobDescriptionHeadquaters.Text = dr["head_quaters"].ToString();
                    lbl_JobDescriptionProcessTime.Text = dr["process_time"].ToString();

                    foreach (var Qualification in qualificationArr)
                    {
                        lbl_JobDescriptionQualification.Text += "<button class='btn btn-info mr-3 JobDescriptionContentsBodySubHeadersTagsButton' disabled='true'>" + Qualification.ToString() + "</button>";
                    }

                    foreach (var Industry in industryArr)
                    {
                        lbl_JobDescriptionIndustry.Text += "<button class='btn btn-info mr-3 JobDescriptionContentsBodySubHeadersTagsButton' disabled='true'>" + Industry.ToString() + "</button>";
                    }

                    foreach (var b_o in benefitOthersArr)
                    {
                        lbl_JobDescriptionBenefitOther.Text += "<button class='btn btn-info mr-3 JobDescriptionContentsBodySubHeadersTagsButton' disabled='true'>" + b_o.ToString() + "</button>";
                    }

                    foreach (var jobSpecs in jobSpecArr)
                    {
                        lbl_JobDescriptionJobSpec.Text += "<button class='btn btn-info mr-3 JobDescriptionContentsBodySubHeadersTagsButton' disabled='true'>" + jobSpecs.ToString() + "</button>";
                    }
                }
            }
            catch (Exception error)
            {
                Response.Write("<script>alert('" + error.Message + "');</script>");
            }
        }

        protected void btn_JobDescriptionDetailsApplyNowButton_Click(object sender, EventArgs e)
        {

        }
    }
}