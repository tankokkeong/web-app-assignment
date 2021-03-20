using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace web_app_assignment
{
    public partial class upgrade : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            string payer_id = "";

            //Check Login
            if (Session["User"] == null && Session["Recruiter"] == null)
            {
                Response.Redirect("home.aspx");
            }


            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                if (Session["Recruiter"] != null)
                {
                    //Get Recruiter ID

                    Dictionary<string, string> RecruiterDetails = (Dictionary<string, string>)Session["Recruiter"];


                    //GET Seeker ID from the seeker table
                    string selectRecruiterID = "SELECT recruiter_id FROM Recruiter WHERE email = @email";

                    SqlCommand cmd = new SqlCommand(selectRecruiterID, con);

                    cmd.Parameters.AddWithValue("@email", RecruiterDetails["recruiter_email"].ToString());

                    SqlDataReader dr = cmd.ExecuteReader();

                    while (dr.Read())
                    {
                        payer_id = dr["recruiter_id"].ToString();
                    }

                    con.Close();
                }
                else if (Session["User"] != null)
                {
                    //Get Seeker ID
                    Dictionary<string, string> UserDetails = (Dictionary<string, string>)Session["User"];

                    //GET Seeker ID from the seeker table
                    string selectSeekerID = "SELECT seeker_id FROM JobSeeker WHERE email = @email";

                    SqlCommand cmd = new SqlCommand(selectSeekerID, con);

                    cmd.Parameters.AddWithValue("@email", UserDetails["user_email"].ToString());

                    SqlDataReader dr = cmd.ExecuteReader();

                    while (dr.Read())
                    {
                        payer_id = dr["seeker_id"].ToString();
                    }

                    con.Close();
                }

                //Assign the value to hidden field
                payerID.Value = payer_id;

                //Upgrade user if received the request
                var upgrade_id = Request.Form["upgrade_id"] ?? "";
                string upgrade_sql = "";
                string payment_sql = "";
                string premium_seeker = null;
                string premium_recruiter = null;

                if (upgrade_id != "")
                {
                    //OPEN Connection
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    if (Session["User"] != null)
                    {
                        //Upgrade User to premium
                        upgrade_sql = "Update JobSeeker " +
                                "SET is_premium = @is_premium " +
                                "WHERE seeker_id = @upgrade_id";

                        //Assign Value to premium seeker
                        premium_seeker = upgrade_id;

                        payment_sql = "INSERT INTO PaymentRecord(payment_method, payment_amount, premium_seeker, created_at) " +
                                     "VALUES(@payment_method, @payment_amount, @premium_seeker, @created_at)";

                    }
                    else if (Session["Recruiter"] != null)
                    {
                        //Upgrade User to premium
                        upgrade_sql = "Update Recruiter " +
                                "SET is_premium = @is_premium " +
                                "WHERE recruiter_id = @upgrade_id";

                        //Assign Value to premium seeker
                        premium_recruiter = upgrade_id;

                        payment_sql = "INSERT INTO PaymentRecord(payment_method, payment_amount, premium_recruiter, created_at) " +
                                     "VALUES(@payment_method, @payment_amount, @premium_recruiter, @created_at)";
                    }


                    SqlCommand cmd = new SqlCommand(upgrade_sql, con);

                    //Insert parameters
                    cmd.Parameters.AddWithValue("@is_premium", "true");
                    cmd.Parameters.AddWithValue("@upgrade_id", upgrade_id);

                    //Execute the queries
                    cmd.ExecuteNonQuery();
                    con.Close();

                    //OPEN Connection
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    //Connect to the database
                    cmd = new SqlCommand(payment_sql, con);


                    if(Session["Recruiter"] != null)
                    {
                        //Insert parameters
                        cmd.Parameters.AddWithValue("@payment_method", "PayPal");
                        cmd.Parameters.AddWithValue("@payment_amount", 88);
                        cmd.Parameters.AddWithValue("@premium_recruiter", premium_recruiter);
                        cmd.Parameters.AddWithValue("@created_at", DateTime.Now);
                    }
                    else
                    {
                        //Insert parameters
                        cmd.Parameters.AddWithValue("@payment_method", "PayPal");
                        cmd.Parameters.AddWithValue("@payment_amount", 88);
                        cmd.Parameters.AddWithValue("@premium_seeker", premium_seeker);
                        cmd.Parameters.AddWithValue("@created_at", DateTime.Now);
                    }
                    

                    //Execute the queries
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            catch (Exception error)
            {
                Response.Write("<script>alert(' +" + error.Message + "'); </script>");
            }
            


        }
    }
}