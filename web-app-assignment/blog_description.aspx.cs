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
            string sqlContent = @"SELECT * FROM BlogPost WHERE blog_id = @blog_id AND deleted_at IS NULL";

            SqlCommand cmdContent = new SqlCommand(sqlContent, con);
            cmdContent.Parameters.AddWithValue("@blog_id", blog_id);

            SqlDataReader drContent = cmdContent.ExecuteReader();
            while(drContent.Read())
            {
                lblDescription.Text = drContent["blog_content"].ToString();
            }
            drContent.Close();

            string sqlLike = @"SELECT top 5 blog_id, blog_title, blog_content, blog_image, last_updated FROM BlogPost WHERE deleted_at IS NULL ORDER BY blog_id DESC";

            SqlCommand cmdLike = new SqlCommand(sqlLike, con);

            SqlDataReader drLike = cmdLike.ExecuteReader();

            while (drLike.Read())
            {
                litResultLike.Text += "<div class='swiper-slide'>" +
                                             "<div class='card' style='width: 100%;'>" +
                                             "<a href='blog_description.aspx?blog=" + drLike["blog_id"] + "'>" +
                                                 "<img src='../" + drLike["blog_image"] +"' style='width:100%; height:300px' class='card-img-top' alt='...'>" +
                                                 "<div class='card-body text-center'>" +
                                                     "<p class='card-text font-weight-bold'>"+ drLike["blog_title"] +"</p>" +
                                                     "<p class='text-muted text-center'>"+ drLike["last_updated"] +"</p>" +
                                                 "</div>" +

                                                     "<div class='card-footer text-muted text-center'>" +
                                                        "<a href='blog_description.aspx?blog="+ drLike["blog_id"] +"' class='btn btn-info'>Details</a>" +
                                                     "</div>" +
                                             "</a>" +
                                             "</div>" +
                                         "</div>";
            }

            drLike.Close();
            con.Close();

            litResultHeader.Text = displayHeader;
            
        }
    }
}