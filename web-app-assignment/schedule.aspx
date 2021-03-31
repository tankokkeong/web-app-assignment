<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="schedule.aspx.cs" Inherits="web_app_assignment.schedule" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Schedule</title>
    <link href="style/schedule.css" rel="stylesheet"/>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <%-- Google Sign In Background --%>
    <div id="google-signin-background"></div>

    <%-- Google Sign In Container --%>
    <div id="google-signin-container">
        <div id="google-signin-form">
            <div id="google-form-header text-center">
                <h4>Please sign in to your Google Account to schedule a meeting</h4>
            </div>

            <div id="google-form-btn text-center">
                <button class="btn btn-info" type="button" id="google-btn" onclick="handleAuthClick()"><i class="fab fa-google"></i> Sign In</button>
            </div>
        </div>
    </div>



    <div class="schedule-container">
        <div class="schedule-form">
            <div class="schedule-title text-center mb-3">
                <h1>
                    Meeting Schedule
                </h1>
            </div>

            <form>
                <div class="form-group row">
                    <label for="staticEmail" class="col-sm-2 col-form-label">Meeting Name:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="meeting-name">
                        <span class="schedule-error text-danger"></span>
                    </div>
                </div>

                <div class="form-group row">
                    <label for="inputPassword" class="col-sm-2 col-form-label">Meeting Location:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="meeting-location">
                        <span class="schedule-error text-danger"></span>
                    </div>
                </div>

                <div class="form-group row">
                    <label for="inputPassword" class="col-sm-2 col-form-label">Meeting Description:</label>
                    <div class="col-sm-10">
                        <textarea class="form-control" id="meeting-description" rows="10"></textarea>
                        <span class="schedule-error text-danger"></span>
                    </div>
                </div>

                <div class="form-group row">
                    <label for="inputPassword" class="col-sm-2 col-form-label">Start Date:</label>
                    <div class="col-sm-10">
                        <input type="date" class="form-control mb-2" id="meeting-startDate">
                        <span class="schedule-error text-danger"></span>

                        <input type="time" class="form-control mb-2" id="meeting-startTime">
                        <span class="schedule-error text-danger"></span>

                        <select class="form-control" id="meeting-startTimeZone" style="width:100%;">
                            <option value="">Select the timezone</option>
                        </select>
                        <span class="schedule-error text-danger"></span>

                        <script>
                            $("#meeting-startTimeZone").select2({
                                placeholder: "Search the Timezons here",
                                allowClear: true,
                            });
                        </script>   
                    </div>
                </div>

                <div class="form-group row">
                    <label for="inputPassword" class="col-sm-2 col-form-label">End Date:</label>
                    <div class="col-sm-10">
                        <input type="date" class="form-control mb-2" id="meeting-endDate">
                        <span class="schedule-error text-danger"></span>

                        <input type="time" class="form-control mb-2" id="meeting-endTime">
                        <span class="schedule-error text-danger"></span>

                        <select class="form-control" id="meeting-endTimeZone" style="width:100%;">
                            <option value="">Select the timezone</option>
                        </select>
                        <span class="schedule-error text-danger"></span>

                        <script>
                            $("#meeting-endTimeZone").select2({
                                placeholder: "Search the Timezons here",
                                allowClear: true,
                            });
                        </script>                               
                    </div>
                </div>

                <div class="form-group row">
                    <label for="inputPassword" class="col-sm-2 col-form-label">Meeting Attendees:</label>
                    <div class="col-sm-10">
                        <%--<input type="text" readonly class="form-control meeting-attendees" id="meeting-attendees" value="tankokkeong4488@gmail.com">--%>
                        <asp:TextBox ID="txtMeetingAttendees" runat="server" class="form-control meeting-attendees" ReadOnly></asp:TextBox>
                        <div id="attendees-container">

                        </div>
                        <span class="schedule-error text-danger"></span>
                        <div class="text-right mt-3 mb-3">
                            <button class="btn btn-info" onclick="addMoreMeetingAttendees('attendees-container', 'meeting-attendees')" type="button">Add More</button>
                        </div>
                    </div>
                </div>

                <div class="form-group row">
                    <label for="inputPassword" class="col-sm-2 col-form-label">Google Meet:</label>
                    <div class="col-sm-10">
                        <select class="form-control" id="meeting-googleMeet">
                            <option value="enable">Enable</option>
                            <option value="disable">Disable</option>
                        </select>
                    </div>
                </div>

                <div class="mt-3">
                    <button type="button" class="btn btn-info" type="button" onclick="scheduleValidation()">Schedule</button>
                    <a href="recruiter-profile.aspx" class="btn btn-secondary">Back</a>
                </div>
            </form>
        </div>
    </div>

    <!--Add buttons to initiate auth sequence and sign out-->
    <button id="authorize_button" style="display: none;" type="button">Authorize</button>
    <button id="signout_button" style="display: none;" type="button">Sign Out</button>
    <!-- <button onclick="create()">Create</button> -->

    <script type="text/javascript">
        // Client ID and API key from the Developer Console
        var CLIENT_ID = '783031485843-1388p6sau7qmn1cki8jk49qms6qqscal.apps.googleusercontent.com';
        var API_KEY = 'AIzaSyCoBZ7OyCvywGL-6tAyGBixDd-rB7YAu2c';

        // Array of API discovery doc URLs for APIs used by the quickstart
        var DISCOVERY_DOCS = ["https://www.googleapis.com/discovery/v1/apis/calendar/v3/rest"];

        // Authorization scopes required by the API; multiple scopes can be
        // included, separated by spaces.
        var SCOPES = "https://www.googleapis.com/auth/calendar";

        /**
         *  On load, called to load the auth2 library and API client library.
         */
        function handleClientLoad() {
            gapi.load('client:auth2', initClient);
        }

        /**
         *  Initializes the API client library and sets up sign-in state
         *  listeners.
         */
        function initClient() {
            gapi.client.init({
                apiKey: API_KEY,
                clientId: CLIENT_ID,
                discoveryDocs: DISCOVERY_DOCS,
                scope: SCOPES
            }).then(function () {
                // Listen for sign-in state changes.
                gapi.auth2.getAuthInstance().isSignedIn.listen(updateSigninStatus);

                // Handle the initial sign-in state.
                updateSigninStatus(gapi.auth2.getAuthInstance().isSignedIn.get());
            }, function (error) {
                appendPre(JSON.stringify(error, null, 2));
            });
        }

        /**
         *  Called when the signed in status changes, to update the UI
         *  appropriately. After a sign-in, the API is called.
         */
        function updateSigninStatus(isSignedIn) {
            if (isSignedIn) {
                removeGoogleSignInContainer();

            } else {
                displayGoogleSignInContainer();
            }
        }

        /**
         *  Sign in the user upon button click.
         */
        function handleAuthClick(event) {
            gapi.auth2.getAuthInstance().signIn();
            updateSigninStatus(gapi.auth2.getAuthInstance().isSignedIn.get());
      
        }

        /**
         *  Sign out the user upon button click.
         */
        function handleSignoutClick(event) {
            gapi.auth2.getAuthInstance().signOut();
        }

        /**
         * Append a pre element to the body containing the given message
         * as its text node. Used to display the results of the API call.
         *
         * @param {string} message Text to be placed in pre element.
         */
        function appendPre(message) {
            alert(message);
        }

        //Print out timezones for the form inputs
        timeZonePrintOut("meeting-startTimeZone");
        timeZonePrintOut("meeting-endTimeZone");

        function scheduleValidation() {
            //validation variable
            var valid_schedule = 0;

            //Error Prompt
            var error_prompt = document.getElementsByClassName("schedule-error");

            //Get inputs from the users
            var meeting_name = document.getElementById("meeting-name").value;
            var meeting_location = document.getElementById("meeting-location").value;
            var meeting_description = document.getElementById("meeting-description").value;
            var meeting_startDate = document.getElementById("meeting-startDate").value;
            var meeting_startTime = document.getElementById("meeting-startTime").value;
            var meeting_startTimeZone = document.getElementById("meeting-startTimeZone").value;
            var meeting_endDate = document.getElementById("meeting-endDate").value;
            var meeting_endTime = document.getElementById("meeting-endTime").value;
            var meeting_endTimeZone = document.getElementById("meeting-endTimeZone").value;
            var meeting_attendees = document.getElementsByClassName("extra-attendees");

            //Empty field validation

            //Meeting name validation
            if (IsEmptyFieldVerification(meeting_name)) {
                error_prompt[0].innerHTML = "Meeting name is required!";

                //Increase error count
                valid_schedule++;
            }
            else
            {
                error_prompt[0].innerHTML = "";
            }

            //Meeting location validation
            if (IsEmptyFieldVerification(meeting_location)) {
                error_prompt[1].innerHTML = "Meeting location is required!";

                //Increase error count
                valid_schedule++;
            }
            else {
                error_prompt[1].innerHTML = "";
            }

            //meeting description validation
            if (IsEmptyFieldVerification(meeting_description)) {
                error_prompt[2].innerHTML = "Meeting description is required!";

                //Increase error count
                valid_schedule++;
            }
            else {
                error_prompt[2].innerHTML = "";
            }

            //meeting start date validation
            if (IsEmptyFieldVerification(meeting_startDate)) {
                error_prompt[3].innerHTML = "Meeting start date is required!";

                //Increase error count
                valid_schedule++;
            }
            else {
                error_prompt[3].innerHTML = "";
            }

            //meeting start time validation
            if (IsEmptyFieldVerification(meeting_startTime)) {
                error_prompt[4].innerHTML = "Meeting start date is required!";

                //Increase error count
                valid_schedule++;
            }
            else {
                error_prompt[4].innerHTML = "";
            }

            //meeting start timezone validation
            if (IsEmptyFieldVerification(meeting_startTimeZone)) {
                error_prompt[5].innerHTML = "Meeting start timezone is required!";

                //Increase error count
                valid_schedule++;
            }
            else {
                error_prompt[5].innerHTML = "";
            }

            //meeting end date validation
            if (IsEmptyFieldVerification(meeting_endDate)) {
                error_prompt[6].innerHTML = "Meeting end date is required!";

                //Increase error count
                valid_schedule++;
            }
            else {
                error_prompt[6].innerHTML = "";
            }

            //meeting end time validation
            if (IsEmptyFieldVerification(meeting_endTime)) {
                error_prompt[7].innerHTML = "Meeting end time is required!";

                //Increase error count
                valid_schedule++;
            }
            else {
                error_prompt[7].innerHTML = "";
            }

            if (!IsEmptyFieldVerification(meeting_endTime) && !IsEmptyFieldVerification(meeting_startTime)) {

                //Event time validation
                if (!startTimeEndTimeValidation(meeting_startTime, meeting_endTime)) {
                    error_prompt[7].innerHTML = "meeting end time cannot be same with or before the start time!";
                }
                else {
                    error_prompt[7].innerHTML = "";
                }

            }

            //meeting end timezone validation
            if (IsEmptyFieldVerification(meeting_endTimeZone)) {
                error_prompt[8].innerHTML = "Meeting end timezone is required!";

                //Increase error count
                valid_schedule++;
            }
            else {
                error_prompt[8].innerHTML = "";
            }

            //meeting attendees validation
            for (var i = 0; i < meeting_attendees.length; i++) {
                if (IsEmptyFieldVerification(meeting_attendees[i].value)) {
                    error_prompt[9].innerHTML = "Meeting attendee is required!";

                    //Increase error count
                    valid_schedule++;
                }
                else {
                    error_prompt[9].innerHTML = "";
                }
            }
        }
    </script>

    <script async defer src="https://apis.google.com/js/api.js"
      onload="this.onload=function(){};handleClientLoad()"
      onreadystatechange="if (this.readyState === 'complete') this.onload()">
     </script>
</asp:Content>
