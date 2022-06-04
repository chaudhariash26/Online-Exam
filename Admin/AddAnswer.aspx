<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true"
    CodeFile="AddAnswer.aspx.cs" Inherits="Admin_AddAnswer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:HiddenField ID="hdnAnswerId" runat="server" />
    <div style="width: 100%">
        <div id="main-title">
            <h1>
                Answer Management</h1>
        </div>
        <div class="yo-panel">
            <div class="yo-panel-header">
                <span class="yo-i-24 i-table-1">Answer&nbsp;Management</span>
            </div>
            <div class="yo-panel-body">
                <table class="yo-form" width="100%">
                    <tr>
                        <td class="reqlabel">
                            Answer
                        </td>
                        <td>
                            :
                        </td>
                        <td>
                          <textarea id="txtAnswer" runat="server" class="yo-textinput" cols="30" rows="3"></textarea>
                            <asp:RequiredFieldValidator ID="reqName" runat="server" ControlToValidate="txtAnswer"
                                ErrorMessage="Please Enter Answer" ForeColor="Red" ValidationGroup="ValCan"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="reqlabel">
                            Sequence
                        </td>
                        <td>
                            :
                        </td>
                        <td>
                            <asp:TextBox ID="txtSequence" runat="server" class="yo-textinput"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtSequence"
                                ErrorMessage="Please Enter Sequence" ForeColor="Red" ValidationGroup="ValCan"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="reqlabel">
                            IsDefaultAnswer
                        </td>
                        <td>
                            :
                        </td>
                        <td>
                            <input type="radio" group="rdo" name="rdo" id="rdoYes" runat="server" checked="true" />
                            Yes
                            <input type="radio" group="rdo" name="rdo" id="rdoNo" runat="server" />
                            No
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
