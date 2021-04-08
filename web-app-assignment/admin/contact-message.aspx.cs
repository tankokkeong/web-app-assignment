using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace web_app_assignment.admin
{
    public partial class contact_message : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ToString();
        Helper helper = new Helper();

        protected void Page_Load(object sender, EventArgs e)
        {
            //Check Valid User
            helper.checkAdminLogin();

            SqlConnection con = new SqlConnection(strcon);

            string sql = "SELECT * FROM ContactMessage WHERE deleted_at IS NULL ORDER BY contact_id DESC";

            con.Open();
            SqlDataAdapter cmd = new SqlDataAdapter(sql, con);

            DataTable dtbl = new DataTable();
            cmd.Fill(dtbl);
            gvContactMessage.DataSource = dtbl;
            gvContactMessage.DataBind();

            con.Close();

        }

        protected void gvContactMessage_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            Dictionary<string, string> UserDetails = (Dictionary<string, string>)Session["Admin"];

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //Query String
                if (UserDetails["Admin_Right"] == "Viewer" || UserDetails["Admin_Right"] == "Editor")
                {
                    e.Row.Cells[3].Text = "<a class='badge badge-success action-btn mr-1'  href='message-details.aspx?Id=" + e.Row.Cells[3].Text + "' data-toggle='tooltip' data-placement='top' title='View'><i class='fas fa-eye'></i></a>";
                }
                else
                {
                    e.Row.Cells[3].Text = "<a class='badge badge-success action-btn mr-1'  href='message-details.aspx?Id=" + e.Row.Cells[3].Text + "' data-toggle='tooltip' data-placement='top' title='View'><i class='fas fa-eye'></i></a>" +
                    "<span class='badge badge-danger action-btn' data-toggle='modal' data-target='#deleteModal' type='button' onclick='deleteMessage(" + e.Row.Cells[3].Text + ")'><i class='fas fa-trash'></i></span>";
                }
            }
        }

        protected void btnDeleteMessage_Click(object sender, EventArgs e)
        {
            try
            {

                int contact_id = Convert.ToInt32(txtDeleteMessage.Text);

                SqlConnection con = new SqlConnection(strcon);

                //Read User profile Details
                string sql = "UPDATE ContactMessage SET deleted_at = @delete WHERE contact_id = @Id";

                SqlCommand cmd = new SqlCommand(sql, con);

                con.Open();
                //Insert parameters
                cmd.Parameters.AddWithValue("@delete", DateTime.Now);
                cmd.Parameters.AddWithValue("@Id", contact_id);

                //Execute the queries
                cmd.ExecuteNonQuery();
                con.Close();

                Response.Write("<script>alert('Record Deleted successful!');</script>");
                Response.Redirect("contact-message.aspx");


            }
            catch (Exception error)
            {
                Response.Write("<script>alert('" + error.Message + "');</script>");
            }
        }

        protected void gvContactMessage_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvContactMessage.PageIndex = e.NewPageIndex;
            gvContactMessage.DataBind();
        }

    }
}