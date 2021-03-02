using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace web_app_assignment
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
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
            if(Session["User"] != null)
            {
                Response.Redirect("edit-user.aspx");
            }
            else if(Session["Recruiter"] != null)
            {
                Response.Redirect("edit-recruiter.aspx");
            }
        }
    }
}