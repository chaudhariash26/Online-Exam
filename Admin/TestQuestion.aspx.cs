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

public partial class Admin_TestQuestion : System.Web.UI.Page
{
    Int32 QuestionPaperId = 0;
    DataSet ds;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Convert.ToString(Request.QueryString["QuestionPaperId"]) != null)
            {
                QuestionPaperId = Convert.ToInt32(Request.QueryString["QuestionPaperId"]);
                chngact.HRef = "AttachQuestion.aspx?QuestionPaperId=" + QuestionPaperId;
                BindQuestion(QuestionPaperId);
            }
        }

    }

    private void BindQuestion(Int32 QuestionPaperId)
    {
        ExamDLL.QuestionPaper can = new ExamDLL.QuestionPaper();
        can.QuestionPaperId = QuestionPaperId;
        ds = new DataSet();
        ds = can.GetQuestionPaperFullSet(QuestionPaper.QuestionPaperFlag.QuestionPaperFullSet);

        if (ds.Tables[0].Rows.Count > 0)
        {
            lblQuestionpaper.Text = Convert.ToString(ds.Tables[0].Rows[0]["QuestionPaperText"]);
        }

        if (ds.Tables[1].Rows.Count > 0)
        {
            lstQuestion.DataSource = ds.Tables[1];
            lstQuestion.DataBind();
        }
        // ds.Relations.Add("AnswerRelation", ds.Tables[1].Columns["QuestionId"], ds.Tables[2].Columns["QuestionId"]);


    }

    protected void lstQuestion_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {

            DataList dtAnswer = (DataList)e.Item.FindControl("dtAnswer");
            HiddenField hdnQuestionId = (HiddenField)e.Item.FindControl("hdnQuestionId");
            if (hdnQuestionId != null)
            {
                string filterExp = string.Format("QuestionId='{0}'", hdnQuestionId.Value);
                DataView dv1 = ds.Tables[2].DefaultView;
                dv1.RowFilter = filterExp;
                DataTable dtNew = dv1.ToTable();

                dtAnswer.DataSource = dtNew;
                dtAnswer.DataBind();
            }
        }
    }


    protected void lnkDelete_Click(object sender, EventArgs e)
    {
        QuestionPaperId = Convert.ToInt32(Request.QueryString["QuestionPaperId"]);
        
        ExamDLL.QuestionPaper can = new ExamDLL.QuestionPaper();
        can.QuestionPaperId = QuestionPaperId;
        can.QuestionPaperText = hdnSelQuestionIds.Value;
        can.AddEditDel_QuestionPaper(QuestionPaper.QuestionPaperFlag.DetachQuestion);
        BindQuestion(QuestionPaperId);
    }
}