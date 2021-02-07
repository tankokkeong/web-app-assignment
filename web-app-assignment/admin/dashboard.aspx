<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="web_app_assignment.admin.dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        google.charts.load('current', { 'packages': ['bar'] });
        google.charts.setOnLoadCallback(drawBarChart);

        function drawBarChart() {
            var data = google.visualization.arrayToDataTable([
                ['Year', 'Visitor', 'Recruiter', 'Job Seeker'],
                ['Monday', 1000, 400, 200],
                ['Tuesday', 1170, 460, 250],
                ['Wednesday', 660, 1120, 300],
                ['Thursday', 1030, 540, 350],
                ['Friday', 1030, 540, 350],
                ['Saturday', 1030, 540, 350],
                ['Sunday', 1030, 540, 350]
            ]);

            var options = {
                chart: {
                    title: 'People Visited',
                    subtitle: 'Visitors, Recruiters, and Job Seeker: Mon-Fri',
                },

                backgroundColor: "transparent",
                chartArea: {
                    backgroundColor: "transparent"
                },

                colors: [ "#009688", "#17a2b8", "#ffc107"],
            };

            var chart = new google.charts.Bar(document.getElementById('columnchart_material'));

            chart.draw(data, google.charts.Bar.convertOptions(options));
        }

        $(window).resize(function () {
            drawBarChart();
            drawLineChart();
        });
    </script>

    <script>
        google.charts.load('current', { 'packages': ['corechart'] });
        google.charts.setOnLoadCallback(drawLineChart);

        function drawLineChart() {
            var data = google.visualization.arrayToDataTable([
                ['Month', 'Total Application'],
                ['Jan', 1000],
                ['Feb', 1170],
                ['Mar', 660],
                ['Apr', 1030]
            ]);

            var options = {
                title: 'Application Sent',
                curveType: 'function',
                legend: { position: 'bottom' }
            };

            var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

            chart.draw(data, options);
        }
    </script>

    <%-- CSS --%>
    <link href="css/dashboard.css" rel="stylesheet" />

    <%-- JQuery UI --%>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <script>
        $(function () {
            $("#draggable1").draggable({ containment: "#draggable-wrapper", scroll: false });
            $("#draggable2").draggable({ containment: "#draggable-wrapper", scroll: false });
            $("#draggable3").draggable({ containment: "#draggable-wrapper", scroll: false });
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="app-title">
        <div>
          <h1><i class="fa fa-dashboard"></i> Dashboard</h1>
          <p>A free and open source Bootstrap 4 admin template</p>
        </div>
        <ul class="app-breadcrumb breadcrumb">
          <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
          <li class="breadcrumb-item"><a href="#">Dashboard</a></li>
        </ul>
      </div>

      <div class="row">

        <div class="col-md-6 col-lg-3">
          <div class="widget-small primary coloured-icon"><i class="icon fa fa-users fa-3x"></i>
            <div class="info">
              <h4>Visitor</h4>
              <p><b>5</b></p>
            </div>
          </div>
        </div>

        <div class="col-md-6 col-lg-3">
          <div class="widget-small info coloured-icon"><i class="icon fa fa-users fa-3x"></i>
            <div class="info">
              <h4>Job Seeker</h4>
              <p><b>25</b></p>
            </div>
          </div>
        </div>

        <div class="col-md-6 col-lg-3">
          <div class="widget-small warning coloured-icon"><i class="icon fa fa-users fa-3x"></i>
            <div class="info">
              <h4>Recruiter</h4>
              <p><b>10</b></p>
            </div>
          </div>
        </div>

        <div class="col-md-6 col-lg-3">
          <div class="widget-small danger coloured-icon"><i class="icon fas fa-suitcase fa-3x"></i>
            <div class="info">
              <h4>Job Posted</h4>
              <p><b>500</b></p>
            </div>
          </div>
        </div>

      </div>

    <div class="row">
        <div class="col-sm-12 col-lg-6 mt-3">
            <div id="columnchart_material" class="chart-display">

            </div>
        </div>

        <div class="col-sm-12 col-lg-6 mt-3">
            <div id="curve_chart" class="chart-display">

            </div>
        </div>
    </div>

    <div class="row" style="height:1000px;" id="draggable-wrapper">
        <div id="draggable1" class="col-md-6 col-lg-4">

        </div>

        <div id="draggable2" class="col-md-6 col-lg-4">
            <div class="wrapper">
              <div class="container-calendar">
                  <h3 id="monthAndYear"></h3>
                  <div class="button-container-calendar">
                      <button id="previous" onclick="previousMonth()" type="button">&#8249;</button>
                      <button id="next" onclick="nextMonth()" type="button">&#8250;</button>
                  </div>
          
                  <table class="table-calendar" id="calendar" data-lang="en">
                      <thead id="thead-month"></thead>
                      <tbody id="calendar-body"></tbody>
                  </table>
          
                  <div class="footer-container-calendar">
                      <label for="month">Jump To: </label>
                      <select id="month" onchange="jump()">
                          <option value=0>Jan</option>
                          <option value=1>Feb</option>
                          <option value=2>Mar</option>
                          <option value=3>Apr</option>
                          <option value=4>May</option>
                          <option value=5>Jun</option>
                          <option value=6>Jul</option>
                          <option value=7>Aug</option>
                          <option value=8>Sep</option>
                          <option value=9>Oct</option>
                          <option value=10>Nov</option>
                          <option value=11>Dec</option>
                      </select>
                      <select id="year" onchange="jump()"></select>       
                  </div>
              </div>
            </div>
            <script src="js/calendar.js"></script>

        </div>

        <div id="draggable3" class="col-md-6 col-lg-4">

        </div>

    </div>
      

      
</asp:Content>
