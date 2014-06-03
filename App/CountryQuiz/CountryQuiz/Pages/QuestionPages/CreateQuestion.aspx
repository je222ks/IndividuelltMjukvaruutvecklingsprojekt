<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Site.Master" AutoEventWireup="true" CodeBehind="CreateQuestion.aspx.cs" Inherits="CountryQuiz.Pages.QuestionPages.CreateQuestion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="An error has occured. Please fix the issue and try again." CssClass="error" />
    <asp:FormView ID="AddQuestionFormView" runat="server"
        ItemType="CountryQuiz.Model.Question"
        DefaultMode="Insert"
        InsertMethod="AddQuestionFormView_InsertItem">
        <InsertItemTemplate>
            <div id="info">
                <div>
                    <label for="QuestionTitle" class="lbl">Please enter your question</label>
                </div>
                <div>
                    <asp:TextBox ID="QuestionTitle" runat="server" CssClass="txtBox" MaxLength="100" TextMode="MultiLine" Text='<%# BindItem.QuestionTitle %>'></asp:TextBox>
                    <asp:RequiredFieldValidator CssClass="error" ID="RequiredFieldValidator1" runat="server" ErrorMessage="The field may not be left empty" ControlToValidate="QuestionTitle" Display="None"></asp:RequiredFieldValidator>
                
                </div>
                <div>
                    <p>Please enter four (4) answer options, of which one should match the entry of the correct answer field.</p>
                </div>
                <div>
                    <label for="AnswerOption1" class="lbl">Answer one</label>
                </div>
                <div>
                    <asp:TextBox ID="AnswerOption1" CssClass="input" runat="server" Text='<%# BindItem.AnswerOption1 %>' MaxLength="50"></asp:TextBox>
                    <asp:RequiredFieldValidator CssClass="error" ID="RequiredFieldValidator2" runat="server" ErrorMessage="The field may not be left empty" ControlToValidate="AnswerOption1" Display="None"></asp:RequiredFieldValidator>
                </div>
                <div>
                    <label for="AnswerOption2" class="lbl">Answer two</label>
                </div>
                <div>
                    <asp:TextBox ID="AnswerOption2" runat="server"  CssClass="input" Text='<%# BindItem.AnswerOption2 %>' MaxLength="50"></asp:TextBox>
                    <asp:RequiredFieldValidator CssClass="error" ID="RequiredFieldValidator3" runat="server" ErrorMessage="The field may not be left empty" ControlToValidate="AnswerOption2" Display="None"></asp:RequiredFieldValidator>
                </div>
                <div>
                    <label for="AnswerOption3" class="lbl">Answer three</label>
                </div>
                <div>
                    <asp:TextBox ID="AnswerOption3" runat="server"  CssClass="input" Text='<%# BindItem.AnswerOption3 %>' MaxLength="50"></asp:TextBox>
                    <asp:RequiredFieldValidator CssClass="error" ID="RequiredFieldValidator4" runat="server" ErrorMessage="The field may not be left empty" ControlToValidate="AnswerOption3" Display="None"></asp:RequiredFieldValidator>
                </div>
                <div>
                    <label for="AnswerOption4" class="lbl">Answer four</label>
                </div>
                <div>
                    <asp:TextBox ID="AnswerOption4" runat="server"  CssClass="input" Text='<%# BindItem.AnswerOption4 %>' MaxLength="50"></asp:TextBox>
                    <asp:RequiredFieldValidator CssClass="error" ID="RequiredFieldValidator5" runat="server" ErrorMessage="The field may not be left empty" ControlToValidate="AnswerOption4" Display="None"></asp:RequiredFieldValidator>
                </div>
                <div>
                    <p>Please make sure that <strong>ONE</strong> of the above listed answer options match the correct answer.</p>
                    <label for="CorrectAnswer" class="lbl">Correct answer</label>
                </div>
                <div>
                    <asp:TextBox ID="CorrectAnswer" runat="server"  CssClass="input" Text='<%# BindItem.CorrectAnswer %>' MaxLength="50"></asp:TextBox>
                    <asp:RequiredFieldValidator CssClass="error" ID="RequiredFieldValidator6" runat="server" ErrorMessage="The field may not be left empty" ControlToValidate="CorrectAnswer" Display="None"></asp:RequiredFieldValidator>
                </div>
                <div>
                    <asp:LinkButton ID="LinkButton1" runat="server" Text="Add Question" CssClass="cmdBtn" CommandName="Insert"></asp:LinkButton>
                </div>
            </div>        
        </InsertItemTemplate>
    </asp:FormView>
</asp:Content>
