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
                    "(SELECT job_specializations, company_name, company_photo, job_rating, job_title, location, salary, job_type, is_premium, R.recruiter_id, post_id" +
                    " FROM JobPost JP, Recruiter R WHERE JP.recruiter_id = R.recruiter_id AND JP.deleted_at IS NULL AND R.is_premium = 'true')" +
                    "UNION" +
                    "(SELECT job_specializations, company_name, company_photo, job_rating, job_title, location, salary, job_type, is_premium, R.recruiter_id, post_id FROM JobPost JP, Recruiter R " +
                    "WHERE JP.recruiter_id = R.recruiter_id AND JP.deleted_at IS NULL AND R.is_premium IS NULL)" +
                    ") result " + JobListSearchCriteria() + " ORDER BY (SELECT NULL)";

                dpPagination.PageSize = 5;
            }
            else if (ddlPageSize.SelectedItem.Value == "10")
            {
                sql = "SELECT * FROM (" +
                    "(SELECT job_specializations, company_name, company_photo, job_rating, job_title, location, salary, job_type, is_premium, R.recruiter_id, post_id" +
                    " FROM JobPost JP, Recruiter R WHERE JP.recruiter_id = R.recruiter_id AND JP.deleted_at IS NULL AND R.is_premium = 'true')" +
                    "UNION" +
                    "(SELECT job_specializations, company_name, company_photo, job_rating, job_title, location, salary, job_type, is_premium, R.recruiter_id, post_id FROM JobPost JP, Recruiter R " +
                    "WHERE JP.recruiter_id = R.recruiter_id AND JP.deleted_at IS NULL AND R.is_premium IS NULL)" +
                    ") result " + JobListSearchCriteria() + " ORDER BY (SELECT NULL)";

                dpPagination.PageSize = 10;
            }
            else if (ddlPageSize.SelectedItem.Value == "15")
            {
                sql = "SELECT * FROM (" +
                    "(SELECT job_specializations, company_name, company_photo, job_rating, job_title, location, salary, job_type, is_premium, R.recruiter_id, post_id" +
                    " FROM JobPost JP, Recruiter R WHERE JP.recruiter_id = R.recruiter_id AND JP.deleted_at IS NULL AND R.is_premium = 'true')" +
                    "UNION" +
                    "(SELECT job_specializations, company_name, company_photo, job_rating, job_title, location, salary, job_type, is_premium, R.recruiter_id, post_id FROM JobPost JP, Recruiter R " +
                    "WHERE JP.recruiter_id = R.recruiter_id AND JP.deleted_at IS NULL AND R.is_premium IS NULL)" +
                    ") result " + JobListSearchCriteria() + " ORDER BY (SELECT NULL)";

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

        protected string JobListSearchCriteria()
        {
            string jobTitlequery = Request.QueryString["job_title"] ?? "";
            string locationsquery = Request.QueryString["location"] ?? "";
            string jobTypequery = Request.QueryString["job_type"] ?? "";
            string JobSpecquery = Request.QueryString["job_spec"] ?? "";

            string sql = "";

            if(jobTitlequery != "" || locationsquery != "" || (jobTypequery != "All" && jobTypequery != "") || JobSpecquery != "" )
            {
                sql += " WHERE";
            }

            if (jobTitlequery != "")
            {
                sql += " job_title LIKE '%" + jobTitlequery + "%'";
            }

            if (locationsquery != "")
            {
                if (jobTitlequery != "")
                {
                    if (locationsquery.Contains(','))
                    {
                        sql += " AND location LIKE '%" + locationsquery.Split(',')[0] + "%'" + JobListSearchAmount();
                    }
                    else
                    {
                        sql += " AND location LIKE '%" + locationsquery + "%'";
                    }
                }
                else
                {
                    if (locationsquery.Contains(','))
                    {
                        sql += " location LIKE '%" + locationsquery.Split(',')[0] + "%'" + JobListSearchAmount();
                    }
                    else
                    {
                        sql += " location LIKE '%" + locationsquery + "%'";
                    }

                }
                    
            }

            if (jobTypequery != "All" && jobTypequery != "")
            {
                if (jobTitlequery != "" || locationsquery != "")
                {
                    sql += " AND job_type LIKE '%" + jobTypequery + "%'";
                }
                else
                {
                    sql += " job_type LIKE '%" + jobTypequery + "%'";
                }
            }

            if (JobSpecquery != "")
            {
                if(jobTitlequery != "" || locationsquery != "" || (jobTypequery != "All" && jobTypequery != ""))
                {
                    if (JobSpecquery.Contains(','))
                    {
                        sql += " AND job_specializations LIKE '%" + JobSpecquery.Split(',')[0] + "%'" + JobListSearchAmount();
                    }
                    else
                    {
                        sql += " AND job_specializations LIKE '%" + JobSpecquery + "%'";
                    }
                }
                else
                {
                    if (JobSpecquery.Contains(','))
                    {
                        sql += " job_specializations LIKE '%" + JobSpecquery.Split(',')[0] + "%'" + JobListSearchAmount();
                    }
                    else
                    {
                        sql += " job_specializations LIKE '%" + JobSpecquery + "%'";
                    }
                }
                
            }

            return sql;
        }

        protected string JobListSearchAmount()
        {
            string locationsquery = Request.QueryString["location"] ?? "";
            string JobSpecquery = Request.QueryString["job_spec"] ?? "";
            string jobTypequery = Request.QueryString["job_type"] ?? "";

            string sql = "";

            if (JobSpecquery != "")
            {
                //get job spec total from query
                string[] SpecArr = JobSpecquery.Split(',');

                //loop for all job spec
                for (int i = 1; i < SpecArr.Length; i++)
                {
                    sql += " OR job_specializations LIKE '%" + SpecArr[i] + "%'";
                }
            }

            if (locationsquery != "")
            {
                //get location total from query
                string[] locationArr = locationsquery.Split(',');

                //loop for all location
                for (int i = 1; i < locationArr.Length; i++)
                {
                    sql += " OR location LIKE '%" + locationArr[i] + "%'";
                }
            }

            return sql;
        }
    }
}