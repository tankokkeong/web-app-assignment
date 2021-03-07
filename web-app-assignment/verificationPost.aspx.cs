using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace web_app_assignment
{
    public partial class verificationPost : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["emailRecruiter"] != null)
            {
                string emailR = Request.QueryString["emailRecruiter"] ?? "";

                string sql = "UPDATE Recruiter SET verified_at = @verify WHERE email = @email";

                SqlConnection con = new SqlConnection(strcon);
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@verify", DateTime.Now);
                cmd.Parameters.AddWithValue("@email", emailR);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                Response.Redirect("login_signup.aspx");
            }
            else if (Request.QueryString["emailSeeker"] != null)
            {
                string emailS = Request.QueryString["emailSeeker"] ?? "";

                string sql = "UPDATE JobSeeker SET verified_at = @verify WHERE email = @email";

                SqlConnection con = new SqlConnection(strcon);
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@verify", DateTime.Now);
                cmd.Parameters.AddWithValue("@email", emailS);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                Response.Redirect("login_signup.aspx");
            }
            else
            {
                Response.Write("<script>alert('Email Verification Went Wrong!');</script>");
            }
        }
    }
}