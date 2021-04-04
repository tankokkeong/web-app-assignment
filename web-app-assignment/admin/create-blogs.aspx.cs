using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

namespace web_app_assignment.admin
{
    public partial class create_blogs : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        //Create Helper Class
        Helper helper = new Helper();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                SqlConnection con = new SqlConnection(strcon);

                //drop down list
                string sqlList = "SELECT * FROM BlogCategory WHERE deleted_at IS NULL";
                SqlCommand cmdList = new SqlCommand(sqlList, con);
                SqlDataAdapter sda = new SqlDataAdapter(cmdList);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                ddlCategory.DataSource = dt;
                ddlCategory.DataBind();
            }
        }

        protected void btnCreatePost_Click(object sender, EventArgs e)
        {
            try 
            {
                string title = txtTitle.Text;
                string content = HttpUtility.UrlDecode(txtBlogDescription.Text);
                string category_id = ddlCategory.SelectedValue;
                string admin_id = helper.getAdminID();

                //Upload Profile Image Handled
                string upload_path = MapPath("/Uploads/");
                string file_name = blogPhotoUpload.FileName;
                string blog_photo = "";

                if (file_name != "")
                {
                    blogPhotoUpload.SaveAs(upload_path + file_name);
                    blog_photo = "../Uploads/" + file_name;
                }
                else
                {
                    blog_photo = txtPhotoUpload.Text;
                }

                Response.Redirect("display-blogs.aspx");

                SqlConnection con = new SqlConnection(strcon);

                string sqlInsert = "INSERT INTO BlogPost(blog_title, blog_content, blog_image, blog_category_id, edited_by, last_updated, created_at)VALUES(@blogTitle, @blogContent, @blogImage, @blogCatId, @editBy, @lastUpdated, @created_at)";

                SqlCommand cmdInsert = new SqlCommand(sqlInsert, con);
                con.Open();

                //Insert parameters
                cmdInsert.Parameters.AddWithValue("@blogTitle", title);
                cmdInsert.Parameters.AddWithValue("@blogContent", content);
                cmdInsert.Parameters.AddWithValue("@blogImage", blog_photo);
                cmdInsert.Parameters.AddWithValue("@blogCatId", category_id);
                cmdInsert.Parameters.AddWithValue("@editBy", admin_id);
                cmdInsert.Parameters.AddWithValue("@lastUpdated", DateTime.Now);
                cmdInsert.Parameters.AddWithValue("@created_at", DateTime.Now);

                cmdInsert.ExecuteNonQuery();

                //Close Connection
                con.Close();
            }
            catch (Exception error)
            {
                Response.Write("<script>alert('" + error.Message + "');</script>");
            }
        }
    }
}