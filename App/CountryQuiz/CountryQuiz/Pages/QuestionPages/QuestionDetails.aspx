<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Site.Master" AutoEventWireup="true" CodeBehind="QuestionDetails.aspx.cs" Inherits="CountryQuiz.Pages.QuestionPages.QuestionDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="An error has occured. Please fix the issue and try again." />
    <asp:FormView ID="QuestionFormView" runat="server"
        ItemType="CountryQuiz.Model.Question"
        SelectMethod="QuestionFormView_GetItem"
        DeleteMethod="QuestionFormView_DeleteItem"
        UpdateMethod="QuestionFormView_UpdateItem"
        RenderOuterTable="false">
        <ItemTemplate>
            <div>
                <label for="QuestionTitle">Question</label>
                <%# Item.QuestionTitle %>
            </div>
            <div>
                <label for="AnswerOption1">Answer : </label>
                <%# Item.AnswerOption1 %>
            </div>
            <div>
                <label for="AnswerOption2">Answer : </label>
                <%# Item.AnswerOption2 %>
            </div>
            <div>
                <label for="AnswerOption3">Answer : </label>
                <%# Item.AnswerOption3 %>
            </div>
            <div>
                <label for="AnswerOption4">Answer : </label>
                <%# Item.AnswerOption4 %>
            </div>
            <div>
                <label for="CorrectAnswer">Correct Answer to the question : </label>
                <%# Item.CorrectAnswer %>
            </div>
            <div>
                <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Edit" Text="Edit Question"></asp:LinkButton>
                <asp:LinkButton runat="server" CommandName="Delete" Text="Remove Question" OnClientClick='<%# String.Format("return confirm(\"Are you sure you would like to remove the question, {0}?\")", Item.QuestionID) %>'></asp:LinkButton>
            </div>
        </ItemTemplate>
        <EditItemTemplate>
            <div>
                <label for="QuestionTitle">Question</label>
                <asp:TextBox ID="QuestionTitle" runat="server" MaxLength="100" TextMode="MultiLine" Text='<%# BindItem.QuestionTitle %>'></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="The field may not be left empty" ControlToValidate="QuestionTitle" Display="None"></asp:RequiredFieldValidator>
            </div>
            <div>
                <label for="AnswerOption1">Answer one</label>
                <asp:TextBox ID="AnswerOption1" runat="server" Text='<%# BindItem.AnswerOption1 %>' MaxLength="50"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="The field may not be left empty" ControlToValidate="AnswerOption1" Display="None"></asp:RequiredFieldValidator>
            </div>
            <div>
                <label for="AnswerOption2">Answer two</label>
                <asp:TextBox ID="AnswerOption2" runat="server" Text='<%# BindItem.AnswerOption2 %>' MaxLength="50"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="The field may not be left empty" ControlToValidate="AnswerOption2" Display="None"></asp:RequiredFieldValidator>
            </div>
            <div>
                <label for="AnswerOption3">Answer three</label>
                <asp:TextBox ID="AnswerOption3" runat="server" Text='<%# BindItem.AnswerOption3 %>' MaxLength="50"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="The field may not be left empty" ControlToValidate="AnswerOption3" Display="None"></asp:RequiredFieldValidator>
            </div>
            <div>
                <label for="AnswerOption4">Answer four</label>
                <asp:TextBox ID="AnswerOption4" runat="server" Text='<%# BindItem.AnswerOption4 %>' MaxLength="50"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="The field may not be left empty" ControlToValidate="AnswerOption4" Display="None"></asp:RequiredFieldValidator>
            </div>
            <div>
                <label for="CorrectAnswer">Correct answer</label>
                <p>Please make sure that <strong>ONE</strong> of the above listed answer options match the correct answer.</p>
                <asp:TextBox ID="CorrectAnswer" runat="server" Text='<%# BindItem.CorrectAnswer %>' MaxLength="50"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="The field may not be left empty" ControlToValidate="CorrectAnswer" Display="None"></asp:RequiredFieldValidator>
            </div>
            <div>
                <asp:LinkButton ID="LinkButton3" runat="server" CommandName="Update" Text="Save question"></asp:LinkButton>
                <asp:HyperLink runat="server" Text="Abort" NavigateUrl='<%# GetRouteUrl("QuestionDetails", new { id = Item.QuestionID }) %>'></asp:HyperLink>
            </div>
        </EditItemTemplate>
    </asp:FormView>
</asp:Content>
