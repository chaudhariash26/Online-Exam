<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Candidate_Register" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Online Exam</title>
    <link href="../Styles/Site.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/misc.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/panels.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/button.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/form.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/24x24.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/16x16.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/yo.theme.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/core.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/table.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/rightmenu.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="../Styles/jquery-ui.css">
    <script src="../Scripts/jquery-1.9.1.js"></script>
    <script src="../Scripts/jquery-ui.js"></script>
    <script src="../Scripts/Site.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="mainPageContainer">
        <div class="ContainerTopMaster" align="center">
            <table width="100%">
                <tr valign="top">
                    <td>
                        <span style="color: White; font-size: 24px; font-weight: bold; padding-left: 10px;">
                            Online Exam </span>
                    </td>
                </tr>
            </table>
        </div>
        <div class="cleaner">
        </div>
        <div class="midContainer">
            <div style="height: 10px;">
            </div>
            <div class="midContainer3">
                <div class="cleaner">
                </div>
            </div>
            <table width="80%" align="center">
                <tr>
                    <td>
                        <div>
                            <div id="main-title">
                                <h1>
                                    Registration</h1>
                            </div>
                            <div class="yo-panel">
                                <div class="yo-panel-header">
                                    <span class="yo-i-24 i-table-1">Registration Form</span>
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
                                                Password
                                            </td>
                                            <td>
                                                :
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtPassword" MaxLength="20" TextMode="Password" runat="server" class="yo-textinput"></asp:TextBox>
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
                                                <asp:TextBox ID="txtConfirmPassword" MaxLength="20" TextMode="Password" runat="server"
                                                    class="yo-textinput"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="reqconpassword" runat="server" ControlToValidate="txtConfirmPassword"
                                                    ErrorMessage="Please Enter Password" ForeColor="Red" ValidationGroup="ValCan"></asp:RequiredFieldValidator>
                                                <asp:CompareValidator ID="reqcomp" runat="server" ControlToCompare="txtPassword"
                                                    ErrorMessage="Password not mathed" ForeColor="Red" ControlToValidate="txtConfirmPassword"
                                                    Operator="Equal" ValidationGroup="ValCan"></asp:CompareValidator>
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
                                                <asp:TextBox ID="txtAge" MaxLength="2" runat="server" class="yo-textinput digit"></asp:TextBox>
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
                                                <asp:TextBox ID="txtBirthDate" MaxLength="30" runat="server" onkeydown="event.returnValue = false;"
                                                    onkeypress="event.returnValue = false;" ClientIDMode="Static" class="yo-textinput"></asp:TextBox>
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
                    </td>
                </tr>
            </table>
            <div class="cleaner">
            </div>
            <div style="height: 16px;">
            </div>
        </div>
        <div class="bottomContainer">
            <div class="bottomContainerLeft fleft">
            </div>
            <div class="bottomContainerRight fleft">
            </div>
        </div>
        <div style="font-size: 9px; padding: 0pt 20px 5px 0pt; display: none;" class="text01 fright">
            Powered by<strong> <a target="_blank" href="#">YoSwapna Ltd.</a></strong></div>
    </div>
    </form>
</body>
</html>
