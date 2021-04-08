﻿using System;
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

                //Connection Open
                con.Open();

                string query = "select count(*) from Admin where admin_email= '" + txtEmail.Text + "' and admin_password ='" + pwHash.hashPassword(txtPassword.Text) + "' AND verified_at IS NOT NULL AND deleted_at IS NULL";

                //Connect to the database
                SqlCommand cmd = new SqlCommand(query, con);

                //Check for result
                string output = cmd.ExecuteScalar().ToString();

                //if the result found
                if (output == "1")
                {
                    //Dictionary
                    Dictionary <string, string> UserDetails = new Dictionary<string, string>();
                    string sql = "SELECT * FROM Admin WHERE admin_email = @email";

                    SqlCommand cm = new SqlCommand(sql, con);

                    //Insert parameters
                    cm.Parameters.AddWithValue("@email", txtEmail.Text);

                    //Read Data
                    SqlDataReader dr = cm.ExecuteReader();

                    while (dr.Read())
                    {
                        //Add User Details into Dictionary
                        UserDetails.Add("Admin_Email", dr["admin_email"].ToString());
                        UserDetails.Add("Admin_Name", dr["admin_name"].ToString());
                        UserDetails.Add("Admin_Right", dr["admin_right"].ToString());
                    }

                    //Store Dictionary Data into Session
                    Session["Admin"] = UserDetails;
                    Response.Redirect("dashboard.aspx");
                }
                else
                {
                    Response.Write(@"<script language='javascript'>alert('Invalid Username or Password. Or Your Email Is Not Verified Yet!')</script>");

                }
            }
            catch (Exception error)
            {
                Response.Write(error.Message);
            }
            
        }
    }
}