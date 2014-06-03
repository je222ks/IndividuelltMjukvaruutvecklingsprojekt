<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Site.Master" AutoEventWireup="true" CodeBehind="QuestionList.aspx.cs" Inherits="CountryQuiz.Pages.QuestionPages.QuestionList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <asp:Panel runat="server" ID="SuccessMessagePanel" Visible="false" CssClass="success">
        <asp:Literal runat="server" ID="SuccessMessageLiteral" />
    </asp:Panel>
    <asp:ListView ID="QuestionListView" runat="server"
        ItemType="CountryQuiz.Model.Question"
        SelectMethod="QuestionListView_GetData"
        DataKeyNames="QuestionID">
        <LayoutTemplate>
            <ul>
                <h2>Available Questions</h2>
                <h3>Click the questions to view more information.</h3>
            </ul>
            <asp:PlaceHolder ID="itemPlaceHolder" runat="server"></asp:PlaceHolder>
        </LayoutTemplate>
        <ItemTemplate>
            <li>
                <%-- Add navurl route    NavigateUrl='<%# GetRouteUrl("TripDetails", new { id = Item.QuestionID }) %>' --%>
                <asp:HyperLink runat="server" CssClass="liItm" Text='<%# Item.QuestionTitle %>' NavigateUrl='<%# GetRouteUrl("QuestionDetails", new { id = Item.QuestionID }) %>'></asp:HyperLink>
            </li>
        </ItemTemplate>
        <EmptyItemTemplate>
            <p>There were no questions to be retrieved.</p>
        </EmptyItemTemplate>
    </asp:ListView>


</asp:Content>
