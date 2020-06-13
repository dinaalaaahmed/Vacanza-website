<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminMenu.aspx.cs" Inherits="WebApplication1.AdminMenu" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Vacanza Website</title>
    <link href="Styles/main.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
       <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark static-top">
    
      <a class="navbar-brand" href="#">Vacanza</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active">
            <a class="nav-link" href="Home.aspx">Home
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="About.aspx">About</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="LogIn.aspx">
                <asp:Label ID="Label3" runat="server" Text="Log in"></asp:Label></a>
          </li>
             <li class="nav-item">
            <a class="nav-link" href="SignUP.aspx">
                <asp:Label ID="Label1" runat="server" Text="Sign Up"></asp:Label></a>
                 </li>
          <li class="nav-item">
            <a class="nav-link" href="Contact.aspx">Contact</a>
          </li>
        <li class="nav-item">
            <asp:Button ID="Button1" class="nav-link"  runat="server" Text="Menu" BackColor="#343A40" BorderStyle="None" ForeColor="White" OnClick="Button1_Click1" />
          </li>
        <li class="nav-item">
            <a class="nav-link" href="#"><asp:Button ID="Button6" runat="server" Text="" BackColor="#343A40" BorderStyle="None" ForeColor="White" OnClick="Button6_Click" Visible="False" /></a>
          </li>
        </ul>
      </div>
   
  </nav>
             <!-- Page Content -->
  <div class="container">
    <div class="row">
      <div class="col-lg-12 text-center">
        <div style="height: 610px">
            <br />
            <br />
            country name&nbsp;
            <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource6" DataTextField="Country_name" DataValueField="Country_id" Width="151px">
            </asp:DropDownList>
            <asp:TextBox ID="numcountry" runat="server" ReadOnly="True"></asp:TextBox>
            <asp:Button ID="hotelcountry" runat="server" OnClick="hotelcountry_Click" Text="Num Of Hotel in Country" />
            <br />
            <br />
            <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:VACANZAWEBSITE2ConnectionString %>" SelectCommand="SELECT [Country_name], [Country_id] FROM [Country]"></asp:SqlDataSource>
            city name&nbsp;
            <asp:DropDownList ID="DropDownList5" runat="server" datasourceid="SqlDataSource10" DataTextField="City_name" DataValueField="City_id" Width="151px">
            </asp:DropDownList>
            <asp:TextBox ID="numcity" runat="server" ReadOnly="True"></asp:TextBox>
            <asp:Button ID="hotelcountry0" runat="server" Text="Num Of Hotel in City" OnClick="hotelcountry0_Click" />
            <br />
            <br />
            <asp:TextBox ID="num" runat="server" ReadOnly="True"></asp:TextBox>
            <asp:Button ID="totalhotel" runat="server" Text="Num Of Hotel" OnClick="totalhotel_Click" />
            <br />
            <br />
            <br />
            <br />
            hotel name&nbsp;&nbsp;&nbsp;&nbsp; <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource4" DataTextField="Hotel_name" DataValueField="Hotel_id" Height="27px" Width="141px">
            </asp:DropDownList>
            <br />
            <br />
            <asp:Button ID="review" runat="server" Text="Review" OnClick="review_Click" />
            <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" GridLines="None" Height="206px" Width="336px">
                <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#594B9C" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#33276A" />
            </asp:GridView>
            <br />
            <br />
            <br />
            <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:VACANZAWEBSITE2ConnectionString %>" SelectCommand="SELECT [City_id], [City_name] FROM [City]"></asp:SqlDataSource>
            <div style="height: 323px">
                <asp:TextBox ID="num0" runat="server" ReadOnly="True"></asp:TextBox>
                <asp:Button ID="guests" runat="server" Text="guests inhotel" />
                <br />
                <br />
                <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:VACANZAWEBSITE2ConnectionString %>" SelectCommand="SELECT [City_id], [City_name] FROM [City]"></asp:SqlDataSource>
                <div style="height: 188px">
                    &nbsp;
                    <asp:TextBox ID="text_profit" runat="server" ReadOnly="True"></asp:TextBox>
                    <asp:Button ID="profit" runat="server" Height="33px" OnClick="Button1_Click" Text="totalprofits" Width="140px" />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    User name<asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource5" DataTextField="User_name" DataValueField="User_id" Height="33px" Width="136px" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged">
            </asp:DropDownList>
                    &nbsp;<asp:Button ID="userinfo" runat="server" Text="show user info" Width="143px" OnClick="userinfo_Click" />
                    <br />
                </div>
            </div>
            <div style="height: 99px">
            </div>
            <div style="height: 293px">
                <br />
                <br />
                city name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox1" runat="server" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
                country name&nbsp;&nbsp;
            <asp:DropDownList ID="DropDownList6" runat="server" DataSourceID="SqlDataSource6" DataTextField="Country_name" DataValueField="Country_id" Width="151px">
            </asp:DropDownList>
                <asp:Button ID="insertcity" runat="server" OnClick="insertcity_Click" Text="insert city" />
                <br />
                <asp:Label ID="Label2" runat="server" Text=" "></asp:Label>
                <br />
                country name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
&nbsp;
                <asp:Button ID="insertcountry" runat="server" OnClick="insertcountry_Click" Text="insert country" />
                <br />
                <asp:Label ID="Label4" runat="server" Text=" "></asp:Label>
                <br />
                user nauser name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:DropDownList ID="DropDownList7" runat="server" DataSourceID="userwithemail" DataTextField="User_name" DataValueField="Email" Width="128px">
                </asp:DropDownList>
                <asp:Button ID="adminuser" runat="server" OnClick="adminuser_Click" Text="make this user admin" />
                <br />
                <br />
                <br />
                <div style="height: 452px">
                    <asp:DropDownList ID="DropDownList11" runat="server" DataSourceID="SqlDataSource6" DataTextField="Country_name" DataValueField="Country_id" Width="133px">
                    </asp:DropDownList>
                    <asp:Button ID="del_country" runat="server" OnClick="del_country_Click" Text="delete country" />
                    <br />
                    <br />
                    <asp:DropDownList ID="DropDownList12" runat="server" DataSourceID="SqlDataSource9" DataTextField="City_name" DataValueField="City_id" OnSelectedIndexChanged="DropDownList12_SelectedIndexChanged" Width="132px">
                    </asp:DropDownList>
                    <asp:Button ID="delcity" runat="server" OnClick="delcity_Click" Text="delete city" />
                    <br />
                    <br />
                    <asp:DropDownList ID="DropDownList13" runat="server" DataSourceID="SqlDataSource4" DataTextField="Hotel_name" DataValueField="Hotel_id" Width="142px">
                    </asp:DropDownList>
                    <asp:Button ID="del_hotel" runat="server" OnClick="del_hotel_Click" Text="delete hotel" />
                </div>
                <br />
                <asp:SqlDataSource ID="userwithemail" runat="server" ConnectionString="<%$ ConnectionStrings:VACANZAWEBSITE2ConnectionString %>" SelectCommand="SELECT [Email], [User_name] FROM [Users]"></asp:SqlDataSource>
                <asp:Label ID="Label5" runat="server" Text=" "></asp:Label>
            </div>
            <br />
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:VACANZAWEBSITE2ConnectionString %>" SelectCommand="SELECT [Hotel_name], [Hotel_id] FROM [Hotel]"></asp:SqlDataSource>
            &nbsp;
            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:VACANZAWEBSITE2ConnectionString %>" SelectCommand="SELECT [User_id], [User_name] FROM [Users]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:VACANZAWEBSITE2ConnectionString %>" SelectCommand="SELECT [Hotel_id] FROM [Hotel]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:VACANZAWEBSITE2ConnectionString %>" SelectCommand="SELECT [Hotel_name] FROM [Hotel]"></asp:SqlDataSource>
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>

      </div>
    </div>
  </div>
      </div>
      <div >
          <br />
          <br />
          <br />
          <asp:Chart ID="Chart1" runat="server" DataSourceID="totalBookingpriceVshotelname">
              <series>
                  <asp:Series Name="Series1" XValueMember="Hotel_id" YValueMembers="Sum_price">
                  </asp:Series>
              </series>
              <chartareas>
                  <asp:ChartArea Name="ChartArea1">
                  </asp:ChartArea>
              </chartareas>
          </asp:Chart>
          <asp:SqlDataSource ID="totalBookingpriceVshotelname" runat="server" ConnectionString="<%$ ConnectionStrings:VACANZAWEBSITE2ConnectionString %>" SelectCommand="Select B1.Hotel_id,sum(B2.totalBookingPrice) As Sum_price 
From Booking B2,Booked_room B1 
Where B2.Booking_id=B1.Booking_id
And
B2.Hotel_id=B1.Hotel_id
GROUP BY
B1.Hotel_id"></asp:SqlDataSource>
          <br />
          <br />
          <asp:Chart ID="Chart2" runat="server" DataSourceID="city">
              <series>
                  <asp:Series Name="Series1" XValueMember="City_name" YValueMembers="numofhotels">
                  </asp:Series>
              </series>
              <chartareas>
                  <asp:ChartArea Name="ChartArea1">
                  </asp:ChartArea>
              </chartareas>
          </asp:Chart>
          <asp:SqlDataSource ID="city" runat="server" ConnectionString="<%$ ConnectionStrings:VACANZAWEBSITE2ConnectionString %>" SelectCommand="select COUNT(*) as numofhotels ,C.City_name 
  from Hotel H,City C 
  where C.City_id=H.City_id
  GROUP BY C.City_name"></asp:SqlDataSource>
          <br />
          <br />
          <asp:Chart ID="Chart3" runat="server" DataSourceID="country">
              <series>
                  <asp:Series Name="Series1" XValueMember="Country_name" YValueMembers="numofhotels">
                  </asp:Series>
              </series>
              <chartareas>
                  <asp:ChartArea Name="ChartArea1">
                  </asp:ChartArea>
              </chartareas>
          </asp:Chart>
          <asp:SqlDataSource ID="country" runat="server" ConnectionString="<%$ ConnectionStrings:VACANZAWEBSITE2ConnectionString %>" SelectCommand="select COUNT(*) as numofhotels ,CU.Country_name
 from Hotel H,city C ,Country CU
 where C.city_id=H.city_id  and C.Country_id=CU.Country_id
 GROUP BY CU.Country_name"></asp:SqlDataSource>
          <br />
          <br />
          <br />
          <br />

      </div>
    </form>
</body>
</html>
