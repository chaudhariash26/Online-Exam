<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.master" AutoEventWireup="true"
    CodeFile="QuestionPaperDetails.aspx.cs" Inherits="Candidate_QuestionPaperDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="width: 100%">
        <asp:Repeater ID="lstQuestionPaper" runat="server">
            <ItemTemplate>
                <div class="yo-panel">
                    <div class="yo-panel-header">
                        <span class="yo-i-24 i-table-1">
                            <%#Eval("QuestionPaperText")%></span>
                    </div>
                    <div class="yo-panel-body">
                        <table id="QuestionPapertbl" class="yo-table" width="100%">
                            <tbody>
                                <tr valign="top">
                                    <td style="width: 60%">
                                        <b>Instrutions:</b>
                                        <input type="hidden" id="hdnQuestionPaperId" value='<%#Eval("QuestionPaperId") %>' />
                                        <br />
                                        <ul>
                                            <li style="height: 20px;">Number of Question :
                                                <%#Eval("NoofQuestion")%>
                                            </li>
                                            <li style="height: 20px;">Time Alloted :
                                                <%#Eval("TestTime")%>
                                            </li>
                                            <li style="height: 20px;">Each question carry
                                                <%#Eval("MarkforEachQuestion")%>
                                                mark,
                                                <%#Eval("NegativeStr")%>. </li>
                                        </ul>
                                        <a href='TestQuestion.aspx?QuestionPaperId=<%#Eval("QuestionPaperId") %>'>Start Test</a>
                                    </td>
                                    <td>
                                        <b>Notes:</b>
                                        <br />
                                        <%#Eval("Note")%>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
