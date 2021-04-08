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

                string sql = "SELECT COUNT(*) FROM JobSeeker where gmail_token = @gmail_token  AND verified_at IS NOT NULL AND active = @active";

                SqlCommand cmd = new SqlCommand(sql, con);

                con.Open();

                cmd.Parameters.AddWithValue("@gmail_token", id);
                cmd.Parameters.AddWithValue("@active", "active");

                int output = (int) cmd.ExecuteScalar();

                if(output == 1)
                {
                    Dictionary<string, string> UserDetail = new Dictionary<string, string>();

                    SqlConnection conn = new SqlConnection(strcon);

                    string query = "SELECT * FROM JobSeeker WHERE gmail_token = @gmail_token";

                    SqlCommand cm = new SqlCommand(query, conn);

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
                else if(output == 0)
                {
                    Dictionary<string, string> RecruiterDetails = new Dictionary<string, string>();

                    SqlConnection connection = new SqlConnection(strcon);

                    string qry = "SELECT COUNT(*) FROM Recruiter where gmail_token = @gmail_token  AND verified_at IS NOT NULL AND active = @active";

                    SqlCommand comm = new SqlCommand(qry, connection);

                    connection.Open();

                    comm.Parameters.AddWithValue("@gmail_token",id);
                    comm.Parameters.AddWithValue("@active", "active");

                    string result = comm.ExecuteScalar().ToString();

                    if (result == "1")
                    {
                        qry = "SELECT * FROM Recruiter WHERE gmail_token = @gmail_token";

                        SqlConnection connect = new SqlConnection(strcon);

                        comm = new SqlCommand(qry, connect);

                        connect.Open();

                        comm.Parameters.AddWithValue("@gmail_token", id);

                        SqlDataReader dread = comm.ExecuteReader();

                        while (dread.Read())
                        {
                            RecruiterDetails.Add("recruiter_email", dread["email"].ToString());
                            RecruiterDetails.Add("recruiter_mobile", dread["mobile_number"].ToString());
                            RecruiterDetails.Add("recruiter_companyphoto", dread["company_photo"].ToString());
                            RecruiterDetails.Add("recruiter_company", dread["company_name"].ToString());
                            RecruiterDetails.Add("recruiter_contactEmail", dread["contact_email"].ToString());
                            RecruiterDetails.Add("address_line1", dread["address_line1"].ToString());
                            RecruiterDetails.Add("address_line2", dread["address_line2"].ToString());
                            RecruiterDetails.Add("city", dread["city"].ToString());
                            RecruiterDetails.Add("state", dread["state"].ToString());
                            RecruiterDetails.Add("zip-code", dread["zip_code"].ToString());
                            RecruiterDetails.Add("recruiter_country", dread["country"].ToString());
                            RecruiterDetails.Add("recruiter_industry", dread["industry"].ToString());
                            RecruiterDetails.Add("recruiter_fbLink", dread["facebook_link"].ToString());
                            RecruiterDetails.Add("recruiter_linkedinLink", dread["linkedin_link"].ToString());
                            RecruiterDetails.Add("introduction", dread["introduction"].ToString());
                            RecruiterDetails.Add("rating", dread["rating"].ToString());
                        }
                        Session["Recruiter"] = RecruiterDetails;

                        connect.Close();

                        Response.Redirect("home.aspx");
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", " alert('Your Google Account has not register or no longer active. If it is not active, kindly contact customer services for account activation.'); window.location.href = 'login_signup.aspx';", true);
                    }
                    connection.Close();
                }

                con.Close();
            }
            catch (Exception error)
            {
                Response.Write(error.Message);
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