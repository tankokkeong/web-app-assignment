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
            string explore = Request.QueryString["explore"] ?? "";

            SqlConnection con = new SqlConnection(strcon);

            if (explore != null)
            {

                string sqlExplore = @"SELECT * FROM BlogCategory BC, BlogPost BP WHERE BP.deleted_at IS NULL AND BP.blog_category_id = BC.blog_category_id AND BC.category_title = @category";
                SqlCommand cmdExplore = new SqlCommand(sqlExplore, con);
                con.Open();

                cmdExplore.Parameters.AddWithValue("@category", explore);
                SqlDataReader drExplore = cmdExplore.ExecuteReader();
                while(drExplore.Read())
                {
                    if (drExplore["category_title"].ToString() == explore)
                    {
                        litResultHeader.Text = "<h3>" + drExplore["category_title"] + "</h3>";

                        litResultBlog.Text += "<div class='col-sm-12 col-md-6 col-lg-4 mt-3'>" +
                                                       "<a href='blog_description.aspx?blog=" + drExplore["blog_id"] + "'>" +
                                                        "<div class='card' style='width: 100%;'>" +
                                                            "<img src='../" + drExplore["blog_image"] + "' style='width:100%; height:300px' class='card-img-top' alt='...'>" +
                                                            "<div class='card-body text-center'>" +
                                                                "<p class='card-text font-weight-bold'>" + drExplore["blog_title"] + "</p>" +
                                                                "<p class='text-muted text-center'>" + drExplore["last_updated"] + "</p>" +
                                                            "</div>" +

                                                            "<div class='card-footer text-muted text-center'>" +
                                                                "<a href='blog_description.aspx?blog=" + drExplore["blog_id"] + "' class='btn bg-lightgreen'>Details</a>" +
                                                            "</div>" +
                                                        "</div>" +
                                                       "</a>" +
                                                    "</div>"+
                                                        "<br/>";
                    }
                }
                
                drExplore.Close();
                con.Close();
            }

        }
    }
}