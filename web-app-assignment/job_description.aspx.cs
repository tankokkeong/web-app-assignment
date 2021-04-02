﻿using System;
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

        //create helper
        Helper helper = new Helper();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
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

                        //Get seeker id
                        string seeker_id = helper.getSeekerID();

                        //Show Job Review Section if is premium
                        if (Session["User"] != null && helper.getSeekerIsPremium(seeker_id) == true)
                        {
                            divReview.Visible = true;

                            //Display total job review number
                            lblJobReviewCount.Text = getTotalJobReview().ToString();

                            //Check if leave review before
                            if(isReviewedBefore(seeker_id) == false && isApprovedByRecruiter(seeker_id))
                            {
                                divReviewInput.Visible = true;
                            }
                        }
                        else
                        {
                            divReview.Visible = false;
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
        }

        protected void btn_JobDescriptionDetailsApplyNowButton_Click(object sender, EventArgs e)
        {
            try
            {
                string seekerID = helper.getSeekerID();
                string is_premium = "";
                bool applicationSent = false;

                applicationSent = checkApplicationSent();

                if (applicationSent)
                {
                    Response.Write("<script>alert('Already Applied For this Job');</script>");
                }
                else
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    string selectSeekerID = "SELECT * FROM JobSeeker WHERE seeker_id = @seekerID AND mobile_number IS NOT NULL" +
                        " AND contact_email IS NOT NULL AND location IS NOT NULL AND profession IS NOT NULL";

                    SqlCommand cmd = new SqlCommand(selectSeekerID, con);

                    cmd.Parameters.AddWithValue("@seekerID", seekerID);

                    SqlDataReader dr = cmd.ExecuteReader();

                    while (dr.Read())
                    {
                        seekerID = dr["seeker_id"].ToString();

                        if (dr["is_premium"].ToString() == "true")
                        {
                            is_premium = "true";
                        }
                    }

                    con.Close();

                    if (is_premium != "true")
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
            }
            catch (Exception error)
            {
                Response.Write("<script>alert('" + error.Message + "');</script>");
            }
        }

        protected bool checkApplicationSent()
        {
            bool applicationSent = false;

            //Open Connection
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }

            Helper helper = new Helper();

            string seekerID = helper.getSeekerID();
            string post_id = Request.QueryString["post_id"] ?? "";

            string selectSeekerID = "SELECT COUNT(*) FROM ApplicationStatus WHERE seeker_id = @seekerID AND post_id = @post_id AND deleted_at IS NULL";

            SqlCommand cmd = new SqlCommand(selectSeekerID, con);

            cmd.Parameters.AddWithValue("@seekerID", seekerID);
            cmd.Parameters.AddWithValue("@post_id", post_id);

            int ApplicationExist = Convert.ToInt32(cmd.ExecuteScalar());

            if (ApplicationExist > 0)
            {
                applicationSent = true;
            }
            else
            {
                applicationSent = false;
            }

            //Close Connection
            con.Close();

            return applicationSent;
        }

        protected void btnPostReview_Click(object sender, EventArgs e)
        {
            try
            {
                var star_rating = txtStarRating.Text;
                var review_content = HttpUtility.UrlDecode(txtUserReview.Text);
                string post_id = Request.QueryString["post_id"] ?? "";
                string seeker_id = helper.getSeekerID();

                //Open Connection
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                string insert_review = "INSERT INTO JobReview (review_content, rating, review_date, post_id, seeker_id, created_at) " +
                    "VALUES(@review_content, @rating, @review_date, @post_id, @seeker_id, @created_at)";

                SqlCommand cmd = new SqlCommand(insert_review, con);

                //Insert parameters
                cmd.Parameters.AddWithValue("@review_content", review_content);
                cmd.Parameters.AddWithValue("@rating", star_rating);
                cmd.Parameters.AddWithValue("@review_date", DateTime.Now);
                cmd.Parameters.AddWithValue("@post_id", post_id);
                cmd.Parameters.AddWithValue("@seeker_id", seeker_id);
                cmd.Parameters.AddWithValue("@created_at", DateTime.Now);

                cmd.ExecuteNonQuery();

                //Close Connection
                con.Close();

                Response.Write("<script>alert('Review Inserted!');</script>");
            }
            catch (Exception error)
            {
                Response.Write("<script>alert('" + error.Message + "');</script>");
            }
            
        }

        protected void DataPager1_PreRender(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(strcon);

            //Open Connection
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }

            string post_id = Request.QueryString["post_id"] ?? "";

            string sql_jobStatus = "SELECT * FROM JobReview JR, JobSeeker JS WHERE JR.post_id = " + post_id + " AND JR.seeker_id = JS.seeker_id";


            SqlDataAdapter cmd = new SqlDataAdapter(sql_jobStatus, con);



            DataTable dtbl = new DataTable();
            cmd.Fill(dtbl);
            lvJobReview.DataSource = dtbl;
            lvJobReview.DataBind();

            //Close Connection
            con.Close();
        }

        protected int getTotalJobReview()
        {
            string post_id = Request.QueryString["post_id"] ?? "";

            //Open Connection
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }

            string selectJobReview = "SELECT COUNT(*) FROM JobReview JR, JobSeeker JS WHERE JR.post_id = " + post_id + " AND JR.seeker_id = JS.seeker_id";

            SqlCommand cmd = new SqlCommand(selectJobReview, con);


            int total_review = Convert.ToInt32(cmd.ExecuteScalar());

            return total_review;
        }

        protected bool isReviewedBefore(string seeker_id)
        {
            string post_id = Request.QueryString["post_id"] ?? "";
            bool reviewed_before = false;

            //Open Connection
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }

            string selectJobReview = "SELECT COUNT(*) FROM JobReview JR, JobSeeker JS WHERE JR.post_id = @post_id AND JR.seeker_id = @seeker_id";


            SqlCommand cmd = new SqlCommand(selectJobReview, con);

            //Insert parameters
            cmd.Parameters.AddWithValue("@post_id", post_id);
            cmd.Parameters.AddWithValue("@seeker_id", seeker_id);

            //Check if record exists
            if(Convert.ToInt32(cmd.ExecuteScalar()) > 0)
            {
                reviewed_before = true;
            }

            return reviewed_before;
        }

        protected bool isApprovedByRecruiter(string seeker_id)
        {
            string post_id = Request.QueryString["post_id"] ?? "";
            bool is_approved = false;

            //Open Connection
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }

            string selectJobReview = "SELECT COUNT(*) FROM ApplicationStatus WHERE post_id = @post_id AND seeker_id = @seeker_id AND applied_status = @applied_status";


            SqlCommand cmd = new SqlCommand(selectJobReview, con);

            //Insert parameters
            cmd.Parameters.AddWithValue("@post_id", post_id);
            cmd.Parameters.AddWithValue("@seeker_id", seeker_id);
            cmd.Parameters.AddWithValue("@applied_status", "Approved");

            //Check if record exists
            if (Convert.ToInt32(cmd.ExecuteScalar()) > 0)
            {
                is_approved = true;
            }
            return is_approved;
        }
    }
}