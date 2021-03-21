using System;
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
    public partial class google_login_post : System.Web.UI.Page
    {
        //your client id  
        string clientid = "804776769506-k0ibg0dnd1vmigibsmjt4p8gekqp4unn.apps.googleusercontent.com";
        //your client secret  
        string clientsecret = "SsB5Pq6GdQIk0j7J9stZdY2D";
        //your redirection url  
        string redirection_url = "https://localhost:44329/google_login_post.aspx";
        string url = "https://accounts.google.com/o/oauth2/token";

        string strcon = ConfigurationManager.ConnectionStrings["con"].ToString();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["code"] != null)
                {
                    GetToken(Request.QueryString["code"].ToString());
                }
            }
        }

        public void GetToken(string code)
        {
            string poststring = "grant_type=authorization_code&code=" + code + "&client_id=" + clientid + "&client_secret=" + clientsecret + "&redirect_uri=" + redirection_url + "";
            var request = (HttpWebRequest)WebRequest.Create(url);
            request.ContentType = "application/x-www-form-urlencoded";
            request.Method = "POST";
            UTF8Encoding utfenc = new UTF8Encoding();
            byte[] bytes = utfenc.GetBytes(poststring);
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

                string sql = "SELECT COUNT(*) FROM JobSeeker where gmail_token = @gmail_token  AND verified_at IS NOT NULL";

                SqlCommand cmd = new SqlCommand(sql, con);

                con.Open();

                cmd.Parameters.AddWithValue("gmail_token", id);

                string output = cmd.ExecuteScalar().ToString();

                if (output == "1")
                {
                    Dictionary<string, string> UserDetail = new Dictionary<string, string>();

                    SqlConnection conn = new SqlConnection(strcon);

                    sql = "SELECT * FROM JobSeeker WHERE gmail_token = @gmail_token";

                    cmd = new SqlCommand(sql, conn);

                    conn.Open();

                    cmd.Parameters.AddWithValue("gmail_token", id);

                    SqlDataReader dread = cmd.ExecuteReader();

                    while (dread.Read())
                    {
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

                    Response.Redirect("home.aspx");

                    conn.Close();

                }
                else if (output == "0")
                {


                    sql = "SELECT COUNT(*) FROM JobSeeker where gmail_token = @gmail_token  AND verified_at IS NOT NULL";

                    cmd = new SqlCommand(sql, con);

                    con.Open();

                    cmd.Parameters.AddWithValue("gmail_token", id);

                    int result = (int) cmd.ExecuteScalar();

                    if (result == 1)
                    {
                        Dictionary<string, string> RecruiterDetails = new Dictionary<string, string>();

                        SqlConnection connection = new SqlConnection(strcon);

                        string query = "SELECT * FROM Recruiter WHERE gmail_token = @gmail_token";

                        cmd = new SqlCommand(query, connection);

                        connection.Open();

                        cmd.Parameters.AddWithValue("gmail_token", id);

                        SqlDataReader dR = cmd.ExecuteReader();

                        while (dR.Read())
                        {
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

                        Session["Recruiter"] = RecruiterDetails;

                        Response.Redirect("home.aspx");

                        connection.Close();

                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", " alert('Your Google Account Has Not Register'); window.open('login_signup.aspx');", true);
                    }
                    con.Close();
                }
            }
            catch (Exception e)
            {
                Response.Write(e.Message);
            }

        }

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
    }
}