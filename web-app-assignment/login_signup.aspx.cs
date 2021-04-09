using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Net.Mail;
using System.Text;
using System.IO;

namespace web_app_assignment
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            //Post Back to Home if there is no Session in the page
            if (!Page.IsPostBack)
            {
                if (Session["Email"] !=null && Session["Password"]!= null)
                {
                    sign_login_emailUser.Text = Session["Email"].ToString();
                    sign_login_password.Text  = Session["Password"].ToString();  

                    checkRememberMe.Checked = true;
                }
            }
        }

        protected void inputsFormSign_LoginButton_Click(object sender, EventArgs e)
        {
            //Search User Account
            try
            {
                if(Role.SelectedItem.Value == "job_seeker") //If user select job seeker
                {

                    SqlConnection con = new SqlConnection(strcon);
                    
                    con.Open();

                    String query = "select count(*) from JobSeeker where email= @email AND password = @password";
                    
                    //Connection to Database
                    SqlCommand cmd = new SqlCommand(query, con);

                    //Insert Parameters
                    cmd.Parameters.AddWithValue("@email", sign_login_emailUser.Text);
                    cmd.Parameters.AddWithValue("@password", pwHash.hashPassword(sign_login_password.Text));
                    
                    //Check Result
                    String output = cmd.ExecuteScalar().ToString();

                    if (output == "1") //if the result found
                    {
                        //Search Record
                        query = "select count(*) from JobSeeker where email= @email AND password = @password AND verified_at IS NOT NULL AND active = @active";

                        //Connect to the database
                        cmd = new SqlCommand(query, con);

                        //Declare variable for value
                        string active = "active";

                        //Insert Parameter
                        cmd.Parameters.AddWithValue("@email", sign_login_emailUser.Text);
                        cmd.Parameters.AddWithValue("@password", pwHash.hashPassword(sign_login_password.Text));
                        cmd.Parameters.AddWithValue("@active", active);

                        //Get Result
                        output = cmd.ExecuteScalar().ToString();

                        if (output == "1")
                        {
                            //Dictionary 
                            Dictionary<string, string> UserDetail = new Dictionary<string, string>();
                            string sql = "SELECT * FROM JobSeeker WHERE email = @email";

                            //Connect to the Database
                            SqlCommand command = new SqlCommand(sql, con);

                            //Insert parameters
                            command.Parameters.AddWithValue("@email", sign_login_emailUser.Text);

                            //Read Data from Database
                            SqlDataReader dread = command.ExecuteReader();

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

                            //Check Remember Me
                            if (checkRememberMe.Checked)
                            {
                                Session["Email"] = sign_login_emailUser.Text;
                                Session["Password"] = sign_login_password.Text;
                                Session.Timeout = 43200;
                            }

                            //Dictionary store in session
                            Session["User"] = UserDetail;
                            Response.Redirect("home.aspx");
                        }
                        else
                        {
                            Response.Write(@"<script language='javascript'>alert('Your account is not verify or no longer active')</script>");
                        }

                    }
                    else
                    {
                        Response.Write(@"<script language='javascript'>alert('Invalid email or password! Please try again.')</script>");
                    }

                    con.Close();
                }
                else if (Role.SelectedItem.Value == "recruiter") //if user select recruiter
                {
                    SqlConnection conn = new SqlConnection(strcon);

                    conn.Open();

                    String qry = "select count(*) from Recruiter where email= @email AND password = @password";

                    //Connect to the database
                    SqlCommand cm = new SqlCommand(qry, conn);

                    //Insert Parameters
                    cm.Parameters.AddWithValue("@email", sign_login_emailUser.Text);
                    cm.Parameters.AddWithValue("@password", pwHash.hashPassword(sign_login_password.Text));

                    //Get Result
                    String result = cm.ExecuteScalar().ToString();

                    if (result == "1") // if the result found
                    {
                        qry = "select count(*) from Recruiter where email= @email AND password = @password AND verified_at IS NOT NULL AND active = @active";

                        //Connect to the database
                        cm = new SqlCommand(qry, conn);

                        //Declare value into variable
                        string active = "active";

                        //Insert Parameters
                        cm.Parameters.AddWithValue("@email", sign_login_emailUser.Text);
                        cm.Parameters.AddWithValue("@password", pwHash.hashPassword(sign_login_password.Text));
                        cm.Parameters.AddWithValue("@active", active);

                        //Check Results
                        result = cm.ExecuteScalar().ToString();

                        //If the result found
                        if (result == "1")
                        {
                            //Dictionary for storing data
                            Dictionary<string, string> RecruiterDetails = new Dictionary<string, string>();
                            string sqlquery = "SELECT * FROM Recruiter WHERE email = @email";

                            //Connect to the databse
                            SqlCommand commands = new SqlCommand(sqlquery, conn);

                            //Insert parameters
                            commands.Parameters.AddWithValue("@email", sign_login_emailUser.Text);

                            //Read Data
                            SqlDataReader dR = commands.ExecuteReader();

                            while (dR.Read())
                            {
                                //Insert Parameters into Dictionary
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

                            //Check Remember Me
                            if (checkRememberMe.Checked)
                            {
                                Session["Email"] = sign_login_emailUser.Text;
                                Session["Password"] = sign_login_password.Text;
                                Session.Timeout = 43200;
                            }
                                //Store Dictionary into Session
                                Session["Recruiter"] = RecruiterDetails;

                            Response.Redirect("home.aspx");
                        }
                        else // if user's account is not verified or no longer inactive
                        {
                            Response.Write(@"<script language='javascript'>alert('Your account is not verify or no longer active')</script>");
                        }
                    }
                    else //if user enter invalid password or email
                    {
                        Response.Write(@"<script language='javascript'>alert('Invalid email or password! Please try again.')</script>");
                    }

                    conn.Close();
                }
                else //if user did not choose a role
                {
                    Response.Write(@"<script language='javascript'>alert('Please choose your role.')</script>");
                }
            }
            catch(Exception error)
            {
                Response.Write(error.Message);
            }
        }


        protected void Recruiter_SignUpButton_Click(object sender, EventArgs e)
        {

            try
            {
                SqlConnection strconnect = new SqlConnection(strcon);

                String checkcompany = "SELECT COUNT(*) FROM Recruiter WHERE company_name = '" + sign_recruiter_companyName.Text + "'";

                //Connect to the database
                SqlCommand commRecruiter = new SqlCommand(checkcompany, strconnect);

                strconnect.Open();

                //Check for result
                string companyExist =  commRecruiter.ExecuteScalar().ToString();

                if (companyExist == "0") //if the company does not exist
                {
                    if (string.Equals(sign_recruiter_password.Text, sign_recruiter_confirmPassword.Text))
                    {
                        //int hashcode = GetHashCode();
                        Random random = new Random();
                        int length = 16;
                        var vkey = "";
                        for (var i = 0; i < length; i++)
                        {
                            vkey += ((char)(random.Next(1, 26) + 64)).ToString().ToLower();
                        }

                        SqlConnection sqlcon = new SqlConnection(strcon);

                        sqlcon.Open();

                        //Insert data into database
                        String sqlquery = "INSERT INTO Recruiter (company_name, email, password, verify_key, active, created_at) VALUES (@company_name, @email, @password, @vkey, @active, GETDATE())";

                        //Connect to the database
                        SqlCommand sqlcmd = new SqlCommand(sqlquery, sqlcon);

                        //Add Parameters
                        sqlcmd.Parameters.AddWithValue("@company_name", sign_recruiter_companyName.Text);
                        sqlcmd.Parameters.AddWithValue("@email", sign_recruiter_companyEmail.Text);
                        sqlcmd.Parameters.AddWithValue("@password", pwHash.hashPassword(sign_recruiter_password.Text));

                        sqlcmd.Parameters.AddWithValue("@vkey", vkey);
                        sqlcmd.Parameters.AddWithValue("@active", "active");

                        //Execute the queries
                        sqlcmd.ExecuteNonQuery();

                        //close connection
                        sqlcon.Close();


                        string from = "webissue.emailus@gmail.com";

                        //Instantiate MailMessage
                        MailMessage message = new MailMessage(from, sign_recruiter_companyEmail.Text);

                        //Mail Body
                        string mailbody = "Dear "+ sign_recruiter_companyName.Text + " Company,<br/>" +
                                          "Your Email with Jobs4u requires you to validate your email address.<br/><br/>" +
                                          "Please Click on the button below to validate your email address.<br/><br/>" +
                                          "<span style='background-color:#008CBA; border:none; font-size:20px; cursor:pointer; text-align:center; padding: 14px 100px;'>" +
                                          "<a href='https://localhost:44329/verificationPost.aspx?vkRecruiter=" + vkey + "'"+ "style='color:white; text-decoration:none;'>Click Here To Verify Your Email Address</a></span><br/><br/>" +
                                          "<br/>(If the link does not work, copy the full address and paste it to your Internet browser)<br/></br>" +
                                          "Best Regards,<br/>" +
                                          "Festus, Your Personal Career Agent<br/>" +
                                          "<a href='https://localhost:44329/home.aspx'>Jobs4u.com</a>";

                        //Mail Subject
                        message.Subject = "Email Verification";
                        message.Body = mailbody;
                        message.BodyEncoding = Encoding.UTF8;
                        message.IsBodyHtml = true;

                        //SMTP Client port 587 for gmail
                        SmtpClient client = new SmtpClient("smtp.gmail.com", 587);

                        System.Net.NetworkCredential basicCredential1 = new System.Net.NetworkCredential("webissue.emailus@gmail.com", "webissue123");

                        client.EnableSsl = true;
                        client.UseDefaultCredentials = false;
                        client.Credentials = basicCredential1;

                        //send email
                        client.Send(message);
                        Response.Write("<script>alert('Register Successfully, Please Go and Verify Your email!');</script>");

            
                    }
                }
                else //if the company already exist in the record
                {
                    Response.Write("<script>alert('The company has been registered');</script>");
                }
                //connection close
                strconnect.Close();
            }
            catch (Exception error)
            {
                Response.Write(error.Message);
            }

        }

        protected void JobSeeker_SignUpButton_Click (object sender, EventArgs e)
        {

            try
            {
                SqlConnection connectSql = new SqlConnection(strcon);

                String qrysql = "select count(*) from JobSeeker where email= @email";

                //Connect to the database
                SqlCommand commSql = new SqlCommand(qrysql, connectSql);

                commSql.Parameters.AddWithValue("@email", sign_seeker_email.Text);

                //Connection Open
                connectSql.Open();
                
                //Check for result
                int existResult = (int)commSql.ExecuteScalar();

                if (existResult == 0) //if the email exist in the record
                {
                    if (string.Equals(sign_seeker_password.Text, sign_seeker_confirmPassword.Text))
                    {
                        Random random = new Random();
                        int length = 16;
                        var vkey2 = "";
                        for (var i = 0; i < length; i++)
                        {
                            vkey2 += ((char)(random.Next(1, 26) + 64)).ToString().ToLower();
                        }

                        SqlConnection connectionSql = new SqlConnection(strcon);

                        //Connection Open
                        connectionSql.Open();

                        String sqlqry = "INSERT INTO JobSeeker (full_name, email, password, verify_key, active, created_at) VALUES (@full_name, @email, @password, @vkey, @active, GETDATE())";

                        //Connect to the database
                        SqlCommand commandSql = new SqlCommand(sqlqry, connectionSql);

                        //Insert Parameters
                        commandSql.Parameters.AddWithValue("@full_name", sign_seeker_FullName.Text);
                        commandSql.Parameters.AddWithValue("@email", sign_seeker_email.Text);
                        commandSql.Parameters.AddWithValue("@password", pwHash.hashPassword(sign_seeker_password.Text));
                        commandSql.Parameters.AddWithValue("@vkey", vkey2);
                        commandSql.Parameters.AddWithValue("@active", "active");

                        //Execute the queries
                        commandSql.ExecuteNonQuery();

                        //Connection Close
                        connectionSql.Close();


                        string from = "webissue.emailus@gmail.com";

                        //Instantiate MailMessage
                        MailMessage message = new MailMessage(from, sign_seeker_email.Text);

                        //Mail Body
                        string mailbody = "<button style='background-color:#008CBA; border:none; font-size:20px; cursor:pointer; text-align:center; padding: 14px 100px;'>" +
                                          "<a href='https://localhost:44329/verificationPost.aspx?vkSeeker=" + vkey2 + "'" + "style='color:white; text-decoration:none;'>Click Here To Verify Your Email Address</a></button>";

                        //Mail Subject
                        message.Subject = "Email Verification";
                        message.Body = mailbody;
                        message.BodyEncoding = Encoding.UTF8;
                        message.IsBodyHtml = true;

                        //SMTP Client port 587 for gmail
                        SmtpClient client = new SmtpClient("smtp.gmail.com", 587);

                        System.Net.NetworkCredential basicCredential1 = new System.Net.NetworkCredential("webissue.emailus@gmail.com", "webissue123");

                        client.EnableSsl = true;
                        client.UseDefaultCredentials = false;
                        client.Credentials = basicCredential1;

                        //send email
                        client.Send(message);
                        Response.Write("<script>alert('Register Successfully, Please Go and Verify Your email!');</script>");

                    }
                }
                else //if the email does not exist in the record
                {
                    Response.Write("<script>alert('The email you entered has been registered');</script>");
                }

                //Connection Close
                connectSql.Close();
            }
            catch (Exception error)
            {
                Response.Write(error.Message);
            }
        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            //your client id  
            string clientid = "804776769506-k0ibg0dnd1vmigibsmjt4p8gekqp4unn.apps.googleusercontent.com";
            //your client secret  
            string clientsecret = "SsB5Pq6GdQIk0j7J9stZdY2D";
            //your redirection url  
            string redirection_url = "https://localhost:44329/google_signup-post.aspx";
            string url = "https://accounts.google.com/o/oauth2/v2/auth?scope=profile&include_granted_scopes=true&redirect_uri=" + redirection_url + "&response_type=code&client_id=" + clientid + "";
            Response.Redirect(url);
        }

        protected void btngoogleSignin_Click(object sender, EventArgs e)
        {
            if (Role.SelectedItem.Value == "job_seeker")
            {
                //your client id  
                string clientid = "804776769506-k0ibg0dnd1vmigibsmjt4p8gekqp4unn.apps.googleusercontent.com";
                //your client secret  
                string clientsecret = "SsB5Pq6GdQIk0j7J9stZdY2D";
                //your redirection url  
                string redirection_url = "https://localhost:44329/google_login_post-js.aspx";
                string url = "https://accounts.google.com/o/oauth2/v2/auth?scope=profile&include_granted_scopes=true&redirect_uri=" + redirection_url + "&response_type=code&client_id=" + clientid + "";
                Response.Redirect(url);
            }
            else if(Role.SelectedItem.Value == "recruiter")
            {
                //your client id  
                string clientid = "804776769506-k0ibg0dnd1vmigibsmjt4p8gekqp4unn.apps.googleusercontent.com";
                //your client secret  
                string clientsecret = "SsB5Pq6GdQIk0j7J9stZdY2D";
                //your redirection url  
                string redirection_url = "https://localhost:44329/google_login_post.aspx";
                string url = "https://accounts.google.com/o/oauth2/v2/auth?scope=profile&include_granted_scopes=true&redirect_uri=" + redirection_url + "&response_type=code&client_id=" + clientid + "";
                Response.Redirect(url);
            }
            else
            {
                Response.Write("<script>alert('Please Choose a Role!!');</script>");
            }

        }

        protected void googleRecruiter_Click(object sender, EventArgs e)
        {
            //your client id  
            string clientid = "804776769506-k0ibg0dnd1vmigibsmjt4p8gekqp4unn.apps.googleusercontent.com";
            //your client secret  
            string clientsecret = "SsB5Pq6GdQIk0j7J9stZdY2D";
            //your redirection url  
            string redirection_url = "https://localhost:44329/google-signup-post-r.aspx";
            string url = "https://accounts.google.com/o/oauth2/v2/auth?scope=profile&include_granted_scopes=true&redirect_uri=" + redirection_url + "&response_type=code&client_id=" + clientid + "";
            Response.Redirect(url);
        }

        protected void googleSeeker_Click(object sender, EventArgs e)
        {
            //your client id  
            string clientid = "804776769506-k0ibg0dnd1vmigibsmjt4p8gekqp4unn.apps.googleusercontent.com";
            //your client secret  
            string clientsecret = "SsB5Pq6GdQIk0j7J9stZdY2D";
            //your redirection url  
            string redirection_url = "https://localhost:44329/google_signup-post.aspx";
            string url = "https://accounts.google.com/o/oauth2/v2/auth?scope=profile&include_granted_scopes=true&redirect_uri=" + redirection_url + "&response_type=code&client_id=" + clientid + "";
            Response.Redirect(url);
        }




    }




}


