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

            SqlConnection con = new SqlConnection(strcon);

                blogDisplayLatest += string.Format("<div class='col-sm-12 col-lg-6'>" +
                                                        "<div class='left-latest'>" +
                                                           "<div class='left-thumbnail-container'>" +
                                                                "<img src='https://jobmajestic.com/blog/media/2021/03/Cover-Ultimate-Elevator-Pitch-CH-768x512.jpg' id='latest-thumbnail'/>" +
                                                            "</div>" +
                                                            
                                                            "<div class='left-latest-title mt-3'>" +
                                                                "<h2>毕业生自我推荐(Elevator Pitch)讲稿指南 (附上5个贴士)</h2>" +
                                                            "</div>" +

                                                            "<div class='left-latest-readmore text-lightgreen mt-3'>" +
                                                                "Read More >>" +
                                                            "</div>" +

                                                        "</div>" +
                                                    "</div>" +

                                                    "<div class='col-sm-12 col-lg-6'>" +
                                                        "<div class='right-latest'>" +
                                                            "<div class='right-latest-title'>" +
                                                                "<h3>Latest</h3>" +
                                                            "</div>" +

                                                            "<div class='right-latest-list'>" +
                                                                "<div class='latest-list-container'>" +
                                                                    "<div class='row latest-list-row'>" +
                                                                        "<div class='col-5 '>" +
                                                                            "<div class='list-thumbnail'>" +
                                                                                "<img src='https://jobmajestic.com/blog/media/2021/03/Cover-Ultimate-Elevator-Pitch-CH-768x512.jpg' class='list-thumbnail-pic'/>" +
                                                                            "</div>" +
                                                                        "</div>" +

                                                                        "<div class='col-7 '>" +
                                                                            "<div class='latest-list-title'>" +
                                                                                "<h5>The Ultimate Elevator Pitch for Fresh Graduates</h5>" +
                                                                            "</div>" +

                                                                            "<div class='latest-list-description'>" +
                                                                                "<h6 class='text-secondary'>What is an elevator pitch? Why is it important for</h6>" +
                                                                            "</div>" +
                                                                        "</div>" +
                                                                    "</div>" +
                                                                "</div>" +
                                                            "</div>");


            litResultLatest.Text = blogDisplayLatest;
        }
    }
}