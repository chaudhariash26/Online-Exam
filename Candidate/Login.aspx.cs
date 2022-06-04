using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Candidate_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        if (txtLogin.Text.Trim() == "" && txtPassword.Text == "")
        {
            return;
        }
        ExamDLL.Candidate objcan = new ExamDLL.Candidate();
        objcan.UserName = txtLogin.Text.Trim();
        objcan.Password = txtPassword.Text;
        DataTable dt = new DataTable();
        dt = objcan.GetCandiate(ExamDLL.Candidate.CandidateFlag.CandidateLogin);
        if (dt.Rows.Count > 0)
        {
            Session["CandidateId"] = Convert.ToString(dt.Rows[0]["CandidateId"]);

            Response.Redirect("QuestionPaper.aspx");
        }
        else
        {
            lblErrorMsg.InnerHtml = "Invalid user name or password!!!";
            lblErrorMsg.Style.Add("display","block");
        }
        
    }
}