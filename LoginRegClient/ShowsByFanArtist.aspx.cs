using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ShowsByFanArtist : System.Web.UI.Page
{
    SelectService.ShowTrackerServiceClient stsc = new SelectService.ShowTrackerServiceClient();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnGetShowsByArtist_Click(object sender, EventArgs e)
    {
        GetShowsByFanArtists();
    }

    protected void GetShowsByFanArtists()
    {
            SelectService.ShowInfo[] arrayShows = stsc.GetShowsByFanArtists(Convert.ToInt32(Session["UserKey"]));
            FillGridView(gvShowsByFanArtist, arrayShows, lblErrorShowsByArtist);
        
    }

    protected void FillGridView(GridView gv, object[] list, Label lblError)
    {
        gv.DataSource = list;
        gv.DataBind();

        int rowCount = gv.Rows.Count;
        if (rowCount == 0)
        {
            lblError.Text = "No Information to Display :(";
        }
    }
}