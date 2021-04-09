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

                //Connection Open
                con.Open();

                //Query
                string sql = "SELECT COUNT(*) FROM Recruiter WHERE facebook_token = '" + fb_id + "'";

                //Connect to the database
                SqlCommand cmd = new SqlCommand(sql, con);

                string result = cmd.ExecuteScalar().ToString();

                if (result == "0")
                {
                    con = new SqlConnection(strcon);

                    sql = "INSERT INTO Recruiter (email, facebook_token, active, verified_at, created_at) VALUES (@email, @facebook_token, @active, GETDATE(), GETDATE())";

                    cmd = new SqlCommand(sql, con);

                    con.Open();

                    //Add Parameters
                    cmd.Parameters.AddWithValue("@email", fb_email);
                    cmd.Parameters.AddWithValue("@facebook_token", fb_id);
                    cmd.Parameters.AddWithValue("@active", "active");

                    //Execute Query
                    cmd.ExecuteNonQuery();

                    //Connection Close
                    con.Close();

                    //Redirect to the web page with login status
                    SqlConnection conn = new SqlConnection(strcon);

                    string query = "SELECT COUNT(*) FROM Recruiter where facebook_token = @facebook_token  AND verified_at IS NOT NULL AND active = @active";

                    SqlCommand cm = new SqlCommand(query, conn);

                    conn.Open();

                    cm.Parameters.AddWithValue("@facebook_token", fb_id);
                    cm.Parameters.AddWithValue("@active", "active");

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

                        //Response.Redirect("Home.aspx");
                    }
                    conn.Close();
                }
                else
                {
                    SqlConnection connect = new SqlConnection(strcon);

                    //Connection Open
                    connect.Open();

                    //Query
                    string sqlquery = "SELECT COUNT(*) FROM Recruiter where facebook_token = @facebook_token  AND verified_at IS NOT NULL AND active = @active";

                    //Connect to the database
                    SqlCommand command = new SqlCommand(sqlquery, connect);

                    //Add Parameters
                    command.Parameters.AddWithValue("@facebook_token", fb_id);
                    command.Parameters.AddWithValue("@active", "active");

                    int output = (int)command.ExecuteScalar();

                    //If the result found
                    if (output == 1)
                    {
                        Dictionary<string, string> RecruiterDetails = new Dictionary<string, string>();

                        connect = new SqlConnection(strcon);

                        sqlquery = "SELECT * FROM Recruiter WHERE facebook_token = @facebook_token";

                        command = new SqlCommand(sqlquery, connect);

                        connect.Open();

                        command.Parameters.AddWithValue("@facebook_token", fb_id);

                        //Read Data
                        SqlDataReader dread = command.ExecuteReader();

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

                        Session["Recruiter"] = RecruiterDetails;

                        connect.Close();

                        //Response.Redirect("Home.aspx");
                    }
                    connect.Close();

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
