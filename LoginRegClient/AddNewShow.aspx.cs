using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class AddNewShow : System.Web.UI.Page
{
    DataConnection dc = new DataConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        LoadArtistsDropDown();
    }
    protected void LoadArtistsDropDown()
    {
        SelectService.ShowTrackerServiceClient stsc = new SelectService.ShowTrackerServiceClient();
        SelectService.Artist[] listArtists = stsc.GetArtists();

        ddlArtists.DataSource = listArtists;
        ddlArtists.DataTextField = "ArtistName";
        ddlArtists.DataValueField = "ArtistKey";
        ddlArtists.DataBind();
        ddlArtists.Items.Insert(0, "Choose an Artist");
    }
    protected void btnAddShow_Click(object sender, EventArgs e)
    {
        AddShow();
    }

    protected void AddShow()
    {
        //Make objects from service
        LoginRegSrvc.LoginRegistrationSrvcClient lrsc = new LoginRegSrvc.LoginRegistrationSrvcClient();
        LoginRegSrvc.Show newShow = new LoginRegSrvc.Show();
        LoginRegSrvc.ShowDetail newShowDetail = new LoginRegSrvc.ShowDetail();

        //Fill object fields with data from form.
        newShow.ShowName = tbShowName.Text;
        newShow.VenueKey = (int)Session["UserKey"];
        newShow.ShowDate = calShowDate.SelectedDate;
        newShow.ShowTicketInfo = taTicketInfo.InnerText;
        newShow.ShowDateEntered = DateTime.Now;

        //Trying to get artist key
        LoginRegSrvc.Artist artist = new LoginRegSrvc.Artist();
        artist.ArtistName = ddlArtists.SelectedItem.Text;

        newShowDetail.ArtistKey = Convert.ToInt32(ddlArtists.SelectedValue);

        try
        {
            newShow.ShowTime = TimeSpan.Parse(tbShowTime.Text);
            newShowDetail.ShowDetailArtistStartTime = TimeSpan.Parse(tbArtistStartTime.Text);
        }
        catch
        {
            lblError.Text = "Please enter a valid time";
        }

        newShowDetail.ShowDetailAdditional = taAddtlDtl.InnerText;

        bool itWorked = lrsc.NewShow(newShow, newShowDetail, Convert.ToInt32(ddlArtists.SelectedValue));

        //Success message
        if(itWorked)
        {
            lblError.Text = "Show Successfully Added";
        }
    }

    protected void ddlArtists_SelectedIndexChanged(object sender, EventArgs e)
    {
        
        if(!IsPostBack)
        {
            LoadArtistsDropDown();
        }
    }
    
}