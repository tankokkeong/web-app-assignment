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
                                    " AS result";

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
    }
}