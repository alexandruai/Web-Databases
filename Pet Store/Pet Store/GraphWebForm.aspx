<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GraphWebForm.aspx.cs" Inherits="Pet_Store.GraphWebForm" %>

<%@ Register assembly="ZedGraph.Web" namespace="ZedGraph.Web" tagprefix="cc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <cc1:ZedGraphWeb ID="ZedGraphWeb1" runat="server" Height="550" Width="550">
            </cc1:ZedGraphWeb>
            <asp:Button ID="btnBack" runat="server" OnClick="btnBack_Click" Text="Pagina Principala" />
        </div>
    </form>
</body>
</html>
