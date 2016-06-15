<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Listings.aspx.cs" Inherits="Listings" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    

    <div id="menu"?>
    <asp:Menu ID="venueMenu" class="menu" runat="server" Orientation="Horizontal" maxwidth="940px">
         <Items>          
            <asp:MenuItem NavigateUrl="~/Default.aspx" Text="Venue Login"/> 
             <asp:MenuItem NavigateUrl="Register.aspx" Text="Venue Registration"/>
             <asp:MenuItem NavigateUrl="AddNewShow.aspx" Text="Add New Show"/>
             <asp:MenuItem NavigateUrl="AddNewArtist.aspx" Text="Add New Artist"/>
         </Items> 
        <StaticMenuItemStyle HorizontalPadding="55px" />    
    </asp:Menu>
    <asp:Menu ID="fanMenu" class="menu" runat="server" Orientation="Horizontal">
        <Items>     
             <asp:MenuItem NavigateUrl="FanLogin.aspx" Text="Fan Login"/>
             <asp:MenuItem NavigateUrl="FanRegistration.aspx" Text="Fan Registration"/>
             <asp:MenuItem NavigateUrl="Listings.aspx" Text="Show and Artist Listings"/>
             <asp:MenuItem NavigateUrl="FollowArtists.aspx" Text="Follow Artists"/>
            <asp:MenuItem NavigateUrl="ShowsByFanArtist.aspx" Text="Your Artists' Shows"/>
        </Items>
        <StaticMenuItemStyle HorizontalPadding="35px" />     
    </asp:Menu>
    </div>
    <div id="wrapper">
    <div><!--Artists-->
        <asp:Label ID="lblErrorArtists" runat="server" Text="" ForeColor="Red"></asp:Label>
        <h2>Artists</h2>
        <asp:GridView ID="gvArtists" CssClass="gridview" runat="server"></asp:GridView>
    </div>

    <div><!--Venues-->
        <asp:Label ID="lblErrorVenues" runat="server" Text="" ForeColor="Red"></asp:Label>
        <h2>Venues</h2>
        <asp:GridView ID="gvVenues" CssClass="gridview" runat ="server"></asp:GridView>
    </div>

    <div><!--Shows-->
        <asp:Label ID="lblErrorShows" runat="server" Text="" ForeColor="Red"></asp:Label>
        <h2>Shows</h2>
        <asp:GridView ID="gvShows" CssClass="gridview" runat="server"></asp:GridView>
    </div>
    
    <br /><!--Shows by Venue-->
    <div id="ShowsByVenue">
        <asp:Label ID="lblErrorShowsByVenue" runat="server" Text="" ForeColor="Red"></asp:Label>
        <h2>Shows by Venue</h2>
        <asp:DropDownList ID="VenuesDropDown" CssClass="DropDownList" runat="server"></asp:DropDownList>
        <asp:gridview id="gvShowsByVenue" CssClass="gridview" runat="server"></asp:gridview>
        <asp:button id="btnGetShowsByVenue" CssClass="button" runat="server" text="Get Shows" onclick="btngetshowsbyvenue_click" Width="90px" />
    </div>
    <br /><!--Shows by Artist-->
    <div id="ShowsByArtist">
        <asp:Label ID="lblErrorShowsByArtist" runat="server" Text="" ForeColor="Red"></asp:Label>
        <h2>Shows by Artist</h2>
        <asp:DropDownList ID="ArtistsDropDown" CssClass="DropDownList" runat="server"></asp:DropDownList>
        <asp:GridView ID="gvShowsByArtist" CssClass="gridview" runat="server"></asp:GridView>
        <asp:Button ID="btnGetShowsByArtist" CssClass="button" runat="server" Text="Get Shows" OnClick="btnGetShowsByArtist_Click" Width="90px" />
    </div>
    </div> <!--End Wrapper-->
    </form>
</body>
</html>