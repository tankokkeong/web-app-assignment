﻿using System;
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
            if (Session["User"] != null) { 
            }
        }

        protected void LogoutLink_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }
    }
}