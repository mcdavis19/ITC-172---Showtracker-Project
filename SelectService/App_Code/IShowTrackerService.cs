using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

// NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IShowTrackerService" in both code and config file together.
[ServiceContract]
public interface IShowTrackerService
{
    //list of all venues (just the names of the venues)
    [OperationContract]
    List<string> GetVenues();

    //A list of all artists (just the names)
    [OperationContract]
    List<Artist> GetArtists();

    //list of all shows (just the names)
    [OperationContract]
    List<string> GetShows();

    //list of all shows for a particular venue (for this list the show name, show date,  show start time)
    [OperationContract]
    List<ShowInfo> GetShowsByVenue(string venueName);

    //list of all shows for a particular artist (Show name, show date, show time and venue Name)
    [OperationContract]
    List<ShowInfo> GetShowsByArtist(string artistName);

    [OperationContract]
    List<ShowInfo> GetShowsByFanArtists(int fanKey);

    [OperationContract]
    int AddFanArtist(int fanKey, string artistName);

}

[DataContract]
public class ShowInfo
{
    [DataMember]
    public string name { set; get; }

    [DataMember]
    public string date { set; get; }

    [DataMember]
    public string time { set; get; }

    [DataMember]
    public string venueName { set; get; }

    [DataMember]
    public string artistName { set; get; }

    [DataMember]
    public string ticketInfo { set; get; }
}

//public class FanArtist
//{
//    [DataMember]
//    public int fanKey { set; get;  }

//    [DataMember]
//    public int artistKey { set; get; }
//}

