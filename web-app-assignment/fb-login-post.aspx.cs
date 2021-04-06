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
                SqlConnection con = new SqlConnection(strcon);

                //Connection Open
                con.Open();

                //Query
                string sql = "SELECT COUNT(*) FROM JobSeeker where facebook_token = @facebook_token  AND verified_at IS NOT NULL AND active = @active";

                //Connect to the database
                SqlCommand cmd = new SqlCommand(sql, con);

                //Insert Parameters
                cmd.Parameters.AddWithValue("@facebook_token", fb_id);
                cmd.Parameters.AddWithValue("@active", "active");

                int output = (int)cmd.ExecuteScalar();

                if(output == 1)
                {
                    //Dictionary
                    Dictionary<string, string> UserDetail = new Dictionary<string, string>();

                    SqlConnection conn = new SqlConnection(strcon);

                    //Connection Open
                    conn.Open();

                    //Query
                    string query = "SELECT * FROM JobSeeker WHERE facebook_token = @facebook_token";

                    //Connect to the database
                    SqlCommand cm = new SqlCommand(query, conn);

                    //Insert Parameters
                    cm.Parameters.AddWithValue("@facebook_token", fb_id);

                    //Read Data
                    SqlDataReader dr = cm.ExecuteReader();

                    while (dr.Read())
                    {
                        UserDetail.Add("user_name", dr["full_name"].ToString());
                        UserDetail.Add("user_email", dr["email"].ToString());
                        UserDetail.Add("user_skills", dr["skills"].ToString());
                        UserDetail.Add("user_gender", dr["gender"].ToString());
                        UserDetail.Add("user_mobile", dr["mobile_number"].ToString());
                        UserDetail.Add("user_location", dr["location"].ToString());
                        UserDetail.Add("user_profession", dr["profession"].ToString());
                        UserDetail.Add("user_preferIndustry", dr["prefer_industry"].ToString());
                        UserDetail.Add("user_country", dr["country"].ToString());
                        UserDetail.Add("user_experience", dr["experience"].ToString());
                        UserDetail.Add("user_fbLink", dr["facebook_link"].ToString());
                    }

                    //Store Dictionary into Session
                    Session["User"] = UserDetail;

                    //Connection Close
                    conn.Close();

                    Response.Redirect("home.aspx");
                }else
                {
                    getRecruiterLogin();
                }
                con.Close();
            }
            catch(Exception error)
            {
                Response.Write(error.Message);
            }
        }

        protected void getRecruiterLogin()
        {
            //Read chat content from post submit
            var fb_name = Request.Form["fb_name"] ?? "NULL";
            var fb_id = Request.Form["fb_id"] ?? "NULL";
            var fb_email = Request.Form["fb_email"] ?? "NULL";

            try
            {
                //Dictionary
                Dictionary<string, string> RecruiterDetails = new Dictionary<string, string>();

                SqlConnection connection = new SqlConnection(strcon);

                //Query
                string qry = "SELECT COUNT(*) FROM Recruiter where facebook_token = @facebook_token  AND verified_at IS NOT NULL AND active = @active";

                //Connect to the database
                SqlCommand comm = new SqlCommand(qry, connection);

                //Connection Open
                connection.Open();

                //Insert Parameters
                comm.Parameters.AddWithValue("@facebook_token", fb_id);
                comm.Parameters.AddWithValue("@active", "active");

                int result = (int)comm.ExecuteScalar();

                if (result == 1)
                {
                    qry = "SELECT * FROM Recruiter WHERE facebook_token = @facebook_token";

                    SqlConnection connect = new SqlConnection(strcon);

                    comm = new SqlCommand(qry, connect);

                    connect.Open();

                    comm.Parameters.AddWithValue("@facebook_token", fb_id);

                    //Read Data
                    SqlDataReader dread = comm.ExecuteReader();

                    while (dread.Read())
                    {
                        RecruiterDetails.Add("recruiter_email", dread["email"].ToString());
                        RecruiterDetails.Add("recruiter_mobile", dread["mobile_number"].ToString());
                        RecruiterDetails.Add("recruiter_companyphoto", dread["company_photo"].ToString());
                        RecruiterDetails.Add("recruiter_company", dread["company_name"].ToString());
                        RecruiterDetails.Add("recruiter_contactEmail", dread["contact_email"].ToString());
                        RecruiterDetails.Add("address_line1", dread["address_line1"].ToString());
                        RecruiterDetails.Add("address_line2", dread["address_line2"].ToString());
                        RecruiterDetails.Add("city", dread["city"].ToString());
                        RecruiterDetails.Add("state", dread["state"].ToString());
                        RecruiterDetails.Add("zip-code", dread["zip_code"].ToString());
                        RecruiterDetails.Add("recruiter_country", dread["country"].ToString());
                        RecruiterDetails.Add("recruiter_industry", dread["industry"].ToString());
                        RecruiterDetails.Add("recruiter_fbLink", dread["facebook_link"].ToString());
                        RecruiterDetails.Add("recruiter_linkedinLink", dread["linkedin_link"].ToString());
                        RecruiterDetails.Add("introduction", dread["introduction"].ToString());
                        RecruiterDetails.Add("rating", dread["rating"].ToString());
                    }

                    //Store Dictionary Data into Session
                    Session["Recruiter"] = RecruiterDetails;

                    //Connection Close
                    connect.Close();

                    Response.Redirect("home.aspx");
                }

                connection.Close();
            }
            catch (Exception error)
            {
                Response.Write(error.Message);
            }

        }
    }
}