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
                string id = Request.QueryString["editId"] ?? "";

                string sql = "SELECT * FROM Admin WHERE admin_id = @Id AND deleted_at IS NULL";

                SqlConnection con = new SqlConnection(strcon);
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@Id", id);

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                try
                {
                    int Id = Int32.Parse(id);
                    Console.WriteLine(Id);
                }
                catch (Exception ex)
                {

                }

                if (dr.Read())
                {
                    found = true;
                    Console.WriteLine(txtID.Text);
                    //txtID.Text = dr["admin_id"];
                    txtName.Text = (string)dr["admin_name"];
                    txtEmail.Text = (string)dr["admin_email"];
                    txtRight.Text = (string)dr["admin_right"];
                }

                dr.Close();
                con.Close();

                if (!found)
                {
                    Response.Redirect("admin-management.aspx");
                }
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}