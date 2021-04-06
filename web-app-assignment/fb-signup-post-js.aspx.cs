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
    public partial class fb_signup_post_js : System.Web.UI.Page
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

                string sql = "SELECT COUNT(*) FROM JobSeeker WHERE facebook_token = '" + fb_id + "'";

                SqlCommand cmd = new SqlCommand(sql, con);

                con.Open();

                string result = cmd.ExecuteScalar().ToString();

                if (result == "0")
                {
                    con = new SqlConnection(strcon);

                    sql = "INSERT INTO JobSeeker (full_name, email, facebook_token, verified_at, created_at) VALUES (@full_name, @email, @facebook_token, GETDATE(), GETDATE())";

                    cmd = new SqlCommand(sql, con);

                    con.Open();

                    cmd.Parameters.AddWithValue("@full_name", fb_name);
                    cmd.Parameters.AddWithValue("@email", fb_email);
                    cmd.Parameters.AddWithValue("@facebook_token", fb_id);

                    cmd.ExecuteNonQuery();

                    con.Close();

                    SqlConnection conn = new SqlConnection(strcon);

                    string query = "SELECT COUNT(*) FROM JobSeeker where facebook_token = @facebook_token  AND verified_at IS NOT NULL";

                    SqlCommand cm = new SqlCommand(query, conn);

                    conn.Open();

                    cm.Parameters.AddWithValue("@facebook_token", fb_id);

                    int output = (int)cm.ExecuteScalar();

                    if (output == 1)
                    {
                        Dictionary<string, string> UserDetail = new Dictionary<string, string>();

                        conn = new SqlConnection(strcon);

                        query = "SELECT * FROM JobSeeker WHERE facebook_token = @facebook_token";

                        cm = new SqlCommand(query, conn);

                        conn.Open();

                        cm.Parameters.AddWithValue("@facebook_token", fb_id);
                        //Read Data from Database
                        SqlDataReader dread = cm.ExecuteReader();

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

                        Session["User"] = UserDetail;

                        conn.Close();

                        Response.Redirect("home.aspx");
                    }
                    conn.Close();
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", " alert('Your Facebook Account Has Been Registered'); window.location.href='home.aspx';", true);
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