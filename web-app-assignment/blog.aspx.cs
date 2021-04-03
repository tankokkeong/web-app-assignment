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

            SqlConnection con = new SqlConnection(strcon);

            string sqlLatest = @"SELECT top 3 blog_title, blog_content, blog_image,last_updated FROM BlogPost WHERE deleted_at IS NULL ORDER BY created_at DESC";
            SqlCommand cmdLatest = new SqlCommand(sqlLatest, con);
            con.Open();

            SqlDataReader drLatest = cmdLatest.ExecuteReader();

            while (drLatest.Read())
            {
                litResultLatest.Text +=
                                        "<div class='latest-list-container'>" +
                                            "<div class='row latest-list-row'>" +

                                                "<div class='col-5'>" +
                                                    "<div class='list-thumbnail'>" +
                                                        "<img src='Uploads/" + drLatest["blog_image"] + "' style='width:100%; height:200px;' class='list-thumbnail-pic'/>" +
                                                    "</div>" +
                                                "</div>" +

                                                "<div class='col-7'>" +
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

            int row_count = 1;

            while (drHeader.Read())
            {
                litResultBlog.Text += "<div class='blog-category common-category'>" +
                                          "<div class='common-cat-title mb-3 row'>" +
                                              "<div class='col-6'>" +
                                                  "<h3>" + drHeader["category_title"] + "</h3>" +
                                              "</div>" +

                                              "<div class='col-6'>" +
                                                  "<div class='explore-more-container text-right text-lightgreen'>" +
                                                      "<a href='blog-explore.aspx?explore="+ drHeader["category_title"] +"'>Explore More ></a>" +
                                                  "</div>" +
                                              "</div>" +
                                          "</div>" +

                                                "<div class='common-list-container'>" +
                                                    "<div id ='carouselExampleControls" + row_count + "' class='carousel slide' data-ride='carousel'>" +
                                                        "<div class='carousel-inner'>";


                getCategoryID(drHeader["blog_category_id"].ToString());

                litResultBlog.Text += "</div>" +
                                       "<a class='carousel-control-prev' href='#carouselExampleControls" + row_count + "' role='button' data-slide='prev'>" +
                                            "<span class='carousel-control-prev-icon' aria-hidden='true'><i class='fas fa-arrow-circle-left text-lightgreen custom-slider-control-left'></i></span>" +
                                            "<span class='sr-only'>Previous</span>" +
                                        "</a>" +

                                        "<a class='carousel-control-next' href='#carouselExampleControls"+ row_count +"' role='button' data-slide='next'>" +
                                            "<span class='carousel-control-next-icon' aria-hidden='true'><i class='fas fa-arrow-circle-right text-lightgreen custom-slider-control-left'></i></span>" +
                                            "<span class='sr-only'>Next</span>" +
                                        "</a>"+
                                      "</div>" +
                                    "</div>" +
                                "</div>";

                //Increase the row count
                row_count++;

            }
            drHeader.Close();
            con.Close();
        }

        protected void getCategoryID(string blogCategoryId)
        {

            SqlConnection con = new SqlConnection(strcon);

            string sqlCategory = "SELECT TOP 6 * FROM BlogPost WHERE blog_category_id ='" + blogCategoryId + "' AND deleted_at IS NULL ORDER BY blog_id DESC";
            SqlCommand cmdCategory = new SqlCommand(sqlCategory, con);
            con.Open();
            SqlDataReader drCategory = cmdCategory.ExecuteReader();

            int total_category = getCategoryCount(blogCategoryId);
            int row_count = 1;

            while (drCategory.Read())
            {
                if(row_count == 1 || row_count % 4 == 0)
                {
                    if(row_count == 1)
                    {
                        litResultBlog.Text += "<div class='carousel-item active'>" +
                                                "<div class='row'>";
                    }
                    else
                    {
                        litResultBlog.Text += "<div class='carousel-item'>" +
                                                 "<div class='row'>";
                    }
                }

                if(row_count == total_category)
                {
                    litResultBlog.Text += "<div class='col-lg-4'>" +
                                            "<div class='card'>" +
                                                 "<img src='../Uploads/" + drCategory["blog_image"] + "' class='card-img-top' alt='...'>" +
                                                 "<div class='card-body text-center'>" +
                                                     "<p class='card-text font-weight-bold'>" + drCategory["blog_title"] + "</p>" +
                                                     "<p class='text-muted text-center'>" + drCategory["last_updated"] + "</p>" +
                                                 "</div>" +

                                                 "<div class='card-footer text-muted text-center'>" +
                                                      "<a href='blog_description.aspx?blog=" + drCategory["blog_id"] + "' class='btn bg-lightgreen'>Details</a>" +
                                                 "</div>" +
                                            "</div>" +
                                          "</div>" +

                                        "</div>" +
                                      "</div>";
                }
                else if(row_count % 3 == 0)
                {
                    litResultBlog.Text += "<div class='col-lg-4'>" +
                                            "<div class='card'>" +
                                                 "<img src='../Uploads/" + drCategory["blog_image"] + "' class='card-img-top' alt='...'>" +
                                                 "<div class='card-body text-center'>" +
                                                     "<p class='card-text font-weight-bold'>" + drCategory["blog_title"] + "</p>" +
                                                     "<p class='text-muted text-center'>" + drCategory["last_updated"] + "</p>" +
                                                 "</div>" +

                                                 "<div class='card-footer text-muted text-center'>" +
                                                      "<a href='blog_description.aspx?blog=" + drCategory["blog_id"] + "' class='btn bg-lightgreen'>Details</a>" +
                                                 "</div>" +
                                            "</div>" +
                                          "</div>" +

                                        "</div>" +
                                      "</div>";
                }
                else
                {
                    litResultBlog.Text += "<div class='col-lg-4'>" +
                                               "<div class='card'>" +
                                                    "<img src='../Uploads/" + drCategory["blog_image"] + "' class='card-img-top' alt='...'>" +
                                                    "<div class='card-body text-center'>" +
                                                        "<p class='card-text font-weight-bold'>" + drCategory["blog_title"] + "</p>" +
                                                        "<p class='text-muted text-center'>" + drCategory["last_updated"] + "</p>" +
                                                    "</div>" +

                                                    "<div class='card-footer text-muted text-center'>" +
                                                         "<a href='blog_description.aspx?blog=" + drCategory["blog_id"] + "' class='btn bg-lightgreen'>Details</a>" +
                                                    "</div>" +
                                               "</div>" +
                                            "</div>";
                }
                

                //Increase the row count
                row_count++;
            }
            con.Close();
            drCategory.Close();

        }

        protected int getCategoryCount(string blogCategoryId)
        {
            SqlConnection con = new SqlConnection(strcon);

            con.Open();

            string sqlCategory = "SELECT COUNT (*) FROM BlogPost WHERE blog_category_id ='" + blogCategoryId + "' AND deleted_at IS NULL";

            SqlCommand cmd = new SqlCommand(sqlCategory, con);


            int total_category = Convert.ToInt32(cmd.ExecuteScalar());

            return total_category;
        }

    }
}