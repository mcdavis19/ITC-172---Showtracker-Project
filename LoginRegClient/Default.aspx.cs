using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        Login();
    }

    protected void Login()
    {
        LoginRegSrvc.LoginRegistrationSrvcClient lrsc = new LoginRegSrvc.LoginRegistrationSrvcClient();
        int key = lrsc.LoginVenue(tbUsername.Text, tbPassword.Text);
        if (key != -1)
        {
            Session["UserKey"] = key;
            Response.Redirect("AddNewShow.aspx");
        }
        else
        {
            lblLogin.Text = "Invalid Login :(";
        }
    }
}