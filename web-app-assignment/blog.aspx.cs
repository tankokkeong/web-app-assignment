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
            string blogDisplayAdditional = "";
            string blogDisplayCareer = "";

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


            string sqlAdditional = @"SELECT top 5 BP.blog_id, BP.blog_title, BP.blog_content, BP.blog_image, BP.last_updated, BC.category_title FROM BlogPost BP, BlogCategory BC WHERE BC.category_title = 'Additional' AND BP.deleted_at IS NULL AND BP.blog_category_id = BC.blog_category_id";
            SqlCommand cmdAdditional = new SqlCommand(sqlAdditional, con);
            con.Open();

            SqlDataReader drAdditional = cmdAdditional.ExecuteReader();

            while (drAdditional.Read())
            {
                blogDisplayAdditional += string.Format(
                                                    "<div class='swiper-slide'>" +
                                                        "<div class='card' style='width: 100%; height: 100%;'>" +
                                                            "<img src='Uploads/{0}' style='width:100%; height:400px;' class='card-img-top' alt='...'>" +
                                                            "<div class='card-body text-center'>" +
                                                                "<p class='card-text font-weight-bold'>{1}</p>" +
                                                                "<p class='text-muted text-center'>{2}</p>" +
                                                            "</div>" +

                                                                "<div class='card-footer text-muted text-center'>" +
                                                                    "<a href='blog_description.aspx?blog={3}' class='btn btn-info'>Details</a>" +
                                                                "</div>" +
                                                        "</div>" +
                                                    "</div>",drAdditional["blog_image"],drAdditional["blog_title"],drAdditional["last_updated"],drAdditional["blog_id"]);
            }

            drAdditional.Close();
            con.Close();

            string sqlCareer = @"SELECT top 3 BP.blog_id, BP.blog_title, BP.blog_content, BP.blog_image, BP.last_updated, BC.category_title FROM BlogPost BP, BlogCategory BC WHERE BC.category_title = 'Career' AND BP.deleted_at IS NULL AND BP.blog_category_id = BC.blog_category_id";
            SqlCommand cmdCareer = new SqlCommand(sqlCareer, con);
            con.Open();

            SqlDataReader drCareer = cmdCareer.ExecuteReader();

            while (drCareer.Read())
            {
                blogDisplayCareer += string.Format("<div class='col-sm-12 col-md-6 col-lg-4 mt-3'>" +
                                                    "<div class='card' style='width: 100%; height: 100%;'>" +
                                                        "<img src='Uploads/{0}' style='width:100%; height:400px;' class='card-img-top' alt='...'>" +
                                                        "<div class='card-body text-center'>" +
                                                            "<p class='card-text font-weight-bold'>{1}</p>" +
                                                            "<p class='text-muted text-center'>{2}</p>" +
                                                        "</div>" +

                                                            "<div class='card-footer text-muted text-center'>" +
                                                                "<a href='blog_description.aspx?career={3}' class='btn btn-info'>Details</a>" +
                                                            "</div>" +
                                                    "</div>" +
                                                "</div>", drCareer["blog_image"], drCareer["blog_title"],drCareer["last_updated"], drCareer["blog_id"]);
            }
            drCareer.Close();
            con.Close();

            litResultLatest.Text = blogDisplayLatest;
            litResultAdditional.Text = blogDisplayAdditional;
            litResultCareer.Text = blogDisplayCareer;

        }
    }
}