using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace web_app_assignment.admin
{
    public partial class contact_message : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                Dictionary<string, string> UserDetails = (Dictionary<string, string>)Session["Admin"];

                SqlConnection con = new SqlConnection(strcon);

                string sql = "SELECT * FROM ContactMessage WHERE deleted_at IS NULL";

                SqlCommand cmd = new SqlCommand(sql, con);

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                //Data binding
                gvContactMessage.DataSource = dr;
                gvContactMessage.DataBind();

                dr.Close();
                con.Close();
            }
            

        }

        protected void gvContactMessage_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //Query String
                e.Row.Cells[3].Text = "<a class='badge badge-success action-btn mr-1'  href='message-details.aspx?Id=" + e.Row.Cells[3].Text + "' data-toggle='tooltip' data-placement='top' title='Edit'><i class='fas fa-eye'></i></a>" +
                    "<span class='badge badge-danger action-btn' data-toggle='modal' data-target='#deleteModal' type='button' onclick='deleteMessage(" + e.Row.Cells[3].Text + ")'><i class='fas fa-trash'></i></span>";
            }
        }

        protected void btnDeleteMessage_Click(object sender, EventArgs e)
        {
            Dictionary<string, string> UserDetails = (Dictionary<string, string>)Session["Admin"];

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

        /*
            protected void gvContactMessage_RowDeleting(object sender, GridViewDeleteEventArgs e)
            {
    
                int id = Convert.ToInt32(gvContactMessage.DataKeys[e.RowIndex].Value.ToString());
            
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("UPDATE ContactMessage SET deleted_at = '"+DateTime.Now+"' WHERE contact_id ='"+ id +"'", con);
                    int t = cmd.ExecuteNonQuery();
    
                    con.Close();

                    Response.Redirect("contact-message.aspx");
                }

            }
        */
    }
}