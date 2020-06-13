<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUP.aspx.cs" Inherits="WebApplication1.SignUP" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
                <asp:Label ID="Label2" runat="server" Text="Log in"></asp:Label>

            </a>
          </li>
             <li class="nav-item">
            <a class="nav-link" href="SignUP.aspx">
                <asp:Label ID="Label1" runat="server" Text="Sign Up"></asp:Label>
            </a>
                 </li>
          <li class="nav-item">
            <a class="nav-link" href="Contact.aspx">Contact</a>
          </li>
        <li class="nav-item">
  <asp:Button ID="Button2" class="nav-link" runat="server" Text="Menu" BackColor="#343A40" BorderStyle="None" ForeColor="White" OnClick="Button2_Click" />
          </li>
        </ul>

      </div>
  
  </nav>
         <!-- Page Content -->
  <div class="container">
    <div class="row">
      <div class="col-lg-12 text-center">
  
         <p>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         </p>
         <p>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:Label ID="Label57" runat="server" Font-Bold="True" Font-Size="Large" Font-Underline="False" ForeColor="#3399FF" Text="Sign up"></asp:Label>
         </p>
         <p>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <asp:Label ID="Label61" runat="server" ForeColor="#3399FF" Text="Credit Card num"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
             <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
&nbsp;
         </p>
         <p>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <asp:Label ID="Label59" runat="server" ForeColor="#3399FF" Text="Email"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
         </p>
         <p>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <asp:Label ID="Label60" runat="server" ForeColor="#3399FF" Text="Phone num"></asp:Label>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
         </p>
         <p>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <asp:Label ID="Label58" runat="server" ForeColor="#3399FF" Text="Name"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
         </p>
           <asp:Button ID="Button1" runat="server" ForeColor="#3399FF" Text="Sign up" OnClick="Button1_Click" />
         <p>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <asp:Label ID="Label62" runat="server" ForeColor="#3399FF" Text="Password"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
         </p>
         <p>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <asp:Label ID="Label63" runat="server" ForeColor="#3399FF" Text="Type"></asp:Label>
             &nbsp;<asp:RadioButtonList ID="RadioButtonList1" class="col-lg-12 text-center" runat="server" AutoPostBack="True">
                 <asp:ListItem>Traveler</asp:ListItem>
                 <asp:ListItem>Manager</asp:ListItem>
             </asp:RadioButtonList>
            
         </p>
         <p>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;<asp:Label ID="Label64" runat="server"></asp:Label>
         </p>
         <p>
             &nbsp;</p>
         <p>
             &nbsp;</p>
          </div>
        </div>
      </div>
    </form>
</body>
</html>
