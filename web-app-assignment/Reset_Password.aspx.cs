using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Text;

namespace web_app_assignment
{

    public partial class Reset_Password : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["seeker_verify_key"] != null)
            {
                string seeker = Session["seeker_verify_key"].ToString();
            }
            if (Session["recruiter_verify_key"] != null)
            {
                string seeker = Session["recruiter_verify_key"].ToString();
            }

            //If no requested query string
            if (Request.QueryString["Role"]== null)
            {
                Response.Redirect("login_signup.aspx");
            }
        }

        protected void forgotPasswordFormEmailButtonSubmit_Click(object sender, EventArgs e)
        {
            //Set requested query string into variable
            string requestRole = Request.QueryString["Role"];

            //If role is job seeker
            if(requestRole == "job-seeker")
            {
                SqlConnection con = new SqlConnection(strcon);

                //Query
                string query = "UPDATE JobSeeker SET password = @password where verify_key = @verify_key";

                //Connect to the database
                SqlCommand cmd = new SqlCommand(query, con);

                //Connnection Open
                con.Open();

                //Insert Parameters
                cmd.Parameters.AddWithValue("@password", pwHash.hashPassword(new_password.Text));
                cmd.Parameters.AddWithValue("@verify_key", Session["seeker_verify_key"].ToString());

                //Execute the queries
                cmd.ExecuteNonQuery();

                //Connection Close
                con.Close();


                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", " alert('Password Reset Successfully'); window.open('login_signup.aspx');", true);

            }
            else if (requestRole == "recruiter")
            {
                SqlConnection conn = new SqlConnection(strcon);

                string query = "UPDATE Recruiter SET password = @password where verify_key = @verify_key";

                //Connect to the database
                SqlCommand comm = new SqlCommand(query, conn);

                //Connection Open
                conn.Open();

                //Insert Parameters
                comm.Parameters.AddWithValue("@password", pwHash.hashPassword(new_password.Text));
                comm.Parameters.AddWithValue("@verify_key", Session["recruiter_verify_key"].ToString());

                //Execute the queries
                comm.ExecuteNonQuery();

                //Connection Close
                conn.Close();

                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", " alert('Password Reset Successfully'); window.open('login_signup.aspx');", true);
            }
            
        }
    }
}