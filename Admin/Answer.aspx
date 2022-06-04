<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true"
    CodeFile="Answer.aspx.cs" Inherits="Admin_Answer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
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
                <div class="yo-panel-toolbar top clearfix" id="actiontabs" runat="server">
                    <ul>
                        <li><a href="AddAnswer.aspx" runat="server" clientidmode="Static" class="yo-ic-16 ic-add"
                            id="chngact">Add Answer</a></li>
                        <li>
                            <asp:LinkButton ID="lnkDelete" runat="server" ToolTip="Delete" Text="Delete" OnClientClick="return DeleteAnswer();"
                                class="yo-ic-16 ic-cross" OnClick="lnkDelete_Click"></asp:LinkButton>
                        </li>
                        <li><a href='Question.aspx?SectionId=<%=Request.QueryString["SectionId"] %>' clientidmode="Static"
                            class="yo-ic-16 ic-arrow-redo" id="A1">Back To Question</a></li>
                    </ul>
                </div>
                <table width="100%">
                    <tr>
                        <td colspan="2">
                            <hr />
                        </td>
                    </tr>
                    <tr valign="top">
                        <td style="width: 2%;">
                            <b>Q</b>
                        </td>
                        <td>
                            :
                            <asp:Label ID="lblQuestion" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
                <table id="Answertbl" class="yo-table" width="100%">
                    <thead>
                        <tr>
                            <th style="width: 2%;">
                                <input type="checkbox" id="maincheckbox" runat="server" clientidmode="Static" />
                            </th>
                            <th style="width: 2%;">
                                Sequence
                            </th>
                            <th>
                                Answer
                            </th>
                            <th style="width: 5%;">
                                IsDefaultAnswer
                            </th>
                            <th style="width: 5%;">
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="lstAnswer" runat="server">
                            <ItemTemplate>
                                <tr valign="top">
                                    <td>
                                        <input type="checkbox" id="listcheckbox" runat="server" clientidmode="Static" />
                                        <td>
                                            <%#Eval("Sequence")%>
                                        </td>
                                    </td>
                                    <td>
                                        <input type="hidden" id="hdnAnswerId" value='<%#Eval("AnswerId") %>' />
                                        <%#Eval("AnswerText") %>
                                    </td>
                                    <td>
                                        <%#Eval("IsCorrectAnswer")%>
                                    </td>
                                    <td>
                                        <a href='AddAnswer.aspx?AnswerId=<%#Eval("AnswerId") %>&QuestionId=<%=Request.QueryString["QuestionId"] %>&SectionId=<%=Request.QueryString["SectionId"] %>'>
                                            Edit</a>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
                <asp:HiddenField ID="hdnSelAnswerIds" runat="server" ClientIDMode="Static" />
            </div>
        </div>
    </div>
    <script type="text/javascript">
        function DeleteAnswer() {

            var canlist = '';
            $('#Answertbl').find('tbody tr').find(':checkbox').each(function () {
                if ($(this).prop('checked')) {
                    AnswerId = $(this).closest('tr').find('#hdnAnswerId').val();
                    canlist = canlist + AnswerId + ',';
                }

            });

            if (canlist != "") {
                if (confirm('Do you want to Delete Answers ?')) {
                    $('#hdnSelAnswerIds').val(canlist);
                }
                else {
                    $('#hdnSelAnswerIds').val('');
                    return false;
                }
            } else {
                $('#hdnSelAnswerIds').val('');
                alert('Please select atleast one Answer');
                return false;
            }


        }

        $(document).ready(function () {

            $('#maincheckbox').on('change', function () {

                if ($(this).prop('checked')) {
                    $('#Answertbl tbody').find(':checkbox').attr('checked', 'checked');
                } else {
                    $('#Answertbl tbody').find(':checkbox').removeAttr('checked');
                }
            });

        });
    </script>
</asp:Content>
