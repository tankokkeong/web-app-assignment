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
    public partial class edit_user : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                List<string> countryListItems = new List<string>{
            "Afghanistan",
                "Albania",
                "Algeria",
                "American Samoa",
                "Andorra",
                "Angola",
                "Anguilla",
                "Antarctica",
                "Antigua and Barbuda",
                "Argentina",
                "Armenia",
                "Aruba",
                "Australia",
                "Austria",
                "Azerbaijan",
                "Bahamas",
                "Bahrain",
                "Bangladesh",
                "Barbados",
                "Belarus",
                "Belgium",
                "Belize",
                "Benin",
                "Bermuda",
                "Bhutan",
                "Bolivia",
                "Bosnia and Herzegowina",
                "Botswana",
                "Bouvet Island",
                "Brazil",
                "British Indian Ocean Territory",
                "Brunei Darussalam",
                "Bulgaria",
                "Burkina Faso",
                "Burundi",
                "Cambodia",
                "Cameroon",
                "Canada",
                "Cape Verde",
                "Cayman Islands",
                "Central African Republic",
                "Chad",
                "Chile",
                "China",
                "Christmas Island",
                "Cocos (Keeling) Islands",
                "Colombia",
                "Comoros",
                "Congo",
                "Congo, the Democratic Republic of the",
                "Cook Islands",
                "Costa Rica",
                "Cote d'Ivoire",
                "Croatia (Hrvatska)",
                "Cuba",
                "Cyprus",
                "Czech Republic",
                "Denmark",
                "Djibouti",
                "Dominica",
                "Dominican Republic",
                "East Timor",
                "Ecuador",
                "Egypt",
                "El Salvador",
                "Equatorial Guinea",
                "Eritrea",
                "Estonia",
                "Ethiopia",
                "Falkland Islands (Malvinas)",
                "Faroe Islands",
                "Fiji",
                "Finland",
                "France",
                "France Metropolitan",
                "French Guiana",
                "French Polynesia",
                "French Southern Territories",
                "Gabon",
                "Gambia",
                "Georgia",
                "Germany",
                "Ghana",
                "Gibraltar",
                "Greece",
                "Greenland",
                "Grenada",
                "Guadeloupe",
                "Guam",
                "Guatemala",
                "Guinea",
                "Guinea-Bissau",
                "Guyana",
                "Haiti",
                "Heard and Mc Donald Islands",
                "Holy See (Vatican City State)",
                "Honduras",
                "Hong Kong",
                "Hungary",
                "Iceland",
                "India",
                "Indonesia",
                "Iran (Islamic Republic of)",
                "Iraq",
                "Ireland",
                "Israel",
                "Italy",
                "Jamaica",
                "Japan",
                "Jordan",
                "Kazakhstan",
                "Kenya",
                "Kiribati",
                "Korea, Democratic People's Republic of",
                "Korea, Republic of",
                "Kuwait",
                "Kyrgyzstan",
                "Lao, People's Democratic Republic",
                "Latvia",
                "Lebanon",
                "Lesotho",
                "Liberia",
                "Libyan Arab Jamahiriya",
                "Liechtenstein",
                "Lithuania",
                "Luxembourg",
                "Macau",
                "Macedonia, The Former Yugoslav Republic of",
                "Madagascar",
                "Malawi",
                "Malaysia",
                "Maldives",
                "Mali",
                "Malta",
                "Marshall Islands",
                "Martinique",
                "Mauritania",
                "Mauritius",
                "Mayotte",
                "Mexico",
                "Micronesia, Federated States of",
                "Moldova, Republic of",
                "Monaco",
                "Mongolia",
                "Montserrat",
                "Morocco",
                "Mozambique",
                "Myanmar",
                "Namibia",
                "Nauru",
                "Nepal",
                "Netherlands",
                "Netherlands Antilles",
                "New Caledonia",
                "New Zealand",
                "Nicaragua",
                "Niger",
                "Nigeria",
                "Niue",
                "Norfolk Island",
                "Northern Mariana Islands",
                "Norway",
                "Oman",
                "Pakistan",
                "Palau",
                "Panama",
                "Papua New Guinea",
                "Paraguay",
                "Peru",
                "Philippines",
                "Pitcairn",
                "Poland",
                "Portugal",
                "Puerto Rico",
                "Qatar",
                "Reunion",
                "Romania",
                "Russian Federation",
                "Rwanda",
                "Saint Kitts and Nevis",
                "Saint Lucia",
                "Saint Vincent and the Grenadines",
                "Samoa",
                "San Marino",
                "Sao Tome and Principe",
                "Saudi Arabia",
                "Senegal",
                "Seychelles",
                "Sierra Leone",
                "Singapore",
                "Slovakia (Slovak Republic)",
                "Slovenia",
                "Solomon Islands",
                "Somalia",
                "South Africa",
                "South Georgia and the South Sandwich Islands",
                "Spain",
                "Sri Lanka",
                "St. Helena",
                "St. Pierre and Miquelon",
                "Sudan",
                "Suriname",
                "Svalbard and Jan Mayen Islands",
                "Swaziland",
                "Sweden",
                "Switzerland",
                "Syrian Arab Republic",
                "Taiwan, Province of China",
                "Tajikistan",
                "Tanzania, United Republic of",
                "Thailand",
                "Togo",
                "Tokelau",
                "Tonga",
                "Trinidad and Tobago",
                "Tunisia",
                "Turkey",
                "Turkmenistan",
                "Turks and Caicos Islands",
                "Tuvalu",
                "Uganda",
                "Ukraine",
                "United Arab Emirates",
                "United Kingdom",
                "United States",
                "United States Minor Outlying Islands",
                "Uruguay",
                "Uzbekistan",
                "Vanuatu",
                "Venezuela",
                "Vietnam",
                "Virgin Islands (British)",
                "Virgin Islands (U.S.)",
                "Wallis and Futuna Islands",
                "Western Sahara",
                "Yemen",
                "Yugoslavia",
                "Zambia",
                "Zimbabwe"
            };

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

                // Add the arrays to the dropdown list
                ddlCountry.DataSource = countryListItems;
                ddlCountry.DataBind();

                lstIndustry.DataSource = IndustryListItems;
                lstIndustry.DataBind();

                //Read Data from the database
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    string selected_industry = "";
                    string selected_skills = "";

                    string sql = "SELECT * FROM JobSeeker";

                    SqlCommand cmd = new SqlCommand(sql, con);

                    SqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        imgSeekerProfile.ImageUrl = dr["user_photo"].ToString();
                        txtSeekerName.Text = dr["full_name"].ToString();
                        txtFacebookLink.Text = dr["facebook_link"].ToString();
                        txtLinkedInLink.Text = dr["linkedin_link"].ToString();
                        txtjobSeekerIntroduction.Text = dr["introduction"].ToString();
                        txtPhone.Text = dr["mobile_number"].ToString();
                        txtContactEmail.Text = dr["contact_email"].ToString();
                        txtLocation.Text = dr["location"].ToString();
                        ddlCountry.SelectedValue = dr["country"].ToString();
                        ddlGender.SelectedValue = dr["gender"].ToString();
                        txtExperience.Text = dr["experience"].ToString();
                        txtProfession.Text = dr["profession"].ToString();
                        imgSeekerProfile.ImageUrl = dr["user_photo"].ToString();

                        //Get Selected Industry
                        selected_industry = dr["prefer_industry"].ToString();
                        selected_skills = dr["skills"].ToString();
                    }

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

                    //Split the Selected Skills
                    string[] split_skills = selected_skills.Split(',');

                    //Print out the result
                    for (int i = 0; i < split_skills.Length; i++)
                    {

                        if (lstSkills.Items.FindByValue(split_skills[i]) != null)
                        {
                            lstSkills.Items.FindByValue(split_skills[i]).Selected = true;
                        }
                        else
                        {
                            lstSkills.Items.Insert(0, new ListItem(split_skills[i], split_skills[i]));
                            lstSkills.Items.FindByValue(split_skills[i]).Selected = true;
                        }
                    }


                }
                catch (Exception error)
                {
                    Response.Write("<script>alert('" + error.Message + "');</script>");
                }
            }
            
        }

        protected void updateSeekerProfile_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                //Read The Selected Industry
                string industry_list = "";
                int selected_count = 0;

                for (int loop = 0; loop < lstIndustry.Items.Count; loop++)
                {
                    if (lstIndustry.Items.FindByValue(lstIndustry.Items[loop].ToString()).Selected == true)
                    {
                        if (selected_count == 0)
                        {
                            industry_list = lstIndustry.Items[loop].ToString();
                        }
                        else
                        {
                            industry_list = industry_list + "," + lstIndustry.Items[loop].ToString();
                        }

                        //Increase the selected value
                        selected_count++;

                    }

                }

                //reset selected count
                selected_count = 0;

                //Read The Selected Skills
                string skills_list = "";
                for (int loop = 0; loop < lstSkills.Items.Count; loop++)
                {
                    if (lstSkills.Items.FindByValue(lstSkills.Items[loop].ToString()).Selected == true)
                    {
                        if (selected_count == 0)
                        {
                            skills_list = lstSkills.Items[loop].ToString();
                        }
                        else
                        {
                            skills_list = skills_list + "," + lstSkills.Items[loop].ToString();
                        }

                        //Increase the selected value
                        selected_count++;

                    }

                }

                //Upload Profile Image Handled
                string upload_path = MapPath("/Uploads/");
                string file_name = fileSeekerPhoto.FileName;

                fileSeekerPhoto.SaveAs(upload_path + file_name);
                var user_photo = "Uploads/" + file_name;

                //Read inputs from the form
                var seeker_name = txtSeekerName.Text;
                var contact_email = txtContactEmail.Text;
                var phone_number = txtPhone.Text;
                var gender = ddlGender.Text;
                var location = txtLocation.Text;
                var country = ddlCountry.SelectedValue;
                var profession = txtPhone.Text;
                var experience = txtExperience.Text;
                var facebook_link = txtFacebookLink.Text;
                var linkedin_link = txtLinkedInLink.Text;
                var introduction = HttpUtility.UrlDecode(txtjobSeekerIntroduction.Text);


                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }



                    string sql = "UPDATE JobSeeker " +
                                "SET mobile_number = @mobile_number," +
                                " full_name = @full_name," +
                                " user_photo = @user_photo," +
                                " contact_email = @contact_email," +
                                " gender = @gender," +
                                " location = @location," +
                                " country = @country," +
                                " prefer_industry = @industry," +
                                " skills = @skills," +
                                " profession = @profession," +
                                " experience = @experience," +
                                " facebook_link = @facebook_link," +
                                " linkedin_link = @linkedin_link," +
                                " introduction = @introduction" +
                                " WHERE seeker_id = 1";

                    //Connect to the database
                    SqlCommand cmd = new SqlCommand(sql, con);


                    //Insert parameters
                    cmd.Parameters.AddWithValue("@mobile_number", phone_number);
                    cmd.Parameters.AddWithValue("@full_name", seeker_name);
                    cmd.Parameters.AddWithValue("@user_photo", user_photo);
                    cmd.Parameters.AddWithValue("@contact_email", contact_email);
                    cmd.Parameters.AddWithValue("@gender", gender);
                    cmd.Parameters.AddWithValue("@location", location);
                    cmd.Parameters.AddWithValue("@country", country);
                    cmd.Parameters.AddWithValue("@industry", industry_list);
                    cmd.Parameters.AddWithValue("@skills", skills_list);
                    cmd.Parameters.AddWithValue("@profession", profession);
                    cmd.Parameters.AddWithValue("@experience", experience);
                    cmd.Parameters.AddWithValue("@facebook_link", facebook_link);
                    cmd.Parameters.AddWithValue("@linkedin_link", linkedin_link);
                    cmd.Parameters.AddWithValue("@introduction", introduction);

                    //Execute the queries
                    cmd.ExecuteNonQuery();
                    con.Close();


                    Response.Write("<script>alert('Profile Updated Successful!');</script>");
                    imgSeekerProfile.ImageUrl = user_photo;
                }
                catch (Exception error)
                {
                    lblError.Text = error.Message;
                }
            }
        }
    }
}