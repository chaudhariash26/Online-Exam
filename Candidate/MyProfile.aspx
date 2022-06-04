<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.master" AutoEventWireup="true"
    CodeFile="MyProfile.aspx.cs" Inherits="Candidate_MyProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:HiddenField ID="hdncandidateId" runat="server" />
    <div style="width: 100%">
        <div id="main-title">
            <h1>
                My Profile</h1>
        </div>
        <div class="yo-panel">
            <div class="yo-panel-header">
                <span class="yo-i-24 i-table-1">My Profile</span>
            </div>
            <div class="yo-panel-body">
                <table width="100%" cellpadding="3" cellspacing="3">
                    <tr>
                        <td colspan="3" align="right">
                            <a href="UpdateProfile.aspx" id="A1">Update Profile</a>
                        </td>
                    </tr>
                </table>
                <table class="yo-form" width="50%">
                    <tr>
                        <td class="reqlabel">
                            Name
                        </td>
                        <td>
                            :
                        </td>
                        <td>
                            <asp:Label ID="lblCanName" runat="server"></asp:Label>
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
                            <asp:Label ID="lblUserName" runat="server"></asp:Label>
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
                            <asp:Label ID="lblEmail" runat="server"></asp:Label>
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
                            <asp:Label ID="lblMobile" runat="server"></asp:Label>
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
                            <asp:Label ID="lblAge" runat="server"></asp:Label>
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
                            <asp:Label ID="lblGender" runat="server"></asp:Label>
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
                            <asp:Label ID="lblAddress" runat="server"></asp:Label>
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
                            <asp:Label ID="lblBirthDate" runat="server" ClientIDMode="Static"></asp:Label>
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
                            <asp:Label ID="lblCompany" runat="server"></asp:Label>
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
                            <asp:Label ID="lblExperience" runat="server"></asp:Label>
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
                            <asp:Label ID="lblMaritialStatus" runat="server"></asp:Label>
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
                            <asp:Label ID="lblSkillSet" runat="server"></asp:Label>
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
                            <asp:Label ID="lblProfile" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr id="trAct" runat="server">
                        <td class="label">
                            isActive
                        </td>
                        <td>
                            :
                        </td>
                        <td>
                            <asp:Label ID="lblIsActive" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</asp:Content>
