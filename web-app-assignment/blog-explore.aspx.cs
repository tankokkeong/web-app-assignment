using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace web_app_assignment
{
    public partial class blog_explore : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            string additional = Request.QueryString["additional"] ?? "";
            string career = Request.QueryString["career"] ?? "";
            string category = Request.QueryString["category"] ?? "";

            string blogHeader = litResultHeader.Text;
            string blogContent = litResultBlog.Text;

            SqlConnection con = new SqlConnection(strcon);

            if (additional == "display")
            {
                string catAdd = "additional";
                string sqlAdditional = @"SELECT * FROM BlogCategory BC, BlogPost BP WHERE BP.deleted_at IS NULL AND BP.blog_category_id = BC.blog_category_id AND BC.category_title = @category";
                SqlCommand cmdAdditional = new SqlCommand(sqlAdditional, con);
                con.Open();

                cmdAdditional.Parameters.AddWithValue("@category", catAdd);
                SqlDataReader drAdditional = cmdAdditional.ExecuteReader();

                while (drAdditional.Read())
                {
                    blogHeader = string.Format("<h3>{0}</h3>",drAdditional["category_title"]);

                    blogContent += string.Format("<div class='col-sm-12 col-md-6 col-lg-4 mt-3'>" +
                                                    "<div class='card' style='width: 100%;'>" +
                                                        "<img src='../Uploads/{0}' class='card-img-top' alt='...'>" +
                                                            "<div class='card-body text-center'>" +
                                                                "<p class='card-text font-weight-bold'>{1}</p>" +
                                                                "<p class='text-muted text-center'>{2}</p>" +
                                                            "</div>" +
                                                            "<div class='card-footer text-muted text-center'>" +
                                                                "<a href='blog_description.aspx?blog={3}' class='btn btn-info'>Details</a>" +
                                                            "</div>" +
                                                    "</div>" +
                                                "</div>",drAdditional["blog_image"], drAdditional["blog_title"], drAdditional["last_updated"], drAdditional["blog_id"]);
                }
                drAdditional.Close();
                con.Close();
            }
            else if (career == "display")
            {
                string catCar = "career";
                string sqlCareer = @"SELECT * FROM BlogCategory BC, BlogPost BP WHERE BP.deleted_at IS NULL AND BP.blog_category_id = BC.blog_category_id AND BC.category_title = @category";
                SqlCommand cmdCareer = new SqlCommand(sqlCareer, con);
                con.Open();

                cmdCareer.Parameters.AddWithValue("@category", catCar);
                SqlDataReader drCareer = cmdCareer.ExecuteReader();

                while (drCareer.Read())
                {
                    blogHeader = string.Format("<h3>{0}</h3>", drCareer["category_title"]);

                    blogContent += string.Format("<div class='col-sm-12 col-md-6 col-lg-4 mt-3'>" +
                                                    "<div class='card' style='width: 100%;'>" +
                                                        "<img src='../Uploads/{0}' class='card-img-top' alt='...'>" +
                                                            "<div class='card-body text-center'>" +
                                                                "<p class='card-text font-weight-bold'>{1}</p>" +
                                                                "<p class='text-muted text-center'>{2}</p>" +
                                                            "</div>" +
                                                            "<div class='card-footer text-muted text-center'>" +
                                                                "<a href='blog_description.aspx?blog={3}' class='btn btn-info'>Details</a>" +
                                                            "</div>" +
                                                    "</div>" +
                                                "</div>", drCareer["blog_image"], drCareer["blog_title"], drCareer["last_updated"], drCareer["blog_id"]);
                }
                drCareer.Close();
                con.Close();
            }
            else if (category != null)
            {
                string sqlCategory = @"SELECT * FROM BlogCategory BC, BlogPost BP WHERE BP.deleted_at IS NULL AND BP.blog_category_id = BC.blog_category_id AND BC.blog_category_id = @id";
                SqlCommand cmdCategory = new SqlCommand(sqlCategory, con);
                con.Open();

                cmdCategory.Parameters.AddWithValue("@id", category);
                SqlDataReader drCategory = cmdCategory.ExecuteReader();

                while (drCategory.Read())
                {
                    blogHeader = string.Format("<h3>{0}</h3>", drCategory["category_title"]);

                    blogContent += string.Format("<div class='col-sm-12 col-md-6 col-lg-4 mt-3'>" +
                                                    "<div class='card' style='width: 100%;'>" +
                                                        "<img src='../Uploads/{0}' class='card-img-top' alt='...'>" +
                                                            "<div class='card-body text-center'>" +
                                                                "<p class='card-text font-weight-bold'>{1}</p>" +
                                                                "<p class='text-muted text-center'>{2}</p>" +
                                                            "</div>" +
                                                            "<div class='card-footer text-muted text-center'>" +
                                                                "<a href='blog_description.aspx?blog={3}' class='btn btn-info'>Details</a>" +
                                                            "</div>" +
                                                    "</div>" +
                                                "</div>", drCategory["blog_image"], drCategory["blog_title"], drCategory["last_updated"], drCategory["blog_id"]);
                }
                drCategory.Close();
                con.Close();
            }

            litResultHeader.Text = blogHeader;
            litResultBlog.Text = blogContent;
        }
    }
}