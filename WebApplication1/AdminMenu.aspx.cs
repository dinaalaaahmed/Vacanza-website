using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class AdminMenu : System.Web.UI.Page
    {
        Controller controllerObj;
        string text1_old;
        string text2_old;
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
            text1_old = TextBox1.Text;
            text2_old = TextBox2.Text;

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
    
    

        protected void Button1_Click(object sender, EventArgs e)
        {
            
            text_profit.Text = controllerObj.HotelProfitsbyid(Convert.ToInt32(DropDownList2.SelectedValue)).ToString();
            if (text_profit.Text =="")
            {
                text_profit.Text = "0";
            }
        }

        protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void hotelcountry_Click(object sender, EventArgs e)
        {
          numcountry.Text= controllerObj.numOfhotel_country(Convert.ToInt32(DropDownList4.SelectedValue)).ToString();
        }

        protected void hotelcountry0_Click(object sender, EventArgs e)
        {
            numcity.Text = controllerObj.numOfhotel_city(Convert.ToInt32(DropDownList5.SelectedValue)).ToString();

        }

        protected void totalhotel_Click(object sender, EventArgs e)
        {
            num.Text = controllerObj.numOfhotel().ToString();

        }

        protected void review_Click(object sender, EventArgs e)
        {
            GridView1.DataSource =controllerObj.review(Convert.ToInt32(DropDownList2.SelectedValue));
            GridView1.DataBind();
        }

        protected void userinfo_Click(object sender, EventArgs e)
        {
            GridView1.DataSource = controllerObj.userinfo(Convert.ToInt32(DropDownList3.SelectedValue));
            GridView1.DataBind();

        }

        protected void insertcity_Click(object sender, EventArgs e)
        {
            
            if ((TextBox1.Text != "") )
            {
                int t = controllerObj.insertcity(TextBox1.Text, Convert.ToInt32(DropDownList6.SelectedValue));
                if (t == 0)
                {
                    Label1.Text = "this city is already exist .";
                }
                else
                {
                    Label1.Text = "this city inserts corectly .";
                }
                DropDownList7.DataBind();
                DropDownList6.DataBind();
                DropDownList5.DataBind();
                DropDownList4.DataBind();
                DropDownList3.DataBind();
                DropDownList2.DataBind();   // to make change which happens when delete and insert apeare in other droplists 
                DropDownList11.DataBind();
                DropDownList12.DataBind();
                DropDownList13.DataBind();
            }
            else
            {
                Label1.Text = "You enter missing data !!.";
            }

        }

        protected void insertcountry_Click(object sender, EventArgs e)
        {
            if (TextBox2.Text !="")
            {
                int t = controllerObj.insertcountry(TextBox2.Text);
            if (t == 0)
            {
                Label2.Text = "this country is already exist .";
            }
            else
            {
                Label2.Text = "this country inserts corectly .";
            }
            DropDownList7.DataBind();
            DropDownList6.DataBind();
            DropDownList5.DataBind();
            DropDownList4.DataBind();
            DropDownList3.DataBind();
            DropDownList2.DataBind();
            DropDownList11.DataBind();
            DropDownList12.DataBind();
            DropDownList13.DataBind();
        }
            else
            {
                Label2.Text = "You enter missing data !!.";
            }
}


        protected void adminuser_Click(object sender, EventArgs e)
        {
            int t = controllerObj.makeadmin( DropDownList7.SelectedValue.ToString());
            if (t !=0)
            {
                Label3.Text = "becomes admin .";
            }
   

        }

        protected void DropDownList9_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DropDownList10_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void del_country_Click(object sender, EventArgs e)
        {
            controllerObj.deletecountry(Convert.ToInt32(DropDownList11.SelectedValue));
            DropDownList7.DataBind();
            DropDownList6.DataBind();
            DropDownList5.DataBind();
            DropDownList4.DataBind();
            DropDownList3.DataBind();
            DropDownList2.DataBind();
            DropDownList11.DataBind();
            DropDownList12.DataBind();
            DropDownList13.DataBind();
        }

        protected void DropDownList12_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void del_hotel_Click(object sender, EventArgs e)
        {
            controllerObj.deletehotel(Convert.ToInt32(DropDownList13.SelectedValue));
            DropDownList7.DataBind();
            DropDownList6.DataBind();
            DropDownList5.DataBind();
            DropDownList4.DataBind();
            DropDownList3.DataBind();
            DropDownList2.DataBind();
            DropDownList11.DataBind();
            DropDownList12.DataBind();
            DropDownList13.DataBind();
        }

        protected void delcity_Click(object sender, EventArgs e)
        {
            controllerObj.deletecity(Convert.ToInt32(DropDownList12.SelectedValue));
            DropDownList7.DataBind();
            DropDownList6.DataBind();
            DropDownList5.DataBind();
            DropDownList4.DataBind();
            DropDownList3.DataBind();
            DropDownList2.DataBind();
            DropDownList11.DataBind();
            DropDownList12.DataBind();
            DropDownList13.DataBind();
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click1(object sender, EventArgs e)
        {

        }
    }
}