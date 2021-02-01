<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="post-job.aspx.cs" Inherits="web_app_assignment.post_job" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Post Job</title>
    <link href="style/post-job.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="post-job-container">
        <div class="post-job-form">
            <div class="post-job-header text-center">
                <h1>Job Details</h1>
            </div>

            <form>
                <div class="form-row">

                    <div class="col-sm-12 col-lg-6 mt-3">
                        <input type="text" class="form-control" placeholder="Job title">
                    </div>

                    <div class="col-sm-12 col-lg-6 mt-3">
                        <input type="text" class="form-control" placeholder="Category">
                    </div>

                </div>

                <div class="form-row">

                    <div class="col-sm-12 col-lg-6 mt-3">
                        <input type="text" class="form-control" placeholder="Location">
                    </div>

                    <div class="col-sm-12 col-lg-6 mt-3">
                        <input type="text" class="form-control" placeholder="Budget">
                    </div>

                </div>

                <div class="mt-3">
                    <button type="button" class="btn btn-info">Post</button>
                    <a href="recruiter-profile.aspx" class="btn btn-secondary">Back</a>
                </div>
            </form>
        </div>
    </div>
</asp:Content>
