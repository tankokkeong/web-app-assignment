using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace web_app_assignment
{
    public partial class edit_postob : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //Load out the industry list
                List<string> IndustryListItems = new List<string>
                {
                    "Conveyor Vulcanizing",
                    "Digital Imaging",
                    "High Precision Tools And Die Maintenance",
                    "Manufacturing Systems Designers",
                    "Experts In Steel Treatment(Melting And Casting)",
                    "Underwater welders",
                    "Material Technologists",
                    "Instrument Specialists(For Petrochemical Industry)",
                    "Sensor Technologist",
                    "Wireless Technologist",
                    "Radio Frequency Designers",
                    "Auto Systems Designers",
                    "Offshore Field Operation",
                    "Photonics",
                    "Wafer Fabrication",
                    "Metallurgist",
                    "Geo sciences and Geophysical Disciplines",
                    "Metallurgists",
                    "Geotechnologists",
                    "Geoscientists",
                    "Seismologists",
                    "Medical and Pharmaceutical",
                    "Technical",
                    "Production",
                    "Specialists",
                    "Electrical & Electronics",
                    "Analogue Designers",
                    "Microwave Designers",
                    "Environment",
                    "Renewable Energy",
                    "Textiles & Minerals Industry",
                    "Dye Technologists",
                    "Embroidery Specialists",
                    "Dyeing Technicians",
                    "Apparel Specialists",
                    "Craft / Design Specialists",
                    "Fabric Specialists",
                    "Jewelry Designers",
                    "Designers",
                    "Teachers and Trainers for Jewellery Production",
                    "Cutting Specialists",
                    "Wood Industry",
                    "Wood Technologists",
                    "Designers",
                    "Technical Specialists",
                    "Craftsman / Engraving",
                    "Framework / Design Cutting Specialists",
                    "Food Industry / Biotechnology",
                    "Product / Flavoring Specialist",
                    "Biotechnology Analysts",
                    "Dyestuff Specialists",
                    "Biotechnologists",
                    "Tea / Food Tasters",
                    "Food / Nutrient Technologists",
                    "Disease Control / Quarantine",
                    "Genetic Engineering Specialists",
                    "Distributive & retail sectors",
                    "Supermarket and mini market",
                    "Provision shop",
                    "Furnitures  and fittings",
                    "Photo frames shop",
                    "Textiles and clothings",
                    "Computer accessories",
                    "Hair salon",
                    "Laundry shop",
                    "Small and non - exclusive Restaurant",
                    "Prepaid card Business",
                    "Cyber Café",
                    "Car glass and aluminium workshop",
                    "Herbal  product Business",
                    "Spa - only for shareholders and spa in hotels",
                    "Restaurant, bistro and café – exclusive concept & shareholders allowed",
                    "Cleaning and maintenance",
                    "Massage parlour",
                    "Construction industry",
                    "Electrical chargeman",
                    "Electrical Wireman",
                    "Telephone and Telegraph Fixing",
                    "Air conducting Fixing",
                    "Installation of  lift and escalator",
                    "Excavator operator",
                    "Shovel operator",
                    "Timber industry",
                    "Timber Factories – Most categories of job",
                    "Furniture factory –  All machinery specialist",
                    "Forest Mills – Most categories of job"
                };

                lstIndustry.DataSource = IndustryListItems;
                lstIndustry.DataBind();

                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    string job_id = Request.QueryString["job"];

                    //Multiple Selection variable
                    string selected_industry = "";
                    string selected_qualification = "";
                    string selected_specializations = "";
                    string selected_benefitsOthers = "";

                    string sql = "SELECT * FROM JobPost WHERE post_id = @job_id";

                    //Connect to the database
                    SqlCommand cmd = new SqlCommand(sql, con);


                    //Insert parameters
                    cmd.Parameters.AddWithValue("@job_id", job_id);

                    SqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        txtJobTitle.Text = dr["job_title"].ToString();
                        txtJobDescription.Text = dr["job_description"].ToString();
                        txtSalary.Text = dr["salary"].ToString();
                        txtWorkingHours.Text = dr["working_hours"].ToString();
                        txtCompanyOverview.Text = dr["company_overview"].ToString();
                        txtLocation.Text = dr["location"].ToString();
                        txtExperienceNeeded.Text = dr["experience_needed"].ToString();
                        ddlJobType.SelectedValue = dr["job_type"].ToString();
                        txtHeadQuarter.Text = dr["head_quaters"].ToString();
                        ddlCompanySize.SelectedValue = dr["company_size"].ToString();
                        txtProcessingTime.Text = dr["process_time"].ToString();

                        //Multiple Selection retrieve
                        selected_industry = dr["industry"].ToString();
                        selected_qualification = dr["qualification"].ToString();
                        selected_specializations = dr["job_specializations"].ToString();
                        selected_benefitsOthers = dr["benefits_others"].ToString();
                    }

                    //Close connection
                    con.Close();

                    //Split the Selected Industry
                    string[] split_industries = selected_industry.Split(',');

                    //Print out the result
                    for (int i = 0; i < split_industries.Length; i++)
                    {

                        if (lstIndustry.Items.FindByValue(split_industries[i]) != null)
                        {
                            lstIndustry.Items.FindByValue(split_industries[i]).Selected = true;
                        }
                        else
                        {
                            lstIndustry.Items.Insert(0, new ListItem(split_industries[i], split_industries[i]));
                            lstIndustry.Items.FindByValue(split_industries[i]).Selected = true;
                        }
                    }

                    //Split the Selected Qualification
                    string[] split_qualification = selected_qualification.Split(',');

                    //Print out the result
                    for (int i = 0; i < split_qualification.Length; i++)
                    {

                        if (lstQualification.Items.FindByValue(split_qualification[i]) != null)
                        {
                            lstQualification.Items.FindByValue(split_qualification[i]).Selected = true;
                        }
                        else
                        {
                            lstQualification.Items.Insert(0, new ListItem(split_qualification[i], split_qualification[i]));
                            lstQualification.Items.FindByValue(split_qualification[i]).Selected = true;
                        }
                    }

                    //Split the Selected Sepcialization
                    string[] split_specializations = selected_specializations.Split(',');

                    //Print out the result
                    for (int i = 0; i < split_specializations.Length; i++)
                    {

                        if (lstJobSpecialization.Items.FindByValue(split_specializations[i]) != null)
                        {
                            lstJobSpecialization.Items.FindByValue(split_specializations[i]).Selected = true;
                        }
                        else
                        {
                            lstJobSpecialization.Items.Insert(0, new ListItem(split_specializations[i], split_specializations[i]));
                            lstJobSpecialization.Items.FindByValue(split_specializations[i]).Selected = true;
                        }
                    }

                    //Split the Selected Benefits & Others
                    string[] split_benefitsOthers = selected_benefitsOthers.Split(',');

                    //Print out the result
                    for (int i = 0; i < split_benefitsOthers.Length; i++)
                    {

                        if (lstBenefits.Items.FindByValue(split_benefitsOthers[i]) != null)
                        {
                            lstBenefits.Items.FindByValue(split_benefitsOthers[i]).Selected = true;
                        }
                        else
                        {
                            lstBenefits.Items.Insert(0, new ListItem(split_benefitsOthers[i], split_benefitsOthers[i]));
                            lstBenefits.Items.FindByValue(split_benefitsOthers[i]).Selected = true;
                        }
                    }

                }
                catch (Exception error)
                {
                    lblError.Text = error.Message;
                }
            }
                
        }

        protected void btnUpdateJob_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                //Get Query String
                string job_id = Request.QueryString["job"];

                //Read inputs from multiple selections
                var selected_industry = "";
                var selected_qualification = "";
                var selected_specilizations = "";
                var selected_benefits = "";
                int selected_count = 0;


                //Split Selected Industry
                for (int loop = 0; loop < lstIndustry.Items.Count; loop++)
                {
                    if (lstIndustry.Items.FindByValue(lstIndustry.Items[loop].ToString()).Selected == true)
                    {
                        if (selected_count == 0)
                        {
                            selected_industry = lstIndustry.Items[loop].ToString();
                        }
                        else
                        {
                            selected_industry = selected_industry + "," + lstIndustry.Items[loop].ToString();
                        }

                        //Increase the selected value
                        selected_count++;

                    }

                }

                //Reset Select Count
                selected_count = 0;

                //Split Selected Qualifications
                for (int loop = 0; loop < lstQualification.Items.Count; loop++)
                {
                    if (lstQualification.Items.FindByValue(lstQualification.Items[loop].ToString()).Selected == true)
                    {
                        if (selected_count == 0)
                        {
                            selected_qualification = lstQualification.Items[loop].ToString();
                        }
                        else
                        {
                            selected_qualification = selected_qualification + "," + lstQualification.Items[loop].ToString();
                        }

                        //Increase the selected value
                        selected_count++;

                    }

                }

                //Reset Select Count
                selected_count = 0;

                //Split Selected Specializations
                for (int loop = 0; loop < lstJobSpecialization.Items.Count; loop++)
                {
                    if (lstJobSpecialization.Items.FindByValue(lstJobSpecialization.Items[loop].ToString()).Selected == true)
                    {
                        if (selected_count == 0)
                        {
                            selected_specilizations = lstJobSpecialization.Items[loop].ToString();
                        }
                        else
                        {
                            selected_specilizations = selected_specilizations + "," + lstJobSpecialization.Items[loop].ToString();
                        }

                        //Increase the selected value
                        selected_count++;

                    }

                }

                //Reset Select Count
                selected_count = 0;

                //Split Selected benefits
                for (int loop = 0; loop < lstBenefits.Items.Count; loop++)
                {
                    if (lstBenefits.Items.FindByValue(lstBenefits.Items[loop].ToString()).Selected == true)
                    {
                        if (selected_count == 0)
                        {
                            selected_benefits = lstBenefits.Items[loop].ToString();
                        }
                        else
                        {
                            selected_benefits = selected_benefits + "," + lstBenefits.Items[loop].ToString();
                        }

                        //Increase the selected value
                        selected_count++;

                    }

                }


                //Read input from the form
                var job_title = txtJobTitle.Text;
                var job_description = HttpUtility.UrlDecode(txtJobDescription.Text);
                var salary = txtSalary.Text;
                var working_hours = txtWorkingHours.Text;
                var company_overview = HttpUtility.UrlDecode(txtCompanyOverview.Text);
                var location = txtLocation.Text;
                var experience_needed = txtExperienceNeeded.Text;
                var job_type = ddlJobType.SelectedValue;
                var head_quaters = txtHeadQuarter.Text;
                var company_size = ddlCompanySize.SelectedValue;
                var processing_time = txtProcessingTime.Text;

                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }



                    string sql = "Update JobPost " +
                            "SET job_title = @job_title, " +
                            "job_description = @job_description, " +
                            "salary = @salary, " +
                            "industry = @industry, " +
                            "qualification = @qualification, " +
                            "working_hours = @working_hours, " +
                            "job_specializations = @job_specializations," +
                            "company_overview = @company_overview, " +
                            "location = @location, " +
                            "experience_needed = @experience_needed, " +
                            "job_type = @job_type, " +
                            "head_quaters = @head_quaters, " +
                            "benefits_others = @benefits_others, " +
                            "company_size =@company_size, " +
                            "process_time = @process_time " +
                            "WHERE post_id = @post_id";
                                

                    //Connect to the database
                    SqlCommand cmd = new SqlCommand(sql, con);


                    //Insert parameters
                    cmd.Parameters.AddWithValue("@job_title", job_title);
                    cmd.Parameters.AddWithValue("@job_description", job_description);
                    cmd.Parameters.AddWithValue("@salary", salary);
                    cmd.Parameters.AddWithValue("@industry", selected_industry);
                    cmd.Parameters.AddWithValue("@qualification", selected_qualification);
                    cmd.Parameters.AddWithValue("@working_hours", working_hours);
                    cmd.Parameters.AddWithValue("@job_specializations", selected_qualification);
                    cmd.Parameters.AddWithValue("@company_overview", company_overview);
                    cmd.Parameters.AddWithValue("@location", location);
                    cmd.Parameters.AddWithValue("@experience_needed", experience_needed);
                    cmd.Parameters.AddWithValue("@job_type", job_type);
                    cmd.Parameters.AddWithValue("@head_quaters", head_quaters);
                    cmd.Parameters.AddWithValue("@benefits_others", selected_benefits);
                    cmd.Parameters.AddWithValue("@company_size", company_size);
                    cmd.Parameters.AddWithValue("@process_time", processing_time);
                    cmd.Parameters.AddWithValue("@post_id", Convert.ToInt32(job_id));

                    //Execute the queries
                    cmd.ExecuteNonQuery();
                    con.Close();

                    Response.Write("<script>alert('Record Updated successful!');</script>");

                }
                catch (Exception error)
                {
                    lblError.Text = error.Message;
                }
            }
            else
            {
                lblError.Text = "FAILED";
            }
        
        }
    }
}