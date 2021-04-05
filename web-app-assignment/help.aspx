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

                <%-- Question 1 --%>
                <div class="question-bar">
                    <div class="question-title">
                        <h3>
                            <span id="question-color-1">Q1. Is Suk Chuang beautiful?</span> 
                            <span class="float-right mt-2 mr-3" onclick="helpQuestionToggleDown('question-answer-1', 'q-toggle-1', 'call-1', 'question-color-1')" id="call-1">
                                <i class="fas fa-chevron-down text-lightgreen question-slide-togger" id="q-toggle-1"></i>
                            </span>

                        </h3>                        
                    </div>

                    <div class="question-answer" style="display:none;" id="question-answer-1">
                        Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
                        Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, 
                        when an unknown printer took a galley of type and scrambled it to make a type specimen book. 
                        It has survived not only five centuries, but also the leap into electronic typesetting, 
                        remaining essentially unchanged. 
                        It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, 
                        and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
                    </div>
                </div>

                <%-- Question 2 --%>
                <div class="question-bar">
                    <div class="question-title">
                        <h3>
                            <span id="question-color-2">Q2. Is Suk Chuang beautiful?</span> 
                            <span class="float-right mt-2 mr-3" onclick="helpQuestionToggleDown('question-answer-2', 'q-toggle-2', 'call-2', 'question-color-2')" id="call-2">
                                <i class="fas fa-chevron-down text-lightgreen question-slide-togger" id="q-toggle-2"></i>
                            </span>

                        </h3>                        
                    </div>

                    <div class="question-answer" style="display:none;" id="question-answer-2">
                        Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
                        Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, 
                        when an unknown printer took a galley of type and scrambled it to make a type specimen book. 
                        It has survived not only five centuries, but also the leap into electronic typesetting, 
                        remaining essentially unchanged. 
                        It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, 
                        and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
                    </div>
                </div>

                <%-- Question 3 --%>
                <div class="question-bar">
                    <div class="question-title">
                        <h3>
                            <span id="question-color-3">Q3. Is Suk Chuang beautiful?</span> 
                            <span class="float-right mt-2 mr-3" onclick="helpQuestionToggleDown('question-answer-3', 'q-toggle-3', 'call-3', 'question-color-3')" id="call-3">
                                <i class="fas fa-chevron-down text-lightgreen question-slide-togger" id="q-toggle-3"></i>
                            </span>

                        </h3>                        
                    </div>

                    <div class="question-answer" style="display:none;" id="question-answer-3">
                        Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
                        Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, 
                        when an unknown printer took a galley of type and scrambled it to make a type specimen book. 
                        It has survived not only five centuries, but also the leap into electronic typesetting, 
                        remaining essentially unchanged. 
                        It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, 
                        and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
                    </div>
                </div>

                <%-- Question 4 --%>
                <div class="question-bar">
                    <div class="question-title">
                        <h3>
                            <span id="question-color-4">Q4. Is Suk Chuang beautiful?</span> 
                            <span class="float-right mt-2 mr-3" onclick="helpQuestionToggleDown('question-answer-4', 'q-toggle-4', 'call-4', 'question-color-4')" id="call-4">
                                <i class="fas fa-chevron-down text-lightgreen question-slide-togger" id="q-toggle-4"></i>
                            </span>

                        </h3>                        
                    </div>

                    <div class="question-answer" style="display:none;" id="question-answer-4">
                        Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
                        Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, 
                        when an unknown printer took a galley of type and scrambled it to make a type specimen book. 
                        It has survived not only five centuries, but also the leap into electronic typesetting, 
                        remaining essentially unchanged. 
                        It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, 
                        and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
                    </div>
                </div>

                <%-- Question 5 --%>
                <div class="question-bar">
                    <div class="question-title">
                        <h3>
                            <span id="question-color-5">Q5. Is Suk Chuang beautiful?</span> 
                            <span class="float-right mt-2 mr-3" onclick="helpQuestionToggleDown('question-answer-5', 'q-toggle-5', 'call-5', 'question-color-5')" id="call-5">
                                <i class="fas fa-chevron-down text-lightgreen question-slide-togger" id="q-toggle-5"></i>
                            </span>

                        </h3>                        
                    </div>

                    <div class="question-answer" style="display:none;" id="question-answer-5">
                        Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
                        Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, 
                        when an unknown printer took a galley of type and scrambled it to make a type specimen book. 
                        It has survived not only five centuries, but also the leap into electronic typesetting, 
                        remaining essentially unchanged. 
                        It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, 
                        and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
                    </div>
                </div>

                <%-- Question 6 --%>
                <div class="question-bar">
                    <div class="question-title">
                        <h3>
                            <span id="question-color-6">Q6. Is Suk Chuang beautiful?</span> 
                            <span class="float-right mt-2 mr-3" onclick="helpQuestionToggleDown('question-answer-6', 'q-toggle-6', 'call-6', 'question-color-6')" id="call-6">
                                <i class="fas fa-chevron-down text-lightgreen question-slide-togger" id="q-toggle-6"></i>
                            </span>

                        </h3>                        
                    </div>

                    <div class="question-answer" style="display:none;" id="question-answer-6">
                        Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
                        Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, 
                        when an unknown printer took a galley of type and scrambled it to make a type specimen book. 
                        It has survived not only five centuries, but also the leap into electronic typesetting, 
                        remaining essentially unchanged. 
                        It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, 
                        and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
                    </div>
                </div>

                <%-- Question 7 --%>
                <div class="question-bar">
                    <div class="question-title">
                        <h3>
                            <span id="question-color-7">Q7. Is Suk Chuang beautiful?</span> 
                            <span class="float-right mt-2 mr-3" onclick="helpQuestionToggleDown('question-answer-7', 'q-toggle-7', 'call-7', 'question-color-7')" id="call-7">
                                <i class="fas fa-chevron-down text-lightgreen question-slide-togger" id="q-toggle-7"></i>
                            </span>

                        </h3>                        
                    </div>

                    <div class="question-answer" style="display:none;" id="question-answer-7">
                        Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
                        Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, 
                        when an unknown printer took a galley of type and scrambled it to make a type specimen book. 
                        It has survived not only five centuries, but also the leap into electronic typesetting, 
                        remaining essentially unchanged. 
                        It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, 
                        and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
                    </div>
                </div>

                <%-- Question 8 --%>
                <div class="question-bar">
                    <div class="question-title">
                        <h3>
                            <span id="question-color-8">Q8. Is Suk Chuang beautiful?</span> 
                            <span class="float-right mt-2 mr-3" onclick="helpQuestionToggleDown('question-answer-8', 'q-toggle-8', 'call-8', 'question-color-8')" id="call-8">
                                <i class="fas fa-chevron-down text-lightgreen question-slide-togger" id="q-toggle-8"></i>
                            </span>

                        </h3>                        
                    </div>

                    <div class="question-answer" style="display:none;" id="question-answer-8">
                        Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
                        Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, 
                        when an unknown printer took a galley of type and scrambled it to make a type specimen book. 
                        It has survived not only five centuries, but also the leap into electronic typesetting, 
                        remaining essentially unchanged. 
                        It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, 
                        and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
                    </div>
                </div>

                <%-- Question 9 --%>
                <div class="question-bar">
                    <div class="question-title">
                        <h3>
                            <span id="question-color-9">Q9. Is Suk Chuang beautiful?</span> 
                            <span class="float-right mt-2 mr-3" onclick="helpQuestionToggleDown('question-answer-9', 'q-toggle-9', 'call-9', 'question-color-9')" id="call-9">
                                <i class="fas fa-chevron-down text-lightgreen question-slide-togger" id="q-toggle-9"></i>
                            </span>

                        </h3>                        
                    </div>

                    <div class="question-answer" style="display:none;" id="question-answer-9">
                        Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
                        Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, 
                        when an unknown printer took a galley of type and scrambled it to make a type specimen book. 
                        It has survived not only five centuries, but also the leap into electronic typesetting, 
                        remaining essentially unchanged. 
                        It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, 
                        and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
                    </div>
                </div>

                <%-- Question 10 --%>
                <div class="question-bar">
                    <div class="question-title">
                        <h3>
                            <span id="question-color-10">Q10. Is Suk Chuang beautiful?</span> 
                            <span class="float-right mt-2 mr-3" onclick="helpQuestionToggleDown('question-answer-10', 'q-toggle-10', 'call-10', 'question-color-10')" id="call-10">
                                <i class="fas fa-chevron-down text-lightgreen question-slide-togger" id="q-toggle-10"></i>
                            </span>

                        </h3>                        
                    </div>

                    <div class="question-answer" style="display:none;" id="question-answer-10">
                        Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
                        Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, 
                        when an unknown printer took a galley of type and scrambled it to make a type specimen book. 
                        It has survived not only five centuries, but also the leap into electronic typesetting, 
                        remaining essentially unchanged. 
                        It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, 
                        and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
                    </div>
                </div>

            </div>
        </div>
    </div>
    
</asp:Content>
