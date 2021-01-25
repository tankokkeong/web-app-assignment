<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="web_app_assignment.home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Home</title>

    <%-- Stylesheet --%>
    <link href="style/home.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="home-body">
        <div class="banner-container">
            <img src="images/home/writing-336370_1920-min.jpg" id="home-banner"/>

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
    </div>
</asp:Content>
