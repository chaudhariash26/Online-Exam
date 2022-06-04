using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data;
public partial class Admin_AddQuestion : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Convert.ToString(Request.QueryString["QuestionId"]) != null)
            {
                hdnQuestionId.Value = Convert.ToString(Request.QueryString["QuestionId"]);
                BindQuestion();
            }
        }
    }


    protected void BindQuestion()
    {
        ExamDLL.Question objcan = new ExamDLL.Question();
        objcan.QuestionId = Convert.ToInt32(hdnQuestionId.Value);
        DataTable dt = new DataTable();
        dt = objcan.GetQuestion(ExamDLL.Question.QuestionFlag.SingleRecord);
        if (dt.Rows.Count > 0)
        {
            txtQuestion.Value = Convert.ToString(dt.Rows[0]["QuestionText"]).Replace("<br />","\n");
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        ExamDLL.Question objcan = new ExamDLL.Question();

        objcan.QuestionText = txtQuestion.Value.Replace("\n","<br />");
        objcan.SectionId = Convert.ToInt32(Request.QueryString["SectionId"]);
        if (hdnQuestionId.Value != "")
        {
            objcan.QuestionId = Convert.ToInt32(hdnQuestionId.Value);
            objcan.AddEditDel_Question(ExamDLL.Question.QuestionFlag.Edit);
        }
        else
        {
            objcan.QuestionId = 0;
            objcan.AddEditDel_Question(ExamDLL.Question.QuestionFlag.Add);
        }
        Response.Redirect("Question.aspx?SectionId=" + Request.QueryString["SectionId"]);
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Question.aspx?SectionId=" + Request.QueryString["SectionId"]);
    }
}