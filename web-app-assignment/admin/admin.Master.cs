using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace web_app_assignment.admin
{
    public partial class admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Admin"] != null)
            {
                Dictionary<string, string> UserDetails = (Dictionary<string, string>)Session["Admin"];

                lblUserName.Text = UserDetails["Admin_Name"];
                lblRight.Text = UserDetails["Admin_Right"];
            }
            else
            {
                Response.Redirect("login.aspx");
            }
        }
        protected void logout_Click (object sender, EventArgs e)
        {           
           
            Session.Remove("Admin");

            Response.Redirect("login.aspx");
        }

    }
}