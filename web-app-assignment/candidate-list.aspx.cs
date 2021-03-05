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
            if (!Page.IsPostBack) {
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

                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    string sql = "SELECT * FROM JobSeeker WHERE deleted_at IS NULL;";

                    SqlCommand cmd = new SqlCommand(sql, con);

                    SqlDataReader dr = cmd.ExecuteReader();

                    int count = 1;

                    while (dr.Read())
                    {

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
                                                "<button type='button' class='btn btn-primary JobListContentsAllCompaniesBoxesDetailsApplyButtonApplyNow' onclick='directDetails(" + count + ")'> More Details </button> " +
                                                "<button type='button' class='btn btn-danger JobListContentsAllCompaniesBoxesDetailsApplyButtonApplyNow' onclick='directContact()'> Contact Now </button> " +
                                            "</div>" +
                                        "</div>" +
                                    "</div>" +
                                "</div>" +
                            "</div>";
                        count++;
                    }

                    con.Close();
                }
            catch (Exception error)
                {
                    Response.Write("<script>alert('" + error.Message + "');</script>");
                }
            }
        }

        protected void btn_JobListContentsBackgroundInputsSearchButton_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                string selectedSkill = "";
                string selectedLocation = "";
                string selectedIndustry = "";
                string selectedProfession = "";

                string sql = "SELECT * FROM JobSeeker";

                SqlCommand cmd = new SqlCommand(sql, con);

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    selectedSkill = dr["skills"].ToString();
                    selectedLocation = dr["location"].ToString();
                    selectedIndustry = dr["prefer_industry"].ToString();
                    selectedProfession = dr["profession"].ToString();
                }

                //Split the Selected Industry
                string[] split_Industry = selectedIndustry.Split(',');
                string[] split_selectedSkill = selectedSkill.Split(',');
                string[] split_selectedProfession = selectedProfession.Split(',');
                string[] split_selectedLocation = selectedLocation.Split(',');

                for (int i = 0; i < split_Industry.Length; i++)
                {

                    if (lstSearchIndustry.Items.FindByValue(split_Industry[i]) != null)
                    {
                        lstSearchIndustry.Items.FindByValue(split_Industry[i]).Selected = true;
                    }
                    else
                    {
                        lstSearchIndustry.Items.Insert(0, new ListItem(split_Industry[i], split_Industry[i]));
                        lstSearchIndustry.Items.FindByValue(split_Industry[i]).Selected = true;
                    }
                }

                for (int i = 0; i < split_selectedSkill.Length; i++)
                {

                    if (lstSearchSkills.Items.FindByValue(split_selectedSkill[i]) != null)
                    {
                        lstSearchSkills.Items.FindByValue(split_selectedSkill[i]).Selected = true;
                    }
                    else
                    {
                        lstSearchSkills.Items.Insert(0, new ListItem(split_selectedSkill[i], split_selectedSkill[i]));
                        lstSearchSkills.Items.FindByValue(split_selectedSkill[i]).Selected = true;
                    }
                }

                for (int i = 0; i < split_selectedProfession.Length; i++)
                {

                    if (lstSearchJobProfession.Items.FindByValue(split_selectedProfession[i]) != null)
                    {
                        lstSearchJobProfession.Items.FindByValue(split_selectedProfession[i]).Selected = true;
                    }
                    else
                    {
                        lstSearchJobProfession.Items.Insert(0, new ListItem(split_selectedProfession[i], split_selectedProfession[i]));
                        lstSearchJobProfession.Items.FindByValue(split_selectedProfession[i]).Selected = true;
                    }
                }

                for (int i = 0; i < split_selectedLocation.Length; i++)
                {

                    if (lstSearchLocation.Items.FindByValue(split_selectedLocation[i]) != null)
                    {
                        lstSearchLocation.Items.FindByValue(split_selectedLocation[i]).Selected = true;
                    }
                    else
                    {
                        lstSearchLocation.Items.Insert(0, new ListItem(split_selectedLocation[i], split_selectedLocation[i]));
                        lstSearchLocation.Items.FindByValue(split_selectedLocation[i]).Selected = true;
                    }
                }

                con.Close();

                SqlConnection con2 = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                string sql2 = "SELECT * FROM JobSeeker WHERE profession LIKE '" + lstSearchJobProfession.Items + "%' OR location LIKE '" + lstSearchLocation.Items + "%' OR " +
                    "skills LIKE '" + lstSearchSkills.Items + "%' OR prefer_industry LIKE '" + lstSearchIndustry.Items + "%' AND deleted_at IS NULL;";

                SqlCommand cmd2 = new SqlCommand(sql2, con2);

                SqlDataReader dr2 = cmd.ExecuteReader();

                int count = 1;

                while (dr2.Read())
                {

                    lbl_JobListContentsAllCompanies.Text +=
                        "<div class='col-sm-6 mt-3'>" +
                            "<div class='JobListContentsAllCompaniesBoxes'> " +
                                "<div class='JobListContentsAllCompaniesBoxesCompanyLogoPosition'>" +
                                    "<img src='" + dr2["user_photo"].ToString() + "' alt='job seeker' class='JobListContentsAllCompaniesBoxesCompanyLogoPosition'/>" +
                                    "<div class='JobListContentsAllCompaniesBoxesDetailsStars'>" +
                                        "<%--Stars Here--%>" +
                                        "<p>Stars</p>" +
                                    "</div>" +
                                "</div>" +
                                "<div class='JobListContentsAllCompaniesBoxesDetails'>" +
                                    "<h4 class='JobListContentsAllCompaniesBoxesDetailsTitle'>" +
                                        dr2["full_name"].ToString() +
                                    "</h4>" +
                                    "<div class='JobListContentsAllCompaniesBoxesDetailsBody'>" +
                                        "<div class='JobListContentsAllCompaniesBoxesDetailsBodyContents'>" +
                                            "<img src='images/JobsList/working-position.png' alt='position' class='JobListContentsAllCompaniesBoxesImages'/>" +
                                            "<p class='JobListContentsAllCompaniesBoxesDetailsBodyContentsDescription'>" + dr2["profession"].ToString() + "</p>" +
                                        "</div>" +
                                        "<div class='JobListContentsAllCompaniesBoxesDetailsBodyContents'>" +
                                            "<img src='images/JobsList/pin.png' alt='location' class='JobListContentsAllCompaniesBoxesImages'/>" +
                                            "<p class='JobListContentsAllCompaniesBoxesDetailsBodyContentsDescription'>" + dr2["location"].ToString() + "</p>" +
                                        "</div>" +
                                        "<div class='JobListContentsAllCompaniesBoxesDetailsBodyContents'>" +
                                            "<img src='images/JobsList/salary.png' alt='salary' class='JobListContentsAllCompaniesBoxesImages'/>" +
                                            "<p class='JobListContentsAllCompaniesBoxesDetailsBodyContentsDescription'>" + dr2["prefer_industry"].ToString() + "</p>" +
                                        "</div>" +
                                        "<div class='JobListContentsAllCompaniesBoxesDetailsBodyContents'>" +
                                            "<img src='images/JobsList/clock.png' alt='employee status' class='JobListContentsAllCompaniesBoxesImages'/>" +
                                            "<p class='JobListContentsAllCompaniesBoxesDetailsBodyContentsDescription'>" + dr2["experience"].ToString() + "</p>" +
                                        "</div>" +
                                    "</div>" +
                                    "<div class='JobListContentsAllCompaniesBoxesDetailsFooter'>" +
                                        "<div class='JobListContentsAllCompaniesBoxesDetailsApplyDetailsButton'>" +
                                            "<button type='button' class='btn btn-primary JobListContentsAllCompaniesBoxesDetailsApplyButtonApplyNow' onclick='directDetails(" + count + ")'> More Details </button> " +
                                            "<button type='button' class='btn btn-danger JobListContentsAllCompaniesBoxesDetailsApplyButtonApplyNow' onclick='directContact()'> Contact Now </button> " +
                                        "</div>" +
                                    "</div>" +
                                "</div>" +
                            "</div>" +
                        "</div>";
                    count++;
                }
            }
            catch (Exception error)
            {
                Response.Write("<script>alert('" + error.Message + "');</script>");
            }
        }
    }
}