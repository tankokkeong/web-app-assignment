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

    public partial class google_signup_post : System.Web.UI.Page
    {

        //your client id  
        string clientid = "804776769506-k0ibg0dnd1vmigibsmjt4p8gekqp4unn.apps.googleusercontent.com";
        //your client secret  
        string clientsecret = "SsB5Pq6GdQIk0j7J9stZdY2D";
        //your redirection url  
        string redirection_url = "https://localhost:44329/google_signup-post.aspx";
        string url = "https://accounts.google.com/o/oauth2/token";

        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

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

        //Get User Token
        public void GetToken(string code)
        {
            //Perfome Web Request
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

        //Get User Profile
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

            //user infomation
            string id = userinfo.id;
            string email = userinfo.email;
            string name = userinfo.name;


            registerInfo(id, email, name);
            
        }

        public void registerInfo(string id, string email, string name)
        {

            SqlConnection con = new SqlConnection(strcon);

            //Connection Open
            con.Open();

            //Query
            string sql = "SELECT COUNT(*) FROM JobSeeker WHERE gmail_token = '" + id + "'";

            //Connect to the database
            SqlCommand cmd = new SqlCommand(sql, con);

            string result = cmd.ExecuteScalar().ToString();

            if (result == "0")
            {
                 con = new SqlConnection(strcon);

                 sql = "INSERT INTO JobSeeker (full_name, email, gmail_token, active, verified_at, created_at) VALUES (@full_name, @email, @gmail_token, @active, GETDATE(), GETDATE())";

                 cmd = new SqlCommand(sql, con);

                con.Open();

                //Insert Parameters
                cmd.Parameters.AddWithValue("@full_name", name);
                cmd.Parameters.AddWithValue("@email", email);
                cmd.Parameters.AddWithValue("@gmail_token", id);
                cmd.Parameters.AddWithValue("@active", "active");

                //Execute Query
                cmd.ExecuteNonQuery();

                //Connection Close
                con.Close();

                //Redirect to the home page with registered info

                SqlConnection conn = new SqlConnection(strcon);

                string query = "SELECT COUNT(*) FROM JobSeeker where gmail_token = @gmail_token  AND verified_at IS NOT NULL AND @active = active";

                SqlCommand cm = new SqlCommand(query, conn);

                conn.Open();

                cm.Parameters.AddWithValue("@gmail_token", id);
                cm.Parameters.AddWithValue("@active", "active");

                int output = (int)cm.ExecuteScalar();

                if (output == 1)
                {
                    Dictionary<string, string> UserDetail = new Dictionary<string, string>();

                    conn = new SqlConnection(strcon);

                    query = "SELECT * FROM JobSeeker WHERE gmail_token = @gmail_token";

                    cm = new SqlCommand(query, conn);

                    conn.Open();

                    cm.Parameters.AddWithValue("@gmail_token", id);

                    SqlDataReader dr = cm.ExecuteReader();

                    while (dr.Read())
                    {
                        UserDetail.Add("user_name", dr["full_name"].ToString());
                        UserDetail.Add("user_email", dr["email"].ToString());
                        UserDetail.Add("user_skills", dr["skills"].ToString());
                        UserDetail.Add("user_gender", dr["gender"].ToString());
                        UserDetail.Add("user_mobile", dr["mobile_number"].ToString());
                        UserDetail.Add("user_location", dr["location"].ToString());
                        UserDetail.Add("user_profession", dr["profession"].ToString());
                        UserDetail.Add("user_preferIndustry", dr["prefer_industry"].ToString());
                        UserDetail.Add("user_country", dr["country"].ToString());
                        UserDetail.Add("user_experience", dr["experience"].ToString());
                        UserDetail.Add("user_fbLink", dr["facebook_link"].ToString());
                    }

                    Session["User"] = UserDetail;

                    conn.Close();

                    Response.Redirect("Home.aspx");
                }


                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", " alert('Register Successfully'); window.open('login_signup.aspx');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", " alert('Your Google Account Has Been Registered'); window.location.href = 'home.aspx';", true);
            }
            con.Close();

            
        }
    }
}