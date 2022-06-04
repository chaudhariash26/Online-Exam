<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true"
    CodeFile="QuestionPaper.aspx.cs" Inherits="Admin_QuestionPaper" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="width: 100%">
        <div id="main-title">
            <h1>
                Question Paper</h1>
        </div>
        <table width="100%">
            <tr>
                <td style="width: 5%;">
                    Section
                </td>
                <td style="width: 1%;">
                    :
                </td>
                <td>
                    <asp:DropDownList ID="drpSection" runat="server" Width="200px" AutoPostBack="true"
                        OnSelectedIndexChanged="drpSection_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
            </tr>
        </table>
        <div class="yo-panel">
            <div class="yo-panel-header">
                <span class="yo-i-24 i-table-1">Question&nbsp;Paper</span>
            </div>
            <div class="yo-panel-body">
                <div class="yo-panel-toolbar top clearfix" id="actiontabs" runat="server">
                    <ul>
                        <li><a href="AddQuestionPaper.aspx" runat="server" clientidmode="Static" class="yo-ic-16 ic-add"
                            id="chngact">Add Question Paper</a></li>
                        <li>
                            <asp:LinkButton ID="lnkDelete" runat="server" ToolTip="Delete" Text="Delete" OnClientClick="return DeleteQuestionPaper();"
                                class="yo-ic-16 ic-cross" OnClick="lnkDelete_Click"></asp:LinkButton>
                        </li>
                    </ul>
                </div>
                <table id="QuestionPapertbl" class="yo-table" width="100%">
                    <thead>
                        <tr>
                            <th style="width: 2%;">
                                <input type="checkbox" id="maincheckbox" runat="server" clientidmode="Static" />
                            </th>
                            <th>
                                Question Paper
                            </th>
                            <th style="width: 5%;">
                            </th>
                            <th style="width: 5%;">
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="lstQuestionPaper" runat="server">
                            <ItemTemplate>
                                <tr valign="top">
                                    <td>
                                        <input type="checkbox" id="listcheckbox" runat="server" clientidmode="Static" />
                                    </td>
                                    <td>
                                        <input type="hidden" id="hdnQuestionPaperId" value='<%#Eval("QuestionPaperId") %>' />
                                        <%#Eval("QuestionPaperText")%>
                                        (<a href="#"><%#Eval("SectionText")%></a>)
                                        <br />
                                        <div style="width: 100%">
                                            Number of Question :
                                            <%#Eval("NoofQuestion")%>
                                            | Time :
                                            <%#Eval("TestTime")%>
                                        </div>
                                    </td>
                                    <td>
                                        <a href='TestQuestion.aspx?QuestionPaperId=<%#Eval("QuestionPaperId") %>'>View Question</a>
                                    </td>
                                    <td>
                                        <a href='AddQuestionPaper.aspx?QuestionPaperId=<%#Eval("QuestionPaperId") %>'>Edit</a>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
                <asp:HiddenField ID="hdnSelQuestionPaperIds" runat="server" ClientIDMode="Static" />
            </div>
        </div>
    </div>
    <script type="text/javascript">
        function DeleteQuestionPaper() {

            var canlist = '';
            $('#QuestionPapertbl').find('tbody tr').find(':checkbox').each(function () {
                if ($(this).prop('checked')) {
                    QuestionPaperId = $(this).closest('tr').find('#hdnQuestionPaperId').val();
                    canlist = canlist + QuestionPaperId + ',';
                }

            });

            if (canlist != "") {
                if (confirm('Do you want to Delete Question Paper ?')) {
                    $('#hdnSelQuestionPaperIds').val(canlist);
                }
                else {
                    $('#hdnSelQuestionPaperIds').val('');
                    return false;
                }
            } else {
                $('#hdnSelQuestionPaperIds').val('');
                alert('Please select atleast one Question Paper');
                return false;
            }


        }

        $(document).ready(function () {



            $('#maincheckbox').on('change', function () {

                if ($(this).prop('checked')) {
                    $('#QuestionPapertbl tbody').find(':checkbox').attr('checked', 'checked');
                } else {
                    $('#QuestionPapertbl tbody').find(':checkbox').removeAttr('checked');
                }
            });

        });
    </script>
</asp:Content>
