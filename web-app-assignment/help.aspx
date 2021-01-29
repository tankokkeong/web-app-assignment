<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="help.aspx.cs" Inherits="web_app_assignment.help" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Help Center</title>
    <link href="style/help.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="help-container">
        <div class="help-area bg-lightgreen">
            <div class="help-search-container text-center">
                <h1 class="text-light mb-3">Hi! How Can We Help?</h1>
                <input type="text" class="form-control" placeholder="Search" id="question-input" oninput="helpQuestionFilter()"/>
            </div>
        </div>

        <div class="question-container">
            <div class="question-header text-center text-secondary">
                <h2>Frequent Asked Questions</h2>
            </div>

            <div class="question-list">

                <% for (int i = 0; i < 10; i++)
                    { %>
                <div class="question-bar">
                    <div class="question-title">
                        <h3> <span id="question-color-<% Response.Write(i); %>">Q<% Response.Write(i+1); %>. Is Suk Chuang beautiful?</span> <span class="float-right mt-2 mr-3" onclick="helpQuestionToggleDown('question-answer-<% Response.Write(i); %>', 'q-toggle-<% Response.Write(i); %>', 'call-<% Response.Write(i); %>', 'question-color-<% Response.Write(i); %>')" id="call-<% Response.Write(i); %>"><i class="fas fa-chevron-down text-lightgreen question-slide-togger" id="q-toggle-<% Response.Write(i); %>"></i></span></h3>                        
                    </div>

                    <div class="question-answer" style="display:none;" id="question-answer-<% Response.Write(i); %>">
                        Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
                        Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, 
                        when an unknown printer took a galley of type and scrambled it to make a type specimen book. 
                        It has survived not only five centuries, but also the leap into electronic typesetting, 
                        remaining essentially unchanged. 
                        It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, 
                        and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
                    </div>
                </div>
                <%} %>
            </div>
        </div>
    </div>
    
</asp:Content>
