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
        Helper helper = new Helper();

        protected void Page_Load(object sender, EventArgs e)
        {
            //Check logout
            checkLogout();

            //Check visitor
            checkVisitor();

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
               
                if(Session["User"] != null)
                {
                    ProfileLink.HRef = "user-profile.aspx";
                }
                else if(Session["Recruiter"] != null)
                {
                    ProfileLink.HRef = "recruiter-profile.aspx";
                }
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
                language.SelectedIndex = 2;
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
                Languages.Add("My Profile", "我的户口");
                Languages.Add("Candidates List", "候选人名单");
                Languages.Add("User Profile", "用户资料");
                Languages.Add("Search Jobs", "职位搜索");
                Languages.Add("Career Tips", "职业建议");
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
                Languages.Add("@2020 Job Searching Designed By Kenny's Team. All Rights Reserved", "@2020求职由Kenny团队设计。版权所有");

                lblHome.Text = Languages["Home"];
                lblJobs.Text = Languages["Jobs"];
                lblAboutUs.Text = Languages["About Us"];
                lblBlogs.Text = Languages["Blog"];
                //lblSignUp.Text = Languages["Sign Up"];
                lblSignIn.Text = Languages["Sign In"];
                lblPrivacyPolicy.Text = Languages["Privacy Policy"];
                lblCareerCenter.Text = Languages["Career Center"];
                lblContactUs.Text = Languages["Contact Us"];
                lblContactUs2.Text = Languages["Contact Us"];
                lblHelp.Text = Languages["Help"];
                lblMyProfile.Text = Languages["My Profile"];
                lblTerms.Text = Languages["Terms & Conditions"];
                lblCompanyProfile.Text = Languages["Company Profile"];
                lblCandidatesList.Text = Languages["Candidates List"];
                lblCandidatesList2.Text = Languages["Candidates List"];
                lblUserProfile.Text = Languages["User Profile"];
                lblSearchJobs.Text = Languages["Search Jobs"];
                lblResume.Text = Languages["Career Tips"];
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
                language.SelectedIndex = 1;
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
                Languages.Add("Candidates List", "Candidates List");
                Languages.Add("My Profile", "My Profile");
                Languages.Add("User Profile", "User Profile");
                Languages.Add("Search Jobs", "Search Jobs");
                Languages.Add("Career Tips", "Career Tips");
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
                lblBlogs.Text = Languages["Blog"];
                lblMyProfile.Text = Languages["My Profile"];
                //lblSignUp.Text = Languages["Sign Up"];
                lblSignIn.Text = Languages["Sign In"];
                lblPrivacyPolicy.Text = Languages["Privacy Policy"];
                lblCareerCenter.Text = Languages["Career Center"];
                lblContactUs.Text = Languages["Contact Us"];
                lblContactUs2.Text = Languages["Contact Us"];
                lblHelp.Text = Languages["Help"];
                lblTerms.Text = Languages["Terms & Conditions"];
                lblCompanyProfile.Text = Languages["Company Profile"];
                lblCandidatesList.Text = Languages["Candidates List"];
                lblCandidatesList2.Text = Languages["Candidates List"];
                lblUserProfile.Text = Languages["User Profile"];
                lblSearchJobs.Text = Languages["Search Jobs"];
                lblResume.Text = Languages["Career Tips"];
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
                    string seeker_email = UserDetail["user_email"];

                    string sql = "SELECT * FROM JobSeeker WHERE email = @email";

                    SqlCommand command = new SqlCommand(sql, con);

                    command.Parameters.AddWithValue("@email", seeker_email);

                    SqlDataReader dread = command.ExecuteReader();

                    while (dread.Read())
                    {
                        txtUsername.Text = dread["email"].ToString();
                    }

                    txtSeeker.Text = helper.getSeekerID();
                }
                else if (Session["Recruiter"] != null)
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

                    txtRecruiter.Text = helper.getRecruiterID();
                }

                con.Close();

                //Display Current Site information
                getCurrentSiteJobDetails();

            }

            catch (Exception error)
            {
                Response.Write("<script>alert('" + error.Message + "');</script>");
            }

           
        }

        protected void checkLogout()
        {
            string logout = Request.QueryString["logout"] ?? "None";

            if(logout != "None")
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

        protected void checkVisitor()
        {
            if(Session["User"] == null && Session["Recruiter"] == null)
            {
                if(Request.Cookies["jobs4uVtr"] == null)
                {
                    //Set visitor Cookies
                    HttpCookie coo = new HttpCookie("jobs4uVtr");
                    coo.Value = Guid.NewGuid().ToString("N");
                    coo.Expires = DateTime.Now.AddDays(1);
                    Response.Cookies.Add(coo);

                    //Insert to database
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    string sql = "INSERT INTO Visitors(visitor_id, date_of_visit, created_at)" +
                                "VALUES(@visitor_id, @date_of_visit, @created_at)";

                    //Connect to the database
                    SqlCommand cmd = new SqlCommand(sql, con);


                    //Insert parameters
                    cmd.Parameters.AddWithValue("@visitor_id", coo.Value);
                    cmd.Parameters.AddWithValue("@date_of_visit", DateTime.Now);
                    cmd.Parameters.AddWithValue("@created_at", DateTime.Now);

                    //Execute the queries
                    cmd.ExecuteNonQuery();
                    con.Close();
                }              
            }
        }
    }
}