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
    public partial class recruiter_profile : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        //Create Helper Class
        Helper helper = new Helper();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                //View Profile Query String
                string view_id = Request.QueryString["view"] ?? "";

                //Check Login
                if (Session["Recruiter"] == null)
                {
                    if(view_id == "")
                    {
                        Response.Redirect("login_signup.aspx");
                    }
                    
                }
                else
                {
                    //Get Recruiter ID
                    string recruiterID = helper.getRecruiterID();
                    string is_premium = "";      

                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    //Read User profile Details
                    string sql = "SELECT * FROM Recruiter WHERE recruiter_id = @recruiter_id";

                    SqlCommand cmd = new SqlCommand(sql, con);

                    //Insert parameter
                    cmd.Parameters.AddWithValue("@recruiter_id", recruiterID);

                    SqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        lblRecruiterName.Text = dr["company_name"].ToString();
                        imgRecruiterProfile.ImageUrl = dr["company_photo"].ToString();
                        lblRecruiterState.Text = dr["state"].ToString();
                        lblRecruiterIndustry.Text = dr["industry"].ToString();
                        linkFB.NavigateUrl = dr["facebook_link"].ToString();
                        linkLinkedIn.NavigateUrl = dr["linkedin_link"].ToString();
                        lblIntroduction.Text = dr["introduction"].ToString();
                        lblRecruiterEmail.Text = dr["email"].ToString();
                        lblRecruiterPhone.Text = dr["mobile_number"].ToString();
                        lblRecruiterContactEmail.Text = dr["contact_email"].ToString();
                        lblRecruiterAddress1.Text = dr["address_line1"].ToString();
                        lblRecruiterAddress2.Text = dr["address_line2"].ToString();
                        lblRecruiterCity.Text = dr["city"].ToString();
                        lblRecruiterState2.Text = dr["state"].ToString();
                        lblRecruiterZip.Text = dr["zip_code"].ToString();
                        lblRecruiterCountry.Text = dr["country"].ToString();
                        lblRecruiterRating.Text = getCompanyAverageRating(dr["recruiter_id"].ToString());

                        //Check premium user
                        if (dr["is_premium"].ToString() != "true")
                        {
                            ltrPlan.Text = "Free  <button type='button' class='btn bg-lightgreen text-light' data-toggle='modal' data-target='#premiumModal'>Upgrade</button>";
                            lblFreePlan.Text = "Current Plan";
                            lblPremiumPlan.Text = "<a class='text-lightgreen' href='upgrade.aspx'>Upgrade</a>";
                        }
                        else
                        {
                            ltrPlan.Text = "Premium <button type='button' class='btn bg-lightgreen text-light' data-toggle='modal' data-target='#premiumModal'>View</button>";
                            lblFreePlan.Text = "Free Plan";
                            lblPremiumPlan.Text = "<span class='text-lightgreen'>Current Plan</span>";

                            is_premium = "true";
                        }
                    }

                    //Close connection
                    con.Close();

                    //Check Job Posted if not premium
                    if (is_premium != "true")
                    {
                        string sql_jobPosted = "SELECT COUNT(*) FROM JobPost WHERE recruiter_id = @recruiter_id AND deleted_at IS NULL";

                        //Open Connection
                        if (con.State == ConnectionState.Closed)
                        {
                            con.Open();
                        }


                        cmd = new SqlCommand(sql_jobPosted, con);

                        //Insert parameter
                        cmd.Parameters.AddWithValue("@recruiter_id", recruiterID);

                        int posted_count = Convert.ToInt32(cmd.ExecuteScalar());

                        if(posted_count > 0)
                        {
                            lblPostJob.Text = "<span data-toggle='tooltip' data-placement='right' title='Premium only' tabindex='0'>" +
                                                "<button class='btn btn-primary' disabled>Post New Job</button>" +
                                                "<i class='fas fa-lock' id='post-job-lock'></i>" +
                                                "</span>";
                        }
                        else
                        {
                            lblPostJob.Text = "<a class='btn btn-primary' href='post-job.aspx'>Post New Job</a>";
                        }
                    }
                    else
                    {
                        lblPostJob.Text = "<a class='btn btn-primary' href='post-job.aspx'>Post New Job</a>";
                    }

                    //Check Application Received
                    if (getApplicationCount(recruiterID) == 0)
                    {
                        lblJobStatus.Text = "No application yet";
                    }
                }

                //View Profile
                
                if(Session["Recruiter"] == null && view_id != "")
                {
                    //Read User profile Details
                    string sql = "SELECT * FROM Recruiter WHERE recruiter_id = @recruiter_id";

                    SqlCommand cmd = new SqlCommand(sql, con);

                    //Insert parameter
                    cmd.Parameters.AddWithValue("@recruiter_id", view_id);

                    SqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        lblRecruiterName.Text = dr["company_name"].ToString();
                        imgRecruiterProfile.ImageUrl = dr["company_photo"].ToString();
                        lblRecruiterState.Text = dr["state"].ToString();
                        lblRecruiterIndustry.Text = dr["industry"].ToString();
                        linkFB.NavigateUrl = dr["facebook_link"].ToString();
                        linkLinkedIn.NavigateUrl = dr["linkedin_link"].ToString();
                        lblIntroduction.Text = dr["introduction"].ToString();
                        lblRecruiterEmail.Text = dr["email"].ToString();
                        lblRecruiterPhone.Text = dr["mobile_number"].ToString();
                        lblRecruiterContactEmail.Text = dr["contact_email"].ToString();
                        lblRecruiterAddress1.Text = dr["address_line1"].ToString();
                        lblRecruiterAddress2.Text = dr["address_line2"].ToString();
                        lblRecruiterCity.Text = dr["city"].ToString();
                        lblRecruiterState2.Text = dr["state"].ToString();
                        lblRecruiterZip.Text = dr["zip_code"].ToString();
                        lblRecruiterCountry.Text = dr["country"].ToString();
                        lblRecruiterRating.Text = dr["rating"].ToString();
                    }

                    //Close connection
                    con.Close();
                }


            }
            catch (Exception error)
            {
                Response.Write("<script>alert('" + error.Message + "');</script>");
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
               
                //Hide the deleted by admin column
                e.Row.Cells[5].Visible = false;

                // Display the job type in colours.
                if (e.Row.Cells[1].Text == "Full Time")
                {
                    e.Row.Cells[1].Text = "<span class='badge badge-success'>" + e.Row.Cells[1].Text + "</span>";
                }
                else
                {
                    e.Row.Cells[1].Text = "<span class='badge badge-danger'>" + e.Row.Cells[1].Text + "</span>";
                }

                if(getIsPremium() == "true")
                {
                    //Query String
                    e.Row.Cells[4].Text = "<a class='btn btn-success p-1 mr-2'  href='edit-postjob.aspx?job=" + e.Row.Cells[4].Text + "'> Edit</a>" +
                        "<button class='btn btn-danger p-1 mr-2' data-toggle='modal' data-target='#deleteModal' type='button' onclick='deleteJob(" + e.Row.Cells[4].Text + ")'>Delete</button>" +
                        "<a class='btn btn-primary p-1' href='job_description.aspx?post_id=" + e.Row.Cells[4].Text + "'>Review</button>";
                }
                else
                {
                    //Query String
                    e.Row.Cells[4].Text = "<a class='btn btn-success p-1 mr-2'  href='edit-postjob.aspx?job=" + e.Row.Cells[4].Text + "'> Edit</a>" +
                        "<button class='btn btn-danger p-1 mr-2' data-toggle='modal' data-target='#deleteModal' type='button' onclick='deleteJob(" + e.Row.Cells[4].Text + ")'>Delete</button>" +
                        "<span data-toggle ='tooltip' data-placement ='right' title ='Premium only' tabindex ='0' >" +
                        "<button class='btn btn-primary p-1' disabled>Review</button><i class='fas fa-lock' id='schedule-lock'></i>" +
                        "</span>";
                }

                if(e.Row.Cells[5].Text != "&nbsp;")
                {
                    e.Row.Cells[4].Text = "<span class='text-danger'>Deleted by admin <br> Reason: " + e.Row.Cells[5].Text + "</span>";
                }

            }

        }

        protected void btnDeleteJob_Click(object sender, EventArgs e)
        {
            try
            {

                var post_id = txtDeleteJob.Text;

                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                //Delete Job Posted
                string sql = "Update JobPost " +
                        "SET deleted_at = @deleted_at " +
                        "WHERE post_id = @post_id";

                SqlCommand cmd = new SqlCommand(sql, con);

                //Insert parameters
                cmd.Parameters.AddWithValue("@deleted_at", DateTime.Now);
                cmd.Parameters.AddWithValue("@post_id", post_id);

                //Execute the queries
                cmd.ExecuteNonQuery();
                con.Close();

                Response.Write("<script>alert('Record Deleted successful!');</script>");
                Response.Redirect("recruiter-profile.aspx?deletedJob");


            }
            catch (Exception error)
            {
                Response.Write("<script>alert('" + error.Message + "');</script>");
            }
        }

        protected void btnApproveJob_Click(object sender, EventArgs e)
        {
            try
            {

                var application_id = txtApproveApplication.Text;

                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                //Read User profile Details
                string sql = "Update ApplicationStatus " +
                        "SET applied_status = 'Approved' " +
                        "WHERE application_id = @application_id";

                SqlCommand cmd = new SqlCommand(sql, con);

                //Insert parameters
                cmd.Parameters.AddWithValue("@application_id", application_id);

                //Execute the queries
                cmd.ExecuteNonQuery();
                con.Close();

                Response.Write("<script>alert('Application approved!!');</script>");
                Response.Redirect("recruiter-profile.aspx?approval");

            }
            catch (Exception error)
            {
                Response.Write("<script>alert('" + error.Message + "');</script>");
            }
        }

        protected string getIsPremium()
        {
            SqlConnection con = new SqlConnection(strcon);

            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }

            //Get Recruiter ID
            Dictionary<string, string> RecruiterDetails = (Dictionary<string, string>)Session["Recruiter"];

            string recruiterID = "";
            string is_premium = "";

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

            //Read User profile Details
            string sql = "SELECT * FROM Recruiter WHERE recruiter_id = @recruiter_id";

            cmd = new SqlCommand(sql, con);

            //Insert parameter
            cmd.Parameters.AddWithValue("@recruiter_id", recruiterID);

            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                if(dr["is_premium"].ToString() != "true")
                {
                    is_premium = "false";
                }
                else
                {
                    is_premium = "true";
                }
            }

            return is_premium;
        }

        protected int getApplicationCount(string recruiter_id)
        {
            SqlConnection con = new SqlConnection(strcon);

            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }

            int application_count = 0;
            
            string sql_jobStatus = "SELECT COUNT(*) FROM ApplicationStatus ASS, JobSeeker JS, JobPost JP " +
                                            "WHERE ASS.seeker_id = JS.seeker_id AND " +
                                            "ASS.deleted_at IS NULL AND " +
                                            "ASS.post_id = JP.post_id AND " +
                                            "JP.recruiter_id = @recruiter_id";

            SqlCommand cmd = new SqlCommand(sql_jobStatus, con);

            //Insert parameter
            cmd.Parameters.AddWithValue("@recruiter_id", recruiter_id);

            application_count = Convert.ToInt32(cmd.ExecuteScalar().ToString());

            return application_count;
        }

        protected void DataPager1_PreRender(object sender, EventArgs e)
        {
            //Check Login
            if(Session["Recruiter"] != null)
            {
                SqlConnection con = new SqlConnection(strcon);

                //Open Connection
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                //get Recruiter ID
                string recruiter_id = helper.getRecruiterID();

                string sql_jobStatus = "SELECT application_id, user_photo, full_name, ASS.seeker_id, job_title, job_type, applied_status, R.is_premium, JS.location, JS.country " +
                                        "FROM ApplicationStatus ASS, JobSeeker JS, JobPost JP, Recruiter R " +
                                        "WHERE ASS.seeker_id = JS.seeker_id AND " +
                                        "JP.deleted_at IS NULL AND " +
                                        "ASS.deleted_at IS NULL AND " +
                                        "ASS.post_id = JP.post_id AND " +
                                        "JP.recruiter_id = " + recruiter_id + " AND " +
                                        "R.recruiter_id = " + recruiter_id +
                                        "ORDER BY ASS.created_at DESC";

                SqlDataAdapter cmd = new SqlDataAdapter(sql_jobStatus, con);



                DataTable dtbl = new DataTable();
                cmd.Fill(dtbl);
                lvJobStatus.DataSource = dtbl;
                lvJobStatus.DataBind();

                //Close Connection
                con.Close();
            }
            
        }

        protected void gvJobPosted_PreRender(object sender, EventArgs e)
        {
            if (Session["Recruiter"] != null)
            {
                SqlConnection con = new SqlConnection(strcon);

                //Open Connection
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                //Get Recruiter ID
                string recruiterID = helper.getRecruiterID();

                //Read Job Posted
                string sql_jobposted = "SELECT * FROM JobPost WHERE recruiter_id = " + recruiterID + " AND deleted_at IS NULL ORDER BY created_at DESC";
                SqlDataAdapter cmd = new SqlDataAdapter(sql_jobposted, con);



                DataTable dtbl = new DataTable();
                cmd.Fill(dtbl);
                gvJobPosted.DataSource = dtbl;
                gvJobPosted.DataBind();

                //Close Connection
                con.Close();
            }
            
        }

        protected void gvJobPosted_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvJobPosted.PageIndex = e.NewPageIndex;
            gvJobPosted.DataBind();

            hfJobPagination.Value = "job-posted";
        }

        protected void gvJobPosted_Sorting(object sender, GridViewSortEventArgs e)
        {
            DataTable dataTable = gvJobPosted.DataSource as DataTable;

            if (dataTable != null)
            {
                DataView dataView = new DataView(dataTable);
                dataView.Sort = e.SortExpression + " " + ConvertSortDirectionToSql(e.SortDirection);

                gvJobPosted.DataSource = dataView;
                gvJobPosted.DataBind();
            }
        }

        private string ConvertSortDirectionToSql(SortDirection sortDirection)
        {
            string newSortDirection = String.Empty;

            switch (sortDirection)
            {
                case SortDirection.Ascending:
                    newSortDirection = "ASC";
                    break;

                case SortDirection.Descending:
                    newSortDirection = "DESC";
                    break;
            }

            return newSortDirection;
        }

        protected void btnDeleteApplicants_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }

            //Job posted
            string sql = "Update ApplicationStatus " +
                        "SET deleted_at = @deleted_at " +
                        "WHERE application_id = @application_id";

            SqlCommand cmd = new SqlCommand(sql, con);

            //Insert parameters
            cmd.Parameters.AddWithValue("@deleted_at", DateTime.Now);
            cmd.Parameters.AddWithValue("@application_id", txtApplicantionID.Text);

            //Execute the queries
            cmd.ExecuteNonQuery();
            con.Close();

            //Redirect back with query string
            Response.Redirect("recruiter-profile.aspx?deleteApplicants");
        }

        protected void btnRejectApplicant_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }

            //Job posted
            string sql = "Update ApplicationStatus " +
                        "SET deleted_at = @deleted_at " +
                        "WHERE application_id = @application_id";

            SqlCommand cmd = new SqlCommand(sql, con);

            //Insert parameters
            cmd.Parameters.AddWithValue("@deleted_at", DateTime.Now);
            cmd.Parameters.AddWithValue("@application_id", txtRejectApplicant.Text);

            //Execute the queries
            cmd.ExecuteNonQuery();
            con.Close();

            //Redirect back with query string
            Response.Redirect("recruiter-profile.aspx?rejectApplicants");
        }

        protected string getCompanyAverageRating(string recruiter_id)
        {
            string company_rating = "No Rating Yet";

            try
            {
                
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                //Job posted
                string sql = "SELECT * FROM" +
                            "(SELECT AVG(job_rating) as average_rating, " +
                            "JP.recruiter_id, R.company_name, R.company_photo " +
                            "FROM JobPost JP, Recruiter R " +
                            "WHERE JP.recruiter_id = R.recruiter_id " +
                            "GROUP BY JP.recruiter_id, R.company_name, R.company_photo) " +
                            "AS result WHERE result.recruiter_id = @recruiter_id " +
                            "ORDER BY average_rating DESC";

                SqlCommand cmd = new SqlCommand(sql, con);

                //Insert parameters
                cmd.Parameters.AddWithValue("@recruiter_id", recruiter_id);

                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    company_rating = dr["average_rating"].ToString().Substring(0, 4);
                }

                //close connection
                con.Close();

                return company_rating;
            }
            catch(Exception error)
            {
                Response.Write("<script>alert('" + error.Message + "');</script>");
                return company_rating;
            }
            
        }
    }
}