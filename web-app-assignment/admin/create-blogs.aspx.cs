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
                string sqlList = "SELECT * FROM BlogCategory";
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
                //string content = HttpUtility.UrlDecode(txtBlogDescription.Text);
                string category_id = ddlCategory.SelectedValue;
                string admin_id = helper.getAdminID();

                //FileUpload1.SaveAs(@"../Uploads/" + FileUpload1.FileName);
                //string image = "Uploads/" + Path.GetFileName(FileUpload1.FileName);
                //lblUpload.Text = "File Uploaded: " + FileUpload1.FileName;


                SqlConnection con = new SqlConnection(strcon);

                string sqlInsert = "INSERT INTO BlogPost(blog_title, blog_category_id, edited_by, last_updated, created_at)VALUES(@blogTitle, @blogCatId, @editBy, @lastUpdated, @created_at)";

                SqlCommand cmdInsert = new SqlCommand(sqlInsert, con);

                //Insert parameters
                cmdInsert.Parameters.AddWithValue("@blogTitle", title);
                //cmdInsert.Parameters.AddWithValue("@blogContent", content);
                //cmdInsert.Parameters.AddWithValue("@blogImage", image);
                cmdInsert.Parameters.AddWithValue("@blogCatId", category_id);
                cmdInsert.Parameters.AddWithValue("@editBy", admin_id);
                cmdInsert.Parameters.AddWithValue("@lastUpdated", DateTime.Now);
                cmdInsert.Parameters.AddWithValue("@created_at", DateTime.Now);

                cmdInsert.ExecuteNonQuery();

                //Close Connection
                con.Close();

                Response.Redirect("display-blogs.aspx");

            }
            catch (Exception error)
            {
                Response.Write("<script>alert('" + error.Message + "');</script>");
            }
        }
    }
}