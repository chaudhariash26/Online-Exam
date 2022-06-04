<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.master" AutoEventWireup="true"
    CodeFile="UpdateProfile.aspx.cs" Inherits="Candidate_UpdateProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:HiddenField ID="hdncandidateId" runat="server" />
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
                        <td class="reqlabel">
                            Name
                        </td>
                        <td>
                            :
                        </td>
                        <td>
                            <asp:TextBox ID="txtCanName" MaxLength="50" runat="server" class="yo-textinput"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="reqName" runat="server" ControlToValidate="txtCanName"
                                ErrorMessage="Please Enter Name" ForeColor="Red" ValidationGroup="ValCan"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="reqlabel">
                            UserName
                        </td>
                        <td>
                            :
                        </td>
                        <td>
                            <asp:TextBox ID="txtUserName" MaxLength="50" runat="server" class="yo-textinput"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUserName"
                                ErrorMessage="Please Enter UserName" ForeColor="Red" ValidationGroup="ValCan"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="reqlabel">
                            Email
                        </td>
                        <td>
                            :
                        </td>
                        <td>
                            <asp:TextBox ID="txtEmail" MaxLength="50" runat="server" class="yo-textinput Email"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtEmail"
                                ErrorMessage="Please Enter Email" ForeColor="Red" ValidationGroup="ValCan"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="label">
                            Mobile
                        </td>
                        <td>
                            :
                        </td>
                        <td>
                            <asp:TextBox ID="txtMobile" MaxLength="10" runat="server" class="yo-textinput digit"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="label">
                            Age
                        </td>
                        <td>
                            :
                        </td>
                        <td>
                            <asp:TextBox ID="txtAge" runat="server" MaxLength="2" class="yo-textinput digit"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="label">
                            Gender
                        </td>
                        <td>
                            :
                        </td>
                        <td>
                            <input type="radio" group="rdo" name="rdo" id="rdoMale" runat="server" checked="true" />
                            Male
                            <input type="radio" group="rdo" name="rdo" id="rdoFemale" runat="server" />
                            FeMale
                        </td>
                    </tr>
                    <tr>
                        <td class="label">
                            Address
                        </td>
                        <td>
                            :
                        </td>
                        <td>
                            <textarea id="txtAddress" runat="server" cols="20" rows="3"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td class="reqlabel">
                            Birth Date
                        </td>
                        <td>
                            :
                        </td>
                        <td>
                            <asp:TextBox ID="txtBirthDate" MaxLength="30" runat="server" ClientIDMode="Static"
                                class="yo-textinput" onkeydown="event.returnValue = false;" onkeypress="event.returnValue = false;"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtBirthDate"
                                ErrorMessage="Please Enter Birth Date" ForeColor="Red" ValidationGroup="ValCan"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="label">
                            Company
                        </td>
                        <td>
                            :
                        </td>
                        <td>
                            <asp:TextBox ID="txtCompany" MaxLength="50" runat="server" class="yo-textinput"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="label">
                            Experience
                        </td>
                        <td>
                            :
                        </td>
                        <td>
                            <asp:TextBox ID="txtExperience" MaxLength="5" runat="server" class="yo-textinput number"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="label">
                            Maritial Status
                        </td>
                        <td>
                            :
                        </td>
                        <td>
                            <asp:DropDownList ID="drpMritialStatus" runat="server">
                                <asp:ListItem Text="Single" Value="1"></asp:ListItem>
                                <asp:ListItem Text="Married" Value="2"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="label">
                            Skill Set
                        </td>
                        <td>
                            :
                        </td>
                        <td>
                            <textarea id="txtSkillSet" runat="server" cols="20" rows="3"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td class="label">
                            Profile
                        </td>
                        <td>
                            :
                        </td>
                        <td>
                            <textarea id="txtProfile" runat="server" cols="20" rows="3"></textarea>
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
    <script type="text/javascript">
        $(document).ready(function () {

            
            $("#txtBirthDate").datepicker({ showOtherMonths: true, showOn: "both",
                buttonImage: "../images/calendar_1.png",
                buttonImageOnly: true,
                maxDate: "-216M +0D",
                prevText: 'Previous',
                yearRange: 'c-70:c+70',
                onClose: function (dateText, inst) {
                    $(this).focus();
                },
                changeMonth: true,
                buttonText: '',
                changeYear: true
            }).attr('placeholder', 'dd-Mmm-yyyy');

        });
    </script>
</asp:Content>
