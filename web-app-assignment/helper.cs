﻿using System;
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
    }
}