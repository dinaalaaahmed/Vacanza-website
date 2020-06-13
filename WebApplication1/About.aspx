<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="WebApplication1.About" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
       <link href="Styles/main.css" rel="stylesheet" type="text/css" />
</head>
<body>
  
    <form id="form1" runat="server">
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
                <asp:Label ID="Label4" runat="server" Text="Log in"></asp:Label></a>
          </li>
             <li class="nav-item">
            <a class="nav-link" href="SignUP.aspx">
                <asp:Label ID="Label5" runat="server" Text="Sign Up"></asp:Label></a>
                 </li>
          <li class="nav-item">
            <a class="nav-link" href="Contact.aspx">Contact</a>
          </li>
            <li class="nav-item">
            <a class="nav-link" href="#">
                <asp:Button ID="Button2" runat="server" Text="Menu" BackColor="#343A40" BorderStyle="None" ForeColor="White" OnClick="Button2_Click1" /></a>
                 </li>
<li class="nav-item">
            <a class="nav-link" href="#">
                <asp:Button ID="Button3" runat="server" Visible="false" BackColor="#343A40" Text="" BorderStyle="None" ForeColor="White" OnClick="Button3_Click"  /></a>
          </li>
         
        </ul>
      </div>
  
  </nav>
          <!-- Page Content -->
  <div class="container">
    <div class="row">
      <div class="col-lg-12 text-center">
        <div>
            You Can book your favourite destination hire!
            <br />  <br />
            So Where You want to travel and when?
              <br />  <br />
            We will help you decide your favourite hotels.
              <br />  <br />
      </div>
    </div>
  </div>

  </div>
      
    </form>
</body>
</html>