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
    public partial class blog_description : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            string displayLike = "";

            SqlConnection con = new SqlConnection(strcon);

            displayLike += string.Format("<div class='common-list-container'>" +
                                            "<div class='swiper-box'>" +
                                                "<!-- Swiper -->" +
                                                    "<div class='swiper-container sw'>" +
                                                        "<div class='swiper-wrapper'>" +
                                                            "<div class='swiper-slide'>" +
                                                                "<div class='card' style='width: 100%;'>" +
                                                                    "<img src='https://jobmajestic.com/blog/media/2020/09/Malaysian-Fresh-Graduates-Guide-To-Writing-An-Effective-Cover-Letter-Templates-8-Tips-768x512.jpg' class='card-img-top' alt='...'>" +
                                                                    "<div class='card-body text-center'>" +
                                                                        "<p class='card-text font-weight-bold'>Malaysian Fresh Graduate’s Guide to Writing An Effective Cover Letter(Templates + 8 Tips)    </p>" +
                                                                    "</div>" +

                                                                        "<div class='card-footer text-muted text-center'>" +
                                                                            "17 March 2021" +
                                                                        "</div>" +
                                                                "</div>" +
                                                            "</div>" +                    
                                                        "</div>" +                        
                                                    "</div>" +
                    
                                                    "<!-- Add Arrows -->" +
                                                     "<div class='swiper-nav-container'>" +
                                                        "<div class='swiper-button-next swiper-nav-next text-lightgreen'></div>" +
                                                        "<div class='swiper-button-prev swiper-nav-prev text-lightgreen'></div>" +
                                                     "</div>" +
                        
                                            "</div>" +
                                         "</div>");



            litResultLike.Text = displayLike;
        }
    }
}