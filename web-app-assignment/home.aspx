<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="web_app_assignment.home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Home</title>

    <%-- Stylesheet --%>
    <link href="style/home.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="home-body">
        <div class="banner-container">
            <img src="images/home/writing-336370_1920-min.png" id="home-banner"/>

            <div class="home-search-container">
                <div class="home-search-text text-center">
                    <h1 class="text-light">5,000+ Browse Jobs</h1>
                </div>

                <div class="home-search-input">
                    <form>
                        <div class="home-search-form">
                            <div class="row bg-darkgreen">
                                <div class="col-lg-3 p-1 home-search-col">
                                    <span class="search-icon-container">
                                        <i class="fas fa-search"></i>
                                    </span>
                                    
                                    <input id="txt_SearchJobTitle" placeholder="Job Title" class="form-control home-search-textbox">
                                </div>

                                <div class="col-lg-3 p-1">
                                    <span class="search-icon-container">
                                        <i class="fas fa-map-marker-alt"></i>
                                    </span>
                                    <asp:ListBox ID="lstSearchLocation" runat="server" CssClass="form-control selectStates" multiple="multiple" SelectionMode ="Multiple"></asp:ListBox>
                                </div>

                                <div class="col-lg-3 p-1">
                                    <span class="search-icon-container">
                                        <i class="fas fa-briefcase"></i>
                                    </span>

                                    <select id="ddlSearchJobType" class="form-control home-search-dropdown">
                                        <option value="">Select Job Type</option>
                                        <option value="All">All</option>
                                        <option value="Full Time">Full Time</option>
                                        <option value="Part Time">Part Time</option>
                                    </select>
                                    
                                  <%--  <asp:ListBox ID="lstSearchJobType" runat="server" CssClass="form-control jobType home-search-control" multiple="multiple" SelectionMode ="Multiple"></asp:ListBox>--%>
                                </div>

                                <div class="col p-1">
                                    <button id="btn_HomeSearchButton" class="btn bg-lightgreen form-control text-light" onclick="homeJobSearch()" type="button">Search</button>
                                </div>                               
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <div class="work-process">
            <div class="work-process-container">
                <h2 class="text-lightgreen text-center">Our Work Process</h2>

                <div class="process-card">
                    <div class="row">

                      <div class="col-sm-12 col-lg-4 mt-3 mb-3">
                        <div class="card">
                          <div class="card-body">
                              <div class="card-icon">
                                  <i class="fas fa-user-plus text-lightgreen process-icon"></i>
                              </div>

                              <div class="card-title text-center">
                                  <h3 class="text-danger">Create Account</h3>
                              </div>
                            
                                <div class="card-text">
                                  <p>
                                      Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
                                      Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, 
                                      when an unknown printer took a galley of type and scrambled it to make a type specimen book. 
                                      It has survived not only five centuries, but also the leap into electronic typesetting, 
                                      remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing 
                                  </p>

                                    <div class="card-btn text-center">
                                        <a class="process-btn text-dark" href="login_signup.aspx"><i class="fas fa-location-arrow process-btn-icon"></i></a>
                                    </div>
                              </div>
                          </div>
                        </div>
                      </div>

                      <div class="col-sm-12 col-lg-4 mt-3 mb-3">
                        <div class="card">
                          <div class="card-body">
                              <div class="card-icon">
                                  <i class="fas fa-search text-lightgreen process-icon"></i>
                              </div>

                             <div class="card-title text-center">
                                  <h3 class="text-danger">Search Jobs</h3>
                              </div>

                                <div class="card-text">
                                  <p>
                                      Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
                                      Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, 
                                      when an unknown printer took a galley of type and scrambled it to make a type specimen book. 
                                      It has survived not only five centuries, but also the leap into electronic typesetting, 
                                      remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing 
                                  </p>

                                    <div class="card-btn text-center">
                                        <a class="process-btn text-dark" href="job_lists.aspx"><i class="fas fa-location-arrow process-btn-icon"></i></a>
                                    </div>
                                    
                              </div>
                          </div>
                        </div>
                      </div>

                      <div class="col-sm-12 col-lg-4 mt-3 mb-3">
                        <div class="card">
                          <div class="card-body">
                              <div class="card-icon">
                                  <i class="far fa-file text-lightgreen process-icon"></i>
                              </div>

                              <div class="card-title text-center">
                                  <h3 class="text-danger">Submit Resume</h3>
                              </div>
                            
                              <div class="card-text">
                                  <p>
                                      Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
                                      Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, 
                                      when an unknown printer took a galley of type and scrambled it to make a type specimen book. 
                                      It has survived not only five centuries, but also the leap into electronic typesetting, 
                                      remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing 
                                  </p>

                                  <div class="card-btn text-center">
                                        <a class="process-btn text-dark" href="job_lists.aspx"><i class="fas fa-location-arrow process-btn-icon"></i></a>
                                    </div>
                              </div>
                          </div>
                        </div>
                      </div>

                    </div>
                </div>
            </div>
        </div>

        <div class="job-services">
            <div class="job-services-container">
                <div class="job-service-header text-center">
                    <h2 class="text-lightgreen">Job Services</h2>
                </div>
                
                <div class="job-services-row row">

                    <% for (int i = 0; i < 2; i++)
                        {
                    %>
                    <div class="col-sm-12 col-md-6 col-lg-3 mt-3 mb-3">
                        <div class="card job-services-card">
                          <div class="card-body">
                              <div class="card-icon">
                                  <i class="fas fa-chalkboard-teacher text-lightgreen"></i>
                              </div>

                              <div class="card-title text-center">
                                  <h3 class="text-dark">Education</h3>
                              </div>
                            
                              <div class="card-text">
                                  <p>
                                      Lorem Ipsum is simply dummy text of the printing and typesetting industry.
                                      Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, 
                                      when an unknown printer took a galley of type and scrambled it to make a type specimen book.
                                  </p>
                              </div>
                          </div>
                        </div>
                      </div>

                    <div class="col-sm-12 col-md-6 col-lg-3 mt-3 mb-3">
                        <div class="card job-services-card">
                          <div class="card-body">
                              <div class="card-icon">
                                  <i class="fas fa-ad text-lightgreen"></i>
                              </div>

                              <div class="card-title text-center">
                                  <h3 class="text-dark">Digital Marketing</h3>
                              </div>
                            
                              <div class="card-text">
                                  <p>
                                      Lorem Ipsum is simply dummy text of the printing and typesetting industry.
                                      Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, 
                                      when an unknown printer took a galley of type and scrambled it to make a type specimen book.
                                  </p>
                              </div>
                          </div>
                        </div>
                      </div>

                    <div class="col-sm-12 col-md-6 col-lg-3 mt-3 mb-3">
                        <div class="card job-services-card">
                          <div class="card-body">
                              <div class="card-icon">
                                  <i class="far fa-object-group text-lightgreen"></i>
                              </div>

                              <div class="card-title text-center">
                                  <h3 class="text-dark">Graphic Design</h3>
                              </div>
                            
                              <div class="card-text">
                                  <p>
                                      Lorem Ipsum is simply dummy text of the printing and typesetting industry.
                                      Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, 
                                      when an unknown printer took a galley of type and scrambled it to make a type specimen book.
                                  </p>
                              </div>
                          </div>
                        </div>
                      </div>

                    <div class="col-sm-12 col-md-6 col-lg-3 mt-3 mb-3">
                        <div class="card job-services-card">
                          <div class="card-body">
                              <div class="card-icon">
                                  <i class="fas fa-bullhorn text-lightgreen"></i>
                              </div>

                              <div class="card-title text-center">
                                  <h3 class="text-dark">Sales & Marketing</h3>
                              </div>
                            
                              <div class="card-text">
                                  <p>
                                      Lorem Ipsum is simply dummy text of the printing and typesetting industry.
                                      Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, 
                                      when an unknown printer took a galley of type and scrambled it to make a type specimen book.
                                  </p>
                              </div>
                          </div>
                        </div>
                      </div>
                    <% 
                        }
                    %>

                </div>

                <div class="browse-all">
                    <div class="browse-btn-container text-center">
                        <button class="btn bg-lightgreen text-light text-center">Browser All Categories</button>
                    </div>
                </div>
                                      
            </div>
        </div>

        <div class="working-partner">
            <div class="working-partner-title text-center mb-3">
                <h2 class="text-lightgreen">Working Partners</h2>
            </div>

            <div class="marquee-background mt-3">
                <div class="marquee">
                    <div class="partner-images" id="partner-slides">
                        <div class="display-slides">
                            <img src="images/home/partner1-min.png" />
                        </div>
        
                        <div class="display-slides">
                            <img src="images/home/partner2-min.png" />
                        </div>
        
                        <div class="display-slides">
                            <img src="images/home/partner3-min.png" />
                        </div>
        
                        <div class="display-slides">
                           <img src="images/home/partner4-min.png" />
                        </div>
        
                        <div class="display-slides">
                            <img src="images/home/partner5-min.png" />
                        </div>
        
                        <div class="display-slides">
                            <img src="images/home/partner6-min.png" />
                        </div>
        
                        <div class="display-slides">
                            <img src="images/home/partner7-min.png" />
                        </div>
        
                        <div class="display-slides">
                            <img src="images/home/partner8-min.png" />    
                        </div>
                
                        <div class="display-slides">
                            <img src="images/home/partner9-min.png" />
                        </div>
        
                        <div class="display-slides">
                            <img src="images/home/partner10-min.png" />
                        </div>
        
                        <div class="display-slides">
                            <img src="images/home/partner1-min.png" />
                        </div>
    
                        <div class="display-slides">
                            <img src="images/home/partner2-min.png" />
                        </div>
        
                        <div class="display-slides">
                           <img src="images/home/partner3-min.png" />
                        </div>
        
                        <div class="display-slides">
                            <img src="images/home/partner4-min.png" />
                        </div>

                    </div>
    
                </div>
            </div>
        </div>

    </div>

    <script>
        $(".selectStates").select2({
            placeholder: "Select Location or Write Location",
            allowClear: true,
            tags: true,
            width: "100%",
        });

        function homeJobSearch() {

            //Get Search Input
            var job_title = document.getElementById("txt_SearchJobTitle").value;
            var location_selected = $('.selectStates').select2('data');
            var job_location = "";
            var job_type = document.getElementById("ddlSearchJobType").value;

            for (var i = 0; i < location_selected.length; i++) {

                if (i === 0) {
                    job_location = location_selected[i].text;
                }
                else {
                    job_location = job_location + "," + location_selected[i].text;
                }
            }

            //Redirect to job list page
            window.location.href = "job_lists.aspx?job_title=" + job_title + "&location=" + job_location + "&job_type=" + job_type;

        }
    </script>
</asp:Content>
