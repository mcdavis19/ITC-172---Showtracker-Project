using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

// NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "ShowTrackerService" in code, svc and config file together.
public class ShowTrackerService : IShowTrackerService
{
    ShowTrackerEntities db = new ShowTrackerEntities();
    public void ShowTrackerServices()
    {

    }

    //A list of all artists (just the names)
    public List<Artist> GetArtists()
    {
        var artists = from a in db.Artists
                      orderby a.ArtistName
                      select new { a.ArtistName, a.ArtistKey };
        List<Artist> dictArtists = new List<Artist>();
        foreach (var art in artists)
        {
            Artist a = new Artist();
            a.ArtistName = art.ArtistName;
            a.ArtistKey = art.ArtistKey;
            dictArtists.Add(a);
        }
        return dictArtists;
    }

    //list of all shows (just the names)
    public List<string> GetShows()
    {
        var shows = from s in db.Shows
                      orderby s.ShowName
                      select new { s.ShowName };
        List<string> listShows = new List<string>();
        foreach (var s in shows)
        {
            listShows.Add(s.ShowName.ToString());
        }
        return listShows;
    }

    //list of all venues (just the names of the venues)
    public List<string> GetVenues()
    {
        var venues = from v in db.Venues
                    orderby v.VenueName
                    select new { v.VenueName };
        List<string> listVenues = new List<string>();
        foreach (var v in venues)
        {
            listVenues.Add(v.VenueName.ToString());
        }
        return listVenues;
    }

    //list of all shows for a particular venue (for this list the showname, show date,  show start time)
    public List<ShowInfo> GetShowsByVenue(string venueName)
    {
        var shows = from s in db.Shows
                    from sd in s.ShowDetails
                    orderby s.ShowName
                    where s.Venue.VenueName.Equals(venueName)
                    select new { s.ShowName, s.ShowDate, s.ShowTime, s.Venue.VenueName, sd.Artist.ArtistName};
        List<ShowInfo> listShows = new List<ShowInfo>();
        foreach (var s in shows)
        {
            ShowInfo show = new ShowInfo();
            show.artistName = s.ArtistName;
            show.name = s.ShowName;
            show.date = s.ShowDate.ToString();
            show.time = s.ShowTime.ToString();
            show.venueName = s.VenueName.ToString();
            listShows.Add(show);
        }
        return listShows;
    }

    //list of all shows for a particular artist (Show name, show date, show time and venue Name)
    public List<ShowInfo> GetShowsByArtist(string artistName)
    {
        var shows = from s in db.Shows
                    from sd in s.ShowDetails
                    orderby s.ShowName
                    where sd.Artist.ArtistName.Equals(artistName)
                    select new { s.ShowName, s.ShowDate, s.ShowTime, s.Venue.VenueName, sd.Artist.ArtistName };
        List<ShowInfo> listShows = new List<ShowInfo>();
        foreach (var s in shows)
        {
            ShowInfo show = new ShowInfo();
            show.name = s.ShowName;
            show.date = s.ShowDate.ToString();
            show.time = s.ShowTime.ToString();
            show.venueName = s.VenueName.ToString();
            show.artistName = s.ArtistName.ToString();
            listShows.Add(show);
        }
        return listShows;
    }

    public List<ShowInfo> GetShowsByFanArtists(int fanKey)
    {
        //get the fan
        Fan myFan = (from f in db.Fans
                     where f.FanKey == fanKey
                     select f).First();

        List<ShowInfo> shows = new List<ShowInfo>();

        //this loop within a loop is very inefficient
        foreach (Artist a in myFan.Artists)
        {
            //get all the shows for the fan
            var shws = from s in db.Shows
                       from sd in s.ShowDetails
                       where sd.ArtistKey == a.ArtistKey
                       select new
                       {
                           s.ShowName,
                           s.ShowTime,
                           s.ShowDate,
                           s.ShowTicketInfo,
                           s.Venue.VenueName,
                           sd.Artist.ArtistName
                       };
            //loop through the shows and write them to 
            //ShowInfo objects then add those objects
            //to the list
            foreach (var sh in shws)
            {
                ShowInfo info = new ShowInfo();
                info.name = sh.ShowName;
                info.date = sh.ShowDate.ToString();
                info.time = sh.ShowTime.ToString();
                info.ticketInfo = sh.ShowTicketInfo;
                info.venueName = sh.VenueName;
                info.artistName = sh.ArtistName;

                shows.Add(info);
            }
        }
        return shows;
    }
    public int AddFanArtist(int fanKey, string artistName)
    {
        /*********************************
         * This method will add an artist to the artistFan
         * table. First we have to find the fan
         * and then the particular artist
         * Then we add the artist to the Fan's list
         * of artists to follow
         * **********************************/
        int result = 1;
        try
        {
            //get the fan. the key can come from their login
            Fan myFan = (from f in db.Fans
                         where f.FanKey == fanKey
                         select f).First();

            //get the artist by name
            Artist myArtist = (from a in db.Artists
                               where a.ArtistName.Equals(artistName)
                               select a).First();

            //add the artist to the fan;'s collection of artists
            myFan.Artists.Add(myArtist);

            //save the changes
            db.SaveChanges();
        }
        catch
        {
            result = -1;
        }
        return result;
    }
}

