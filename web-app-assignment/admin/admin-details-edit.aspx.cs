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

        //Create Helper Class
        Helper helper = new Helper();

        protected void Page_Load(object sender, EventArgs e)
        {
            //Check Valid User
            helper.checkAdminLogin();


            Dictionary<string, string> UserDetails = (Dictionary<string, string>)Session["Admin"];

            if (!Page.IsPostBack)
            {
                bool found = false;
                string id = Request.QueryString["editId"] ?? "";

                //Check authorized users
                if(UserDetails["Admin_Right"] == "Viewer" && id != helper.getAdminID())
                {
                    Response.Redirect("admin-management.aspx");
                }

                string sql = "SELECT * FROM Admin WHERE admin_id = @id AND deleted_at IS NULL";

                SqlConnection con = new SqlConnection(strcon);
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@id", id);

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    found = true;
                    txtID.Text = (dr["admin_id"].ToString());
                    txtName.Text = (string)dr["admin_name"];
                    txtEmail.Text = (string)dr["admin_email"];
                    listRight.Text = (string)dr["admin_right"];
                    txtAdminRight.Text = (string)dr["admin_right"];
                }

                dr.Close();
                con.Close();

                if (!found)
                {
                    Response.Redirect("admin-management.aspx");
                }

                if(UserDetails["Admin_Right"] == "Viewer")
                {
                    listRight.Visible = false;
                }
                else
                {
                    txtAdminRight.Visible = false;
                }
            }
        }
        protected void btnEditAdmin_Click(object sender, EventArgs e)
        {
            Dictionary<string, string> UserDetails = (Dictionary<string, string>)Session["Admin"];

            SqlConnection con = new SqlConnection(strcon);
            string id = Request.QueryString["editId"] ?? "";
            string admin_name = txtName.Text;
            string admin_email = txtEmail.Text;
            string admin_right = listRight.Text;

            string sql = @"SELECT admin_id FROM Admin WHERE admin_email = @admin_email AND deleted_at IS NULL";
            
            SqlCommand cmd = new SqlCommand(sql, con);

            con.Open();
            cmd.Parameters.AddWithValue("@admin_email", admin_email);
            SqlDataReader dr = cmd.ExecuteReader();
            
            string sqlEdit = @"UPDATE Admin SET admin_name = @admin_name, 
                               admin_email = @admin_email, admin_right = @admin_right 
                               WHERE admin_id = @id2";

            SqlCommand cmdEdit = new SqlCommand(sqlEdit, con);
            cmd.Parameters.AddWithValue("@id", id);
            cmdEdit.Parameters.AddWithValue("@admin_name", admin_name);
            cmdEdit.Parameters.AddWithValue("@admin_email", admin_email);
            cmdEdit.Parameters.AddWithValue("@admin_right", admin_right);

            while (dr.Read())
            {
                cmdEdit.Parameters.AddWithValue("@id2", id);
            }

            dr.Close();
            cmdEdit.ExecuteNonQuery();
            con.Close();
            
            Response.Redirect("admin-management.aspx");
        }
    }
}