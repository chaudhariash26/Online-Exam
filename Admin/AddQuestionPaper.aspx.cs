using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data;
public partial class Admin_AddQuestionPaper : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindSection();
            if (Convert.ToString(Request.QueryString["QuestionPaperId"]) != null)
            {
                hdnQuestionPaperId.Value = Convert.ToString(Request.QueryString["QuestionPaperId"]);
                BindQuestionPaper();
            }
        }
    }

    protected void BindSection()
    {
        ExamDLL.Section can = new ExamDLL.Section();
        DataTable dt = can.GetSection(ExamDLL.Section.SectionFlag.SelectAll);
        drpSection.DataSource = dt;
        drpSection.DataTextField = "SectionText";
        drpSection.DataValueField = "SectionId";
        drpSection.DataBind();
        drpSection.Items.Insert(0,"Select");
        drpSection.Items[0].Text = "Select";
        drpSection.Items[0].Value = "0";
    }

    protected void BindQuestionPaper()
    {
        ExamDLL.QuestionPaper objcan = new ExamDLL.QuestionPaper();
        objcan.QuestionPaperId = Convert.ToInt32(hdnQuestionPaperId.Value);
        DataTable dt = new DataTable();
        dt = objcan.GetQuestionPaper(ExamDLL.QuestionPaper.QuestionPaperFlag.SingleRecord);
        if (dt.Rows.Count > 0)
        {
            txtQuestionPaper.Value = Convert.ToString(dt.Rows[0]["QuestionPaperText"]).Replace("<br />", "\n");
            txtNote.Value = Convert.ToString(dt.Rows[0]["Note"]).Replace("<br />", "\n");
            txtMarkforeachQuestion.Text = Convert.ToString(dt.Rows[0]["MarkforEachQuestion"]);
            txtNegativeMarking.Text = Convert.ToString(dt.Rows[0]["NegativeMarking"]);
          //  txtNoofQuestion.Text = Convert.ToString(dt.Rows[0]["NoofQuestion"]);

            double timealloted = Convert.ToDouble(dt.Rows[0]["TimeAlloted"]);
            drpSection.Items.FindByValue(Convert.ToString(dt.Rows[0]["SectionId"])).Selected = true;
            drpHours.Items.FindByValue(Convert.ToInt32(timealloted / 60).ToString()).Selected = true;
            drpMinutes.Items.FindByValue(Convert.ToInt32(timealloted % 60).ToString()).Selected = true;
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        int hour = Convert.ToInt32(drpHours.SelectedItem.Value);
        int min = Convert.ToInt32(drpMinutes.SelectedItem.Value);
        double timealloted = (hour * 60) + min;

        ExamDLL.QuestionPaper objcan = new ExamDLL.QuestionPaper();

        objcan.QuestionPaperText = txtQuestionPaper.Value.Replace("\n", "<br />");
    //    objcan.NoofQuestion = Convert.ToInt32(txtNoofQuestion.Text);
        objcan.Note = txtNote.Value.Replace("\n", "<br />");
        objcan.MarkforEachQuestion = Convert.ToDouble(txtMarkforeachQuestion.Text);
        objcan.NegativeMarking = Convert.ToDouble(txtNegativeMarking.Text);
        objcan.SectionId = Convert.ToInt32(drpSection.SelectedItem.Value);
        objcan.TimeAlloted = timealloted;

        if (hdnQuestionPaperId.Value != "")
        {
            objcan.QuestionPaperId = Convert.ToInt32(hdnQuestionPaperId.Value);
            objcan.AddEditDel_QuestionPaper(ExamDLL.QuestionPaper.QuestionPaperFlag.Edit);
        }
        else
        {
            objcan.QuestionPaperId = 0;
            objcan.AddEditDel_QuestionPaper(ExamDLL.QuestionPaper.QuestionPaperFlag.Add);
        }
        Response.Redirect("QuestionPaper.aspx");
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("QuestionPaper.aspx");
    }
}