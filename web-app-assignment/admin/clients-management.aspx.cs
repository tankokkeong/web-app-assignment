using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace web_app_assignment.admin
{
    public partial class user_management : System.Web.UI.Page
    {
        //string strcon = ConfigurationManager.ConnectionStrings["con"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!Page.IsPostBack)
            //{
            //    Dictionary<string, string> UserDetails = (Dictionary<string, string>)Session["Admin"];

            //    SqlConnection con = new SqlConnection(strcon);

            //    string sql = "SELECT * FROM Recruiter";

            //    SqlCommand cmd = new SqlCommand(sql, con);

            //    con.Open();
            //    SqlDataReader read = cmd.ExecuteReader();

            //    GridView2.DataSource = read;
            //    GridView2.DataBind();

            //    read.Close();
            //    con.Close();
            //}
        }
        //protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
        //{
        //    if (e.Row.RowType == DataControlRowType.DataRow)
        //    {
        //        //Query String
        //        e.Row.Cells[4].Text = "<a class='badge badge-success action-btn'  href='admin-details.aspx?viewId=" + e.Row.Cells[4].Text + "' data-toggle='tooltip' data-placement='top' title='View'><i class='fas fa-eye'></i></a>" +
        //            "<a class='badge badge-primary action-btn'  href='admin-details.aspx?editId=" + e.Row.Cells[4].Text + "' data-toggle='tooltip' data-placement='top' title='Edit'><i class='fas fa-edit'></i></a>" +
        //            "<button class='badge badge-danger action-btn' data-toggle='modal' data-target='#deleteModal' type='button' onclick='deleteAdmin(" + e.Row.Cells[4].Text + ")'><i class='fas fa-trash'></i></button>";
        //    }
        //}
    }
}