using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Net.Mail;
using System.Text;
using System.IO;

namespace web_app_assignment.admin
{
    public partial class admin_management : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            Dictionary<string, string> UserDetails = (Dictionary<string, string>)Session["Admin"];

            if (UserDetails["Admin_Right"] == "Viewer" || UserDetails["Admin_Right"] == "Editor")
            {
                newAdmin.Visible = false;
            }

            if (!Page.IsPostBack)
            {
                SqlConnection con = new SqlConnection(strcon);

                string sql = "SELECT * FROM Admin WHERE deleted_at IS NULL";

                SqlCommand cmd = new SqlCommand(sql, con);

                con.Open();
                SqlDataReader read = cmd.ExecuteReader();

                GridView1.DataSource = read;
                GridView1.DataBind();

                read.Close();
                con.Close();
            }
        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            Dictionary<string, string> UserDetails = (Dictionary<string, string>)Session["Admin"];

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //Query String
                if (UserDetails["Admin_Right"] == "Viewer")
                {
                    e.Row.Cells[4].Text = "<a class='badge badge-success action-btn mr-1'  href='admin-details.aspx?viewId=" + e.Row.Cells[4].Text + "' data-toggle='tooltip' data-placement='top' title='View'><i class='fas fa-eye'></i></a>";
                }
                else if (UserDetails["Admin_Right"] == "Editor")
                {
                    if(e.Row.Cells[3].Text == "Super Admin")
                    {
                        e.Row.Cells[4].Text = "<a class='badge badge-success action-btn mr-1'  href='admin-details.aspx?viewId=" + e.Row.Cells[4].Text + "' data-toggle='tooltip' data-placement='top' title='View'><i class='fas fa-eye'></i></a>";
                    }
                    else
                    {
                        e.Row.Cells[4].Text = "<a class='badge badge-success action-btn mr-1'  href='admin-details.aspx?viewId=" + e.Row.Cells[4].Text + "' data-toggle='tooltip' data-placement='top' title='View'><i class='fas fa-eye'></i></a>" +
                                        "<a class='badge badge-primary action-btn mr-1'  href='admin-details-edit.aspx?editId=" + e.Row.Cells[4].Text + "' data-toggle='tooltip' data-placement='top' title='Edit'><i class='fas fa-edit'></i></a>";
                    }
                }
                else if (UserDetails["Admin_Right"] == "Super Admin")
                {
                    e.Row.Cells[4].Text = "<a class='badge badge-success action-btn mr-1'  href='admin-details.aspx?viewId=" + e.Row.Cells[4].Text + "' data-toggle='tooltip' data-placement='top' title='View'><i class='fas fa-eye'></i></a>" +
                    "<a class='badge badge-primary action-btn mr-1'  href='admin-details-edit.aspx?editId=" + e.Row.Cells[4].Text + "' data-toggle='tooltip' data-placement='top' title='Edit'><i class='fas fa-edit'></i></a>" +
                    "<span class='badge badge-danger action-btn' data-toggle='modal' data-target='#deleteAdmin' onclick='deleteAdmin(" + e.Row.Cells[4].Text + ")'><i class='fas fa-trash'></i></span>";
                }
            }
        }
        protected void btnDeleteAdmin_Click(object sender, EventArgs e)
        {
            Dictionary<string, string> UserDetails = (Dictionary<string, string>)Session["Admin"];

            try
            {
                int admin_id = Convert.ToInt32(txtDeleteAdmin.Text);

                SqlConnection con = new SqlConnection(strcon);

                string sql = "UPDATE Admin SET deleted_at = @deleted_at WHERE admin_id = @admin_id";

                SqlCommand cmd = new SqlCommand(sql, con);

                con.Open();
                cmd.Parameters.AddWithValue("@deleted_at", DateTime.Now);
                cmd.Parameters.AddWithValue("@admin_id", admin_id);

                cmd.ExecuteNonQuery();
                con.Close();

                Response.Redirect("admin-management.aspx");
            }
            catch (Exception error)
            {
                
            }
        }
    }
}