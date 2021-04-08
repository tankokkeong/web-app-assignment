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
    public partial class clients_management : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ToString();

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                //Open connection
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                string sql_jobPosted = "SELECT * FROM JobSeeker WHERE deleted_at IS NULL " +

                                       " ORDER BY seeker_id DESC";

                SqlDataAdapter cmd = new SqlDataAdapter(sql_jobPosted, con);

                DataTable dtbl = new DataTable();
                cmd.Fill(dtbl);
                GridView2.DataSource = dtbl;
                GridView2.DataBind();

                //Close Connection
                con.Close();
            }
            
        }
        protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            Dictionary<string, string> UserDetails = (Dictionary<string, string>)Session["Admin"];

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //Query String
                if (UserDetails["Admin_Right"] == "Viewer")
                {
                    e.Row.Cells[4].Text = "<a class='badge badge-success action-btn mr-1'  href='clients-details.aspx?viewId=" + e.Row.Cells[4].Text + "' data-toggle='tooltip' data-placement='top' title='View'><i class='fas fa-eye'></i></a>";
                }
                else
                {
                    e.Row.Cells[4].Text = "<a class='badge badge-success action-btn mr-1'  href='clients-details.aspx?viewId=" + e.Row.Cells[4].Text + "' data-toggle='tooltip' data-placement='top' title='View'><i class='fas fa-eye'></i></a>" +
                    "<a class='badge badge-primary action-btn mr-1'  href='client-edit.aspx?editId=" + e.Row.Cells[4].Text + "' data-toggle='tooltip' data-placement='top' title='Edit'><i class='fas fa-edit'></i></a>";
                }
            }
        }

        protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView2.PageIndex = e.NewPageIndex;
            GridView2.DataBind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            //Open connection
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }

            string sql = "";

            //Retrive User value
            if(txtUserID.Text != "")
            {
                sql += " AND seeker_id = " + txtUserID.Text;
            }

            if (txtUserEmail.Text != "")
            {
                sql += " AND email LIKE '%" + txtUserEmail.Text + "%'";
            }

            if(ddlUserStatus.SelectedValue != "")
            {
                sql += " AND active = '" + ddlUserStatus.SelectedValue + "'";
            }

            if(txtFromDate.Text != "")
            {
                sql += " AND created_at > '" + txtFromDate.Text + "'";
            }

            if(txtToDate.Text != "")
            {
                sql += " AND created_at < '" + txtToDate.Text + "'";
            }

            string sql_jobPosted = "SELECT * FROM JobSeeker WHERE deleted_at IS NULL " +
                                    sql +
                                   " ORDER BY seeker_id DESC" ;

            SqlDataAdapter cmd = new SqlDataAdapter(sql_jobPosted, con);

            DataTable dtbl = new DataTable();
            cmd.Fill(dtbl);
            GridView2.DataSource = dtbl;
            GridView2.DataBind();

            //Close Connection
            con.Close();
          
        }
    }
}