using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1
{
    public class StoredProcedures
    {

        public static string changepass = "ChangePass";
        public static string book_room = "book_room";
        public static string SELECTMAXBOOKING = "SELECTMAXBOOKING";
        //TRAVELER
        public static string Insertreview = "nsertreview";
        public static string insertserviceintobookingprice = "insertserviceintobooking";
        public static string Insertroombooking = "Insertroombooking";
        public static string InsertBooking = "InsertBooking";
        public static string Insertofferintobooking = "insertRoomOffer";
        public static string insertTransportationINTOBOOKING = "insertbookedtransportation";
        public static string InsertServiceintobooking = "insertBookedSevices";
        public static string selectHotelFromCity = "SelectHotelNamesFromSpecificCity";
        public static string selectHotelFromCountry = "SelectHotelNamesFromCountry";
        public static string SelectHotelInfo = "HotelInfo";
        public static string Insertroomintobooking = "insertBooked_room";
        //MANAGER
        public static string InsertTransportation = "insertTransportation";
        public static string DeleteServiceFromOffer = "DeleteServiceFromOffer";
        public static string DeleteHotel = "DeleteHotel";
        public static string DeleteHotel1= "DeleteHotel1";
        public static string DeleteOffer = "DeleteOffer";
        public static string DeleteRoom = "DeleteRoom";
        public static string DeleteService = "DeleteService";
        public static string InsertPriceToOffer = "InsertPriceToOffer";
        public static string ReservationBooking = "ReservationBooking";
        public static string SelectTypeByEmail = "SelectTypeByEmail";
        public static string SelectPassword = "SelectPassword";
        public static string InsertROOM = "INSERTROOMS";
        public static string InsertHotel = "INSERTHotel";
        public static string InsertService = "InsertService";
        public static string InsertServiceToOffer = "insertServiceToOffer";
        public static string insertoffer = "insertoffer";
        public static string insertPrecentageToOffer= "insertPrecentageToOffer";
        public static string EditServicePrice = "EditServicePrice";
        public static string UpdateRoomPrice = "UpdateRoomPrice";
        public static string insertTransportation = "insertTransportation";
        public static string TotalProfitsForHotel = "TotalProfitsForHotel";
        public static string INSERTUSER = "INSERTUSER";
        public static string ManagerReviewsForCertainHotel = "ManagerReviewsForCertainHotel";

        //Admin
        public static string TotalProfitsForHotelid = "TotalProfitsForHotelbyid";
        public static string totalnumhotelcountry = "NumOfHotelscountry";
        public static string totalnumhotelcity = "NumOfHotelscity";
        public static string totalnumhotel = "NumOfHotels";
        public static string userinfo = "userinfo";
        public static string hotelguests = "numOfHotelGuests";
        public static string review = "adminReviewsForCertainHotel";
        public static string makeadmin = "adduseradmin";
        public static string insertcity = "INSERTCITY";
        public static string insertcountry = "INSERTCOUNTRY";
        public static string deletecity = "deletecity";
        public static string deletecountry = "deletecountry";
     

    }
}