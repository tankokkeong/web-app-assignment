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

            string displayHeader = "";
            string displayLike = "";
            
            SqlConnection con = new SqlConnection(strcon);

            //Blog description Header
            var blog_id = Request.QueryString["blog"] ?? "";

            string sqlHeader = @"SELECT blog_title FROM BlogPost WHERE deleted_at IS NULL AND blog_id = @blog_id";
            SqlCommand cmdHeader = new SqlCommand(sqlHeader, con);
            cmdHeader.Parameters.AddWithValue("@blog_id", blog_id);

            con.Open();
            SqlDataReader drHeader = cmdHeader.ExecuteReader();

            if(drHeader.Read())
            {
                displayHeader += string.Format("<h2>{0}</h2>",drHeader["blog_title"]);
            }
            drHeader.Close();

            //Blog Description Content
            



            string sqlLike = @"SELECT top 5 blog_id, blog_title, blog_content, blog_image, last_updated FROM BlogPost WHERE deleted_at IS NULL ORDER BY blog_id DESC";

            SqlCommand cmdLike = new SqlCommand(sqlLike, con);

            SqlDataReader drLike = cmdLike.ExecuteReader();

            while (drLike.Read())
            {
                displayLike += string.Format("<div class='swiper-slide'>" +
                                             "<div class='card' style='width: 100%;'>" +
                                                 "<img src='Uploads/{0}' style='width:100%; height:300px' class='card-img-top' alt='...'>" +
                                                 "<div class='card-body text-center'>" +
                                                     "<p class='card-text font-weight-bold'>{1}</p>" +
                                                     "<p class='text-muted text-center'>{2}</p>" +
                                                 "</div>" +

                                                     "<div class='card-footer text-muted text-center'>" +
                                                        "<a href='blog_description.aspx?like={3}' class='btn btn-info'>Details</a>" +
                                                     "</div>" +
                                             "</div>" +
                                         "</div>",drLike["blog_image"],drLike["blog_title"],drLike["last_updated"],drLike["blog_id"]);
            }

            drLike.Close();
            con.Close();

            litResultHeader.Text = displayHeader;
            litResultLike.Text = displayLike;
            
        }
    }
}