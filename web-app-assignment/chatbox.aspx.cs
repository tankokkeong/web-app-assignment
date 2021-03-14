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

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            //Clear the container
            lblContent.Text = "";

            try
            {
                if (Session["Recruiter"] != null)
                {
                    //Get Seeker ID
                    string seeker_id = Request.QueryString["seeker"] ?? "";

                    //Insert value to hidden field
                    hfSeekerID.Value = seeker_id;

                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    //Get Recruiter ID

                    Dictionary<string, string> RecruiterDetails = (Dictionary<string, string>)Session["Recruiter"];

                    string recruiterID = "";

                    //GET Seeker ID from the seeker table
                    string selectRecruiterID = "SELECT recruiter_id FROM Recruiter WHERE email = @email";

                    SqlCommand cmd = new SqlCommand(selectRecruiterID, con);

                    cmd.Parameters.AddWithValue("@email", RecruiterDetails["recruiter_email"].ToString());

                    SqlDataReader dr = cmd.ExecuteReader();

                    while (dr.Read())
                    {
                        recruiterID = dr["recruiter_id"].ToString();
                    }

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

                    dr = cmd.ExecuteReader();
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
                            lblContent.Text = lblContent.Text +
                            "<div class='my-reply'>" +
                                "<div class='my-reply-content'>" +
                                    "<div class='mb-1'>" +
                                    dr["chat_content"].ToString() +
                                    "</div>" +

                                    "<div class='my-reply-time float-right'>" +
                                        "<span class='text-light'>" + dr["sent_time"].ToString().Substring(12) + "</span>" +
                                    "</div>" +
                                "</div>" +
                            "</div>";
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
                    //Get Seeker ID
                    string recruiterID = Request.QueryString["recruiter"] ?? "";

                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    //Get Recruiter ID

                    Dictionary<string, string> UserDetails = (Dictionary<string, string>)Session["User"];

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

                    dr = cmd.ExecuteReader();
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
                            lblContent.Text = lblContent.Text +
                            "<div class='my-reply'>" +
                                "<div class='my-reply-content'>" +
                                     "<div class='mb-1'>" +
                                    dr["chat_content"].ToString() +
                                    "</div>" +

                                    "<div class='my-reply-time float-right'>" +
                                        "<span class='text-light'>" + dr["sent_time"].ToString().Substring(12) + "</span>" +
                                    "</div>" +
                                "</div>" +
                            "</div>";
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
    }
}