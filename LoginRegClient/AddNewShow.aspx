<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddNewShow.aspx.cs" Inherits="AddNewShow" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ShowTracker|Add New Show</title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css"/>
    <style type="text/css">
        .auto-style1 {
            width: 215px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <div id="menu">
            <asp:Menu ID="venueMenu" runat="server" class="menu" Orientation="Horizontal">
                <Items>
                    <asp:MenuItem NavigateUrl="~/Default.aspx" Text="Venue Login" />
                    <asp:MenuItem NavigateUrl="Register.aspx" Text="Venue Registration" />
                    <asp:MenuItem NavigateUrl="AddNewShow.aspx" Text="Add New Show" />
                    <asp:MenuItem NavigateUrl="AddNewArtist.aspx" Text="Add New Artist" />
                </Items>
                <StaticMenuItemStyle HorizontalPadding="20px" />
            </asp:Menu>
            <asp:Menu ID="fanMenu" runat="server" class="menu" Orientation="Horizontal">
                <Items>
                    <asp:MenuItem NavigateUrl="FanLogin.aspx" Text="Fan Login" />
                    <asp:MenuItem NavigateUrl="FanRegistration.aspx" Text="Fan Registration" />
                    <asp:MenuItem NavigateUrl="Listings.aspx" Text="Show and Artist Listings" />
                    <asp:MenuItem NavigateUrl="FollowArtists.aspx" Text="Follow Artists" />
                </Items>
                <StaticMenuItemStyle HorizontalPadding="20px" />
            </asp:Menu>
        </div>

    <div>
        <h1>Add New Show</h1>
        <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
        <table>
            <tr>
                <td>Show Name</td>
                <td>
                    <asp:TextBox ID="tbShowName" runat="server" CssClass ="input"></asp:TextBox>
                </td>
                <td>

                </td>
            </tr>
            <tr>
                <td>Venue Name</td>
                <td>
                    <asp:TextBox ID="tbVenueName" runat="server" CssClass ="input"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvVenueName" runat="server" ControlToValidate="tbVenueName" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Artist Name</td>
                <td>
                    <asp:DropDownList ID="ddlArtists" runat="server" CssClass ="input"></asp:DropDownList>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvArtists" runat="server" ControlToValidate="ddlArtists" ErrorMessage="Required Field"
                ></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:LinkButton ID="lnkbtnNewArtist" runat="server" PostBackUrl="AddNewArtist.aspx" CausesValidation="false" >Add New Artist</asp:LinkButton>
                </td>
                <td> </td>
            </tr>
            <tr>
                <td>Artist Start Time</td>
                <td>
                    <asp:TextBox ID="tbArtistStartTime" runat="server" CssClass ="input"></asp:TextBox>
                </td>
                <td></td>
            </tr>
            <tr>
                <td>Show Date</td>
                <td>
                    <asp:Calendar ID="calShowDate" runat="server" CssClass ="input"></asp:Calendar>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td>Show Time</td>
                <td>
                    <asp:TextBox ID="tbShowTime" runat="server" CssClass ="input"></asp:TextBox>
                </td>
                <td>
                    <!--<asp:RequiredFieldValidator ID="rfvShowTime" runat="server" ControlToValidate="tbShowTime" ErrorMessage="Required Field"
                ></asp:RequiredFieldValidator>-->
                </td>
            </tr>
            <tr>
                <td>Ticketing Information</td>
                <td>
                    <textarea id="taTicketInfo" runat="server" rows="5" cssclass="input"></textarea>
                </td>
                <td></td>
            </tr>
            <tr>
                <td>Additional Information</td>
                <td>
                    <textarea id="taAddtlDtl" runat="server" rows="5" cssclass ="input"></textarea>
                </td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Button ID="btnAddShow" runat="server" Text="Add New Show" CssClass="input" OnClick="btnAddShow_Click" />
                </td>
            </tr>
        </table>
        

    </div>
    </form>
</body>
</html>
