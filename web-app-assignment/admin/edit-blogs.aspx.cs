using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace web_app_assignment.admin
{
    public partial class edit_blogs : System.Web.UI.Page
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

                //display data from database
                string id = Request.QueryString["Id"] ?? "";

                string sql = "SELECT * FROM BlogPost WHERE blog_id = @Id AND deleted_at IS NULL";

                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@Id", id);

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    txtTitle.Text = dr["blog_title"].ToString();
                    txtSDesc.Text = dr["blog_description"].ToString();
                    imgBlogPhoto.ImageUrl = dr["blog_image"].ToString();
                    txtPhotoUpload.Text = dr["blog_image"].ToString();
                    txtEditDescription.Text = dr["blog_content"].ToString();
                    ddlCategory.Items.FindByValue(dr["blog_category_id"].ToString()).Selected = true;
                }

                dr.Close();
                con.Close();

            }
        }

        protected void btnEditPost_Click(object sender, EventArgs e)
        {
            string id = Request.QueryString["Id"] ?? "";
            string title = txtTitle.Text;
            string desc = txtSDesc.Text;
            string content = HttpUtility.UrlDecode(txtEditDescription.Text);
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

            SqlConnection con = new SqlConnection(strcon);

            string sqlEdit = @"UPDATE BlogPost SET blog_title = @title, blog_description = @blogDesc, blog_content = @content, 
                              blog_image = @image, blog_category_id = @categoryID, edited_by = @editBy, 
                              last_updated = @last_updated WHERE blog_id = @Id";

            SqlCommand cmdEdit = new SqlCommand(sqlEdit, con);
            con.Open();

            //Insert parameters
            cmdEdit.Parameters.AddWithValue("@Id", id);
            cmdEdit.Parameters.AddWithValue("@title", title);
            cmdEdit.Parameters.AddWithValue("@blogDesc", desc);
            cmdEdit.Parameters.AddWithValue("@content", content);
            cmdEdit.Parameters.AddWithValue("@image", blog_photo);
            cmdEdit.Parameters.AddWithValue("@categoryID", category_id);
            cmdEdit.Parameters.AddWithValue("@editBy", admin_id);
            cmdEdit.Parameters.AddWithValue("@last_updated", DateTime.Now);

            cmdEdit.ExecuteNonQuery();

            //Close Connection
            con.Close();

            Response.Redirect("display-blogs.aspx");
        }
    }
}