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
    public partial class payments : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        //Create Helper Class
        Helper helper = new Helper();

        protected void Page_Load(object sender, EventArgs e)
        {
            //Check Valid User
            helper.checkAdminLogin();
        }

        protected void dpPaymentPagination_PreRender(object sender, EventArgs e)
        {
            try
            {               

                //Open connection
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                string sql_payment = "SELECT * FROM((" +
                                    " SELECT payment_id, payment_method, full_name as username, 'Job Seeker' as user_role, PR.created_at" +
                                    " FROM PaymentRecord PR, JobSeeker JS" +
                                    " WHERE PR.premium_seeker = JS.seeker_id)" +
                                    " UNION" +
                                    " (SELECT payment_id, payment_method, company_name as username, 'Recruiter' as user_role, PR.created_at" +
                                    " FROM PaymentRecord PR, Recruiter R" +
                                    " WHERE PR.premium_recruiter = R.recruiter_id))" +
                                    " AS result" + paymentFilterQuery() + " ORDER by payment_id DESC";

                SqlDataAdapter cmd = new SqlDataAdapter(sql_payment, con);



                DataTable dtbl = new DataTable();
                cmd.Fill(dtbl);
                lvPaymentRecords.DataSource = dtbl;
                lvPaymentRecords.DataBind();

                //Close Connection
                con.Close();
            }
            catch (Exception error)
            {
                Response.Write("<script>alert('" + error.Message + "');</script>");
            }
        }

        protected string paymentFilterQuery()
        {
            string sql = "";

            //Retrieve Query Strings
            string payment_id = Request.QueryString["payment_id"] ?? "";
            string payment_method = Request.QueryString["payment_method"] ?? "";
            string user_role = Request.QueryString["user_role"] ?? "";
            string username = Request.QueryString["username"] ?? "";
            string from_date = Request.QueryString["from"] ?? "";
            string to_date = Request.QueryString["to"] ?? "";

            if(payment_id != "" || payment_method != "" || user_role != "" || username != "" || from_date != "" || to_date != "")
            {
                sql += " WHERE";
            }

            //Check payment id query
            if(payment_id != "")
            {
                sql += " payment_id =" + payment_id;
            }
            
            if(payment_method != "")
            {
                if(payment_id != "")
                {
                    sql += " AND payment_method ='" + payment_method + "'";
                }
                else
                {
                    sql += " payment_method ='" + payment_method + "'";
                }

            }

            if (user_role != "")
            {
                if (payment_id != "" || payment_method != "")
                {
                    sql += " AND user_role ='" + user_role + "'";
                }
                else
                {
                    sql += " user_role ='" + user_role + "'";
                }

            }

            if (username != "")
            {
                if (payment_id != "" || payment_method != "" || user_role != "")
                {
                    sql += " AND username LIKE '%" + username + "%'";
                }
                else
                {
                    sql += " username LIKE '%" + username + "%'";
                }

            }

            if (from_date != "")
            {
                if (payment_id != "" || payment_method != "" || user_role != "" || username != "")
                {
                    sql += " AND created_at > '" + from_date + "'";
                }
                else
                {
                    sql += " created_at > '" + from_date + "'";
                }

            }

            if (to_date != "")
            {
                if (payment_id != "" || payment_method != "" || user_role != "" || username != "" || from_date != "")
                {
                    sql += " AND created_at < '" + to_date + "'";
                }
                else
                {
                    sql += " created_at < '" + to_date + "'";
                }

            }

            return sql;
        }
    }
}