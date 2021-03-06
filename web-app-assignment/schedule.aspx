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
                        <input type="text" class="form-control" id="meeting-name" value="email@example.com">
                    </div>
                </div>

                <div class="form-group row">
                    <label for="inputPassword" class="col-sm-2 col-form-label">Meeting Location:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="meeting-location">
                    </div>
                </div>

                <div class="form-group row">
                    <label for="inputPassword" class="col-sm-2 col-form-label">Meeting Description:</label>
                    <div class="col-sm-10">
                        <textarea class="form-control" id="meeting-description" rows="10"></textarea>
                    </div>
                </div>

                <div class="form-group row">
                    <label for="inputPassword" class="col-sm-2 col-form-label">Start Date:</label>
                    <div class="col-sm-10">
                        <input type="date" class="form-control mb-2" id="meeting-startDate">
                        <input type="time" class="form-control mb-2" id="meeting-startTime">
                        <select class="form-control" id="meeting-startTimeZone" style="width:100%;">
                            <option value="">Select the timezone</option>
                        </select>

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
                        <input type="time" class="form-control mb-2" id="meeting-endTime">
                        <select class="form-control" id="meeting-endTimeZone" style="width:100%;">
                            <option value="">Select the timezone</option>
                        </select>

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
                    <button type="button" class="btn btn-info" type="button" onclick="createScheduleMeeting()">Schedule</button>
                    <a href="recruiter-profile.aspx" class="btn btn-secondary">Back</a>
                </div>
            </form>
        </div>
    </div>

    <!--Add buttons to initiate auth sequence and sign out-->
    <button id="authorize_button" style="display: none;" type="button">Authorize</button>
    <button id="signout_button" style="display: none;" type="button">Sign Out</button>
    <!-- <button onclick="create()">Create</button> -->

<%--    <div class="mt-3">
        <button id="authorize_button2" style="display: none;" type="button">Authorize</button>
        <button id="signout_button2" style="display: none;" type="button">Sign Out</button>
    </div>--%>

    <%--<pre id="content" style="white-space: pre-wrap;"></pre>--%>

    <%-- Google Calendar API --%>
    <%--<pre id="content" style="white-space: pre-wrap;"></pre>--%>

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
    </script>

    <script async defer src="https://apis.google.com/js/api.js"
      onload="this.onload=function(){};handleClientLoad()"
      onreadystatechange="if (this.readyState === 'complete') this.onload()">
     </script>
</asp:Content>
