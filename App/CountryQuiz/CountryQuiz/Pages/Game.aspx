<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Site.Master" AutoEventWireup="true" CodeBehind="Game.aspx.cs" Inherits="CountryQuiz.Pages.Game" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div id="main">
            <div id="menu">
            
            </div>
            <div id="container">
                <div id="logo">
                
                </div>
                <canvas id="gamecont">       
                </canvas>

                <asp:ScriptManager ID="MainScriptManager" runat="server" />
                <asp:UpdatePanel ID="QuestionPanel" runat="server">
                    <ContentTemplate>

                    </ContentTemplate>
                </asp:UpdatePanel>


                <p id="info">
                    Intructions.
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent aliquet arcu in libero laoreet, eget commodo libero tristique. Pellentesque semper, erat sit amet condimentum egestas, lacus tortor iaculis leo, sit amet pretium elit orci eget neque. Phasellus tempor tristique magna, ac lacinia quam mollis quis. Vivamus consectetur dignissim dictum. Suspendisse id lacinia tellus. Mauris nec ornare risus, vitae commodo arcu. Praesent fermentum pharetra lorem, vel hendrerit risus posuere eu. Phasellus consectetur nulla at volutpat dignissim. Vestibulum egestas, lectus vitae bibendum scelerisque, massa turpis ullamcorper dui, a vulputate odio nisi at nisl. Donec dignissim, dolor ut aliquet bibendum, dui odio feugiat lectus, non pretium justo leo sit amet lacus.
                
                </p>
            </div>
        </div>

        <script src="../js/player.js"></script>
        <script src="../js/game.js"></script>
</asp:Content>
