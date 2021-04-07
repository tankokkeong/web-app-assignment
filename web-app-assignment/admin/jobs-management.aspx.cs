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
                                   "AND JP.deleted_at IS NULL " +
                                   "AND JP.deleted_by_admin IS NULL " +
                                   jobSearchQuery() +
                                   " ORDER BY post_id DESC";

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
                                     "<span class='badge badge-danger action-btn' data-toggle='modal' data-target='#JobDeleteModal' type='button' onclick='deleteJob(" + e.Row.Cells[7].Text + ")'><i class='fas fa-trash'></i></span>";
                }
            }
        }

        protected void btnRemoveJob_Click(object sender, EventArgs e)
        {
            //Open connection
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }

            string sql_jobDeleted = "UPDATE JobPost " +
                                    "SET deleted_by_admin = @deleted_by_admin, "+
                                    "deleted_reason = @deleted_reason " +
                                    "WHERE post_id = @post_id";

            SqlCommand cmdDelete = new SqlCommand(sql_jobDeleted, con);

            //Insert parameters
            cmdDelete.Parameters.AddWithValue("@deleted_by_admin", DateTime.Now);
            cmdDelete.Parameters.AddWithValue("@deleted_reason", ddlReasonSuspended.SelectedValue);
            cmdDelete.Parameters.AddWithValue("@post_id", hfJobID.Value);

            //Execute the queries
            cmdDelete.ExecuteNonQuery();
            con.Close();

            Response.Redirect("jobs-management.aspx?deleted");
        }

        protected string jobSearchQuery()
        {
            string sql = "";

            //Retrieve Query Strings
            string post_id = Request.QueryString["post_id"] ?? "";
            string job_type = Request.QueryString["job_type"] ?? "";
            string company_id = Request.QueryString["company_id"] ?? "";
            string company_name = Request.QueryString["company_name"] ?? "";
            string from_date = Request.QueryString["from"] ?? "";
            string to_date = Request.QueryString["to"] ?? "";



            if (post_id != "")
            {
                sql += " AND post_id =" + post_id;
            }

            if (job_type != "")
            {
                sql += " AND job_type ='" + job_type + "'";
            }

            if (company_id != "")
            {
                sql += " AND JP.recruiter_id ='" + company_id + "'";
            }

            if (company_name != "")
            {
                sql += " AND company_name LIKE '%" + company_name + "%'";
            }


            if (from_date != "")
            {
               sql += " AND JP.created_at > '" + from_date + "'";
            }

            if (to_date != "")
            {
               sql += " AND JP.created_at < '" + to_date + "'";
            }

            return sql;
        }
    }
}