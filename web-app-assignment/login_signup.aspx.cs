using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace web_app_assignment
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Cookies["email"] != null && Request.Cookies["password"] != null)
                {
                    sign_login_emailUser.Text = Request.Cookies["email"].Value;
                    sign_login_password.Attributes["value"] = Request.Cookies["password"].Value;
                }
            }
        }

        protected void inputsFormSign_LoginButton_Click(object sender, EventArgs e)
        {
            try
            {
                if(Role.SelectedItem.Value == "job_seeker")
                {
                    SqlConnection con = new SqlConnection(strcon);

                    con.Open();

                    String query = "select count(*) from JobSeeker where email= '" + sign_login_emailUser.Text + "' and password ='" + sign_login_password.Text + "'";

                    SqlCommand cmd = new SqlCommand(query, con);

                    String output = cmd.ExecuteScalar().ToString();

                    if (output == "1")
                    {
                        Dictionary<string, string> UserDetail = new Dictionary<string, string>();
                        string sql = "SELECT * FROM JobSeeker WHERE email = @email";

                        SqlCommand command = new SqlCommand(sql, con);

                        //Insert parameters
                        command.Parameters.AddWithValue("@email", sign_login_emailUser.Text);

                        SqlDataReader dread = command.ExecuteReader();

                        while (dread.Read())
                        {
                            //Add User Details
                            //UserDetails.Add("Admin_Email", "anson22267@gmail.com");
                            //UserDetails.Add("Admin_Name", "Anson");
                            //UserDetails.Add("Admin_Right", "Viewer");
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

                        if (checkRememberMe.Checked)
                        {
                            Response.Cookies["email"].Value = sign_login_emailUser.Text;
                            Response.Cookies["password"].Value = sign_login_password.Text;
                            Response.Cookies["email"].Expires = DateTime.Now.AddDays(30);
                            Response.Cookies["password"].Expires = DateTime.Now.AddDays(30);
                        }
                        else
                        {
                            Response.Cookies["email"].Expires = DateTime.Now.AddDays(-30);
                            Response.Cookies["password"].Expires = DateTime.Now.AddDays(-30);
                        }

                        Session["User"] = UserDetail;
                        Response.Redirect("home.aspx");

                    }
                    else
                    {
                        Response.Write(@"<script language='javascript'>alert('Invalid email or password')</script>");
                    }

                    con.Close();
                }
                else if (Role.SelectedItem.Value == "recruiter")
                {
                    SqlConnection conn = new SqlConnection(strcon);

                    conn.Open();

                    String qry = "select count(*) from Recruiter where email= '" + sign_login_emailUser.Text + "' and password ='" + sign_login_password.Text + "'";

                    SqlCommand cm = new SqlCommand(qry, conn);

                    String result = cm.ExecuteScalar().ToString();

                    if (result == "1")
                    {
                        Dictionary<string, string> RecruiterDetails = new Dictionary<string, string>();
                        string sqlquery = "SELECT * FROM Recruiter WHERE email = @email";

                        SqlCommand commands = new SqlCommand(sqlquery, conn);

                        //Insert parameters
                        commands.Parameters.AddWithValue("@email", sign_login_emailUser.Text);

                        SqlDataReader dR = commands.ExecuteReader();

                        while (dR.Read())
                        {
                            //Add User Details
                            //UserDetails.Add("Admin_Email", "anson22267@gmail.com");
                            //UserDetails.Add("Admin_Name", "Anson");
                            //UserDetails.Add("Admin_Right", "Viewer");
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

                        if (checkRememberMe.Checked)
                        {
                            Response.Cookies["email"].Value = sign_login_emailUser.Text;
                            Response.Cookies["password"].Value = sign_login_password.Text;
                            Response.Cookies["email"].Expires = DateTime.Now.AddDays(30);
                            Response.Cookies["password"].Expires = DateTime.Now.AddDays(30);
                        }
                        else
                        {
                            Response.Cookies["email"].Expires = DateTime.Now.AddDays(-30);
                            Response.Cookies["password"].Expires = DateTime.Now.AddDays(-30);
                        }

                        Session["Recruiter"] = RecruiterDetails;

                        Response.Redirect("home.aspx");
                    }
                    else
                    {
                        Response.Write(@"<script language='javascript'>alert('Invalid email or password')</script>");
                    }

                    conn.Close();
                }
                else
                {
                    Response.Write(@"<script language='javascript'>alert('Please choose your role.')</script>");
                }
            }
            catch(Exception error)
            {
                Response.Write(error.Message);
            }
        }
    }
}