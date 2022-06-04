<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true"
    CodeFile="SolvedQuestionPaper.aspx.cs" Inherits="Admin_SolvedQuestionPaper" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="width: 100%">
        <div class="yo-panel">
            <div class="yo-panel-header">
                <span class="yo-i-24 i-table-1">Solved&nbsp;Question&nbsp;Paper</span>
            </div>
            <div class="yo-panel-body">
                <table id="QuestionPapertbl" class="yo-table" width="100%">
                    <thead>
                        <tr>
                            <th>
                                QuestionPaper
                            </th>
                            <th style="width: 10%;">
                                Date
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="lstQuestionPaper" runat="server">
                            <ItemTemplate>
                                <tr valign="top">
                                    <td>
                                        <input type="hidden" id="hdnQuestionPaperId" value='<%#Eval("QuestionPaperId") %>' />
                                        <a href='ResultStatatics.aspx?QuestionPaperId=<%#Eval("QuestionPaperId") %>&ResultId=<%#Eval("ResultId") %>'>
                                            <%#Eval("QuestionPaperText")%></a> (<%#Eval("SectionText")%>)
                                        <br />
                                        <div style="width: 100%">
                                            <fieldset>
                                                <table width="100%">
                                                    <tbody>
                                                        <tr>
                                                            <td style="width: 25%;">
                                                                Marks
                                                            </td>
                                                            <td style="width: 2%; border: 0;">
                                                                :
                                                            </td>
                                                            <td style="width: 23%; border: 0;">
                                                                <%#Eval("TestResult")%>
                                                                /
                                                                <%#Eval("TotalMark")%>
                                                            </td>
                                                            <td style="width: 25%; border: 0;">
                                                                Total number of questions
                                                            </td>
                                                            <td style="width: 2%; border: 0;">
                                                                :
                                                            </td>
                                                            <td style="width: 23%; border: 0;">
                                                                <%#Eval("NoofQuestion")%>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                Number of answered questions
                                                            </td>
                                                            <td style="border: 0;">
                                                                :
                                                            </td>
                                                            <td style="border: 0;">
                                                                <%#Eval("NoofAnswerQuestion")%>
                                                            </td>
                                                            <td style="border: 0;">
                                                                Number of unanswered questions
                                                            </td>
                                                            <td style="border: 0;">
                                                                :
                                                            </td>
                                                            <td style="border: 0;">
                                                                <%#Eval("NoofUnAnswerQuestion")%>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </fieldset>
                                        </div>
                                    </td>
                                    <td>
                                        <%#Eval("AddedDate")%>
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
