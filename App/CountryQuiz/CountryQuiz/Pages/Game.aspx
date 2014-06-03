<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Site.Master" AutoEventWireup="true" CodeBehind="Game.aspx.cs" Inherits="CountryQuiz.Pages.Game" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div id="main">
                <div id="logo">
                
                </div>
                <canvas id="gamecont">       
                </canvas>
                <p id="info">
                    <strong>Instructions</strong>
                    <br />
                    Use the arrow keys, or WASD to move the character (boot) around. 
                    <br />
                    The goal is to answer as many questions correctly as possible.
                    To trigger questions You have to reach the question marks on the playfield.
                    <br />
                    Good Luck!
                </p>
        </div>

        <script src="../js/player.js"></script>
        <script src="../js/game.js"></script>
</asp:Content>
