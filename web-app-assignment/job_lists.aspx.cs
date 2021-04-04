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

                int limit_per_page = Convert.ToInt32(ddlPageSize.SelectedItem.Value);

                int current_page = Convert.ToInt32(page_num);

                // ensure current page isn't out of range
                if (current_page < 1)
                {
                    current_page = 1;
                }
                else if (current_page > endPage)
                {
                    current_page = endPage;
                    Response.Redirect("job_lists.aspx?page=" + endPage);
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
                            "(SELECT company_name, company_photo, job_rating, job_title, location, salary, job_type, is_premium, R.recruiter_id, post_id" +
                            " FROM JobPost JP, Recruiter R WHERE JP.recruiter_id = R.recruiter_id AND JP.deleted_at IS NULL AND R.is_premium = 'true'" + JobListSearchCriteria(sql) +")" +
                            "UNION" +
                            "(SELECT company_name, company_photo, job_rating, job_title, location, salary, job_type, is_premium, R.recruiter_id, post_id FROM JobPost JP, Recruiter R " +
                            "WHERE JP.recruiter_id = R.recruiter_id AND JP.deleted_at IS NULL AND R.is_premium IS NULL" + JobListSearchCriteria(sql) + ")" +
                            ") result";
                    }
                    else if (ddlPageSize.SelectedItem.Value == "10")
                    {
                        lbl_JobListContentsAllCompanies.Text = "";
                        sql = "SELECT TOP 10 * FROM (" +
                            "(SELECT company_name, company_photo, job_rating, job_title, location, salary, job_type, is_premium, R.recruiter_id, post_id" +
                            " FROM JobPost JP, Recruiter R WHERE JP.recruiter_id = R.recruiter_id AND JP.deleted_at IS NULL AND R.is_premium = 'true'" + JobListSearchCriteria(sql) + ")" +
                            "UNION" +
                            "(SELECT company_name, company_photo, job_rating, job_title, location, salary, job_type, is_premium, R.recruiter_id, post_id FROM JobPost JP, Recruiter R " +
                            "WHERE JP.recruiter_id = R.recruiter_id AND JP.deleted_at IS NULL AND R.is_premium IS NULL" + JobListSearchCriteria(sql) + ")" +
                            ") result";
                    }
                    else if (ddlPageSize.SelectedItem.Value == "15")
                    {
                        lbl_JobListContentsAllCompanies.Text = "";
                        sql = "SELECT TOP 15 * FROM (" +
                            "(SELECT company_name, company_photo, job_rating, job_title, location, salary, job_type, is_premium, R.recruiter_id, post_id" +
                            " FROM JobPost JP, Recruiter R WHERE JP.recruiter_id = R.recruiter_id AND JP.deleted_at IS NULL AND R.is_premium = 'true'" + JobListSearchCriteria(sql) + ")" +
                            "UNION" +
                            "(SELECT company_name, company_photo, job_rating, job_title, location, salary, job_type, is_premium, R.recruiter_id, post_id FROM JobPost JP, Recruiter R " +
                            "WHERE JP.recruiter_id = R.recruiter_id AND JP.deleted_at IS NULL AND R.is_premium IS NULL" + JobListSearchCriteria(sql) + ")" +
                            ") result";
                    }
                }
                else
                {
                    lbl_JobListContentsAllCompanies.Text = "";
                    sql = "SELECT * FROM (" +
                        "(SELECT company_name, company_photo, job_rating, job_title, location, salary, job_type, is_premium, R.recruiter_id, post_id FROM JobPost JP," +
                        " Recruiter R WHERE JP.recruiter_id = R.recruiter_id AND JP.deleted_at IS NULL AND R.is_premium = 'true'" + JobListSearchCriteria(sql) + ")" +
                        "UNION" +
                        "(SELECT company_name, company_photo, job_rating, job_title, location, salary, job_type, is_premium, R.recruiter_id, post_id FROM JobPost JP," +
                        " Recruiter R WHERE JP.recruiter_id = R.recruiter_id AND JP.deleted_at IS NULL AND R.is_premium IS NULL" + JobListSearchCriteria(sql) + ")" +
                        ") result ORDER BY(SELECT NULL) OFFSET " + first_page + " ROWS FETCH NEXT " + limit_per_page + " ROWS ONLY";
                }

                SqlCommand cmd = new SqlCommand(sql, con);

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
                                        "<div class='jobRating ml-2'>" +
                                            "<p>" +
                                                dr["job_rating"].ToString() + "<i class='fas fa-star text-warning ml-2'></i> " +
                                            "</p>" +
                                        "</div>" +
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
                                            "<button type='button' class='btn btn-danger JobListContentsAllCompaniesBoxesDetailsApplyButtonApplyNow' onclick='directContact(" + dr["recruiter_id"].ToString() + ")'> Contact Now </button> " +
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
                sql += " AND job_title LIKE '%" + jobTitlequery + "%' AND job_title IN('" + jobTitlequery + "')";
            }

            if (locationsquery != "")
            {
                sql += " AND location LIKE '%" + locationsquery + "%' AND location IN('" + locationsquery + "')";
            }

            if (jobTypequery != "")
            {
                sql += " AND job_type LIKE '%" + jobTypequery + "%' AND job_type IN('" + jobTypequery + "')";
            }

            if (JobSpecquery != "")
            {
                sql += " AND job_specializations LIKE '%" + JobSpecquery + "%' AND job_specializations IN('" + JobSpecquery + "')";
            }

            if (rangeFromquery != "" && rangeEndquery != "")
            {
                sql += " AND salary BETWEEN " + rangeFromquery + " AND " + rangeEndquery;
            }

            return sql;
        }

        protected void Pagination(int currentPage)
        {
            SqlConnection conSearchTotal = new SqlConnection(strcon);
            if (conSearchTotal.State == ConnectionState.Closed)
            {
                conSearchTotal.Open();
            }

            string jobTitlequery = Request.QueryString["job_title"] ?? "";
            string locationsquery = Request.QueryString["location"] ?? "";
            string jobTypequery = Request.QueryString["job_type"] ?? "";
            string JobSpecquery = Request.QueryString["job_spec"] ?? "";
            string rangeFromquery = Request.QueryString["rangeFrom"] ?? "";
            string rangeEndquery = Request.QueryString["rangeEnd"] ?? "";

            string countItems = "";

            if (jobTitlequery == "" && locationsquery == "" && jobTypequery == "" && JobSpecquery == "" && rangeFromquery == "" && rangeEndquery == "")
            {
                countItems = "SELECT COUNT(*) FROM JobPost";
            }
            else if (jobTitlequery != "" || locationsquery != "" || jobTypequery != "" || JobSpecquery != "" || rangeFromquery != "" || rangeEndquery != "")
            {
                countItems = "SELECT COUNT(*) FROM JobPost WHERE job_title LIKE '%" + jobTitlequery + "%' AND location LIKE '%" + locationsquery + "%' AND job_type LIKE '%" + jobTypequery + "%'" +
                    " AND job_specializations LIKE '%" + JobSpecquery + "%' AND salary BETWEEN " + rangeFromquery + " AND " + rangeEndquery;
            }

            SqlCommand cmdCountJobs = new SqlCommand(countItems, conSearchTotal);

            int endPage = (int)Math.Ceiling(Convert.ToDouble(cmdCountJobs.ExecuteScalar()) / Convert.ToDouble(ddlPageSize.SelectedItem.Value));

            conSearchTotal.Close();

            int switchPrevious = currentPage - 1;
            int switchNext = currentPage + 1;
            int firstPage = 1;
            int secondPage = firstPage + 1;
            int secondLastPage = endPage - 1;

            string querys = "job_title=" + jobTitlequery + "&location=" + locationsquery + "&job_type=" + jobTypequery + "&job_spec=" + JobSpecquery + "&rangeFrom=" + rangeFromquery + "&rangeEnd=" + rangeEndquery ;

            // ensure current page isn't out of range
            if (currentPage < 1)
            {
                currentPage = 1;
            }
            else if (currentPage > endPage)
            {
                currentPage = endPage;
            }

            //if no query
            if (jobTitlequery == "" && locationsquery == "" && jobTypequery == "" && JobSpecquery == "" && rangeFromquery == "" && rangeEndquery == "")
            {
                if (currentPage > firstPage && currentPage < endPage)
                {
                    txtPagination.Text = "";
                    txtPagination.Text += "<nav aria-label='Page navigation example'>" +
                                          "<ul class='pagination justify-content-end'>" +
                                            "<li class='page-item'><a class='page-link' href='job_lists.aspx?page=" + Convert.ToString(firstPage) + "'>First Page</a></li>" +
                                            "<li class='page-item'><a class='page-link' href='job_lists.aspx?page=" + Convert.ToString(switchPrevious) + "'>Previous</a></li>" +
                                            "<li class='page-item disabled'><a class='page-link' href='#'>...</a></li>" +
                                            "<li class='page-item'><a class='page-link' href='job_lists.aspx?page=" + Convert.ToString(switchPrevious) + "'>" + Convert.ToString(switchPrevious) + "</a></li>" +
                                            "<li class='page-item disabled'><a class='page-link'>" + Convert.ToString(currentPage) + "</a></li>" +
                                            "<li class='page-item'><a class='page-link' href='job_lists.aspx?page=" + Convert.ToString(switchNext) + "'>" + Convert.ToString(switchNext) + "</a></li>" +
                                            "<li class='page-item disabled'><a class='page-link' href='#'>...</a></li>" +
                                            "<li class='page-item'><a class='page-link' href='job_lists.aspx?page=" + Convert.ToString(switchNext) + "'>Next</a></li>" +
                                            "<li class='page-item'><a class='page-link' href='job_lists.aspx?page=" + Convert.ToString(endPage) + "'>Last Page</a></li>" +
                                          "</ul>" +
                                        "</nav>";
                }
                if (currentPage == firstPage)
                {
                    txtPagination.Text = "";
                    txtPagination.Text += "<nav aria-label='Page navigation example'>" +
                                          "<ul class='pagination justify-content-end'>" +
                                            "<li class='page-item disabled'><a class='page-link' href='job_lists.aspx?page=" + Convert.ToString(firstPage) + "'>First Page</a></li>" +
                                            "<li class='page-item disabled'><a class='page-link' href='job_lists.aspx?page=" + Convert.ToString(switchPrevious) + "'>Previous</a></li>" +
                                            "<li class='page-item disabled'><a class='page-link'>" + Convert.ToString(currentPage) + "</a></li>" +
                                            "<li class='page-item'><a class='page-link' href='job_lists.aspx?page=" + Convert.ToString(switchNext) + "'>" + Convert.ToString(switchNext) + "</a></li>" +
                                            "<li class='page-item disabled'><a class='page-link' href='#'>...</a></li>" +
                                            "<li class='page-item'><a class='page-link' href='job_lists.aspx?page=" + Convert.ToString(switchNext) + "'>Next</a></li>" +
                                            "<li class='page-item'><a class='page-link' href='job_lists.aspx?page=" + Convert.ToString(endPage) + "'>Last Page</a></li>" +
                                          "</ul>" +
                                        "</nav>";
                }
                if (currentPage == endPage)
                {
                    txtPagination.Text = "";
                    txtPagination.Text += "<nav aria-label='Page navigation example'>" +
                                          "<ul class='pagination justify-content-end'>" +
                                            "<li class='page-item'><a class='page-link' href='job_lists.aspx?page=" + Convert.ToString(firstPage) + "'>First Page</a></li>" +
                                            "<li class='page-item'><a class='page-link' href='job_lists.aspx?page=" + Convert.ToString(switchPrevious) + "'>Previous</a></li>" +
                                            "<li class='page-item disabled'><a class='page-link' href='#'>...</a></li>" +
                                            "<li class='page-item'><a class='page-link' href='job_lists.aspx?page=" + Convert.ToString(switchPrevious) + "'>" + Convert.ToString(switchPrevious) + "</a></li>" +
                                            "<li class='page-item disabled'><a class='page-link'>" + Convert.ToString(currentPage) + "</a></li>" +
                                            "<li class='page-item disabled'><a class='page-link' href='job_lists.aspx?page=" + Convert.ToString(switchNext) + "'>Next</a></li>" +
                                            "<li class='page-item disabled'><a class='page-link' href='job_lists.aspx?page=" + Convert.ToString(endPage) + "'>Last Page</a></li>" +
                                          "</ul>" +
                                        "</nav>";
                }
                if (currentPage <= 0)
                {
                    txtPagination.Text = "";
                    txtPagination.Text += "<nav aria-label='Page navigation example'>" +
                                          "<ul class='pagination justify-content-end'>" +
                                            "<li class='page-item disabled'><a class='page-link' href='job_lists.aspx?page=" + Convert.ToString(firstPage) + "'>First Page</a></li>" +
                                            "<li class='page-item disabled'><a class='page-link' href='job_lists.aspx?page=" + Convert.ToString(switchPrevious) + "'>Previous</a></li>" +
                                            "<li class='page-item disabled'><a class='page-link'>" + Convert.ToString(currentPage) + "</a></li>" +
                                            "<li class='page-item'><a class='page-link' href='job_lists.aspx?page=" + Convert.ToString(switchNext) + "'>" + Convert.ToString(switchNext) + "</a></li>" +
                                            "<li class='page-item disabled'><a class='page-link' href='#'>...</a></li>" +
                                            "<li class='page-item'><a class='page-link' href='job_lists.aspx?page=" + Convert.ToString(switchNext) + "'>Next</a></li>" +
                                            "<li class='page-item'><a class='page-link' href='job_lists.aspx?page=" + Convert.ToString(endPage) + "'>Last Page</a></li>" +
                                          "</ul>" +
                                        "</nav>";
                }
                if (currentPage <= 0)
                {
                    txtPagination.Text = "";
                    txtPagination.Text += "<nav aria-label='Page navigation example'>" +
                                          "<ul class='pagination justify-content-end'>" +
                                            "<li class='page-item disabled'><a class='page-link' href='job_lists.aspx?page=" + Convert.ToString(firstPage) + "'>First Page</a></li>" +
                                            "<li class='page-item disabled'><a class='page-link' href='job_lists.aspx?page=" + Convert.ToString(switchPrevious) + "'>Previous</a></li>" +
                                            "<li class='page-item disabled'><a class='page-link'>" + Convert.ToString(currentPage) + "</a></li>" +
                                            "<li class='page-item'><a class='page-link' href='job_lists.aspx?page=" + Convert.ToString(switchNext) + "'>" + Convert.ToString(switchNext) + "</a></li>" +
                                            "<li class='page-item disabled'><a class='page-link' href='#'>...</a></li>" +
                                            "<li class='page-item'><a class='page-link' href='job_lists.aspx?page=" + Convert.ToString(switchNext) + "'>Next</a></li>" +
                                            "<li class='page-item'><a class='page-link' href='job_lists.aspx?page=" + Convert.ToString(endPage) + "'>Last Page</a></li>" +
                                          "</ul>" +
                                        "</nav>";
                }

                if (currentPage == secondPage)
                {
                    txtPagination.Text = "";
                    txtPagination.Text += "<nav aria-label='Page navigation example'>" +
                                          "<ul class='pagination justify-content-end'>" +
                                            "<li class='page-item'><a class='page-link' href='job_lists.aspx?page=" + Convert.ToString(firstPage) + "'>First Page</a></li>" +
                                            "<li class='page-item'><a class='page-link' href='job_lists.aspx?page=" + Convert.ToString(switchPrevious) + "'>Previous</a></li>" +
                                            "<li class='page-item'><a class='page-link' href='job_lists.aspx?page=" + Convert.ToString(switchPrevious) + "'>" + Convert.ToString(switchPrevious) + "</a></li>" +
                                            "<li class='page-item disabled'><a class='page-link'>" + Convert.ToString(currentPage) + "</a></li>" +
                                            "<li class='page-item'><a class='page-link' href='job_lists.aspx?page=" + Convert.ToString(switchNext) + "'>" + Convert.ToString(switchNext) + "</a></li>" +
                                            "<li class='page-item disabled'><a class='page-link' href='#'>...</a></li>" +
                                            "<li class='page-item'><a class='page-link' href='job_lists.aspx?page=" + Convert.ToString(switchNext) + "'>Next</a></li>" +
                                            "<li class='page-item'><a class='page-link' href='job_lists.aspx?page=" + Convert.ToString(endPage) + "'>Last Page</a></li>" +
                                          "</ul>" +
                                        "</nav>";
                }

                if (currentPage == secondLastPage)
                {
                    txtPagination.Text = "";
                    txtPagination.Text += "<nav aria-label='Page navigation example'>" +
                                          "<ul class='pagination justify-content-end'>" +
                                            "<li class='page-item'><a class='page-link' href='job_lists.aspx?page=" + Convert.ToString(firstPage) + "'>First Page</a></li>" +
                                            "<li class='page-item'><a class='page-link' href='job_lists.aspx?page=" + Convert.ToString(switchPrevious) + "'>Previous</a></li>" +
                                            "<li class='page-item disabled'><a class='page-link' href='#'>...</a></li>" +
                                            "<li class='page-item'><a class='page-link' href='job_lists.aspx?page=" + Convert.ToString(switchPrevious) + "'>" + Convert.ToString(switchPrevious) + "</a></li>" +
                                            "<li class='page-item disabled'><a class='page-link'>" + Convert.ToString(currentPage) + "</a></li>" +
                                            "<li class='page-item'><a class='page-link' href='job_lists.aspx?page=" + Convert.ToString(switchNext) + "'>" + Convert.ToString(switchNext) + "</a></li>" +
                                            "<li class='page-item'><a class='page-link' href='job_lists.aspx?page=" + Convert.ToString(switchNext) + "'>Next</a></li>" +
                                            "<li class='page-item'><a class='page-link' href='job_lists.aspx?page=" + Convert.ToString(endPage) + "'>Last Page</a></li>" +
                                          "</ul>" +
                                        "</nav>";
                }
            }//if got query
            else if (jobTitlequery != "" || locationsquery != "" || jobTypequery != "" || JobSpecquery != "" || rangeFromquery != "" || rangeEndquery != "")
            {
                if (currentPage > firstPage && currentPage < endPage)
                {
                    txtPagination.Text = "";
                    txtPagination.Text += "<nav aria-label='Page navigation example'>" +
                                          "<ul class='pagination justify-content-end'>" +
                                            "<li class='page-item'><a class='page-link' href='job_lists.aspx?" + querys + "&page=" + Convert.ToString(firstPage) +"'>First Page</a></li>" +
                                            "<li class='page-item'><a class='page-link' href='job_lists.aspx?" + querys + "&page=" + Convert.ToString(switchPrevious) + "'>Previous</a></li>" +
                                            "<li class='page-item disabled'><a class='page-link' href='#'>...</a></li>" +
                                            "<li class='page-item'><a class='page-link' href='job_lists.aspx?" + querys + "&page=" + Convert.ToString(switchPrevious) + "'>" + Convert.ToString(switchPrevious) + "</a></li>" +
                                            "<li class='page-item disabled'><a class='page-link'>" + Convert.ToString(currentPage) + "</a></li>" +
                                            "<li class='page-item'><a class='page-link' href='job_lists.aspx?" + querys + "&page=" + Convert.ToString(switchNext) + "'>" + Convert.ToString(switchNext) + "</a></li>" +
                                            "<li class='page-item disabled'><a class='page-link' href='#'>...</a></li>" +
                                            "<li class='page-item'><a class='page-link' href='job_lists.aspx?" + querys + "&page=" + Convert.ToString(switchNext) + "'>Next</a></li>" +
                                            "<li class='page-item'><a class='page-link' href='job_lists.aspx?" + querys + "&page=" + Convert.ToString(endPage) + "'>Last Page</a></li>" +
                                          "</ul>" +
                                        "</nav>";
                }
                if (currentPage == firstPage)
                {
                    txtPagination.Text = "";
                    txtPagination.Text += "<nav aria-label='Page navigation example'>" +
                                          "<ul class='pagination justify-content-end'>" +
                                            "<li class='page-item disabled'><a class='page-link' href='job_lists.aspx?" + querys + "&page=" + Convert.ToString(firstPage) + "'>First Page</a></li>" +
                                            "<li class='page-item disabled'><a class='page-link' href='job_lists.aspx?" + querys + "&page=" + Convert.ToString(switchPrevious) + "'>Previous</a></li>" +
                                            "<li class='page-item disabled'><a class='page-link'>" + Convert.ToString(currentPage) + "</a></li>" +
                                            "<li class='page-item'><a class='page-link' href='job_lists.aspx?" + querys + "&page=" + Convert.ToString(switchNext) + "'>" + Convert.ToString(switchNext) + "</a></li>" +
                                            "<li class='page-item disabled'><a class='page-link' href='#'>...</a></li>" +
                                            "<li class='page-item'><a class='page-link' href='job_lists.aspx?" + querys + "&page=" + Convert.ToString(switchNext) + "'>Next</a></li>" +
                                            "<li class='page-item'><a class='page-link' href='job_lists.aspx?" + querys + "&page=" + Convert.ToString(endPage) + "'>Last Page</a></li>" +
                                          "</ul>" +
                                        "</nav>";
                }
                if (currentPage == endPage)
                {
                    txtPagination.Text = "";
                    txtPagination.Text += "<nav aria-label='Page navigation example'>" +
                                          "<ul class='pagination justify-content-end'>" +
                                            "<li class='page-item'><a class='page-link' href='job_lists.aspx?" + querys + "&page=" + Convert.ToString(firstPage) + "'>First Page</a></li>" +
                                            "<li class='page-item'><a class='page-link' href='job_lists.aspx?" + querys + "&page=" + Convert.ToString(switchPrevious) + "'>Previous</a></li>" +
                                            "<li class='page-item disabled'><a class='page-link' href='#'>...</a></li>" +
                                            "<li class='page-item'><a class='page-link' href='job_lists.aspx?" + querys + "&page=" + Convert.ToString(switchPrevious) + "'>" + Convert.ToString(switchPrevious) + "</a></li>" +
                                            "<li class='page-item disabled'><a class='page-link'>" + Convert.ToString(currentPage) + "</a></li>" +
                                            "<li class='page-item disabled'><a class='page-link' href='job_lists.aspx?" + querys + "&page=" + Convert.ToString(switchNext) + "'>Next</a></li>" +
                                            "<li class='page-item disabled'><a class='page-link' href='job_lists.aspx?" + querys + "&page=" + Convert.ToString(endPage) + "'>Last Page</a></li>" +
                                          "</ul>" +
                                        "</nav>";
                }
                if (currentPage <= 0)
                {
                    txtPagination.Text = "";
                    txtPagination.Text += "<nav aria-label='Page navigation example'>" +
                                          "<ul class='pagination justify-content-end'>" +
                                            "<li class='page-item disabled'><a class='page-link' href='job_lists.aspx?" + querys + "&page=" + Convert.ToString(firstPage) + "'>First Page</a></li>" +
                                            "<li class='page-item disabled'><a class='page-link' href='job_lists.aspx?" + querys + "&page=" + Convert.ToString(switchPrevious) + "'>Previous</a></li>" +
                                            "<li class='page-item disabled'><a class='page-link'>" + Convert.ToString(currentPage) + "</a></li>" +
                                            "<li class='page-item'><a class='page-link' href='job_lists.aspx?" + querys + "&page=" + Convert.ToString(switchNext) + "'>" + Convert.ToString(switchNext) + "</a></li>" +
                                            "<li class='page-item disabled'><a class='page-link' href='#'>...</a></li>" +
                                            "<li class='page-item'><a class='page-link' href='job_lists.aspx?" + querys + "&page=" + Convert.ToString(switchNext) + "'>Next</a></li>" +
                                            "<li class='page-item'><a class='page-link' href='job_lists.aspx?" + querys + "&page=" + Convert.ToString(endPage) + "'>Last Page</a></li>" +
                                          "</ul>" +
                                        "</nav>";
                }
                if (currentPage <= 0)
                {
                    txtPagination.Text = "";
                    txtPagination.Text += "<nav aria-label='Page navigation example'>" +
                                          "<ul class='pagination justify-content-end'>" +
                                            "<li class='page-item disabled'><a class='page-link' href='job_lists.aspx?" + querys + "&page=" + Convert.ToString(firstPage) + "'>First Page</a></li>" +
                                            "<li class='page-item disabled'><a class='page-link' href='job_lists.aspx?" + querys + "&page=" + Convert.ToString(switchPrevious) + "'>Previous</a></li>" +
                                            "<li class='page-item disabled'><a class='page-link'>" + Convert.ToString(currentPage) + "</a></li>" +
                                            "<li class='page-item'><a class='page-link' href='job_lists.aspx?" + querys + "&page=" + Convert.ToString(switchNext) + "'>" + Convert.ToString(switchNext) + "</a></li>" +
                                            "<li class='page-item disabled'><a class='page-link' href='#'>...</a></li>" +
                                            "<li class='page-item'><a class='page-link' href='job_lists.aspx?" + querys + "&page=" + Convert.ToString(switchNext) + "'>Next</a></li>" +
                                            "<li class='page-item'><a class='page-link' href='job_lists.aspx?" + querys + "&page=" + Convert.ToString(endPage) + "'>Last Page</a></li>" +
                                          "</ul>" +
                                        "</nav>";
                }
            }
        }
    }
}