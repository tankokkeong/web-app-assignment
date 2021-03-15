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
    public partial class user_profile : System.Web.UI.Page
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
                if (Session["User"] == null)
                {
                    Response.Redirect("home.aspx");
                }

                //Get Seeker ID
                Dictionary<string, string> UserDetails = (Dictionary<string, string>)Session["User"];

                string seeker_id = "";

                //GET Seeker ID from the seeker table
                string selectSeekerID = "SELECT seeker_id FROM JobSeeker WHERE email = @email";

                SqlCommand cmd = new SqlCommand(selectSeekerID, con);

                cmd.Parameters.AddWithValue("@email", UserDetails["user_email"].ToString());

                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    seeker_id = dr["seeker_id"].ToString();
                }

                con.Close();

                //Reopen connection
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                //Read User profile Details
                string sql = "SELECT * FROM JobSeeker WHERE seeker_id = @seeker_id";

                cmd = new SqlCommand(sql, con);

                //Insert parameter
                cmd.Parameters.AddWithValue("@seeker_id", seeker_id);

                dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    lblSeekerName.Text = dr["full_name"].ToString();
                    lblSeekerProfileName.Text = dr["full_name"].ToString();
                    lblSeekerIntroduction.Text = dr["introduction"].ToString();
                    lblSeekerProfession.Text = dr["profession"].ToString();
                    lblSeekerProfileLocation.Text = dr["location"].ToString();
                    SeekerFBLink.NavigateUrl = dr["facebook_link"].ToString();
                    SeekerLinkedInLink.NavigateUrl = dr["linkedin_link"].ToString();
                    //imgRecruiterProfile.ImageUrl = dr["company_photo"].ToString();
                    lblSeekerEmail.Text = dr["contact_email"].ToString();
                    lblSeekerPhone.Text = dr["mobile_number"].ToString();
                    lblSeekerGender.Text = dr["gender"].ToString();
                    lblPreferredIndustry.Text = dr["prefer_industry"].ToString();
                    lblSeekerLocation.Text = dr["location"].ToString();
                    lblSeekerCountry.Text = dr["country"].ToString();
                    lblSeekerExperience.Text = dr["experience"].ToString();
                    lblSeekerSkills.Text = dr["skills"].ToString();
                }

                //Close connection
                con.Close();

                //Open Connection
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                string sql_jobStatus = "SELECT * FROM ApplicationStatus ASS, JobPost JP, Recruiter RC " +
                                        "WHERE ASS.seeker_id = @seeker_id AND " +
                                        "ASS.deleted_at IS NULL AND " +
                                        "ASS.post_id = JP.post_id AND " +
                                        "JP.recruiter_id = RC.recruiter_id";

                cmd = new SqlCommand(sql_jobStatus, con);

                //Insert parameter
                cmd.Parameters.AddWithValue("@seeker_id", seeker_id);

                dr = cmd.ExecuteReader();

                //Print out the application status
                while (dr.Read())
                {
                    lblJobStatus.Text = lblJobStatus.Text +
                    "<div class='application-bar row'>" +
                        "<div class='col-sm-3 mt-3'>" +
                            "<img src ='" + dr["company_photo"] + "' class='company-pic'/>" +
                        "</div>" +

                        "<div class='col-sm-3 mt-3'>" +
                            "<div class='company-name text-lightgreen'>" + dr["company_name"] + "</div>" +
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

                    if (dr["applied_status"].ToString() == "Pending")
                    {
                        lblJobStatus.Text = lblJobStatus.Text +
                            "<div class='col-sm-3 mt-3'>" +
                            "<div class='mt-2 text-danger' style='font-size:20px;'>" +
                                "Status: Pending" +
                            "</div>" +

                            "<div class='mt-2'>" +
                                "<button class='btn btn-danger' data-toggle='modal' data-target='#cancelApplicationModal' type='button' onclick='cancelApplication("+ dr["post_id"] + ")'>Cancel Application</button>" +
                            "</div>" +
                        "</div>" +
                    "</div>";

                    }
                    else
                    {
                        lblJobStatus.Text = lblJobStatus.Text +
                        "<div class='col-sm-3 mt-3'>" +
                            "<div class='mt-2'>" +
                                "<a href = 'chatbox.aspx?recruiter=" + dr["recruiter_id"].ToString() + "' class='btn btn-success'>Chat</a>" +
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


            }
            catch (Exception error)
            {
                Response.Write("<script>alert('" + error.Message + "');</script>");
            }
        }

        protected void btnCancelApplication_Click(object sender, EventArgs e)
        {
            try
            {

                var post_id = txtApplicationID.Text;

                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                //Read User profile Details
                string sql = "Update ApplicationStatus " +
                        "SET deleted_at = @deleted_at " +
                        "WHERE application_id = @post_id";

                SqlCommand cmd = new SqlCommand(sql, con);

                //Insert parameters
                cmd.Parameters.AddWithValue("@deleted_at", DateTime.Now);
                cmd.Parameters.AddWithValue("@post_id", post_id);

                //Execute the queries
                cmd.ExecuteNonQuery();
                con.Close();

                Response.Write("<script>alert('Application cancelled successful!');</script>");
                Response.Redirect("user-profile.aspx?cancelApplication");


            }
            catch (Exception error)
            {
                Response.Write("<script>alert('" + error.Message + "');</script>");
            }
        }
    }
}