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
                <div class="form-row">

                    <div class="col-sm-12 col-lg-6 mt-3">
                        <input type="text" class="form-control" placeholder="Event name">
                    </div>

                    <div class="col-sm-12 col-lg-6 mt-3">
                        <input type="text" class="form-control" placeholder="Location">
                    </div>

                </div>

                <div class="form-row">

                    <div class="col-sm-12 col-lg-6 mt-3">
                        <input type="text" class="form-control" placeholder="Start Date">
                    </div>

                    <div class="col-sm-12 col-lg-6 mt-3">
                        <input type="text" class="form-control" placeholder="End Date">
                    </div>

                </div>

                <div class="mt-3">
                    <button type="button" class="btn btn-info" type="button" onclick="CreateMeeting()">Schedule</button>
                    <a href="recruiter-profile.aspx" class="btn btn-secondary">Back</a>
                </div>
            </form>
        </div>
    </div>

        <!--Add buttons to initiate auth sequence and sign out-->
    <button id="authorize_button" style="display: none;" type="button">Authorize</button>
    <button id="signout_button" style="display: none;" type="button">Sign Out</button>
    <!-- <button onclick="create()">Create</button> -->

    <pre id="content" style="white-space: pre-wrap;"></pre>

    <%-- Google Calendar API --%>
    <pre id="content" style="white-space: pre-wrap;"></pre>

    <script type="text/javascript">
        // Client ID and API key from the Developer Console
        var CLIENT_ID = '783031485843-1388p6sau7qmn1cki8jk49qms6qqscal.apps.googleusercontent.com';
        var API_KEY = 'AIzaSyCoBZ7OyCvywGL-6tAyGBixDd-rB7YAu2c';

        // Array of API discovery doc URLs for APIs used by the quickstart
        var DISCOVERY_DOCS = ["https://www.googleapis.com/discovery/v1/apis/calendar/v3/rest"];

        // Authorization scopes required by the API; multiple scopes can be
        // included, separated by spaces.
        var SCOPES = "https://www.googleapis.com/auth/calendar";

        var authorizeButton = document.getElementById('authorize_button');
        var signoutButton = document.getElementById('signout_button');

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
                authorizeButton.onclick = handleAuthClick;
                signoutButton.onclick = handleSignoutClick;
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
                authorizeButton.style.display = 'none';
                signoutButton.style.display = 'block';
                removeGoogleSignInContainer();
            } else {
                authorizeButton.style.display = 'block';
                signoutButton.style.display = 'none';
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
            var pre = document.getElementById('content');
            var textContent = document.createTextNode(message + '\n');
            pre.appendChild(textContent);
        }

        /**
         * Print the summary and start datetime/date of the next ten events in
         * the authorized user's calendar. If no events are found an
         * appropriate message is printed.
         */
        function listUpcomingEvents() {
            gapi.client.calendar.events.list({
                'calendarId': 'primary',
                'timeMin': (new Date()).toISOString(),
                'showDeleted': false,
                'singleEvents': true,
                'maxResults': 10,
                'orderBy': 'startTime'
            }).then(function (response) {
                var events = response.result.items;
                appendPre('Upcoming events:');

                if (events.length > 0) {
                    for (i = 0; i < events.length; i++) {
                        var event = events[i];
                        var when = event.start.dateTime;
                        if (!when) {
                            when = event.start.date;
                        }
                        appendPre(event.summary + ' (' + when + ')')
                    }
                } else {
                    appendPre('No upcoming events found.');
                }
            });
        }

        function removeGoogleSignInContainer() {
            container = document.getElementById("google-signin-form");
            background = document.getElementById("google-signin-background");

            //Remove the background and container
            container.style.display = "none";
            background.style.display = "none";
        }

        function CreateMeeting() {
            var event = {
                'summary': 'Interview',
                'location': '800 Howard St., San Francisco, CA 94103',
                'description': 'A chance to hear more about Google\'s developer products.',
                'start': {
                    'dateTime': '2021-05-28T09:00:00-07:00',
                    'timeZone': 'America/Los_Angeles'
                },
                'end': {
                    'dateTime': '2021-05-28T17:00:00-07:00',
                    'timeZone': 'America/Los_Angeles'
                },
                "conferenceData": {
                    "createRequest": {
                        "conferenceSolutionKey": {
                            "type": "hangoutsMeet"
                        },
                        "requestId": "some-random-string"
                    }
                },
                'recurrence': [
                    'RRULE:FREQ=DAILY;COUNT=2'
                ],
                'attendees': [
                    { 'email': 'tankokkeong4488@gmail.com' },
                ],
                'reminders': {
                    'useDefault': false,
                    'overrides': [
                        { 'method': 'email', 'minutes': 24 * 60 },
                        { 'method': 'popup', 'minutes': 10 }
                    ]
                }
            };

            var request = gapi.client.calendar.events.insert({
                'calendarId': 'demo33885.email@gmail.com',
                "conferenceDataVersion": 1,
                'resource': event,
                'sendUpdates': "all",
            });

            request.execute(function (event) {
                appendPre('Event created: ' + event.htmlLink);
            });
        }

    </script>

    <script async defer src="https://apis.google.com/js/api.js"
      onload="this.onload=function(){};handleClientLoad()"
      onreadystatechange="if (this.readyState === 'complete') this.onload()">
    </script>
</asp:Content>
