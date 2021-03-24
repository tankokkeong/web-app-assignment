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
        protected void Page_Load(object sender, EventArgs e)
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
            lstSearchLocation.DataSource = LocationStatesItems;
            lstSearchLocation.DataBind();

            List<string> SkillItems = new List<string>
            {
                "Java",
                "Python",
                "C",
                "C#",
            };
            lstSearchSkills.DataSource = SkillItems;
            lstSearchSkills.DataBind();

            List<string> IndustryItems = new List<string>
            {
                "IT",
                "Accounting",
                "Economics",
                "Bio-Technology",
            };
            lstSearchIndustry.DataSource = IndustryItems;
            lstSearchIndustry.DataBind();

            List<string> ProfessionItems = new List<string>
            {
                "Marketing Manager",
                "IT Manager",
                "Production Manager",
                "Accounting Manager",
            };
            lstSearchJobProfession.DataSource = ProfessionItems;
            lstSearchJobProfession.DataBind();

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
                        sql = "SELECT TOP 5 * FROM JobSeeker WHERE deleted_at IS NULL";

                        sql = candidateSearchCriteria(sql);
                    }
                    else if (ddlPageSize.SelectedItem.Value == "10")
                    {
                        lbl_JobListContentsAllCompanies.Text = "";
                        sql = "SELECT TOP 10 * FROM JobSeeker WHERE deleted_at IS NULL";

                        sql = candidateSearchCriteria(sql);
                    }
                    else if (ddlPageSize.SelectedItem.Value == "15")
                    {
                        lbl_JobListContentsAllCompanies.Text = "";
                        sql = "SELECT TOP 15 * FROM JobSeeker WHERE deleted_at IS NULL";

                        sql = candidateSearchCriteria(sql);
                    }
                }
                else
                {
                    lbl_JobListContentsAllCompanies.Text = "";
                    sql = "SELECT * FROM (SELECT ROW_NUMBER() Over (Order By seeker_id) AS ROW_NUMBER, * FROM JobSeeker) t WHERE t.ROW_NUMBER BETWEEN @first_page AND @end_page AND deleted_at IS NULL";

                    sql = candidateSearchCriteria(sql);
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
                    txtPagination.Text = "";
                    lbl_JobListContentsAllCompanies.Text +=
                        "<div class='col-sm-6 mt-3'>" +
                            "<div class='JobListContentsAllCompaniesBoxes'> " +
                                "<div class='JobListContentsAllCompaniesBoxesCompanyLogoPosition'>" +
                                    "<img src='" + dr["user_photo"].ToString() + "' alt='job seeker' class='JobListContentsAllCompaniesBoxesCompanyLogoPosition'/>" +
                                    "<div class='JobListContentsAllCompaniesBoxesDetailsStars'>" +
                                        "<%--Stars Here--%>" +
                                        "<p>Stars</p>" +
                                    "</div>" +
                                "</div>" +
                                "<div class='JobListContentsAllCompaniesBoxesDetails'>" +
                                    "<h4 class='JobListContentsAllCompaniesBoxesDetailsTitle'>" +
                                        dr["full_name"].ToString() +
                                    "</h4>" +
                                    "<div class='JobListContentsAllCompaniesBoxesDetailsBody'>" +
                                        "<div class='JobListContentsAllCompaniesBoxesDetailsBodyContents'>" +
                                            "<img src='images/JobsList/working-position.png' alt='position' class='JobListContentsAllCompaniesBoxesImages'/>" +
                                            "<p class='JobListContentsAllCompaniesBoxesDetailsBodyContentsDescription'>" + dr["profession"].ToString() + "</p>" +
                                        "</div>" +
                                        "<div class='JobListContentsAllCompaniesBoxesDetailsBodyContents'>" +
                                            "<img src='images/JobsList/pin.png' alt='location' class='JobListContentsAllCompaniesBoxesImages'/>" +
                                            "<p class='JobListContentsAllCompaniesBoxesDetailsBodyContentsDescription'>" + dr["location"].ToString() + "</p>" +
                                        "</div>" +
                                        "<div class='JobListContentsAllCompaniesBoxesDetailsBodyContents'>" +
                                            "<img src='images/JobsList/salary.png' alt='salary' class='JobListContentsAllCompaniesBoxesImages'/>" +
                                            "<p class='JobListContentsAllCompaniesBoxesDetailsBodyContentsDescription'>" + dr["prefer_industry"].ToString() + "</p>" +
                                        "</div>" +
                                        "<div class='JobListContentsAllCompaniesBoxesDetailsBodyContents'>" +
                                            "<img src='images/JobsList/clock.png' alt='employee status' class='JobListContentsAllCompaniesBoxesImages'/>" +
                                            "<p class='JobListContentsAllCompaniesBoxesDetailsBodyContentsDescription'>" + dr["experience"].ToString() + "</p>" +
                                        "</div>" +
                                    "</div>" +
                                    "<div class='JobListContentsAllCompaniesBoxesDetailsFooter'>" +
                                        "<div class='JobListContentsAllCompaniesBoxesDetailsApplyDetailsButton'>" +
                                            "<button type='button' class='btn btn-primary JobListContentsAllCompaniesBoxesDetailsApplyButtonApplyNow' onclick='directDetails(" + dr["seeker_id"].ToString() + ")'> More Details </button> " +
                                            "<button type='button' class='btn btn-danger JobListContentsAllCompaniesBoxesDetailsApplyButtonApplyNow' onclick='directContact()'> Contact Now </button> " +
                                        "</div>" +
                                    "</div>" +
                                "</div>" +
                            "</div>" +
                        "</div>";
                }

                txtPagination.Text += "<nav aria-label='Page navigation example'>" +
                                            "<ul class='pagination justify-content-end'>" +
                                            "<li class='page-item'>" +
                                                "<a class='page-link' href='#' aria-label='Previous'>" +
                                                "<span aria-hidden='true'>&laquo;</span>" +
                                                "</a>" +
                                            "</li>" +
                                            "<li class='page-item'><a class='page-link' href='#'>1</a></li>" +
                                            "<li class='page-item'><a class='page-link' href='#'>2</a></li>" +
                                            "<li class='page-item'><a class='page-link' href='#'>3</a></li>" +
                                            "<li class='page-item'>" +
                                                "<a class='page-link' href='#' aria-label='Next'>" +
                                                "<span aria-hidden='true'>&raquo;</span>" +
                                                "</a>" +
                                            "</li>" +
                                            "</ul>" +
                                        "</nav>";
                con.Close();
            }
            catch (Exception error)
            {
                Response.Write("<script>alert('" + error.Message + "');</script>");
            }
        }
        protected string candidateSearchCriteria(string sql)
        {
            string skillsquery = Request.QueryString["skills"] ?? "";
            string locationsquery = Request.QueryString["location"] ?? "";
            string industriesquery = Request.QueryString["prefer_industry"] ?? "";
            string professionsquery = Request.QueryString["profession"] ?? "";

            if(skillsquery != "")
            {
                sql += " AND skills LIKE '%" + skillsquery + "%'";
            }

            if (locationsquery != "")
            {
                sql += " AND location LIKE '%" + locationsquery + "%'";
            }

            if (industriesquery != "")
            {
                sql += " AND prefer_industry LIKE '%" + industriesquery + "%'";
            }

            if (professionsquery != "")
            {
                sql += " AND profession LIKE '%" + professionsquery + "%'";
            }

            return sql;
        }
    }
}