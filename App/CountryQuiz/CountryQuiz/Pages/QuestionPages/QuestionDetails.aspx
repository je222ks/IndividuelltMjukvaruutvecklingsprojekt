<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Site.Master" AutoEventWireup="true" CodeBehind="QuestionDetails.aspx.cs" Inherits="CountryQuiz.Pages.QuestionPages.QuestionDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="An error has occured. Please fix the issue and try again." CssClass="error" />
    <asp:FormView ID="QuestionFormView" runat="server"
        ItemType="CountryQuiz.Model.Question"
        SelectMethod="QuestionFormView_GetItem"
        DeleteMethod="QuestionFormView_DeleteItem"
        UpdateMethod="QuestionFormView_UpdateItem"
        RenderOuterTable="false">
        <ItemTemplate>
            <div>
                <label for="QuestionTitle" class="lbl">Question</label>
               
            </div>
            <div>
                 <%# Item.QuestionTitle %>
            </div>
            <div>
                <label for="AnswerOption1" class="lbl">Answer : </label>
                
            </div>
            <div>
                <%# Item.AnswerOption1 %>
            </div>
            <div>
                <label for="AnswerOption2" class="lbl">Answer : </label>
                
            </div>
            <div>
                <%# Item.AnswerOption2 %>
            </div>
            <div>
                <label for="AnswerOption3" class="lbl">Answer : </label>
                
            </div>
            <div>
                <%# Item.AnswerOption3 %>
            </div>
            <div>
                <label for="AnswerOption4" class="lbl">Answer : </label>
                
            </div>
            <div>
                <%# Item.AnswerOption4 %>
            </div>
            <div>
                <label for="CorrectAnswer" class="lbl">Correct Answer to the question : </label>
                
            </div>
            <div>
                <%# Item.CorrectAnswer %>
            </div>
            <div>
                <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Edit" CssClass="cmdBtn" Text="Edit Question"></asp:LinkButton>
                <asp:LinkButton runat="server" CommandName="Delete" Text="Remove Question" CssClass="cmdBtn" OnClientClick='<%# String.Format("return confirm(\"Are you sure you would like to remove the question, {0}?\")", Item.QuestionID) %>'></asp:LinkButton>
            </div>
        </ItemTemplate>
        <EditItemTemplate>
            <div>
                <label for="QuestionTitle" class="lbl">Question</label>
                <asp:TextBox ID="QuestionTitle" runat="server" CssClass="txtBox" MaxLength="100" TextMode="MultiLine" Text='<%# BindItem.QuestionTitle %>'></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="The field may not be left empty" ControlToValidate="QuestionTitle" Display="None"></asp:RequiredFieldValidator>
            </div>
            <div>
                <label for="AnswerOption1" class="lbl">Answer one</label>
                <asp:TextBox ID="AnswerOption1" CssClass="input" runat="server" Text='<%# BindItem.AnswerOption1 %>' MaxLength="50"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="The field may not be left empty" ControlToValidate="AnswerOption1" Display="None"></asp:RequiredFieldValidator>
            </div>
            <div>
                <label for="AnswerOption2" class="lbl">Answer two</label>
                <asp:TextBox ID="AnswerOption2" CssClass="input" runat="server" Text='<%# BindItem.AnswerOption2 %>' MaxLength="50"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="The field may not be left empty" ControlToValidate="AnswerOption2" Display="None"></asp:RequiredFieldValidator>
            </div>
            <div>
                <label for="AnswerOption3" class="lbl">Answer three</label>
                <asp:TextBox ID="AnswerOption3" CssClass="input" runat="server" Text='<%# BindItem.AnswerOption3 %>' MaxLength="50"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="The field may not be left empty" ControlToValidate="AnswerOption3" Display="None"></asp:RequiredFieldValidator>
            </div>
            <div>
                <label for="AnswerOption4" class="lbl">Answer four</label>
                <asp:TextBox ID="AnswerOption4" CssClass="input" runat="server" Text='<%# BindItem.AnswerOption4 %>' MaxLength="50"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="The field may not be left empty" ControlToValidate="AnswerOption4" Display="None"></asp:RequiredFieldValidator>
            </div>
            <div>
                
                <p>Please make sure that <strong>ONE</strong> of the above listed answer options match the correct answer.</p>
                <label for="CorrectAnswer" class="lbl">Correct answer</label>
                <asp:TextBox ID="CorrectAnswer"  CssClass="input" runat="server" Text='<%# BindItem.CorrectAnswer %>' MaxLength="50"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="The field may not be left empty" ControlToValidate="CorrectAnswer" Display="None"></asp:RequiredFieldValidator>
            </div>
            <div>
                <asp:LinkButton ID="LinkButton3" runat="server" CommandName="Update" CssClass="cmdBtn" Text="Save question"></asp:LinkButton>
                <asp:HyperLink runat="server" Text="Abort" CssClass="cmdBtn" NavigateUrl='<%# GetRouteUrl("QuestionDetails", new { id = Item.QuestionID }) %>'></asp:HyperLink>
            </div>
        </EditItemTemplate>
    </asp:FormView>
</asp:Content>
