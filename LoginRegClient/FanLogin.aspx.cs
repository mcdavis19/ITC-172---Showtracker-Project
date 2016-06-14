using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FanLogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        Login();
    }

    //
    //Get the fan key and store as a session variable.
    protected void Login()
    {
        LoginRegSrvc.LoginRegistrationSrvcClient lrsc = new LoginRegSrvc.LoginRegistrationSrvcClient();
        int key = lrsc.LoginFan(tbUsername.Text, tbPassword.Text);
        //If login is invalid, key will be -1
        if(key != -1)
        {
            Session["UserKey"] = key;
            Response.Redirect("ShowsByFanArtist.aspx");
        }
        else
        {
            lblError.Text = "Invalid Login. Check your username and password or register.";
        }
    }
}