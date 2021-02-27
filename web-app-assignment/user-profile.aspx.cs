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

                //Read User profile Details
                string sql = "SELECT * FROM JobSeeker WHERE seeker_id = 1";

                SqlCommand cmd = new SqlCommand(sql, con);

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
                }

                //Close connection
                con.Close();


            }
            catch (Exception error)
            {
                Response.Write("<script>alert('" + error.Message + "');</script>");
            }
        }
    }
}