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
    public partial class client_edit_r : System.Web.UI.Page
    {
        Helper helper = new Helper();

        protected void Page_Load(object sender, EventArgs e)
        {
            //Check Valid User
            helper.checkAdminLogin();

            string strcon = ConfigurationManager.ConnectionStrings["con"].ToString();
            Dictionary<string, string> RecruiterDetails = (Dictionary<string, string>)Session["Recruiter"];

            if (!Page.IsPostBack)
            {
                bool found = false;
                string id = Request.QueryString["editId"] ?? "";

                string sql = "SELECT * FROM Recruiter WHERE recruiter_id = @id AND deleted_at IS NULL";

                SqlConnection con = new SqlConnection(strcon);
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@id", id);

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    found = true;
                    txtID.Text = (dr["recruiter_id"].ToString());
                    txtEmail.Text = (string)dr["email"];
                    listStatus.Text = (string)dr["active"];
                }

                dr.Close();
                con.Close();

                if (!found)
                {
                    Response.Redirect("clients-management-r.aspx");
                }
            }
        }
        protected void btnEditUser_Click(object sender, EventArgs e)
        {
            string strcon = ConfigurationManager.ConnectionStrings["con"].ToString();
            Dictionary<string, string> RecruiterDetails = (Dictionary<string, string>)Session["Recruiter"];

            SqlConnection con = new SqlConnection(strcon);
            string id = Request.QueryString["editId"] ?? "";
            string email = txtEmail.Text;
            string active = listStatus.Text;

            string sql = @"SELECT recruiter_id FROM Recruiter WHERE email = @email AND deleted_at IS NULL";

            SqlCommand cmd = new SqlCommand(sql, con);

            con.Open();
            cmd.Parameters.AddWithValue("@email", email);
            SqlDataReader dr = cmd.ExecuteReader();

            string sqlEdit = @"UPDATE Recruiter SET email = @email, active = @active WHERE recruiter_id = @id2";

            SqlCommand cmdEdit = new SqlCommand(sqlEdit, con);
            cmd.Parameters.AddWithValue("@id", id);
            cmdEdit.Parameters.AddWithValue("@email", email);
            cmdEdit.Parameters.AddWithValue("@active", active);

            while (dr.Read())
            {
                cmdEdit.Parameters.AddWithValue("@id2", id);
            }

            dr.Close();
            cmdEdit.ExecuteNonQuery();
            con.Close();

            Response.Redirect("clients-management-r.aspx");
        }
    }
}