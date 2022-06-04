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

public partial class Admin_Answer : System.Web.UI.Page
{
    Int32 QuestionId = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Convert.ToString(Request.QueryString["QuestionId"]) != null)
            {
               QuestionId = Convert.ToInt32(Request.QueryString["QuestionId"]);
               chngact.HRef = "AddAnswer.aspx?QuestionId=" + QuestionId + "&SectionId=" + Request.QueryString["SectionId"];
               BindAnswer(QuestionId);
               BindQuestion(QuestionId);
            }
        }
       
    }

    protected void BindQuestion(Int32 QuestionId)
    {
        ExamDLL.Question objcan = new ExamDLL.Question();
        objcan.QuestionId = QuestionId;
        DataTable dt = new DataTable();
        dt = objcan.GetQuestion(ExamDLL.Question.QuestionFlag.SingleRecord);
        if (dt.Rows.Count > 0)
        {
            lblQuestion.Text = Convert.ToString(dt.Rows[0]["QuestionText"]);
        }
    }

    private void BindAnswer(Int32 QuestionId)
    {
        ExamDLL.Answer can = new ExamDLL.Answer();
        can.QuestionId = QuestionId;
        DataTable dt = new DataTable();
        dt = can.GetAnswer(Answer.AnswerFlag.SelectAll);

        lstAnswer.DataSource = dt;
        lstAnswer.DataBind();
    }


    protected void lnkDelete_Click(object sender, EventArgs e)
    {
        ExamDLL.Answer can = new Answer();

        can.AnswerText = hdnSelAnswerIds.Value;
        can.AddEditDel_Answer(Answer.AnswerFlag.Delete);
        BindAnswer(QuestionId);
    }
}