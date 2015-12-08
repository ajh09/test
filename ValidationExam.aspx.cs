using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _201244094_Validate
{
    public partial class ValidationExam : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid == true) 
                Server.Transfer("ValidationExamResult.aspx");
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            txtName.Text = "";
            txtPassword.Text = "";
            txtRetype.Text = "";
            txtEMail.Text = "";
            txtSocialNumber.Text = "";
            txtAge.Text = "";
            txtAddress.Text = "";
            txtPhone.Text = "";
        }

        protected void vIdSocialNumber_ServerValidate(object sender, ServerValidateEventArgs e)
        {
            int checkDigit = 0;
            int weight = 2;

            for (int i = 0; i < 13; i++)
            {
                if (i == 6) continue;
                checkDigit += int.Parse(txtSocialNumber.Text.Substring(i,1)) * weight;
                weight++;
                if (weight > 9) weight = 2;
            }
            checkDigit = (11 - (checkDigit % 11)) % 10;
            if (int.Parse(txtSocialNumber.Text.Substring(13, 1)) == checkDigit)
                e.IsValid = true;
            else e.IsValid = false;
        }
    }
}