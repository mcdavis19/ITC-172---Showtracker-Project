<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ShowsByFanArtist.aspx.cs" Inherits="ShowsByFanArtist" %>

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
        <br /><!--Shows by Artist-->
    <div id="ShowsByArtist">
        <asp:Label ID="lblErrorShowsByArtist" runat="server" Text="" ForeColor="Red"></asp:Label>
        <h2>Shows by Followed Artists</h2>
        <asp:GridView ID="gvShowsByFanArtist" CssClass="gridview" runat="server"></asp:GridView>
        <asp:Button ID="btnGetShowsByFanArtist" CssClass="button" runat="server" Text="Get Shows" OnClick="btnGetShowsByArtist_Click" Width="90px" />
    </div>
    </div>
    </form>
</body>
</html>
