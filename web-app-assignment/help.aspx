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
                <input type="text" class="form-control" placeholder="Search" id="question-input" oninput="helpQuestionFilter()" />
            </div>
        </div>

        <div class="question-container">
            <div class="question-header text-center text-secondary">
                <h2>
                    <asp:Label ID="lblFrequent" runat="server" Text="Frequent Asked Questions"></asp:Label></h2>
            </div>

            <div class="question-list">

                <%-- Question 1 --%>
                <div class="question-bar">
                    <div class="question-title">
                        <h3>
                            <span id="question-color-1">
                                <asp:Label ID="lblQ1" runat="server" Text="Q1. Sign Up"></asp:Label></span>
                            <span class="float-right mt-2 mr-3" onclick="helpQuestionToggleDown('question-answer-1', 'q-toggle-1', 'call-1', 'question-color-1')" id="call-1">
                                <i class="fas fa-chevron-down text-lightgreen question-slide-togger" id="q-toggle-1"></i>
                            </span>

                        </h3>
                    </div>

                    <div class="question-answer" style="display: none;" id="question-answer-1">
                        <asp:Label ID="lblA1" runat="server" Text="1. Click on the 'Sign In' button <br> 2. Choose 'Sign Up', select your role & fill in your personal information."></asp:Label>
                    </div>
                </div>

                <%-- Question 2 --%>
                <div class="question-bar">
                    <div class="question-title">
                        <h3>
                            <span id="question-color-2">
                                <asp:Label ID="lblQ2" runat="server" Text="Q2. Search for a Job"></asp:Label></span>
                            <span class="float-right mt-2 mr-3" onclick="helpQuestionToggleDown('question-answer-2', 'q-toggle-2', 'call-2', 'question-color-2')" id="call-2">
                                <i class="fas fa-chevron-down text-lightgreen question-slide-togger" id="q-toggle-2"></i>
                            </span>

                        </h3>
                    </div>

                    <div class="question-answer" style="display: none;" id="question-answer-2">
                        <asp:Label ID="lblA2" runat="server" Text="Explore the 'Jobs' page. Type in the keywords in the search box by Job Title, Company, Location, Job Type & Specialization."></asp:Label>
                    </div>
                </div>

                <%-- Question 3 --%>
                <div class="question-bar">
                    <div class="question-title">
                        <h3>
                            <span id="question-color-3">
                                <asp:Label ID="lblQ3" runat="server" Text="Q3. Update my profile"></asp:Label></span>
                            <span class="float-right mt-2 mr-3" onclick="helpQuestionToggleDown('question-answer-3', 'q-toggle-3', 'call-3', 'question-color-3')" id="call-3">
                                <i class="fas fa-chevron-down text-lightgreen question-slide-togger" id="q-toggle-3"></i>
                            </span>

                        </h3>
                    </div>

                    <div class="question-answer" style="display: none;" id="question-answer-3">
                        <asp:Label ID="lblA3" runat="server" Text="To update your profile <br> 1. Click on the 'User Profile'.<br> 2. After you have made the necessary changes, click on the ‘Update’ button."></asp:Label>
                    </div>
                </div>

                <%-- Question 4 --%>
                <div class="question-bar">
                    <div class="question-title">
                        <h3>
                            <span id="question-color-4">
                                <asp:Label ID="lblQ4" runat="server" Text="Q4. Forgot Password"></asp:Label></span>
                            <span class="float-right mt-2 mr-3" onclick="helpQuestionToggleDown('question-answer-4', 'q-toggle-4', 'call-4', 'question-color-4')" id="call-4">
                                <i class="fas fa-chevron-down text-lightgreen question-slide-togger" id="q-toggle-4"></i>
                            </span>

                        </h3>
                    </div>

                    <div class="question-answer" style="display: none;" id="question-answer-4">
                        <asp:Label ID="lblA4" runat="server" Text="Click on 'Forgot Your Password ?' on our 'Login' PAGE and your new password will be sent to you via email shortly! If you did not received the email at your inbox, kindly check your junk mail folder!"></asp:Label>
                    </div>
                </div>

                <%-- Question 5 --%>
                <div class="question-bar">
                    <div class="question-title">
                        <h3>
                            <span id="question-color-5">
                                <asp:Label ID="lblQ5" runat="server" Text="Q5. Want to know more about us?"></asp:Label></span>
                            <span class="float-right mt-2 mr-3" onclick="helpQuestionToggleDown('question-answer-5', 'q-toggle-5', 'call-5', 'question-color-5')" id="call-5">
                                <i class="fas fa-chevron-down text-lightgreen question-slide-togger" id="q-toggle-5"></i>
                            </span>

                        </h3>
                    </div>

                    <div class="question-answer" style="display: none;" id="question-answer-5">
                        <asp:Label ID="lblA5" runat="server" Text="1. Can explore our 'About Us'. <br> 2. Please feel free to drop us a message via our Contact Us Page form. We'll get back to you as soon as possible."></asp:Label>
                    </div>
                </div>

                <%-- Question 6 --%>
                <div class="question-bar">
                    <div class="question-title">
                        <h3>
                            <span id="question-color-6">
                                <asp:Label ID="lblQ6" runat="server" Text="Q6. What are the payment methods accepted by Jobs4U?"></asp:Label></span>
                            <span class="float-right mt-2 mr-3" onclick="helpQuestionToggleDown('question-answer-6', 'q-toggle-6', 'call-6', 'question-color-6')" id="call-6">
                                <i class="fas fa-chevron-down text-lightgreen question-slide-togger" id="q-toggle-6"></i>
                            </span>

                        </h3>
                    </div>

                    <div class="question-answer" style="display: none;" id="question-answer-6">
                        <asp:Label ID="lblA6" runat="server" Text="We accept the following payment methods: <br> Google Pay, PayPal & Credit/Debit Card."></asp:Label>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
