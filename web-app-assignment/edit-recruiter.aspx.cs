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
    public partial class edit_recruiter : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            //Check Login
            if (Session["Recruiter"] == null)
            {
                Response.Redirect("home.aspx");
            }

            if (!Page.IsPostBack)
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


                // Add the arrays to the dropdown list
                ddlCountry.DataSource = countryListItems;
                ddlCountry.DataBind();

                //Read Data from the database
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    string sql = "SELECT * FROM Recruiter";

                    SqlCommand cmd = new SqlCommand(sql, con);

                    SqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        imgRecruiterProfile.ImageUrl = dr["company_photo"].ToString();
                        txtCompanyName.Text = dr["company_name"].ToString();
                        txtState.Text = dr["state"].ToString();
                        txtFacebookLink.Text = dr["facebook_link"].ToString();
                        txtLinkedInLink.Text = dr["linkedin_link"].ToString();
                        txtComapanyIntroduction.Text = dr["introduction"].ToString();
                        txtPhone.Text = dr["mobile_number"].ToString();
                        txtContactEmail.Text = dr["contact_email"].ToString();
                        txtAddressLine1.Text = dr["address_line1"].ToString();
                        txtAddressLine2.Text = dr["address_line2"].ToString();
                        txtCity.Text = dr["city"].ToString();
                        txtZipCode.Text = dr["zip_code"].ToString();
                        ddlCountry.SelectedValue = dr["country"].ToString();
                        txtIndustry.Text = dr["industry"].ToString();

                    }

                }
                catch (Exception error)
                {
                    Response.Write("<script>alert('" + error.Message + "');</script>");
                }
            }
                
        }

        protected void updateRecruiterProfile_Click(object sender, EventArgs e)
        {
            if(Page.IsValid)
            {
               
                //Upload Profile Image Handled
                string upload_path = MapPath("/Uploads/");
                string file_name = fileCompanyPhoto.FileName;

                fileCompanyPhoto.SaveAs(upload_path + file_name);
                var company_photo = "Uploads/" + file_name;


                //Read inputs from the form
                var company_name = txtCompanyName.Text;
                var contact_email = txtContactEmail.Text;
                var phone_number = txtPhone.Text;
                var address_line1 = txtAddressLine1.Text;
                var address_line2 = txtAddressLine2.Text;
                var industry_list = txtIndustry.Text;
                var city = txtCity.Text;
                var state = txtState.Text;
                var country = ddlCountry.SelectedValue;
                var zip_code = txtZipCode.Text;
                var facebook_link = txtFacebookLink.Text;
                var linkedin_link = txtLinkedInLink.Text;
                var introduction = HttpUtility.UrlDecode(txtComapanyIntroduction.Text);


                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    //Get Recruiter ID

                    Dictionary<string, string> RecruiterDetails = (Dictionary<string, string>)Session["Recruiter"];

                    string recruiterID = "";

                    //GET Seeker ID from the seeker table
                    string selectRecruiterID = "SELECT recruiter_id FROM Recruiter WHERE email = @email";

                    SqlCommand cmd = new SqlCommand(selectRecruiterID, con);

                    cmd.Parameters.AddWithValue("@email", RecruiterDetails["recruiter_email"].ToString());

                    SqlDataReader dr = cmd.ExecuteReader();

                    while (dr.Read())
                    {
                        recruiterID = dr["recruiter_id"].ToString();
                    }

                    con.Close();

                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }


                    string sql = "UPDATE Recruiter " +
                                "SET mobile_number = @mobile_number," +
                                " company_name = @company_name," +
                                " company_photo = @company_photo," +
                                " contact_email = @contact_email," +
                                " address_line1 = @address_line1," +
                                " address_line2 = @address_line2," +
                                " city = @city," +
                                " state = @state," +
                                " zip_code = @zip_code," +
                                " country = @country," +
                                " industry = @industry," +
                                " facebook_link = @facebook_link," +
                                " linkedin_link = @linkedin_link," +
                                " introduction = @introduction" +
                                " WHERE recruiter_id = @recruiter_id";

                    //Connect to the database
                    cmd = new SqlCommand(sql, con);


                    //Insert parameters
                    cmd.Parameters.AddWithValue("@mobile_number", phone_number);
                    cmd.Parameters.AddWithValue("@company_name", company_name);
                    cmd.Parameters.AddWithValue("@company_photo", company_photo);
                    cmd.Parameters.AddWithValue("@contact_email", contact_email);
                    cmd.Parameters.AddWithValue("@address_line1", address_line1);
                    cmd.Parameters.AddWithValue("@address_line2", address_line2);
                    cmd.Parameters.AddWithValue("@city", city);
                    cmd.Parameters.AddWithValue("@state", state);
                    cmd.Parameters.AddWithValue("@zip_code", zip_code);
                    cmd.Parameters.AddWithValue("@country", country);
                    cmd.Parameters.AddWithValue("@industry", industry_list);
                    cmd.Parameters.AddWithValue("@facebook_link", facebook_link);
                    cmd.Parameters.AddWithValue("@linkedin_link", linkedin_link);
                    cmd.Parameters.AddWithValue("@introduction", introduction);
                    cmd.Parameters.AddWithValue("@recruiter_id", recruiterID);
                    
                    //Execute the queries
                    cmd.ExecuteNonQuery();
                    con.Close();


                    Response.Write("<script>alert('Profile Updated Successful!');</script>");
                    imgRecruiterProfile.ImageUrl = company_photo;


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