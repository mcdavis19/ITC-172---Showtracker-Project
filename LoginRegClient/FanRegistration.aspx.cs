using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FanRegistration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        Register();
    }

    protected void Register()
    {
        //Instatiate objects.
        LoginRegSrvc.LoginRegistrationSrvcClient lrsc = new LoginRegSrvc.LoginRegistrationSrvcClient();
        LoginRegSrvc.Fan fan = new LoginRegSrvc.Fan();
        LoginRegSrvc.FanLogin fl = new LoginRegSrvc.FanLogin();

        //Fill object fields from completed form.
        fan.FanName = tbName.Text;
        fan.FanEmail = tbEmail.Text;
        fl.FanLoginUserName = tbUsername.Text;
        fl.FanLoginPasswordPlain = tbConfirmPass.Text;

        //Try to call stored procedure
        try
        {
            bool registered = lrsc.RegisterFan(fan, fl);
            if (registered)
            {
                lblError.Text = "You are already registered";
            }
            else
            {
                lblError.Text = "Registration Successful";

            }
        }
        catch
        {
            lblError.Text = "Registration Error";
        }
    }
}