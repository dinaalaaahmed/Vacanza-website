using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class SignUP : System.Web.UI.Page
    {
        Controller controllerObj;
        protected void Page_Load(object sender, EventArgs e)
        {
            object em = Session["Email"];
            if (em != null)
            {
                Label1.Text = "";
                Label2.Text = "";
            }
            controllerObj = new Controller();

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string type = "";
            if (RadioButtonList1.SelectedIndex == 0) {
                type = "Traveler";
            }
            else {

                type = "Manager";
            
            }
            int db = controllerObj.InsertUser(TextBox4.Text.ToString(), TextBox2.Text.Trim().ToString(), type, TextBox3.Text, TextBox1.Text.ToString(), TextBox5.Text.ToString());
            if (db != 0){
                Label64.Text = "Welcome";


                Response.Redirect("LogIn.aspx");


            }
            else {
                Label64.Text = "Try again!";

            }
        }

        protected void Button2_Click(object sender, EventArgs e)
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
    }
}