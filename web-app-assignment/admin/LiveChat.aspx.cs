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
        Helper helper = new Helper();
        protected void Page_Load(object sender, EventArgs e)
        {
            //Check Valid User
            helper.checkAdminLogin();

            try
            {
                txtAdminID.Text = helper.getAdminID();

                string querychat = Request.QueryString["chat"] ?? "";

                if(querychat == "")
                {
                    Response.Redirect("LiveChatDashboard.aspx");
                }
            }
            catch(Exception error)
            {
                Response.Write("<script>alert('" + error.Message + "');</script>");
            }
        }
    }
}