<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.master" AutoEventWireup="true"
    CodeFile="TestQuestion.aspx.cs" Inherits="Candidate_TestQuestion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="SM1" runat="server">
    </asp:ScriptManager>
    <asp:Timer ID="AnsTimer" runat="server" Interval="1000" OnTick="AnsTimer_Click">
    </asp:Timer>
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
                <asp:HiddenField ID="hdnMarkforEachQuestion" runat="server" />
                <asp:HiddenField ID="hdnNegativeMarking" runat="server" />
                <asp:HiddenField ID="hdnTimeAlloted" runat="server" />
                <div class="yo-panel-toolbar top clearfix" id="actiontabs" runat="server">
                    <asp:UpdatePanel ID="updPnl" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:HiddenField ID="hdnTimer" runat="server" />
                            <ul>
                                <li><a href="#" class="yo-ic-16 ic-clock" id="arTimer" runat="server"></a></li>
                                <li><a href="#" class="yo-ic-16 ic-bookmark-folder" id="hrfMoveFinal" onclick="return MoveFinal();">
                                    Move Temporary to Final</a> </li>
                                <li>
                                    <asp:LinkButton ID="lnkSubmit" runat="server" OnClick="lnkSubmit_Click" Text="Submit Test"
                                        class="yo-ic-16 ic-disk"></asp:LinkButton>
                                </li>
                                <li><a href="QuestionPaper.aspx" class="yo-ic-16 ic-arrow-redo">Back To Question Paper</a></li>
                            </ul>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="AnsTimer" EventName="tick" />
                            <asp:PostBackTrigger ControlID="lnkSubmit" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
                <table id="Questiontbl" class="yo-table" width="100%">
                    <thead>
                        <tr>
                            <th style="width: 6%">
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
                                        [
                                        <%# Container.ItemIndex + 1 %>
                                        ]
                                    </td>
                                    <td>
                                        <asp:HiddenField ID="hdnQuestionId" runat="server" ClientIDMode="Static" Value='<%#Eval("QuestionId") %>' />
                                        <asp:HiddenField ID="hdnQuestionAnswer" runat="server" ClientIDMode="Static" />
                                        <asp:HiddenField ID="hdnCorrectAnswerId" runat="server" ClientIDMode="Static" Value='<%#Eval("CorrectAnswerId") %>' />
                                        <asp:HiddenField ID="hdnIsDraft" runat="server" ClientIDMode="Static" />
                                        <label id="lblQuestionText">
                                            <%#Eval("QuestionText") %></label>
                                        <br />
                                        <div style="width: 100%">
                                            Answer :-
                                            <br />
                                            <asp:DataList ID="dtAnswer" Width="100%" runat="server" RepeatDirection="Horizontal"
                                                RepeatColumns="2" ItemStyle-VerticalAlign="Top">
                                                <ItemTemplate>
                                                    <table width="100%">
                                                        <tr valign="top">
                                                            <td style="width: 10px;">
                                                                <asp:HiddenField ID="hdnAnswerId" runat="server" ClientIDMode="Static" Value='<%#Eval("AnswerId") %>' />
                                                                <asp:HiddenField ID="hdnIsCorrectAnswer" runat="server" ClientIDMode="Static" Value='<%#Eval("IsCorrectAnswer") %>' />
                                                                <input type="radio" id="rdoAnswer" name='rdo_<%#Eval("QuestionId") %>' />
                                                            </td>
                                                            <td style="width: 20px; border: 0;">
                                                                <%#Eval("Sequence")%>)
                                                            </td>
                                                            <td style="border: none;">
                                                                <%#Eval("AnswerText")%>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ItemTemplate>
                                            </asp:DataList>
                                            <div>
                                                <asp:Button ID="btnSaveDraft" ClientIDMode="Static" runat="server" Text="Save as Temporary"
                                                    class="yo-button small red" ValidationGroup="ValCan" OnClientClick="return SubmitAnswer(this,'D')" />
                                                <asp:Button ID="btnSubmitAswer" ClientIDMode="Static" runat="server" Text="Submit Answer"
                                                    OnClientClick="return SubmitAnswer(this,'F')" class="yo-button small red" />
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        function SubmitAnswer(obj, SubmitType) {
            $tr = $(obj).closest('tr');
            var ansid = 0;
            $tr.find(':radio').each(function () {
                if ($(this).prop('checked')) {
                    ansid = $(this).closest('tr').find('#hdnAnswerId').val();
                }
            });

            if (ansid == 0) {
                alert('Please select option');
                return false;
            }
            //hdnAnswerId hdnQuestionAnswer
            $tr.find('#hdnIsDraft').val(SubmitType);
            $tr.find('#hdnQuestionAnswer').val(ansid);

            if (SubmitType == "F") {
                $tr.find('#btnSaveDraft').addClass('disabled').attr('disabled', 'disabled');
                $tr.find('#btnSubmitAswer').addClass('disabled').attr('disabled', 'disabled');
                $tr.find(':radio').attr('disabled', 'disabled');
                $tr.find('#lblTemp').remove();
            } else {
                if ($tr.find('#lblTemp').length == 0) {
                    $('<label id="lblTemp" style="color:Green;">(Temporary)</label>').insertAfter($tr.find('#lblQuestionText'));
                }

            }

            return false;
        }

        function MoveFinal() {
            $('#Questiontbl tbody').find('tr').each(function () {
                if ($(this).find('#hdnIsDraft').val() == 'D') {
                    $tr = $(this);
                    $tr.find('#hdnIsDraft').val('F');
                    $tr.find('#btnSaveDraft').addClass('disabled').attr('disabled', 'disabled');
                    $tr.find('#btnSubmitAswer').addClass('disabled').attr('disabled', 'disabled');
                    $tr.find(':radio').attr('disabled', 'disabled');
                    $tr.find('#lblTemp').remove();
                }
            });
        }

    </script>
</asp:Content>
