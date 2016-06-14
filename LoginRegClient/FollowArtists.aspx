<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FollowArtists.aspx.cs" Inherits="FollowArtists" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ShowTracker|Follow Artists</title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div id="menu"?>
    <asp:Menu ID="venueMenu" class="menu" runat="server" Orientation="Horizontal">
         <Items>          
            <asp:MenuItem NavigateUrl="~/Default.aspx" Text="Venue Login"/> 
             <asp:MenuItem NavigateUrl="Register.aspx" Text="Venue Registration"/>
             <asp:MenuItem NavigateUrl="AddNewShow.aspx" Text="Add New Show"/>
             <asp:MenuItem NavigateUrl="AddNewArtist.aspx" Text="Add New Artist"/>
         </Items> 
        <StaticMenuItemStyle HorizontalPadding="20px" />    
    </asp:Menu>
    <asp:Menu ID="fanMenu" class="menu" runat="server" Orientation="Horizontal">
        <Items>   
             <asp:MenuItem NavigateUrl="FanLogin.aspx" Text="Fan Login"/>
             <asp:MenuItem NavigateUrl="FanRegistration.aspx" Text="Fan Registration"/>
             <asp:MenuItem NavigateUrl="Listings.aspx" Text="Show and Artist Listings"/>
             <asp:MenuItem NavigateUrl="FollowArtists.aspx" Text="Follow Artists"/>
        </Items>
        <StaticMenuItemStyle  HorizontalPadding="20px" />     
    </asp:Menu>
    </div>
    <h1>Follow Artists</h1>
    <div>
        <asp:Label ID="lblInstructions" runat="server" Text="Label"></asp:Label>
        <asp:CheckBoxList ID="CheckBoxList1" runat="server" RepeatColumns="3"></asp:CheckBoxList>
        <asp:Button ID="Button1" runat="server" Text="Add Artists" OnClick="Button1_Click" />
    </div>
    </form>
</body>
</html>
