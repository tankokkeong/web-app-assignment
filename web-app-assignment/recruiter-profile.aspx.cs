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
    public partial class recruiter_profile : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                string sql = "SELECT * FROM Recruiter";

                SqlCommand cmd = new SqlCommand(sql, con);

                SqlDataReader dr = cmd.ExecuteReader();
                while(dr.Read())
                {
                    lblRecruiterName.Text = dr["company_name"].ToString();
                    lblRecruiterState.Text = dr["state"].ToString();
                    lblRecruiterIndustry.Text = dr["industry"].ToString();
                    linkFB.NavigateUrl = dr["facebook_link"].ToString();
                    linkLinkedIn.NavigateUrl = dr["linkedin_link"].ToString();
                    lblIntroduction.Text = dr["introduction"].ToString();
                    lblRecruiterEmail.Text = dr["email"].ToString();
                    lblRecruiterPhone.Text = dr["mobile_number"].ToString();
                    lblRecruiterContactEmail.Text = dr["contact_email"].ToString();
                    lblRecruiterAddress1.Text = dr["address_line1"].ToString();
                    lblRecruiterAddress2.Text = dr["address_line2"].ToString();
                    lblRecruiterCity.Text = dr["city"].ToString();
                    lblRecruiterState2.Text = dr["state"].ToString();
                    lblRecruiterZip.Text = dr["zip_code"].ToString();
                    lblRecruiterCountry.Text = dr["country"].ToString();
                    lblRecruiterRating.Text = dr["rating"].ToString();
                }
            }
            catch (Exception error)
            {
                Response.Write("<script>alert('" + error.Message + "');</script>");
            }
        }
    }
}