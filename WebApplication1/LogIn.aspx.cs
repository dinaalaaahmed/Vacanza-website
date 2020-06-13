using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class LogIn : System.Web.UI.Page
    {
        Controller controllerObj;
        protected void Page_Load(object sender, EventArgs e)
        {

            object em = Session["Email"];
            if (em != null)
            {
                Label4.Text = "";
                Label5.Text = "";
            }
            controllerObj = new Controller();

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Label3.Text = "";
            Label4.Text = "";
            Label5.Text = "";
            object dt = controllerObj.SelectPassword(TextBox1.Text.ToString(), TextBox2.Text.ToString());
            if (dt != null)
            {
                Label3.Text = "Welcome!";
                Session["Email"] = TextBox1.Text.Trim();
                Button3.Text = "Log Out";
                Button3.Visible = true;
                Response.Redirect("Home.aspx");
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

        }

        protected void Button2_Click1(object sender, EventArgs e)
        {
            if (Session["Email"] != null)
            {

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
            else
            {
                Response.Redirect("Home.aspx");

            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Label5.Text = "Sign Up";
            Label4.Text = "Log in";
            Button2.Visible = false;
            Button2.Text = "";
            Session.Clear();
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Label3.Text = "";
            int dt = controllerObj.changepass(TextBox1.Text.ToString().Trim(), TextBox3.Text.ToString().Trim(), TextBox4.Text.ToString().Trim());
            if (dt == -1) { Label3.Text = "Please enter valid data!"; }
        }
    }
}