using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class TravelerMenu : System.Web.UI.Page
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
        protected void Button6_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Label3.Text = "Log in";
            Label1.Text = "Sign Up";
            Button6.Text = "";
            Button6.Visible = false;
            Session.Clear();
        }
        protected void CheckBoxList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DataTable dt = controllerObj.SelectHotelNamesFromCountry(DropDownList1.Text.ToString());
            DropDownList3.DataSource = dt;
            DropDownList3.DataBind();
            DropDownList3.DataTextField = "Hotel_name";
            DropDownList3.DataValueField = "Hotel_name";
            DropDownList3.DataBind();
    
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridView4.DataBind();
            GridView5.DataBind();
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            DataTable dt = controllerObj.SelectHotelNamesFromCity(DropDownList2.Text.ToString());
            DropDownList3.DataSource = dt;
            DropDownList3.DataBind();
            DropDownList3.DataTextField = "Hotel_name";
            DropDownList3.DataValueField = "Hotel_name";
            DropDownList3.DataBind();


        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            DataTable dt = controllerObj.reviews(DropDownList3.Text.ToString());

            GridView4.DataBind();
        }

        protected void Button4_Click(object sender, EventArgs e)
        {

            GridView4.DataBind();
            GridView5.DataBind();


        }

        protected void GridView5_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView4_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            

            GridView2.DataBind();
          
        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DropDownList6_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button9_Click(object sender, EventArgs e)
        {
           

            GridView3.DataBind();
            DropDownList5.DataBind();
        }

        protected void GridView3_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button11_Click(object sender, EventArgs e)
        {
            if (Session["Booking_id"] != null)
            {
                int bi = Convert.ToInt32(Session["Booking_id"].ToString());
                int dt = controllerObj.InsertServiceIntoBooking(DropDownList7.Text.ToString(), bi, DropDownList6.Text.ToString());

            }
        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            if (Session["Booking_id"] != null)
            {
                int bi = Convert.ToInt32(Session["Booking_id"].ToString());
                int dt = controllerObj.InsertOfferIntoBooking(DropDownList8.Text, bi);
            }
            
        }

        protected void Button13_Click(object sender, EventArgs e)
        {

            object bookingid = controllerObj.selectBookingid();
            int id = Convert.ToInt16(bookingid);
            int dt = controllerObj.InsertBooking(DropDownList6.Text, Session["Email"].ToString(), id);
            if (dt != 0)
            {
                Session["Booking_id"] = id.ToString();
            }
        }

        protected void Button12_Click(object sender, EventArgs e)
        {
            if (Session["Booking_id"] != null) { 
            

                int bi = Convert.ToInt32(Session["Booking_id"].ToString());
                string roomtype = RadioButtonList1.SelectedItem.Text;
                int dt = controllerObj.InsertRoomintobooking(bi, DropDownList6.Text, roomtype, Calendar1.SelectedDate, Calendar2.SelectedDate,Session["Email"].ToString());
                if (dt == 0) { Label21.Text = "There is no empty rooms with this type choose another one yay!"; }
                else {
                    Label21.Text = "";
                }
             

            }
        }

        protected void Button10_Click(object sender, EventArgs e)
        {
            if (Session["Booking_id"] != null)
            {
                int bi = Convert.ToInt32(Session["Booking_id"].ToString());
                int dt = controllerObj.InsertTransportationintobooking(Convert.ToInt32(DropDownList5.Text), bi, DropDownList6.Text);
            }

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (Session["Booking_id"] != null)
            {
                Label18.Text = "Your Book has been done! Happy To have you";
                Session.Remove("Booking_id");
            }
            else
            {
                Label18.Text = "You Haven't booked yet.";

            }
            
        }

        protected void GridView6_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DropDownList3_TextChanged(object sender, EventArgs e)
        {
            GridView5.DataBind();
            GridView4.DataBind();
        }

        protected void Chart1_Load(object sender, EventArgs e)
        {

        }

        protected void Button15_Click(object sender, EventArgs e)
        {
            int dt = controllerObj.insertreview(Session["Email"].ToString(), Convert.ToChar(DropDownList9.Text), TextBox1.Text, DropDownList6.Text);
        }
    }
}
