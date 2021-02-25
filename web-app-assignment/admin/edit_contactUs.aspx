﻿<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="edit_contactUs.aspx.cs" Inherits="web_app_assignment.admin.edit_contactUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/contactUs.css" rel="stylesheet" type="text/css"/>
    <title>Contact Us</title>
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
    <div class="Edit_contactUs">
        <div class="Edit_contactUsHeaderPosition">
            <h2 class="Edit_contactUsHeader">
                Contact Us
            </h2>
        </div>
        <div class="Edit_contactUsBody">
            <form>
                <div class="Edit_contactUsBodyEmail">
                    <div class="form-group Edit_contactUsBodyEmailContentsLeft">
                        <div class="Edit_contactUsBodyEmailImagePosition">
                            <img src="images/Contact%20Us/email.png" class="Edit_contactUsBodyEmailImage" alt="email" />
                        </div>
                        <div class="Edit_contactUsBodyEmailContentButtons">
                            <div class="Edit_contactUsBodyEmailContentFile">
                                <input type="file" class="Edit_contactUsBodyEmailContentFilePosition" />
                            </div>
                        </div>
                    </div>
                    <div class="form-group Edit_contactUsBodyEmailContentRight">
                        <div class="Edit_contactUsBodyEmailContentRightHeaderContainer">
                            <h5 class="Edit_contactUsBodyEmailContentRightHeader">
                                <label for="email" class="col-form-label mt-2">
                                    Email Address
                                </label>
                            </h5>
                        </div>
                        <div class="Edit_contactUsBodyEmailContentRightInputPosition">
                            <input type="text" id="email" class="Edit_contactUsBodyEmailContentRightInput" placeholder="webissue@gmail.com"/>
                        </div>
                    </div>
                </div>

                <div class="Edit_contactUsBodyCall">
                    <div class="form-group Edit_contactUsBodyCallContentLeft">
                        <div class="Edit_contactUsBodyCallImagePosition">
                            <img src="images/Contact%20Us/call.png" class="Edit_contactUsBodyCallImage" alt="email" />
                        </div>
                        <div class="Edit_contactUsBodyCallContentButtons">
                            <div class="Edit_contactUsBodyCallContentFile">
                                <input type="file" class="Edit_contactUsBodyCallContentFilePosition" />
                            </div>
                        </div>
                    </div>
                    <div class="form-group Edit_contactUsBodyCallContentRight">
                        <div class="Edit_contactUsBodyCallContentRightHeaderContainer">
                            <h5 class="Edit_contactUsBodyCallContentRightHeader">
                                <label for="call" class="col-form-label mt-2">
                                    Contact Number
                                </label>
                            </h5>
                        </div>
                        <div class="Edit_contactUsBodyCallContentRightInputPosition">
                            <input type="text" id="call" class="Edit_contactUsBodyCallContentRightInput" placeholder="(+60) 361235555"/>
                        </div>
                    </div>
                </div>

                <div class="Edit_contactUsBodyLocation">
                    <div class="form-group Edit_contactUsBodyLocationContentLeft">
                        <div class="Edit_contactUsBodyLocationImagePosition">
                            <img src="images/Contact%20Us/maps.png" class="Edit_contactUsBodyLocationImage" alt="email" />
                        </div>
                        <div class="Edit_contactUsBodyLocationContentButtons">
                            <div class="Edit_contactUsBodyLocationContentFile">
                                <input type="file" class="Edit_contactUsBodyLocationContentFilePosition" />
                            </div>
                        </div>
                    </div>
                    <div class="form-group Edit_contactUsBodyLocationContentRight">
                        <div class="Edit_contactUsBodyLocationContentRightHeaderContainer">
                            <h5 class="Edit_contactUsBodyLocationContentRightHeader">
                                <label for="location" class="col-form-label mt-2">
                                    Location
                                </label>
                            </h5>
                        </div>
                        <div class="Edit_contactUsBodyLocationContentRightInputPosition">
                            <input type="text" id="location" class="Edit_contactUsBodyLocationContentRightInput" placeholder="No:23 Jalan 12, Selayang Baru, 68100 Batu Caves, Selangor"/>
                        </div>
                    </div>
                </div>
                <div class="Edit_contactUsButton">
                    <button class="Edit_contactUsButtonPosition" type="submit">Update</button>
                </div>
            </form>
        </div>
    </div>
</asp:Content>