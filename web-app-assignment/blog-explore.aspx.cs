using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace web_app_assignment
{
    public partial class blog_explore : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            

        }

        protected void DataPager1_PreRender(object sender, EventArgs e)
        {
            string explore = Request.QueryString["explore"] ?? "";

            SqlConnection con = new SqlConnection(strcon);

            if (explore != null)
            {

                string sqlExplore = @"SELECT * FROM BlogCategory BC, BlogPost BP WHERE BP.deleted_at IS NULL AND BP.blog_category_id = BC.blog_category_id AND BC.category_title = '" + explore + "'";
                SqlDataAdapter cmdExplore = new SqlDataAdapter(sqlExplore, con);
                con.Open();



                DataTable dtbl = new DataTable();
                cmdExplore.Fill(dtbl);
                ListView1.DataSource = dtbl;
                ListView1.DataBind();

                con.Close();
            }
        }
    }
}