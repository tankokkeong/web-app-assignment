using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;
using System.IO;

namespace web_app_assignment.admin
{
    public partial class admin_details_edit : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ToString();
        protected void btnEditAdmin_Click(object sender, EventArgs e)
        {
            Dictionary<string, string> UserDetails = (Dictionary<string, string>)Session["Admin"];

            if (!Page.IsPostBack)
            {
                bool found = false;
                string admin_id = Request.QueryString["admin_id"] ?? "";

                string sql = "SELECT * FROM Admin WHERE admin_id = @admin_id AND deleted_at IS NULL";

                SqlConnection con = new SqlConnection(strcon);
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@admin_id", admin_id);

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    found = true;
                    txtID.Text = (string)dr["admin_id"];
                    txtName.Text = (string)dr["admin_name"];
                    txtEmail.Text = (string)dr["admin_email"];
                    txtRight.Text = (string)dr["admin_right"];
                }

                dr.Close();
                con.Close();

                if (!found)
                {
                    Response.Redirect("admin-details-edit.aspx");
                }
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}