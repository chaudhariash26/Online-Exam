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

public partial class Candidate_QuestionPaperDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Convert.ToString(Request.QueryString["QuestionPaperId"]) != null)
            {
                Int32 QuestionPaperId = Convert.ToInt32(Request.QueryString["QuestionPaperId"]);
                BindQuestionPaper(QuestionPaperId);
            }
        }

    }

    private void BindQuestionPaper(Int32 QuestionPaperId)
    {
        ExamDLL.QuestionPaper can = new ExamDLL.QuestionPaper();
        can.QuestionPaperId = QuestionPaperId;
        DataTable ds = new DataTable();
        ds = can.GetQuestionPaper(QuestionPaper.QuestionPaperFlag.SingleRecord);

        lstQuestionPaper.DataSource = ds;
        lstQuestionPaper.DataBind();


    }

}