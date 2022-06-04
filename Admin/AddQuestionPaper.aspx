<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true"
    CodeFile="AddQuestionPaper.aspx.cs" Inherits="Admin_AddQuestionPaper" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:HiddenField ID="hdnQuestionPaperId" runat="server" />
    <div style="width: 100%">
        <div id="main-title">
            <h1>
                Question Paper</h1>
        </div>
        <div class="yo-panel">
            <div class="yo-panel-header">
                <span class="yo-i-24 i-table-1">Question&nbsp;Paper</span>
            </div>
            <div class="yo-panel-body">
                <table class="yo-form" width="100%">
                    <tr>
                        <td class="reqlabel">
                            Question Paper
                        </td>
                        <td>
                            :
                        </td>
                        <td>
                            <textarea id="txtQuestionPaper" runat="server" class="yo-textinput" cols="30" rows="3"></textarea>
                            <asp:RequiredFieldValidator ID="reqName" runat="server" ControlToValidate="txtQuestionPaper"
                                ErrorMessage="Please Enter Question" ForeColor="Red" ValidationGroup="ValCan"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="label">
                            Section
                        </td>
                        <td>
                            :
                        </td>
                        <td>
                            <asp:DropDownList ID="drpSection" runat="server" ClientIDMode="Static">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr style="display: none;">
                        <td class="reqlabel">
                            Number of Question
                        </td>
                        <td>
                            :
                        </td>
                        <td>
                            <asp:TextBox ID="txtNoofQuestion" runat="server" class="yo-textinput"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="reqlabel">
                            Time Alloted
                        </td>
                        <td>
                            :
                        </td>
                        <td>
                            <asp:DropDownList ID="drpHours" runat="server" ClientIDMode="Static">
                                <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                <asp:ListItem Text="6" Value="6"></asp:ListItem>
                                <asp:ListItem Text="7" Value="7"></asp:ListItem>
                                <asp:ListItem Text="8" Value="8"></asp:ListItem>
                                <asp:ListItem Text="9" Value="9"></asp:ListItem>
                                <asp:ListItem Text="10" Value="10"></asp:ListItem>
                            </asp:DropDownList>
                            Hours
                            <asp:DropDownList ID="drpMinutes" runat="server" ClientIDMode="Static">
                                <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                <asp:ListItem Text="10" Value="10"></asp:ListItem>
                                <asp:ListItem Text="15" Value="15"></asp:ListItem>
                                <asp:ListItem Text="20" Value="20"></asp:ListItem>
                                <asp:ListItem Text="25" Value="25"></asp:ListItem>
                                <asp:ListItem Text="30" Value="30"></asp:ListItem>
                            </asp:DropDownList>
                            Minutes
                        </td>
                    </tr>
                    <tr>
                        <td class="reqlabel">
                            Mark for each Question
                        </td>
                        <td>
                            :
                        </td>
                        <td>
                            <asp:TextBox ID="txtMarkforeachQuestion" runat="server" class="yo-textinput number"
                                MaxLength="5"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtMarkforeachQuestion"
                                ErrorMessage="Please Enter Mark for each Question" ForeColor="Red" ValidationGroup="ValCan"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="reqlabel">
                            Negative Marking for each Question
                        </td>
                        <td>
                            :
                        </td>
                        <td>
                            <asp:TextBox ID="txtNegativeMarking" runat="server" class="yo-textinput number" MaxLength="5"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtNegativeMarking"
                                ErrorMessage="Please Enter Negative Marking" ForeColor="Red" ValidationGroup="ValCan"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="label">
                            Note
                        </td>
                        <td>
                            :
                        </td>
                        <td>
                            <textarea id="txtNote" runat="server" class="yo-textinput" cols="30" rows="3"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                        </td>
                        <td>
                            <asp:Button ID="btnSave" runat="server" Text="Save" class="yo-button red" OnClick="btnSave_Click"
                                ValidationGroup="ValCan" />
                            <asp:Button ID="btnCancel" runat="server" Text="Cancel" class="yo-button red" OnClick="btnCancel_Click" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</asp:Content>
