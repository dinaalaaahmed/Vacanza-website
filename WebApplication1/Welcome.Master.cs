using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class Welcome : System.Web.UI.MasterPage
    {
        Controller controllerObj;
        protected void Page_Load(object sender, EventArgs e)
        {
            object em = Session["Email"];
            if (em != null)
            {
                Label2.Text = "";
                Label1.Text = "";
                Button1.Visible = true;
                Button1.Text = "Log out";
            }
            controllerObj = new Controller();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Label2.Text = "Sign Up";
            Label1.Text = "Log in";
            Button1.Visible = false;
            Button1.Text = "";
            Session.Clear();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (Session["Email"]!= null) { 
            
                string em = Session["Email"].ToString();
                object dt2 = controllerObj.SelectType(em);
                if (dt2.ToString() == "Manager")
                {
                    Response.Redirect("WebForm1.aspx");
                }
                else if (dt2.ToString() == "Traveler")
                {
                    Response.Redirect("TravelerMenu.aspx");
                }
                else
                {
                    Response.Redirect("AdminMenu.aspx");
                }

            }
            else {
                Response.Redirect("Home.aspx");

            }
        }
    }
}