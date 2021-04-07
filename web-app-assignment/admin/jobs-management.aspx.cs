using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace web_app_assignment.admin
{
    public partial class jobs_management : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ToString();

        protected void Page_Load(object sender, EventArgs e)
        {
            //Open connection
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }

            string sql_jobPosted = "SELECT * FROM JobPost JP, Recruiter R " +
                                   "WHERE JP.recruiter_id = R.recruiter_id " +
                                   "ORDER BY post_id DESC";

            SqlDataAdapter cmd = new SqlDataAdapter(sql_jobPosted, con);

            DataTable dtbl = new DataTable();
            cmd.Fill(dtbl);
            gvJobPosted.DataSource = dtbl;
            gvJobPosted.DataBind();

            //Close Connection
            con.Close();
        }

        protected void gvJobPosted_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvJobPosted.PageIndex = e.NewPageIndex;
            gvJobPosted.DataBind();
        }

        protected void gvJobPosted_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            Dictionary<string, string> UserDetails = (Dictionary<string, string>)Session["Admin"];

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //Query String
                if (UserDetails["Admin_Right"] == "Viewer")
                {
                    e.Row.Cells[7].Text = "<a class='badge badge-success action-btn mr-1'  href='view-jobs-management.aspx?viewId=" + e.Row.Cells[7].Text + "' data-placement='top' title='View'><i class='fas fa-eye'></i></a>";
                }
                else if (UserDetails["Admin_Right"] == "Super Admin" || UserDetails["Admin_Right"] == "Editor")
                {
                    e.Row.Cells[7].Text = "<a class='badge badge-success action-btn mr-1'  href='view-jobs-management.aspx?viewId=" + e.Row.Cells[7].Text + "' data-placement='top' title='View'><i class='fas fa-eye'></i></a>" +
                                     "<span class='badge badge-danger action-btn' data-toggle='modal' data-target='#deletePost' type='button' onclick='deletePost(" + e.Row.Cells[7].Text + ")'><i class='fas fa-trash'></i></span>";
                }
            }
        }
    }
}