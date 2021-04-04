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
    public partial class clients_management_r : System.Web.UI.Page
    {
        //string strcon = ConfigurationManager.ConnectionStrings["con"].ToString();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                this.BindGrid();
                //Dictionary<string, string> RecruiterDetails = (Dictionary<string, string>)Session["Recruiter"];

                //SqlConnection con = new SqlConnection(strcon);

                //string sql = "SELECT TOP 50 * FROM Recruiter WHERE deleted_at IS NULL";

                //SqlCommand cmd = new SqlCommand(sql, con);

                //con.Open();
                //SqlDataReader read = cmd.ExecuteReader();

                //GridView3.DataSource = read;
                //GridView3.DataBind();

                //read.Close();
                //con.Close();
            }
        }

        private void BindGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["constr"].ToString();
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT TOP 50 * FROM Recruiter WHERE deleted_at IS NULL"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            GridView3.DataSource = dt;
                            GridView3.DataBind();
                        }
                    }
                }
            }
        }
        //protected void GridView3_RowDataBound(object sender, GridViewRowEventArgs e)
        //{
        //    Dictionary<string, string> RecruiterDetails = (Dictionary<string, string>)Session["Recruiter"];
        //    Dictionary<string, string> UserDetails = (Dictionary<string, string>)Session["Admin"];

        //    if (e.Row.RowType == DataControlRowType.DataRow)
        //    {
        //        //Query String
        //        if (UserDetails["Admin_Right"] == "Viewer")
        //        {
        //            e.Row.Cells[4].Text = "<a class='badge badge-success action-btn mr-1'  href='clients-details-r.aspx?viewId=" + e.Row.Cells[4].Text + "' data-toggle='tooltip' data-placement='top' title='View'><i class='fas fa-eye'></i></a>";
        //        }
        //        else
        //        {
        //            e.Row.Cells[4].Text = "<a class='badge badge-success action-btn mr-1'  href='clients-details-r.aspx?viewId=" + e.Row.Cells[4].Text + "' data-toggle='tooltip' data-placement='top' title='View'><i class='fas fa-eye'></i></a>" +
        //             "<a class='badge badge-primary action-btn mr-1'  href='client-edit-r.aspx?editId=" + e.Row.Cells[4].Text + "' data-toggle='tooltip' data-placement='top' title='Edit'><i class='fas fa-edit'></i></a>";
        //        }
        //    }
        //}

        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
            GridView3.PageIndex = e.NewPageIndex;
            this.BindGrid();
        }
    }
}