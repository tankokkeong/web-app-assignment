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

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                //Check Login
                if(Session["Recruiter"] == null)
                {
                    Response.Redirect("home.aspx");
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

                //Read User profile Details
                string sql = "SELECT * FROM Recruiter WHERE recruiter_id = @recruiter_id";

                cmd = new SqlCommand(sql, con);

                //Insert parameter
                cmd.Parameters.AddWithValue("@recruiter_id", recruiterID);

                dr = cmd.ExecuteReader();
                while(dr.Read())
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

                //Open Connection
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                string sql_jobStatus = "SELECT * FROM ApplicationStatus ASS, JobSeeker JS, JobPost JP " +
                                        "WHERE ASS.seeker_id = JS.seeker_id AND " +
                                        "ASS.post_id = JP.post_id AND " +
                                        "JP.recruiter_id = @recruiter_id";

                cmd = new SqlCommand(sql_jobStatus, con);

                //Insert parameter
                cmd.Parameters.AddWithValue("@recruiter_id", recruiterID);

                dr = cmd.ExecuteReader();

                //Print out the application status
                while (dr.Read())
                {
                    lblJobStatus.Text = lblJobStatus.Text +
                    "<div class='application-bar row'>" +
                        "<div class='col-sm-3 mt-3'>" +
                            "<img src = 'images/user%20profile/demo-user.png' class='company-pic'/>" +
                        "</div>" +

                        "<div class='col-sm-3 mt-3'>" +
                            "<div class='company-name text-lightgreen'>" + dr["full_name"] + "</div>" +
                            "<div class='company-location'>" +
                                "<span class='company-location-details text-secondary'><i class='fas fa-map-marker-alt'></i> Kuala Lumpur, Selangor</span>" +
                            "</div>" +

                            "<div class='hiring-position'>" +
                                "<span class='hiring-details'>Graphic Designer</span>" +
                            "</div>" +

                            "<div class='view-profile'>" +
                                "<button class='btn btn-info'>View Profile</button>" +
                            "</div>" +
                        "</div>" +

                        "<div class='col-sm-3 mt-3'>" +
                            "<div class='application-status text-info'>Applied</div>" +
                            "<div>" +
                                dr["job_title"] +
                            "</div>" +

                            "<div class='employment-type badge badge-success'>" +
                                dr["job_type"] +
                        "</div>" +
                    "</div>";

                    if(dr["applied_status"].ToString() == "Pending")
                    {
                        lblJobStatus.Text = lblJobStatus.Text +
                            "<div class='col-sm-3 mt-3'>" +
                            "<div class='mt-2'>" +
                                "<button href = 'chatbox.aspx' class='btn btn-success' data-toggle='modal' data-target='#approveModal' type='button' onclick='approveApplication(" + dr["application_id"].ToString() + ")'>Approve</button>" +
                            "</div>" +

                            "<div class='mt-2'>" +
                                "<button class='btn btn-danger'>Reject</button>" +
                            "</div>" +
                        "</div>" +
                    "</div>";

                    }
                    else
                    {
                        lblJobStatus.Text = lblJobStatus.Text +
                        "<div class='col-sm-3 mt-3'>" +
                            "<div class='mt-2'>" +
                                "<a href = 'chatbox.aspx?seeker=" + dr["seeker_id"].ToString() + "' class='btn btn-success'>Chat</a>" +
                            "</div>" +

                            "<div class='mt-2'>" +
                                "<a href = 'schedule.aspx?seeker=" + dr["seeker_id"].ToString()  + "' class='btn btn-primary'>Schedule</a>" +
                            "</div>" +

                            "<div class='mt-2'>" +
                                "<button class='btn btn-danger'>Remove</button>" +
                            "</div>" +
                        "</div>" +
                    "</div>";
                    }
                        
                    //Response.Write("<script>alert('" + dr["seeker_id"] + "');</script>");
                    //Response.Write("<script>alert('fuck');</script>");
                }


                //Close connection
                con.Close();

                //Open Connection
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                //Read Job Posted
                string sql_jobposted = "SELECT * FROM JobPost WHERE recruiter_id = " + recruiterID + " AND deleted_at IS NULL";
                SqlDataAdapter cmd2 = new SqlDataAdapter(sql_jobposted, con);

                

                DataTable dtbl = new DataTable();
                cmd2.Fill(dtbl);
                GridView1.DataSource = dtbl;
                GridView1.DataBind();


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
                // Display the job type in colours.
                if(e.Row.Cells[1].Text == "Full Time")
                {
                    e.Row.Cells[1].Text = "<span class='badge badge-success'>" + e.Row.Cells[1].Text + "</span>";
                }
                else
                {
                    e.Row.Cells[1].Text = "<span class='badge badge-danger'>" + e.Row.Cells[1].Text + "</span>";
                }

                //Query String
                e.Row.Cells[4].Text = "<a class='btn btn-success p-1 mr-2'  href='edit-postjob.aspx?job=" + e.Row.Cells[4].Text + "'> Edit</a>" +
                    "<button class='btn btn-danger p-1' data-toggle='modal' data-target='#deleteModal' type='button' onclick='deleteJob(" + e.Row.Cells[4].Text + ")'>Delete</button>";
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

                //Read User profile Details
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
    }
}