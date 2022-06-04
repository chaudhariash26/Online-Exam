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

public partial class Admin_Candidate : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BindCandidate();
    }

    private void BindCandidate()
    {
        ExamDLL.Candidate can = new Candidate();

        DataTable dt = new DataTable();
        dt = can.GetCandiate(Candidate.CandidateFlag.SelectAll);

        lstCandidate.DataSource = dt;
        lstCandidate.DataBind();
    }


    protected void lnkDelete_Click(object sender, EventArgs e)
    {
        ExamDLL.Candidate can = new Candidate();

        can.Name = hdnSelCandidateIds.Value;
        can.AddEditDel_Candidate(Candidate.CandidateFlag.Delete);
        BindCandidate();
    }

    protected void btnActCandidate_Click(object sennder, EventArgs e)
    {
        ExamDLL.Candidate can = new Candidate();
        can.isActive = rdoActive.Checked ? "Y" : "N";
        can.Name = hdnSelCandidateIds.Value;
        can.AddEditDel_Candidate(Candidate.CandidateFlag.UpdateStatus);
        BindCandidate();
    }
}