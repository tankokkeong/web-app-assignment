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