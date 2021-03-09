using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;
using System.Threading;

namespace web_app_assignment
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["User"] != null || Session["Recruiter"]!= null)
            {
                SignUpLink.Visible = false;
                ProfileLink.Visible = true;
                LoginLink.Visible = false;
                logoutLink.Visible = true;
            }
        }

        protected void logoutLink_Click(object sender, EventArgs e)
        {
            if (Session["User"] != null)
            {
                Session.Remove("User");
                Response.Redirect("home.aspx");
            }
            else if (Session["Recruiter"] != null)
            {
                Session.Remove("Recruiter");
                Response.Redirect("home.aspx");
            }

           
        }

        protected void ProfileLink_Click(object sender, EventArgs e)
        {
            
            try
            {

                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                if (Session["User"] != null)
                {
                    Response.Redirect("user-profile.aspx");
                }
                else if (Session["Recruiter"] != null)
                {

                    Response.Redirect("recruiter-profile.aspx");

                }
            }
            catch(Exception error)
            {
                Response.Write("<script>alert('" + error.Message + "');</script>"); 
            }

        }
    }
}