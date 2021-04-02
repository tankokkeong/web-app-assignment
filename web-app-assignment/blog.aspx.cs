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
                blogDisplayLatest += string.Format(
                                                "<div class='latest-list-container'>" +
                                                    "<div class='row latest-list-row'>" +
                                                        "<div class='col-5 '>" +
                                                            "<div class='list-thumbnail'>" +
                                                                "<img src='Uploads/{0}' style='width:100%; height:200px;' class='list-thumbnail-pic'/>" +
                                                            "</div>" +
                                                        "</div>" +

                                                        "<div class='col-7 '>" +
                                                            "<div class='latest-list-title'>" +
                                                                "<h5>{1}</h5>" +
                                                            "</div>" +

                                                            "<div class='latest-list-description'>" +
                                                                "<h6 class='text-secondary'>{2}</h6>" +
                                                            "</div>" +
                                                        "</div>" +
                                                    "</div>" +
                                                "</div>", drLatest["blog_image"], drLatest["blog_title"], drLatest["blog_content"]);
            }
            drLatest.Close();
            con.Close();


            string sqlHeader = @"SELECT * FROM ( SELECT BP.blog_content, BP.blog_category_id, BP.blog_title, BP.blog_image, 
                                BP.created_at, BP.blog_id, BC.category_title, BP.last_updated,
                                ROW_NUMBER() over(partition by BP.blog_category_id ORDER BY BP.blog_id DESC) as blog_row
                                FROM BlogPost BP, BlogCategory BC 
                                WHERE BP.blog_category_id = BC.blog_category_id) as t
                                WHERE t.blog_row <= 6";
            
            SqlCommand cmdHeader = new SqlCommand(sqlHeader, con);
            con.Open();

            SqlDataReader drHeader = cmdHeader.ExecuteReader();

            string preCategory = "";
            while (drHeader.Read())
            {
                if(preCategory == drHeader["category_title"].ToString())
                {
                    blogDisplayBlog += string.Format(
                                                        "<div class='blog-category common-category'>" +
                                                            "<div class='common-cat-title mb-3 row'>" +
                                                                "<div class='col-6'>" +
                                                                    "<h3>{0}</h3>" +
                                                                "</div>" +

                                                                "<div class='col-6'>" +
                                                                    "<div class='explore-more-container text-right text-lightgreen'>" +
                                                                        "<a href='blog-explore.aspx?category={1}'> Explore More ></a>" +
                                                                    "</div>" +
                                                                "</div>" +
                                                        "</div>" +

                                                        "<div class='common-list-container'>" +
                                                            "<div class='swiper-box'>" +
                                                                "<div class='swiper-container sw'>" +
                                                                    "<div class='swiper-wrapper'>" +
                                                                        "<div class='swiper-slide'>" +
                                                                            "<div class='card' style='width: 100%;'>" +
                                                                                "<img src='../Uploads/{2}' class='card-img-top' alt='...'>" +
                                                                                "<div class='card-body text-center'>" +
                                                                                    "<p class='card-text font-weight-bold'>{3}</p>" +
                                                                                    "<p href='{4}' class='text-muted text-center'>{4}</p>" +
                                                                                "</div>" +

                                                                                "<div class='card-footer text-muted text-center'>" +
                                                                                    "<a href='blog_description.aspx?blog={5}' class='btn bg-lightgreen'>Details</a>" +
                                                                                "</div>" +
                                                                            "</div>" +
                                                                        "</div>" +
                                                                    "</div>" +
                                                                "</div>" +
                                                            "</div>" +
                                                        "</div>" +
                                                    "</div>", drHeader["category_title"], drHeader["category_title"], drHeader["blog_image"], drHeader["blog_title"], drHeader["last_updated"], drHeader["blog_id"]);
                }
                else
                {
                    blogDisplayBlog += string.Format(
                                                        "<div class='blog-category common-category'>" +
                                                            "<div class='common-cat-title mb-3 row'>" +
                                                                "<div class='col-6'>" +
                                                                    "<h3>{0}</h3>" +
                                                                "</div>" +

                                                                "<div class='col-6'>" +
                                                                    "<div class='explore-more-container text-right text-lightgreen'>" +
                                                                        "<a href='blog-explore.aspx?category={1}'> Explore More ></a>" +
                                                                    "</div>" +
                                                                "</div>" +
                                                        "</div>" +

                                                        "<div class='common-list-container'>" +
                                                            "<div class='swiper-box'>" +
                                                                "<div class='swiper-container sw'>" +
                                                                    "<div class='swiper-wrapper'>" +
                                                                        "<div class='swiper-slide'>" +
                                                                            "<div class='card' style='width: 100%;'>" +
                                                                                "<img src='../Uploads/{2}' class='card-img-top' alt='...'>" +
                                                                                "<div class='card-body text-center'>" +
                                                                                    "<p class='card-text font-weight-bold'>{3}</p>" +
                                                                                    "<p href='{4}' class='text-muted text-center'>{4}</p>" +
                                                                                "</div>" +

                                                                                "<div class='card-footer text-muted text-center'>" +
                                                                                    "<a href='blog_description.aspx?blog={5}' class='btn bg-lightgreen'>Details</a>" +
                                                                                "</div>" +
                                                                            "</div>" +
                                                                        "</div>" +
                                                                    "</div>" +
                                                                "</div>" +
                                                            "</div>" +
                                                        "</div>" +
                                                    "</div>", drHeader["category_title"], drHeader["category_title"], drHeader["blog_image"], drHeader["blog_title"], drHeader["last_updated"], drHeader["blog_id"]);
                }
                
            }

            drHeader.Close();
            con.Close();

            litResultLatest.Text = blogDisplayLatest;
            litResultBlog.Text = blogDisplayBlog;

        }
    }
}