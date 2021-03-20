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

                if (post_id != "")
                {
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
                else
                {
                    Response.Redirect("job_lists.aspx");
                }
            }
            catch (Exception error)
            {
                Response.Write("<script>alert('" + error.Message + "');</script>");
            }
        }

        protected void btn_JobDescriptionDetailsApplyNowButton_Click(object sender, EventArgs e)
        {
            try
            {
                Dictionary<string, string> UserDetail = (Dictionary<string, string>)Session["User"];

                string seekerID = "";
                string is_premium = "";
                bool validSeeker = false;

                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                string selectSeekerID = "SELECT * FROM JobSeeker WHERE email = @email AND mobile_number IS NOT NULL AND contact_email IS NOT NULL AND location IS NOT NULL AND profession IS NOT NULL";

                if (UserDetail["user_email"] == null)
                {
                    Response.Write("<script>alert('Empty Email');</script>");
                }

                SqlCommand cmd = new SqlCommand(selectSeekerID, con);

                cmd.Parameters.AddWithValue("@email", UserDetail["user_email"].ToString());

                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    seekerID = dr["seeker_id"].ToString();
                    
                    if(dr["is_premium"].ToString() == "true")
                    {
                        is_premium = "true";
                    }
                }
                
                con.Close();

                if(is_premium != "true")
                {
                    //Open Connection
                    con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    string sql_jobApplied = "SELECT COUNT(*) FROM ApplicationStatus WHERE seeker_id = @seeker_id AND deleted_at IS NULL";

                    cmd = new SqlCommand(sql_jobApplied, con);

                    //Insert parameter
                    cmd.Parameters.AddWithValue("@seeker_id", seekerID);

                    int applied_count = Convert.ToInt32(cmd.ExecuteScalar());

                    //Close connection
                    con.Close();

                    if (applied_count > 0)
                    {
                        Response.Write("<script>alert('You can only apply 1 job, please upgrade your plan!');</script>");
                    }
                    else
                    {
                        //Open Connection
                        con = new SqlConnection(strcon);
                        if (con.State == ConnectionState.Closed)
                        {
                            con.Open();
                        }

                        string post_id = Request.QueryString["post_id"] ?? "";

                        string sql = "INSERT INTO ApplicationStatus (applied_time, applied_status, seeker_id, post_id, created_at) " +
                                    "VALUES(GETDATE(), 'Pending', @seeker_id, @post_id, GETDATE())";

                        cmd = new SqlCommand(sql, con);

                        cmd.Parameters.AddWithValue("@post_id", post_id);
                        cmd.Parameters.AddWithValue("@seeker_id", seekerID);

                        cmd.ExecuteNonQuery();

                        con.Close();

                        Response.Write("<script>alert('Application Sent Successfully!');</script>");
                    }
                }
                else
                {
                    //Open Connection
                    con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    string post_id = Request.QueryString["post_id"] ?? "";

                    string sql = "INSERT INTO ApplicationStatus (applied_time, applied_status, seeker_id, post_id, created_at) " +
                                "VALUES(GETDATE(), 'Pending', @seeker_id, @post_id, GETDATE())";

                    cmd = new SqlCommand(sql, con);

                    cmd.Parameters.AddWithValue("@post_id", post_id);
                    cmd.Parameters.AddWithValue("@seeker_id", seekerID);

                    cmd.ExecuteNonQuery();

                    //Close Connection
                    con.Close();

                    Response.Write("<script>alert('Application Sent Successfully!');</script>");
                }
                               
                
            }
            catch (Exception error)
            {
                Response.Write("<script>alert('" + error.Message + "');</script>");
            }
        }
    }
}