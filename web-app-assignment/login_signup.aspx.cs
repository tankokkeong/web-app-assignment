using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace web_app_assignment
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void inputsFormSign_LoginButton_Click(object sender, EventArgs e)
        {
            try
            {
                if (Role.SelectedValue == "job_seeker")
                {
                    SqlConnection con = new SqlConnection(strcon);

                    con.Open();

                    String query = "select count(*) from JobSeeker where email= '" + sign_login_emailUser.Text + "' and password ='" + sign_login_password.Text + "'";

                    SqlCommand cmd = new SqlCommand(query, con);

                    String output = cmd.ExecuteScalar().ToString();

                    if (output == "1")
                    {
                        Response.Redirect("edit-user.aspx");
                    }
                    con.Close();
                }
                else if (Role.SelectedValue == "recruiter")
                {
                    SqlConnection con = new SqlConnection(strcon);

                    con.Open();

                    String query = "select count(*) from Recruiter where email= '" + sign_login_emailUser.Text + "' and password ='" + sign_login_password.Text + "'";

                    SqlCommand cmd = new SqlCommand(query, con);

                    String output = cmd.ExecuteScalar().ToString();

                    if (output == "1")
                    {
                        Response.Redirect("edit-recruiter.aspx");
                    }
                }
                else
                {
                    Response.Write(@"<script language='javascript'>alert('Please choose the correct role.')</script>");
                }
            }
            catch (Exception error)
            {
                Response.Write(error.Message);
            }
           
        }
    }
}