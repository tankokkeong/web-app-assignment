<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="edit_career.aspx.cs" Inherits="web_app_assignment.admin.edit_career" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/career.css" rel="stylesheet" type="text/css"/>
    <title>Career</title>
    <script src="https://cdn.tiny.cloud/1/s1x7flr7l31qu699rv3wuoist4sng04yrs2p5gyvgqp9o8z1/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
    <script>tinymce.init({ selector: 'textarea' });</script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%-- Change navbar active --%>
    <script>
        $(document).ready(function () {
            navbarActive();

            //Add active to user management
            pages_management = nav_option[4];
            $(pages_management).addClass("active");

            //Remove active from dashboard
            dashboard = nav_option[0];
            $(dashboard).removeClass("active");
        });
    </script>
    <div class="Edit_Career">
        <div class="Edit_CareerHeaderPosition">
            <h2 class="Edit_CareerHeader">
                Careers
            </h2>
        </div>
        <div class="Edit_CareerFormContents">
            <form>
                <div class="form-group row">
                    <label for="backgroundImage" class="col-sm-2 col-form-label">Form Background Image :</label>
                    <div class="col-sm-10">
                      <img src="../images/career/startup-594091_1920-min.jpg" class="Edit_CareerBackgroundContentsImage" alt="background"/>
                      <input type="file" class="Edit_CareerBackgroundContentsBodyFileInput" />
                    </div>
                </div>

                <div class="form-group row ">
                    <label class="col-sm-12 col-lg-2 mt-5">
                        <img src="../images/career/3.jpg" class="Edit_CareerBodyImage ml-4" alt="edit Image"/>
                        <input type="file" class="Edit_CareerBodyPicFile ml-4 mt-3" />
                    </label>
                    <div class="col-sm-10">
                        <div class="row mt-3">
                            <label class="col-sm-1 Edit_CareerBodyLabels">Description</label>
                            <div class="col-sm-9">
                                <div class="Edit_CareerBodyContentsDescDetails">
                                    <textarea class="Edit_CareerBodyContentsDescDetailsText">Database in here</textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row mt-3">
                            <label for="name" class="col-sm-1 mt-1 Edit_CareerBodyLabels">Name</label>
                            <div class="col-sm-9">
                                <input type="text" id="name" class="form-control Edit_CareerBodyContentsNameDetailsInput"/>
                            </div>
                        </div>
                        <div class="row mt-3">
                            <label for="position" class="col-sm-1 mt-1 Edit_CareerBodyLabels">Position</label>
                            <div class="col-sm-9">
                                <input type="text" id="position" class="form-control Edit_CareerBodyContentsPositionDetailsInput"/>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="Edit_CareerSubmitButton">
                    <button type="submit" class="Edit_CareerSubmit">Update</button>
                </div>
            </form>
        </div>
        </div>
    </div>
</asp:Content>
