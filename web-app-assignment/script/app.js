//Script for navbar

if (window.location.pathname === "/home" || window.location.pathname === "/home.aspx") {
    var a = $("#page-content").height();
    $(document).on('scroll', function () {
        if ($(this).scrollTop() >= 100) {

            if ($(window).width() < 1000) {
                $("#header-nav").removeClass("bg-transparent");
                $("#header-nav").css("position", "");
            }
            else {
                $("#header-nav").css("position", "");
                $("#header-nav").removeClass("bg-transparent");
            }

        }
        else {

            if ($(window).width() < 1000) {
                $("#header-nav").removeClass("bg-transparent");
                $("#header-nav").css("position", "");
            }
            else {
                $("#header-nav").css("position", "absolute");
                $("#header-nav").addClass("bg-transparent");
            }
        }
    });

    $(document).ready(function () {
        if ($(window).width() < 1000) {
            $("#header-nav").removeClass("bg-transparent");
        }

        $(window).resize(function () {
            if ($(window).width() < 1000) {
                $("#header-nav").removeClass("bg-transparent");
                $("#header-nav").css("position", "");
            }
            else {
                if ($(this).scrollTop() >= 100) {
                    $("#header-nav").removeClass("bg-transparent");
                    $("#header-nav").css("position", "");
                }
                else {
                    $("#header-nav").addClass("bg-transparent");
                    $("#header-nav").css("position", "absolute");
                }

            }
        });

        //Add Class by default
        $("#header-nav").addClass("bg-transparent");
        $("#header-nav").css("position", "absolute");
    });
}

function helpQuestionToggleDown(question_id, toggle_id, call_id, question_title) {
    $(document).ready(function () {
        $('#' + question_id).slideDown();
        $('#' + toggle_id).css("transform", "rotate(0deg)");
        $('#' + call_id).attr("onclick", "helpQuestionToggleUp(" + '"' + question_id + '"' + "," + '"' + toggle_id + '"' + "," + '"' + call_id + '"' + "," + '"' + question_title + '")');
        $('#' + question_title).addClass("text-lightgreen");
    });
}

function helpQuestionToggleUp(question_id, toggle_id, call_id, question_title) {
    $(document).ready(function () {
        $('#' + question_id).slideUp();
        $('#' + toggle_id).css("transform", "rotate(90deg)");
        $('#' + call_id).attr("onclick", "helpQuestionToggleDown(" + '"' + question_id + '"' + "," + '"' + toggle_id + '"' + "," + '"' + call_id + '"' + "," + '"' + question_title + '")');
        $('#' + question_title).removeClass("text-lightgreen");
    });
}

function helpQuestionFilter() {
    question_input = document.getElementById("question-input").value.toUpperCase();
    current_question = document.getElementsByClassName("question-title");
    question_bar = document.getElementsByClassName("question-bar");

    for (var i = 0; i < current_question.length; i++) {
        if (current_question[i].innerHTML.toUpperCase().indexOf(question_input) > -1) {
            question_bar[i].style.display = "";
        }
        else if (question_input.value === "") {
            question_bar[i].style.display = "";
        }
        else {
            question_bar[i].style.display = "none";
        }
    }
}

function userProfileSwitchTab(tab_name) {

    about_content = document.getElementById("about-content");
    job_application_content = document.getElementById("job-application-content");

    if (tab_name === "about") {

        //Switch tab
        about_content.style.display = "";
        job_application_content.style.display = "none";

        //Change tab styling
        $('#about-tab').addClass("detail-nav-selected");
        $("#application-tab").removeClass("detail-nav-selected");
    }
    else if (tab_name === "application") {

        //Switch tab
        about_content.style.display = "none";
        job_application_content.style.display = "";

        //Change tab styling
        $('#application-tab').addClass("detail-nav-selected");
        $("#about-tab").removeClass("detail-nav-selected");
    }
    else {
        //default tab
        about_content.style.display = "";
        job_application_content.style.display = "none";

        //Change tab styling
        $('#about-tab').addClass("detail-nav-selected");
        $("#application-tab").removeClass("detail-nav-selected");
    }
}

function displayGoogleSignInContainer() {
    container = document.getElementById("google-signin-form");
    background = document.getElementById("google-signin-background");

    //display the background and container
    container.style.display = "";
    background.style.display = "";
}


function removeGoogleSignInContainer() {
    container = document.getElementById("google-signin-form");
    background = document.getElementById("google-signin-background");

    //Remove the background and container
    container.style.display = "none";
    background.style.display = "none";
}

function recruiterProfileSwitchTab(tab_name) {
    about_content = document.getElementById("about-content");
    job_application_content = document.getElementById("job-application-content");
    job_posted_content = document.getElementById("job-posted-content");

    if (tab_name === "about") {

        //Switch tab
        about_content.style.display = "";
        job_application_content.style.display = "none";
        job_posted_content.style.display = "none";

        //Change tab styling
        $('#about-tab').addClass("detail-nav-selected");
        $("#application-tab").removeClass("detail-nav-selected");
        $("#job-posted-tab").removeClass("detail-nav-selected");
    }
    else if (tab_name === "application") {

        //Switch tab
        about_content.style.display = "none";
        job_application_content.style.display = "";
        job_posted_content.style.display = "none";

        //Change tab styling
        $('#application-tab').addClass("detail-nav-selected");
        $("#about-tab").removeClass("detail-nav-selected");
        $("#job-posted-tab").removeClass("detail-nav-selected");
    }
    else if (tab_name === "job-posted") {
        //Switch tab
        about_content.style.display = "none";
        job_application_content.style.display = "none";
        job_posted_content.style.display = "";

        //Change tab styling
        $('#application-tab').removeClass("detail-nav-selected");
        $("#about-tab").removeClass("detail-nav-selected");
        $("#job-posted-tab").addClass("detail-nav-selected");
    }
    else {
        //default tab
        about_content.style.display = "";
        job_application_content.style.display = "none";
        job_posted_content.style.display = "none";

        //Change tab styling
        $('#about-tab').addClass("detail-nav-selected");
        $("#application-tab").removeClass("detail-nav-selected");
        $("#job-posted-tab").removeClass("detail-nav-selected");
    }
}

function timeZonePrintOut(id) {
    select_tag = document.getElementById(id);

    //Default timezones
    timezones_available = [
        "Africa/Abidjan",
        "Africa/Accra",
        "Africa/Addis_Ababa",
        "Africa/Algiers",
        "Africa/Asmara",
        "Africa/Asmera",
        "Africa/Bamako",
        "Africa/Bangui",
        "Africa/Banjul",
        "Africa/Bissau",
        "Africa/Blantyre",
        "Africa/Brazzaville",
        "Africa/Bujumbura",
        "Africa/Cairo",
        "Africa/Casablanca",
        "Africa/Ceuta",
        "Africa/Conakry",
        "Africa/Dakar",
        "Africa/Dar_es_Salaam",
        "Africa/Djibouti",
        "Africa/Douala",
        "Africa/El_Aaiun",
        "Africa/Freetown",
        "Africa/Gaborone",
        "Africa/Harare",
        "Africa/Johannesburg",
        "Africa/Juba",
        "Africa/Kampala",
        "Africa/Khartoum",
        "Africa/Kigali",
        "Africa/Kinshasa",
        "Africa/Lagos",
        "Africa/Libreville",
        "Africa/Lome",
        "Africa/Luanda",
        "Africa/Lubumbashi",
        "Africa/Lusaka",
        "Africa/Malabo",
        "Africa/Maputo",
        "Africa/Maseru",
        "Africa/Mbabane",
        "Africa/Mogadishu",
        "Africa/Monrovia",
        "Africa/Nairobi",
        "Africa/Ndjamena",
        "Africa/Niamey",
        "Africa/Nouakchott",
        "Africa/Ouagadougou",
        "Africa/Porto-Novo",
        "Africa/Sao_Tome",
        "Africa/Timbuktu",
        "Africa/Tripoli",
        "Africa/Tunis",
        "Africa/Windhoek",
        "America/Adak",
        "America/Anchorage",
        "America/Anguilla",
        "America/Antigua",
        "America/Araguaina",
        "America/Argentina/Buenos_Aires",
        "America/Argentina/Catamarca",
        "America/Argentina/ComodRivadavia",
        "America/Argentina/Cordoba",
        "America/Argentina/Jujuy",
        "America/Argentina/La_Rioja",
        "America/Argentina/Mendoza",
        "America/Argentina/Rio_Gallegos",
        "America/Argentina/Salta",
        "America/Argentina/San_Juan",
        "America/Argentina/San_Luis",
        "America/Argentina/Tucuman",
        "America/Argentina/Ushuaia",
        "America/Aruba",
        "America/Asuncion",
        "America/Atikokan",
        "America/Atka",
        "America/Bahia",
        "America/Bahia_Banderas",
        "America/Barbados",
        "America/Belem",
        "America/Belize",
        "America/Blanc-Sablon",
        "America/Boa_Vista",
        "America/Bogota",
        "America/Boise",
        "America/Buenos_Aires",
        "America/Cambridge_Bay",
        "America/Campo_Grande",
        "America/Cancun",
        "America/Caracas",
        "America/Catamarca",
        "America/Cayenne",
        "America/Cayman",
        "America/Chicago",
        "America/Chihuahua",
        "America/Coral_Harbour",
        "America/Cordoba",
        "America/Costa_Rica",
        "America/Creston",
        "America/Cuiaba",
        "America/Curacao",
        "America/Danmarkshavn",
        "America/Dawson",
        "America/Dawson_Creek",
        "America/Denver",
        "America/Detroit",
        "America/Dominica",
        "America/Edmonton",
        "America/Eirunepe",
        "America/El_Salvador",
        "America/Ensenada",
        "America/Fort_Nelson",
        "America/Fort_Wayne",
        "America/Fortaleza",
        "America/Glace_Bay",
        "America/Godthab",
        "America/Goose_Bay",
        "America/Grand_Turk",
        "America/Grenada",
        "America/Guadeloupe",
        "America/Guatemala",
        "America/Guayaquil",
        "America/Guyana",
        "America/Halifax",
        "America/Havana",
        "America/Hermosillo",
        "America/Indiana/Indianapolis",
        "America/Indiana/Knox",
        "America/Indiana/Marengo",
        "America/Indiana/Petersburg",
        "America/Indiana/Tell_City",
        "America/Indiana/Vevay",
        "America/Indiana/Vincennes",
        "America/Indiana/Winamac",
        "America/Indianapolis",
        "America/Inuvik",
        "America/Iqaluit",
        "America/Jamaica",
        "America/Jujuy",
        "America/Juneau",
        "America/Kentucky/Louisville",
        "America/Kentucky/Monticello",
        "America/Knox_IN",
        "America/Kralendijk",
        "America/La_Paz",
        "America/Lima",
        "America/Los_Angeles",
        "America/Louisville",
        "America/Lower_Princes",
        "America/Maceio",
        "America/Managua",
        "America/Manaus",
        "America/Marigot",
        "America/Martinique",
        "America/Matamoros",
        "America/Mazatlan",
        "America/Mendoza",
        "America/Menominee",
        "America/Merida",
        "America/Metlakatla",
        "America/Mexico_City",
        "America/Miquelon",
        "America/Moncton",
        "America/Monterrey",
        "America/Montevideo",
        "America/Montreal",
        "America/Montserrat",
        "America/Nassau",
        "America/New_York",
        "America/Nipigon",
        "America/Nome",
        "America/Noronha",
        "America/North_Dakota/Beulah",
        "America/North_Dakota/Center",
        "America/North_Dakota/New_Salem",
        "America/Ojinaga",
        "America/Panama",
        "America/Pangnirtung",
        "America/Paramaribo",
        "America/Phoenix",
        "America/Port-au-Prince",
        "America/Port_of_Spain",
        "America/Porto_Acre",
        "America/Porto_Velho",
        "America/Puerto_Rico",
        "America/Punta_Arenas",
        "America/Rainy_River",
        "America/Rankin_Inlet",
        "America/Recife",
        "America/Regina",
        "America/Resolute",
        "America/Rio_Branco",
        "America/Rosario",
        "America/Santa_Isabel",
        "America/Santarem",
        "America/Santiago",
        "America/Santo_Domingo",
        "America/Sao_Paulo",
        "America/Scoresbysund",
        "America/Shiprock",
        "America/Sitka",
        "America/St_Barthelemy",
        "America/St_Johns",
        "America/St_Kitts",
        "America/St_Lucia",
        "America/St_Thomas",
        "America/St_Vincent",
        "America/Swift_Current",
        "America/Tegucigalpa",
        "America/Thule",
        "America/Thunder_Bay",
        "America/Tijuana",
        "America/Toronto",
        "America/Tortola",
        "America/Vancouver",
        "America/Virgin",
        "America/Whitehorse",
        "America/Winnipeg",
        "America/Yakutat",
        "America/Yellowknife",
        "Antarctica/Casey",
        "Antarctica/Davis",
        "Antarctica/DumontDUrville",
        "Antarctica/Macquarie",
        "Antarctica/Mawson",
        "Antarctica/McMurdo",
        "Antarctica/Palmer",
        "Antarctica/Rothera",
        "Antarctica/South_Pole",
        "Antarctica/Syowa",
        "Antarctica/Troll",
        "Antarctica/Vostok",
        "Arctic/Longyearbyen",
        "Asia/Aden",
        "Asia/Almaty",
        "Asia/Amman",
        "Asia/Anadyr",
        "Asia/Aqtau",
        "Asia/Aqtobe",
        "Asia/Ashgabat",
        "Asia/Ashkhabad",
        "Asia/Atyrau",
        "Asia/Baghdad",
        "Asia/Bahrain",
        "Asia/Baku",
        "Asia/Bangkok",
        "Asia/Barnaul",
        "Asia/Beirut",
        "Asia/Bishkek",
        "Asia/Brunei",
        "Asia/Calcutta",
        "Asia/Chita",
        "Asia/Choibalsan",
        "Asia/Chongqing",
        "Asia/Chungking",
        "Asia/Colombo",
        "Asia/Dacca",
        "Asia/Damascus",
        "Asia/Dhaka",
        "Asia/Dili",
        "Asia/Dubai",
        "Asia/Dushanbe",
        "Asia/Famagusta",
        "Asia/Gaza",
        "Asia/Harbin",
        "Asia/Hebron",
        "Asia/Ho_Chi_Minh",
        "Asia/Hong_Kong",
        "Asia/Hovd",
        "Asia/Irkutsk",
        "Asia/Istanbul",
        "Asia/Jakarta",
        "Asia/Jayapura",
        "Asia/Jerusalem",
        "Asia/Kabul",
        "Asia/Kamchatka",
        "Asia/Karachi",
        "Asia/Kashgar",
        "Asia/Kathmandu",
        "Asia/Katmandu",
        "Asia/Khandyga",
        "Asia/Kolkata",
        "Asia/Krasnoyarsk",
        "Asia/Kuala_Lumpur",
        "Asia/Kuching",
        "Asia/Kuwait",
        "Asia/Macao",
        "Asia/Macau",
        "Asia/Magadan",
        "Asia/Makassar",
        "Asia/Manila",
        "Asia/Muscat",
        "Asia/Nicosia",
        "Asia/Novokuznetsk",
        "Asia/Novosibirsk",
        "Asia/Omsk",
        "Asia/Oral",
        "Asia/Phnom_Penh",
        "Asia/Pontianak",
        "Asia/Pyongyang",
        "Asia/Qatar",
        "Asia/Qostanay",
        "Asia/Qyzylorda",
        "Asia/Rangoon",
        "Asia/Riyadh",
        "Asia/Saigon",
        "Asia/Sakhalin",
        "Asia/Samarkand",
        "Asia/Seoul",
        "Asia/Shanghai",
        "Asia/Singapore",
        "Asia/Srednekolymsk",
        "Asia/Taipei",
        "Asia/Tashkent",
        "Asia/Tbilisi",
        "Asia/Tehran",
        "Asia/Tel_Aviv",
        "Asia/Thimbu",
        "Asia/Thimphu",
        "Asia/Tokyo",
        "Asia/Tomsk",
        "Asia/Ujung_Pandang",
        "Asia/Ulaanbaatar",
        "Asia/Ulan_Bator",
        "Asia/Urumqi",
        "Asia/Ust-Nera",
        "Asia/Vientiane",
        "Asia/Vladivostok",
        "Asia/Yakutsk",
        "Asia/Yangon",
        "Asia/Yekaterinburg",
        "Asia/Yerevan",
        "Atlantic/Azores",
        "Atlantic/Bermuda",
        "Atlantic/Canary",
        "Atlantic/Cape_Verde",
        "Atlantic/Faeroe",
        "Atlantic/Faroe",
        "Atlantic/Jan_Mayen",
        "Atlantic/Madeira",
        "Atlantic/Reykjavik",
        "Atlantic/South_Georgia",
        "Atlantic/St_Helena",
        "Atlantic/Stanley",
        "Australia/ACT",
        "Australia/Adelaide",
        "Australia/Brisbane",
        "Australia/Broken_Hill",
        "Australia/Canberra",
        "Australia/Currie",
        "Australia/Darwin",
        "Australia/Eucla",
        "Australia/Hobart",
        "Australia/LHI",
        "Australia/Lindeman",
        "Australia/Lord_Howe",
        "Australia/Melbourne",
        "Australia/NSW",
        "Australia/North",
        "Australia/Perth",
        "Australia/Queensland",
        "Australia/South",
        "Australia/Sydney",
        "Australia/Tasmania",
        "Australia/Victoria",
        "Australia/West",
        "Australia/Yancowinna",
        "Brazil/Acre",
        "Brazil/DeNoronha",
        "Brazil/East",
        "Brazil/West",
        "CET",
        "CST6CDT",
        "Canada/Atlantic",
        "Canada/Central",
        "Canada/Eastern",
        "Canada/Mountain",
        "Canada/Newfoundland",
        "Canada/Pacific",
        "Canada/Saskatchewan",
        "Canada/Yukon",
        "Chile/Continental",
        "Chile/EasterIsland",
        "Cuba",
        "EET",
        "EST",
        "EST5EDT",
        "Egypt",
        "Eire",
        "Etc/GMT",
        "Etc/GMT+0",
        "Etc/GMT+1",
        "Etc/GMT+10",
        "Etc/GMT+11",
        "Etc/GMT+12",
        "Etc/GMT+2",
        "Etc/GMT+3",
        "Etc/GMT+4",
        "Etc/GMT+5",
        "Etc/GMT+6",
        "Etc/GMT+7",
        "Etc/GMT+8",
        "Etc/GMT+9",
        "Etc/GMT-0",
        "Etc/GMT-1",
        "Etc/GMT-10",
        "Etc/GMT-11",
        "Etc/GMT-12",
        "Etc/GMT-13",
        "Etc/GMT-14",
        "Etc/GMT-2",
        "Etc/GMT-3",
        "Etc/GMT-4",
        "Etc/GMT-5",
        "Etc/GMT-6",
        "Etc/GMT-7",
        "Etc/GMT-8",
        "Etc/GMT-9",
        "Etc/GMT0",
        "Etc/Greenwich",
        "Etc/UCT",
        "Etc/UTC",
        "Etc/Universal",
        "Etc/Zulu",
        "Europe/Amsterdam",
        "Europe/Andorra",
        "Europe/Astrakhan",
        "Europe/Athens",
        "Europe/Belfast",
        "Europe/Belgrade",
        "Europe/Berlin",
        "Europe/Bratislava",
        "Europe/Brussels",
        "Europe/Bucharest",
        "Europe/Budapest",
        "Europe/Busingen",
        "Europe/Chisinau",
        "Europe/Copenhagen",
        "Europe/Dublin",
        "Europe/Gibraltar",
        "Europe/Guernsey",
        "Europe/Helsinki",
        "Europe/Isle_of_Man",
        "Europe/Istanbul",
        "Europe/Jersey",
        "Europe/Kaliningrad",
        "Europe/Kiev",
        "Europe/Kirov",
        "Europe/Lisbon",
        "Europe/Ljubljana",
        "Europe/London",
        "Europe/Luxembourg",
        "Europe/Madrid",
        "Europe/Malta",
        "Europe/Mariehamn",
        "Europe/Minsk",
        "Europe/Monaco",
        "Europe/Moscow",
        "Europe/Nicosia",
        "Europe/Oslo",
        "Europe/Paris",
        "Europe/Podgorica",
        "Europe/Prague",
        "Europe/Riga",
        "Europe/Rome",
        "Europe/Samara",
        "Europe/San_Marino",
        "Europe/Sarajevo",
        "Europe/Saratov",
        "Europe/Simferopol",
        "Europe/Skopje",
        "Europe/Sofia",
        "Europe/Stockholm",
        "Europe/Tallinn",
        "Europe/Tirane",
        "Europe/Tiraspol",
        "Europe/Ulyanovsk",
        "Europe/Uzhgorod",
        "Europe/Vaduz",
        "Europe/Vatican",
        "Europe/Vienna",
        "Europe/Vilnius",
        "Europe/Volgograd",
        "Europe/Warsaw",
        "Europe/Zagreb",
        "Europe/Zaporozhye",
        "Europe/Zurich",
        "GB",
        "GB-Eire",
        "GMT",
        "GMT+0",
        "GMT-0",
        "GMT0",
        "Greenwich",
        "HST",
        "Hongkong",
        "Iceland",
        "Indian/Antananarivo",
        "Indian/Chagos",
        "Indian/Christmas",
        "Indian/Cocos",
        "Indian/Comoro",
        "Indian/Kerguelen",
        "Indian/Mahe",
        "Indian/Maldives",
        "Indian/Mauritius",
        "Indian/Mayotte",
        "Indian/Reunion",
        "Iran",
        "Israel",
        "Jamaica",
        "Japan",
        "Kwajalein",
        "Libya",
        "MET",
        "MST",
        "MST7MDT",
        "Mexico/BajaNorte",
        "Mexico/BajaSur",
        "Mexico/General",
        "NZ",
        "NZ-CHAT",
        "Navajo",
        "PRC",
        "PST8PDT",
        "Pacific/Apia",
        "Pacific/Auckland",
        "Pacific/Bougainville",
        "Pacific/Chatham",
        "Pacific/Chuuk",
        "Pacific/Easter",
        "Pacific/Efate",
        "Pacific/Enderbury",
        "Pacific/Fakaofo",
        "Pacific/Fiji",
        "Pacific/Funafuti",
        "Pacific/Galapagos",
        "Pacific/Gambier",
        "Pacific/Guadalcanal",
        "Pacific/Guam",
        "Pacific/Honolulu",
        "Pacific/Johnston",
        "Pacific/Kiritimati",
        "Pacific/Kosrae",
        "Pacific/Kwajalein",
        "Pacific/Majuro",
        "Pacific/Marquesas",
        "Pacific/Midway",
        "Pacific/Nauru",
        "Pacific/Niue",
        "Pacific/Norfolk",
        "Pacific/Noumea",
        "Pacific/Pago_Pago",
        "Pacific/Palau",
        "Pacific/Pitcairn",
        "Pacific/Pohnpei",
        "Pacific/Ponape",
        "Pacific/Port_Moresby",
        "Pacific/Rarotonga",
        "Pacific/Saipan",
        "Pacific/Samoa",
        "Pacific/Tahiti",
        "Pacific/Tarawa",
        "Pacific/Tongatapu",
        "Pacific/Truk",
        "Pacific/Wake",
        "Pacific/Wallis",
        "Pacific/Yap",
        "Poland",
        "Portugal",
        "ROC",
        "ROK",
        "Singapore",
        "Turkey",
        "UCT",
        "US/Alaska",
        "US/Aleutian",
        "US/Arizona",
        "US/Central",
        "US/East-Indiana",
        "US/Eastern",
        "US/Hawaii",
        "US/Indiana-Starke",
        "US/Michigan",
        "US/Mountain",
        "US/Pacific",
        "US/Pacific-New",
        "US/Samoa",
        "UTC",
        "Universal",
        "W-SU",
        "WET",
        "Zulu"
    ];

    //Print out available timezones
    for (var i = 0; i < timezones_available.length; i++)
    {
        select_tag.innerHTML = select_tag.innerHTML + "<option value='" + timezones_available[i] + "'>" + timezones_available[i] + "</option>";
    }
    
}

function addMoreMeetingAttendees(id, className) {
    container = document.getElementById(id);
    attendees_input = document.getElementsByClassName(className);

    container.innerHTML = container.innerHTML + "<div class='extra-attendees-container' id='" + className + attendees_input.length +"'>"
        + "<input type='text' class='form-control m-0 mt-3 extra-attendees " + className + "' placeholder='attendees email'>"
        + "<button class='btn btn-danger m-0 mt-3 remove-attendees' type='button' onclick=" + '"removeExtraMeetingAttendees(' + "'" + className + attendees_input.length + "'" + ')"' + ">Remove</button>"
        + "</div>";
}

function removeExtraMeetingAttendees(id) {
    container = document.getElementById(id);

    //Remove the input box
    container.remove();
}

function createScheduleMeeting() {

    var meeting_title = document.getElementById("meeting-name").value;
    var meeting_location = document.getElementById("meeting-location").value;
    var meeting_description = document.getElementById("meeting-description").value;

    //Start Date
    var meeting_startDate = document.getElementById("meeting-startDate").value;
    var meeting_startTime = document.getElementById("meeting-startTime").value;
    var meeting_startTimezones = document.getElementById("meeting-startTimeZone").value;

    //End Date
    var meeting_endDate = document.getElementById("meeting-endDate").value;
    var meeting_endTime = document.getElementById("meeting-endTime").value;
    var meeting_endTimezones = document.getElementById("meeting-endTimeZone").value;

    //Google Meet Data
    var meet_enabled = document.getElementById("meeting-googleMeet").value;
    var event = {};

    //Attendees Collections
    var attendees_collection = document.getElementsByClassName("meeting-attendees");

    console.log(meeting_startDate + "T" + meeting_startTime)

    if (meet_enabled === "enable") {
         event = {
            'summary': meeting_title,
            'location': meeting_location,
            'description': meeting_description,
            'start': {
                'dateTime': meeting_startDate + "T" + meeting_startTime + ":00",
                'timeZone': meeting_startTimezones
            },
            'end': {
                'dateTime': meeting_endDate + "T" + meeting_endTime + ":00",
                'timeZone': meeting_endTimezones
            },
            "conferenceData": {
                "createRequest": {
                    "conferenceSolutionKey": {
                        "type": "hangoutsMeet"
                    },
                    "requestId": "some-random-string"
                }
            },
            //'recurrence': [
            //    'RRULE:FREQ=DAILY;COUNT=2'
            //],
            'attendees': [
               
            ],
            'reminders': {
                'useDefault': false,
                'overrides': [
                    { 'method': 'email', 'minutes': 24 * 60 },
                    { 'method': 'popup', 'minutes': 10 }
                ]
            }
        };
    }
    else {
        event = {
            'summary': meeting_title,
            'location': meeting_location,
            'description': meeting_description,
            'start': {
                'dateTime': meeting_startDate + "T" + meeting_startTime + ":00",
                'timeZone': meeting_startTimezones
            },
            'end': {
                'dateTime': meeting_endDate + "T" + meeting_endTime + ":00",
                'timeZone': meeting_endTimezones
            },
            //'recurrence': [
            //    'RRULE:FREQ=DAILY;COUNT=2'
            //],
            'attendees': [
               
            ],
            'reminders': {
                'useDefault': false,
                'overrides': [
                    { 'method': 'email', 'minutes': 24 * 60 },
                    { 'method': 'popup', 'minutes': 10 }
                ]
            }
        };
    }

    //Get Google User Profile
    var profile = gapi.auth2.getAuthInstance().currentUser.get().getBasicProfile();
    var organizer_email = profile.getEmail();

    //Insert Attendees to the event JSON Object
    for (var i = 0; i < attendees_collection.length; i++) {
        event.attendees.push({ 'email': attendees_collection[i].value });
    }

    console.log(event)

    var request = gapi.client.calendar.events.insert({
        'calendarId': organizer_email,
        "conferenceDataVersion": 1,
        'resource': event,
        'sendUpdates': "all",
    });

    request.execute(function (event) {
        appendPre('Event created: ' + event.htmlLink);
    });
}