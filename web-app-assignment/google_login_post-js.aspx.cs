﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace web_app_assignment
{
    public partial class google_login_post_js : System.Web.UI.Page
    {
        //your client id  
        string clientid = "804776769506-k0ibg0dnd1vmigibsmjt4p8gekqp4unn.apps.googleusercontent.com";
        //your client secret  
        string clientsecret = "SsB5Pq6GdQIk0j7J9stZdY2D";
        //your redirection url  
        string redirection_url = "https://localhost:44329/google_login_post-js.aspx";
        string url = "https://accounts.google.com/o/oauth2/token";

        string strcon = ConfigurationManager.ConnectionStrings["con"].ToString();

        //Getter and Setters
        public class Tokenclass
        {
            public string access_token
            {
                get;
                set;
            }
            public string token_type
            {
                get;
                set;
            }
            public int expires_in
            {
                get;
                set;
            }
            public string refresh_token
            {
                get;
                set;
            }
        }
        public class Userclass
        {
            public string id
            {
                get;
                set;
            }
            public string name
            {
                get;
                set;
            }
            public string given_name
            {
                get;
                set;
            }
            public string family_name
            {
                get;
                set;
            }

            public string email
            {
                get;
                set;
            }


        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //If query string is not empty
                if (Request.QueryString["code"] != null)
                {
                    GetToken(Request.QueryString["code"].ToString());
                }
            }
        }

        //Get User Token
        public void GetToken(string code)
        {
            //Perfome web Request
            string qstring = "grant_type=authorization_code&code=" + code + "&client_id=" + clientid + "&client_secret=" + clientsecret + "&redirect_uri=" + redirection_url + "";
            var request = (HttpWebRequest)WebRequest.Create(url);
            request.ContentType = "application/x-www-form-urlencoded";
            request.Method = "POST";

            UTF8Encoding utfencode = new UTF8Encoding();
            byte[] bytes = utfencode.GetBytes(qstring);
            Stream outputstream = null;
            try
            {
                request.ContentLength = bytes.Length;
                outputstream = request.GetRequestStream();
                outputstream.Write(bytes, 0, bytes.Length);
            }
            catch { }
            var response = (HttpWebResponse)request.GetResponse();
            var streamReader = new StreamReader(response.GetResponseStream());
            string responseFromServer = streamReader.ReadToEnd();
            JavaScriptSerializer js = new JavaScriptSerializer();
            Tokenclass obj = js.Deserialize<Tokenclass>(responseFromServer);
            GetuserProfile(obj.access_token);
        }

        //Get User info
        public void GetuserProfile(string accesstoken)
        {
            string url = "https://www.googleapis.com/oauth2/v1/userinfo?alt=json&access_token=" + accesstoken + "";
            WebRequest request = WebRequest.Create(url);
            request.Credentials = CredentialCache.DefaultCredentials;
            WebResponse response = request.GetResponse();
            Stream dataStream = response.GetResponseStream();
            StreamReader reader = new StreamReader(dataStream);
            string responseFromServer = reader.ReadToEnd();
            reader.Close();
            response.Close();
            JavaScriptSerializer js = new JavaScriptSerializer();
            Userclass userinfo = js.Deserialize<Userclass>(responseFromServer);

            //User info
            string id = userinfo.id;
            string email = userinfo.email;
            string name = userinfo.name;


            loginInfo(id, email, name);


        }

        public void loginInfo(string id, string email, string name)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);

                con.Open();

                //Query
                string sql = "SELECT COUNT(*) FROM JobSeeker where gmail_token = @gmail_token  AND verified_at IS NOT NULL AND active = @active";

                //Connect to the database
                SqlCommand cmd = new SqlCommand(sql, con);

                //Insert Parameters
                cmd.Parameters.AddWithValue("@gmail_token", id);
                cmd.Parameters.AddWithValue("@active", "active");

                int output = (int)cmd.ExecuteScalar();

                if (output == 1)
                {
                    //Dictionary
                    Dictionary<string, string> UserDetail = new Dictionary<string, string>();

                    SqlConnection conn = new SqlConnection(strcon);

                    sql = "SELECT * FROM JobSeeker WHERE gmail_token = @gmail_token";

                    cmd = new SqlCommand(sql, conn);

                    conn.Open();

                    cmd.Parameters.AddWithValue("@gmail_token", id);

                    //Read Data from Database
                    SqlDataReader dread = cmd.ExecuteReader();

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
                    Session.Timeout = 43200;

                    conn.Close();

                    Response.Redirect("home.aspx");

                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", " alert('Your Google Account has not register or no longer active. If it is not active, kindly contact customer services for account activation.'); window.location.href = 'login_signup.aspx';", true);
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