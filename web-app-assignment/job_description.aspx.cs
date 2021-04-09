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
                        string sql = "SELECT * FROM JobPost JP, Recruiter R WHERE JP.post_id = @post_id AND JP.deleted_at IS NULL AND JP.recruiter_id = R.recruiter_id AND JP.deleted_by_admin IS NULL";
                        int record_count = 0;

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
                            lblHeadJobTitle.Text = dr["job_title"].ToString();
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

                            record_count++;
                        }


                        //Redirect back to job description if no record found
                        if(record_count == 0)
                        {
                            Response.Redirect("job_lists.aspx");
                        }

                        //Get seeker id
                        string seeker_id = helper.getSeekerID();

                        //Show Job Review Section if is premium
                        if (Session["User"] != null && helper.getSeekerIsPremium(seeker_id) == true)
                        {
                            divReview.Visible = true;

                            //Display total job review number
                            lblJobReviewCount.Text = getTotalJobReview().ToString();

                            //Display user rating score board
                            getUserRatingBoard();

                            //Check if leave review before
                            if (isReviewedBefore(seeker_id) == false && isApprovedByRecruiter(seeker_id))
                            {
                                divReviewInput.Visible = true;
                                
                            }

                        }
                        else if(Session["Recruiter"] != null)
                        {
                            string recruiter_id = helper.getRecruiterID();

                            if (helper.getRecruiterIsPremium(recruiter_id))
                            {
                                //Display Job seeker_review
                                divReview.Visible = true;

                                //Display total job review number
                                lblJobReviewCount.Text = getTotalJobReview().ToString();

                                //Display user rating score board
                                getUserRatingBoard();

                                //Remove apply now button
                                btn_JobDescriptionDetailsApplyNowButton.Visible = false;
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
            if(Session["User"] != null)
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
            else
            {
                //Redirect to login
                Response.Redirect("login_signup.aspx");
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

                //Open Connection
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                //Update job post rating
                string job_rating = "UPDATE JobPost " +
                                    "SET job_rating = @job_rating " +
                                    "WHERE post_id = @post_id ";

                cmd = new SqlCommand(job_rating, con);

                //Insert parameters
                cmd.Parameters.AddWithValue("@job_rating", calculateLatestJobRating());
                cmd.Parameters.AddWithValue("@post_id", post_id);

                //Execute the queries
                cmd.ExecuteNonQuery();
                con.Close();


                Response.Redirect("job_description.aspx?post_id=" + post_id + "&reviewSuccess");
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

            string sql_jobStatus = "SELECT * FROM JobReview JR, JobSeeker JS WHERE JR.post_id = " + post_id + " AND JR.seeker_id = JS.seeker_id ORDER BY JR.created_at DESC";


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

        protected void getUserRatingBoard()
        {
            string post_id = Request.QueryString["post_id"] ?? "";

            //Open Connection
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }

            string selectJobReview = "SELECT (SELECT COUNT(*) FROM JobReview JR WHERE JR.post_id = @post_id AND rating = 5.0) AS five_star, " +
                                     "(SELECT COUNT(*) FROM JobReview JR WHERE JR.post_id = @post_id AND rating = 4.0) AS four_star, " +
                                     "(SELECT COUNT(*) FROM JobReview JR WHERE JR.post_id = @post_id AND rating = 3.0) AS three_star, " +
                                     "(SELECT COUNT(*) FROM JobReview JR WHERE JR.post_id = @post_id AND rating = 2.0) AS two_star, " +
                                     "(SELECT COUNT(*) FROM JobReview JR WHERE JR.post_id = @post_id AND rating = 1.0) AS one_star ";

            SqlCommand cmd = new SqlCommand(selectJobReview, con);

            //Insert parameters
            cmd.Parameters.AddWithValue("@post_id", post_id);

            SqlDataReader dread = cmd.ExecuteReader();

            while (dread.Read())
            {
                //Retrieve the value
                int five_star = Convert.ToInt32(dread["five_star"].ToString());
                int four_star = Convert.ToInt32(dread["four_star"].ToString());
                int three_star = Convert.ToInt32(dread["three_star"].ToString());
                int two_star = Convert.ToInt32(dread["two_star"].ToString());
                int one_star = Convert.ToInt32(dread["one_star"].ToString());

                //Calculate average rating
                int total_review = five_star + four_star + three_star + two_star + one_star;
                int total_five_star = five_star * 5;
                int total_four_star = four_star * 4;
                int total_three_star = three_star * 3;
                int total_two_star = two_star * 2;
                int total_one_star = one_star * 1;

                int total_stars = total_five_star + total_four_star + total_three_star + total_two_star + total_one_star;

                //Calculate Total rating percentage
                double five_star_pecent = ((double)five_star / (double)total_review) * 100;
                double four_star_pecent = ((double)four_star / (double)total_review) * 100;
                double three_star_pecent = ((double)three_star / (double)total_review) * 100;
                double two_star_pecent = ((double)two_star / (double)total_review) * 100;
                double one_star_pecent = ((double)one_star / (double)total_review) * 100;
                double average_rating = 0.0;

                if (getTotalJobReview() > 0)
                {
                    //Round off to 2 decimal places
                    average_rating = Math.Round(((double)total_stars / (double)(total_review * 5)) * 5, 2);
                }

                

                ltrUserRatingBoard.Text =
                    "<div class='total-rating'>" +
                                "<h5>Job Rating: " + average_rating + "<i class='fas fa-star text-warning'></i></h5>" +
                            "</div>" +

                            "<div class='row mt-3'>" +
                                "<div class='col-lg-2 text-center'>" +
                                    "5 stars" +
                                "</div>" +

                                "<div class='col-lg-8'>" +
                                    "<div class='progress'>" +
                                      "<div class='progress-bar bg-success' role='progressbar' style='width:" + five_star_pecent + "%;' aria-valuenow='" + five_star_pecent + "' aria-valuemin='0' aria-valuemax='100'></div>" +
                                    "</div>" +
                                "</div>" +

                                "<div class='col-lg-2 text-center'>" +
                                    five_star.ToString() +
                                "</div>" +
                            "</div>" +

                             "<div class='row mt-3'>" +
                                "<div class='col-lg-2 text-center'>" +
                                    "4 stars" +
                                "</div>" +

                                "<div class='col-lg-8'>" +
                                    "<div class='progress'>" +
                                      "<div class='progress-bar four-star-bg' role='progressbar' style='width:" + four_star_pecent + "%;' aria-valuenow='" + four_star_pecent + "' aria-valuemin='0' aria-valuemax='100'></div>" +
                                    "</div>" +
                                "</div>" +

                                "<div class='col-lg-2 text-center'>" +
                                    four_star.ToString() +
                                "</div>" +
                            "</div>" +

                             "<div class='row mt-3'>" +
                                "<div class='col-lg-2 text-center'>" +
                                    "3 stars" +
                                "</div>" +

                                "<div class='col-lg-8'>" +
                                    "<div class='progress'>" +
                                      "<div class='progress-bar bg-warning' role='progressbar' style='width:" + three_star_pecent +"%;' aria-valuenow='" + three_star_pecent + "' aria-valuemin='0' aria-valuemax='100'></div>" +
                                    "</div>" +
                                "</div>" +

                                "<div class='col-lg-2 text-center'>" +
                                    three_star.ToString() +
                                "</div>" +
                            "</div>" +

                             "<div class='row mt-3'>" +
                                "<div class='col-lg-2 text-center'>" +
                                    "2 stars" +
                                "</div>" +

                                "<div class='col-lg-8'>" +
                                    "<div class='progress'>" +
                                      "<div class='progress-bar two-star-bg' role='progressbar' style='width:" + two_star_pecent + "%;' aria-valuenow='" + two_star_pecent + "' aria-valuemin='0' aria-valuemax='100'></div>" +
                                    "</div>" +
                                "</div>" +

                                "<div class='col-lg-2 text-center'>" +
                                    two_star.ToString() +
                                "</div>" +
                            "</div>" +

                            "<div class='row mt-3'>" +
                                "<div class='col-lg-2 text-center'>" +
                                    "1 stars" +
                                "</div>" +

                                "<div class='col-lg-8'>" +
                                    "<div class='progress'>" +
                                      "<div class='progress-bar bg-danger' role='progressbar' style='width:" + one_star_pecent + "%;' aria-valuenow='" + one_star_pecent + "' aria-valuemin='0' aria-valuemax='100'></div>" +
                                    "</div>" +
                                "</div>" +

                                "<div class='col-lg-2 text-center'>" +
                                     one_star.ToString() +
                                "</div>" +
                            "</div>";
            }

            //Close Connection
            con.Close();
        }

        protected double calculateLatestJobRating()
        {
            double job_rating = 0.0;

            string post_id = Request.QueryString["post_id"] ?? "";

            //Open Connection
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }

            string selectJobReview = "SELECT (SELECT COUNT(*) FROM JobReview JR WHERE JR.post_id = @post_id AND rating = 5.0) AS five_star, " +
                                     "(SELECT COUNT(*) FROM JobReview JR WHERE JR.post_id = @post_id AND rating = 4.0) AS four_star, " +
                                     "(SELECT COUNT(*) FROM JobReview JR WHERE JR.post_id = @post_id AND rating = 3.0) AS three_star, " +
                                     "(SELECT COUNT(*) FROM JobReview JR WHERE JR.post_id = @post_id AND rating = 2.0) AS two_star, " +
                                     "(SELECT COUNT(*) FROM JobReview JR WHERE JR.post_id = @post_id AND rating = 1.0) AS one_star ";

            SqlCommand cmd = new SqlCommand(selectJobReview, con);

            //Insert parameters
            cmd.Parameters.AddWithValue("@post_id", post_id);

            SqlDataReader dread = cmd.ExecuteReader();

            while (dread.Read())
            {
                //Retrieve the value
                int five_star = Convert.ToInt32(dread["five_star"].ToString());
                int four_star = Convert.ToInt32(dread["four_star"].ToString());
                int three_star = Convert.ToInt32(dread["three_star"].ToString());
                int two_star = Convert.ToInt32(dread["two_star"].ToString());
                int one_star = Convert.ToInt32(dread["one_star"].ToString());

                //Calculate average rating
                int total_review = five_star + four_star + three_star + two_star + one_star;
                int total_five_star = five_star * 5;
                int total_four_star = four_star * 4;
                int total_three_star = three_star * 3;
                int total_two_star = two_star * 2;
                int total_one_star = one_star * 1;

                int total_stars = total_five_star + total_four_star + total_three_star + total_two_star + total_one_star;


                if (getTotalJobReview() > 0)
                {
                    //Round off to 2 decimal places
                    job_rating = Math.Round(((double)total_stars / (double)(total_review * 5)) * 5, 2);
                }
                    
            }

            return job_rating;
        }
    }
}