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

                                <asp:TextBox ID="txt_SearchJobTitle" placeholder="Job Title" CssClass="form-control col-sm-12 col-lg-3 home-search-control" runat="server"></asp:TextBox>
                                
                                <asp:DropDownList ID="ddl_HomeLocationSelectStates" CssClass="selectStates form-control col-sm-12 col-lg-4 home-search-control" runat="server" multiple>
                                    <asp:ListItem Value="All">All</asp:ListItem>
                                    <asp:ListItem Value="Malacca">Malacca</asp:ListItem>
                                    <asp:ListItem Value="Selangor">Selangor</asp:ListItem>
                                    <asp:ListItem Value="Negeri Sembilan">Negeri Sembilan</asp:ListItem>
                                    <asp:ListItem Value="Terengganu">Terengganu</asp:ListItem>
                                    <asp:ListItem Value="Kedah">Kedah</asp:ListItem>
                                    <asp:ListItem Value="Kelantan">Kelantan</asp:ListItem>
                                    <asp:ListItem Value="Pahang">Pahang</asp:ListItem>
                                    <asp:ListItem Value="Perak">Perak</asp:ListItem>
                                    <asp:ListItem Value="Perlis">Perlis</asp:ListItem>
                                    <asp:ListItem Value="Sabah">Sabah</asp:ListItem>
                                    <asp:ListItem Value="Sarawak">Sarawak</asp:ListItem>
                                    <asp:ListItem Value="Kuala Lumpur">Kuala Lumpur</asp:ListItem>
                                    <asp:ListItem Value="Labuan">Labuan</asp:ListItem>
                                    <asp:ListItem Value="Johor">Johor</asp:ListItem>
                                    <asp:ListItem Value="Putrajaya">Putrajaya</asp:ListItem>
                                </asp:DropDownList>

                                <asp:DropDownList ID="ddl_HomeSelectJobCategory" CssClass="form-control col-sm-12 col-lg-4 home-search-control jobType" name="jobCategory[]" runat="server" multiple>
                                    <asp:ListItem Value="All">All</asp:ListItem>
                                    <asp:ListItem Value="Full Time">Full Time</asp:ListItem>
                                    <asp:ListItem Value="Part Time">Part Time</asp:ListItem>
                                </asp:DropDownList>

                                <asp:Button ID="btn_HomeSearchButton" runat="server" CssClass="bg-lightgreen form-control col text-light col-sm-12 col-lg-1 home-search-control" Text="Search" OnClick="btn_HomeSearchButton_Click"/>
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
                                        <a class="process-btn text-dark" href="#"><i class="fas fa-location-arrow process-btn-icon"></i></a>
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
                                        <a class="process-btn text-dark" href="#"><i class="fas fa-location-arrow process-btn-icon"></i></a>
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
                                        <a class="process-btn text-dark" href="#"><i class="fas fa-location-arrow process-btn-icon"></i></a>
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
        });

        $('.jobType').select2({
            placeholder: "Job Type",
        });
    </script>
</asp:Content>
