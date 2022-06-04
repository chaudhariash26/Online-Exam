using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data;
public partial class Candidate_ChangePassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Int32 CandidateId = 0;
            if (Session["CandidateId"] != null)
            {
                CandidateId = Convert.ToInt32(Session["CandidateId"]);
                hdncandidateId.Value = CandidateId.ToString();
                BindCandidate();
            }
        }
    }

    protected void BindCandidate()
    {   ExamDLL.Candidate objcan = new ExamDLL.Candidate();
        objcan.CandidateId = Convert.ToInt32(hdncandidateId.Value);
        DataTable dt = new DataTable();
        dt = objcan.GetCandiate(ExamDLL.Candidate.CandidateFlag.SingleRecord);
        if (dt.Rows.Count > 0)
        {
            hdnoldPassword.Value = Convert.ToString(dt.Rows[0]["Password"]);
        }
    }

    protected void btnSave_Click(object sender , EventArgs e)
    {
        ExamDLL.Candidate objcan = new ExamDLL.Candidate();
      
        objcan.Password = txtPassword.Text;
        if (hdncandidateId.Value != "")
        {
            objcan.CandidateId = Convert.ToInt32(hdncandidateId.Value);
            if (hdnoldPassword.Value == txtOldPassword.Text)
            {
                objcan.AddEditDel_Candidate(ExamDLL.Candidate.CandidateFlag.ChangePassord);
                Response.Redirect("QuestionPaper.aspx");
            }
            else
            {
                lblErrorMsg.Text = "Please enter correct Old Password";
            }
        }
       
        
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("QuestionPaper.aspx");
    }
}