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
                if (Session["User"] == null)
                {
                    if (view_id == "")
                    {
                        Response.Redirect("home.aspx");
                    }
                }
                else
                {
                    //Get Seeker ID
                    string seeker_id = helper.getSeekerID();

                    //Reopen connection
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    //Read User profile Details
                    string sql = "SELECT * FROM JobSeeker WHERE seeker_id = @seeker_id";

                    SqlCommand cmd = new SqlCommand(sql, con);

                    //Insert parameter
                    cmd.Parameters.AddWithValue("@seeker_id", seeker_id);

                    SqlDataReader dr = cmd.ExecuteReader();

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
                        imgSeekerProfile.ImageUrl = dr["user_photo"].ToString();

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
                        }
                    }

                    //Close connection
                    con.Close();

                    //Check Application Received
                    if (getApplicationCount() == 0)
                    {
                        lblJobStatus.Text = "No application yet";
                    }

                }

                //View Profile
                if (Session["User"] == null && view_id != "")
                {
                    //Read User profile Details
                    string sql = "SELECT * FROM JobSeeker WHERE seeker_id = @seeker_id";

                    SqlCommand cmd = new SqlCommand(sql, con);

                    //Insert parameter
                    cmd.Parameters.AddWithValue("@seeker_id", view_id);

                    SqlDataReader dr = cmd.ExecuteReader();

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
                        imgSeekerProfile.ImageUrl = dr["user_photo"].ToString();
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

        protected void lvDataPager1_PreRender(object sender, EventArgs e)
        {
            //Check login
            if(Session["User"] != null)
            {
                SqlConnection con = new SqlConnection(strcon);

                //Get seeker id
                string seeker_id = helper.getSeekerID();

                //Open Connection
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                //Read Job Status
                string sql_jobStatusView = "SELECT * FROM ApplicationStatus ASS, JobPost JP, Recruiter RC " +
                                        "WHERE ASS.seeker_id = '" + seeker_id + "' AND " +
                                        "ASS.deleted_at IS NULL AND " +
                                        "ASS.post_id = JP.post_id AND " +
                                        "JP.recruiter_id = RC.recruiter_id";
                SqlDataAdapter cmd2 = new SqlDataAdapter(sql_jobStatusView, con);



                DataTable dtbl = new DataTable();
                cmd2.Fill(dtbl);
                lvJobStatus.DataSource = dtbl;
                lvJobStatus.DataBind();

                //Close Connection
                con.Close();
            }          

        }

        protected int getApplicationCount()
        {
            SqlConnection con = new SqlConnection(strcon);

            //Get seeker id
            string seeker_id = helper.getSeekerID();

            int application_count = 0;

            //Open Connection
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }

            //Read Job Status
            string sql_jobStatusView = "SELECT COUNT(*) FROM ApplicationStatus ASS, JobPost JP, Recruiter RC " +
                                    "WHERE ASS.seeker_id = '" + seeker_id + "' AND " +
                                    "ASS.deleted_at IS NULL AND " +
                                    "ASS.post_id = JP.post_id AND " +
                                    "JP.recruiter_id = RC.recruiter_id";

            SqlCommand cmd = new SqlCommand(sql_jobStatusView, con);

            application_count = Convert.ToInt32(cmd.ExecuteScalar().ToString());

            //Close Connection
            con.Close();

            return application_count;

        }
    }
}