<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true"
    CodeFile="Section.aspx.cs" Inherits="Admin_Section" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="width: 100%">
        <div id="main-title">
            <h1>
                Section Management</h1>
        </div>
        <div class="yo-panel">
            <div class="yo-panel-header">
                <span class="yo-i-24 i-table-1">Section&nbsp;Management</span>
            </div>
            <div class="yo-panel-body">
                <div class="yo-panel-toolbar top clearfix" id="actiontabs" runat="server">
                    <ul>
                        <li><a href="AddSection.aspx" runat="server" clientidmode="Static" class="yo-ic-16 ic-add"
                            id="chngact">Add Section</a></li>
                        <li>
                            <asp:LinkButton ID="lnkDelete" runat="server" ToolTip="Delete" Text="Delete" OnClientClick="return DeleteSection();"
                                class="yo-ic-16 ic-cross" OnClick="lnkDelete_Click"></asp:LinkButton>
                        </li>
                    </ul>
                </div>
                <asp:ListView ID="lstSection" runat="server">
                    <LayoutTemplate>
                        <table id="Sectiontbl" class="yo-table" width="100%">
                            <thead>
                                <tr>
                                    <th style="width: 2%;">
                                        <input type="checkbox" id="maincheckbox" runat="server" clientidmode="Static" />
                                    </th>
                                    <th>
                                        Section
                                    </th>
                                    <th style="width: 10%;">
                                    </th>
                                    <th style="width: 3%;">
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
                                <input type="hidden" id="hdnSectionId" value='<%#Eval("SectionId") %>' />
                                <%#Eval("SectionText") %>
                            </td>
                            <td>
                                <a href='Question.aspx?SectionId=<%#Eval("SectionId") %>'>View Question</a>
                            </td>
                            <td>
                                <a href='AddSection.aspx?SectionId=<%#Eval("SectionId") %>'>Edit</a>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:ListView>
                <asp:HiddenField ID="hdnSelSectionIds" runat="server" ClientIDMode="Static" />
            </div>
        </div>
    </div>
    <script type="text/javascript">
        function DeleteSection() {

            var canlist = '';
            $('#Sectiontbl').find('tbody tr').find(':checkbox').each(function () {
                if ($(this).prop('checked')) {
                    SectionId = $(this).closest('tr').find('#hdnSectionId').val();
                    canlist = canlist + SectionId + ',';
                }

            });

            if (canlist != "") {
                if (confirm('Do you want to Delete Sections ?')) {
                    $('#hdnSelSectionIds').val(canlist);
                }
                else {
                    $('#hdnSelSectionIds').val('');
                    return false;
                }
            } else {
                $('#hdnSelSectionIds').val('');
                alert('Please select atleast one Section');
                return false;
            }


        }

        $(document).ready(function () {


            $('#maincheckbox').on('change', function () {

                if ($(this).prop('checked')) {
                    $('#Sectiontbl tbody').find(':checkbox').attr('checked', 'checked');
                } else {
                    $('#Sectiontbl tbody').find(':checkbox').removeAttr('checked');
                }
            });

        });
    </script>
</asp:Content>
