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
    public partial class fb_signup_post_r : System.Web.UI.Page
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

                string sql = "SELECT COUNT(*) FROM Recruiter WHERE facebook_token = '" + fb_id + "'";

                SqlCommand cmd = new SqlCommand(sql, con);

                con.Open();

                string result = cmd.ExecuteScalar().ToString();

                if (result == "0")
                {
                    con = new SqlConnection(strcon);

                    sql = "INSERT INTO Recruiter (email, facebook_token, verified_at, created_at) VALUES (@email, @facebook_token, GETDATE(), GETDATE())";

                    cmd = new SqlCommand(sql, con);

                    con.Open();


                    cmd.Parameters.AddWithValue("@email", fb_email);
                    cmd.Parameters.AddWithValue("@facebook_token", fb_id);

                    cmd.ExecuteNonQuery();

                    con.Close();

                    SqlConnection conn = new SqlConnection(strcon);

                    string query = "SELECT COUNT(*) FROM Recruiter where facebook_token = @facebook_token  AND verified_at IS NOT NULL";

                    SqlCommand cm = new SqlCommand(query, conn);

                    conn.Open();

                    cm.Parameters.AddWithValue("@facebook_token", fb_id);

                    int output = (int)cm.ExecuteScalar();

                    if (output == 1)
                    {
                        Dictionary<string, string> RecruiterDetails = new Dictionary<string, string>();

                        conn = new SqlConnection(strcon);

                        query = "SELECT * FROM Recruiter WHERE facebook_token = @facebook_token";

                        cm = new SqlCommand(query, conn);

                        conn.Open();

                        cm.Parameters.AddWithValue("@facebook_token", fb_id);

                        SqlDataReader dr = cm.ExecuteReader();

                        while (dr.Read())
                        {
                            RecruiterDetails.Add("recruiter_email", dr["email"].ToString());
                            RecruiterDetails.Add("recruiter_mobile", dr["mobile_number"].ToString());
                            RecruiterDetails.Add("recruiter_companyphoto", dr["company_photo"].ToString());
                            RecruiterDetails.Add("recruiter_company", dr["company_name"].ToString());
                            RecruiterDetails.Add("recruiter_contactEmail", dr["contact_email"].ToString());
                            RecruiterDetails.Add("address_line1", dr["address_line1"].ToString());
                            RecruiterDetails.Add("address_line2", dr["address_line2"].ToString());
                            RecruiterDetails.Add("city", dr["city"].ToString());
                            RecruiterDetails.Add("state", dr["state"].ToString());
                            RecruiterDetails.Add("zip-code", dr["zip_code"].ToString());
                            RecruiterDetails.Add("recruiter_country", dr["country"].ToString());
                            RecruiterDetails.Add("recruiter_industry", dr["industry"].ToString());
                            RecruiterDetails.Add("recruiter_fbLink", dr["facebook_link"].ToString());
                            RecruiterDetails.Add("recruiter_linkedinLink", dr["linkedin_link"].ToString());
                            RecruiterDetails.Add("introduction", dr["introduction"].ToString());
                            RecruiterDetails.Add("rating", dr["rating"].ToString());
                        }

                        Session["Recruiter"] = RecruiterDetails;

                        conn.Close();

                        Response.Redirect("Home.aspx");
                    }
                    conn.Close();
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", " alert('Your Facebook Account Has Been Registered'); window.location.href = 'home.aspx';", true);
                }
                con.Close();
            }
            catch (Exception error)
            {
                Response.Write(error.Message);
            }
        }
    }
}
