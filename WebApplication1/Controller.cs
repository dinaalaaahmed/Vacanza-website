using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace WebApplication1
{
    public class Controller
    {
        DBManager dbMan;
        public Controller()
        {
            dbMan = new DBManager();
        }


        public void TerminateConnection()
        {
            dbMan.CloseConnection();
        }
        public DataTable ReservationRecords(string hotelname)
        {
            Dictionary<string, object> Parameters = new Dictionary<string, object>();
            Parameters.Add("@hotel_name", hotelname);
            string StoredProcedureName = StoredProcedures.ReservationBooking;
            return dbMan.ExecuteReader(StoredProcedureName, Parameters);

        }
        public DataTable reviews(string hotelname)
        {
            Dictionary<string, object> Parameters = new Dictionary<string, object>();
            Parameters.Add("@Hotelname", hotelname);
            string StoredProcedureName = StoredProcedures.ManagerReviewsForCertainHotel;
            return dbMan.ExecuteReader(StoredProcedureName, Parameters);

        }
        
        public int Deleteservice(string servicename,string hotelname) {

            string StoredProcedureName2 = StoredProcedures.DeleteService;
            Dictionary<string, object> Parameters = new Dictionary<string, object>();
            Parameters.Add("@hotel_name", hotelname);
            Parameters.Add("@serviceName", servicename);
            
            return dbMan.ExecuteNonQuery(StoredProcedureName2, Parameters);

        }
        public int DeleteOFFER(int offer_id, string hotelname)
        {

            string StoredProcedureName2 = StoredProcedures.DeleteOffer;
            Dictionary<string, object> Parameters = new Dictionary<string, object>();
            Parameters.Add("@hotel_name", hotelname);
            Parameters.Add("@offer_id", offer_id);

            return dbMan.ExecuteNonQuery(StoredProcedureName2, Parameters);

        }
        public int DeleteHOTEL(string hotelname)
        {

            string StoredProcedureName2 = StoredProcedures.DeleteHotel;
            Dictionary<string, object> Parameters = new Dictionary<string, object>();
            Parameters.Add("@hotel_name", hotelname);
           

            return dbMan.ExecuteNonQuery(StoredProcedureName2, Parameters);

        }
        public int DeleteROOM(int Roomnum, string hotelname)
        {

            string StoredProcedureName2 = StoredProcedures.DeleteRoom;
            Dictionary<string, object> Parameters = new Dictionary<string, object>();
            Parameters.Add("@hotel_name", hotelname);
            Parameters.Add("@room_num", Roomnum);

            return dbMan.ExecuteNonQuery(StoredProcedureName2, Parameters);

        }
        public int InsertRoom(string Hname, int roomnum, string type, string view,double price)
        {
            
            string StoredProcedureName = StoredProcedures.InsertROOM;
            Dictionary<string, object> Parameters = new Dictionary<string, object>();
            Parameters.Add("@room_num", roomnum);
            Parameters.Add("@HOTELNAME", Hname);
            Parameters.Add("@TYPE", type);
            Parameters.Add("@VIEW", view);
            Parameters.Add("@PRICE", price);
        
            return dbMan.ExecuteNonQuery(StoredProcedureName, Parameters);
        }

        public int insertreview(string email,char rate ,string note,string hotelname) {
 
            string StoredProcedureName2 = StoredProcedures.Insertreview;
            Dictionary<string, object> Parameters = new Dictionary<string, object>();
            Parameters.Add("@email", email);
            Parameters.Add("@note", note);
            Parameters.Add("@rate", rate);
            Parameters.Add("@hotelname", hotelname);
  
            return dbMan.ExecuteNonQuery(StoredProcedureName2, Parameters);


        }
 public int InsertHotel(string Hname, char star, string location, string city_name, string email,string Describtion)
        {

            
            string StoredProcedureName2 = StoredProcedures.InsertHotel;
            Dictionary<string, object> Parameters = new Dictionary<string, object>();
            Parameters.Add("@location", location);
            Parameters.Add("@DESCRIBTION", Describtion);
            Parameters.Add("@email", email);
            Parameters.Add("@city_name", city_name);
            Parameters.Add("@stars", star);
            Parameters.Add("@HOTELNAME", Hname);
            return dbMan.ExecuteNonQuery(StoredProcedureName2, Parameters);
        }

   
    public int InsertService(string servicename,double price, string hotelname)
        {

            
            string StoredProcedureName2 = StoredProcedures.InsertService;
            Dictionary<string, object> Parameters = new Dictionary<string, object>();
            Parameters.Add("@hotel_name", hotelname);
            Parameters.Add("@Service_name", servicename);
            Parameters.Add("@price", price);
            
            return dbMan.ExecuteNonQuery(StoredProcedureName2, Parameters);
        }
        public int InsertOffer(int offerid, string servicname, string hotelname)
        {
           
            string StoredProcedureName2 = StoredProcedures.InsertServiceToOffer;
            Dictionary<string, object> Parameters = new Dictionary<string, object>();
            Parameters.Add("@hotel_name", hotelname);
            Parameters.Add("@offer_id", offerid);
            Parameters.Add("@service_name", servicname);
            return dbMan.ExecuteNonQuery(StoredProcedureName2, Parameters);

            

        }
        public int InsertAnewOffer(int offerid, DateTime Start, DateTime End,int precentage,string hotelname)
        {
            
            string StoredProcedureName2 = StoredProcedures.insertoffer;
            Dictionary<string, object> Parameters = new Dictionary<string, object>();
            Parameters.Add("@hotel_name", hotelname);
            Parameters.Add("@offer_id", offerid);
            Parameters.Add("@start_date", Start);
            Parameters.Add("@End_date",End);
             dbMan.ExecuteNonQuery(StoredProcedureName2, Parameters);
            string StoredProcedureName = StoredProcedures.insertPrecentageToOffer;
            Dictionary<string, object> Parameters1 = new Dictionary<string, object>();
            Parameters1.Add("@offer_id", offerid);
            Parameters1.Add("@precen", precentage);
            return dbMan.ExecuteNonQuery(StoredProcedureName, Parameters1);
        }
        public int updateOfferPrecentage(int offerid ,int precentage) {
            string StoredProcedureName = StoredProcedures.insertPrecentageToOffer;
            Dictionary<string, object> Parameters1 = new Dictionary<string, object>();
            Parameters1.Add("@offer_id", offerid);
            Parameters1.Add("@precen", precentage);
            return  dbMan.ExecuteNonQuery(StoredProcedureName, Parameters1);

           

        }
        public int DeleteServiceFromOffer(int offerid, string servicname, string hotelname)
        {
           
            string StoredProcedureName2 = StoredProcedures.DeleteServiceFromOffer;
            Dictionary<string, object> Parameters = new Dictionary<string, object>();
            Parameters.Add("@hotel_name", hotelname);
            Parameters.Add("@offer_id", offerid);
            Parameters.Add("@service_name", servicname);
            return dbMan.ExecuteNonQuery(StoredProcedureName2, Parameters);



        }

        public int UpdateservicePrice(double price, string name, string hname) {
            string StoredProcedureName = StoredProcedures.EditServicePrice;
            Dictionary<string, object> Parameters1 = new Dictionary<string, object>();
            Parameters1.Add("@hotel_name", hname);
            Parameters1.Add("@price", price);
            Parameters1.Add("@service_name", name); 
            return dbMan.ExecuteNonQuery(StoredProcedureName, Parameters1);


        }
        public int UpdateRoomPrice(double price, string type, string hname)
        {
            
            string StoredProcedureName = StoredProcedures.UpdateRoomPrice;
            Dictionary<string, object> Parameters1 = new Dictionary<string, object>();
            Parameters1.Add("@hotel_name", hname);
            Parameters1.Add("@price", price);
            Parameters1.Add("@type", type);
            return dbMan.ExecuteNonQuery(StoredProcedureName, Parameters1);
        }
        public int InsertTransportation(DateTime date, double time, double price, string meeting, string hotelname,int tripnum) {
            string StoredProcedureName = StoredProcedures.insertTransportation;
            Dictionary<string, object> Parameters1 = new Dictionary<string, object>();
            Parameters1.Add("@hotel_name", hotelname);
            Parameters1.Add("@Date", date);
            Parameters1.Add("@Time", time);
            Parameters1.Add("@PRICE", price);
            Parameters1.Add("@MEETING", meeting);
            Parameters1.Add("@Trip_num", tripnum);
            return dbMan.ExecuteNonQuery(StoredProcedureName, Parameters1);


        }
        
        public int InsertUser(string username , string email, string type, string phone, string creditcard,string pass)
        {
            string StoredProcedureName = StoredProcedures.INSERTUSER;
            Dictionary<string, object> Parameters1 = new Dictionary<string, object>();
            Parameters1.Add("@USER_NAME", username);
            Parameters1.Add("@EMAIL", email);
            Parameters1.Add("@TYPE", type);
            Parameters1.Add("@PHONE", phone);
            Parameters1.Add("@CREDITCARD", creditcard);
            Parameters1.Add("@password", pass);

            return dbMan.ExecuteNonQuery(StoredProcedureName, Parameters1);


        }
        public int HotelProfits(string hotelname,double profits) {
            string StoredProcedureName = StoredProcedures.TotalProfitsForHotel;
            Dictionary<string, object> Parameters1 = new Dictionary<string, object>();
            Parameters1.Add("@Hotel_name", hotelname);
            Parameters1.Add("@TOTALPROFIT", profits);

            return dbMan.ExecuteNonQuery(StoredProcedureName, Parameters1);
        }
        public object SelectPassword(string email,string pass)
        {
            string StoredProcedureName = StoredProcedures.SelectPassword;
            Dictionary<string, object> Parameters1 = new Dictionary<string, object>();
            Parameters1.Add("@EMAIL", email);
            Parameters1.Add("@pass", pass);

            return dbMan.ExecuteScalar(StoredProcedureName, Parameters1);

        }
        public object SelectType(string email)
        {
            string StoredProcedureName = StoredProcedures.SelectTypeByEmail;
            Dictionary<string, object> Parameters1 = new Dictionary<string, object>();
            Parameters1.Add("@EMAIL", email);
            return dbMan.ExecuteScalar(StoredProcedureName, Parameters1);

        }
        public DataTable SelectOffersService(string hotelname)
        {
            string StoredProcedureName = StoredProcedures.INSERTUSER;
            Dictionary<string, object> Parameters1 = new Dictionary<string, object>();
            Parameters1.Add("@hotel_name", hotelname);

            return dbMan.ExecuteReader(StoredProcedureName, Parameters1);

        }
        public DataTable SelectHotelNamesFromCountry(string countryname)
        {
            string StoredProcedureName = StoredProcedures.selectHotelFromCountry;
            Dictionary<string, object> Parameters1 = new Dictionary<string, object>();
            Parameters1.Add("@country_name", countryname);

            return dbMan.ExecuteReader(StoredProcedureName, Parameters1);

        }

        public DataTable SelectHotelNamesFromCity(string cityname)
        {
            string StoredProcedureName = StoredProcedures.selectHotelFromCity;
            Dictionary<string, object> Parameters1 = new Dictionary<string, object>();
            Parameters1.Add("@city_name", cityname);

            return dbMan.ExecuteReader(StoredProcedureName, Parameters1);

        }

        public DataTable SelectHotelinfo(string hotelname)
        {
            string StoredProcedureName = StoredProcedures.SelectHotelInfo;
            Dictionary<string, object> Parameters1 = new Dictionary<string, object>();
            Parameters1.Add("@hotel_name", hotelname);

            return dbMan.ExecuteReader(StoredProcedureName, Parameters1);

        }
        public DataTable SelecthotelTrips(string hotelname)
        {
            string StoredProcedureName = StoredProcedures.INSERTUSER;
            Dictionary<string, object> Parameters1 = new Dictionary<string, object>();
            Parameters1.Add("@hotel_name", hotelname);

            return dbMan.ExecuteReader(StoredProcedureName, Parameters1);

        }
        public int InsertTransportationintobooking(int transnum, int bookingid, string hotelname)
        {
       
            string StoredProcedureName = StoredProcedures.insertTransportationINTOBOOKING;
            Dictionary<string, object> Parameters1 = new Dictionary<string, object>();
            Parameters1.Add("@booking_id", bookingid);
            Parameters1.Add("@trip_num", transnum);
            Parameters1.Add("@hotel_name", hotelname);
            return dbMan.ExecuteNonQuery(StoredProcedureName, Parameters1);

        }
        public int InsertServiceIntoBooking(string servicename, int bookingid, string hotelname)
        {
            string StoredProcedureName2=StoredProcedures.insertserviceintobookingprice;
            string StoredProcedureName = StoredProcedures.InsertServiceintobooking;
            Dictionary<string, object> Parameters1 = new Dictionary<string, object>();
            Parameters1.Add("@ServiceName", servicename);
            Parameters1.Add("@BOOKID", bookingid);
            Parameters1.Add("@hotel_name", hotelname);
             dbMan.ExecuteNonQuery(StoredProcedureName2, Parameters1);
            return dbMan.ExecuteNonQuery(StoredProcedureName, Parameters1);
        }
        public int InsertOfferIntoBooking(string offerid, int bookingid)
        {
  
            Dictionary<string, object> Parameters = new Dictionary<string, object>();
            Parameters.Add("@offer_id", offerid);
            Parameters.Add("@bookingid", bookingid);
            string StoredProcedureName2 = StoredProcedures.InsertPriceToOffer;

            string StoredProcedureName = StoredProcedures.Insertofferintobooking;
            Dictionary<string, object> Parameters1 = new Dictionary<string, object>();
            Parameters1.Add("@OfferID", offerid);
            Parameters1.Add("@bookid", bookingid);
            dbMan.ExecuteNonQuery(StoredProcedureName2, Parameters);
            return dbMan.ExecuteNonQuery(StoredProcedureName, Parameters1);

        }
       
        public int changepass(string email,string phonenum,string newpass) {
            string StoredProcedureName = StoredProcedures.changepass;
            Dictionary<string, object> Parameters1 = new Dictionary<string, object>();
            Parameters1.Add("@phonenum", phonenum);
            Parameters1.Add("@email", email);
            Parameters1.Add("@newpass", newpass);
            return dbMan.ExecuteNonQuery(StoredProcedureName, Parameters1);

        }
        public int InsertRoomintobooking(int bookingid, string hotelname, string roomtype, DateTime start, DateTime end,string email)
        {
         
            string StoredProcedureName = StoredProcedures.book_room;
        Dictionary<string, object> Parameters1 = new Dictionary<string, object>();
            Parameters1.Add("@email", email);
            Parameters1.Add("@bookingid", bookingid);
            Parameters1.Add("@hotelname", hotelname);
            Parameters1.Add("@startdate", start);
            Parameters1.Add("@enddate", end);
            Parameters1.Add("@roomtype", roomtype);
            
            return dbMan.ExecuteNonQuery(StoredProcedureName, Parameters1);

    }

        public int InsertBooking(string hotelname, string email, int bookingid )
        {
            string StoredProcedureName = StoredProcedures.InsertBooking;
            Dictionary<string, object> Parameters1 = new Dictionary<string, object>();
            Parameters1.Add("@email", email);
            Parameters1.Add("@Booking_ID", bookingid);
            Parameters1.Add("@Hotel_name", hotelname);
            return dbMan.ExecuteNonQuery(StoredProcedureName, Parameters1);

        }

        public object numOfhotel_country(int countryID)
        {
            string StoredProcedureName = StoredProcedures.totalnumhotelcountry;
            Dictionary<string, object> Parameters1 = new Dictionary<string, object>();
            Parameters1.Add("@countryid", countryID);
            return dbMan.ExecuteScalar(StoredProcedureName, Parameters1);
        }
        public object numOfhotel_city(int cityID)
        {
            string StoredProcedureName = StoredProcedures.totalnumhotelcity;
            Dictionary<string, object> Parameters1 = new Dictionary<string, object>();
            Parameters1.Add("@cityid", cityID);
            return dbMan.ExecuteScalar(StoredProcedureName, Parameters1);
        }

        public object numOfhotel()
        {
            string StoredProcedureName = StoredProcedures.totalnumhotel;
            Dictionary<string, object> Parameters1 = new Dictionary<string, object>();
            return dbMan.ExecuteScalar(StoredProcedureName, Parameters1);
        }
        public DataTable review(int id)
        {
            string StoredProcedureName = StoredProcedures.review;
            Dictionary<string, object> Parameters1 = new Dictionary<string, object>();
            Parameters1.Add("@hotelid", id);
            return dbMan.ExecuteReader(StoredProcedureName, Parameters1);
        }
        public DataTable userinfo(int id)
        {
            string StoredProcedureName = StoredProcedures.userinfo;
            Dictionary<string, object> Parameters1 = new Dictionary<string, object>();
            Parameters1.Add("@userid", id);
            return dbMan.ExecuteReader(StoredProcedureName, Parameters1);
        }
        public int insertcity(string name, int countryid)
        {
            string StoredProcedureName = StoredProcedures.insertcity;
            Dictionary<string, object> Parameters1 = new Dictionary<string, object>();
            Parameters1.Add("@CITY_NAME", name);
            Parameters1.Add("@COUNTRY_id", countryid);
            return dbMan.ExecuteNonQuery(StoredProcedureName, Parameters1);
        }
        public int insertcountry(string name)
        {
            string StoredProcedureName = StoredProcedures.insertcountry;
            Dictionary<string, object> Parameters1 = new Dictionary<string, object>();
            Parameters1.Add("@COUNTRY_NAME", name);
            return dbMan.ExecuteNonQuery(StoredProcedureName, Parameters1);
        }
        public int makeadmin(string email)
        {
            string StoredProcedureName = StoredProcedures.makeadmin;
            Dictionary<string, object> Parameters1 = new Dictionary<string, object>();
            Parameters1.Add("@useremail", email);
            return dbMan.ExecuteNonQuery(StoredProcedureName, Parameters1);
        }

        public int deletecity(int cityid)
        {
            string StoredProcedureName = StoredProcedures.deletecity;
            Dictionary<string, object> Parameters1 = new Dictionary<string, object>();
            Parameters1.Add("@cityid", cityid);

            return dbMan.ExecuteNonQuery(StoredProcedureName, Parameters1);
        }
        public object selectBookingid(){
            string StoredProcedureName = StoredProcedures.SELECTMAXBOOKING;
            return dbMan.ExecuteScalar(StoredProcedureName, null);

        }
        public int deletecountry(int countryid)
        {
            string StoredProcedureName = StoredProcedures.deletecountry;
            Dictionary<string, object> Parameters1 = new Dictionary<string, object>();
            Parameters1.Add("@countryid ", countryid);
            return dbMan.ExecuteNonQuery(StoredProcedureName, Parameters1);
        }
        public object HotelProfits(string hotelname)
        {
            string StoredProcedureName = StoredProcedures.TotalProfitsForHotel;
            Dictionary<string, object> Parameters1 = new Dictionary<string, object>();
            Parameters1.Add("@Hotel_name", hotelname);


            return dbMan.ExecuteScalar(StoredProcedureName, Parameters1);
        }
        public object HotelProfitsbyid(int id)
        {
            string StoredProcedureName = StoredProcedures.TotalProfitsForHotelid;
            Dictionary<string, object> Parameters1 = new Dictionary<string, object>();
            Parameters1.Add("@Hotel_id", id);


            return dbMan.ExecuteScalar(StoredProcedureName, Parameters1);
        }
        public int deletehotel(int hotelid)
        {
            string StoredProcedureName = StoredProcedures.DeleteHotel1;
            Dictionary<string, object> Parameters1 = new Dictionary<string, object>();
            Parameters1.Add("@hotel_id", hotelid);
            return dbMan.ExecuteNonQuery(StoredProcedureName, Parameters1);
        }
    }
}
