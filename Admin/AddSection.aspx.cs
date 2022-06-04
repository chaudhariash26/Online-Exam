using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data;
public partial class Admin_AddSection : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Convert.ToString(Request.QueryString["SectionId"]) != null)
            {
                hdnSectionId.Value = Convert.ToString(Request.QueryString["SectionId"]);
                BindSection();
            }
        }
    }

    protected void BindSection()
    {
        ExamDLL.Section objcan = new ExamDLL.Section();
        objcan.SectionId = Convert.ToInt32(hdnSectionId.Value);
        DataTable dt = new DataTable();
        dt = objcan.GetSection(ExamDLL.Section.SectionFlag.SingleRecord);
        if (dt.Rows.Count > 0)
        {

            txtSection.Text = Convert.ToString(dt.Rows[0]["SectionText"]);
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        ExamDLL.Section objcan = new ExamDLL.Section();

        objcan.SectionText = txtSection.Text;

        if (hdnSectionId.Value != "")
        {
            objcan.SectionId = Convert.ToInt32(hdnSectionId.Value);
            objcan.AddEditDel_Section(ExamDLL.Section.SectionFlag.Edit);
        }
        else
        {
            objcan.SectionId = 0;
            objcan.AddEditDel_Section(ExamDLL.Section.SectionFlag.Add);
        }
        Response.Redirect("Section.aspx");
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Section.aspx");
    }
}