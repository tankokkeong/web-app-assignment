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
            if (!Page.IsPostBack)
            {
                List<string> LocationStatesItems = new List<string>
                {
                    "Johor",
                    "Kedah",
                    "Kelantan",
                    "Kuala Lumpur",
                    "Labuan",
                    "Melacca",
                    "Negeri Sembilan",
                    "Pahang",
                    "Perak",
                    "Perlis",
                    "Pulau Pinang",
                    "Putrajaya",
                    "Sabah",
                    "Sarawak",
                    "Selangor",
                    "Terengganu",
                };

                List<string> JobTypeItems = new List<string>
                {
                    "All",
                    "Full Time",
                    "Part Time",
                };

                List<string> JobSpecialization = new List<string>
                {
                    "Design platform",
                    "Front end",
                    "Back end",
                    "Full stack",
                };

                lstSearchJobType.DataSource = JobTypeItems;
                lstSearchJobType.DataBind();

                lstSearchLocation.DataSource = LocationStatesItems;
                lstSearchLocation.DataBind();

                lstSearchJobSpec.DataSource = JobSpecialization;
                lstSearchJobSpec.DataBind();
            }

            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                string page_num = Request.QueryString["page"];

                int limit_per_page = Convert.ToInt32(ddlPageSize.SelectedItem.Value);

                int current_page = Convert.ToInt32(page_num);

                int end_page = current_page * limit_per_page;
                int first_page = end_page - limit_per_page + 1;

                string sql = "";

                if (current_page <= 0)
                {
                    if (ddlPageSize.SelectedItem.Value == "5")
                    {
                        lbl_JobListContentsAllCompanies.Text = "";
                        sql = "SELECT TOP 5 * FROM JobPost JP, Recruiter R WHERE JP.recruiter_id = R.recruiter_id AND JP.deleted_at IS NULL";
                        sql = JobListSearchCriteria(sql);
                    }
                    else if (ddlPageSize.SelectedItem.Value == "10")
                    {
                        lbl_JobListContentsAllCompanies.Text = "";
                        sql = "SELECT TOP 10 * FROM JobPost JP, Recruiter R WHERE JP.recruiter_id = R.recruiter_id AND JP.deleted_at IS NULL";
                        sql = JobListSearchCriteria(sql);
                    }
                    else if (ddlPageSize.SelectedItem.Value == "15")
                    {
                        lbl_JobListContentsAllCompanies.Text = "";
                        sql = "SELECT TOP 15 * FROM JobPost JP, Recruiter R WHERE JP.recruiter_id = R.recruiter_id AND JP.deleted_at IS NULL";
                        sql = JobListSearchCriteria(sql);
                    }
                }
                else
                {
                    lbl_JobListContentsAllCompanies.Text = "";
                    sql = "SELECT * FROM (SELECT ROW_NUMBER() Over (Order By post_id) AS ROW_NUMBER, * FROM JobPost JP) t , Recruiter R WHERE" +
                        " t.recruiter_id = R.recruiter_id AND t.ROW_NUMBER BETWEEN @first_page AND @end_page AND t.deleted_at IS NULL";
                    sql = JobListSearchCriteria(sql);
                }

                SqlCommand cmd = new SqlCommand(sql, con);

                cmd.Parameters.AddWithValue("@first_page", first_page);
                cmd.Parameters.AddWithValue("@end_page", end_page);

                SqlDataReader dr = cmd.ExecuteReader();

                // ensure current page isn't out of range
                if (current_page < 1)
                {
                    current_page = 1;
                }
                else if (current_page > end_page)
                {
                    current_page = end_page;
                }

                while (dr.Read())
                {
                    lbl_JobListContentsAllCompanies.Text +=
                        "<div class='col-sm-6 mt-3'>" +
                            "<div class='JobListContentsAllCompaniesBoxes'> " +
                                "<div class='JobListContentsAllCompaniesBoxesCompanyLogoPosition'>" +
                                    "<img src='" + dr["company_photo"].ToString() + "' alt='company' class='JobListContentsAllCompaniesBoxesCompanyLogoPosition'/>" +
                                    "<div class='JobListContentsAllCompaniesBoxesDetailsStars'>" +
                                        "<%--Stars Here--%>" +
                                        "<p>Stars</p>" +
                                    "</div>" +
                                "</div>" +
                                "<div class='JobListContentsAllCompaniesBoxesDetails'>" +
                                    "<h4 class='JobListContentsAllCompaniesBoxesDetailsTitle'>" +
                                        dr["company_name"].ToString() +
                                    "</h4>" +
                                    "<div class='JobListContentsAllCompaniesBoxesDetailsBody'>" +
                                        "<div class='JobListContentsAllCompaniesBoxesDetailsBodyContents'>" +
                                            "<img src='images/JobsList/working-position.png' alt='position' class='JobListContentsAllCompaniesBoxesImages'/>" +
                                            "<p class='JobListContentsAllCompaniesBoxesDetailsBodyContentsDescription'>" + dr["job_title"].ToString() + "</p>" +
                                        "</div>" +
                                        "<div class='JobListContentsAllCompaniesBoxesDetailsBodyContents'>" +
                                            "<img src='images/JobsList/pin.png' alt='location' class='JobListContentsAllCompaniesBoxesImages'/>" +
                                            "<p class='JobListContentsAllCompaniesBoxesDetailsBodyContentsDescription'>" + dr["location"].ToString() + "</p>" +
                                        "</div>" +
                                        "<div class='JobListContentsAllCompaniesBoxesDetailsBodyContents'>" +
                                            "<img src='images/JobsList/salary.png' alt='salary' class='JobListContentsAllCompaniesBoxesImages'/>" +
                                            "<p class='JobListContentsAllCompaniesBoxesDetailsBodyContentsDescription'>" + "MYR " + dr["salary"].ToString() + "</p>" +
                                        "</div>" +
                                        "<div class='JobListContentsAllCompaniesBoxesDetailsBodyContents'>" +
                                            "<img src='images/JobsList/clock.png' alt='employee status' class='JobListContentsAllCompaniesBoxesImages'/>" +
                                            "<p class='JobListContentsAllCompaniesBoxesDetailsBodyContentsDescription'>" + dr["job_type"].ToString() + "</p>" +
                                        "</div>" +
                                    "</div>" +
                                    "<div class='JobListContentsAllCompaniesBoxesDetailsFooter'>" +
                                        "<div class='JobListContentsAllCompaniesBoxesDetailsApplyDetailsButton'>" +
                                            "<button type='button' class='btn btn-primary JobListContentsAllCompaniesBoxesDetailsApplyButtonApplyNow' onclick='directDetails(" + dr["post_id"].ToString() + ")'> More Details </button> " +
                                            "<button type='button' class='btn btn-danger JobListContentsAllCompaniesBoxesDetailsApplyButtonApplyNow' onclick='directContact(" + dr["recruiter_id"].ToString() +")'> Contact Now </button> " +
                                        "</div>" +
                                    "</div>" +
                                "</div>" +
                            "</div>" +
                        "</div>";
                }

                con.Close();
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
            string rangeFromquery = Request.QueryString["rangeFrom"] ?? "";
            string rangeEndquery = Request.QueryString["rangeEnd"] ?? "";

            if (jobTitlequery != "")
            {
                sql += " AND job_title LIKE '%" + jobTitlequery + "%'";
            }

            if (locationsquery != "")
            {
                sql += " AND location LIKE '%" + locationsquery + "%'";
            }

            if (jobTypequery != "")
            {
                sql += " AND job_type LIKE '%" + jobTypequery + "%'";
            }

            if (JobSpecquery != "")
            {
                sql += " AND job_specializations LIKE '%" + JobSpecquery + "%'";
            }

            if (rangeFromquery != "" && rangeEndquery != "")
            {
                sql += " AND salary BETWEEN " + rangeFromquery + " AND " + rangeEndquery;
            }

            return sql;
        }
    }
}