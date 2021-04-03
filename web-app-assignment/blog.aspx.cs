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
    public partial class blog : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            string blogDisplayLatest = "";
            string blogDisplayBlog = "";

            SqlConnection con = new SqlConnection(strcon);

            string sqlLatest = @"SELECT top 3 blog_title, blog_content, blog_image,last_updated FROM BlogPost WHERE deleted_at IS NULL ORDER BY created_at DESC";
            SqlCommand cmdLatest = new SqlCommand(sqlLatest, con);
            con.Open();

            SqlDataReader drLatest = cmdLatest.ExecuteReader();

            while (drLatest.Read())
            {
                litResultBlog.Text +=
                                        "<div class='latest-list-container'>" +
                                            "<div class='row latest-list-row'>" +
                                                "<div class='col-5 '>" +
                                                    "<div class='list-thumbnail'>" +
                                                        "<img src='Uploads/" + drLatest["blog_image"] + "' style='width:100%; height:200px;' class='list-thumbnail-pic'/>" +
                                                    "</div>" +
                                                "</div>" +

                                                "<div class='col-7 '>" +
                                                    "<div class='latest-list-title'>" +
                                                        "<h5>" + drLatest["blog_title"] +"</h5>" +
                                                    "</div>" +

                                                    "<div class='latest-list-description'>" +
                                                        "<h6 class='text-secondary'>"+drLatest["blog_content"]+"</h6>" +
                                                    "</div>" +
                                                "</div>" +
                                            "</div>" +
                                        "</div>";

            }
            drLatest.Close();
            con.Close();


            string sqlHeader = @"SELECT * FROM BlogCategory WHERE deleted_at IS NULL";
            
            SqlCommand cmdHeader = new SqlCommand(sqlHeader, con);
            con.Open();
            SqlDataReader drHeader = cmdHeader.ExecuteReader();

            while (drHeader.Read())
            {
                litResultBlog.Text += "<div class='blog-category common-category'>" +
                                          "<div class='common-cat-title mb-3 row'>" +
                                              "<div class='col-6'>" +
                                                  "<h3>"+drHeader["category_title"]+"</h3>"+
                                              "</div>" +
                
                                              "<div class='col-6'>" +
                                                  "<div class='explore-more-container text-right text-lightgreen'>" +
                                                      "<a href='blog-explore.aspx?additional=display'>Explore More ></a>" +
                                                  "</div>" +
                                              "</div>" +
                                      "</div>" +

                                                "<div class='common-list-container'>" +
                                                    "<div class='swiper-box'>" +
                                                        "<div class='swiper-container sw'>" +
                                                            "<div class='swiper-wrapper'>" +
                                                                "<div class='swiper-slide'>" +
                                                                    "<div class='card' style='width: 100%;'>";

                getCategoryID(drHeader["blog_category_id"].ToString());

                litResultBlog.Text +=
                                                                         
                                                                    "</div>" +
                                                                "</div>" +
                                                            "</div>" +
                                                        "</div>" +
                                                    "</div>" +
                                                 "</div>";

            }
            drHeader.Close();
            con.Close();

        }

        protected void getCategoryID(string blogCategoryId)
        {

            SqlConnection con = new SqlConnection(strcon);

            string sqlCategory = "SELECT * FROM BlogPost WHERE blog_category_id ='" + blogCategoryId + "' AND deleted_at IS NULL";
            SqlCommand cmdCategory = new SqlCommand(sqlCategory, con);
            con.Open();
            SqlDataReader drCategory = cmdCategory.ExecuteReader();

            while (drCategory.Read())
            {
                litResultBlog.Text += "<img src='../Uploads/" + drCategory["blog_image"] + "' class='card-img-top' alt='...'>" +
                                     "<div class='card-body text-center'>" +
                                         "<p class='card-text font-weight-bold'>" + drCategory["blog_title"] + "</p>" +
                                         "<p class='text-muted text-center'>" + drCategory["last_updated"] + "</p>" +
                                     "</div>" +

                                     "<div class='card-footer text-muted text-center'>" +
                                          "<a href='blog_description.aspx?blog=" + drCategory["blog_id"] + "' class='btn bg-lightgreen'>Details</a>" +
                                     "</div>";
            }
            con.Close();
            drCategory.Close();

        }

    }
}