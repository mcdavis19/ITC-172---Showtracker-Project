using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FollowArtists : System.Web.UI.Page
{
    SelectService.ShowTrackerServiceClient stsc = new SelectService.ShowTrackerServiceClient();
    protected void Page_Load(object sender, EventArgs e)
    {  
        if (!IsPostBack)
        {
            PopulateArtists();
            lblInstructions.Text = "Select the artists you would like to follow.";
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        AddArtists();
    }

    protected void PopulateArtists()
    {
        //this method populates the CheckboxList
        //with artist names
        SelectService.Artist[] artists = stsc.GetArtists();
        //Make array of artist names
        string[] artistNames = new string[artists.Length];
        int i = 0;
        foreach (SelectService.Artist a in artists)
        {
            artistNames[i] = (a.ArtistName);
            i++;
        }
        CheckBoxList1.DataSource = artistNames;
        CheckBoxList1.DataBind();
    }

    protected void AddArtists()
    {
        //get the fan's key
        int fanKey = (int)Session["UserKey"];
        //loop through the checkboxList
        //to see what's checked
        foreach (ListItem i in CheckBoxList1.Items)
        {
            //if it is checked call the service method to add
            //it to the database
            if (i.Selected)
            {
                //Uses linq to get artist key and add artist to fan's collection of followed artists
                int x = stsc.AddFanArtist(fanKey, i.Text);
            }
        }
        lblInstructions.Text = "Artist have been added";
        CheckBoxList1.Items.Clear();
    }
}