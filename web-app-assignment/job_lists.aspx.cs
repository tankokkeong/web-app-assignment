using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace web_app_assignment
{
    public partial class job_lists : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie coo = new HttpCookie("PageSize");
            HttpCookie coo2 = new HttpCookie("PreviousPage");

            try
            {
                if (Request.Cookies["PageSize"] != null)
                {
                    if (Request.Cookies["PageSize"] != Request.Cookies["PreviousPage"])
                    {
                        coo.Value = ddlPageSize.SelectedItem.Value;
                        coo.Expires = DateTime.Now.AddDays(7);
                        Response.Cookies.Add(coo);
                    }
                    else if(ddlPageSize.SelectedValue == Request.Cookies["PageSize"].Value && ddlPageSize.SelectedValue != Request.Cookies["PreviousPage"].Value)
                    {
                        ddlPageSize.SelectedValue = Request.Cookies["PreviousPage"].Value;
                    }
                }
                else
                {
                    coo.Value = ddlPageSize.SelectedItem.Value;
                    coo.Expires = DateTime.Now.AddDays(7);
                    Response.Cookies.Add(coo);
                }

                //Set Previous page cookies
                coo2.Value = Request.Cookies["PageSize"].Value ?? "1";
                coo2.Expires = DateTime.Now.AddDays(7);
                Response.Cookies.Add(coo2);
            }
            catch (Exception error)
            {
                Response.Write("<script>alert('" + error.Message + "');</script>");
            }
        }
        protected string JobListSearchCriteria(string sql)
        {
            string jobTitlequery = Request.QueryString["job_title"] ?? "";
            string locationsquery = Request.QueryString["location"] ?? "";
            string jobTypequery = Request.QueryString["job_type"] ?? "";
            string JobSpecquery = Request.QueryString["job_spec"] ?? "";

            if (jobTitlequery != "")
            {
                sql += " AND job_title LIKE '%" + jobTitlequery + "%'";
            }

            if (locationsquery != "")
            {
                if (locationsquery.Contains(','))
                {
                    sql += " OR location LIKE '%" + locationsquery + "%'" + JobListSearchAmount(sql);
                }
                else
                {
                    sql += " AND location LIKE '%" + locationsquery + "%'";
                }
            }

            if (jobTypequery != "")
            {
                sql += " AND job_type LIKE '%" + jobTypequery;
            }

            if (JobSpecquery != "")
            {
                if (JobSpecquery.Contains(','))
                {
                    sql += " OR job_specializations LIKE '%" + JobSpecquery + "%'" + JobListSearchAmount(sql);
                }
                else
                {
                    sql += " AND job_specializations LIKE '%" + JobSpecquery + "%'";
                }
            }

            return sql;
        }

        protected string JobListSearchAmount (string sql)
        {
            string locationsquery = Request.QueryString["location"] ?? "";
            string JobSpecquery = Request.QueryString["job_spec"] ?? "";

            if(JobSpecquery != "")
            {
                //get job spec total from query
                string[] SpecArr = JobSpecquery.Split(',');

                //loop for all job spec
                for (int i = 0; i < SpecArr.Length; i++)
                {
                    sql += " OR job_specializations LIKE '%" + SpecArr[i] + "%'";
                }
            }

            if(locationsquery != "")
            {
                //get location total from query
                string[] locationArr = locationsquery.Split(',');

                //loop for all location
                for (int i = 0; i < locationArr.Length; i++)
                {
                    sql += " OR location LIKE '%" + locationArr[i] + "%'";
                }
            }

            return sql;
        }

        protected void dpPagination_PreRender(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(strcon);

            string sql = "";

            //Open Connection
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }

            if (ddlPageSize.SelectedItem.Value == "5")
            {
                sql = "SELECT * FROM (" +
                    "(SELECT company_name, company_photo, job_rating, job_title, location, salary, job_type, is_premium, R.recruiter_id, post_id" +
                    " FROM JobPost JP, Recruiter R WHERE JP.recruiter_id = R.recruiter_id AND JP.deleted_at IS NULL AND R.is_premium = 'true'" + JobListSearchCriteria(sql) + ")" +
                    "UNION" +
                    "(SELECT company_name, company_photo, job_rating, job_title, location, salary, job_type, is_premium, R.recruiter_id, post_id FROM JobPost JP, Recruiter R " +
                    "WHERE JP.recruiter_id = R.recruiter_id AND JP.deleted_at IS NULL AND R.is_premium IS NULL" + JobListSearchCriteria(sql) + ")" +
                    ") result";

                dpPagination.PageSize = 5;
            }
            else if (ddlPageSize.SelectedItem.Value == "10")
            {
                sql = "SELECT * FROM (" +
                    "(SELECT company_name, company_photo, job_rating, job_title, location, salary, job_type, is_premium, R.recruiter_id, post_id" +
                    " FROM JobPost JP, Recruiter R WHERE JP.recruiter_id = R.recruiter_id AND JP.deleted_at IS NULL AND R.is_premium = 'true'" + JobListSearchCriteria(sql) + ")" +
                    "UNION" +
                    "(SELECT company_name, company_photo, job_rating, job_title, location, salary, job_type, is_premium, R.recruiter_id, post_id FROM JobPost JP, Recruiter R " +
                    "WHERE JP.recruiter_id = R.recruiter_id AND JP.deleted_at IS NULL AND R.is_premium IS NULL" + JobListSearchCriteria(sql) + ")" +
                    ") result";

                dpPagination.PageSize = 10;
            }
            else if (ddlPageSize.SelectedItem.Value == "15")
            {
                sql = "SELECT * FROM (" +
                    "(SELECT company_name, company_photo, job_rating, job_title, location, salary, job_type, is_premium, R.recruiter_id, post_id" +
                    " FROM JobPost JP, Recruiter R WHERE JP.recruiter_id = R.recruiter_id AND JP.deleted_at IS NULL AND R.is_premium = 'true'" + JobListSearchCriteria(sql) + ")" +
                    "UNION" +
                    "(SELECT company_name, company_photo, job_rating, job_title, location, salary, job_type, is_premium, R.recruiter_id, post_id FROM JobPost JP, Recruiter R " +
                    "WHERE JP.recruiter_id = R.recruiter_id AND JP.deleted_at IS NULL AND R.is_premium IS NULL" + JobListSearchCriteria(sql) + ")" +
                    ") result";

                dpPagination.PageSize = 15;
            }

            SqlDataAdapter cmd = new SqlDataAdapter(sql, con);

            DataTable dtbl = new DataTable();
            cmd.Fill(dtbl);
            lvJobListContentsAllCompanies.DataSource = dtbl;
            lvJobListContentsAllCompanies.DataBind();

            //Close Connection
            con.Close();
        }
    }
}