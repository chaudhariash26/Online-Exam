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

public partial class Admin_Question : System.Web.UI.Page
{
    Int32 SectionId = 0;
    DataSet ds;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Convert.ToString(Request.QueryString["SectionId"]) != null)
            {
               SectionId = Convert.ToInt32(Request.QueryString["SectionId"]);
               chngact.HRef = "AddQuestion.aspx?SectionId=" + SectionId;
               BindQuestion(SectionId);
               BindSection(SectionId);
            }
        }
       
    }


    protected void BindSection(Int32 SectionId)
    {
        ExamDLL.Section objcan = new ExamDLL.Section();
        objcan.SectionId = SectionId;
        DataTable dt = new DataTable();
        dt = objcan.GetSection(ExamDLL.Section.SectionFlag.SingleRecord);
        if (dt.Rows.Count > 0)
        {

            lblSection.Text = Convert.ToString(dt.Rows[0]["SectionText"]);
        }
    }


    private void BindQuestion(Int32 SectionId)
    {
        ExamDLL.Question can = new ExamDLL.Question();
        can.SectionId = SectionId;
        ds = new DataSet();
        ds = can.GetQuestionAnswer(Question.QuestionFlag.SelectAll);

        lstQuestion.DataSource = ds.Tables[0];
        lstQuestion.DataBind();
        ds.Relations.Add("AnswerRelation", ds.Tables[0].Columns["QuestionId"], ds.Tables[1].Columns["QuestionId"]);
          

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
                DataView dv1 = ds.Tables[1].DefaultView;
                dv1.RowFilter = filterExp;
                DataTable dtNew = dv1.ToTable();

                dtAnswer.DataSource = dtNew;
                dtAnswer.DataBind();
            }
        }
    }


    protected void lnkDelete_Click(object sender, EventArgs e)
    {
        ExamDLL.Question can = new Question();

        can.QuestionText = hdnSelQuestionIds.Value;
        can.AddEditDel_Question(Question.QuestionFlag.Delete);
        BindQuestion(SectionId);
    }
}