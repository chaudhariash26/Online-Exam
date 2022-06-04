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

public partial class Candidate_SolvedQuestionPaper : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindQuestionPaper();
        }

    }

    private void BindQuestionPaper()
    {
        ExamDLL.QuestionPaper can = new ExamDLL.QuestionPaper();
        can.QuestionPaperId = Convert.ToInt32(Session["CandidateId"]);
        DataTable ds = new DataTable();
        ds = can.GetQuestionPaper(QuestionPaper.QuestionPaperFlag.SelectAllSolvedQuestionPaper);

        lstQuestionPaper.DataSource = ds;
        lstQuestionPaper.DataBind();


    }

}