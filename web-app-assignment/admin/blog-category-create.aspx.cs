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
    public partial class blog_category_create : System.Web.UI.Page
    {
        Helper helper = new Helper();
        string strcon = ConfigurationManager.ConnectionStrings["con"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        protected void btnAddCategory_Click(object sender, EventArgs e)
        {
            string category = txtTitle.Text;

            string adminID = helper.getAdminID();
            SqlConnection con = new SqlConnection(strcon);

            string sqlInsert = @"INSERT INTO BlogCategory(category_title,edited_by,last_updated,created_at)
                            VALUES (@title, @edited_by, @last_updated, @created_at)";

            con.Open();
            SqlCommand cmd = new SqlCommand(sqlInsert, con);
            cmd.Parameters.AddWithValue("@title", category);
            cmd.Parameters.AddWithValue("@last_updated", DateTime.Now);
            cmd.Parameters.AddWithValue("@created_at", DateTime.Now);
            cmd.Parameters.AddWithValue("@edited_by", adminID);

            cmd.ExecuteNonQuery();
            con.Close();

            Response.Redirect("blog-category-management.aspx");
        }
    }
}