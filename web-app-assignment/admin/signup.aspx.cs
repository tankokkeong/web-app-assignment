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
    public partial class signup : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["admin_verify_key"] != null)
            {
                string admin_key = Session["admin_verify_key"].ToString();
            }
            
        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(strcon);

            string query = "SELECT COUNT(*) FROM Admin WHERE verify_key = @verify_key";

            SqlCommand cmd = new SqlCommand(query, con);

            con.Open();

            cmd.Parameters.AddWithValue("@verify_key", Session["admin_verify_key"].ToString());

            string output = cmd.ExecuteScalar().ToString();

            if(output == "1")
            {
                SqlConnection conn = new SqlConnection(strcon);

                string qry = "UPDATE Admin SET admin_name = @admin_name, admin_password = @admin_password, verified_at = @verified_at where verify_key = @verify_key";
                
                SqlCommand cm = new SqlCommand(qry, conn);

                conn.Open();
               
                cm.Parameters.AddWithValue("@admin_name", admin_Name.Text);
                cm.Parameters.AddWithValue("@admin_password", pwHash.hashPassword(admin_newPassword.Text));
                cm.Parameters.AddWithValue("@verify_key", Session["admin_verify_key"].ToString());
                cm.Parameters.AddWithValue("@verified_at", DateTime.Now);

                cm.ExecuteNonQuery();

                conn.Close();

              
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", " alert('Password Set Successfully'); window.open('login.aspx');", true);

                Response.Redirect("login.aspx");
            }
            con.Close();
        }
    }
}