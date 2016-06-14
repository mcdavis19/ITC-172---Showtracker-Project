using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddNewArtist : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnAddArtist_Click(object sender, EventArgs e)
    {
        AddArtist();
    }

    protected void AddArtist()
    {
        LoginRegSrvc.LoginRegistrationSrvcClient lrsc = new LoginRegSrvc.LoginRegistrationSrvcClient();
        LoginRegSrvc.Artist artist = new LoginRegSrvc.Artist();

        artist.ArtistName = tbName.Text;
        artist.ArtistEmail = tbEmail.Text;
        if (!tbWebAddr.Text.Equals(null))
        {
            artist.ArtistWebPage = tbWebAddr.Text;
        }

        lrsc.NewArtist(artist);
    }
}