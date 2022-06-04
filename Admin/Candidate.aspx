<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true"
    CodeFile="Candidate.aspx.cs" Inherits="Admin_Candidate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="width: 100%">
        <div id="main-title">
            <h1>
                Candidate Information</h1>
        </div>
        <div class="yo-panel">
            <div class="yo-panel-header">
                <span class="yo-i-24 i-table-1">Candidate&nbsp;Management</span>
            </div>
            <div class="yo-panel-body">
                <div class="yo-panel-toolbar top clearfix" id="actiontabs" runat="server">
                    <ul>
                        <li><a href="#" runat="server" clientidmode="Static" class="yo-ic-16 ic-add" id="chngact"
                            onclick="return ActInActCan();">Activate Candidate</a></li>
                        <li>
                            <asp:LinkButton ID="lnkDelete" runat="server" ToolTip="Delete" Text="Delete" OnClientClick="return DeleteCandidate();"
                                class="yo-ic-16 ic-cross" OnClick="lnkDelete_Click"></asp:LinkButton>
                        </li>
                    </ul>
                </div>
                <div class="yo-panel-toolbar top clearfix" style="display: none;" id="DivActCan">
                    <table width="100%">
                        <tr>
                            <td style="width: 20%"> 
                                <asp:RadioButton ID="rdoActive" runat="server" GroupName="rdooCan" Checked="true" ClientIDMode="Static" />
                                <label>
                                    Active</label>
                                <asp:RadioButton ID="rdoInAcitve" runat="server" GroupName="rdooCan" ClientIDMode="Static" />
                                <label>
                                    InActive</label>
                            </td>
                            <td>
                                <asp:Button ID="btnActCandidate" runat="server" Text="Save" class="yo-button red"
                                    OnClick="btnActCandidate_Click" ValidationGroup="ValCan" OnClientClick="return ActCandidate();" />
                            </td>
                        </tr>
                    </table>
                </div>
                <asp:ListView ID="lstCandidate" runat="server">
                    <LayoutTemplate>
                        <table id="candidatetbl" class="yo-table" width="100%">
                            <thead>
                                <tr>
                                    <th>
                                        <input type="checkbox" id="maincheckbox" runat="server" clientidmode="Static" />
                                    </th>
                                    <th>
                                        Name
                                    </th>
                                    <th>
                                        UserName
                                    </th>
                                    <th>
                                        Mobile
                                    </th>
                                    <th>
                                        EmailId
                                    </th>
                                    <th>
                                        Last Activty Date
                                    </th>
                                    <th>
                                        Address
                                    </th>
                                    <th>
                                        Active
                                    </th>
                                    <th>
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr id="itemPlaceHolder" runat="server">
                                </tr>
                            </tbody>
                        </table>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <tr valign="top">
                            <td>
                                <input type="checkbox" id="listcheckbox" runat="server" clientidmode="Static" />
                            </td>
                            <td>
                                <input type="hidden" id="hdnCandidateId" value='<%#Eval("CandidateId") %>' />
                                <%#Eval("Name") %>
                            </td>
                            <td>
                                <%#Eval("UserName")%>
                            </td>
                            <td>
                                <%#Eval("Mobile") %>
                            </td>
                            <td>
                                <%#Eval("EmailId")%>
                            </td>
                            <td>
                                <%#Eval("LastActivityDate")%>
                            </td>
                            <td>
                                <%#Eval("Adress")%>
                            </td>
                            <td>
                                <%#Eval("isActive")%>
                            </td>
                            <td>
                            <a href='SolvedQuestionPaper.aspx?CandidateId=<%#Eval("CandidateId") %>'>View Solved Question Paper</a>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:ListView>
                <asp:HiddenField ID="hdnSelCandidateIds" runat="server" ClientIDMode="Static" />
            </div>
        </div>
    </div>
    <script type="text/javascript">
        function ActInActCan() {
            //DivActCan
            $('#DivActCan').toggle();

            return false;
        }

        function ActCandidate() {
            // rdoActive rdoInAcitve
            var canlist = '';
            $('#candidatetbl').find('tbody tr').find(':checkbox').each(function () {
                if ($(this).prop('checked')) {
                    candidateId = $(this).closest('tr').find('#hdnCandidateId').val();
                    canlist = canlist + candidateId + ',';
                }

            });

            if (canlist != "") {
                var ActDeact = 'InActive';
                if ($('#rdoActive').prop('checked'))
                    ActDeact = "Active";

                if (confirm('Do you want to ' + ActDeact + ' Candidates ?')) {
                    $('#hdnSelCandidateIds').val(canlist);
                }
                else {
                    $('#hdnSelCandidateIds').val('');
                    return false;
                }
            } else {
                $('#hdnSelCandidateIds').val('');
                alert('Please select atleast one candidate');
                return false;
            }

        }

        function DeleteCandidate() {

            var canlist = '';
            $('#candidatetbl').find('tbody tr').find(':checkbox').each(function () {
                if ($(this).prop('checked')) {
                    candidateId = $(this).closest('tr').find('#hdnCandidateId').val();
                    canlist = canlist + candidateId + ',';
                }

            });

            if (canlist != "") {
                if (confirm('Do you want to Delete Candidates ?')) {
                    $('#hdnSelCandidateIds').val(canlist);
                }
                else {
                    $('#hdnSelCandidateIds').val('');
                    return false;
                }
            } else {
                $('#hdnSelCandidateIds').val('');
                alert('Please select atleast one candidate');
                return false;
            }


        }

        $(document).ready(function () {
           

            $('#maincheckbox').on('change', function () {

                if ($(this).prop('checked')) {
                    $('#candidatetbl tbody').find(':checkbox').attr('checked', 'checked');
                } else {
                    $('#candidatetbl tbody').find(':checkbox').removeAttr('checked');
                }
            });

        });
    </script>
</asp:Content>
