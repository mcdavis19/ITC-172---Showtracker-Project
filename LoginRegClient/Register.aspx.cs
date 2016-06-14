using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        RegisterVenue();
    }
    protected void RegisterVenue()
    {
        LoginRegSrvc.LoginRegistrationSrvcClient lrsc = new LoginRegSrvc.LoginRegistrationSrvcClient();

        //Venue and VenueLogin Objects
        LoginRegSrvc.Venue venue = new LoginRegSrvc.Venue();
        LoginRegSrvc.VenueLogin venueLogin = new LoginRegSrvc.VenueLogin();

        //Fill venue fields.
        venue.VenueName = tbName.Text;
        venue.VenueAddress = tbAddress.Text;
        venue.VenueCity = tbCity.Text;
        venue.VenueState = ddlState.Text;
        venue.VenueZipCode = tbZip.Text;
        venue.VenuePhone = tbPhone.Text;
        venue.VenueEmail = tbEmail.Text;
        venue.VenueWebPage = tbWebPage.Text;

        //Deal with nullable AgeRestr and convert to int
        if ( Regex.IsMatch( tbAgeRestr.Text, @"\d"))
        {
            venue.VenueAgeRestriction = int.Parse(tbAgeRestr.Text);
        }
        else
        {
            lblError.Text = "Please enter age restrction as a number.";
        }

        //VenueLogin fields.
        venueLogin.VenueLoginUserName = tbUsername.Text;
        venueLogin.VenueLoginPasswordPlain = tbPassword.Text;

        //Error messages
        try
        {
            bool registered = lrsc.RegisterVenue(venue, venueLogin);
            if (registered)
            {
                lblError.Text = "Looks like you're already registered";
            }
            else
            {
                lblError.Text = "Registration Successful";
                Response.Redirect("");
            }
        }
        catch
        {
            lblError.Text = "Registration Error";
        }
        
        
    }
}