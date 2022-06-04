using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data;
public partial class Admin_AddAnswer : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Convert.ToString(Request.QueryString["AnswerId"]) != null)
            {
                hdnAnswerId.Value = Convert.ToString(Request.QueryString["AnswerId"]);
                BindAnswer();
            }
        }
    }


    protected void BindAnswer()
    {
        ExamDLL.Answer objcan = new ExamDLL.Answer();
        objcan.AnswerId = Convert.ToInt32(hdnAnswerId.Value);
        DataTable dt = new DataTable();
        dt = objcan.GetAnswer(ExamDLL.Answer.AnswerFlag.SingleRecord);
        if (dt.Rows.Count > 0)
        {
            txtAnswer.Value = Convert.ToString(dt.Rows[0]["AnswerText"]).Replace("<br />", "\n");
            txtSequence.Text = Convert.ToString(dt.Rows[0]["Sequence"]);
            rdoYes.Checked = true;
            if (Convert.ToString(dt.Rows[0]["IsCorrectAnswer"]) == "N")
                rdoNo.Checked = false;
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        ExamDLL.Answer objcan = new ExamDLL.Answer();

        objcan.AnswerText = txtAnswer.Value.Replace("\n", "<br />");
        objcan.QuestionId = Convert.ToInt32(Request.QueryString["QuestionId"]);
        objcan.Sequence = Convert.ToInt32(txtSequence.Text);
        objcan.IsCorrectAnswer = rdoYes.Checked ? "Y" : "N";
        if (hdnAnswerId.Value != "")
        {
            objcan.AnswerId = Convert.ToInt32(hdnAnswerId.Value);
            objcan.AddEditDel_Answer(ExamDLL.Answer.AnswerFlag.Edit);
        }
        else
        {
            objcan.AnswerId = 0;
            objcan.AddEditDel_Answer(ExamDLL.Answer.AnswerFlag.Add);
        }
        Response.Redirect("Answer.aspx?QuestionId=" + Request.QueryString["QuestionId"] + "&SectionId=" + Request.QueryString["SectionId"]);
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Answer.aspx?QuestionId=" + Request.QueryString["QuestionId"] + "&SectionId=" + Request.QueryString["SectionId"]);
    }
}