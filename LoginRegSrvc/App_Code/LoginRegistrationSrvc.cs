using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

// NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "LoginRegistrationSrvc" in code, svc and config file together.
public class LoginRegistrationSrvc : ILoginRegistrationSrvc
{
    ShowTrackerEntities db = new ShowTrackerEntities();
    public bool RegisterVenue(Venue v, VenueLogin vl)
    {
        bool registered = false;
        //Stored Prodecdure returns an int. -1 if the venue is already registered.
        int pass = db.usp_RegisterVenue(v.VenueName, v.VenueAddress, v.VenueCity, v.VenueState, v.VenueZipCode,
          v.VenuePhone, v.VenueEmail, v.VenueWebPage,
          v.VenueAgeRestriction, vl.VenueLoginUserName,
          vl.VenueLoginPasswordPlain);
        if (pass == -1)
        {
            registered = true;
        }
        // True if registered, false if not. 
        return registered;
    }

    public int LoginVenue(string userName, string password)
    //Returns venueKey
    {
        int reviewerKey = -1;
        //Returns int which represents the successfulness of the login.
        // -1 means it failed.
        int loginSuccess = db.usp_venueLogin(userName, password);
        if (loginSuccess != -1)
        {
            var venueInfo = (from vl in db.VenueLogins
                             where vl.VenueLoginUserName.Equals(userName)
                             select new { vl.VenueKey }).FirstOrDefault();
            reviewerKey = (int)venueInfo.VenueKey;
        }
        return reviewerKey;
    }
    public int LoginFan(string username, string password)
    {
        //Fan key in db which will be used as a session variable.
        int reviewerKey = -1;
        //Returns int which represents the successfulness of the login.
        // -1 means it failed.
        int loginSuccess = db.usp_FanLogin(username, password);
        if (loginSuccess != -1)
        {
            var fanInfo = (from fl in db.FanLogins
                           where fl.FanLoginUserName.Equals(username)
                           select new { fl.FanKey }).FirstOrDefault();
            reviewerKey = (int)fanInfo.FanKey;
        }
        //return fan key to be used as session variable.
        return reviewerKey; ;
    }

    public bool RegisterFan(Fan fan, FanLogin fl)
    {
        bool registered = false;
        //Stored Prodecdure returns an int. -1 if the venue is already registered.
        int pass = db.usp_RegisterFan(fan.FanName, fan.FanEmail, fl.FanLoginUserName, fl.FanLoginPasswordPlain);

        if (pass == -1)
        {
            registered = true;
        }
        // True if registered, false if not. 
        return registered;
    }
    public int NewArtist(Artist a)
    {
        int artistKey;
        try
        {
            a.ArtistDateEntered = DateTime.Now;
            db.Artists.Add(a);
            db.SaveChanges();
            artistKey = 1;
        }
        catch
        {
            artistKey = -1;
        }
        return artistKey;
    }
    public bool NewShow(Show s, ShowDetail sd, int artistKey)
    {
        //New show object and fill it with same fields as param
        Show newShow = new Show();
        newShow.ShowDate = s.ShowDate;
        newShow.ShowDateEntered = DateTime.Now;
        newShow.ShowName = s.ShowName;
        newShow.ShowKey = s.ShowKey;
        newShow.ShowTicketInfo = s.ShowTicketInfo;
        newShow.ShowTime = s.ShowTime;
        newShow.VenueKey = s.VenueKey;

        //Add to db or catch errors
        bool itWorked = true;
        try
        {
            db.Shows.Add(newShow);
            db.SaveChanges();
        }
        catch
        {
            itWorked = false;
        }

        //Calls new show detail to insert same key and link tables in db.
        itWorked = NewShowDetail(sd, newShow.ShowKey, artistKey);
        return itWorked;
    }

    public bool NewShowDetail(ShowDetail sd, int showKey, int artistKey)
    {
        bool itWorked = true;
        //New show object and fill it with same fields as param
        ShowDetail newShowDetail = new ShowDetail();
        newShowDetail.ArtistKey = artistKey;
        newShowDetail.ShowDetailAdditional = sd.ShowDetailAdditional;
        newShowDetail.ShowDetailArtistStartTime = sd.ShowDetailArtistStartTime;
        newShowDetail.ShowKey = showKey;

        try
        {
            db.ShowDetails.Add(newShowDetail);
            db.SaveChanges();
        }
        catch
        {
            itWorked = false;
        }
        return itWorked;
    }
}