﻿<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="edit_career.aspx.cs" Inherits="web_app_assignment.admin.edit_career" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/career.css" rel="stylesheet" type="text/css"/>
    <title>Career</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="Edit_Career">
        <div class="Edit_CareerHeaderPosition">
            <h2 class="Edit_CareerHeader">
                Careers
            </h2>
        </div>
        <div class="Edit_CareerBackground">
            <div class="Edit_CareerBackgroundContents">
                <div class="Edit_CareerBackgroundHeaderPosition">
                    <h5 class="Edit_CareerBackgroundHeader">
                        Form Background Image : 
                    </h5>
                </div>
                <div class="Edit_CareerBackgroundContentsImage_Buttons">
                    <div class="Edit_CareerBackgroundContentsImagePosition">
                        <img src="../images/career/startup-594091_1920-min.jpg" class="Edit_CareerBackgroundContentsImage" alt="background"/>
                    </div>
                    <div class="Edit_CareerBackgroundContentsBody">
                        <input type="file" class="Edit_CareerBackgroundContentsBodyFileInput" />
                        <div class="Edit_CareerBackgroundContentsBodyButtonPosition">
                            <button type="submit" class="Edit_CareerBackgroundContentsBodyButton">Upload</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="Edit_CareerBody">
            <div class="Edit_CareerBodyEdits">
                <div class="Edit_CareerBodyPic">
                    <img src="../images/career/3.jpg" class="Edit_CareerBodyImage" alt="edit Image"/>
                    <div class="Edit_CareerBodyPicButtons">
                        <input type="file" class="Edit_CareerBodyPicFile" />
                        <div class="Edit_CareerBodyPicUploadPosition">
                            <button class="Edit_CareerBodyPicUpload">Upload</button>
                        </div>
                    </div>
                </div>
                <div class="Edit_CareerBodyContents">
                    <div class="Edit_CareerBodyContentsDesc">
                        <div class="Edit_CareerBodyContentsDescTitle">
                            <h4>
                                Description :
                            </h4>
                        </div>
                        <div class="Edit_CareerBodyContentsDescDetails">
                            <div id="toolbar-container"></div>
                            <div id="editor">
                                <%--Database code comes here--%>
                                <p>Lallalalala</p>
                            </div>
                            <script>
                                DecoupledEditor
                                    .create(document.querySelector('#editor'))
                                    .then(editor => {
                                        const toolbarContainer = document.querySelector('#toolbar-container');

                                        toolbarContainer.appendChild(editor.ui.view.toolbar.element);
                                    })
                                    .catch(error => {
                                        console.error(error);
                                    });
                            </script>
                        </div>
                    </div>
                    <div class="Edit_CareerBodyContentsName">
                        <div class="Edit_CareerBodyContentsNameTitle">
                            <h4>
                                Name : 
                            </h4>
                        </div>
                        <div class="Edit_CareerBodyContentsNameDetails">
                            <input type="text" class="Edit_CareerBodyContentsNameDetailsInput" />
                        </div>
                    </div>
                    <div class="Edit_CareerBodyContentsPosition">
                        <div class="Edit_CareerBodyContentsPositionTitle">
                            <h4>
                                Position : 
                            </h4>
                        </div>
                        <div class="Edit_CareerBodyContentsPositionDetails">
                            <input type="text" class="Edit_CareerBodyContentsPositionDetailsInput" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="Edit_CareerBodyEdits">
                <div class="Edit_CareerBodyPic">
                    <img src="../images/career/3.jpg" class="Edit_CareerBodyImage" alt="edit Image"/>
                    <div class="Edit_CareerBodyPicButtons">
                        <input type="file" class="Edit_CareerBodyPicFile" />
                        <div class="Edit_CareerBodyPicUploadPosition">
                            <button class="Edit_CareerBodyPicUpload">Upload</button>
                        </div>
                    </div>
                </div>
                <div class="Edit_CareerBodyContents">
                    <div class="Edit_CareerBodyContentsDesc">
                        <div class="Edit_CareerBodyContentsDescTitle">
                            <h4>
                                Description :
                            </h4>
                        </div>
                        <div class="Edit_CareerBodyContentsDescDetails">
                            <div id="toolbar-container1"></div>
                            <div id="editor1">
                                <%--Database code comes here--%>
                                <p>Lallalalala</p>
                            </div>
                            <script>
                                DecoupledEditor
                                    .create(document.querySelector('#editor1'))
                                    .then(editor => {
                                        const toolbarContainer = document.querySelector('#toolbar-container1');

                                        toolbarContainer.appendChild(editor.ui.view.toolbar.element);
                                    })
                                    .catch(error => {
                                        console.error(error);
                                    });
                            </script>
                        </div>
                    </div>
                    <div class="Edit_CareerBodyContentsName">
                        <div class="Edit_CareerBodyContentsNameTitle">
                            <h4>
                                Name : 
                            </h4>
                        </div>
                        <div class="Edit_CareerBodyContentsNameDetails">
                            <input type="text" class="Edit_CareerBodyContentsNameDetailsInput" />
                        </div>
                    </div>
                    <div class="Edit_CareerBodyContentsPosition">
                        <div class="Edit_CareerBodyContentsPositionTitle">
                            <h4>
                                Position : 
                            </h4>
                        </div>
                        <div class="Edit_CareerBodyContentsPositionDetails">
                            <input type="text" class="Edit_CareerBodyContentsPositionDetailsInput" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="Edit_CareerSubmitButton">
                <button type="submit" class="Edit_CareerSubmit">Update</button>
            </div>
        </div>
    </div>
</asp:Content>
