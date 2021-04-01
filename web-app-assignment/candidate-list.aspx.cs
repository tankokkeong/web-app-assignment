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
            HttpCookie coo = new HttpCookie("PageSize");
            HttpCookie coo2 = new HttpCookie("PreviousPage");

            SqlConnection conSearchTotal = new SqlConnection(strcon);
            if (conSearchTotal.State == ConnectionState.Closed)
            {
                conSearchTotal.Open();
            }

            string countItems = "SELECT COUNT(*) FROM JobSeeker";

            SqlCommand cmdCountSeekers = new SqlCommand(countItems, conSearchTotal);

            int endPage = (int)Math.Ceiling(Convert.ToDouble(cmdCountSeekers.ExecuteScalar()) / Convert.ToDouble(ddlPageSize.SelectedItem.Value));

            conSearchTotal.Close();  

            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                string page_num = Request.QueryString["page"];

                if (Request.Cookies["PageSize"] != null)
                {
                    if(ddlPageSize.SelectedValue != Request.Cookies["PageSize"].Value && Request.QueryString["page"] == null)
                    {
                        //User change limit page number in page 1

                        coo.Value = ddlPageSize.SelectedItem.Value;
                        coo.Expires = DateTime.Now.AddDays(7);
                        Response.Cookies.Add(coo);
                    }
                    else if (ddlPageSize.SelectedValue != Request.Cookies["PageSize"].Value && page_num == Request.Cookies["PreviousPage"].Value)
                    {
                        //User change limit page number in other than page 1

                        coo.Value = ddlPageSize.SelectedItem.Value;
                        coo.Expires = DateTime.Now.AddDays(7);
                        Response.Cookies.Add(coo);
                    }
                    else
                    {
                        //Retain user prefer limit page number
                        ddlPageSize.SelectedValue = Request.Cookies["PageSize"].Value;
                    }
                    
                }
                else
                {
                    coo.Value = ddlPageSize.SelectedItem.Value;
                    coo.Expires = DateTime.Now.AddDays(7);
                    Response.Cookies.Add(coo);
                }                

                int limit_per_page = Convert.ToInt32(ddlPageSize.SelectedValue);

                int current_page = Convert.ToInt32(page_num);

                // ensure current page isn't out of range
                if (current_page < 1)
                {
                    current_page = 1;
                }
                else if (current_page > endPage)
                {
                    current_page = endPage;
                    Response.Redirect("candidate-list.aspx?page=" + endPage);
                }

                int end_page = current_page * limit_per_page;
                int first_page = end_page - limit_per_page;

                string sql = "";

                if (current_page <= 0)
                {
                    if (ddlPageSize.SelectedItem.Value == "5")
                    {
                        lbl_JobListContentsAllCompanies.Text = "";
                        sql = "SELECT TOP 5 * FROM (" +
                            "(SELECT full_name, user_photo, location, profession, prefer_industry, is_premium, experience, seeker_id FROM JobSeeker" +
                            " WHERE deleted_at IS NULL AND is_premium = 'true'" + candidateSearchCriteria(sql) + ")" +
                            "UNION" +
                            "(SELECT full_name, user_photo, location, profession, prefer_industry, is_premium, experience, seeker_id FROM JobSeeker" +
                            " WHERE deleted_at IS NULL AND is_premium IS NULL" + candidateSearchCriteria(sql) + ")" +
                            ") result";
                    }
                    else if (ddlPageSize.SelectedItem.Value == "10")
                    {
                        lbl_JobListContentsAllCompanies.Text = "";
                        sql = "SELECT TOP 10 * FROM (" +
                            "(SELECT full_name, user_photo, location, profession, prefer_industry, is_premium, experience, seeker_id FROM JobSeeker" +
                            " WHERE deleted_at IS NULL AND is_premium = 'true'" + candidateSearchCriteria(sql) + ")" +
                            "UNION" +
                            "(SELECT full_name, user_photo, location, profession, prefer_industry, is_premium, experience, seeker_id FROM JobSeeker" +
                            " WHERE deleted_at IS NULL AND is_premium IS NULL" + candidateSearchCriteria(sql) + ")" +
                            ") result";
                    }
                    else if (ddlPageSize.SelectedItem.Value == "15")
                    {
                        lbl_JobListContentsAllCompanies.Text = "";
                        sql = "SELECT TOP 15 * FROM (" +
                            "(SELECT full_name, user_photo, location, profession, prefer_industry, is_premium, experience, seeker_id FROM JobSeeker" +
                            " WHERE deleted_at IS NULL AND is_premium = 'true'" + candidateSearchCriteria(sql) + ")" +
                            "UNION" +
                            "(SELECT full_name, user_photo, location, profession, prefer_industry, is_premium, experience, seeker_id FROM JobSeeker" +
                            " WHERE deleted_at IS NULL AND is_premium IS NULL" + candidateSearchCriteria(sql) + ")" +
                            ") result";
                    }
                }
                else
                {
                    lbl_JobListContentsAllCompanies.Text = "";
                    sql = "SELECT * FROM (" +
                            "(SELECT full_name, user_photo, location, profession, prefer_industry, is_premium, experience, seeker_id FROM JobSeeker" +
                            " WHERE deleted_at IS NULL AND is_premium = 'true'" + candidateSearchCriteria(sql) + ")" +
                            "UNION" +
                            "(SELECT full_name, user_photo, location, profession, prefer_industry, is_premium, experience, seeker_id FROM JobSeeker" +
                            " WHERE deleted_at IS NULL AND is_premium IS NULL" + candidateSearchCriteria(sql) + ")" +
                            ") result ORDER BY(SELECT NULL) OFFSET " + first_page + " ROWS FETCH NEXT " + limit_per_page + " ROWS ONLY";
                }

                SqlCommand cmd = new SqlCommand(sql, con);

                cmd.Parameters.AddWithValue("@first_page", first_page);
                cmd.Parameters.AddWithValue("@end_page", end_page);

                SqlDataReader dr = cmd.ExecuteReader();

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

                Pagination(current_page);

                con.Close();

                //Set Previous page cookies
                coo2.Value = Request.QueryString["page"] ?? "1";
                coo2.Expires = DateTime.Now.AddDays(7);
                Response.Cookies.Add(coo2);
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
                sql += " OR skills LIKE '%" + skillsquery + "%' OR skills IN('" + skillsquery + "')";
            }

            if (locationsquery != "")
            {
                sql += " OR location LIKE '%" + locationsquery + "%' OR location IN('" + locationsquery + "')";
            }

            if (industriesquery != "")
            {
                sql += " OR prefer_industry LIKE '%" + industriesquery + "%' OR prefer_industry IN('" + industriesquery + "')";
            }

            if (professionsquery != "")
            {
                sql += " OR profession LIKE '%" + professionsquery + "%' OR profession IN('" + professionsquery + "')";
            }

            return sql;
        }

        protected void Pagination (int currentPage)
        {
            SqlConnection conSearchTotal = new SqlConnection(strcon);
            if (conSearchTotal.State == ConnectionState.Closed)
            {
                conSearchTotal.Open();
            }

            string skillsquery = Request.QueryString["skills"] ?? "";
            string locationsquery = Request.QueryString["location"] ?? "";
            string industriesquery = Request.QueryString["prefer_industry"] ?? "";
            string professionsquery = Request.QueryString["profession"] ?? "";

            string countItems = "";

            if (skillsquery == "" && locationsquery == "" && industriesquery == "" && professionsquery == "")
            {
                countItems = "SELECT COUNT(*) FROM JobSeeker";
            }
            else if (skillsquery != "" || locationsquery != "" || industriesquery != "" || professionsquery != "")
            {
                countItems = "SELECT COUNT(*) FROM JobSeeker WHERE skills LIKE '%" + skillsquery + "%' AND location LIKE '%" + locationsquery + "%' AND prefer_industry LIKE '%" + industriesquery + "%' AND profession LIKE '%" + professionsquery + "%'";
            }

            SqlCommand cmdCountSeekers = new SqlCommand(countItems, conSearchTotal);

            int endPage = (int)Math.Ceiling(Convert.ToDouble(cmdCountSeekers.ExecuteScalar()) / Convert.ToDouble(ddlPageSize.SelectedItem.Value));

            conSearchTotal.Close();

            int switchPrevious = currentPage - 1;
            int switchNext = currentPage + 1;
            int firstPage = 1;
            int secondPage = firstPage + 1;
            int secondLastPage = endPage - 1;

            string querys = "skills=" + skillsquery + "&location=" + locationsquery + "&prefer_industry=" + industriesquery + "&profession=" + professionsquery;

            // ensure current page isn't out of range
            if (currentPage < firstPage)
            {
                currentPage = firstPage;
            }
            else if (currentPage > endPage)
            {
                currentPage = endPage;
            }

            //if no query
            if (skillsquery == "" && locationsquery == "" && industriesquery == "" && professionsquery == "")
            {
                if (currentPage > firstPage && currentPage < endPage)
                {
                    txtPagination.Text = "";
                    txtPagination.Text += "<nav aria-label='Page navigation example'>" +
                                          "<ul class='pagination justify-content-end'>" +
                                            "<li class='page-item'><a class='page-link' href='candidate-list.aspx?page=" + Convert.ToString(firstPage) + "'>First Page</a></li>" +
                                            "<li class='page-item'><a class='page-link' href='candidate-list.aspx?page=" + Convert.ToString(switchPrevious) + "'>Previous</a></li>" +
                                            "<li class='page-item'><a class='page-link' href='#'>...</a></li>" +
                                            "<li class='page-item'><a class='page-link' href='candidate-list.aspx?page=" + Convert.ToString(switchPrevious) + "'>" + Convert.ToString(switchPrevious) + "</a></li>" +
                                            "<li class='page-item disabled'><a class='page-link'>" + Convert.ToString(currentPage) + "</a></li>" +
                                            "<li class='page-item'><a class='page-link' href='candidate-list.aspx?page=" + Convert.ToString(switchNext) + "'>" + Convert.ToString(switchNext) + "</a></li>" +
                                            "<li class='page-item'><a class='page-link' href='#'>...</a></li>" +
                                            "<li class='page-item'><a class='page-link' href='candidate-list.aspx?page=" + Convert.ToString(switchNext) + "'>Next</a></li>" +
                                            "<li class='page-item'><a class='page-link' href='candidate-list.aspx?page=" + Convert.ToString(endPage) + "'>Last Page</a></li>" +
                                          "</ul>" +
                                        "</nav>";
                }
                if (currentPage == firstPage)
                {
                    txtPagination.Text = "";
                    txtPagination.Text += "<nav aria-label='Page navigation example'>" +
                                          "<ul class='pagination justify-content-end'>" +
                                            "<li class='page-item disabled'><a class='page-link' href='candidate-list.aspx?page=" + Convert.ToString(firstPage) + "'>First Page</a></li>" +
                                            "<li class='page-item disabled'><a class='page-link' href='candidate-list.aspx?page=" + Convert.ToString(switchPrevious) + "'>Previous</a></li>" +
                                            "<li class='page-item disabled'><a class='page-link'>" + Convert.ToString(currentPage) + "</a></li>" +
                                            "<li class='page-item'><a class='page-link' href='candidate-list.aspx?page=" + Convert.ToString(switchNext) + "'>" + Convert.ToString(switchNext) + "</a></li>" +
                                            "<li class='page-item'><a class='page-link' href='#'>...</a></li>" +
                                            "<li class='page-item'><a class='page-link' href='candidate-list.aspx?page=" + Convert.ToString(switchNext) + "'>Next</a></li>" +
                                            "<li class='page-item'><a class='page-link' href='candidate-list.aspx?page=" + Convert.ToString(endPage) + "'>Last Page</a></li>" +
                                          "</ul>" +
                                        "</nav>";
                }
                if (currentPage == endPage)
                {
                    txtPagination.Text = "";
                    txtPagination.Text += "<nav aria-label='Page navigation example'>" +
                                          "<ul class='pagination justify-content-end'>" +
                                            "<li class='page-item'><a class='page-link' href='candidate-list.aspx?page=" + Convert.ToString(firstPage) + "'>First Page</a></li>" +
                                            "<li class='page-item'><a class='page-link' href='candidate-list.aspx?page=" + Convert.ToString(switchPrevious) + "'>Previous</a></li>" +
                                            "<li class='page-item'><a class='page-link' href='#'>...</a></li>" +
                                            "<li class='page-item'><a class='page-link' href='candidate-list.aspx?page=" + Convert.ToString(switchPrevious) + "'>" + Convert.ToString(switchPrevious) + "</a></li>" +
                                            "<li class='page-item disabled'><a class='page-link'>" + Convert.ToString(currentPage) + "</a></li>" +
                                            "<li class='page-item disabled'><a class='page-link' href='candidate-list.aspx?page=" + Convert.ToString(switchNext) + "'>Next</a></li>" +
                                            "<li class='page-item disabled'><a class='page-link' href='candidate-list.aspx?page=" + Convert.ToString(endPage) + "'>Last Page</a></li>" +
                                          "</ul>" +
                                        "</nav>";
                }
                if (currentPage <= 0)
                {
                    txtPagination.Text = "";
                    txtPagination.Text += "<nav aria-label='Page navigation example'>" +
                                          "<ul class='pagination justify-content-end'>" +
                                            "<li class='page-item disabled'><a class='page-link' href='candidate-list.aspx?page=" + Convert.ToString(firstPage) + "'>First Page</a></li>" +
                                            "<li class='page-item disabled'><a class='page-link' href='candidate-list.aspx?page=" + Convert.ToString(switchPrevious) + "'>Previous</a></li>" +
                                            "<li class='page-item disabled'><a class='page-link'>" + Convert.ToString(currentPage) + "</a></li>" +
                                            "<li class='page-item'><a class='page-link' href='candidate-list.aspx?page=" + Convert.ToString(switchNext) + "'>" + Convert.ToString(switchNext) + "</a></li>" +
                                            "<li class='page-item'><a class='page-link' href='#'>...</a></li>" +
                                            "<li class='page-item'><a class='page-link' href='candidate-list.aspx?page=" + Convert.ToString(switchNext) + "'>Next</a></li>" +
                                            "<li class='page-item'><a class='page-link' href='candidate-list.aspx?page=" + Convert.ToString(endPage) + "'>Last Page</a></li>" +
                                          "</ul>" +
                                        "</nav>";
                }

                if (currentPage == secondPage)
                {
                    txtPagination.Text = "";
                    txtPagination.Text += "<nav aria-label='Page navigation example'>" +
                                          "<ul class='pagination justify-content-end'>" +
                                            "<li class='page-item'><a class='page-link' href='candidate-list.aspx?page=" + Convert.ToString(firstPage) + "'>First Page</a></li>" +
                                            "<li class='page-item'><a class='page-link' href='candidate-list.aspx?page=" + Convert.ToString(switchPrevious) + "'>Previous</a></li>" +
                                            "<li class='page-item'><a class='page-link' href='candidate-list.aspx?page=" + Convert.ToString(switchPrevious) + "'>" + Convert.ToString(switchPrevious) + "</a></li>" +
                                            "<li class='page-item disabled'><a class='page-link'>" + Convert.ToString(currentPage) + "</a></li>" +
                                            "<li class='page-item'><a class='page-link' href='candidate-list.aspx?page=" + Convert.ToString(switchNext) + "'>" + Convert.ToString(switchNext) + "</a></li>" +
                                            "<li class='page-item'><a class='page-link' href='#'>...</a></li>" +
                                            "<li class='page-item'><a class='page-link' href='candidate-list.aspx?page=" + Convert.ToString(switchNext) + "'>Next</a></li>" +
                                            "<li class='page-item'><a class='page-link' href='candidate-list.aspx?page=" + Convert.ToString(endPage) + "'>Last Page</a></li>" +
                                          "</ul>" +
                                        "</nav>";
                }

                if (currentPage == secondLastPage)
                {
                    txtPagination.Text = "";
                    txtPagination.Text += "<nav aria-label='Page navigation example'>" +
                                          "<ul class='pagination justify-content-end'>" +
                                            "<li class='page-item'><a class='page-link' href='candidate-list.aspx?page=" + Convert.ToString(firstPage) + "'>First Page</a></li>" +
                                            "<li class='page-item'><a class='page-link' href='candidate-list.aspx?page=" + Convert.ToString(switchPrevious) + "'>Previous</a></li>" +
                                            "<li class='page-item'><a class='page-link' href='#'>...</a></li>" +
                                            "<li class='page-item'><a class='page-link' href='candidate-list.aspx?page=" + Convert.ToString(switchPrevious) + "'>" + Convert.ToString(switchPrevious) + "</a></li>" +
                                            "<li class='page-item disabled'><a class='page-link'>" + Convert.ToString(currentPage) + "</a></li>" +
                                            "<li class='page-item'><a class='page-link' href='candidate-list.aspx?page=" + Convert.ToString(switchNext) + "'>" + Convert.ToString(switchNext) + "</a></li>" +
                                            "<li class='page-item'><a class='page-link' href='candidate-list.aspx?page=" + Convert.ToString(switchNext) + "'>Next</a></li>" +
                                            "<li class='page-item'><a class='page-link' href='candidate-list.aspx?page=" + Convert.ToString(endPage) + "'>Last Page</a></li>" +
                                          "</ul>" +
                                        "</nav>";
                }
            }//if got query
            else if (skillsquery == "" || locationsquery == "" || industriesquery == "" || professionsquery == "")
            {
                if (currentPage > firstPage && currentPage < endPage)
                {
                    txtPagination.Text = "";
                    txtPagination.Text += "<nav aria-label='Page navigation example'>" +
                                          "<ul class='pagination justify-content-end'>" +
                                            "<li class='page-item'><a class='page-link' href='candidate-list.aspx?" + querys + "&page=" + Convert.ToString(firstPage) + "'>First Page</a></li>" +
                                            "<li class='page-item'><a class='page-link' href='candidate-list.aspx?" + querys + "&page=" + Convert.ToString(switchPrevious) + "'>Previous</a></li>" +
                                            "<li class='page-item disabled'><a class='page-link' href='#'>...</a></li>" +
                                            "<li class='page-item'><a class='page-link' href='candidate-list.aspx?" + querys + "&page=" + Convert.ToString(switchPrevious) + "'>" + Convert.ToString(switchPrevious) + "</a></li>" +
                                            "<li class='page-item disabled'><a class='page-link'>" + Convert.ToString(currentPage) + "</a></li>" +
                                            "<li class='page-item'><a class='page-link' href='candidate-list.aspx?" + querys + "&page=" + Convert.ToString(switchNext) + "'>" + Convert.ToString(switchNext) + "</a></li>" +
                                            "<li class='page-item disabled'><a class='page-link' href='#'>...</a></li>" +
                                            "<li class='page-item'><a class='page-link' href='candidate-list.aspx?" + querys + "&page=" + Convert.ToString(switchNext) + "'>Next</a></li>" +
                                            "<li class='page-item'><a class='page-link' href='candidate-list.aspx?" + querys + "&page=" + Convert.ToString(endPage) + "'>Last Page</a></li>" +
                                          "</ul>" +
                                        "</nav>";
                }
                if (currentPage == firstPage)
                {
                    txtPagination.Text = "";
                    txtPagination.Text += "<nav aria-label='Page navigation example'>" +
                                          "<ul class='pagination justify-content-end'>" +
                                            "<li class='page-item disabled'><a class='page-link' href='candidate-list.aspx?" + querys + "&page=" + Convert.ToString(firstPage) + "'>First Page</a></li>" +
                                            "<li class='page-item disabled'><a class='page-link' href='candidate-list.aspx?" + querys + "&page=" + Convert.ToString(switchPrevious) + "'>Previous</a></li>" +
                                            "<li class='page-item disabled'><a class='page-link'>" + Convert.ToString(currentPage) + "</a></li>" +
                                            "<li class='page-item'><a class='page-link' href='candidate-list.aspx?" + querys + "&page=" + Convert.ToString(switchNext) + "'>" + Convert.ToString(switchNext) + "</a></li>" +
                                            "<li class='page-item disabled'><a class='page-link' href='#'>...</a></li>" +
                                            "<li class='page-item'><a class='page-link' href='candidate-list.aspx?" + querys + "&page=" + Convert.ToString(switchNext) + "'>Next</a></li>" +
                                            "<li class='page-item'><a class='page-link' href='candidate-list.aspx?" + querys + "&page=" + Convert.ToString(endPage) + "'>Last Page</a></li>" +
                                          "</ul>" +
                                        "</nav>";
                }
                if (currentPage == endPage)
                {
                    txtPagination.Text = "";
                    txtPagination.Text += "<nav aria-label='Page navigation example'>" +
                                          "<ul class='pagination justify-content-end'>" +
                                            "<li class='page-item'><a class='page-link' href='candidate-list.aspx?" + querys + "&page=" + Convert.ToString(firstPage) + "'>First Page</a></li>" +
                                            "<li class='page-item'><a class='page-link' href='candidate-list.aspx?" + querys + "&page=" + Convert.ToString(switchPrevious) + "'>Previous</a></li>" +
                                            "<li class='page-item disabled'><a class='page-link' href='#'>...</a></li>" +
                                            "<li class='page-item'><a class='page-link' href='candidate-list.aspx?" + querys + "&page=" + Convert.ToString(switchPrevious) + "'>" + Convert.ToString(switchPrevious) + "</a></li>" +
                                            "<li class='page-item disabled'><a class='page-link'>" + Convert.ToString(currentPage) + "</a></li>" +
                                            "<li class='page-item disabled'><a class='page-link' href='candidate-list.aspx?" + querys + "&page=" + Convert.ToString(switchNext) + "'>Next</a></li>" +
                                            "<li class='page-item disabled'><a class='page-link' href='candidate-list.aspx?" + querys + "&page=" + Convert.ToString(endPage) + "'>Last Page</a></li>" +
                                          "</ul>" +
                                        "</nav>";
                }
                if (currentPage <= 0)
                {
                    txtPagination.Text = "";
                    txtPagination.Text += "<nav aria-label='Page navigation example'>" +
                                          "<ul class='pagination justify-content-end'>" +
                                            "<li class='page-item disabled'><a class='page-link' href='candidate-list.aspx?" + querys + "&page=" + Convert.ToString(firstPage) + "'>First Page</a></li>" +
                                            "<li class='page-item disabled'><a class='page-link' href='candidate-list.aspx?" + querys + "&page=" + Convert.ToString(switchPrevious) + "'>Previous</a></li>" +
                                            "<li class='page-item disabled'><a class='page-link'>" + Convert.ToString(currentPage) + "</a></li>" +
                                            "<li class='page-item'><a class='page-link' href='candidate-list.aspx?" + querys + "&page=" + Convert.ToString(switchNext) + "'>" + Convert.ToString(switchNext) + "</a></li>" +
                                            "<li class='page-item disabled'><a class='page-link' href='#'>...</a></li>" +
                                            "<li class='page-item'><a class='page-link' href='candidate-list.aspx?" + querys + "&page=" + Convert.ToString(switchNext) + "'>Next</a></li>" +
                                            "<li class='page-item'><a class='page-link' href='candidate-list.aspx?" + querys + "&page=" + Convert.ToString(endPage) + "'>Last Page</a></li>" +
                                          "</ul>" +
                                        "</nav>";
                }
            }
        }
    }
}