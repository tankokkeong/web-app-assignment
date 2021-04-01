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
               
                ProfileLink.Visible = true;
                LoginLink.Visible = false;
                logoutLink.Visible = true;
            }

            if (Session["google_seeker"] != null)
            {

                ProfileLink.Visible = true;
                LoginLink.Visible = false;
                logoutLink.Visible = true;
            }


            if (Session["Recruiter"] != null)
            {
                jobList.Visible = false;
                candidatesList.Visible = true;
            }

            Dictionary<string, string> Languages = new Dictionary<string, string>();

            if (Session["Languages_CN"] != null)
            {
                Languages.Add("Home", "主页");
                Languages.Add("Jobs", "职位");
                Languages.Add("About Us", "关于我们");
                Languages.Add("Blog", "部落格");
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
                Languages.Add("Email:", "电子邮件:");
                Languages.Add("Call:", "联络:");
                Languages.Add("Job Seekers", "求职者");
                Languages.Add("Employers", "雇主");
                Languages.Add("Sign Out", "登出");
                Languages.Add("Recruiter", "招聘人员");
                Languages.Add("Full-Time Job Posted", "全职工作发布");
                Languages.Add("Part-Time Job Posted", "兼职工作发布");
                Languages.Add("Job Seeker", "求职者");
                Languages.Add("Languages", "语言"); 
                Languages.Add("@2020 Job Searching Designed By Kenny's Team. All Rights Reserved", "@2020求职由肯尼团队设计。版权所有");

                lblHome.Text = Languages["Home"];
                lblJobs.Text = Languages["Jobs"];
                lblAboutUs.Text = Languages["About Us"];
                lblAboutUs2.Text = Languages["About Us"];
                lblBlogs.Text = Languages["Blog"];
                //lblSignUp.Text = Languages["Sign Up"];
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
                lblEmail.Text = Languages["Email:"];
                lblCall.Text = Languages["Call:"];
                lblJobSeeker.Text = Languages["Job Seekers"];
                lblEmployers.Text = Languages["Employers"];
                lblSignOut.Text = Languages["Sign Out"];
                lblFullTimeJobPosted2.Text = Languages["Full-Time Job Posted"];
                lblPartTimeJobPosted2.Text = Languages["Part-Time Job Posted"];
                lblTotalJobSeeker2.Text = Languages["Job Seeker"];
                lblTotalRecruiter2.Text = Languages["Recruiter"];
                lblLanguages.Text = Languages["Languages"];
                lblKenny.Text = Languages["@2020 Job Searching Designed By Kenny's Team. All Rights Reserved"];
            }
            else if (Session["Languages_EN"] != null)
            {
                Languages.Add("Home", "Home");
                Languages.Add("Jobs", "Jobs");
                Languages.Add("About Us", "About Us");
                Languages.Add("Blog", "Blog");
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
                Languages.Add("Email:", "Email:");
                Languages.Add("Call:", "Call:");
                Languages.Add("Job Seekers", "Job Seekers");
                Languages.Add("Employers", "Employers");
                Languages.Add("Sign Out", "Sign Out");
                Languages.Add("Recruiter", "Recruiter");
                Languages.Add("Full-Time Job Posted", "Full-Time Job Posted");
                Languages.Add("Part-Time Job Posted", "Part-Time Job Posted");
                Languages.Add("Job Seeker", "Job Seeker");
                Languages.Add("Languages", "Languages");
                Languages.Add("@2020 Job Searching Designed By Kenny's Team. All Rights Reserved", "@2020 Job Searching Designed By Kenny's Team. All Rights Reserved");

                lblHome.Text = Languages["Home"];
                lblJobs.Text = Languages["Jobs"];
                lblAboutUs.Text = Languages["About Us"];
                lblAboutUs2.Text = Languages["About Us"];
                lblBlogs.Text = Languages["Blog"];
                //lblSignUp.Text = Languages["Sign Up"];
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
                lblEmail.Text = Languages["Email:"];
                lblCall.Text = Languages["Call:"];
                lblJobSeeker.Text = Languages["Job Seekers"];
                lblEmployers.Text = Languages["Employers"];
                lblSignOut.Text = Languages["Sign Out"];
                lblFullTimeJobPosted2.Text = Languages["Full-Time Job Posted"];
                lblPartTimeJobPosted2.Text = Languages["Part-Time Job Posted"];
                lblTotalJobSeeker2.Text = Languages["Job Seeker"];
                lblTotalRecruiter2.Text = Languages["Recruiter"];
                lblLanguages.Text = Languages["Languages"];
                lblKenny.Text = Languages["@2020 Job Searching Designed By Kenny's Team. All Rights Reserved"];
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

                //Display Current Site information
                getCurrentSiteJobDetails();

                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                //string searchAdmin = "SELECT admin_email FROM Admin WHERE deleted_at IS NULL";

                //SqlCommand command2 = new SqlCommand(searchAdmin, con);

                //SqlDataReader dr = command2.ExecuteReader();

                //while (dr.Read())
                //{
                //    txtAdmin.Text += dr["admin_email"].ToString() + " ";
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
        
        protected void getCurrentSiteJobDetails()
        {
            SqlConnection con = new SqlConnection(strcon);

            //Opem Connection
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }

            string sql = "SELECT (SELECT COUNT(*) FROM JobPost WHERE job_type = @job_type1) as full_time, " +
                         "(SELECT COUNT(*) FROM JobPost WHERE job_type = @job_type2) as part_time, " +
                         "(SELECT COUNT(*) FROM Recruiter) as recruiter_count, " +
                         "(SELECT COUNT(*) FROM JobSeeker) as seeker_count";

            SqlCommand command = new SqlCommand(sql, con);

            //Insert parameters
            command.Parameters.AddWithValue("@job_type1", "Full Time");
            command.Parameters.AddWithValue("@job_type2", "Part Time");

            SqlDataReader dread = command.ExecuteReader();

            while (dread.Read())
            {
                lblFullTimeJobPosted.Text = dread["full_time"].ToString();
                lblPartTimeJobPosted.Text = dread["part_time"].ToString();
                lblTotalRecruiter.Text = dread["recruiter_count"].ToString();
                lblTotalJobSeeker.Text = dread["seeker_count"].ToString();
            }

            //Close Connection
            con.Close();
        }
    }
}