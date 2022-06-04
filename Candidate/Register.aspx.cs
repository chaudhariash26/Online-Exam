using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Net.Mail;
using System.Text;
using System.Configuration;

public partial class Candidate_Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        ExamDLL.Candidate objcan = new ExamDLL.Candidate();

        objcan.Address = txtAddress.Value.Replace("\n", "<br />");
        objcan.Age = Convert.ToInt32(txtAge.Text == "" ? "0" : txtAge.Text);
        objcan.BirthDate = txtBirthDate.Text;
        objcan.Company = txtCompany.Text;
        objcan.EmailId = txtEmail.Text;
        objcan.Experience = Convert.ToDouble(txtExperience.Text == "" ? "0" : txtExperience.Text);
        objcan.Gender = rdoMale.Checked ? "M" : "F";
        objcan.isActive = "N";
        objcan.MaritialStatus = drpMritialStatus.SelectedItem.Text;
        objcan.Mobile = txtMobile.Text;
        objcan.Name = txtCanName.Text;
        objcan.Password = txtPassword.Text;
        objcan.Profile = txtProfile.Value.Replace("\n", "<br />");
        objcan.SkillSet = txtSkillSet.Value.Replace("\n", "<br />");
        objcan.UserName = txtUserName.Text;
        objcan.CandidateId = 0;
        objcan.AddEditDel_Candidate(ExamDLL.Candidate.CandidateFlag.Add);

        StringBuilder strBody = new StringBuilder();
        strBody.Append("<font face='verdana' size=2><p>Hi ");
        strBody.Append(txtCanName.Text);
        strBody.Append(",");
        strBody.Append("</p>");
        strBody.Append("<p>&nbsp;</p><p>Please click the link below to confirmation of your registration to our server. </p><p>");
        string recoveryLink = HttpContext.Current.Request.Url.AbsoluteUri.Remove(HttpContext.Current.Request.Url.AbsoluteUri.Length - HttpContext.Current.Request.Url.Segments.Last().Length);
        recoveryLink = recoveryLink + "/Login.aspx";
        strBody.Append(" <p><a href='" + recoveryLink + "' moz-do-not-send='true'>" + recoveryLink + "</a></p>");
        strBody.Append("<p>&nbsp;</p><p>Alternately, you can copy and paste the link into your browser&#39;s address window, or retype it there.&nbsp;</p>");

        strBody.Append("<p>&nbsp;</p><p>	Thanks,</p>");
     
        string Body = strBody.ToString();


        SendEmail(txtEmail.Text, "Registration Confirmation", Body);
        Response.Redirect("RegistrationSucess.aspx");
    }

    protected string SendEmail(string toAddress, string subject, string body)
    {
        string result = "Message Sent Successfully..!!";
        string senderID = Convert.ToString(ConfigurationManager.AppSettings["Mailfrom"]);// use sender's email id here..
        string senderPassword = Convert.ToString(ConfigurationManager.AppSettings["Password"]);
        try
        {
            SmtpClient smtp = new SmtpClient
            {
                Host = Convert.ToString(ConfigurationManager.AppSettings["MailServer"]),
                Port = Convert.ToInt32(ConfigurationManager.AppSettings["Port"]),
                EnableSsl = true,
                DeliveryMethod = SmtpDeliveryMethod.Network,
                Credentials = new System.Net.NetworkCredential(senderID, senderPassword),
                Timeout = 30000,
            };
            AlternateView htmlView = AlternateView.CreateAlternateViewFromString(body, null, "text/html");
          
            MailMessage message = new MailMessage();
            message.From = new System.Net.Mail.MailAddress(senderID, "Online Exam");
            message.Subject = subject;
            message.AlternateViews.Add(htmlView);
            message.IsBodyHtml = true;
            message.To.Add(toAddress);
              
          //  MailMessage message = new MailMessage(senderID, toAddress, subject, body);
            smtp.Send(message);
        }
        catch (Exception ex)
        {
            result = "Error sending email.!!!";
        }
        return result;
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Login.aspx");
    }

}