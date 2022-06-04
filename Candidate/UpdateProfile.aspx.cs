using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data;
public partial class Candidate_UpdateProfile : System.Web.UI.Page
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
        rdoMale.Checked = true;
        ExamDLL.Candidate objcan = new ExamDLL.Candidate();
        objcan.CandidateId = Convert.ToInt32(hdncandidateId.Value);
        DataTable dt = new DataTable();
        dt = objcan.GetCandiate(ExamDLL.Candidate.CandidateFlag.SingleRecord);
        if (dt.Rows.Count > 0)
        {
            txtAddress.Value = Convert.ToString(dt.Rows[0]["Adress"]).Replace("<br />","\n");
            txtAge.Text = Convert.ToString(dt.Rows[0]["Age"]);
            txtBirthDate.Text = Convert.ToString(dt.Rows[0]["BirthDate"]);
            txtCanName.Text = Convert.ToString(dt.Rows[0]["Name"]);
            txtCompany.Text = Convert.ToString(dt.Rows[0]["Company"]);
       //     txtConfirmPassword.Text = Convert.ToString(dt.Rows[0]["Password"]);
            txtEmail.Text = Convert.ToString(dt.Rows[0]["EmailId"]);
            txtExperience.Text = Convert.ToString(dt.Rows[0]["Experience"]);
            txtMobile.Text = Convert.ToString(dt.Rows[0]["Mobile"]);
         //   txtPassword.Text = Convert.ToString(dt.Rows[0]["Password"]);
            txtProfile.Value = Convert.ToString(dt.Rows[0]["Profile"]).Replace("<br />", "\n");
            txtSkillSet.Value = Convert.ToString(dt.Rows[0]["SkillSet"]).Replace("<br />", "\n");
            txtUserName.Text = Convert.ToString(dt.Rows[0]["UserName"]);
            if (Convert.ToString(dt.Rows[0]["Gender"]) == "F")
            {
                rdoFemale.Checked = true;
            }

            drpMritialStatus.Items.FindByText(Convert.ToString(dt.Rows[0]["MaritialStatus"])).Selected = true;
        }
    }

    protected void btnSave_Click(object sender , EventArgs e)
    {
        ExamDLL.Candidate objcan = new ExamDLL.Candidate();
      
        objcan.Address = txtAddress.Value.Replace("\n", "<br />");
        objcan.Age = Convert.ToInt32(txtAge.Text == "" ? "0": txtAge.Text);
        objcan.BirthDate =txtBirthDate.Text;
        objcan.Company = txtCompany.Text;
        objcan.EmailId = txtEmail.Text;
        objcan.Experience = Convert.ToDouble(txtExperience.Text == "" ? "0" : txtExperience.Text);
        objcan.Gender = rdoMale.Checked ? "M" : "F";
       // objcan.isActive = rdoActive.Checked ? "Y" : "N";
        objcan.MaritialStatus = drpMritialStatus.SelectedItem.Text;
        objcan.Mobile = txtMobile.Text;
        objcan.Name = txtCanName.Text;
        //objcan.Password = txtPassword.Text;
        objcan.Profile = txtProfile.Value.Replace("\n", "<br />");
        objcan.SkillSet = txtSkillSet.Value.Replace("\n", "<br />");
        objcan.UserName = txtUserName.Text;
        if (hdncandidateId.Value != "")
        {
            objcan.CandidateId = Convert.ToInt32(hdncandidateId.Value);
            objcan.AddEditDel_Candidate(ExamDLL.Candidate.CandidateFlag.Edit);
        }
       
        Response.Redirect("MyProfile.aspx");
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("MyProfile.aspx");
    }
}