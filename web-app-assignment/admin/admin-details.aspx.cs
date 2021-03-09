using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;
using System.IO;

namespace web_app_assignment.admin
{
    public partial class admin_details : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            Dictionary<string, string> UserDetails = (Dictionary<string, string>)Session["Admin"];

            if (Session["Admin"] != null)
            {
                SqlConnection con = new SqlConnection(strcon);

                //Get admin_id from database
                string sqlSession = @"SELECT admin_id FROM Admin WHERE admin_email = @email";
                SqlCommand cmdSession = new SqlCommand(sqlSession, con);
                con.Open();

                cmdSession.Parameters.AddWithValue("@email", UserDetails["Admin_Email"]);

                SqlDataReader drSession = cmdSession.ExecuteReader();

                string sqlDoList = @"SELECT * FROM Admin WHERE deleted_at IS NULL";
                SqlCommand cmdDoList = new SqlCommand(sqlDoList, con);

                int adminID = 0;

                while (drSession.Read())
                {
                    adminID = Int32.Parse(drSession["admin_id"].ToString());
                }
                cmdDoList.Parameters.AddWithValue("@id", adminID);

                drSession.Close();
            }
        }
    }
}