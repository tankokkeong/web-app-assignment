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
    public partial class chatbox : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        //Create Helper Class
        Helper helper = new Helper();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

                if (Session["Recruiter"] != null)
                {
                    SqlConnection con = new SqlConnection(strcon);

                    //Open Connection Again
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    //Get Recruiter ID
                    string recruiterID = helper.getRecruiterID();                

                    //Get Seeker ID
                    string seeker_id = Request.QueryString["seeker"] ?? "";

                    //Insert id to the hidden field
                    txtSeekerID.Text = seeker_id;
                    txtRecruiterID.Text = recruiterID;

                }
                else
                {

                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    //Get Seeker ID
                    string seeker_id = helper.getSeekerID();


                    //Get Recruiter ID
                    string recruiterID = Request.QueryString["recruiter"] ?? "";

                    //Insert id to the hidden field
                    txtSeekerID.Text = seeker_id;
                    txtRecruiterID.Text = recruiterID;
                }
                

                
            }
            catch (Exception error)
            {
                Response.Write("<script>alert(' +" + error.Message + "'); </script>");
            }
            
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            //Clear the container
            lblContent.Text = "";

            try
            {
                //Get Message Count
                txtScriptTrigger.Text = getMessageCount().ToString();

                if (Session["Recruiter"] != null)
                {
                    //Get Seeker ID
                    string seeker_id = Request.QueryString["seeker"] ?? "";
                    SqlConnection con = new SqlConnection(strcon);

                    //Get Recruiter ID
                    string recruiterID = helper.getRecruiterID();
                    

                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    //Update unseen message
                    string update_seen = "UPDATE ChatMessages " +
                                        "SET seen = @seen " +
                                        "WHERE seen IS NULL " +
                                        "AND sent = @sent " +
                                        "AND recruiter_id = @recruiter_id " +
                                        "AND seeker_id = @seeker_id";

                    //Connect to the database
                    SqlCommand cmd = new SqlCommand(update_seen, con);

                    //Insert parameters
                    cmd.Parameters.AddWithValue("@seen", "seen");
                    cmd.Parameters.AddWithValue("@sent", "Job Seeker");
                    cmd.Parameters.AddWithValue("@recruiter_id", recruiterID);
                    cmd.Parameters.AddWithValue("@seeker_id", seeker_id);

                    //Execute the queries
                    cmd.ExecuteNonQuery();

                    con.Close();


                    //Open Connection Again
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    string sql = "SELECT * FROM ChatMessages CH, JobSeeker JS, Recruiter RT " +
                                "WHERE CH.recruiter_id = @recruiter_id AND " +
                                "CH.seeker_id = @seeker_id AND " +
                                "JS.seeker_id = @seeker_id AND " +
                                "RT.recruiter_id = @recruiter_id";

                    //Connect to the database
                    cmd = new SqlCommand(sql, con);

                    //Insert parameters
                    cmd.Parameters.AddWithValue("@recruiter_id", recruiterID);
                    cmd.Parameters.AddWithValue("@seeker_id", seeker_id);

                    SqlDataReader dr = cmd.ExecuteReader();
                    //Record Chat sent date
                    string sent_date = "";


                    while (dr.Read())
                    {
                        string sent_time = dr["sent_time"].ToString().Substring(12);

                        if (dr["sent_time"].ToString().Substring(0, 11) != sent_date)
                        {
                            sent_date = dr["sent_time"].ToString().Substring(0, 11);

                            lblContent.Text = lblContent.Text +
                                "<div class='text-center'>" + "<span class='sent-date-bg rounded p-1'>" + sent_date + "</span>" + "</div>";
                        }

                        if (dr["sent"].ToString() == "Recruiter")
                        {
                            if(dr["seen"].ToString() == "seen")
                            {
                                lblContent.Text = lblContent.Text +
                               "<div class='my-reply'>" +
                                  "<div class='reply-container'>" +
                                   "<div class='my-reply-content'>" +
                                       "<div class='mb-1'>" +
                                       dr["chat_content"].ToString() +
                                       "</div>" +

                                       "<div class='my-reply-time float-right'>" +
                                           "<span class='text-light'>" + dr["sent_time"].ToString().Substring(12) + "</span><br/>" +
                                           "<div class='float-right'>" +
                                                "<span class='text-light seen-text'>seen<i class='fas fa-check-circle'></i></span>" +
                                           "</div>" +
                                       "</div>" +
                                   "</div>" +

                                   "</div>" +
                               "</div>";
                            }
                            else
                            {
                                lblContent.Text = lblContent.Text +
                              "<div class='my-reply'>" +
                                 "<div class='reply-container'>" +
                                  "<div class='my-reply-content'>" +
                                      "<div class='mb-1'>" +
                                      dr["chat_content"].ToString() +
                                      "</div>" +

                                      "<div class='my-reply-time float-right'>" +
                                          "<span class='text-light'>" + dr["sent_time"].ToString().Substring(12) + "</span><br/>" +
                                          "<div class='float-right'>" +
                                               "<span class='text-light seen-text'>unseen<i class='fas fa-check-circle text-dark'></i></span>" +
                                          "</div>" +
                                      "</div>" +
                                  "</div>" +

                                  "</div>" +
                              "</div>";
                            }
                           
                        }
                        else
                        {
                            lblContent.Text = lblContent.Text +
                            "<div class='replier'>" +
                                "<div class='replier-icon'>" +
                                    "<img src = '" + dr["user_photo"] +"' class='rounded-circle replier-img'/>" +
                                "</div>" +

                                "<div class='reply-content'>" +
                                    "<div class='mb-1'>" +
                                    dr["chat_content"].ToString() +
                                    "</div>" +

                                    "<div class='replier-time float-right'>" +
                                       "<span class='text-secondary'>" + sent_time + "</span>" +
                                    "</div>" +
                                "</div>" +
                            "</div>";
                        }
                    }


                    //Close connection
                    con.Close();
                }
                else
                {
                    //Get Recruiter ID
                    string recruiterID = Request.QueryString["recruiter"] ?? "";
                    SqlConnection con = new SqlConnection(strcon);


                    //Get Seeker ID
                    string seeker_id = helper.getSeekerID();

                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    //Update unseen message
                    string update_seen = "UPDATE ChatMessages " +
                                        "SET seen = @seen " +
                                        "WHERE seen IS NULL " +
                                        "AND sent = @sent " +
                                        "AND recruiter_id = @recruiter_id " +
                                        "AND seeker_id = @seeker_id";

                    //Connect to the database
                    SqlCommand cmd = new SqlCommand(update_seen, con);

                    //Insert parameters
                    cmd.Parameters.AddWithValue("@seen", "seen");
                    cmd.Parameters.AddWithValue("@sent", "Recruiter");
                    cmd.Parameters.AddWithValue("@recruiter_id", recruiterID);
                    cmd.Parameters.AddWithValue("@seeker_id", seeker_id);

                    //Execute the queries
                    cmd.ExecuteNonQuery();

                    con.Close();

                    //Open Connection Again
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    string sql = "SELECT * FROM ChatMessages CH, JobSeeker JS, Recruiter RT " +
                                "WHERE CH.recruiter_id = @recruiter_id AND " +
                                "CH.seeker_id = @seeker_id AND " +
                                "JS.seeker_id = @seeker_id AND " +
                                "RT.recruiter_id = @recruiter_id";

                    //Connect to the database
                    cmd = new SqlCommand(sql, con);

                    //Insert parameters
                    cmd.Parameters.AddWithValue("@recruiter_id", recruiterID);
                    cmd.Parameters.AddWithValue("@seeker_id", seeker_id);

                    SqlDataReader dr = cmd.ExecuteReader();
                    //Record Chat sent date
                    string sent_date = "";


                    while (dr.Read())
                    {
                        string sent_time = dr["sent_time"].ToString().Substring(12);

                        if (dr["sent_time"].ToString().Substring(0, 11) != sent_date)
                        {
                            sent_date = dr["sent_time"].ToString().Substring(0, 11);

                            lblContent.Text = lblContent.Text +
                                "<div class='text-center'>" + "<span class='sent-date-bg rounded p-1'>" + sent_date + "</span>" + "</div>";
                        }

                        if (dr["sent"].ToString() == "Job Seeker")
                        {
                            if (dr["seen"].ToString() == "seen")
                            {
                                lblContent.Text = lblContent.Text +
                               "<div class='my-reply'>" +
                                  "<div class='reply-container'>" +
                                   "<div class='my-reply-content'>" +
                                       "<div class='mb-1'>" +
                                       dr["chat_content"].ToString() +
                                       "</div>" +

                                       "<div class='my-reply-time float-right'>" +
                                           "<span class='text-light'>" + dr["sent_time"].ToString().Substring(12) + "</span><br/>" +
                                           "<div class='float-right'>" +
                                                "<span class='text-light seen-text'>seen<i class='fas fa-check-circle'></i></span>" +
                                           "</div>" +
                                       "</div>" +
                                   "</div>" +

                                   "</div>" +
                               "</div>";
                            }
                            else
                            {
                                lblContent.Text = lblContent.Text +
                              "<div class='my-reply'>" +
                                 "<div class='reply-container'>" +
                                  "<div class='my-reply-content'>" +
                                      "<div class='mb-1'>" +
                                      dr["chat_content"].ToString() +
                                      "</div>" +

                                      "<div class='my-reply-time float-right'>" +
                                          "<span class='text-light'>" + dr["sent_time"].ToString().Substring(12) + "</span><br/>" +
                                          "<div class='float-right'>" +
                                               "<span class='text-light seen-text'>unseen<i class='fas fa-check-circle text-dark'></i></span>" +
                                          "</div>" +
                                      "</div>" +
                                  "</div>" +

                                  "</div>" +
                              "</div>";
                            }
                        }
                        else
                        {
                            lblContent.Text = lblContent.Text +
                            "<div class='replier'>" +
                                "<div class='replier-icon'>" +
                                    "<img src = '" + dr["company_photo"] + "' class='rounded-circle replier-img'/>" +
                                "</div>" +

                                "<div class='reply-content'>" +
                                     "<div class='mb-1'>" +
                                    dr["chat_content"].ToString() +
                                    "</div>" +

                                    "<div class='replier-time float-right'>" +
                                       "<span class='text-secondary'>" + sent_time + "</span>" +
                                    "</div>" +
                                "</div>" +
                            "</div>";
                        }
                    }


                    //Close connection
                    con.Close();
                }

            }
            catch (Exception error)
            {
                Response.Write("<script>alert(' +" + error.Message + "'); </script>");
            }

        }

        protected int getMessageCount()
        {
            int message_count = 0;

            SqlConnection con = new SqlConnection(strcon);

            if (Session["Recruiter"] != null)
            {
                //Open Connection Again
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                //Get Seeker ID
                string seeker_id = Request.QueryString["seeker"] ?? "";

                //Get Recruiter ID
                string recruiter_id = helper.getRecruiterID();

                string sql = "SELECT COUNT(*) FROM ChatMessages CH, JobSeeker JS, Recruiter RT " +
                                "WHERE CH.recruiter_id = @recruiter_id AND " +
                                "CH.seeker_id = @seeker_id AND " +
                                "JS.seeker_id = @seeker_id AND " +
                                "RT.recruiter_id = @recruiter_id";


                SqlCommand cmd = new SqlCommand(sql, con);

                //Insert parameters
                cmd.Parameters.AddWithValue("@recruiter_id", recruiter_id);
                cmd.Parameters.AddWithValue("@seeker_id", seeker_id);

                message_count = Convert.ToInt32(cmd.ExecuteScalar().ToString());

            }
            else
            {
                //Open Connection Again
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                //Get Recruiter ID
                string recruiterID = Request.QueryString["recruiter"] ?? "";

                //Get Seeker ID
                string seeker_id = helper.getSeekerID();

                string sql = "SELECT COUNT(*) FROM ChatMessages CH, JobSeeker JS, Recruiter RT " +
                                "WHERE CH.recruiter_id = @recruiter_id AND " +
                                "CH.seeker_id = @seeker_id AND " +
                                "JS.seeker_id = @seeker_id AND " +
                                "RT.recruiter_id = @recruiter_id";


                SqlCommand cmd = new SqlCommand(sql, con);

                //Insert parameters
                cmd.Parameters.AddWithValue("@recruiter_id", recruiterID);
                cmd.Parameters.AddWithValue("@seeker_id", seeker_id);

                message_count = Convert.ToInt32(cmd.ExecuteScalar().ToString());

            }

            return message_count;
        }

    }
}