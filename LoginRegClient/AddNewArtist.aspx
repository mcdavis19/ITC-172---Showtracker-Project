<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddNewArtist.aspx.cs" Inherits="AddNewArtist" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="StyleSheet.css" rel="stylesheet" type="text/css"/>
    <title>ShowTracker|Add New Artist</title>
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
    <div>
        <h1>Add New Artist</h1>
        <table>
            <tr>
                <td>Artist Name</td>
                <td>
                    <asp:TextBox ID="tbName" runat="server"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="tbName" ErrorMessage="Required Field"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>Email</td>
                <td>
                    <asp:TextBox ID="tbEmail" runat="server"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="tbEmail" ErrorMessage="Required Field"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>Web Address</td>
                <td>
                    <asp:TextBox ID="tbWebAddr" runat="server"></asp:TextBox></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Button ID="btnAddArtist" runat="server" Text="Add New Artist" AutoPostBack="True" OnClick="btnAddArtist_Click" />
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
