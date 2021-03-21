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



                    string seeker_id = getSeekerID();
                    string selected_industry = "";
                    string selected_skills = "";

                    string sql = "SELECT * FROM JobSeeker where seeker_id = @seeker_id";

                    SqlCommand cmd = new SqlCommand(sql, con);

                    //Insert Parameter
                    cmd.Parameters.AddWithValue("@seeker_id", seeker_id);

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
                        txtIndustry.Text = dr["prefer_industry"].ToString();
                        txtSkills.Text = dr["skills"].ToString();
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
                var industry_list = txtIndustry.Text;
                var skills_list = txtSkills.Text;
                var facebook_link = txtFacebookLink.Text;
                var linkedin_link = txtLinkedInLink.Text;
                var introduction = HttpUtility.UrlDecode(txtjobSeekerIntroduction.Text);

                //Get Seeker Id
                string seeker_id = getSeekerID();

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
                                " WHERE seeker_id = @seeker_id";

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
                    cmd.Parameters.AddWithValue("@seeker_id", seeker_id);

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

        protected string getSeekerID()
        {
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }

            //Get Seeker ID
            Dictionary<string, string> UserDetails = (Dictionary<string, string>)Session["User"];

            string seeker_id = "";

            //GET Seeker ID from the seeker table
            string selectSeekerID = "SELECT seeker_id FROM JobSeeker WHERE email = @email";

            SqlCommand cmd = new SqlCommand(selectSeekerID, con);

            cmd.Parameters.AddWithValue("@email", UserDetails["user_email"].ToString());

            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                seeker_id = dr["seeker_id"].ToString();
            }

            con.Close();

            //Return seeker id
            return seeker_id;
        }
    }
}