<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ShowTracker|New Venue Registration</title>
    <style type="text/css">
        .auto-style1 {
            width: 113px;
        }
    </style>
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
        <h1>New Venue Registration</h1>
        <table>
            <tr>
                <td class="auto-style1">
                    Venue Name
                </td>
                <td>
                    <asp:TextBox ID="tbName" runat="server" Width="140px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvVenueName" runat="server" ControlToValidate="tbName" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    E-Mail
                </td>
                <td>
                    <asp:TextBox ID="tbEmail" runat="server" Width="140px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="tbEmail" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="tbEmail" ErrorMessage="Invalid Email Address" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    Username
                </td>
                <td>
                    <asp:TextBox ID="tbUsername" runat="server" Width="140px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ControlToValidate="tbUsername" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    Password
                </td>
                <td>
                    <asp:TextBox ID="tbPassword" TextMode="Password" runat="server" Width="140px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="tbPassword" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revPassword" runat="server" ControlToValidate="tbPassword" ErrorMessage="Passwords must have an uppercase letter and number." ForeColor="Red" ValidationExpression="^[a-zA-Z]\w{3,14}$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Confirm Password
                </td>
                <td>
                    <asp:TextBox ID="tbConfirmPass" TextMode="Password" runat="server" Width="140px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvConfirmPass" runat="server" ControlToValidate="tbConfirmPass" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="cvConfirm" runat="server" ControlToCompare="tbConfirmPass"  ControlToValidate="tbPassword" ErrorMessage="Passwords Don't Match" ForeColor="Red"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    Address
                </td>
                <td>
                    <asp:TextBox ID="tbAddress" runat="server" Width="140px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ControlToValidate="tbAddress" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    City
                </td>
                <td>
                    <asp:TextBox ID="tbCity" runat="server" Width="140px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvCity" runat="server" ControlToValidate="tbCity" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    State
                </td>
                <td>
                    <asp:DropDownList ID="ddlState" runat="server">
                        <asp:ListItem Value="">Choose a State</asp:ListItem>
	                    <asp:ListItem Value="AL">Alabama</asp:ListItem>
	                    <asp:ListItem Value="AK">Alaska</asp:ListItem>
	                    <asp:ListItem Value="AZ">Arizona</asp:ListItem>
	                    <asp:ListItem Value="AR">Arkansas</asp:ListItem>
	                    <asp:ListItem Value="CA">California</asp:ListItem>
	                    <asp:ListItem Value="CO">Colorado</asp:ListItem>
	                    <asp:ListItem Value="CT">Connecticut</asp:ListItem>
	                    <asp:ListItem Value="DC">District of Columbia</asp:ListItem>
	                    <asp:ListItem Value="DE">Delaware</asp:ListItem>
	                    <asp:ListItem Value="FL">Florida</asp:ListItem>
	                    <asp:ListItem Value="GA">Georgia</asp:ListItem>
	                    <asp:ListItem Value="HI">Hawaii</asp:ListItem>
	                    <asp:ListItem Value="ID">Idaho</asp:ListItem>
	                    <asp:ListItem Value="IL">Illinois</asp:ListItem>
	                    <asp:ListItem Value="IN">Indiana</asp:ListItem>
	                    <asp:ListItem Value="IA">Iowa</asp:ListItem>
	                    <asp:ListItem Value="KS">Kansas</asp:ListItem>
	                    <asp:ListItem Value="KY">Kentucky</asp:ListItem>
	                    <asp:ListItem Value="LA">Louisiana</asp:ListItem>
	                    <asp:ListItem Value="ME">Maine</asp:ListItem>
	                    <asp:ListItem Value="MD">Maryland</asp:ListItem>
	                    <asp:ListItem Value="MA">Massachusetts</asp:ListItem>
	                    <asp:ListItem Value="MI">Michigan</asp:ListItem>
	                    <asp:ListItem Value="MN">Minnesota</asp:ListItem>
	                    <asp:ListItem Value="MS">Mississippi</asp:ListItem>
	                    <asp:ListItem Value="MO">Missouri</asp:ListItem>
	                    <asp:ListItem Value="MT">Montana</asp:ListItem>
	                    <asp:ListItem Value="NE">Nebraska</asp:ListItem>
	                    <asp:ListItem Value="NV">Nevada</asp:ListItem>
	                    <asp:ListItem Value="NH">New Hampshire</asp:ListItem>
	                    <asp:ListItem Value="NJ">New Jersey</asp:ListItem>
	                    <asp:ListItem Value="NM">New Mexico</asp:ListItem>
	                    <asp:ListItem Value="NY">New York</asp:ListItem>
	                    <asp:ListItem Value="NC">North Carolina</asp:ListItem>
	                    <asp:ListItem Value="ND">North Dakota</asp:ListItem>
	                    <asp:ListItem Value="OH">Ohio</asp:ListItem>
	                    <asp:ListItem Value="OK">Oklahoma</asp:ListItem>
	                    <asp:ListItem Value="OR">Oregon</asp:ListItem>
	                    <asp:ListItem Value="PA">Pennsylvania</asp:ListItem>
	                    <asp:ListItem Value="RI">Rhode Island</asp:ListItem>
	                    <asp:ListItem Value="SC">South Carolina</asp:ListItem>
	                    <asp:ListItem Value="SD">South Dakota</asp:ListItem>
	                    <asp:ListItem Value="TN">Tennessee</asp:ListItem>
	                    <asp:ListItem Value="TX">Texas</asp:ListItem>
	                    <asp:ListItem Value="UT">Utah</asp:ListItem>
	                    <asp:ListItem Value="VT">Vermont</asp:ListItem>
	                    <asp:ListItem Value="VA">Virginia</asp:ListItem>
	                    <asp:ListItem Value="WA">Washington</asp:ListItem>
	                    <asp:ListItem Value="WV">West Virginia</asp:ListItem>
	                    <asp:ListItem Value="WI">Wisconsin</asp:ListItem>
	                    <asp:ListItem Value="WY">Wyoming</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvState" runat="server" ControlToValidate="ddlState" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    Zip Code
                </td>
                <td>
                    <asp:TextBox ID="tbZip" runat="server" Width="140px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvZip" runat="server" ControlToValidate="tbZip" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revZip" runat="server" ErrorMessage="Invalid Zip Code" ControlToValidate="tbZip" ForeColor="Red" ValidationExpression="\d{5}?"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    Phone Number
                </td>
                <td>
                    <asp:TextBox ID="tbPhone" runat="server" Width="140px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ControlToValidate="tbPhone" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revPhone" runat="server" ControlToValidate="tbPhone"  ErrorMessage="Invalid Phone Number" ForeColor="Red" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    Web Address
                </td>
                <td>
                    <asp:TextBox ID="tbWebPage" runat="server" Width="140px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvWebPage" runat="server" ControlToValidate="tbWebPage" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    Age Restriction
                </td>
                <td>
                    <asp:TextBox ID="tbAgeRestr" runat="server" Width="140px"></asp:TextBox>
                </td>
                <td></td>
            </tr>
            <tr>
                <td class="auto-style1"></td>
                <td>
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" Width="150px" OnClick="btnSubmit_Click" />
                </td>
                <td>
                    <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
