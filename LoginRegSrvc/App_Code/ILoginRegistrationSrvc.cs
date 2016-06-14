using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

// NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "ILoginRegistrationSrvc" in both code and config file together.
[ServiceContract]
public interface ILoginRegistrationSrvc
{
    [OperationContract]
    int LoginVenue(string userName, string password);

    [OperationContract]
    bool RegisterVenue(Venue v, VenueLogin vl);

    [OperationContract]
    int LoginFan(string userName, string password);

    [OperationContract]
    bool RegisterFan(Fan fan, FanLogin fl);

    [OperationContract]
    bool NewShow(Show s, ShowDetail sd, int artistKey);

    [OperationContract]
    bool NewShowDetail(ShowDetail sd, int showKey, int artistKey);

    [OperationContract]
    int NewArtist(Artist artist);
}
