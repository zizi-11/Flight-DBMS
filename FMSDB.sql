CREATE DATABASE FMSDB;
USE FMSDB;

CREATE TABLE Seat (
    SeatID VARCHAR(100) NOT NULL PRIMARY KEY,
    CabinOrClass VARCHAR(100) NOT NULL
    
	
);
INSERT INTO Seat (SeatID, CabinOrClass)
VALUES('1A','Economy'),
	  ('1B','PremiumEconomy'),
      ('1C','Business'),
	  ('1D','First'),
      ('1E','First'),
	  ('1F','Business'),
      ('2A','Economy'),
	  ('2B','Economy'),
      ('2C','Economy'),
	  ('2D','PremiumEconomy'),
      ('2E','Business'),
	  ('2F','Economy'),
      ('3A','PremiumEconomy'),
	  ('3B','PremiumEconomy'),
      ('3C','PremiumEconomy'),
	  ('3D','Business'),
      ('3E','Economy'),
	  ('3F','First'),
      ('4A','First'),
      ('4B','Economy'),
	('4C','Business'),
      ('4D','Economy'),
	  ('4E','Business'),
      ('4F','First');
      
	CREATE TABLE Company (
    Company_ID VARCHAR(10) PRIMARY KEY NOT NULL,
    Company_name VARCHAR(100),
    Company_phone VARCHAR(15),
    Company_location VARCHAR(200)
);

CREATE TABLE Flight (
    Flight_ID INT PRIMARY KEY,
    Flight_Date DATE,
    Arrival TIME,
    Departure TIME,
    Destination_From VARCHAR(100),
    Destination_To VARCHAR(100),
    Company_ID VARCHAR(10),
    FOREIGN KEY (Company_ID) REFERENCES Company(Company_ID)
        ON UPDATE CASCADE
        ON DELETE SET NULL
);

INSERT INTO Company VALUES
('C001', 'SkyJet Airways', '1234567890', 'Dubai, UAE'),
('C002', 'FalconFly', '9876543210', 'Muscat, Oman'),
('C003', 'AirNova', '5551234567', 'Doha, Qatar'),
('C004', 'CloudLine', '4449876543', 'Riyadh, Saudi Arabia'),
('C005', 'JetStream', '3332221111', 'Cairo, Egypt'),
('C006', 'EagleWings', '7778889999', 'Amman, Jordan'),
('C007', 'BlueSky Travel', '6665554444', 'Beirut, Lebanon'),
('C008', 'StarAir', '1112223333', 'Istanbul, Turkey'),
('C009', 'OrbitFly', '9998887777', 'Tehran, Iran'),
('C010', 'Sunrise Airlines', '8887776666', 'Baghdad, Iraq'),
('C011', 'DesertJet', '2223334444', 'Abu Dhabi, UAE'),
('C012', 'OceanAir', '3334445555', 'Manama, Bahrain'),
('C013', 'SkyBridge', '4445556666', 'Kuwait City, Kuwait'),
('C014', 'AirVista', '5556667777', 'Damascus, Syria'),
('C015', 'FlyZone', '6667778888', 'Khartoum, Sudan'),
('C016', 'JetFalcon', '7778889990', 'Tunis, Tunisia'),
('C017', 'AirOasis', '8889990001', 'Tripoli, Libya'),
('C018', 'CloudJet', '9990001112', 'Algiers, Algeria'),
('C019', 'FlyArabia', '0001112223', 'Jeddah, Saudi Arabia'),
('C020', 'SkyExpress', '1112223334', 'Sana’a, Yemen');


INSERT INTO Flight VALUES
(1001, '2025-11-15', '08:30:00', '06:00:00', 'Muscat', 'Dubai', 'C001'),
(1002, '2025-11-16', '14:45:00', '12:30:00', 'Doha', 'Riyadh', 'C002'),
(1003, '2025-11-17', '19:00:00', '16:45:00', 'Cairo', 'Amman', 'C003'),
(1004, '2025-11-18', '11:15:00', '09:00:00', 'Beirut', 'Istanbul', 'C004'),
(1005, '2025-11-19', '22:30:00', '20:15:00', 'Tehran', 'Baghdad', 'C005'),
(1006, '2025-11-20', '07:00:00', '04:45:00', 'Abu Dhabi', 'Manama', 'C006'),
(1007, '2025-11-21', '13:20:00', '11:00:00', 'Kuwait City', 'Damascus', 'C007'),
(1008, '2025-11-22', '17:45:00', '15:30:00', 'Khartoum', 'Tunis', 'C008'),
(1009, '2025-11-23', '10:10:00', '08:00:00', 'Tripoli', 'Algiers', 'C009'),
(1010, '2025-11-24', '21:30:00', '19:15:00', 'Jeddah', 'Sana’a', 'C010'),
(1011, '2025-11-25', '06:45:00', '04:30:00', 'Dubai', 'Muscat', 'C011'),
(1012, '2025-11-26', '12:00:00', '09:45:00', 'Riyadh', 'Doha', 'C012'),
(1013, '2025-11-27', '18:15:00', '16:00:00', 'Amman', 'Cairo', 'C013'),
(1014, '2025-11-28', '09:30:00', '07:15:00', 'Istanbul', 'Beirut', 'C014'),
(1015, '2025-11-29', '23:00:00', '20:45:00', 'Baghdad', 'Tehran', 'C015'),
(1016, '2025-11-30', '08:20:00', '06:00:00', 'Manama', 'Abu Dhabi', 'C016'),
(1017, '2025-12-01', '14:00:00', '11:45:00', 'Damascus', 'Kuwait City', 'C017'),
(1018, '2025-12-02', '19:30:00', '17:15:00', 'Tunis', 'Khartoum', 'C018'),
(1019, '2025-12-03', '11:10:00', '09:00:00', 'Algiers', 'Tripoli', 'C019'),
(1020, '2025-12-04', '20:45:00', '18:30:00', 'Sana’a', 'Jeddah', 'C020');
      
CREATE TABLE price (
    PriceID VARCHAR(100) NOT NULL PRIMARY KEY,
    CabinOrClassPrice DECIMAL NOT NULL,
    Currency VARCHAR(100) NOT NULL,
    
	SeatID VARCHAR(100),
    CONSTRAINT fk_theseatid
    FOREIGN KEY (SeatID)
    REFERENCES Seat(SeatID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    
    Flight_ID INT,
    CONSTRAINT fk_flightid
    FOREIGN KEY (Flight_ID)
    REFERENCES Flight(Flight_ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

INSERT INTO price (Flight_ID, SeatID, PriceID, CabinOrClassPrice, Currency)
VALUES
(1001, '1A','P001',  350.00, 'USD'),
(1001, '1B','P002',  700.00, 'USD'),
(1001, '1C','P003', 1250.00, 'USD'),
(1001, '1D','P004', 2400.00, 'USD'),
(1001, '1E','P005', 2350.00, 'USD'),
(1001, '1F','P006', 1200.00, 'USD'),
(1001, '2A','P007',  340.00, 'USD'),
(1001, '2B','P008',  330.00, 'USD'),
(1001, '2C','P009',  320.00, 'USD'),
(1001, '2D','P0010', 680.00, 'USD'),
(1001, '2E','P0011',1150.00, 'USD'),
(1001, '2F','P0012', 310.00, 'USD'),
(1001, '3A','P0013', 690.00, 'USD'),
(1001, '3B','P0014', 685.00, 'USD'),
(1001, '3C','P0015', 675.00, 'USD'),
(1001, '3D','P0016',1180.00, 'USD'),
(1001, '3E','P0017', 300.00, 'USD'),
(1001, '3F','P0018',2300.00, 'USD'),
(1001, '4A','P0019',2250.00, 'USD'),
(1001, '4B','P0020', 295.00, 'USD'),
(1001, '4C','P0021',1100.00, 'USD'),
(1001, '4D','P0022', 285.00, 'USD'),
(1001, '4E','P0023',1090.00, 'USD'),
(1001, '4F','P0024',2200.00, 'USD'),
(1002, '1A','P101',  350.00, 'USD'),
(1002, '1B','P102',  700.00, 'USD'),
(1002, '1C','P103', 1250.00, 'USD'),
(1002, '1D','P104', 2400.00, 'USD'),
(1002, '1E','P105', 2350.00, 'USD'),
(1002, '1F','P106', 1200.00, 'USD'),
(1002, '2A','P107',  340.00, 'USD'),
(1002, '2B','P108',  330.00, 'USD');

CREATE TABLE Payment (
    Payment_ID INT PRIMARY KEY,
    Payment_Method VARCHAR(100) NOT NULL,
    Status VARCHAR(100) NOT NULL
);

CREATE TABLE Passenger (
    Passenger_Passport_ID VARCHAR(25)  PRIMARY KEY,
    Passenger_Civil_ID VARCHAR(100),
    Passenger_Name VARCHAR(100),
    Passenger_Phone VARCHAR(15),
    Date_Of_Birth DATE,
    Gender VARCHAR(25),
    Nationality VARCHAR(35)

);

INSERT INTO Payment ( Payment_ID, Payment_Method, Status)
 VALUES (1, 'Credit Card', 'Completed'),
	    (2, 'PayPal', 'Pending'),
        (3, 'Debit Card', 'Completed'),
		(4, 'Cash', 'Completed'),
        (5, 'Credit Card', 'Failed'),
        (6, 'PayPal', 'Completed'),
		(7, 'Credit Card', 'Completed'),
        (8, 'Bank Transfer', 'Pending'),
        (9, 'Credit Card', 'Completed'),
	    (10, 'PayPal','Completed'),
        (11, 'Debit Card', 'Completed'),
        (12, 'Cash', 'Completed'),
	    (13, 'Credit Card', 'Completed'),
        (14, 'PayPal', 'Pending'),
        (15, 'Debit Card', 'Completed'),
	    (16, 'Cash', 'Completed'),
        (17, 'Credit Card', 'Completed'),
		(18, 'PayPal', 'Completed'),
		(19, 'Bank Transfer', 'Failed'),
		(20, 'Credit Card', 'Completed'),
		(21, 'PayPal', 'Completed'),
		(22, 'Debit Card', 'Completed'),
		(23, 'Cash', 'Completed'),
		(24, 'Credit Card', 'Pending'),
        (25, 'Credit Card', 'Completed'),
	    (26, 'PayPal', 'Pending'),
        (27, 'Debit Card', 'Completed'),
		(28, 'Cash', 'Completed'),
        (29, 'Credit Card', 'Failed'),
        (30, 'PayPal', 'Completed'),
		(31, 'Credit Card', 'Completed'),
        (32, 'Bank Transfer', 'Pending');
        
        
        
        INSERT INTO Passenger ( Passenger_Passport_ID, Passenger_Civil_ID, Passenger_Name, Passenger_Phone, Date_Of_Birth, Gender, Nationality) 
VALUES ('P1234567A', '123456789012', 'Ahmed Ali', 50123456, '1985-05-15', 'Male', 'Egyptian'),
		('P2345678B', '234567890123', 'Fatima Zahra', 50234567, '1990-09-21', 'Female', 'Saudi'),
		('P3456789C', '345678901234', 'Mohammed Khalid', 50345678, '1978-11-30', 'Male', 'Emirati'),
		('P4567890D', '456789012345', 'Noor Al-Huda', 50456789, '2001-03-10', 'Female', 'Kuwaiti'),
		('P5678901E', '567890123456', 'Yousef Ibrahim', 50567890, '1965-07-04', 'Male', 'Omani'),
		('P6789012F', '678901234567', 'Maryam Ahmed', 50678901, '1994-12-19', 'Female', 'Bahraini'),
		('P7890123G', '789012345678', 'Abdullah Nasser', 50789012, '1988-08-25', 'Male', 'Qatari'),
		('P8901234H', '890123456789', 'Laila Murad', 50890123, '2005-01-01', 'Female', 'Lebanese'),
		('P9012345I', '901234567890', 'Khalid Mahmoud', 50901234, '1972-04-14', 'Male', 'Jordanian'),
		('P0123456J', '012345678901', 'Sara Hassan', 50012345, '1998-06-29', 'Female', 'Palestinian'),
		('P1122334K', '112233445566', 'Imran Younis', 50112233, '1981-10-11', 'Male', 'Iraqi'),
		('P2233445L', '223344556677', 'Hind Al-Qahtani', 50223344, '1992-02-08', 'Female', 'Saudi'),
		('P3344556M', '334455667788', 'Ali Al-Salem', 50334455, '1975-07-22', 'Male', 'Kuwaiti'),
		('P4455667N', '445566778899', 'Maha Al-Abdullah', 5044566, '2003-09-03', 'Female', 'Emirati'),
		('P5566778O', '556677889900', 'Saeed Al-Kathiri', 50556677, '1969-12-05', 'Male', 'Omani'),
		('P6677889P', '667788990011', 'Alaa Mahmoud', 50667788, '1996-01-27', 'Female', 'Egyptian'),
		('P7788990Q', '778899001122', 'Yasser Al-Qadi', 50778899, '1983-04-09', 'Male', 'Jordanian'),
		('P8899001R', '889900112233', 'Reem Al-Ali', 50889900, '2000-06-16', 'Female', 'Lebanese'),
		('P9900112S', '990011223344', 'Fahad Al-Marzooqi', 50990011, '1971-11-23', 'Male', 'Qatari'),
		('P0011223T', '001122334455', 'Jamila Bouhamed', 50001122, '1991-08-12', 'Female', 'Bahraini'),
		('P1020304U', '102030405060', 'Hassan Al-Ajmi', 50102030, '1986-02-18', 'Male', 'Saudi'),
		('P2030405V', '203040506070', 'Aisha Farouk', 50203040, '1999-05-07', 'Female', 'Egyptian'),
		('P3040506W', '304050607080', 'Majid Abdullah', 50304050, '1979-03-26', 'Male', 'Emirati'),
		('P4050607X', '405060708090', 'Haifa Yousef', 50405060, '1995-10-31', 'Female', 'Kuwaiti');
        
        
alter table Passenger add Age int ;

update Passenger
SET Age = year(CURDATE()) - year(Date_Of_Birth);



CREATE TABLE Booking (
    BookingID VARCHAR(100) NOT NULL PRIMARY KEY,
    BookingStatus VARCHAR(100) NOT NULL,
    
    Payment_ID INT,
    CONSTRAINT fk_pay_id
    FOREIGN KEY (Payment_ID)
    REFERENCES Payment(Payment_ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    
    Flight_ID INT,
    CONSTRAINT fk_flyid
    FOREIGN KEY (Flight_ID)
    REFERENCES Flight(Flight_ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    
    SeatID VARCHAR(100),
    CONSTRAINT fk_seatid
    FOREIGN KEY (SeatID)
    REFERENCES Seat(SeatID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    
	Passenger_Passport_ID VARCHAR(100),
    CONSTRAINT fk_passt_id
    FOREIGN KEY (Passenger_Passport_ID)
    REFERENCES Passenger(Passenger_Passport_ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    
    priceid VARCHAR(100),
    CONSTRAINT fk_priceid
    FOREIGN KEY (priceid)
    REFERENCES price(priceid)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);     




INSERT INTO Booking 
(BookingID, BookingStatus, Payment_ID, Flight_ID, SeatID, Passenger_Passport_ID, PriceID) 
VALUES
('B001', 'Finished',  1, 1001, '1A', 'P1234567A', 'P001'),
('B002', 'Pending',    2, 1001, '1B', 'P2345678B', 'P002'),
('B003', 'Finished',  3, 1001, '1C', 'P3456789C', 'P003'),
('B004', 'Finished',  4, 1001, '1D', 'P4567890D', 'P004'),
('B005', 'Cancelled', 5, 1001, '1E', 'P5678901E', 'P005'),
('B006', 'Finished',  6, 1001, '1F', 'P6789012F', 'P006'),
('B007', 'Finished',  7, 1001, '2A', 'P7890123G', 'P007'),
('B008', 'Pending',    8, 1001, '2B', 'P8901234H', 'P008'),
('B009', 'Finished',  9, 1001, '2C', 'P9012345I', 'P009'),
('B010', 'Finished', 10, 1001, '2D', 'P0123456J', 'P0010'),
('B011', 'Finished', 11, 1001, '2E', 'P1122334K', 'P0011'),
('B012', 'Finished', 12, 1001, '2F', 'P2233445L', 'P0012'),
('B013', 'Finished', 13, 1001, '3A', 'P3344556M', 'P0013'),
('B014', 'Pending',   14, 1001, '3B', 'P4455667N', 'P0014'),
('B015', 'Finished', 15, 1001, '3C', 'P5566778O', 'P0015'),
('B016', 'Finished', 16, 1001, '3D', 'P6677889P', 'P0016'),
('B017', 'Finished', 17, 1001, '3E', 'P7788990Q', 'P0017'),
('B018', 'Finished', 18, 1001, '3F', 'P8899001R', 'P0018'),
('B019', 'Cancelled', 19, 1001, '4A', 'P9900112S', 'P0019'),
('B020', 'Finished', 20, 1001, '4B', 'P0011223T', 'P0020'),
('B021', 'Finished', 21, 1001, '4C', 'P1020304U', 'P0021'),
('B022', 'Finished', 22, 1001, '4D', 'P2030405V', 'P0022'),
('B023', 'Finished', 23, 1001, '4E', 'P3040506W', 'P0023'),
('B024', 'Pending',   24, 1001, '4F', 'P4050607X', 'P0024'),
('B025', 'Finished',  25, 1002, '1A', 'P5566778O', 'P101'),
('B026', 'Pending',   26, 1002, '1B', 'P6677889P', 'P102'),
('B027', 'Finished',  27, 1002, '1C', 'P7788990Q', 'P103'),
('B028', 'Finished',  28, 1002, '1D', 'P8899001R', 'P104'),
('B029', 'Cancelled', 29, 1002, '1E', 'P9900112S', 'P105'),
('B030', 'Finished',  30, 1002, '1F', 'P0011223T', 'P106'),
('B031', 'Finished',  31, 1002, '2A', 'P1020304U', 'P107'),
('B032', 'Pending',   32, 1002, '2B', 'P2030405V', 'P108')
;

alter table Payment add Total int ;

UPDATE Payment p
JOIN Booking b ON p.Payment_ID = b.Payment_ID
JOIN price pr ON b.PriceID = pr.PriceID
SET p.Total = (pr.CabinOrClassPrice * 1.05) + 20;

CREATE TABLE Seat_Status_Per_Flight (
    Flight_ID INT,
    SeatID VARCHAR(100),
    Seat_Status VARCHAR(50)
);

INSERT INTO Seat_Status_Per_Flight (Flight_ID, SeatID, Seat_Status)
SELECT 
    f.Flight_ID,
    s.SeatID,
    IF(b.BookingStatus = 'Finished', 'Not Available', 'Available') AS Seat_Status
FROM Flight f
CROSS JOIN Seat s
LEFT JOIN Booking b
    ON b.Flight_ID = f.Flight_ID AND b.SeatID = s.SeatID
WHERE f.Flight_ID IN (1001, 1002);




-- عدد الحجوزات المكتملة والملغاة لكل رحلة
SELECT 
    Flight_ID,
    SUM(CASE WHEN BookingStatus = 'Finished' THEN 1 ELSE 0 END) AS FinishedBookings,
    SUM(CASE WHEN BookingStatus = 'Cancelled' THEN 1 ELSE 0 END) AS CancelledBookings
FROM Booking
GROUP BY Flight_ID
ORDER BY FinishedBookings DESC;



-- متوسط عمر المسافرين لكل رحلة
SELECT 
    b.Flight_ID,
    AVG(p.Age) AS AvgPassengerAge
FROM Booking b
JOIN Passenger p ON b.Passenger_Passport_ID = p.Passenger_Passport_ID
GROUP BY b.Flight_ID
ORDER BY AvgPassengerAge DESC;


--  Number of passengers per flight: 
SELECT f.Flight_ID,
       COUNT(b.Passenger_Passport_ID) AS TotalPassengers
FROM Flight f
LEFT JOIN Booking b ON f.Flight_ID = b.Flight_ID
GROUP BY f.Flight_ID
HAVING COUNT(b.Passenger_Passport_ID) > 5;

--  Total profits per airline:
SELECT c.Company_Name,
       SUM(p.Total) AS TotalRevenue
FROM Company c
Inner JOIN Flight f ON c.Company_ID = f.Company_ID
Inner JOIN Booking b ON f.Flight_ID = b.Flight_ID
Inner JOIN Payment p ON b.Payment_ID = p.Payment_ID
GROUP BY c.Company_Name;
                   


--  Lowest/Highest Ticket Price:  --add avrege
SELECT
AVG(cabinorclassprice) AS Average_Price,
MIN(cabinorclassprice) AS Min_Price,
MAX(cabinorclassprice) AS Max_Price
FROM Price;


-- Number of bookings per passenger:
SELECT p.Passenger_Name,
            b.Passenger_Passport_ID,
            COUNT(b.BookingID) AS Total_Bookings
FROM Booking b
JOIN Passenger p
ON b.Passenger_Passport_ID = p.Passenger_Passport_ID
GROUP BY b.Passenger_Passport_ID, p.Passenger_Name
HAVING COUNT(b.BookingID) > 1;

------------------------------------------------------------------ 
-- Passenger vs Payment : to follow the payment status

-- LEFT JOIN part: all passengers, even if they haven't booked
SELECT
    Passenger.Passenger_Passport_ID AS Passenger_ID,
    Payment.Payment_Method,
    Payment.Status
FROM Passenger
LEFT JOIN Booking ON Passenger.Passenger_Passport_ID = Booking.Passenger_Passport_ID
LEFT JOIN Payment ON Booking.Payment_ID = Payment.Payment_ID

UNION

-- RIGHT JOIN part: all bookings/payments, even if passenger info is missing
SELECT
    Passenger.Passenger_Passport_ID AS Passenger_ID,
    Payment.Payment_Method,
    Payment.Status
FROM Passenger
RIGHT JOIN Booking ON Passenger.Passenger_Passport_ID = Booking.Passenger_Passport_ID
RIGHT JOIN Payment ON Booking.Payment_ID = Payment.Payment_ID; 

-- Inner Join to filter destination accordin to the condition :
SELECT
    P.Passenger_Name,
    P.Nationality,
    P.Age,
    F.Destination_To,
    F.Flight_Date
FROM Passenger P
INNER JOIN Booking B ON P.Passenger_Passport_ID = B.Passenger_Passport_ID
INNER JOIN Flight F ON B.Flight_ID = F.Flight_ID
WHERE F.Destination_To = 'Dubai';