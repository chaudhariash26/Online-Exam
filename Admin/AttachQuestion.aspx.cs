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

public partial class Admin_AttachQuestion : System.Web.UI.Page
{
    Int32 QuestionPaperId = 0;
    DataSet ds;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindSection();
            if (Convert.ToString(Request.QueryString["QuestionPaperId"]) != null)
            {
                QuestionPaperId = Convert.ToInt32(Request.QueryString["QuestionPaperId"]);
                BindQuestion(QuestionPaperId);
            }
        }

    }

    protected void BindSection()
    {
        ExamDLL.Section can = new ExamDLL.Section();

        DataTable dt = new DataTable();
        dt = can.GetSection(Section.SectionFlag.SelectAll);
        drpSection.DataSource = dt;
        drpSection.DataTextField = "SectionText";
        drpSection.DataValueField = "SectionId";
        drpSection.DataBind();
    }

    private void BindQuestion(Int32 QuestionPaperId)
    {
        ExamDLL.QuestionPaper can = new ExamDLL.QuestionPaper();
        can.QuestionPaperId = QuestionPaperId;
        can.SectionId = Convert.ToInt32(drpSection.SelectedItem.Value);
        ds = new DataSet();
        ds = can.GetQuestionPaperFullSet(QuestionPaper.QuestionPaperFlag.GetUnAttachedQuestionSectionWise);

        if (ds.Tables[0].Rows.Count > 0)
        {
            lblQuestionpaper.Text = Convert.ToString(ds.Tables[0].Rows[0]["QuestionPaperText"]);
            string SectionId = Convert.ToString(ds.Tables[0].Rows[0]["SectionId"]);
            if (SectionId != "0")
            {
                tblSection.Style.Add("display","none");
            }
        }

        lstQuestion.DataSource = ds.Tables[1];
        lstQuestion.DataBind();
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

    protected void drpSection_SelectedIndexChanged(object sender, EventArgs e)
    {
        QuestionPaperId = Convert.ToInt32(Request.QueryString["QuestionPaperId"]);
        BindQuestion(QuestionPaperId);
    }

    protected void btnAttach_Click(object sender, EventArgs e)
    {
        QuestionPaperId = Convert.ToInt32(Request.QueryString["QuestionPaperId"]);

        ExamDLL.QuestionPaper can = new ExamDLL.QuestionPaper();
        can.QuestionPaperId = QuestionPaperId;
        can.QuestionPaperText = hdnSelQuestionIds.Value;
        can.AddEditDel_QuestionPaper(QuestionPaper.QuestionPaperFlag.AttachQuestion);
        BindQuestion(QuestionPaperId);
    }
}