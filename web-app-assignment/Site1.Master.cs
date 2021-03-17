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
    public partial class Site1 : System.Web.UI.MasterPage
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            var languages_selected = Request.QueryString["language"];

            if (languages_selected == "EN")
            {
                Session["Languages_EN"] = true;
                Session.Remove("Languages_CN");
            }
            else if (languages_selected == "CN")
            {
                Session["Languages_CN"] = true;
                Session.Remove("Languages_EN");
            }

            if (Session["User"] != null || Session["Recruiter"]!= null)
            {
                SignUpLink.Visible = false;
                ProfileLink.Visible = true;
                LoginLink.Visible = false;
                logoutLink.Visible = true;
            }

            Dictionary<string, string> Languages = new Dictionary<string, string>();

            if (Session["Languages_CN"] != null)
            {
                Languages.Add("Home", "主页");
                Languages.Add("Jobs", "职位");
                Languages.Add("About Us", "关于我们");
                Languages.Add("Sign Up", "登记");
                Languages.Add("Sign In", "登入");
                Languages.Add("Privacy Policy", "隐私政策");
                Languages.Add("Career Center", "诚聘英才");
                Languages.Add("Contact Us", "联系我们");
                Languages.Add("Help", "使用与帮助");
                Languages.Add("Terms & Conditions", "条款及细则");
                Languages.Add("Company Profile", "公司资料");
                Languages.Add("Candidate List", "候选人名单");
                Languages.Add("User Profile", "用户资料");
                Languages.Add("Search Jobs", "职位搜索");
                Languages.Add("Resume", "简历");
                Languages.Add("Email", "电子邮件");
                Languages.Add("Call", "联络");
                Languages.Add("Job Seekers", "求职者");
                Languages.Add("Employers", "雇主");
                Languages.Add("Sign Out", "登出");
                Languages.Add("Recruiter", "招聘人员");
                Languages.Add("Full-Time Job Posted", "全职工作发布");
                Languages.Add("Languages", "语言");

                lblHome.Text = Languages["Home"];
                lblJobs.Text = Languages["Jobs"];
                lblAboutUs.Text = Languages["About Us"];
                lblAboutUs2.Text = Languages["About Us"];
                lblSignUp.Text = Languages["Sign Up"];
                lblSignIn.Text = Languages["Sign In"];
                lblPrivacyPolicy.Text = Languages["Privacy Policy"];
                lblCareerCenter.Text = Languages["Career Center"];
                lblContactUs.Text = Languages["Contact Us"];
                lblHelp.Text = Languages["Help"];
                lblTerms.Text = Languages["Terms & Conditions"];
                lblCompanyProfile.Text = Languages["Company Profile"];
                lblCandidateList.Text = Languages["Candidate List"];
                lblUserProfile.Text = Languages["User Profile"];
                lblSearchJobs.Text = Languages["Search Jobs"];
                lblResume.Text = Languages["Resume"];
                lblEmail.Text = Languages["Email"];
                lblCall.Text = Languages["Call"];
                lblJobSeeker.Text = Languages["Job Seekers"];
                lblEmployers.Text = Languages["Employers"];
                lblSignOut.Text = Languages["Sign Out"];
                //lblJobPosted.Text = Languages["Full-Time Job Posted"]; 
                //lblJobPosted2.Text = Languages["Full-Time Job Posted"];
                //lblJobPosted3.Text = Languages["Full-Time Job Posted"];
                //lblJobPosted4.Text = Languages["Full-Time Job Posted"];
                lblLanguages.Text = Languages["Languages"];
            }
            else if (Session["Languages_EN"] != null)
            {
                Languages.Add("Home", "Home");
                Languages.Add("Jobs", "Jobs");
                Languages.Add("About Us", "About Us");
                Languages.Add("Sign Up", "Sign Up");
                Languages.Add("Sign In", "Sign In");
                Languages.Add("Privacy Policy", "Privacy Policy");
                Languages.Add("Career Center", "Career Center");
                Languages.Add("Contact Us", "Contact Us");
                Languages.Add("Help", "Help");
                Languages.Add("Terms & Conditions", "Terms & Conditions");
                Languages.Add("Company Profile", "Company Profile");
                Languages.Add("Candidate List", "Candidate List");
                Languages.Add("User Profile", "User Profile");
                Languages.Add("Search Jobs", "Search Jobs");
                Languages.Add("Resume", "Resume");
                Languages.Add("Email", "Email");
                Languages.Add("Call", "Call");
                Languages.Add("Job Seekers", "Job Seekers");
                Languages.Add("Employers", "Employers");
                Languages.Add("Sign Out", "Sign Out");
                Languages.Add("Recruiter", "Recruiter");
                Languages.Add("Full-Time Job Posted", "Full-Time Job Posted");
                Languages.Add("Languages", "Languages");

                lblHome.Text = Languages["Home"];
                lblJobs.Text = Languages["Jobs"];
                lblAboutUs.Text = Languages["About Us"];
                lblAboutUs2.Text = Languages["About Us"];
                lblSignUp.Text = Languages["Sign Up"];
                lblSignIn.Text = Languages["Sign In"];
                lblPrivacyPolicy.Text = Languages["Privacy Policy"];
                lblCareerCenter.Text = Languages["Career Center"];
                lblContactUs.Text = Languages["Contact Us"];
                lblHelp.Text = Languages["Help"];
                lblTerms.Text = Languages["Terms & Conditions"];
                lblCompanyProfile.Text = Languages["Company Profile"];
                lblCandidateList.Text = Languages["Candidate List"];
                lblUserProfile.Text = Languages["User Profile"];
                lblSearchJobs.Text = Languages["Search Jobs"];
                lblResume.Text = Languages["Resume"];
                lblEmail.Text = Languages["Email"];
                lblCall.Text = Languages["Call"];
                lblJobSeeker.Text = Languages["Job Seekers"];
                lblEmployers.Text = Languages["Employers"];
                lblSignOut.Text = Languages["Sign Out"];
                //lblJobPosted.Text = Languages["Full-Time Job Posted"];
                //lblJobPosted2.Text = Languages["Full-Time Job Posted"];
                //lblJobPosted3.Text = Languages["Full-Time Job Posted"];
                //lblJobPosted4.Text = Languages["Full-Time Job Posted"];
                lblLanguages.Text = Languages["Languages"];
            }

            try
            {
                SqlConnection con = new SqlConnection(strcon);

                Dictionary<string, string> UserDetail = (Dictionary<string, string>)Session["User"];

                Dictionary<string, string> RecruiterDetail = (Dictionary<string, string>)Session["Recruiter"];

                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                if (Session["User"] != null)
                {
                    if (UserDetail["user_email"] == "")
                    {
                        Response.Write("<script>alert('Empty Email');</script>");
                        Response.Redirect("login_signup.aspx");
                    }
                    else
                    {
                        string seeker_email = UserDetail["user_email"];

                        string sql = "SELECT * FROM JobSeeker WHERE email = @email";

                        SqlCommand command = new SqlCommand(sql, con);

                        command.Parameters.AddWithValue("@email", seeker_email);

                        SqlDataReader dread = command.ExecuteReader();

                        while (dread.Read())
                        {
                            txtUsername.Text = dread["email"].ToString();
                        }
                    }
                }
                else if (Session["Recruiter"] != null)
                {
                    if (RecruiterDetail["recruiter_email"] == "")
                    {
                        Response.Write("<script>alert('Empty Email');</script>");
                        Response.Redirect("login_signup.aspx");
                    }
                    else
                    {
                        string recruiter_email = RecruiterDetail["recruiter_email"];

                        string sql = "SELECT * FROM Recruiter WHERE email = @email";

                        SqlCommand command = new SqlCommand(sql, con);

                        command.Parameters.AddWithValue("@email", recruiter_email);

                        SqlDataReader dread = command.ExecuteReader();

                        while (dread.Read())
                        {
                            txtUsername.Text = dread["email"].ToString();
                        }
                    }
                }
                //else
                //{
                //    string sql = "INSERT INTO Visitors (date_of_visit, created_at) VALUES (CURDATE(), GETDATE());";

                //    SqlCommand command = new SqlCommand(sql, con);

                //    command.ExecuteNonQuery();

                //    con.Close();

                //    con.Open();

                //    string getVisitorID = "SELECT visitor_id FROM Visitors WHERE date_of_visit = CURDATE()";

                //    SqlCommand cmd = new SqlCommand(getVisitorID, con);

                //    SqlDataReader dr = cmd.ExecuteReader();

                //    while (dr.Read())
                //    {
                //        lblUsername.Text = dr["visitor_id"].ToString();
                //    }
                //}

                con.Close();
            }
            catch (Exception error)
            {
                Response.Write("<script>alert('" + error.Message + "');</script>");
            }
        }

        protected void logoutLink_Click(object sender, EventArgs e)
        {
            if (Session["User"] != null)
            {
                Session.Remove("User");
                Response.Redirect("home.aspx");
            }
            else if (Session["Recruiter"] != null)
            {
                Session.Remove("Recruiter");
                Response.Redirect("home.aspx");
            }

           
        }

        protected void ProfileLink_Click(object sender, EventArgs e)
        {
            
            try
            {

                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                if (Session["User"] != null)
                {
                    Response.Redirect("user-profile.aspx");
                }
                else if (Session["Recruiter"] != null)
                {

                    Response.Redirect("recruiter-profile.aspx");

                }
            }
            catch(Exception error)
            {
                Response.Write("<script>alert('" + error.Message + "');</script>"); 
            }

        }
        //protected void btnLanguages_Click(Object sender, EventArgs e)
        //{
        //    Dictionary<string, string> Languages = new Dictionary<string, string>();

            

        //}
    }
}