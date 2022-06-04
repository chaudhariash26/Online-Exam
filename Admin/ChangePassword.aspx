<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true"
    CodeFile="ChangePassword.aspx.cs" Inherits="Admin_ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:HiddenField ID="hdnAdminId" runat="server" />
    <div style="width: 100%">
        <div id="main-title">
            <h1>
                Edit Profile</h1>
        </div>
        <div class="yo-panel">
            <div class="yo-panel-header">
                <span class="yo-i-24 i-table-1">Edit Profile</span>
            </div>
            <div class="yo-panel-body">
                <table class="yo-form" width="100%">
                    <tr>
                        <td colspan="3">
                        <asp:Label ID="lblErrorMsg" runat="server" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="reqlabel">
                            Old Password
                        </td>
                        <td>
                            :
                        </td>
                        <td>
                            <asp:HiddenField ID="hdnoldPassword" runat="server" />
                            <asp:TextBox ID="txtOldPassword" TextMode="Password" runat="server" class="yo-textinput"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtOldPassword"
                                ErrorMessage="Please Enter Password" ForeColor="Red" ValidationGroup="ValCan"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="reqlabel">
                            New Password
                        </td>
                        <td>
                            :
                        </td>
                        <td>
                            <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" class="yo-textinput"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="reqpassword" runat="server" ControlToValidate="txtPassword"
                                ErrorMessage="Please Enter Password" ForeColor="Red" ValidationGroup="ValCan"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="reqlabel">
                            Confirm Password
                        </td>
                        <td>
                            :
                        </td>
                        <td>
                            <asp:TextBox ID="txtConfirmPassword" TextMode="Password" runat="server" class="yo-textinput"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="reqconpassword" runat="server" ControlToValidate="txtConfirmPassword"
                                ErrorMessage="Please Enter Password" ForeColor="Red" ValidationGroup="ValCan"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="reqcomp" runat="server" ControlToCompare="txtPassword"
                                ErrorMessage="Password not mathed" ForeColor="Red" ControlToValidate="txtConfirmPassword"
                                Operator="Equal" ValidationGroup="ValCan"></asp:CompareValidator>
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
