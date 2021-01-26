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

                                <input type="text" class="form-control col-sm-12 col-lg-3 home-search-control" placeholder="Job Title"/>

                                <select class="form-control col-sm-12 col-lg-4 home-search-control">
                                    <option>Location</option>
                                </select>

                                <select class="form-control col-sm-12 col-lg-4 home-search-control">
                                    <option>Job Category</option>
                                </select>

                                <button class="bg-lightgreen form-control col text-light col-sm-12 col-lg-1 home-search-control">
                                    Search
                                </button>
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

                      <div class="col-sm-12 col-lg-4 mt-3">
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

                      <div class="col-sm-12 col-lg-4 mt-3">
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

                      <div class="col-sm-12 col-lg-4 mt-3">
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
                
            </div>
        </div>
    </div>
</asp:Content>
