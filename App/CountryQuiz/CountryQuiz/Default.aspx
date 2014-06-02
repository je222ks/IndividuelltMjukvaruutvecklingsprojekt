<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CountryQuiz.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" />
        <asp:Button ID="Button1" runat="server" Text="Get Message" OnClientClick="CallQuestion(); return false;" />
    </div>
    </form>
    <script src="question.js"></script>
</body>
</html>
