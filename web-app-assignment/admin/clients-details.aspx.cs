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
    public partial class clients_details : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                bool found = false;
                string id = Request.QueryString["viewId"] ?? "";

                string sql = "SELECT * FROM JobSeeker WHERE seeker_id = @id AND deleted_at IS NULL";

                SqlConnection con = new SqlConnection(strcon);
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@id", id);

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    found = true;
                    txtID.Text = dr["seeker_id"].ToString();
                    txtName.Text = (string)dr["full_name"];
                    txtEmail.Text = (string)dr["email"];
                    txtSkills.Text = (string)dr["skills"];
                    txtGender.Text = (string)dr["gender"];
                    txtContactNumber.Text = (string)dr["mobile_number"];
                    txtContactEmail.Text = (string)dr["contact_email"];
                    txtPremium.Text = (dr["is_premium"] == (object)DBNull.Value) ? "Non Premium" : "Premium";
                    txtLocation.Text = (string)dr["location"];
                    txtProfession.Text = (string)dr["profession"];
                    txtPreferIndustry.Text = (string)dr["prefer_industry"];
                    txtCountry.Text = (string)dr["country"];
                    txtExperience.Text = (string)dr["experience"];
                    txtFacebook.Text = (string)dr["facebook_link"];
                    txtLinkedin.Text = (string)dr["linkedin_link"];
                    txtIntroduction.Text = (string)dr["introduction"];
                }

                dr.Close();
                con.Close();

                if (!found)
                {
                    Response.Redirect("clients-management.aspx");
                }
            }
        }
    }
}