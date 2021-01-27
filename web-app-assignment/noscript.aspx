<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="noscript.aspx.cs" Inherits="web_app_assignment.noscript" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
    </form>

      
    <%-- Display no javascript message --%>
    <h3 style="color:red;">You must have JavaScript enabled in order to use this website. Please enable JavaScript and then reload this page in order to continue.</h3>

    <script>
        window.location.href ='home.aspx';
    </script>
</body>
</html>
