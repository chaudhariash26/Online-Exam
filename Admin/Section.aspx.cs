using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Data;
using ExamDLL;

public partial class Admin_Section : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BindSection();
    }

    private void BindSection()
    {
        ExamDLL.Section can = new ExamDLL.Section();

        DataTable dt = new DataTable();
        dt = can.GetSection(Section.SectionFlag.SelectAll);

        lstSection.DataSource = dt;
        lstSection.DataBind();
    }


    protected void lnkDelete_Click(object sender, EventArgs e)
    {
        ExamDLL.Section can = new Section();

        can.SectionText = hdnSelSectionIds.Value;
        can.AddEditDel_Section(Section.SectionFlag.Delete);
        BindSection();
    }
}