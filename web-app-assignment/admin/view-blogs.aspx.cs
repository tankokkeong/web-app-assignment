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
    public partial class view_blogs : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        //Create Helper Class
        Helper helper = new Helper();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
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
                string id = Request.QueryString["viewId"] ?? "";

                string sql = "SELECT * FROM BlogPost BP, BlogCategory BC WHERE blog_id = @id AND BP.deleted_at IS NULL AND BP.blog_category_id = BC.blog_category_id";

                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@id", id);

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    txtTitle.Text = dr["blog_title"].ToString();
                    txtSimpleDesc.Text = dr["blog_description"].ToString();
                    imgBlogPhoto.ImageUrl = dr["blog_image"].ToString();
                    txtEditDescription.InnerHtml = dr["blog_content"].ToString();
                    txtCategory.Text = dr["category_title"].ToString();
                    ddlCategory.Items.FindByValue(dr["blog_category_id"].ToString()).Selected = true;
                }

                dr.Close();
                con.Close();

            }
        }
    }
}