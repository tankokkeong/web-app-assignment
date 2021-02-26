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

                //Read User profile Details
                string sql = "SELECT * FROM Recruiter";

                SqlCommand cmd = new SqlCommand(sql, con);

                SqlDataReader dr = cmd.ExecuteReader();
                while(dr.Read())
                {
                    lblRecruiterName.Text = dr["company_name"].ToString();
                    imgRecruiterProfile.ImageUrl = dr["company_photo"].ToString();
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

                //Close connection
                con.Close();

                //Open Connection
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                //Read Job Posted
                string sql_jobposted = "SELECT * FROM JobPost WHERE recruiter_id = 1";

                SqlDataAdapter cmd2 = new SqlDataAdapter(sql_jobposted, con);
                DataTable dtbl = new DataTable();
                cmd2.Fill(dtbl);
                GridView1.DataSource = dtbl;
                GridView1.DataBind();


            }
            catch (Exception error)
            {
                Response.Write("<script>alert('" + error.Message + "');</script>");
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Display the job type in colours.
                if(e.Row.Cells[1].Text == "Full Time")
                {
                    e.Row.Cells[1].Text = "<span class='badge badge-success'>" + e.Row.Cells[1].Text + "</span>";
                }
                else
                {
                    e.Row.Cells[1].Text = "<span class='badge badge-danger'>" + e.Row.Cells[1].Text + "</span>";
                }

                //Query String
                e.Row.Cells[4].Text = "<a class='btn btn-success p-1 mr-2'  href='edit-postjob.aspx?job=" + e.Row.Cells[4].Text + "'> Edit</a>" +
                    "<button class='btn btn-danger p-1' data-toggle='modal' data-target='#deleteModal' type='button'>Delete</button>";
            }
        }
    }
}