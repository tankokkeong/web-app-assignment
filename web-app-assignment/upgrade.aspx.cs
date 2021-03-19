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

            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }

            if(Session["Recruiter"] != null)
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
            else if(Session["Recruiter"] != null)
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


        }
    }
}