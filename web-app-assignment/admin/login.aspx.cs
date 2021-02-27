using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;




namespace web_app_assignment.admin
{
    public partial class login : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ToString();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            

            try
            {
                SqlConnection con = new SqlConnection(strcon);

                con.Open();

                String query = "select count(*) from Admin where admin_email= '" + txtEmail.Text + "' and admin_password ='" + txtPassword.Text + "'";

                SqlCommand cmd = new SqlCommand(query, con);

                String output = cmd.ExecuteScalar().ToString();

                if (output == "1")
                {
                    Dictionary <string, string> UserDetails = new Dictionary<string, string>();
                    string sql = "SELECT * FROM Admin WHERE admin_email = @email";

                    SqlCommand cm = new SqlCommand(sql, con);

                    //Insert parameters
                    cm.Parameters.AddWithValue("@email", txtEmail.Text);

                    SqlDataReader dr = cm.ExecuteReader();

                    

                    while (dr.Read())
                    {
                        //Add User Details
                        //UserDetails.Add("Admin_Email", "anson22267@gmail.com");
                        //UserDetails.Add("Admin_Name", "Anson");
                        //UserDetails.Add("Admin_Right", "Viewer");
                        UserDetails.Add("Admin_Email", dr["admin_email"].ToString());
                        UserDetails.Add("Admin_Name", dr["admin_name"].ToString());
                        UserDetails.Add("Admin_Right", dr["admin_right"].ToString());
                    }

                    Session["Admin"] = UserDetails;
                    Response.Redirect("dashboard.aspx");
                }
                else
                {
                    Response.Write(@"<script language='javascript'>alert('Invalid Username or Password.')</script>");

                }
            }
            catch (Exception error)
            {
                lblError.Text = error.Message;
            }
            
        }
    }
}