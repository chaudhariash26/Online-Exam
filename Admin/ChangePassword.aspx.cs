using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data;
public partial class Admin_ChangePassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Int32 AdminId = 0;
            if (Session["AdminId"] != null)
            {
                AdminId = Convert.ToInt32(Session["AdminId"]);
                hdnAdminId.Value = AdminId.ToString();
                BindCandidate();
            }
        }
    }

    protected void BindCandidate()
    {
        ExamDLL.Candidate objcan = new ExamDLL.Candidate();
        objcan.CandidateId = Convert.ToInt32(hdnAdminId.Value);
        DataTable dt = new DataTable();
        dt = objcan.GetCandiate(ExamDLL.Candidate.CandidateFlag.SingleAdminRecord);
        if (dt.Rows.Count > 0)
        {
            hdnoldPassword.Value = Convert.ToString(dt.Rows[0]["Password"]);
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        ExamDLL.Candidate objcan = new ExamDLL.Candidate();

        objcan.Password = txtPassword.Text;
        if (hdnAdminId.Value != "")
        {
            objcan.CandidateId = Convert.ToInt32(hdnAdminId.Value);
            if (hdnoldPassword.Value == txtOldPassword.Text)
            {
                objcan.AddEditDel_Candidate(ExamDLL.Candidate.CandidateFlag.ChangeAdminPassword);
                Response.Redirect("Section.aspx");
            }
            else
            {
                lblErrorMsg.Text = "Please enter correct Old Password";
            }
        }


    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Section.aspx");
    }
}