using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace web_app_assignment.admin
{
    public partial class LiveChat1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Dictionary<string, string> AdminDetail = (Dictionary<string, string>)Session["Admin"];

                lblUsername.Text = Request.QueryString["chat"] ?? "";
                lblAdminName.Text = AdminDetail["Admin_Email"].ToString();
            }
            catch(Exception error)
            {
                Response.Write("<script>alert('" + error.Message + "');</script>");
            }
        }
    }
}