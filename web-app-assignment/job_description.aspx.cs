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

                string sql = "SELECT * FROM JobPost";

                SqlCommand cmd = new SqlCommand(sql, con);

                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    string benefitOthers = (string)dr["benefits_others"];
                    string jobSpec = (string)dr["job_specialiazations"];

                    string[] benefitOthersArr = benefitOthers.Split('/');
                    string[] jobSpecArr = jobSpec.Split('/');

                    lbl_JobDescriptionDesc.Text = dr["job_description"].ToString();
                    lbl_JobDescriptionExpReq.Text = dr["experience_needed"].ToString();
                    lbl_JobDescriptionJobType.Text = dr["job_type"].ToString();
                    lbl_JobDescriptionQualification.Text = dr["qualificaton"].ToString();
                    lbl_JobDescriptionWorkingHours.Text = dr["working_hours"].ToString();
                    lbl_JobDescriptionCompOverview.Text = dr["company_overview"].ToString();
                    lbl_JobDescriptionCompSize.Text = dr["company_size"].ToString();
                    lbl_JobDescriptionHeadquaters.Text = dr["head_quaters"].ToString();
                    lbl_JobDescriptionIndustry.Text = dr["industry"].ToString();
                    lbl_JobDescriptionProcessTime.Text = dr["process_time"].ToString();

                    foreach (var b_o in benefitOthersArr)
                    {
                        lbl_JobDescriptionJobSpec.Text += "<button class='btn btn-info mr-3 JobDescriptionContentsBodySubHeadersTagsButton' disabled='true'>" + b_o.ToString() + "</button>";
                    }

                    foreach (var jobSpecs in jobSpecArr)
                    {
                        lbl_JobDescriptionBenefitOther.Text += "<button class='btn btn-info mr-3 JobDescriptionContentsBodySubHeadersTagsButton' disabled='true'>" + jobSpecs.ToString() + "</button>";
                    }
                }
            }
            catch (Exception error)
            {
                Response.Write("<script>alert('" + error.Message + "');</script>");
            }
        }
    }
}