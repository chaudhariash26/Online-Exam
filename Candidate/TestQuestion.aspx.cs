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

public partial class Candidate_TestQuestion : System.Web.UI.Page
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
            Int32 time = Convert.ToInt32(ds.Tables[0].Rows[0]["TimeAlloted"]);
            string strtime = "Time Left : " + (time / 60 >= 10 ? (time / 60).ToString() : "0" + (time / 60).ToString()) + " : " + (time % 60 >= 10 ? (time % 60).ToString() : "0" + (time % 60).ToString()) + " : 00";
            arTimer.InnerHtml = strtime;
            hdnTimer.Value = (time * 60).ToString();
            hdnMarkforEachQuestion.Value = Convert.ToString(ds.Tables[0].Rows[0]["MarkforEachQuestion"]);
            hdnNegativeMarking.Value = Convert.ToString(ds.Tables[0].Rows[0]["NegativeMarking"]);
            hdnTimeAlloted.Value = time.ToString();
        }

        if (ds.Tables[1].Rows.Count > 0)
        {
            lstQuestion.DataSource = ds.Tables[1];
            lstQuestion.DataBind();
        }

    }


    protected void AnsTimer_Click(object sender, EventArgs e)
    {
        try
        {
            if (hdnTimer.Value != "")
            {
                // Int32 timealloted = Convert.ToInt32(hdnTimeAlloted.Value);
                Int32 time = Convert.ToInt32(hdnTimer.Value);
                time = time - 1;
                if (time > 0)
                {
                    string strtime = "Time Left : " + (time / 3600 >= 10 ? (time / 3600).ToString() : "0" + (time / 3600).ToString()) + " : " + (time / 60 >= 10 ? (time / 60).ToString() : "0" + (time / 60).ToString()) + " : " + (time % 60 >= 10 ? (time % 60).ToString() : "0" + (time % 60).ToString());
                    arTimer.InnerHtml = strtime;
                    hdnTimer.Value = time.ToString();
                }
            }
        }
        catch (Exception ex)
        {

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

    protected void lnkSubmit_Click(object sender, EventArgs e)
    {
        AnsTimer.Enabled = false;
        ExamDLL.Result res = new Result();

        double MarkforEachQuestion = Convert.ToDouble(hdnMarkforEachQuestion.Value);
        double NegativeMarking = Convert.ToDouble(hdnNegativeMarking.Value);
        double totalMark = 0, TestResult = 0;
        double requiredtime = (Convert.ToDouble(hdnTimeAlloted.Value) * 60 - Convert.ToDouble(hdnTimer.Value)) / 60;
        int NoofAnsQuestion = 0;
        int NoofUnAnsQuestion = lstQuestion.Items.Count;
        QuestionPaperId = Convert.ToInt32(Request.QueryString["QuestionPaperId"]);
        string query = "";
        res.CandidateId = 0;
        res.RequiredTime = requiredtime;
        for (int i = 0; i < lstQuestion.Items.Count; i++)
        {
            HiddenField hdnQuestionId = (HiddenField)lstQuestion.Items[i].FindControl("hdnQuestionId");
            HiddenField hdnQuestionAnswer = (HiddenField)lstQuestion.Items[i].FindControl("hdnQuestionAnswer");
            HiddenField hdnIsDraft = (HiddenField)lstQuestion.Items[i].FindControl("hdnIsDraft");//hdnCorrAnswer
            HiddenField hdnCorrectAnswerId = (HiddenField)lstQuestion.Items[i].FindControl("hdnCorrectAnswerId");
            if (hdnQuestionId != null)
            {
                string questionid = hdnQuestionId.Value;
                string answerid = hdnQuestionAnswer.Value;
                string isdraft = hdnIsDraft.Value;
                string CorrectAnswerId = hdnCorrectAnswerId.Value;

                if (isdraft == "F")
                {
                    query += "~" + questionid + "^" + answerid;
                    if (answerid == CorrectAnswerId)
                    {
                        TestResult += MarkforEachQuestion;
                    }
                    else
                    {
                        TestResult -= NegativeMarking;

                    }
                    NoofAnsQuestion += 1;
                }

            }

        }

        totalMark = NoofUnAnsQuestion * MarkforEachQuestion;
        res.NoofAnswerQuestion = NoofAnsQuestion;
        res.NoofUnAnswerQuestion = NoofUnAnsQuestion - NoofAnsQuestion;
        res.QuestionPaperId = QuestionPaperId;
        res.TotalMark = totalMark;
        res.TestResult = TestResult;
        res.QuestionAnswer = query;
        DataTable dt = res.AddEditDel_Result(Result.ResultFlag.Add);
        if (dt.Rows.Count > 0)
        {
            Response.Redirect("ResultStatatics.aspx?QuestionPaperId=" + Convert.ToInt32(Request.QueryString["QuestionPaperId"]) + "&ResultId=" + Convert.ToString(dt.Rows[0][0]));
        }
    }


}