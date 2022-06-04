<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true"
    CodeFile="TestQuestion.aspx.cs" Inherits="Admin_TestQuestion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="width: 100%">
        <div id="main-title">
            <h1>
                Question Management</h1>
        </div>
        <div class="yo-panel">
            <div class="yo-panel-header">
                <span class="yo-i-24 i-table-1">
                    <asp:Label ID="lblQuestionpaper" runat="server"></asp:Label></span>
            </div>
            <div class="yo-panel-body">
                <div class="yo-panel-toolbar top clearfix" id="actiontabs" runat="server">
                    <ul>
                        <li><a href="AttachQuestion.aspx" runat="server" clientidmode="Static" class="yo-ic-16 ic-add"
                            id="chngact">Attach More Question</a></li>
                        <li>
                            <asp:LinkButton ID="lnkDelete" runat="server" ToolTip="Delete" Text="Deatch Question"
                                OnClientClick="return DeleteQuestion();" class="yo-ic-16 ic-cross" OnClick="lnkDelete_Click"></asp:LinkButton>
                        </li>
                        <li><a href="QuestionPaper.aspx" runat="server" clientidmode="Static" class="yo-ic-16 ic-arrow-redo"
                            id="A1">Back To Question Paper</a></li>
                    </ul>
                </div>
                <table id="Questiontbl" class="yo-table" width="100%">
                    <thead>
                        <tr>
                            <th style="width: 2%;">
                                <input type="checkbox" id="maincheckbox" runat="server" clientidmode="Static" />
                            </th>
                            <th>
                                Question
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="lstQuestion" runat="server" OnItemDataBound="lstQuestion_ItemDataBound">
                            <ItemTemplate>
                                <tr valign="top">
                                    <td>
                                        <input type="checkbox" id="listcheckbox" runat="server" clientidmode="Static" />
                                    </td>
                                    <td>
                                        <asp:HiddenField ID="hdnQuestionId" runat="server" ClientIDMode="Static" Value='<%#Eval("QuestionId") %>' />
                                        <%#Eval("QuestionText") %>
                                        <br />
                                        <div style="width: 100%">
                                            Answer :-
                                            <br />
                                            <asp:DataList ID="dtAnswer" Width="100%" runat="server" RepeatDirection="Horizontal"
                                                RepeatColumns="2" ItemStyle-VerticalAlign="Top">
                                                <ItemTemplate>
                                                    <table width="100%">
                                                        <tr valign="top">
                                                            <td style="width: 20px;">
                                                                <%#Eval("Sequence")%>)
                                                            </td>
                                                            <td style="border: none;">
                                                                <%#Eval("AnswerText")%>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ItemTemplate>
                                            </asp:DataList>
                                        </div>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
                <asp:HiddenField ID="hdnSelQuestionIds" runat="server" ClientIDMode="Static" />
            </div>
        </div>
    </div>
    <script type="text/javascript">
        function DeleteQuestion() {

            var canlist = '';
            $('#Questiontbl').find('tbody tr').find(':checkbox').each(function () {
                if ($(this).prop('checked')) {
                    QuestionId = $(this).closest('tr').find('#hdnQuestionId').val();
                    canlist = canlist + QuestionId + ',';
                }

            });

            if (canlist != "") {
                if (confirm('Do you want to Detach Questions ?')) {
                    $('#hdnSelQuestionIds').val(canlist);
                }
                else {
                    $('#hdnSelQuestionIds').val('');
                    return false;
                }
            } else {
                $('#hdnSelQuestionIds').val('');
                alert('Please select atleast one Question');
                return false;
            }


        }

        $(document).ready(function () {



            $('#maincheckbox').on('change', function () {

                if ($(this).prop('checked')) {
                    $('#Questiontbl tbody').find(':checkbox').attr('checked', 'checked');
                } else {
                    $('#Questiontbl tbody').find(':checkbox').removeAttr('checked');
                }
            });

        });
    </script>
</asp:Content>
