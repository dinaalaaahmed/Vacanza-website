using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
namespace WebApplication1
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        Controller controllerObj;
        protected void Page_Load(object sender, EventArgs e)
        {

            object em = Session["Email"];

            if (em != null)
            {
                Label3.Text = "";
                Label1.Text = "";
                Button6.Visible = true;
                Button6.Text = "Log out";
            }
            controllerObj = new Controller();

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            
            if (TextBox1.Text.ToString().Trim() == "" || TextBox7.Text.ToString().Trim() == "" || TextBox8.Text.ToString().Trim() == "") {
                Label75.Text = "Please Enter all the values ,it's required.";
            }
            else
            { int dt = controllerObj.InsertHotel(TextBox1.Text.ToString(), Convert.ToChar(DropDownList2.Text.ToString()), TextBox7.Text.ToString(), DropDownList1.Text.ToString(), Session["Email"].ToString(), TextBox8.Text.ToString());
                Label75.Text = "";
            }
            DropDownList6.DataBind();
            DropDownList7.DataBind();
            DropDownList8.DataBind();
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string type;
            if (RadioButtonList1.SelectedIndex == 0)
            {
                type = "Multiple";
            }
            else if (RadioButtonList1.SelectedIndex == 1)
            {
                type = "Triple";
            }
            else if (RadioButtonList1.SelectedIndex == 2)
            {
                type = "Double";
            }
            else
            {
                type = "Single";

            }
            if (TextBox2.Text.Trim()=="" || TextBox3.Text.Trim()==""|| TextBox4.Text.Trim()=="") {
                Label81.Text = "Please Enter all the values";
            }
            else {
                for (int i = Convert.ToInt32(TextBox2.Text.ToString()); i <= Convert.ToInt32(TextBox3.Text.ToString()); i++)
                {
                    int dt = controllerObj.InsertRoom(DropDownList8.Text.ToString(), i, type, TextBox5.Text.ToString(), Convert.ToDouble(TextBox4.Text.ToString()));
                }
                Label81.Text = "";
            }

        }


        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            if (TextBox10.Text.Trim() == "" || TextBox9.Text.Trim() == "") { Label80.Text = "Please Enter all the values!"; }
            else
            {
                Label80.Text = "";
                int dt = controllerObj.InsertService(TextBox9.Text.ToString(), Convert.ToDouble(TextBox10.Text), DropDownList8.Text.ToString());
            }
            DropDownList3.DataBind();
            DropDownList5.DataBind();
        }


        protected void Button4_Click(object sender, EventArgs e)
        {
            
            int dt = controllerObj.InsertOffer(Convert.ToInt32(DropDownList4.Text.ToString()),DropDownList3.Text.ToString(),DropDownList8.Text.ToString());
            DropDownList3.DataBind();
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            if (Calendar2.SelectedDate < Calendar1.SelectedDate||Calendar2.SelectedDate<Calendar1.TodaysDate) { Label79.Text = "please Enter valid Dates"; }
            if (TextBox12.Text.Trim() == "" || TextBox11.Text.Trim() == "") { Label79.Text = "please Enter All the values"; }
            else
            {
                Label79.Text = "";
                int dt = controllerObj.InsertAnewOffer(Convert.ToInt32(TextBox12.Text.ToString()), Calendar1.SelectedDate, Calendar2.SelectedDate, Convert.ToInt32(TextBox11.Text.ToString()), DropDownList8.Text.ToString());
            }
            DropDownList4.DataBind();
            DropDownList9.DataBind();
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {

        }

        protected void TextBox6_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            if (TextBox14.Text.ToString().Trim() == "") { Label74.Text = "Please Enter The Service Price"; }
            else
            {
                int dt = controllerObj.UpdateservicePrice(Convert.ToDouble(TextBox14.Text.ToString()), DropDownList5.Text.ToString(), DropDownList6.Text.ToString());
                Label74.Text = "";
            }
        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            string type;
            if (RadioButtonList2.SelectedIndex == 0)
            {
                type = "Multiple";
            }
            else if (RadioButtonList2.SelectedIndex == 1)
            {
                type = "Triple";
            }
            else if (RadioButtonList2.SelectedIndex == 2)
            {
                type = "Double";
            }
            else
            {
                type = "Single";

            }
            if (TextBox15.Text.Trim() == "") { Label76.Text = "please Enter a price!"; }
            else
            {
                int dt = controllerObj.UpdateRoomPrice(Convert.ToDouble(TextBox15.Text.ToString()), type, DropDownList6.Text.ToString());
                Label76.Text = "";
            }
        }

        protected void Button9_Click(object sender, EventArgs e)
        {
            if (TextBox16.Text.Trim() == "" || TextBox18.Text.Trim() == "" || TextBox21.Text.Trim() == "") { Label78.Text = "Please Enter All the values"; }
            else
            {
                int dt = controllerObj.InsertTransportation(Calendar3.SelectedDate, Convert.ToDouble(TextBox16.Text), Convert.ToDouble(TextBox17.Text), TextBox18.Text.ToString(), DropDownList8.Text.ToString(), Convert.ToInt32(TextBox21.Text));
                Label78.Text = "";
            }
        }

        protected void Button10_Click(object sender, EventArgs e)
        {
            
            object dt = controllerObj.HotelProfits(DropDownList7.Text.ToString());
            TextBox20.Text = dt.ToString();
        }

        protected void DropDownList6_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList5.DataBind();
        }

        protected void DropDownList7_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridView3.DataBind();
        }

        protected void DropDownList8_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList3.DataBind();
            DropDownList4.DataBind();
        }

        protected void DropDownList7_TextChanged(object sender, EventArgs e)
        {
            GridView3.DataBind();
        }

        protected void DropDownList8_TextChanged(object sender, EventArgs e)
        {
            DropDownList3.DataBind();
            DropDownList4.DataBind();
        }

        protected void TextBox20_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Button6_Click(object sender, EventArgs e)
        {
                Session.Clear();
                Label3.Text = "Log in";
                Label1.Text = "Sign Up";
                Button6.Text = "";
                Button6.Visible = false;
                Session.Clear();
        }

        protected void Button11_Click(object sender, EventArgs e)
        {
           
            DataTable dt = controllerObj.ReservationRecords(DropDownList7.Text.ToString());
            GridView3.DataSource = dt;
            GridView3.DataBind();
        }

        protected void Button12_Click(object sender, EventArgs e)
        {
            DataTable dt = controllerObj.reviews(DropDownList7.Text.ToString());
            GridView2.DataSource = dt;
            GridView2.DataBind();

        }

        protected void Button13_Click(object sender, EventArgs e)
        {
          
            int dt = controllerObj.Deleteservice(DropDownList5.Text.ToString(), DropDownList6.Text.ToString());
            DropDownList3.DataBind();
            DropDownList5.DataBind();
        }

        protected void Button14_Click(object sender, EventArgs e)
        {
            int dt = controllerObj.DeleteHOTEL(DropDownList6.Text.ToString());
            DropDownList6.DataBind();
            DropDownList7.DataBind();
            DropDownList8.DataBind();
        }

        protected void Button15_Click(object sender, EventArgs e)
        {
            int dt = controllerObj.DeleteOFFER(Convert.ToInt32(DropDownList4.Text),DropDownList8.Text.ToString());
            DropDownList3.DataBind();
            DropDownList4.DataBind();
            DropDownList9.DataBind();
        }

        protected void Button17_Click(object sender, EventArgs e)
        {
            if (TextBox22.Text == "") { Label76.Text = "Please Enter Room Number"; }
            else
            {
                int dt = controllerObj.DeleteROOM(Convert.ToInt32(TextBox22.Text), DropDownList6.Text.ToString());
                Label76.Text = "";
            }
        }

        protected void Button16_Click(object sender, EventArgs e)
        {
            int dt = controllerObj.DeleteServiceFromOffer(Convert.ToInt32(DropDownList4.Text.ToString()), DropDownList3.Text.ToString(), DropDownList8.Text.ToString());
            DropDownList3.DataBind();
            DropDownList5.DataBind();
        }

        protected void Button18_Click(object sender, EventArgs e)
        {
            if (TextBox23.Text.ToString().Trim() == "")
            {
                Label74.Text = "Please Enter New Offer Precentage";
            }
            else
            {
                int dt = controllerObj.updateOfferPrecentage(Convert.ToInt32(DropDownList9.Text), Convert.ToInt32(TextBox23.Text));
                Label74.Text = "";
            }
        }
    }
}