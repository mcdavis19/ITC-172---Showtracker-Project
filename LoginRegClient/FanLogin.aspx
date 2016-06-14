<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FanLogin.aspx.cs" Inherits="FanLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
    <div>
        <h1>Fan Login</h1>
        <table>
            <tr>
                <td>UserName</td>
                <td>
                    <asp:TextBox ID="tbUsername" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ControlToValidate="tbUsername" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Password</td>
                <td>
                    <asp:TextBox ID="tbPassword" TextMode="Password" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="tbPassword" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
                </td>
                <td>
                    <asp:Label ID="lblError" runat="server" Text="" ForeColor="Red"></asp:Label>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
