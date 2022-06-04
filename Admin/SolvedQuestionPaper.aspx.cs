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

public partial class Admin_SolvedQuestionPaper : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Convert.ToString(Request.QueryString["CandidateId"]) != null)
            {
                Int32 CandidateId = Convert.ToInt32(Request.QueryString["CandidateId"]);
                BindQuestionPaper(CandidateId);
            }
        }

    }

    private void BindQuestionPaper(Int32 CandidateId)
    {
        ExamDLL.QuestionPaper can = new ExamDLL.QuestionPaper();
        can.QuestionPaperId = CandidateId;
        DataTable ds = new DataTable();
        ds = can.GetQuestionPaper(QuestionPaper.QuestionPaperFlag.SelectAllSolvedQuestionPaper);

        lstQuestionPaper.DataSource = ds;
        lstQuestionPaper.DataBind();


    }

}