function navbarActive() {
    nav_option = document.getElementsByClassName("app-menu__item");
}

function changeClientsType() {
    selected_option = document.getElementById("client-management-option").value;

    if (selected_option == "Job Seeker") {

        //Display Job Seeker management
        window.location.href = "clients-management.aspx";
    }
    else {

        //Display Recruiter management
        window.location.href = "clients-management-r.aspx";
    }
}

function dashboardSearch() {
    var search_input = document.getElementById("dashboard-search-input").value;
    var results_container = document.getElementById("dashboard-search-results-container");
    var result_item = document.getElementsByClassName("app-search-item");
    var matching_container = [];

    if (search_input.length > 0) {

        //Display Search Results box
        results_container.style.display = "";
    }
    else
    {
        //Remove Search Results box
        results_container.style.display = "none";
    }

    for (var i = 0; i < result_item.length; i++) {

        //Convert the results and input to lowercase
        if (result_item[i].innerHTML.toLowerCase().includes(search_input.toLowerCase())) {

            //Display matching results
            result_item[i].style.display = "";

            matching_container.push(result_item[i].href);
            
        }
        else
        {
            //Remove not matching results
            result_item[i].style.display = "none";
        }
    }

    //Check if the array is empty
    if (matching_container.length > 0) {
        //If user press the enter key
        if (event.keyCode === 13) {
            event.preventDefault();

            window.location.href = matching_container[0];
        }
    }
    
  
}