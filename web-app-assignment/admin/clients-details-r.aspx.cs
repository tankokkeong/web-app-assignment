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
    public partial class clients_details_r : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ToString();

        //Create Helper Class
        Helper helper = new Helper();

        protected void Page_Load(object sender, EventArgs e)
        {
            //Check Valid User
            helper.checkAdminLogin();

            if (!Page.IsPostBack)
            {
                bool found = false;
                string id = Request.QueryString["viewId"] ?? "";

                string sql = "SELECT * FROM Recruiter WHERE recruiter_id = @id AND deleted_at IS NULL";

                SqlConnection con = new SqlConnection(strcon);
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@id", id);

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    found = true;
                    txtID.Text = (dr["recruiter_id"].ToString());
                    txtName.Text = (string)dr["company_name"];
                    txtEmail.Text = (string)dr["email"];
                    txtContactNumber.Text = (string)dr["mobile_number"];
                    txtContactEmail.Text = (string)dr["contact_email"];
                    txtPremium.Text = (dr["is_premium"] == (object)DBNull.Value) ? "Non Premium" : "Premium";
                    txtAddress1.Text = (string)dr["address_line1"];
                    txtAddress2.Text = (string)dr["address_line2"];
                    txtCity.Text = (string)dr["city"];
                    txtState.Text = (string)dr["state"];
                    txtZipCode.Text = (string)dr["zip_code"];
                    txtCountry.Text = (string)dr["country"];
                    txtIndustry.Text = (string)dr["industry"];
                    txtFacebook.Text = (string)dr["facebook_link"];
                    txtLinkedin.Text = (string)dr["linkedin_link"];
                    txtIntroduction.Text = (string)dr["introduction"];
                    txtRating.Text = (dr["rating"].ToString());
                }

                dr.Close();
                con.Close();

                if (!found)
                {
                    Response.Redirect("clients-management-r.aspx");
                }
            }
        }
    }
}