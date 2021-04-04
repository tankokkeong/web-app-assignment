﻿<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="web_app_assignment.admin.dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        google.charts.load('current', { 'packages': ['bar'] });
        google.charts.setOnLoadCallback(drawBarChart);
        

        function drawBarChart() {

            var dataChart = <%=chartValue%>;
            var dataChart2 = <%=chartValue2%>;
            var dataChart3 = <%=chartValue3%>;

            var data = google.visualization.arrayToDataTable([
                ['Year', 'Visitor', 'Recruiter', 'Job Seeker'],
                ['2020', 10531, 20512, 9000],
                ['2021', dataChart3, dataChart, dataChart2],
                ['2022', 0, 0, 0],
                ['2023', 0, 0, 0]
            ]);

            var options = {
                chart: {
                    title: 'People Registered',
                    subtitle: 'Visitors, Recruiters, and Job Seeker: 2020-2023',
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
    </script>

    <script>
        google.charts.load('current', { 'packages': ['corechart'] });
        google.charts.setOnLoadCallback(drawLineChart);

        var dataChartApp = <%=chartValueApp%>;
        function drawLineChart() {
            var data = google.visualization.arrayToDataTable([
                ['Year', 'Total Application'],
                ['2018', 30510],
                ['2019', 13030],
                ['2020', 10500],
                ['2021', dataChartApp]
            ]);

            var options = {
                title: 'Application Sent',
                curveType: 'function',
                legend: { position: 'bottom' }
            };

            var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

            chart.draw(data, options);
        }


        $(window).resize(function () {
            drawBarChart();
            drawLineChart();
        });
    </script>

    <script>
        google.charts.load('current', { 'packages': ['corechart'] });
        google.charts.setOnLoadCallback(drawChart);

        function drawChart() {

            var chartPremium = <%=chartValuePremium%>;
            var chartPremium2 = <%=chartValuePremium2%>;

            var data = google.visualization.arrayToDataTable([
                ['Premium', 'Year'],
                ['Premium', chartPremium],
                ['Non-Premium', chartPremium2],
            ]);

            var options = {
                title: 'Premium Recruiter'
            };

            var chart = new google.visualization.PieChart(document.getElementById('piechart'));

            chart.draw(data, options);
        }
    </script>

    <script>
        google.charts.load("current", { packages: ["corechart"] });
        google.charts.setOnLoadCallback(drawChart);

        function drawChart() {

            var chartPayment = <%=chartValuePayment%>;

            var data = google.visualization.arrayToDataTable([
                ['Year', 'Payment Amount(RM)', { role: 'style' }],
                ['2018', 20000, 'color: gray'],
                ['2019', 25000, 'color: #76A7FA'],
                ['2020', 30000, 'opacity: 0.2'],
                ['2021', chartPayment, 'stroke-color: #703593; stroke-width: 4; fill-color: #C5A5CF']
            ]);

            var view = new google.visualization.DataView(data);
            view.setColumns([0, 1,
                {
                    calc: "stringify",
                    sourceColumn: 1,
                    type: "string",
                    role: "annotation"
                },
                2]);

            var options = {
                title: "Payment Amount In A Year",
                bar: { groupWidth: "95%" },
                legend: { position: "none" },
            };
            var chart = new google.visualization.BarChart(document.getElementById("barchart_values"));
            chart.draw(view, options);
        }
    </script>


    <%-- CSS --%>
    <link href="css/dashboard.css" rel="stylesheet" />

    <%-- JQuery UI --%>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <script>
        $(function () {

            //Draggable
            $("#draggable1").draggable({ containment: "#draggable-wrapper", scroll: false });
            $("#draggable2").draggable({ containment: "#draggable-wrapper", scroll: false });
            $("#draggable3").draggable({ containment: "#draggable-wrapper", scroll: false });

            //Sortable
            $("#sortable").sortable();
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <form runat="server">
    <div class="app-title">
        <div>
          <h1><i class="fa fa-dashboard"></i> Dashboard</h1>
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
              <%-- <p><b>5</b></p> --%>
              <asp:Label ID="lblVisitorDisplay" runat="server" CssClass="font-weight-bold"></asp:Label>
            </div>
          </div>
        </div>

        <div class="col-md-6 col-lg-3">
          <div class="widget-small info coloured-icon"><i class="icon fa fa-users fa-3x"></i>
            <div class="info">
              <h4>Job Seeker</h4>
              <%-- <p><b>25</b></p> --%>
              <asp:Label ID="lblJobSeekerDisplay" runat="server" CssClass="font-weight-bold"></asp:Label>
            </div>
          </div>
        </div>

        <div class="col-md-6 col-lg-3">
          <div class="widget-small warning coloured-icon"><i class="icon fa fa-users fa-3x"></i>
            <div class="info">
              <h4>Recruiter</h4>
              <%-- <p><b>10</b></p> --%>
              <asp:Label ID="lblRecruiterDisplay" runat="server" CssClass="font-weight-bold"></asp:Label>
            </div>
          </div>
        </div>

        <div class="col-md-6 col-lg-3">
          <div class="widget-small danger coloured-icon"><i class="icon fas fa-suitcase fa-3x"></i>
            <div class="info">
              <h4>Job Posted</h4>
              <%-- <p><b>500</b></p> --%>
              <asp:Label ID="lblJobPostedDisplay" runat="server" CssClass="font-weight-bold"></asp:Label>
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

    <div class="row">
        <div class="col-sm-12 col-lg-6 mt-3">
            <div id="piechart" class="chart-display">

            </div>
        </div>

        <div class="col-sm-12 col-lg-6 mt-3">
            <div id="barchart_values" class="chart-display">

            </div>
        </div>
    </div>

       

    <div class="row mt-3" style="height:1000px;" id="draggable-wrapper">
        <div id="draggable1" class="col-md-6 col-lg-4 mt-3">
            <div class="to-do-list">
                <div class="do-list-header">
                    <h5 class="text-light">To-Do-List 
                        <span class="float-right" id="add-to-do-list" data-toggle="modal" data-target="#todoModal"><i class="fas fa-plus-circle"></i></span>
                    </h5>
                </div>

                <div class="do-list-content" id="sortable">
                       <%-- <h5 class="mb-0">Meet Up with clients</h5> --%>
                       <%-- <p class="text-secondary mb-0">At KFC Batu Caves, Monday</p> --%>
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:Literal ID="litResultToDoList" runat="server"></asp:Literal>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>

        <div id="draggable2" class="col-md-6 col-lg-4 mt-3">
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

        <div id="draggable3" class="col-md-6 col-lg-4 mt-3">
            <div class="top-company-card">
                <div class="top-company-header">
                    <h5 class="text-light">Top 5 Companies</h5>
                    <p class="text-light">Companies that have best review rates</p>
                </div>

                <div class="top-company-content">
                    <div class="media">
                      <%--<img src="../images/home/partner5-min.png" class="mr-3 top-company-pic" alt="..." /> --%>
                        <asp:Image ID="imgCompany" runat="server" class="mr-3 top-company-pic"/>
                      <div class="media-body">
                        <%--<h5 class="mt-0">Netflix</h5> --%>
                        <%--<p class="text-secondary">Will you do the same for me? It's time to face the music I'm no longer your muse.</p> --%>
                          <asp:Literal ID="litResultCompany" runat="server"></asp:Literal>
                      </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <!-- To-do-list Modal -->
    <div class="modal fade" id="todoModal" tabindex="-1" aria-labelledby="todoModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
                <div class="form-group">
                   <%-- <label for="exampleInputEmail1">Task Name</label> --%>
                   <%-- <input type="text" class="form-control" > --%>
                    <asp:Label ID="lblTaskName" runat="server" Text="Task Name"></asp:Label>
                    <asp:TextBox ID="txtTaskName" runat="server" class="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqValTaskName" runat="server"  ErrorMessage="Task Name is required to fill in!" CssClass="text-danger" ControlToValidate="txtTaskName" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>

                <div class="form-group">
                   <%-- <label for="exampleInputEmail1">Task Remarks</label> --%>
                   <%-- <input type="text" class="form-control" > --%>
                    <asp:Label ID="lblTaskRemarks" runat="server" Text="Task Remarks"></asp:Label>
                    <asp:TextBox ID="txtTaskRemarks" runat="server" class="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqValTaskRemarks" runat="server"  ErrorMessage="Task Remarks is required to fill in!" CssClass="text-danger" ControlToValidate="txtTaskRemarks" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
                <div class="modal-footer">
                   <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                   <%-- <button type="button" class="btn btn-primary">Add Task</button> --%>
                   <asp:Button ID="btnAddTask" runat="server" class="btn btn-primary" Text="Add Task" OnClick="btnAddTask_Click" />
                </div>
          </div>

        </div>
      </div>
    </div>
      
 </form>
    <script>
        $(".delete-task-btn").each(function () {
            $(this).click(function () {
                $.post("task-post.aspx",
                    {
                        task_id: $(this).attr('data-taskID')
                    });
            });
        });

    </script>
    
</asp:Content>
