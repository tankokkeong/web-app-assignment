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
            if (!Page.IsPostBack)
            {
                Dictionary<string, string> UserDetails = (Dictionary<string, string>)Session["User"];

                SqlConnection con = new SqlConnection(strcon);

                string sql = "SELECT TOP 50 * FROM JobSeeker WHERE deleted_at IS NULL";

                SqlCommand cmd = new SqlCommand(sql, con);

                con.Open();
                SqlDataReader read = cmd.ExecuteReader();

                GridView2.DataSource = read;
                GridView2.DataBind();

                read.Close();
                con.Close();
            }
        }
        protected void GridView3_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            Dictionary<string, string> RecruiterDetails = (Dictionary<string, string>)Session["Recruiter"];
            Dictionary<string, string> UserDetails = (Dictionary<string, string>)Session["Admin"];

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //Query String
                if (UserDetails["Admin_Right"] == "Viewer")
                {
                    e.Row.Cells[3].Text = "<a class='badge badge-success action-btn mr-1'  href='clients-details-r.aspx?viewId=" + e.Row.Cells[3].Text + "' data-toggle='tooltip' data-placement='top' title='View'><i class='fas fa-eye'></i></a>";
                }
                else
                {
                    e.Row.Cells[3].Text = "<a class='badge badge-success action-btn mr-1'  href='clients-details-r.aspx?viewId=" + e.Row.Cells[3].Text + "' data-toggle='tooltip' data-placement='top' title='View'><i class='fas fa-eye'></i></a>" +
                     "<a class='badge badge-primary action-btn mr-1'  href='clients-details-r.aspx?editId=" + e.Row.Cells[3].Text + "' data-toggle='tooltip' data-placement='top' title='Edit'><i class='fas fa-edit'></i></a>";
                }
            }
        }
        protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            Dictionary<string, string> RecruiterDetails = (Dictionary<string, string>)Session["Recruiter"];
            Dictionary<string, string> UserDetails = (Dictionary<string, string>)Session["Admin"];

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //Query String
                if (UserDetails["Admin_Right"] == "Viewer")
                {
                    e.Row.Cells[3].Text = "<a class='badge badge-success action-btn mr-1'  href='clients-details.aspx?viewId=" + e.Row.Cells[3].Text + "' data-toggle='tooltip' data-placement='top' title='View'><i class='fas fa-eye'></i></a>";
                }
                else
                {
                    e.Row.Cells[3].Text = "<a class='badge badge-success action-btn mr-1'  href='clients-details.aspx?viewId=" + e.Row.Cells[3].Text + "' data-toggle='tooltip' data-placement='top' title='View'><i class='fas fa-eye'></i></a>" +
                    "<a class='badge badge-primary action-btn mr-1'  href='clients-details.aspx?editId=" + e.Row.Cells[3].Text + "' data-toggle='tooltip' data-placement='top' title='Edit'><i class='fas fa-edit'></i></a>";
                }
            }
        }

        //protected void btnEditUser_Click(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        Dictionary<string, string> UserDetails = (Dictionary<string, string>)Session["User"];

        //        int seeker_id = Convert.ToInt32(txtEditUser.Text);

        //        SqlConnection con = new SqlConnection(strcon);

        //        string sql = "SELECT * FROM JobSeeker WHERE seeker_id = @id AND deleted_at IS NULL";

        //        SqlCommand cmd = new SqlCommand(sql, con);

        //        con.Open();
        //        cmd.Parameters.AddWithValue("@seeker_id", seeker_id);

        //        //UserStatus.Text = "";
        //        //if (Active.Selected)
        //        //{
        //        //    UserStatus.Text = "This user is currently " + Active.Text;
        //        //}
        //        //else if (Inactive.Checked)
        //        //{
        //        //    userID.Text = "This user is currently " + Inactive.Text;
        //        //}

        //        cmd.ExecuteNonQuery();
        //        con.Close();

        //        Response.Redirect("clients-management.aspx");
        //    }
        //    catch (Exception error)
        //    {

        //    }
        //}
    }
}