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
    public partial class google_signup_post_r : System.Web.UI.Page
    {
        //your client id  
        string clientid = "804776769506-k0ibg0dnd1vmigibsmjt4p8gekqp4unn.apps.googleusercontent.com";
        //your client secret  
        string clientsecret = "SsB5Pq6GdQIk0j7J9stZdY2D";
        //your redirection url  
        string redirection_url = "https://localhost:44329/google-signup-post-r.aspx";
        string url = "https://accounts.google.com/o/oauth2/token";

        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
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


            register_recruiterInfo(id, email, name);
        }

        public void register_recruiterInfo(string id, string email, string name)
        {
            SqlConnection con = new SqlConnection(strcon);

            string sql = "SELECT COUNT(*) FROM Recruiter WHERE gmail_token = '" + id + "'";

            SqlCommand cmd = new SqlCommand(sql, con);

            con.Open();

            string result = cmd.ExecuteScalar().ToString();

            if (result == "0")
            {
                con = new SqlConnection(strcon);

                sql = "INSERT INTO Recruiter (email, gmail_token, verified_at, created_at) VALUES (@email, @gmail_token, GETDATE(), GETDATE())";

                cmd = new SqlCommand(sql, con);

                con.Open();



                //cmd.Parameters.AddWithValue("@email", email);
                //cmd.Parameters.AddWithValue("@gmail_token", id);

                if (String.IsNullOrEmpty(email))
                {
                    cmd.Parameters.AddWithValue("@email", DBNull.Value);
                }
                else
                    cmd.Parameters.AddWithValue("@email", email);
                if (String.IsNullOrEmpty(id))
                {
                    cmd.Parameters.AddWithValue("@gmail_token", DBNull.Value);
                }
                else
                    cmd.Parameters.AddWithValue("@gmail_token", id);

                cmd.ExecuteNonQuery();

                con.Close();

                SqlConnection conn = new SqlConnection(strcon);

                string query = "SELECT COUNT(*) FROM Recruiter where gmail_token = @gmail_token  AND verified_at IS NOT NULL";

                SqlCommand cm = new SqlCommand(query, conn);

                conn.Open();

                cm.Parameters.AddWithValue("@gmail_token", id);

                int output = (int)cm.ExecuteScalar();

                if (output == 1)
                {
                    Dictionary<string, string> RecruiterDetails = new Dictionary<string, string>();

                    conn = new SqlConnection(strcon);

                    query = "SELECT * FROM Recruiter WHERE gmail_token = @gmail_token";

                    cm = new SqlCommand(query, conn);

                    conn.Open();

                    cm.Parameters.AddWithValue("@gmail_token", id);

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

                    Response.Redirect("Home.aspx");
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", " alert('Your Google Account Has Been Registered'); window.open('login_signup.aspx');", true);
            }
            con.Close();
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
            public string link
            {
                get;
                set;
            }
            public string picture
            {
                get;
                set;
            }
            public string gender
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