<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Candidate_Login" %>

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
            <div style="height: 100px;">
            </div>
            <div class="midContainer3">
                <div class="cleaner">
                </div>
            </div>
            <div class="yo-panel">
                <table class="yo-form" width="30%" align="center">
                    <tr>
                        <td width="100%" id="trmaincontaint" valign="middle">
                            <div id="wrappertop">
                            </div>
                            <div id="wrappermiddle">
                                <table width="100%" cellpadding="5" cellspacing="5" style="padding-left: 30px;">
                                    <tr>
                                        <td class="header">
                                            Login
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txtLogin" runat="server" class="yo-login-username yo-textinput"
                                                placeholder="UserName"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" class="yo-login-password yo-textinput"
                                                placeholder="Passoword"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Button ID="btnLogin" runat="server" Width="280px" Text="Login" OnClick="btnLogin_Click"
                                                class="yo-button green yo-login-button" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right; padding-right: 50px;">
                                            <a href="Register.aspx">Not a Member Yet?</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <span id="lblErrorMsg" runat="server" style="display: none; color: Red;"></span>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div id="wrapperbottom">
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
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
