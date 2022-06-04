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

public partial class Admin_QuestionPaper : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindSection();
            BindQuestionPaper();
        }
       
    }

    private void BindQuestionPaper()
    {
        ExamDLL.QuestionPaper can = new ExamDLL.QuestionPaper();
        can.SectionId = Convert.ToInt32(drpSection.SelectedItem.Value);
        DataTable ds = new DataTable();
        ds = can.GetQuestionPaper(QuestionPaper.QuestionPaperFlag.SelectAll);

        lstQuestionPaper.DataSource = ds;
        lstQuestionPaper.DataBind();
          

    }


    protected void BindSection()
    {
        ExamDLL.Section can = new ExamDLL.Section();
        DataTable dt = can.GetSection(ExamDLL.Section.SectionFlag.SelectAll);
        drpSection.DataSource = dt;
        drpSection.DataTextField = "SectionText";
        drpSection.DataValueField = "SectionId";
        drpSection.DataBind();
        drpSection.Items.Insert(0, "Select");
        drpSection.Items[0].Text = "Select";
        drpSection.Items[0].Value = "0";
    }


    protected void drpSection_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindQuestionPaper();
    }

    protected void lnkDelete_Click(object sender, EventArgs e)
    {
        ExamDLL.QuestionPaper can = new QuestionPaper();

        can.QuestionPaperText = hdnSelQuestionPaperIds.Value;
        can.AddEditDel_QuestionPaper(QuestionPaper.QuestionPaperFlag.Delete);
        BindQuestionPaper();
    }
}