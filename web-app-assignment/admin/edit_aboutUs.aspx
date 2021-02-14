<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="edit_aboutUs.aspx.cs" Inherits="web_app_assignment.admin.edit_aboutUs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/aboutUs.css" rel="stylesheet" type="text/css"/>
    <title>About Us</title>

    <%-- CK EDITOR --%>
    <script src="https://cdn.ckeditor.com/ckeditor5/25.0.0/classic/ckeditor.js"></script>
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

    <div class="aboutus-container">
        <div class="about-title">
            <h2>Edit Page</h2>
        </div>

        <div class="aboutus-form">
            <div class="aboutform-title">
                <h3>About Us</h3>
            </div>
            
            <div class="about-input">
                <form>
                  <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">Main Image: </label>

                    <div class="col-sm-10">
                        <img src="../images/About%20Us/business-3076392_1280.jpg" class="about-image-display"/>
                        <input type="file" class="about-input-control" />
                    </div>
                  </div>

                  <div class="form-group row">
                    <label for="inputPassword3" class="col-sm-2 col-form-label">Main Description:</label>

                    <div class="col-sm-10">
                      <div id="ck-editor1"></div>
                    </div>
                  </div>
                
                <div class="form-group">
                    <h3>Founder 1</h3>
                </div>

                <div class="form-group row">
                    <label for="inputPassword3" class="col-sm-12 col-lg-2 col-form-label">
                        <img src="../images/About%20Us/img1.jpg" class="about-image-display"/>
                        <input type="file" class="about-input-control founder-img-upload" />
                    </label>

                    <div class="col-sm-12 col-lg-10">
                        <div class="row mt-3">
                            <label class="col-sm-2 col-form-label">Description:</label>

                            <div class="col-sm-10">
                                <div id="ck-editor2"></div>
                            </div>
                            
                        </div>

                        <div class="row mt-3">
                            <label class="col-sm-2 col-form-label">Name:</label>

                            <div class="col-sm-10">
                                <input type="text" class="form-control about-input-control"/>
                            </div>
                            
                        </div>
                        
                    </div>
                </div>

                <div class="form-group">
                    <h3>Founder 2</h3>
                </div>

                <div class="form-group row">
                    <label for="inputPassword3" class="col-sm-12 col-lg-2 col-form-label">
                        <img src="../images/About%20Us/img2.jpg" class="about-image-display"/>
                        <input type="file" class="about-input-control founder-img-upload" />
                    </label>

                    <div class="col-sm-12 col-lg-10">
                        <div class="row mt-3">
                            <label class="col-sm-2 col-form-label">Description:</label>

                            <div class="col-sm-10">
                                <div id="ck-editor3"></div>
                            </div>
                            
                        </div>

                        <div class="row mt-3">
                            <label class="col-sm-2 col-form-label">Name:</label>

                            <div class="col-sm-10">
                                <input type="text" class="form-control about-input-control"/>
                            </div>
                            
                        </div>
                        
                    </div>
                </div>

                <div class="form-group">
                    <h3>Founder 3</h3>
                </div>

                <div class="form-group row">
                    <label for="inputPassword3" class="col-sm-12 col-lg-2 col-form-label">
                        <img src="../images/About%20Us/img3.jpg" class="about-image-display"/>
                        <input type="file" class="about-input-control founder-img-upload" />
                    </label>

                    <div class="col-sm-12 col-lg-10">
                        <div class="row mt-3">
                            <label class="col-sm-2 col-form-label">Description:</label>

                            <div class="col-sm-10">
                                <div id="ck-editor4"></div>
                            </div>
                            
                        </div>

                        <div class="row mt-3">
                            <label class="col-sm-2 col-form-label">Name:</label>

                            <div class="col-sm-10">
                                <input type="text" class="form-control about-input-control"/>
                            </div>
                            
                        </div>
                        
                    </div>
                </div>

                <div class="form-group row">
                    <label for="inputPassword3" class="col-sm-2 col-form-label">Vision:</label>

                    <div class="col-sm-10">
                        <div id="ck-editor5"></div>
                    </div>
                </div>

                <div class="form-group row">
                    <label for="inputPassword3" class="col-sm-2 col-form-label">Mission:</label>

                    <div class="col-sm-10">
                        <div id="ck-editor6"></div>
                    </div>
                </div>

                <div class="form-group text-center">
                    <button type="submit" class="btn text-light bg-lightgreen">Update</button>
                </div>

                </form>
            </div>
        </div>
    </div>

    <%-- CKEDITOR --%>
    <script>
    ClassicEditor
        .create( document.querySelector( '#ck-editor1' ) )
        .catch( error => {
            console.error( error );
    });

    ClassicEditor
        .create(document.querySelector('#ck-editor2'))
        .catch(error => {
            console.error(error);
    });

    ClassicEditor
        .create(document.querySelector('#ck-editor3'))
        .catch(error => {
            console.error(error);
    });

    ClassicEditor
        .create(document.querySelector('#ck-editor4'))
        .catch(error => {
            console.error(error);
    });

    ClassicEditor
        .create(document.querySelector('#ck-editor5'))
        .catch(error => {
            console.error(error);
    });

    ClassicEditor
        .create(document.querySelector('#ck-editor6'))
        .catch(error => {
            console.error(error);
    });
    </script>
</asp:Content>
