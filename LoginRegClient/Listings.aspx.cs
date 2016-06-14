using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Listings : System.Web.UI.Page
{
    SelectService.ShowTrackerServiceClient ShowTracker = new SelectService.ShowTrackerServiceClient();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FillGridView(gvArtists, ShowTracker.GetArtists(), lblErrorShows);
            FillGridView(gvVenues, ShowTracker.GetVenues(), lblErrorVenues);
            FillGridView(gvShows, ShowTracker.GetShows(), lblErrorShows);

            LoadArtistsDropDown();
            LoadVenuesDropDown();
        }
    }
    protected void FillGridView(GridView gv, object[] list, Label lblError)
    {
        gv.DataSource = list;
        gv.DataBind();

        int rowCount = gv.Rows.Count;
        if(rowCount == 0)
        {
            lblError.Text = "No Information to Display :(";
        }
    }
    protected void LoadVenuesDropDown()
    {
        string[] venues = ShowTracker.GetVenues();
        VenuesDropDown.DataSource = venues;
        VenuesDropDown.DataBind();
        VenuesDropDown.Items.Insert(0, "Pick a Venue");
        VenuesDropDown.Items.Insert(1, "---------");
    }
    protected void LoadArtistsDropDown()
    {
        SelectService.Artist[] artists = ShowTracker.GetArtists();
        
        string[] artistNames = new string[artists.Length];
        int i = 0;

        foreach(SelectService.Artist a in artists)
        {
            artistNames[i] = (a.ArtistName);
            i++;
        }
        ArtistsDropDown.DataSource = artistNames;
        ArtistsDropDown.DataBind();
        ArtistsDropDown.Items.Insert(0, "Pick an Artist");
    }

    protected void btnGetShowsByArtist_Click(object sender, EventArgs e)
    {
        FillGridView(gvShowsByArtist, ShowTracker.GetShowsByArtist(ArtistsDropDown.SelectedValue), lblErrorShowsByArtist);
    }

    protected void btngetshowsbyvenue_click(object sender, EventArgs e)
    {
        FillGridView(gvShowsByVenue, ShowTracker.GetShowsByVenue(VenuesDropDown.SelectedValue), lblErrorShowsByVenue);
    }
}