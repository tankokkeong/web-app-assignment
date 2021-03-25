using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace web_app_assignment.admin
{
    public partial class blog_category_edit : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            Dictionary<string, string> UserDetails = (Dictionary<string, string>)Session["Admin"];

            if (!Page.IsPostBack)
            {
                bool found = false;
                string id = Request.QueryString["Id"] ?? "";

                string sql = "SELECT * FROM BlogCategory WHERE blog_category_id = @Id AND deleted_at IS NULL";

                SqlConnection con = new SqlConnection(strcon);
                SqlCommand cmdCategory = new SqlCommand(sql, con);
                cmdCategory.Parameters.AddWithValue("@Id", id);

                con.Open();
                SqlDataReader dr = cmdCategory.ExecuteReader();

                if (dr.Read())
                {
                    found = true;
                    txtID.Text = id;
                    txtTitle.Text = (string)dr["category_title"];
                }

                dr.Close();
                con.Close();

                if (!found)
                {
                    Response.Redirect("blog-category-management.aspx");
                }
            }
        }

        protected void btnEditCategory_Click(object sender, EventArgs e)
        {
            string title = txtTitle.Text;
            string id = txtID.Text;

            Dictionary<string, string> UserDetails = (Dictionary<string, string>)Session["Admin"];

            SqlConnection con = new SqlConnection(strcon);

            string sqlSession = @"SELECT admin_id FROM Admin WHERE admin_email = @email";
            SqlCommand cmdSession = new SqlCommand(sqlSession, con);
            con.Open();
            cmdSession.Parameters.AddWithValue("@email", UserDetails["Admin_Email"]);
            SqlDataReader drSession = cmdSession.ExecuteReader();

            string sqlUpdate = @"UPDATE BlogCategory SET category_title = @title, edited_by = @edited_by ,last_updated = @last_updated WHERE blog_category_id = @id";


            SqlCommand cmd = new SqlCommand(sqlUpdate, con);
            cmd.Parameters.AddWithValue("@title", title);
            cmd.Parameters.AddWithValue("@last_updated", DateTime.Now);
            cmd.Parameters.AddWithValue("@id", id);

            while (drSession.Read())
            {
                cmd.Parameters.AddWithValue("@edited_by", drSession["admin_id"]);
            }
            drSession.Close();
            cmd.ExecuteNonQuery();
            con.Close();

            Response.Redirect("blog-category-management.aspx");
        }
    }
}