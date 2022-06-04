<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.master" AutoEventWireup="true"
    CodeFile="QuestionPaper.aspx.cs" Inherits="Candidate_QuestionPaper" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="width: 100%">
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
                <table id="QuestionPapertbl" class="yo-table" width="100%">
                    <tbody>
                        <asp:Repeater ID="lstQuestionPaper" runat="server">
                            <ItemTemplate>
                                <tr valign="top">
                                    <td>
                                        <input type="hidden" id="hdnQuestionPaperId" value='<%#Eval("QuestionPaperId") %>' />
                                        <a href='QuestionPaperDetails.aspx?QuestionPaperId=<%#Eval("QuestionPaperId") %>'>
                                            <%#Eval("QuestionPaperText")%></a> (<%#Eval("SectionText")%>)
                                        <br />
                                        <div style="width: 100%">
                                            Number of Question :
                                            <%#Eval("NoofQuestion")%>
                                            | Time Alloted :
                                            <%#Eval("TestTime")%>
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
