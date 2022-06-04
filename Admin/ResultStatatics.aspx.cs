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

public partial class Admin_ResultStatatics : System.Web.UI.Page
{
    Int32 QuestionPaperId = 0 , ResultId = 0;
    DataSet ds;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Convert.ToString(Request.QueryString["QuestionPaperId"]) != null)
            {
                QuestionPaperId = Convert.ToInt32(Request.QueryString["QuestionPaperId"]);
                ResultId = Convert.ToInt32(Request.QueryString["ResultId"]);
                BindQuestion(QuestionPaperId, ResultId);
            }
        }

    }

    private void BindQuestion(Int32 QuestionPaperId, Int32 ResultId)
    {
        ExamDLL.Result can = new ExamDLL.Result();
        can.QuestionPaperId = QuestionPaperId;
        can.ResultId = ResultId;
        ds = new DataSet();
        ds = can.GetResultQuestion(Result.ResultFlag.ResultStatastics);
        if (ds.Tables.Count > 0)
        {
            if (ds.Tables[0].Rows.Count > 0)
            {
                lblQuestionpaper.Text = Convert.ToString(ds.Tables[0].Rows[0]["QuestionPaperText"]);
                lblNoofAnsQuestion.Text = Convert.ToString(ds.Tables[0].Rows[0]["NoofAnswerQuestion"]);
                lblNoOfQuestion.Text = Convert.ToString(ds.Tables[0].Rows[0]["NoofQuestion"]);
                lblNoOfUnAnsQuestion.Text = Convert.ToString(ds.Tables[0].Rows[0]["NoofUnAnswerQuestion"]);
                lblTestMark.Text = Convert.ToString(ds.Tables[0].Rows[0]["TestResult"]);
                lblTotalMark.Text = Convert.ToString(ds.Tables[0].Rows[0]["TotalMark"]);

                double reqtime = Convert.ToDouble(ds.Tables[0].Rows[0]["RequiredTime"]);
                Int32 time = (Int32)(reqtime * 60);
                string strtime = "Time Required : " + (time / 3600 >= 10 ? (time / 3600).ToString() : "0" + (time / 3600).ToString()) + " : " + (time / 60 >= 10 ? (time / 60).ToString() : "0" + (time / 60).ToString()) + " : " + (time % 60 >= 10 ? (time % 60).ToString() : "0" + (time % 60).ToString());

                arTimer.InnerHtml = strtime;


            }

            if (ds.Tables[1].Rows.Count > 0)
            {
                lstQuestion.DataSource = ds.Tables[1];
                lstQuestion.DataBind();
            }
        }

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


}