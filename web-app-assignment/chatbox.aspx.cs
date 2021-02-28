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
            //Clear the container
            lblContent.Text = "";

            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                string sql = "SELECT * FROM ChatMessages WHERE recruiter_id = @recruiter_id AND seeker_id = @seeker_id";

                //Connect to the database
                SqlCommand cmd = new SqlCommand(sql, con);

                //Insert parameters
                cmd.Parameters.AddWithValue("@recruiter_id", 1);
                cmd.Parameters.AddWithValue("@seeker_id", 1);

                SqlDataReader dr = cmd.ExecuteReader();


                while (dr.Read())
                {

                    if (dr["sent"].ToString() == "Recruiter")
                    {
                        lblContent.Text = lblContent.Text +
                        "<div class='my-reply'>" +
                            "<div class='my-reply-content'>" +
                                dr["chat_content"].ToString() +

                                "<div class='my-reply-time float-right'>" +
                                    "<span class='text-light'>10:25</span>" +
                                "</div>" +
                            "</div>" +
                        "</div>";
                    }
                    else
                    {
                        lblContent.Text = lblContent.Text +
                        "<div class='replier'>" +
                            "<div class='replier-icon'>" +
                                "<img src = 'images/user%20profile/demo-user.png' class='rounded-circle replier-img'/>" +
                            "</div>" +

                            "<div class='reply-content'>" +
                                dr["chat_content"].ToString() +

                                "<div class='replier-time float-right'>" +
                                    "<span class='text-secondary'>10:24</span>" +
                                "</div>" +
                            "</div>" +
                        "</div>";
                    }
                }


                //Close connection
                con.Close();
            }
            catch(Exception error)
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

                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                string sql = "SELECT * FROM ChatMessages WHERE recruiter_id = @recruiter_id AND seeker_id = @seeker_id";

                //Connect to the database
                SqlCommand cmd = new SqlCommand(sql, con);

                //Insert parameters
                cmd.Parameters.AddWithValue("@recruiter_id", 1);
                cmd.Parameters.AddWithValue("@seeker_id", 1);

                SqlDataReader dr = cmd.ExecuteReader();


                while (dr.Read())
                {

                    if (dr["sent"].ToString() == "Recruiter")
                    {
                        lblContent.Text = lblContent.Text +
                        "<div class='my-reply'>" +
                            "<div class='my-reply-content'>" +
                                dr["chat_content"].ToString() +

                                "<div class='my-reply-time float-right'>" +
                                    "<span class='text-light'>10:25</span>" +
                                "</div>" +
                            "</div>" +
                        "</div>";
                    }
                    else
                    {
                        lblContent.Text = lblContent.Text +
                        "<div class='replier'>" +
                            "<div class='replier-icon'>" +
                                "<img src = 'images/user%20profile/demo-user.png' class='rounded-circle replier-img'/>" +
                            "</div>" +

                            "<div class='reply-content'>" +
                                dr["chat_content"].ToString() +

                                "<div class='replier-time float-right'>" +
                                    "<span class='text-secondary'>10:24</span>" +
                                "</div>" +
                            "</div>" +
                        "</div>";
                    }
                }


                //Close connection
                con.Close();
            }
            catch (Exception error)
            {
                Response.Write("<script>alert(' +" + error.Message + "'); </script>");
            }
            
        }
    }
}