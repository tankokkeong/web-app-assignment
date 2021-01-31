<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="job_lists.aspx.cs" Inherits="web_app_assignment.job_lists" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Job Lists</title>
    <link href="style/job_lists.css" rel="stylesheet" type="text/css"/>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="JobListContents">
        <div class="JobListContentsBackGroundImage">
            <div class="JobListContentsImagePosition">
                <img src="images/JobsList/search.jpg" alt="searchBackground" class="JobListContentsImage"/>
            </div>
            <div class="JobListContentsBackgroundInputs">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                    <span class="input-group-text" id="JobListContentsSearchPosition">
                        <img src="images/JobsList/loupe.png" alt="search" class="JobListContentsSearchImage"/>
                    </span>
                    </div>
                    <input type="text" class="form-control" placeholder="Job Title, Keyword or Company" aria-label="Username" aria-describedby="basic-addon1">
                </div>
            </div>
            <div class="JobListContentsBackgroundInputs">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                    <span class="input-group-text" id="JobListContentsLocationPosition">
                        <img src="images/JobsList/pin.png" alt="location" class="JobListContentsLocationImage"/>
                    </span>
                    </div>
                    <select class="custom-select" id="inputGroupSelect01">
                        <option selected>Choose...</option>
                        <option value="1">One</option>
                        <option value="2">Two</option>
                        <option value="3">Three</option>
                    </select>
                </div>
            </div>
            <div class="JobListContentsBackgroundInputs">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                    <span class="input-group-text" id="JobListContentssearchPosition">
                        <img src="images/JobsList/loupe.png" alt="search" class="JobListContentssearchImage"/>
                    </span>
                    </div>
                    <input type="text" class="form-control" placeholder="Job Title, Keyword or Company" aria-label="Username" aria-describedby="basic-addon1">
                </div>
            </div>
            <div class="JobListContentsBackgroundInputs">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                    <span class="input-group-text" id="JobListContentssearchPosition">
                        <img src="images/JobsList/loupe.png" alt="search" class="JobListContentssearchImage"/>
                    </span>
                    </div>
                    <input type="text" class="form-control" placeholder="Job Title, Keyword or Company" aria-label="Username" aria-describedby="basic-addon1">
                </div>
            </div>
        </div>
    </div>
</asp:Content>
