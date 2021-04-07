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
    public partial class fb_login_post_js : System.Web.UI.Page
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

                String qry = "select count(*) from JobSeeker where facebook_token = @facebook_token AND verified_at IS NOT NULL AND active = @active";

                //Connect to the database
                SqlCommand cm = new SqlCommand(qry, conn);

                //Insert Parameters
                cm.Parameters.AddWithValue("@facebook_token", fb_id);
                cm.Parameters.AddWithValue("@active", "active");

                //Get Result
                String result = cm.ExecuteScalar().ToString();

                if (result == "1") // if the result found
                {
                    //Dictionary for storing data
                    Dictionary<string, string> UserDetail = new Dictionary<string, string>();

                    string sqlquery = "SELECT * FROM JobSeeker WHERE facebook_token = @facebook_token";

                    //Connect to the databse
                    SqlCommand commands = new SqlCommand(sqlquery, conn);

                    //Insert parameters
                    commands.Parameters.AddWithValue("@facebook_token", fb_id);

                    //Read Data from Database
                    SqlDataReader dread = commands.ExecuteReader();

                    while (dread.Read())
                    {
                        //Add Parameter into Dictionary
                        UserDetail.Add("user_name", dread["full_name"].ToString());
                        UserDetail.Add("user_email", dread["email"].ToString());
                        UserDetail.Add("user_skills", dread["skills"].ToString());
                        UserDetail.Add("user_gender", dread["gender"].ToString());
                        UserDetail.Add("user_mobile", dread["mobile_number"].ToString());
                        UserDetail.Add("user_location", dread["location"].ToString());
                        UserDetail.Add("user_profession", dread["profession"].ToString());
                        UserDetail.Add("user_preferIndustry", dread["prefer_industry"].ToString());
                        UserDetail.Add("user_country", dread["country"].ToString());
                        UserDetail.Add("user_experience", dread["experience"].ToString());
                        UserDetail.Add("user_fbLink", dread["facebook_link"].ToString());
                    }

                    //Store Dictionary into Session
                    Session["User"] = UserDetail;
                    Session.Timeout = 43200;

                    Response.Write(@"<script language='javascript'>alert('Hi" + fb_name +  ".'); window.location.href = 'home.aspx'; </script>");
                }
                else if (result == "0") // if user's account is not verified or no longer inactive
                {
                    Response.Write(@"<script language='javascript'>alert('Your Facebook Account is not registered.'); window.location.href = 'home.aspx'; </script>");
                }
            }
            catch (Exception error)
            {
                Response.Write(error.Message);
            }
        }
    }
}