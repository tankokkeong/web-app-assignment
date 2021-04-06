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
    public partial class candidate_list : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        Helper helper = new Helper();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void dpPagination_PreRender(object sender, EventArgs e)
        {
            var validRecruiter = helper.getRecruiterID();

            if (validRecruiter != "")
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
                                    "(SELECT full_name, user_photo, location, skills, profession, prefer_industry, is_premium, experience, seeker_id FROM JobSeeker" +
                                    " WHERE deleted_at IS NULL AND is_premium = 'true')" +
                                    "UNION" +
                                    "(SELECT full_name, user_photo, location, skills, profession, prefer_industry, is_premium, experience, seeker_id FROM JobSeeker" +
                                    " WHERE deleted_at IS NULL AND is_premium IS NULL)" +
                                    ") result" + candidateSearchCriteria() + " ORDER BY (SELECT NULL)";

                    dpPagination.PageSize = 5;
                }
                else if (ddlPageSize.SelectedItem.Value == "10")
                {
                    sql = "SELECT * FROM (" +
                                    "(SELECT full_name, user_photo, location, skills, profession, prefer_industry, is_premium, experience, seeker_id FROM JobSeeker" +
                                    " WHERE deleted_at IS NULL AND is_premium = 'true')" +
                                    "UNION" +
                                    "(SELECT full_name, user_photo, location, skills, profession, prefer_industry, is_premium, experience, seeker_id FROM JobSeeker" +
                                    " WHERE deleted_at IS NULL AND is_premium IS NULL)" +
                                    ") result" + candidateSearchCriteria() + " ORDER BY (SELECT NULL)";

                    dpPagination.PageSize = 10;
                }
                else if (ddlPageSize.SelectedItem.Value == "15")
                {
                    sql = "SELECT * FROM (" +
                                    "(SELECT full_name, user_photo, location, skills, profession, prefer_industry, is_premium, experience, seeker_id FROM JobSeeker" +
                                    " WHERE deleted_at IS NULL AND is_premium = 'true')" +
                                    "UNION" +
                                    "(SELECT full_name, user_photo, location, skills, profession, prefer_industry, is_premium, experience, seeker_id FROM JobSeeker" +
                                    " WHERE deleted_at IS NULL AND is_premium IS NULL)" +
                                    ") result" + candidateSearchCriteria() + " ORDER BY (SELECT NULL)";

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
            else
            {
                Response.Redirect("home.aspx");
            }
        }

        protected string candidateSearchCriteria()
        {
            string skillsquery = Request.QueryString["skills"] ?? "";
            string locationsquery = Request.QueryString["location"] ?? "";
            string industriesquery = Request.QueryString["prefer_industry"] ?? "";
            string professionsquery = Request.QueryString["profession"] ?? "";

            string sql = "";

            if (skillsquery != "" || locationsquery != "" || industriesquery != "" || professionsquery != "")
            {
                sql += " WHERE";
            }

            if (skillsquery != "")
            {
                if (skillsquery.Contains(','))
                {
                    sql += " skills LIKE '%" + skillsquery.Split(',')[0] + "%'" + JobListSearchAmount();
                }
                else
                {
                    sql += " skills LIKE '%" + skillsquery + "%'";
                }
            }

            if (locationsquery != "")
            {
                if(skillsquery != "")
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

            if (industriesquery != "")
            {
                if(skillsquery != "" || locationsquery != "")
                {
                    if (industriesquery.Contains(','))
                    {
                        sql += " AND prefer_industry LIKE '%" + industriesquery.Split(',')[0] + "%'" + JobListSearchAmount();
                    }
                    else
                    {
                        sql += " AND prefer_industry LIKE '%" + industriesquery + "%'";
                    }
                }
                else
                {
                    if (industriesquery.Contains(','))
                    {
                        sql += " prefer_industry LIKE '%" + industriesquery.Split(',')[0] + "%'" + JobListSearchAmount();
                    }
                    else
                    {
                        sql += " prefer_industry LIKE '%" + industriesquery + "%'";
                    }
                }
            }

            if (professionsquery != "")
            {
                if(skillsquery != "" || locationsquery != "" || industriesquery != "")
                {
                    if (professionsquery.Contains(','))
                    {
                        sql += " AND profession LIKE '%" + professionsquery.Split(',')[0] + "%'" + JobListSearchAmount();
                    }
                    else
                    {
                        sql += " AND profession LIKE '%" + professionsquery + "%'";
                    }
                }
                else
                {
                    if (professionsquery.Contains(','))
                    {
                        sql += " profession LIKE '%" + professionsquery.Split(',')[0] + "%'" + JobListSearchAmount();
                    }
                    else
                    {
                        sql += " profession LIKE '%" + professionsquery + "%'";
                    }
                }
            }

            return sql;
        }

        protected string JobListSearchAmount()
        {
            string skillsquery = Request.QueryString["skills"] ?? "";
            string locationsquery = Request.QueryString["location"] ?? "";
            string industriesquery = Request.QueryString["prefer_industry"] ?? "";
            string professionsquery = Request.QueryString["profession"] ?? "";

            string sql = "";

            if (skillsquery != "")
            {
                //get job spec total from query
                string[] skillsArr = skillsquery.Split(',');

                //loop for all job spec
                for (int i = 0; i < skillsArr.Length; i++)
                {
                    sql += " OR skills LIKE '%" + skillsArr[i] + "%'";
                }
            }

            if (locationsquery != "")
            {
                //get location total from query
                string[] locationArr = locationsquery.Split(',');

                //loop for all location
                for (int i = 0; i < locationArr.Length; i++)
                {
                    sql += " OR location LIKE '%" + locationArr[i] + "%'";
                }
            }

            if (industriesquery != "")
            {
                //get job spec total from query
                string[] industryArr = industriesquery.Split(',');

                //loop for all job spec
                for (int i = 0; i < industryArr.Length; i++)
                {
                    sql += " OR prefer_industry LIKE '%" + industryArr[i] + "%'";
                }
            }

            if (professionsquery != "")
            {
                //get location total from query
                string[] professionArr = professionsquery.Split(',');

                //loop for all location
                for (int i = 0; i < professionArr.Length; i++)
                {
                    sql += " OR profession LIKE '%" + professionArr[i] + "%'";
                }
            }

            return sql;
        }
    }
}