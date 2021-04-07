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
    public partial class fb_login_post : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            //Read chat content from post submit
            var fb_name = Request.Form["fb_name"] ?? "NULL";
            var fb_id = Request.Form["fb_id"] ?? "NULL";
            var fb_email = Request.Form["fb_email"] ?? "NULL";

            try
            {
                SqlConnection conn = new SqlConnection(strcon);

                conn.Open();

                string qry = "select count(*) from Recruiter where facebook_token = @facebook_token AND verified_at IS NOT NULL AND active = @active";

                //Connect to the database
                SqlCommand cm = new SqlCommand(qry, conn);

                //Insert Parameters
                cm.Parameters.AddWithValue("@facebook_token", fb_id);
                cm.Parameters.AddWithValue("@active", "active");

                //Get Result
                int result = Convert.ToInt32(cm.ExecuteScalar().ToString());

                if (result > 0) // if the result found
                {
                    //Dictionary for storing data
                    Dictionary<string, string> RecruiterDetails = new Dictionary<string, string>();

                    SqlConnection con = new SqlConnection(strcon);

                    string sqlquery = "SELECT * FROM Recruiter WHERE facebook_token = @facebook_token";

                    con.Open();

                    //Connect to the databse
                    SqlCommand commands = new SqlCommand(sqlquery, con);

                    //Insert parameters
                    commands.Parameters.AddWithValue("@facebook_token", fb_id);

                    //Read Data
                    SqlDataReader dR = commands.ExecuteReader();

                    while (dR.Read())
                    {
                        //Insert Parameters into Dictionary
                        RecruiterDetails.Add("recruiter_email", dR["email"].ToString());
                        RecruiterDetails.Add("recruiter_mobile", dR["mobile_number"].ToString());
                        RecruiterDetails.Add("recruiter_companyphoto", dR["company_photo"].ToString());
                        RecruiterDetails.Add("recruiter_company", dR["company_name"].ToString());
                        RecruiterDetails.Add("recruiter_contactEmail", dR["contact_email"].ToString());
                        RecruiterDetails.Add("address_line1", dR["address_line1"].ToString());
                        RecruiterDetails.Add("address_line2", dR["address_line2"].ToString());
                        RecruiterDetails.Add("city", dR["city"].ToString());
                        RecruiterDetails.Add("state", dR["state"].ToString());
                        RecruiterDetails.Add("zip-code", dR["zip_code"].ToString());
                        RecruiterDetails.Add("recruiter_country", dR["country"].ToString());
                        RecruiterDetails.Add("recruiter_industry", dR["industry"].ToString());
                        RecruiterDetails.Add("recruiter_fbLink", dR["facebook_link"].ToString());
                        RecruiterDetails.Add("recruiter_linkedinLink", dR["linkedin_link"].ToString());
                        RecruiterDetails.Add("introduction", dR["introduction"].ToString());
                        RecruiterDetails.Add("rating", dR["rating"].ToString());
                    }
                    //Store Dictionary into Session
                    Session["Recruiter"] = RecruiterDetails;
                    Session.Timeout = 43200;

                    Response.Write("Login Successful");
                }
                else
                {
                    Response.Write(@"<script language='javascript'>alert('Your Facebook Account is not registered.'); window.location.href = 'home.aspx'; </script>");
                }

                conn.Close();
            }catch (Exception error)
            {
                Response.Write(error.Message);
            }
         }   
    }
}