<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.master" AutoEventWireup="true"
    CodeFile="ResultStatatics.aspx.cs" Inherits="Candidate_ResultStatatics" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="width: 100%">
        <div id="main-title">
            <h1>
                Result Statatics</h1>
        </div>
        <div class="yo-panel">
            <div class="yo-panel-header">
                <span class="yo-i-24 i-table-1">
                    <asp:Label ID="lblQuestionpaper" runat="server"></asp:Label></span>
            </div>
            <div class="yo-panel-body">
                <div class="yo-panel-toolbar top clearfix" id="actiontabs" runat="server">
                    <ul>
                        <li><a href="#" class="yo-ic-16 ic-clock" id="arTimer" runat="server"></a></li>
                        <li><a href="QuestionPaper.aspx" class="yo-ic-16 ic-arrow-redo">Back To Question Paper</a></li>
                    </ul>
                </div>
                <table class="yo-table" width="100%">
                    <thead>
                        <tr>
                            <th colspan="3">
                                Result
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td style="width: 30%;">
                                Marks
                            </td>
                            <td style="width: 2%;">
                                :
                            </td>
                            <td>
                                <asp:Label ID="lblTestMark" runat="server"></asp:Label>
                                /
                                <asp:Label ID="lblTotalMark" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Total number of questions
                            </td>
                            <td>
                                :
                            </td>
                            <td>
                                <asp:Label ID="lblNoOfQuestion" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Number of answered questions
                            </td>
                            <td>
                                :
                            </td>
                            <td>
                                <asp:Label ID="lblNoofAnsQuestion" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Number of unanswered questions
                            </td>
                            <td>
                                :
                            </td>
                            <td>
                                <asp:Label ID="lblNoOfUnAnsQuestion" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </tbody>
                </table>
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
                                        <%#Eval("QuestionText") %>
                                        <br />
                                        <div style="width: 100%">
                                            <asp:DataList ID="dtAnswer" Width="100%" runat="server" RepeatDirection="Horizontal"
                                                RepeatColumns="2" ItemStyle-VerticalAlign="Top">
                                                <ItemTemplate>
                                                    <table width="100%">
                                                        <tr valign="top">
                                                            <td style="width: 10px;">
                                                                <input type="radio" id="rdoAnswer" name='rdo_<%#Eval("QuestionId") %>' />
                                                            </td>
                                                            <td style="width: 20px; border: 0;">
                                                                <%#Eval("Sequence")%>)
                                                            </td>
                                                            <td style="border: none; width: 150px;">
                                                                <%#Eval("AnswerText")%>
                                                            </td>
                                                            <td style="border: none; width: 20px;">
                                                                <img src='<%#Eval("CorrectAAnswerFlag")%>' />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ItemTemplate>
                                            </asp:DataList>
                                            <div>
                                                Answer : <b>
                                                    <%#Eval("CorrectAnswerText")%></b>
                                            </div>
                                            <hr />
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
</asp:Content>
