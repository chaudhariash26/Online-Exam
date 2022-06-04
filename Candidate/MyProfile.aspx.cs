using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data;
public partial class Candidate_MyProfile : System.Web.UI.Page
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
    {
        ExamDLL.Candidate objcan = new ExamDLL.Candidate();
        objcan.CandidateId = Convert.ToInt32(hdncandidateId.Value);
        DataTable dt = new DataTable();
        dt = objcan.GetCandiate(ExamDLL.Candidate.CandidateFlag.SingleRecord);
        if (dt.Rows.Count > 0)
        {
            lblAddress.Text = Convert.ToString(dt.Rows[0]["Adress"]);
            lblAge.Text = Convert.ToString(dt.Rows[0]["Age"]);
            lblBirthDate.Text = Convert.ToString(dt.Rows[0]["BirthDate"]);
            lblCanName.Text = Convert.ToString(dt.Rows[0]["Name"]);
            lblCompany.Text = Convert.ToString(dt.Rows[0]["Company"]);
            lblEmail.Text = Convert.ToString(dt.Rows[0]["EmailId"]);
            lblExperience.Text = Convert.ToString(dt.Rows[0]["Experience"]);
            lblMobile.Text = Convert.ToString(dt.Rows[0]["Mobile"]);
            lblProfile.Text = Convert.ToString(dt.Rows[0]["Profile"]);
            lblSkillSet.Text = Convert.ToString(dt.Rows[0]["SkillSet"]);
            lblUserName.Text = Convert.ToString(dt.Rows[0]["UserName"]);
            lblGender.Text = "Male";
            lblIsActive.Text = "Active";
            if (Convert.ToString(dt.Rows[0]["Gender"]) == "F")
            {
                lblGender.Text = "Female";
            }

            if (Convert.ToString(dt.Rows[0]["isActive"]) == "N")
            {
                lblIsActive.Text = "InActive";
            }
            lblMaritialStatus.Text= Convert.ToString(dt.Rows[0]["MaritialStatus"]);
            
        }
    }

   
}