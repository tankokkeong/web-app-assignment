<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="schedule.aspx.cs" Inherits="web_app_assignment.schedule" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Schedule</title>
    <link href="style/schedule.css" rel="stylesheet"/>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="schedule-container">
        <div class="schedule-form">
            <div class="schedule-title text-center mb-3">
                <h1>
                    Meeting Schedule
                </h1>
            </div>

            <form>
                <div class="form-row">

                    <div class="col-sm-12 col-lg-6 mt-3">
                        <input type="text" class="form-control" placeholder="Event name">
                    </div>

                    <div class="col-sm-12 col-lg-6 mt-3">
                        <input type="text" class="form-control" placeholder="Location">
                    </div>

                </div>

                <div class="form-row">

                    <div class="col-sm-12 col-lg-6 mt-3">
                        <input type="text" class="form-control" placeholder="Start Date">
                    </div>

                    <div class="col-sm-12 col-lg-6 mt-3">
                        <input type="text" class="form-control" placeholder="End Date">
                    </div>

                </div>

                <div class="mt-3">
                    <button type="button" class="btn btn-info">Schedule</button>
                    <a href="recruiter-profile.aspx" class="btn btn-secondary">Back</a>
                </div>
            </form>
        </div>
    </div>
</asp:Content>
