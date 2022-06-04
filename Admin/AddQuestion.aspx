<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true"
    CodeFile="AddQuestion.aspx.cs" Inherits="Admin_AddQuestion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:HiddenField ID="hdnQuestionId" runat="server" />
    <div style="width: 100%">
        <div id="main-title">
            <h1>
                Question Information</h1>
        </div>
        <div class="yo-panel">
            <div class="yo-panel-header">
                <span class="yo-i-24 i-table-1">Question&nbsp;Management</span>
            </div>
            <div class="yo-panel-body">
                <table class="yo-form" width="100%">
                    <tr>
                        <td class="reqlabel">
                            Question
                        </td>
                        <td>
                            :
                        </td>
                        <td>
                            <textarea id="txtQuestion" runat="server" class="yo-textinput" cols="30" rows="3"></textarea>
                            <asp:RequiredFieldValidator ID="reqName" runat="server" ControlToValidate="txtQuestion"
                                ErrorMessage="Please Enter Question" ForeColor="Red" ValidationGroup="ValCan"></asp:RequiredFieldValidator>
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
