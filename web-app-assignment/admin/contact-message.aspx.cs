using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace web_app_assignment.admin
{
    public partial class contact_message : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            Dictionary<string, string> UserDetails = (Dictionary<string, string>)Session["Admin"];

            SqlConnection con = new SqlConnection(strcon);

            string sql = "SELECT * FROM ContactMessage WHERE deleted_at IS NULL";

            SqlCommand cmd = new SqlCommand(sql, con);

            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            //Data binding
            gvContactMessage.DataSource = dr;
            gvContactMessage.DataBind();

            dr.Close();
            con.Close();

        }
    }
}