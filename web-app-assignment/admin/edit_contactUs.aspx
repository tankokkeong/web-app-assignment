<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="edit_contactUs.aspx.cs" Inherits="web_app_assignment.admin.edit_contactUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/contactUs.css" rel="stylesheet" type="text/css"/>
    <title>Contact Us</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="Edit_contactUs">
        <div class="Edit_contactUsHeaderPosition">
            <h2 class="Edit_contactUsHeader">
                Contact Us
            </h2>
        </div>
        <div class="Edit_contactUsBody">
            <div class="Edit_contactUsBodyEmail">
                <div>
                    <div>
                        <img />
                    </div>
                    <div>
                        <div>
                            <input type="file" />
                        </div>
                        <div>
                            <button type="submit">Upload</button>
                        </div>
                    </div>
                </div>
                <div>
                    <div>
                        <h5>
                            Email Address
                        </h5>
                    </div>
                    <div>
                        <input type="text" />
                    </div>
                </div>
            </div>
            
            <div class="Edit_contactUsBodyCall">
                <div>
                    <div>
                        <img />
                    </div>
                    <div>
                        <div>
                            <input type="file" />
                        </div>
                        <div>
                            <button type="submit">Upload</button>
                        </div>
                    </div>
                </div>
                <div>
                    <div>
                        <h5>
                            Email Address
                        </h5>
                    </div>
                    <div>
                        <input type="text" />
                    </div>
                </div>
            </div>
            
            <div class="Edit_contactUsBodyLocation">
                <div>
                    <div>
                        <img />
                    </div>
                    <div>
                        <div>
                            <input type="file" />
                        </div>
                        <div>
                            <button type="submit">Upload</button>
                        </div>
                    </div>
                </div>
                <div>
                    <div>
                        <h5>
                            Email Address
                        </h5>
                    </div>
                    <div>
                        <input type="text" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
