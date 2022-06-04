using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class AdminMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AdminId"] == null)
        {
            Response.Redirect("../Admin/AdminLogin.aspx");
        }
        else
        {
            BindAdmin();
        }
    }

    protected void BindAdmin()
    {

        ExamDLL.Candidate objcan = new ExamDLL.Candidate();
        objcan.CandidateId = Convert.ToInt32(Session["AdminId"]);
        DataTable dt = new DataTable();
        dt = objcan.GetCandiate(ExamDLL.Candidate.CandidateFlag.SingleAdminRecord);
        if (dt.Rows.Count > 0)
        {
            lblLoginName.Text = Convert.ToString(dt.Rows[0]["Name"]);
        }
    }
    

    protected void lnkLogout_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("../Admin/AdminLogin.aspx");
    }
}
