USE [VACANZAWEBSITE2]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 12/21/2019 17:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Country](
	[Country_id] [int] NOT NULL,
	[Country_name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Country_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Country_name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Country] ([Country_id], [Country_name]) VALUES (1, N'Egypt')
/****** Object:  Table [dbo].[Users]    Script Date: 12/21/2019 17:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[User_id] [int] NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Password] [varchar](16) NOT NULL,
	[Credit_card_num] [varchar](16) NOT NULL,
	[Has_booked_before] [char](1) NULL,
	[Phone_num] [int] NULL,
	[Type] [varchar](16) NOT NULL,
	[User_name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[User_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Phone_num] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Users] ([User_id], [Email], [Password], [Credit_card_num], [Has_booked_before], [Phone_num], [Type], [User_name]) VALUES (1, N'dinaalaaahmed@gmail.com', N'01122338608', N'1234567891011', N'0', 1122338608, N'Manager', N'DinaAlaa')
INSERT [dbo].[Users] ([User_id], [Email], [Password], [Credit_card_num], [Has_booked_before], [Phone_num], [Type], [User_name]) VALUES (2, N'AhmedAlaa@gmail.com', N'01112283714', N'1567891011234', N'0', 1122448608, N'Manager', N'AhmedAlaa')
INSERT [dbo].[Users] ([User_id], [Email], [Password], [Credit_card_num], [Has_booked_before], [Phone_num], [Type], [User_name]) VALUES (3, N'nada.ahmed34@gmail.com', N'01116168995', N'1234567891110', N'0', 1158322330, N'Traveler', N'nadasalem')
INSERT [dbo].[Users] ([User_id], [Email], [Password], [Credit_card_num], [Has_booked_before], [Phone_num], [Type], [User_name]) VALUES (5, N'dinaalaa@gmail.com', N'01122338708', N'1234567891012345', N'0', 1116158993, N'Manager', N'dinaaly')
INSERT [dbo].[Users] ([User_id], [Email], [Password], [Credit_card_num], [Has_booked_before], [Phone_num], [Type], [User_name]) VALUES (6, N'samysaad@gmail.com', N'01116158996', N'123456789103456', N'0', 1122338408, N'Admin', N'Samy Saad')
/****** Object:  StoredProcedure [dbo].[userinfo]    Script Date: 12/21/2019 17:20:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[userinfo]
	-- Add the parameters for the stored procedure here
	@userid integer
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT User_name,Phone_num,Email FROM Users WHERE User_id=@userid;
END
GO
/****** Object:  StoredProcedure [dbo].[SelectTypeByEmail]    Script Date: 12/21/2019 17:20:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectTypeByEmail]
	-- Add the parameters for the stored procedure here
	@EMAIL varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Type FROM Users WHERE Email=@EMAIL;
END
GO
/****** Object:  StoredProcedure [dbo].[SelectPassword]    Script Date: 12/21/2019 17:20:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectPassword]
	-- Add the parameters for the stored procedure here
	@EMAIL varchar(50),
	@pass varchar(50)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    SELECT User_id FROM Users WHERE Email=@EMAIL AND Password=@pass;
	 
END
GO
/****** Object:  StoredProcedure [dbo].[INSERTUSER]    Script Date: 12/21/2019 17:20:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[INSERTUSER] 
	-- Add the parameters for the stored procedure here
	
	@USER_NAME varchar(50),
	@EMAIL VARCHAR(50),
    @TYPE VARCHAR(16),
    @PHONE INTEGER,
    @CREDITCARD varchar(16),
    @password varchar(16)
    
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    declare @USER_ID INTEGER;
    select @USER_ID=MAX(USER_ID)+1 from Users 
    -- Insert statements for procedure here
	insert into Users (User_id,User_name,Password,Phone_num,Type,Credit_card_num,Email)VALUES(@USER_ID,@USER_NAME,@password,@PHONE,@TYPE,@CREDITCARD,@EMAIL);
END
GO
/****** Object:  StoredProcedure [dbo].[INSERTCOUNTRY]    Script Date: 12/21/2019 17:20:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[INSERTCOUNTRY] 
	-- Add the parameters for the stored procedure here
	
	@COUNTRY_NAME VARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
DECLARE @COUNTRY_ID INTEGER;
SELECT @COUNTRY_ID=MAX(Country_id)+1 FROM Country;
    -- Insert statements for procedure here
	INSERT INTO Country (Country_id,Country_name) VALUES (@COUNTRY_ID,@COUNTRY_NAME);
END
GO
/****** Object:  StoredProcedure [dbo].[adduseradmin]    Script Date: 12/21/2019 17:20:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[adduseradmin] 
	@useremail varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   update Users set Users.Type= 'Admin' where Email=@useremail
END
GO
/****** Object:  StoredProcedure [dbo].[deletecountry]    Script Date: 12/21/2019 17:20:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[deletecountry]
	@countryid int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

  delete Country where Country_id=@countryid
END
GO
/****** Object:  Table [dbo].[City]    Script Date: 12/21/2019 17:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[City](
	[City_id] [int] NOT NULL,
	[City_name] [varchar](50) NOT NULL,
	[Country_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[City_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[City_name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[City] ([City_id], [City_name], [Country_id]) VALUES (1, N'Cairo', 1)
/****** Object:  Table [dbo].[Hotel]    Script Date: 12/21/2019 17:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Hotel](
	[Hotel_name] [varchar](50) NOT NULL ,
	[Location] [varchar](50) NOT NULL,
	[Hotel_id] [int] NOT NULL,
	[Describtion] [varchar](50) NULL,
	[Stars] [char](1) NOT NULL,
	[City_id] [int] NULL,
	[MGR_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Hotel_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Hotel_name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Hotel] ([Hotel_name], [Location], [Hotel_id], [Describtion], [Stars], [City_id], [MGR_id]) VALUES (N'PortoMarina', N'23,Cairo ', 1, N'A hotel with a fantastic view and swimming pools', N'5', 1, 1)
INSERT [dbo].[Hotel] ([Hotel_name], [Location], [Hotel_id], [Describtion], [Stars], [City_id], [MGR_id]) VALUES (N'PortoSokhna', N'4,Sokhna', 2, N'A fantastic Resort Hotel with sea view', N'4', 1, 1)
INSERT [dbo].[Hotel] ([Hotel_name], [Location], [Hotel_id], [Describtion], [Stars], [City_id], [MGR_id]) VALUES (N'BaronResortHotel', N'3,Haram', 3, N'A hotel with a sunny view and pools.', N'4', 1, 1)
INSERT [dbo].[Hotel] ([Hotel_name], [Location], [Hotel_id], [Describtion], [Stars], [City_id], [MGR_id]) VALUES (N'Sahl Hashesh Resort', N'5 sahkl,hashesh', 15, N'A hotel with a view ', N'1', 1, 1)
INSERT [dbo].[Hotel] ([Hotel_name], [Location], [Hotel_id], [Describtion], [Stars], [City_id], [MGR_id]) VALUES (N'Haram Hotel', N'2,Haram,near felfela', 16, N'Spa,Gym,pools.', N'5', 1, 1)
INSERT [dbo].[Hotel] ([Hotel_name], [Location], [Hotel_id], [Describtion], [Stars], [City_id], [MGR_id]) VALUES (N'porto san stefano', N'4,near san stefano mall', 17, N'A resort with free breakfast with any room and an ', N'4', 1, 1)
/****** Object:  StoredProcedure [dbo].[deletecity]    Script Date: 12/21/2019 17:20:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[deletecity]
	@cityid int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

  delete city where City_id=@cityid
END
GO
/****** Object:  StoredProcedure [dbo].[INSERTCITY]    Script Date: 12/21/2019 17:20:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[INSERTCITY]
	-- Add the parameters for the stored procedure here
	
	@CITY_NAME varchar(50),
	@COUNTRY_NAME varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
DECLARE @CITY_ID INTEGER;
SELECT @CITY_ID=MAX(City_id)+1 FROM City;
DECLARE @Countryid integer;
SELECT @Countryid=Country_id FROM Country WHERE Country_name=@COUNTRY_NAME;
    -- Insert statements for procedure here
	INSERT INTO City (City_id,City_name,Country_id) VALUES(@CITY_ID,@CITY_NAME,@Countryid)
END
GO
/****** Object:  StoredProcedure [dbo].[INSERTHotel]    Script Date: 12/21/2019 17:20:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[INSERTHotel]
	-- Add the parameters for the stored procedure here
	
	@DESCRIBTION VARCHAR(50),
	@HOTELNAME varchar(50),
	@stars char(1),
	@city_name varchar(50),
	@location varchar(50),
	@mgr_id integer
	
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	
	DECLARE @HOTELID integer;
	DECLARE @City_id integer;
	SELECT @City_id=City_id FROM City WHERE City_name=@city_name;
    SELECT @HOTELID=MAX(Hotel_id)+1 FROM Hotel;
    -- Insert statements for procedure here
	INSERT INTO Hotel (Hotel_name,Hotel_id,Location,MGR_id,Stars,City_id,Describtion)VALUES(@HOTELNAME,@HOTELID,@location,@mgr_id,@stars,@City_id,@DESCRIBTION);
	
END
GO
/****** Object:  StoredProcedure [dbo].[HotelInfo]    Script Date: 12/21/2019 17:20:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[HotelInfo] 
	-- Add the parameters for the stored procedure here
	@hotel_name varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    DECLARE @hotel_id integer;
    SELECT @hotel_id=Hotel_id FROM Hotel WHERE Hotel_name=@hotel_name;
    
    -- Insert statements for procedure here
	SELECT Describtion,Location,Stars,City_name FROM Hotel H,City C WHERE Hotel_id=@hotel_id AND C.City_id=H.City_id AND Hotel_name=@hotel_name;
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteHotel]    Script Date: 12/21/2019 17:20:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteHotel]
	-- Add the parameters for the stored procedure here
	@hotel_name varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
   
    -- Insert statements for procedure here
	Delete FROM Hotel WHERE Hotel_name=@hotel_name;
END
GO
/****** Object:  Table [dbo].[Offer]    Script Date: 12/21/2019 17:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Offer](
	[room_type] [int] NULL,
	[Offer_id] [int] NOT NULL,
	[offer_price] [float] NULL,
	[Offer_Start_date] [date] NULL,
	[Offer_End_date] [date] NULL,
	[Hotel_id] [int] NOT NULL,
	[PRECENTAGE] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Offer_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Offer] ([room_type], [Offer_id], [offer_price], [Offer_Start_date], [Offer_End_date], [Hotel_id], [PRECENTAGE]) VALUES (NULL, 1, 20.24, CAST(0x79400B00 AS Date), NULL, 1, 5)
INSERT [dbo].[Offer] ([room_type], [Offer_id], [offer_price], [Offer_Start_date], [Offer_End_date], [Hotel_id], [PRECENTAGE]) VALUES (NULL, 2, NULL, CAST(0xEA410B00 AS Date), CAST(0x57430B00 AS Date), 3, 6)
INSERT [dbo].[Offer] ([room_type], [Offer_id], [offer_price], [Offer_Start_date], [Offer_End_date], [Hotel_id], [PRECENTAGE]) VALUES (NULL, 3, 20.24, CAST(0x87400B00 AS Date), CAST(0x8C400B00 AS Date), 1, 8)
INSERT [dbo].[Offer] ([room_type], [Offer_id], [offer_price], [Offer_Start_date], [Offer_End_date], [Hotel_id], [PRECENTAGE]) VALUES (NULL, 5, 20.24, CAST(0x8F400B00 AS Date), CAST(0x72400B00 AS Date), 1, 3)
INSERT [dbo].[Offer] ([room_type], [Offer_id], [offer_price], [Offer_Start_date], [Offer_End_date], [Hotel_id], [PRECENTAGE]) VALUES (NULL, 7, 20.24, CAST(0x86400B00 AS Date), CAST(0x86400B00 AS Date), 1, 9)
INSERT [dbo].[Offer] ([room_type], [Offer_id], [offer_price], [Offer_Start_date], [Offer_End_date], [Hotel_id], [PRECENTAGE]) VALUES (NULL, 9, 20.24, CAST(0x8A400B00 AS Date), CAST(0x87400B00 AS Date), 1, 6)
INSERT [dbo].[Offer] ([room_type], [Offer_id], [offer_price], [Offer_Start_date], [Offer_End_date], [Hotel_id], [PRECENTAGE]) VALUES (NULL, 11, NULL, CAST(0xA6400B00 AS Date), CAST(0x8C400B00 AS Date), 1, 9)
/****** Object:  StoredProcedure [dbo].[NumOfHotelscountry]    Script Date: 12/21/2019 17:20:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[NumOfHotelscountry]
	@countryid int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   select COUNT(*) from Hotel,city where city.city_id=hotel.city_id and Country_id=@countryid
END
GO
/****** Object:  StoredProcedure [dbo].[NumOfHotelscity]    Script Date: 12/21/2019 17:20:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[NumOfHotelscity]
	@cityid int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   select COUNT(*) from Hotel where City_id=@cityid
END
GO
/****** Object:  StoredProcedure [dbo].[NumOfHotels]    Script Date: 12/21/2019 17:20:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[NumOfHotels] 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   select COUNT(*) from Hotel
END
GO
/****** Object:  StoredProcedure [dbo].[SelectHotelNamesFromSpecificCity]    Script Date: 12/21/2019 17:20:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectHotelNamesFromSpecificCity] 
	-- Add the parameters for the stored procedure here
	@city_name varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Hotel_name FROM Hotel AS H WHERE H.City_id=(SELECT C.City_id FROM City AS C WHERE City_name=@city_name);
END
GO
/****** Object:  StoredProcedure [dbo].[SelectHotelNamesFromCountry]    Script Date: 12/21/2019 17:20:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectHotelNamesFromCountry]
	-- Add the parameters for the stored procedure here
	@country_name varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	 SELECT Hotel_name FROM Hotel WHERE City_id IN(SELECT City_id FROM City AS Ci ,Country AS Co WHERE Ci.Country_id=Co.Country_id AND Country_name=@country_name)
END
GO
/****** Object:  StoredProcedure [dbo].[SelectHotelNamesForUser]    Script Date: 12/21/2019 17:20:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectHotelNamesForUser]
	-- Add the parameters for the stored procedure here
	@Email varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Hotel_name FROM Hotel,Users WHERE MGR_id=User_id AND User_id IN(SELECT User_id FROM Users WHERE Email=@Email)
END
GO
/****** Object:  Table [dbo].[ROOM]    Script Date: 12/21/2019 17:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ROOM](
	[View] [varchar](50) NULL,
	[TYPE] [varchar](50) NOT NULL,
	[Room_num] [int] NOT NULL,
	[Room_price] [float] NOT NULL,
	[Hotel_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Room_num] ASC,
	[Hotel_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[ROOM] ([View], [TYPE], [Room_num], [Room_price], [Hotel_id]) VALUES (N'Sea', N'Single', 1, 150, 1)
INSERT [dbo].[ROOM] ([View], [TYPE], [Room_num], [Room_price], [Hotel_id]) VALUES (N'On Sea', N'Multiple', 2, 22, 1)
INSERT [dbo].[ROOM] ([View], [TYPE], [Room_num], [Room_price], [Hotel_id]) VALUES (N'On Sea', N'Multiple', 3, 22, 1)
INSERT [dbo].[ROOM] ([View], [TYPE], [Room_num], [Room_price], [Hotel_id]) VALUES (NULL, N'Single', 3, 70, 3)
INSERT [dbo].[ROOM] ([View], [TYPE], [Room_num], [Room_price], [Hotel_id]) VALUES (N'On Sea', N'Multiple', 4, 22, 1)
INSERT [dbo].[ROOM] ([View], [TYPE], [Room_num], [Room_price], [Hotel_id]) VALUES (NULL, N'Single', 4, 68, 3)
INSERT [dbo].[ROOM] ([View], [TYPE], [Room_num], [Room_price], [Hotel_id]) VALUES (N'on sea', N'Single', 21, 67, 1)
INSERT [dbo].[ROOM] ([View], [TYPE], [Room_num], [Room_price], [Hotel_id]) VALUES (N'on sea', N'Single', 22, 67, 1)
INSERT [dbo].[ROOM] ([View], [TYPE], [Room_num], [Room_price], [Hotel_id]) VALUES (N'on sea', N'Single', 23, 67, 1)
INSERT [dbo].[ROOM] ([View], [TYPE], [Room_num], [Room_price], [Hotel_id]) VALUES (N'on sea', N'Single', 24, 67, 1)
INSERT [dbo].[ROOM] ([View], [TYPE], [Room_num], [Room_price], [Hotel_id]) VALUES (N'on sea', N'Single', 25, 67, 1)
INSERT [dbo].[ROOM] ([View], [TYPE], [Room_num], [Room_price], [Hotel_id]) VALUES (N'on sea', N'Single', 26, 67, 1)
INSERT [dbo].[ROOM] ([View], [TYPE], [Room_num], [Room_price], [Hotel_id]) VALUES (N'on sea', N'Single', 27, 67, 1)
INSERT [dbo].[ROOM] ([View], [TYPE], [Room_num], [Room_price], [Hotel_id]) VALUES (N'on sea', N'Single', 28, 67, 1)
INSERT [dbo].[ROOM] ([View], [TYPE], [Room_num], [Room_price], [Hotel_id]) VALUES (N'on sea', N'Single', 29, 67, 1)
/****** Object:  Table [dbo].[Review]    Script Date: 12/21/2019 17:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Review](
	[Hotel_id] [int] NOT NULL,
	[User_id] [int] NOT NULL,
	[NOTE] [varchar](50) NULL,
	[RATE] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[Hotel_id] ASC,
	[User_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Review] ([Hotel_id], [User_id], [NOTE], [RATE]) VALUES (1, 1, N'Fantastic', N'5')
/****** Object:  Table [dbo].[Service]    Script Date: 12/21/2019 17:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Service](
	[Service_name] [varchar](50) NOT NULL,
	[Service_price] [float] NOT NULL,
	[Hotel_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Service_name] ASC,
	[Hotel_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Service] ([Service_name], [Service_price], [Hotel_id]) VALUES (N'Bikes', 24, 1)
INSERT [dbo].[Service] ([Service_name], [Service_price], [Hotel_id]) VALUES (N'Break fast', 22, 1)
INSERT [dbo].[Service] ([Service_name], [Service_price], [Hotel_id]) VALUES (N'Dinner', 35, 1)
INSERT [dbo].[Service] ([Service_name], [Service_price], [Hotel_id]) VALUES (N'Gem', 120, 3)
INSERT [dbo].[Service] ([Service_name], [Service_price], [Hotel_id]) VALUES (N'Launch', 30, 1)
INSERT [dbo].[Service] ([Service_name], [Service_price], [Hotel_id]) VALUES (N'Room Service', 100, 1)
INSERT [dbo].[Service] ([Service_name], [Service_price], [Hotel_id]) VALUES (N'SkiDiving', 100, 1)
INSERT [dbo].[Service] ([Service_name], [Service_price], [Hotel_id]) VALUES (N'spa', 100, 1)
/****** Object:  Table [dbo].[Transportation]    Script Date: 12/21/2019 17:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Transportation](
	[Trans_price] [float] NULL,
	[Date] [date] NOT NULL,
	[Time_hour] [float] NOT NULL,
	[Meeting_point] [varchar](50) NOT NULL,
	[Trip_num] [int] NOT NULL,
	[Hotel_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Trip_num] ASC,
	[Hotel_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Transportation] ([Trans_price], [Date], [Time_hour], [Meeting_point], [Trip_num], [Hotel_id]) VALUES (70, CAST(0x76400B00 AS Date), 15, N'5st,maadi', 1, 1)
INSERT [dbo].[Transportation] ([Trans_price], [Date], [Time_hour], [Meeting_point], [Trip_num], [Hotel_id]) VALUES (125, CAST(0x7C400B00 AS Date), 22, N'2st,Giza', 2, 1)
INSERT [dbo].[Transportation] ([Trans_price], [Date], [Time_hour], [Meeting_point], [Trip_num], [Hotel_id]) VALUES (130, CAST(0x81400B00 AS Date), 12, N'MoezStreet', 3, 1)
INSERT [dbo].[Transportation] ([Trans_price], [Date], [Time_hour], [Meeting_point], [Trip_num], [Hotel_id]) VALUES (128, CAST(0x83400B00 AS Date), 12.5, N'EL nasr st', 4, 1)
INSERT [dbo].[Transportation] ([Trans_price], [Date], [Time_hour], [Meeting_point], [Trip_num], [Hotel_id]) VALUES (128, CAST(0x83400B00 AS Date), 12.5, N'EL nasr st', 5, 1)
INSERT [dbo].[Transportation] ([Trans_price], [Date], [Time_hour], [Meeting_point], [Trip_num], [Hotel_id]) VALUES (124, CAST(0x82400B00 AS Date), 12.5, N'horya square', 7, 1)
INSERT [dbo].[Transportation] ([Trans_price], [Date], [Time_hour], [Meeting_point], [Trip_num], [Hotel_id]) VALUES (123, CAST(0x7C400B00 AS Date), 12, N'maadi', 10, 3)
/****** Object:  StoredProcedure [dbo].[SelectTransportationInfo]    Script Date: 12/21/2019 17:20:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectTransportationInfo] 
	-- Add the parameters for the stored procedure here
	@hotel_name varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Trip_num,Meeting_point,Date,Time_hour As Time,Trans_price AS Price from Transportation where Hotel_id =(select Hotel_id from Hotel where Hotel_name=@hotel_name);
END
GO
/****** Object:  StoredProcedure [dbo].[SelectTransNum]    Script Date: 12/21/2019 17:20:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectTransNum]
	-- Add the parameters for the stored procedure here
	@hotel_name varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Trip_num from Transportation where Hotel_id =(select Hotel_id from Hotel where Hotel_name=@hotel_name);
END
GO
/****** Object:  StoredProcedure [dbo].[SelectService]    Script Date: 12/21/2019 17:20:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectService]
	-- Add the parameters for the stored procedure here
	@hotel_name varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    DECLARE @hotel_id integer
    SELECT @hotel_id=Hotel_id FROM Hotel WHERE Hotel_name=@hotel_name;
    SELECT Service_name FROM Service WHERE Hotel_id=@hotel_id;
    -- Insert statements for procedure here
	
END
GO
/****** Object:  Table [dbo].[Offer_Services]    Script Date: 12/21/2019 17:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Offer_Services](
	[offer_id] [int] NOT NULL,
	[Service_name] [varchar](50) NOT NULL,
	[Hotel_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[offer_id] ASC,
	[Service_name] ASC,
	[Hotel_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Offer_Services] ([offer_id], [Service_name], [Hotel_id]) VALUES (1, N'Break fast', 1)
INSERT [dbo].[Offer_Services] ([offer_id], [Service_name], [Hotel_id]) VALUES (1, N'Dinner', 1)
INSERT [dbo].[Offer_Services] ([offer_id], [Service_name], [Hotel_id]) VALUES (1, N'Launch', 1)
INSERT [dbo].[Offer_Services] ([offer_id], [Service_name], [Hotel_id]) VALUES (1, N'SkiDiving', 1)
INSERT [dbo].[Offer_Services] ([offer_id], [Service_name], [Hotel_id]) VALUES (2, N'Gem', 3)
INSERT [dbo].[Offer_Services] ([offer_id], [Service_name], [Hotel_id]) VALUES (3, N'Break fast', 1)
INSERT [dbo].[Offer_Services] ([offer_id], [Service_name], [Hotel_id]) VALUES (7, N'spa', 1)
/****** Object:  StoredProcedure [dbo].[ManagerReviewsForCertainHotel]    Script Date: 12/21/2019 17:20:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ManagerReviewsForCertainHotel]
	-- Add the parameters for the stored procedure here
	@Hotelname varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT NOTE,RATE ,User_name FROM Review AS R,Users AS U WHERE Hotel_id IN (SELECT Hotel_id FROM Hotel WHERE Hotel_name=@Hotelname)AND R.User_id=U.User_id;
END
GO
/****** Object:  StoredProcedure [dbo].[SelectOffersid]    Script Date: 12/21/2019 17:20:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectOffersid] 
	-- Add the parameters for the stored procedure here
@hotel_name varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
DECLARE @HOTEL_id integer;
   SELECT @HOTEL_id=Hotel_id FROM Hotel WHERE Hotel_name=@hotel_name
    -- Insert statements for procedure here
	SELECT Offer_id FROM Offer WHERE Hotel_id=@HOTEL_id;
END
GO
/****** Object:  StoredProcedure [dbo].[InsertService]    Script Date: 12/21/2019 17:20:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertService]
	-- Add the parameters for the stored procedure here
	@Service_name varchar(50),
	@hotel_name varchar(50),
	@price float
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
   DECLARE @HOTEL_id integer;
   SELECT @HOTEL_id=Hotel_id FROM Hotel WHERE Hotel_name=@hotel_name
    -- Insert statements for procedure here
	INSERT INTO Service(Hotel_id,Service_name,Service_price) VALUES(@HOTEL_id,@Service_name,@price);
END
GO
/****** Object:  StoredProcedure [dbo].[INSERTROOMS]    Script Date: 12/21/2019 17:20:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[INSERTROOMS]
	-- Add the parameters for the stored procedure here
	@room_num INTEGER,
	@HOTELNAME varchar(50),
	@TYPE varchar(50),
	@VIEW varchar(50),
	@PRICE FLOAT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  DECLARE @HOTEL_ID INTEGER;
  SELECT @HOTEL_ID=Hotel_id FROM Hotel WHERE Hotel_name=@HOTELNAME
  
    -- Insert statements for procedure here
	INSERT INTO ROOM (Room_num,Room_price,[TYPE],[View],Hotel_id) VALUES(@room_num,@PRICE,@TYPE,@VIEW,@HOTEL_ID);
END
GO
/****** Object:  StoredProcedure [dbo].[insertTransportation]    Script Date: 12/21/2019 17:20:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[insertTransportation]
	-- Add the parameters for the stored procedure here
	@hotel_name varchar(50),
	@Date DATE,
	@Time FLOAT,
	@PRICE FLOAT,
	@MEETING varchar(50),
	@Trip_num integer
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @HOTELID INT;
    SELECT @HOTELID=Hotel_id FROM Hotel WHERE Hotel_name=@hotel_name;
	
    
    -- Insert statements for procedure here
	INSERT INTO Transportation (Hotel_id,Meeting_point,Date,Time_hour,Trans_price,Trip_num)VALUES(@HOTELID,@MEETING,@Date,@Time,@PRICE,@Trip_num);
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteService]    Script Date: 12/21/2019 17:20:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteService]
	-- Add the parameters for the stored procedure here
	@serviceName varchar(50),
	@hotel_name varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    DECLARE @hotel_id integer
    SELECT @hotel_id=Hotel_id FROM Hotel WHERE Hotel_name=@hotel_name;
    -- Insert statements for procedure here
	Delete FROM Service WHERE Service_name=@serviceName AND Hotel_id=@hotel_id;
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteRoom]    Script Date: 12/21/2019 17:20:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteRoom] 
	-- Add the parameters for the stored procedure here
	@hotel_name varchar(50),
	@room_num integer
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    DECLARE @hotel_id integer;
    SELECT @hotel_id=Hotel_id FROM Hotel WHERE Hotel_name=@hotel_name;
    -- Insert statements for procedure here
    DELETE FROM ROOM WHERE Room_num=@room_num AND Hotel_id=@hotel_id;
	
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteOffer]    Script Date: 12/21/2019 17:20:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteOffer]
	-- Add the parameters for the stored procedure here
	 @hotel_name varchar(50),
	 @offer_id integer
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    DECLARE @hotel_id integer;
    SELECT @hotel_id=Hotel_id FROM Hotel WHERE Hotel_name=@hotel_name;
    -- Insert statements for procedure here
	DELETE FROM Offer WHERE Offer_id=@offer_id AND Hotel_id=@hotel_id;
END
GO
/****** Object:  StoredProcedure [dbo].[adminReviewsForCertainHotel]    Script Date: 12/21/2019 17:20:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--/****** Object:  StoredProcedure [dbo].[INSERTCITY]    Script Date: 12/20/2019 5:05:30 PM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
---- =============================================
---- Author:		<Author,,Name>
---- Create date: <Create Date,,>
---- Description:	<Description,,>
---- =============================================
--ALTER PROCEDURE [dbo].[INSERTCITY]
--	-- Add the parameters for the stored procedure here
	
--	@CITY_NAME varchar(50),
--	@COUNTRY_id int
--AS
--BEGIN
--	-- SET NOCOUNT ON added to prevent extra result sets from
--	-- interfering with SELECT statements.
--	SET NOCOUNT ON;
--DECLARE @CITY_ID INTEGER;
--SELECT @CITY_ID=MAX(City_id)+1 FROM City;
--    -- Insert statements for procedure here
--	INSERT INTO City (City_id,City_name,Country_id) VALUES(@CITY_ID,@CITY_NAME,@COUNTRY_id)
--END

--SET ANSI_NULLS ON
--go
--USE [VACANZAWEBSITE2]
--GO

--/****** Object:  StoredProcedure [dbo].[adminReviewsForCertainHotel]    Script Date: 12/20/2019 5:08:02 PM ******/
--SET ANSI_NULLS ON
--GO

--SET QUOTED_IDENTIFIER ON
--GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[adminReviewsForCertainHotel]
	-- Add the parameters for the stored procedure here
	@Hotelid int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT User_name ,NOTE,RATE  FROM Review AS R,Users AS U WHERE Hotel_id IN (SELECT Hotel_id FROM Hotel WHERE Hotel_id=@Hotelid)AND R.User_id=U.User_id;
END
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[AddReview]    Script Date: 12/21/2019 17:20:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[AddReview]
	-- Add the parameters for the stored procedure here
	@Rate char(1),
	@Note varchar(50),
	@USER_ID INTEGER,
	@HOTEL_NAME VARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @hotel_id integer;
	SELECT @hotel_id=Hotel_id FROM Hotel WHERE Hotel_name=@HOTEL_NAME;
INSERT INTO Review (RATE,NOTE,User_id,Hotel_id)VALUES(@Rate,@Note,@USER_ID,@hotel_id);
    -- Insert statements for procedure here
	
END
GO
/****** Object:  StoredProcedure [dbo].[insertPrecentageToOffer]    Script Date: 12/21/2019 17:20:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[insertPrecentageToOffer]
	-- Add the parameters for the stored procedure here
	@offer_id integer,@precen int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE Offer SET PRECENTAGE=@precen WHERE Offer_id=@offer_id;
END
GO
/****** Object:  StoredProcedure [dbo].[insertoffer]    Script Date: 12/21/2019 17:20:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[insertoffer] 
	-- Add the parameters for the stored procedure here
	@offer_id integer,
	@start_date DATE,
	@End_date DATE,
	@hotel_name varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
   DECLARE @HOTEL_id integer;
   SELECT @HOTEL_id=Hotel_id FROM Hotel WHERE Hotel_name=@hotel_name
    -- Insert statements for procedure here
	INSERT INTO Offer (Offer_id,Offer_Start_date,Offer_End_date,Hotel_id)VALUES(@offer_id,@start_date,@End_date,@HOTEL_id);
END
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 12/21/2019 17:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking](
	[Transportation_trip] [int] NULL,
	[Booking_id] [int] NOT NULL,
	[Hotel_id] [int] NULL,
	[User_id] [int] NOT NULL,
	[TotalBookingPrice] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[Booking_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Booking_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Booking] ([Transportation_trip], [Booking_id], [Hotel_id], [User_id], [TotalBookingPrice]) VALUES (4, 1, 1, 3, NULL)
INSERT [dbo].[Booking] ([Transportation_trip], [Booking_id], [Hotel_id], [User_id], [TotalBookingPrice]) VALUES (NULL, 2, NULL, 3, NULL)
INSERT [dbo].[Booking] ([Transportation_trip], [Booking_id], [Hotel_id], [User_id], [TotalBookingPrice]) VALUES (NULL, 3, NULL, 3, NULL)
INSERT [dbo].[Booking] ([Transportation_trip], [Booking_id], [Hotel_id], [User_id], [TotalBookingPrice]) VALUES (NULL, 4, 1, 3, NULL)
INSERT [dbo].[Booking] ([Transportation_trip], [Booking_id], [Hotel_id], [User_id], [TotalBookingPrice]) VALUES (NULL, 5, 3, 3, NULL)
INSERT [dbo].[Booking] ([Transportation_trip], [Booking_id], [Hotel_id], [User_id], [TotalBookingPrice]) VALUES (NULL, 6, 3, 3, NULL)
INSERT [dbo].[Booking] ([Transportation_trip], [Booking_id], [Hotel_id], [User_id], [TotalBookingPrice]) VALUES (NULL, 7, 3, 3, NULL)
INSERT [dbo].[Booking] ([Transportation_trip], [Booking_id], [Hotel_id], [User_id], [TotalBookingPrice]) VALUES (NULL, 8, 3, 3, NULL)
INSERT [dbo].[Booking] ([Transportation_trip], [Booking_id], [Hotel_id], [User_id], [TotalBookingPrice]) VALUES (NULL, 9, 3, 3, NULL)
INSERT [dbo].[Booking] ([Transportation_trip], [Booking_id], [Hotel_id], [User_id], [TotalBookingPrice]) VALUES (NULL, 10, 1, 3, NULL)
INSERT [dbo].[Booking] ([Transportation_trip], [Booking_id], [Hotel_id], [User_id], [TotalBookingPrice]) VALUES (NULL, 11, 15, 3, NULL)
INSERT [dbo].[Booking] ([Transportation_trip], [Booking_id], [Hotel_id], [User_id], [TotalBookingPrice]) VALUES (NULL, 12, 3, 3, NULL)
INSERT [dbo].[Booking] ([Transportation_trip], [Booking_id], [Hotel_id], [User_id], [TotalBookingPrice]) VALUES (NULL, 13, 1, 3, NULL)
INSERT [dbo].[Booking] ([Transportation_trip], [Booking_id], [Hotel_id], [User_id], [TotalBookingPrice]) VALUES (NULL, 14, 1, 3, NULL)
INSERT [dbo].[Booking] ([Transportation_trip], [Booking_id], [Hotel_id], [User_id], [TotalBookingPrice]) VALUES (NULL, 15, 1, 3, NULL)
INSERT [dbo].[Booking] ([Transportation_trip], [Booking_id], [Hotel_id], [User_id], [TotalBookingPrice]) VALUES (NULL, 16, 3, 3, NULL)
INSERT [dbo].[Booking] ([Transportation_trip], [Booking_id], [Hotel_id], [User_id], [TotalBookingPrice]) VALUES (NULL, 17, 1, 3, NULL)
INSERT [dbo].[Booking] ([Transportation_trip], [Booking_id], [Hotel_id], [User_id], [TotalBookingPrice]) VALUES (NULL, 18, 3, 3, NULL)
INSERT [dbo].[Booking] ([Transportation_trip], [Booking_id], [Hotel_id], [User_id], [TotalBookingPrice]) VALUES (NULL, 19, 3, 3, NULL)
INSERT [dbo].[Booking] ([Transportation_trip], [Booking_id], [Hotel_id], [User_id], [TotalBookingPrice]) VALUES (NULL, 20, 3, 3, NULL)
INSERT [dbo].[Booking] ([Transportation_trip], [Booking_id], [Hotel_id], [User_id], [TotalBookingPrice]) VALUES (NULL, 21, 3, 3, NULL)
INSERT [dbo].[Booking] ([Transportation_trip], [Booking_id], [Hotel_id], [User_id], [TotalBookingPrice]) VALUES (NULL, 22, 3, 3, NULL)
INSERT [dbo].[Booking] ([Transportation_trip], [Booking_id], [Hotel_id], [User_id], [TotalBookingPrice]) VALUES (NULL, 23, 3, 3, NULL)
INSERT [dbo].[Booking] ([Transportation_trip], [Booking_id], [Hotel_id], [User_id], [TotalBookingPrice]) VALUES (NULL, 24, 3, 3, NULL)
/****** Object:  StoredProcedure [dbo].[EditServicePrice]    Script Date: 12/21/2019 17:20:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[EditServicePrice] 
	-- Add the parameters for the stored procedure here

@price float,
@service_name varchar(50),
@hotel_name varchar(50)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

UPDATE Service SET Service_price=@price WHERE(Service_name=@service_name AND Hotel_id =(select Hotel_id from Hotel WHERE Hotel_name=@hotel_name));
    -- Insert statements for procedure here
	
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateRoomPrice]    Script Date: 12/21/2019 17:20:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateRoomPrice]
	-- Add the parameters for the stored procedure here
	@price float,
	@type varchar(50),
	@hotel_name varchar(50)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE ROOM SET Room_price=@price WHERE TYPE=@type AND Hotel_id =(SELECT Hotel_id FROM Hotel WHERE Hotel_name=@hotel_name);
END
GO
/****** Object:  StoredProcedure [dbo].[offersServices]    Script Date: 12/21/2019 17:20:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[offersServices]
	-- Add the parameters for the stored procedure here
	@hotel_name varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	 DECLARE @hotel_id integer;
    SELECT @hotel_id=Hotel_id FROM Hotel WHERE Hotel_name=@hotel_name;

    -- Insert statements for procedure here
	
	SELECT O.Offer_id, Service_name FROM Offer_Services OS,Offer O WHERE O.Offer_id=OS.offer_id AND O.Offer_id IN(SELECT offer_id FROM Offer_Services WHERE  Hotel_id=@hotel_id )
	
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteServiceFromOffer]    Script Date: 12/21/2019 17:20:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteServiceFromOffer]
	-- Add the parameters for the stored procedure here
	@service_name varchar(50),
	@hotel_name varchar(50),
	@offer_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    DECLARE @hotel_id integer;
    SELECT @hotel_id=Hotel_id FROM Hotel WHERE Hotel_name=@hotel_name;
    -- Insert statements for procedure here
	DELETE FROM Offer_Services WHERE Hotel_id=@hotel_id AND Service_name=@service_name AND offer_id=@offer_id;
END
GO
/****** Object:  Table [dbo].[Booked_services]    Script Date: 12/21/2019 17:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Booked_services](
	[Booking_id] [int] NOT NULL,
	[Service_name] [varchar](50) NOT NULL,
	[Hotel_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Booking_id] ASC,
	[Service_name] ASC,
	[Hotel_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Booked_services] ([Booking_id], [Service_name], [Hotel_id]) VALUES (19, N'Gem', 3)
INSERT [dbo].[Booked_services] ([Booking_id], [Service_name], [Hotel_id]) VALUES (23, N'Gem', 3)
/****** Object:  Table [dbo].[Booked_room]    Script Date: 12/21/2019 17:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booked_room](
	[Booking_id] [int] NOT NULL,
	[Room_number] [int] NOT NULL,
	[Hotel_id] [int] NOT NULL,
	[Start_date] [date] NOT NULL,
	[End_date] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Booking_id] ASC,
	[Room_number] ASC,
	[Hotel_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Booked_room] ([Booking_id], [Room_number], [Hotel_id], [Start_date], [End_date]) VALUES (1, 1, 1, CAST(0x7C400B00 AS Date), CAST(0x94400B00 AS Date))
INSERT [dbo].[Booked_room] ([Booking_id], [Room_number], [Hotel_id], [Start_date], [End_date]) VALUES (1, 4, 1, CAST(0x8E400B00 AS Date), CAST(0x84400B00 AS Date))
INSERT [dbo].[Booked_room] ([Booking_id], [Room_number], [Hotel_id], [Start_date], [End_date]) VALUES (19, 3, 3, CAST(0xF3230B00 AS Date), CAST(0xF3230B00 AS Date))
INSERT [dbo].[Booked_room] ([Booking_id], [Room_number], [Hotel_id], [Start_date], [End_date]) VALUES (20, 3, 3, CAST(0x8B400B00 AS Date), CAST(0x8F400B00 AS Date))
INSERT [dbo].[Booked_room] ([Booking_id], [Room_number], [Hotel_id], [Start_date], [End_date]) VALUES (21, 3, 3, CAST(0x88400B00 AS Date), CAST(0x89400B00 AS Date))
INSERT [dbo].[Booked_room] ([Booking_id], [Room_number], [Hotel_id], [Start_date], [End_date]) VALUES (22, 3, 3, CAST(0x8E400B00 AS Date), CAST(0x8F400B00 AS Date))
/****** Object:  Table [dbo].[booked_offers]    Script Date: 12/21/2019 17:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[booked_offers](
	[book_id] [int] NOT NULL,
	[offer_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[book_id] ASC,
	[offer_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[booked_offers] ([book_id], [offer_id]) VALUES (21, 2)
INSERT [dbo].[booked_offers] ([book_id], [offer_id]) VALUES (23, 2)
/****** Object:  StoredProcedure [dbo].[InsertBooking]    Script Date: 12/21/2019 17:20:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertBooking]
	-- Add the parameters for the stored procedure here

@Hotel_name varchar(50),
@Booking_ID INTEGER ,
@email varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
SET NOCOUNT ON;
DECLARE @User_ID int
 DECLARE @hotelid int;
 SELECT @hotelid=Hotel_id FROM Hotel WHERE Hotel_name=@Hotel_name;
    -- Insert statements for procedure here
 SELECT @User_ID=User_id FROM Users WHERE  Email=@email


 INSERT INTO Booking 
 (Booking_id,Hotel_id,User_id)
 VALUES
 (@Booking_ID,@hotelid,@User_ID)

END
GO
/****** Object:  StoredProcedure [dbo].[InsertTransportationIntoBooking]    Script Date: 12/21/2019 17:20:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertTransportationIntoBooking] 
	-- Add the parameters for the stored procedure here
	@booking_id integer,
	@trip_num integer,
	@hotel_name varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	declare @hotelid integer;
	select @hotelid=Hotel_id from Hotel where Hotel_name=@hotel_name
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update Booking set Transportation_trip=@trip_num where Booking_id=@booking_id;
	update Booking set Hotel_id=@hotelid where Booking_id=@booking_id;
END
GO
/****** Object:  StoredProcedure [dbo].[insertServiceToOffer]    Script Date: 12/21/2019 17:20:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[insertServiceToOffer]
	-- Add the parameters for the stored procedure here
	@offer_id integer,
	@service_name varchar(50),
	@hotel_name varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
   DECLARE @HOTEL_id integer;
   SELECT @HOTEL_id=Hotel_id FROM Hotel WHERE Hotel_name=@hotel_name
    -- Insert statements for procedure here
	insert into Offer_Services (offer_id,Hotel_id,Service_name)values(@offer_id,@HOTEL_id,@service_name);
END
GO
/****** Object:  StoredProcedure [dbo].[insertserviceintobooking]    Script Date: 12/21/2019 17:20:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[insertserviceintobooking]
	-- Add the parameters for the stored procedure here
	@ServiceName varchar(50),@BOOKID int,@hotel_name varchar(50)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
DECLARE @HotelID INTEGER
SELECT @HotelID=Hotel_id FROM Hotel WHERE Hotel_name=@hotel_name;
    -- Insert statements for procedure here
	update Booking set TotalBookingPrice+=(select Service_price from Service s where s.Hotel_id=@HotelID and s.Service_name=@ServiceName)where Booking_id=@BOOKID;
END
GO
/****** Object:  StoredProcedure [dbo].[SELECTMAXBOOKING]    Script Date: 12/21/2019 17:20:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SELECTMAXBOOKING]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT MAX(Booking_id)+1 FROM Booking
END
GO
/****** Object:  StoredProcedure [dbo].[InsertPriceToOffer]    Script Date: 12/21/2019 17:20:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertPriceToOffer] 
	-- Add the parameters for the stored procedure here
@offer_id integer,@bookingid integer

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @PRICE FLOAT;
	DECLARE @PRECENTAGE integer;
 SELECT @PRECENTAGE=PRECENTAGE FROM Offer WHERE Offer_id=@offer_id;
 SELECT @PRICE= SUM(Service_price) FROM Service AS S  WHERE EXISTS( SELECT*FROM Offer_Services AS O WHERE O.offer_id=@offer_id AND S.Service_name=O.Service_name AND S.Hotel_id=O.Hotel_id)
    -- Insert statements for procedure here
  UPDATE Booking SET TotalBookingPrice+=(@PRICE*(100-@PRECENTAGE)/100.0) WHERE Booking_id=@bookingid
END
GO
/****** Object:  StoredProcedure [dbo].[TotalProfitsForHotel]    Script Date: 12/21/2019 17:20:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[TotalProfitsForHotel]
	-- Add the parameters for the stored procedure here
	@Hotel_name varchar(50) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
   select sum(TotalBookingPrice)  from Booking where Booking_id in (select distinct Booking_id from Booked_room ,hotel where booked_room.Hotel_id=hotel.Hotel_id and Hotel_name=@hotel_name)
END

SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[ReservationBooking]    Script Date: 12/21/2019 17:20:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ReservationBooking]
	-- Add the parameters for the stored procedure here
	
	@hotel_name varchar(50),
	@email varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    DECLARE @hotel_id integer;
    SELECT @hotel_id=Hotel_id FROM Hotel WHERE Hotel_name=@hotel_name;
    
    -- Insert statements for procedure here
	select u.User_name ,u.Phone_num,b.Transportation_trip,b.TotalBookingPrice,br.Start_date,br.Room_number,bo.offer_id,bs.Service_name from Users u,Booking b,Booked_room br,booked_offers bo,Booked_services bs
	where u.Email=@email and b.User_id=u.User_id and b.Booking_id=bo.book_id and b.Booking_id =bs.Booking_id and b.Booking_id=br.Booking_id and br.Hotel_id=@hotel_id;
END
GO
/****** Object:  StoredProcedure [dbo].[numOfHotelGuests]    Script Date: 12/21/2019 17:20:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[numOfHotelGuests] 
	@hotelid int 
AS
BEGIN
	select count(*) from booking 
	where Booking_id in (select Booking_id from booked_room where Hotel_id =@hotelid)
	
END
GO
/****** Object:  StoredProcedure [dbo].[insertRoomOffer]    Script Date: 12/21/2019 17:20:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[insertRoomOffer] 
	-- Add the parameters for the stored procedure here
@bookid int,
@OfferID int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	INSERT INTO booked_offers
	(book_id,Offer_id)
	VALUES
	(@bookid,@OfferID)
	END
GO
/****** Object:  StoredProcedure [dbo].[Insertroombooking]    Script Date: 12/21/2019 17:20:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Insertroombooking] 
	-- Add the parameters for the stored procedure here
@StartDate date,
@Roomnum int,
@hotelname varchar(50),
@BookID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
DECLARE @HotelID INTEGER
SELECT @HotelID=Hotel_id FROM Hotel WHERE Hotel_name=@hotelname;
    -- Insert statements for procedure here
	insert into Booked_room (Hotel_id,Start_date,Room_number,Booking_id)values(@HotelID,@StartDate,@Roomnum,@BookID)
END
GO
/****** Object:  StoredProcedure [dbo].[insertBookedSevices]    Script Date: 12/21/2019 17:20:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[insertBookedSevices] 
	-- Add the parameters for the stored procedure here
@BOOKID INTEGER,
@ServiceName varchar(50),
@hotel_name varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

DECLARE @HotelID INTEGER
SELECT @HotelID=Hotel_id FROM Hotel WHERE Hotel_name=@hotel_name;
    -- Insert statements for procedure here
INSERT INTO Booked_services
(Booking_id,Service_name,Hotel_id)
VALUES
(@BookID,@ServiceName,@HotelID)

END
GO
/****** Object:  StoredProcedure [dbo].[insertBooked_room]    Script Date: 12/21/2019 17:20:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[insertBooked_room]
	-- Add the parameters for the stored procedure here
@StartDate date,
@TypeRoom varchar(50),
@hotelname varchar(50),
@date date
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here

DECLARE @RoomID INTEGER	
DECLARE @HotelID INTEGER
SELECT @HotelID=Hotel_id FROM Hotel WHERE Hotel_name=@hotelname;
SELECT @RoomID=MIN(Room_num) FROM ROOM r left outer join Booked_room br on br.Room_number=r.Room_num where br.Hotel_id=r.Hotel_id and r.Hotel_id=@HotelID and r.TYPE=@TypeRoom and r.Room_num not in(select Room_num from Booked_room b where b.Hotel_id=@HotelID and Start_date=@date) ;




END
GO
/****** Object:  Default [DF_Booking_TotalBookingPrice]    Script Date: 12/21/2019 17:20:38 ******/
ALTER TABLE [dbo].[Booking] ADD  CONSTRAINT [DF_Booking_TotalBookingPrice]  DEFAULT ((0)) FOR [TotalBookingPrice]
GO
/****** Object:  Default [DF__Review__RATE__46E78A0C]    Script Date: 12/21/2019 17:20:38 ******/
ALTER TABLE [dbo].[Review] ADD  DEFAULT ((5)) FOR [RATE]
GO
/****** Object:  Default [DF__Users__Has_booke__15502E78]    Script Date: 12/21/2019 17:20:38 ******/
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((0)) FOR [Has_booked_before]
GO
/****** Object:  ForeignKey [FK__booked_of__book___37703C52]    Script Date: 12/21/2019 17:20:38 ******/
ALTER TABLE [dbo].[booked_offers]  WITH CHECK ADD FOREIGN KEY([book_id])
REFERENCES [dbo].[Booking] ([Booking_id])
GO
/****** Object:  ForeignKey [FK__booked_of__offer__367C1819]    Script Date: 12/21/2019 17:20:38 ******/
ALTER TABLE [dbo].[booked_offers]  WITH CHECK ADD FOREIGN KEY([offer_id])
REFERENCES [dbo].[Offer] ([Offer_id])
GO
/****** Object:  ForeignKey [FK__Booked_ro__Booki__4D94879B]    Script Date: 12/21/2019 17:20:38 ******/
ALTER TABLE [dbo].[Booked_room]  WITH CHECK ADD FOREIGN KEY([Booking_id])
REFERENCES [dbo].[Booking] ([Booking_id])
GO
/****** Object:  ForeignKey [FK__Booked_room__4E88ABD4]    Script Date: 12/21/2019 17:20:38 ******/
ALTER TABLE [dbo].[Booked_room]  WITH CHECK ADD FOREIGN KEY([Room_number], [Hotel_id])
REFERENCES [dbo].[ROOM] ([Room_num], [Hotel_id])
GO
/****** Object:  ForeignKey [FK__Booked_se__Booki__5441852A]    Script Date: 12/21/2019 17:20:38 ******/
ALTER TABLE [dbo].[Booked_services]  WITH CHECK ADD FOREIGN KEY([Booking_id])
REFERENCES [dbo].[Booking] ([Booking_id])
GO
/****** Object:  ForeignKey [FK__Booked_services__534D60F1]    Script Date: 12/21/2019 17:20:38 ******/
ALTER TABLE [dbo].[Booked_services]  WITH CHECK ADD FOREIGN KEY([Service_name], [Hotel_id])
REFERENCES [dbo].[Service] ([Service_name], [Hotel_id])
GO
/****** Object:  ForeignKey [FK__Booking__276EDEB3]    Script Date: 12/21/2019 17:20:38 ******/
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD FOREIGN KEY([Transportation_trip], [Hotel_id])
REFERENCES [dbo].[Transportation] ([Trip_num], [Hotel_id])
GO
/****** Object:  ForeignKey [FK__Booking__User_id__286302EC]    Script Date: 12/21/2019 17:20:38 ******/
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD FOREIGN KEY([User_id])
REFERENCES [dbo].[Users] ([User_id])
GO
/****** Object:  ForeignKey [FK__City__Country_id__0AD2A005]    Script Date: 12/21/2019 17:20:38 ******/
ALTER TABLE [dbo].[City]  WITH CHECK ADD FOREIGN KEY([Country_id])
REFERENCES [dbo].[Country] ([Country_id])
GO
/****** Object:  ForeignKey [FK__Hotel__City_id__1A14E395]    Script Date: 12/21/2019 17:20:38 ******/
ALTER TABLE [dbo].[Hotel]  WITH CHECK ADD FOREIGN KEY([City_id])
REFERENCES [dbo].[City] ([City_id])
GO
/****** Object:  ForeignKey [FK__Hotel__MGR_id__1B0907CE]    Script Date: 12/21/2019 17:20:38 ******/
ALTER TABLE [dbo].[Hotel]  WITH CHECK ADD FOREIGN KEY([MGR_id])
REFERENCES [dbo].[Users] ([User_id])
GO
/****** Object:  ForeignKey [FK__Offer__Hotel_id__2D27B809]    Script Date: 12/21/2019 17:20:38 ******/
ALTER TABLE [dbo].[Offer]  WITH CHECK ADD FOREIGN KEY([Hotel_id])
REFERENCES [dbo].[Hotel] ([Hotel_id])
GO
/****** Object:  ForeignKey [FK__Offer_Ser__offer__4222D4EF]    Script Date: 12/21/2019 17:20:38 ******/
ALTER TABLE [dbo].[Offer_Services]  WITH CHECK ADD FOREIGN KEY([offer_id])
REFERENCES [dbo].[Offer] ([Offer_id])
GO
/****** Object:  ForeignKey [FK__Offer_Services__412EB0B6]    Script Date: 12/21/2019 17:20:38 ******/
ALTER TABLE [dbo].[Offer_Services]  WITH CHECK ADD FOREIGN KEY([Service_name], [Hotel_id])
REFERENCES [dbo].[Service] ([Service_name], [Hotel_id])
GO
/****** Object:  ForeignKey [FK__Review__Hotel_id__47DBAE45]    Script Date: 12/21/2019 17:20:38 ******/
ALTER TABLE [dbo].[Review]  WITH CHECK ADD FOREIGN KEY([Hotel_id])
REFERENCES [dbo].[Hotel] ([Hotel_id])
GO
/****** Object:  ForeignKey [FK__Review__User_id__48CFD27E]    Script Date: 12/21/2019 17:20:38 ******/
ALTER TABLE [dbo].[Review]  WITH CHECK ADD FOREIGN KEY([User_id])
REFERENCES [dbo].[Users] ([User_id])
GO
/****** Object:  ForeignKey [FK__ROOM__Hotel_id__36B12243]    Script Date: 12/21/2019 17:20:38 ******/
ALTER TABLE [dbo].[ROOM]  WITH CHECK ADD FOREIGN KEY([Hotel_id])
REFERENCES [dbo].[Hotel] ([Hotel_id])
GO
/****** Object:  ForeignKey [FK__Service__Hotel_i__31EC6D26]    Script Date: 12/21/2019 17:20:38 ******/
ALTER TABLE [dbo].[Service]  WITH CHECK ADD FOREIGN KEY([Hotel_id])
REFERENCES [dbo].[Hotel] ([Hotel_id])
GO
/****** Object:  ForeignKey [FK__Transport__Hotel__1FCDBCEB]    Script Date: 12/21/2019 17:20:38 ******/
ALTER TABLE [dbo].[Transportation]  WITH CHECK ADD FOREIGN KEY([Hotel_id])
REFERENCES [dbo].[Hotel] ([Hotel_id])
GO
