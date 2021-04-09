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
            //if the permission is not granted
            if(Session["admin_verify_key"] == null)
            {
                Response.Redirect("login.aspx");
            }       
        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(strcon);

            //Query
            string query = "SELECT COUNT(*) FROM Admin WHERE verify_key = @verify_key";

            //Connect to the databse
            SqlCommand cmd = new SqlCommand(query, con);

            //Connection Open
            con.Open();

            //Inser Parameter
            cmd.Parameters.AddWithValue("@verify_key", Session["admin_verify_key"].ToString());

            //Check result
            string output = cmd.ExecuteScalar().ToString();

            //if the result found
            if(output == "1")
            {
                SqlConnection conn = new SqlConnection(strcon);

                //Update data 
                string qry = "UPDATE Admin SET admin_name = @admin_name, admin_password = @admin_password, verified_at = @verified_at where verify_key = @verify_key";
                
                //Connect to the database
                SqlCommand cm = new SqlCommand(qry, conn);

                //Connection Open
                conn.Open();
               
                //Insert Parameters
                cm.Parameters.AddWithValue("@admin_name", admin_Name.Text);
                cm.Parameters.AddWithValue("@admin_password", pwHash.hashPassword(admin_newPassword.Text));
                cm.Parameters.AddWithValue("@verify_key", Session["admin_verify_key"].ToString());
                cm.Parameters.AddWithValue("@verified_at", DateTime.Now);

                //Execute the queries
                cm.ExecuteNonQuery();

                //Connection Close
                conn.Close();

              
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", " alert('Password Set Successfully'); window.open('login.aspx');", true);

                Response.Redirect("login.aspx");
            }
            //Connection Close
            con.Close();
        }
    }
}