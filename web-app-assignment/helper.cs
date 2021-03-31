using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace web_app_assignment
{
    public class Helper
    {
        //Database Connection
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        public string getRecruiterID()
        {

            SqlConnection con = new SqlConnection(strcon);

            //Open Connection Again
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }

            //Get Recruiter ID
            Dictionary<string, string> RecruiterDetails = (Dictionary<string, string>)HttpContext.Current.Session["Recruiter"];

            string recruiterID = "";

            //GET Recruiter ID from the seeker table
            string selectRecruiterID = "SELECT recruiter_id FROM Recruiter WHERE email = @email";

            SqlCommand cmd = new SqlCommand(selectRecruiterID, con);

            cmd.Parameters.AddWithValue("@email", RecruiterDetails["recruiter_email"].ToString());

            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                recruiterID = dr["recruiter_id"].ToString();
            }

            con.Close();

            return recruiterID;

        }

        public string getSeekerID()
        {

            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }

            //Get Seeker ID
            Dictionary<string, string> UserDetails = (Dictionary<string, string>)HttpContext.Current.Session["User"];

            string seeker_id = "";

            //GET Seeker ID from the seeker table
            string selectSeekerID = "SELECT seeker_id FROM JobSeeker WHERE email = @email";

            SqlCommand cmd = new SqlCommand(selectSeekerID, con);

            cmd.Parameters.AddWithValue("@email", UserDetails["user_email"].ToString());

            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                seeker_id = dr["seeker_id"].ToString();
            }

            con.Close();

            return seeker_id;

        }

        public string getAdminID()
        {

            SqlConnection con = new SqlConnection(strcon);

            //Open Connection Again
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }

            //Get Recruiter ID
            Dictionary<string, string> UserDetails = (Dictionary<string, string>)HttpContext.Current.Session["Admin"];

            string adminID = "";

            //GET Recruiter ID from the seeker table
            string selectAdminID = "SELECT admin_id FROM Admin WHERE admin_email = @email";

            SqlCommand cmd = new SqlCommand(selectAdminID, con);

            cmd.Parameters.AddWithValue("@email", UserDetails["Admin_Email"].ToString());

            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                adminID = dr["admin_id"].ToString();
            }

            con.Close();

            return adminID;

        }

        public void setCookies(string cookieName, string cookieValue, int cookieExpireDays)
        {
            HttpCookie set_cookie = new HttpCookie(cookieName, cookieValue);
            set_cookie.Expires = DateTime.Now.AddDays(cookieExpireDays);

            HttpContext.Current.Response.Cookies.Add(set_cookie);
        }

        public Dictionary<string, string> getRecruiterInfo(string recruiter_id)
        {
            Dictionary<string, string> Recruiter_Details = new Dictionary<string, string>();

            SqlConnection con = new SqlConnection(strcon);

            //Open Connection 
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }

            //Get Recruiter info
            string recruiter_sql = "SELECT * FROM Recruiter WHERE recruiter_id = @recruiter_id";

            SqlCommand cmd = new SqlCommand(recruiter_sql, con);

            cmd.Parameters.AddWithValue("@recruiter_id", recruiter_id);

            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                Recruiter_Details.Add("email", dr["email"].ToString());
                Recruiter_Details.Add("is_premium", dr["is_premium"].ToString());
                Recruiter_Details.Add("mobile_number", dr["mobile_number"].ToString());
                Recruiter_Details.Add("company_photo", dr["company_photo"].ToString());
                Recruiter_Details.Add("company_name", dr["company_name"].ToString());
                Recruiter_Details.Add("contact_email", dr["contact_email"].ToString());
                Recruiter_Details.Add("address_line1", dr["address_line1"].ToString());
                Recruiter_Details.Add("address_line2", dr["address_line2"].ToString());
                Recruiter_Details.Add("city", dr["city"].ToString());
                Recruiter_Details.Add("state", dr["state"].ToString());
                Recruiter_Details.Add("zip_code", dr["zip_code"].ToString());
                Recruiter_Details.Add("country", dr["country"].ToString());
                Recruiter_Details.Add("industry", dr["industry"].ToString());
                Recruiter_Details.Add("facebook_link", dr["facebook_link"].ToString());
                Recruiter_Details.Add("linkedin_link", dr["linkedin_link"].ToString());
                Recruiter_Details.Add("introduction", dr["introduction"].ToString());
                Recruiter_Details.Add("rating", dr["rating"].ToString());
                Recruiter_Details.Add("active", dr["active"].ToString());
            }

            con.Close();

            return Recruiter_Details;
        }

        public Dictionary<string, string> getSeekerInfo(string seeker_id)
        {
            Dictionary<string, string> Seeker_Details = new Dictionary<string, string>();

            SqlConnection con = new SqlConnection(strcon);

            //Open Connection 
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }

            //Get Recruiter info
            string recruiter_sql = "SELECT * FROM JobSeeker WHERE seeker_id = @seeker_id";

            SqlCommand cmd = new SqlCommand(recruiter_sql, con);

            cmd.Parameters.AddWithValue("@seeker_id", seeker_id);

            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                Seeker_Details.Add("full_name", dr["full_name"].ToString());
                Seeker_Details.Add("email", dr["email"].ToString());
                Seeker_Details.Add("is_premium", dr["is_premium"].ToString());
                Seeker_Details.Add("skills", dr["skills"].ToString());
                Seeker_Details.Add("gender", dr["gender"].ToString());
                Seeker_Details.Add("mobile_number", dr["mobile_number"].ToString());
                Seeker_Details.Add("user_photo", dr["user_photo"].ToString());
                Seeker_Details.Add("contact_email", dr["contact_email"].ToString());
                Seeker_Details.Add("location", dr["location"].ToString());
                Seeker_Details.Add("profession", dr["profession"].ToString());
                Seeker_Details.Add("prefer_industry", dr["prefer_industry"].ToString());
                Seeker_Details.Add("country", dr["country"].ToString());
                Seeker_Details.Add("experience", dr["experience"].ToString());
                Seeker_Details.Add("facebook_link", dr["facebook_link"].ToString());
                Seeker_Details.Add("linkedin_link", dr["linkedin_link"].ToString());
                Seeker_Details.Add("introduction", dr["introduction"].ToString());
                Seeker_Details.Add("active", dr["active"].ToString());
            }

            con.Close();

            return Seeker_Details;
        }
    }
}