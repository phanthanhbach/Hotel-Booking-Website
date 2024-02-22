-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 19, 2023 at 10:40 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aloha`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `Email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`Email`, `Name`) VALUES
('20520207@gm.uit.edu.vn', 'Huyền Nguyễn Thị Thanh'),
('20520616@gm.uit.edu.vn', 'LINH TRẦN TÙNG'),
('bebe.yy99@gmail.com', 'Be Be'),
('thhuyen.nt@gmail.com', 'Huyền Nguyễn Thị Thanh');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `Id` bigint NOT NULL,
  `UserName` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Score` int NOT NULL,
  `Text` varchar(10000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`Id`, `UserName`, `Email`, `Score`, `Text`) VALUES
(13, 'Minh Minh', 'thanhhuyennguyen.21502@gmail.com', 5, ''),
(19, 'Trần Mỹ', 'bebe.yy99@gmail.com', 4, 'Khách sạn giá hơi cao nhưng được cái tiền nào của nấy, không thích anh nhân viên áo đen ở quầy tiếp tân vì có thái độ hơi khó ở, còn lại mọi thứ bth. '),
(26, 'Anh Khôi', 'k', 5, 'Khách sạn giá hơi cao so với nhân viên văn phòng nhưng mà dịch vụ vượt trội, mình sẽ quay lại khi nhìu tiền hơn :>'),
(27, 'Hoài Thương', 'f', 5, 'Thấy giá cũng ổn mà nhỉ, nếu xét về dịch vụ + vị trí địa lí + view thì quá hợp lí luôn rùi ý'),
(28, 'Be Be', 'bebe.yy99@gmail.com', 1, 'tệ');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `IdCustomer` int NOT NULL,
  `CustomerName` varchar(100) NOT NULL,
  `CustomerPhone` varchar(10) NOT NULL,
  `CustomerEmail` varchar(50) NOT NULL,
  `AmountOfBooking` int NOT NULL,
  `CustomerType` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`IdCustomer`, `CustomerName`, `CustomerPhone`, `CustomerEmail`, `AmountOfBooking`, `CustomerType`) VALUES
(46, 'Nguyễn Bảo Nam', '0911902880', 'bebe.y99@gmail.com', 1, 0),
(47, 'Huyền Nguyễn Thị Thanh', '0988117212', 'bebe.yy99@gmail.com', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `EventName` varchar(100) NOT NULL,
  `EventDescription` varchar(10000) NOT NULL,
  `EventPrice` float NOT NULL,
  `EventNote` varchar(1000) NOT NULL,
  `EventVideo` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_room`
--

CREATE TABLE `invoice_room` (
  `IdInvoiceRoom` bigint NOT NULL,
  `IdCustomer` int NOT NULL,
  `InvoiceRoomDate` date DEFAULT NULL,
  `InvoiceRoomTotal` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `invoice_room`
--

INSERT INTO `invoice_room` (`IdInvoiceRoom`, `IdCustomer`, `InvoiceRoomDate`, `InvoiceRoomTotal`) VALUES
(114, 46, NULL, 5600000),
(115, 47, '2022-12-27', 3200000);

-- --------------------------------------------------------

--
-- Table structure for table `invoice_room_detail`
--

CREATE TABLE `invoice_room_detail` (
  `IdInvoiceRoomDetail` bigint NOT NULL,
  `IdInvoiceRoom` bigint NOT NULL,
  `RoomName` varchar(100) NOT NULL,
  `RoomTypeName` varchar(100) NOT NULL,
  `RoomPrice` float NOT NULL,
  `ReservationDate` datetime NOT NULL,
  `CheckinDate` date NOT NULL,
  `CheckoutDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `invoice_room_detail`
--

INSERT INTO `invoice_room_detail` (`IdInvoiceRoomDetail`, `IdInvoiceRoom`, `RoomName`, `RoomTypeName`, `RoomPrice`, `ReservationDate`, `CheckinDate`, `CheckoutDate`) VALUES
(77, 114, '303', 'phòng bốn', 4000000, '2022-12-24 02:24:13', '2022-12-25', '2022-12-27'),
(78, 115, '-999', 'phòng đôi', 2000000, '2022-12-25 11:40:12', '2022-12-26', '2022-12-27'),
(79, 115, '-998', 'phòng đôi', 2000000, '2022-12-25 11:40:12', '2022-12-26', '2022-12-27');

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `Id` int NOT NULL,
  `IdCustomer` int NOT NULL,
  `IdInvoiceRoom` bigint NOT NULL,
  `QuantityRoom` int NOT NULL,
  `RoomType` varchar(100) NOT NULL,
  `Date` datetime NOT NULL,
  `Status` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`Id`, `IdCustomer`, `IdInvoiceRoom`, `QuantityRoom`, `RoomType`, `Date`, `Status`) VALUES
(124, 46, 114, 1, 'phòng bốn', '2022-12-24 02:24:13', 0),
(125, 47, 115, 2, 'phòng đôi', '2022-12-25 11:40:12', 0);

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `RoomName` varchar(100) NOT NULL,
  `RoomTypeName` varchar(100) NOT NULL,
  `Status` int NOT NULL,
  `RoomNote` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`RoomName`, `RoomTypeName`, `Status`, `RoomNote`) VALUES
('101', 'phòng đôi', 1, ''),
('102', 'phòng đơn', 0, 'Đang tu sửa'),
('103', 'phòng bốn', 0, ''),
('104', 'phòng đôi', 0, ''),
('105', 'phòng bốn', 0, ''),
('106', 'phòng đơn', 0, ''),
('107', 'phòng bốn', 0, ''),
('108', 'phòng đôi', 1, ''),
('109', 'phòng đôi', 1, ''),
('110', 'phòng đơn', 1, ''),
('201', 'phòng đơn', 0, ''),
('202', 'phòng đơn', 0, ''),
('203', 'phòng đôi', 1, ''),
('204', 'phòng bốn', 0, ''),
('205', 'phòng đơn', 0, ''),
('206', 'phòng đơn', 0, ''),
('207', 'phòng bốn', 0, ''),
('208', 'phòng đơn', 0, ''),
('209', 'phòng đôi', 1, ''),
('210', 'phòng đôi', 1, ''),
('301', 'phòng đơn', 0, ''),
('302', 'phòng đôi', 1, ''),
('303', 'phòng bốn', 1, ''),
('304', 'phòng đơn', 0, ''),
('305', 'phòng đôi', 1, ''),
('306', 'phòng bốn', 0, ''),
('307', 'phòng đôi', 1, ''),
('308', 'phòng đơn', 0, ''),
('401', 'phòng đơn', 0, ''),
('402', 'phòng đôi', 1, ''),
('403', 'phòng bốn', 0, ''),
('404', 'phòng bốn', 0, ''),
('405', 'phòng bốn', 0, ''),
('501', 'phòng đôi', 0, ''),
('502', 'phòng bốn', 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `roomtype`
--

CREATE TABLE `roomtype` (
  `RoomTypeName` varchar(100) NOT NULL,
  `RoomQuantity` int NOT NULL,
  `RoomTypeSize` int NOT NULL,
  `RoomDescription` text NOT NULL,
  `RoomTypePrice` float NOT NULL,
  `RoomTypeImages` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `roomtype`
--

INSERT INTO `roomtype` (`RoomTypeName`, `RoomQuantity`, `RoomTypeSize`, `RoomDescription`, `RoomTypePrice`, `RoomTypeImages`) VALUES
('phòng bốn', 11, 60, 'Hai giường đôi lớn, Wifi miễn phí,Hệ thống điều hòa đầy đủ,Phòng tắm gồm bồn tắm,LED TV với các kênh kết nối trực tuyến,Miễn phí sử dụng hồ bơi,Miễn phí một suất ăn sáng buffer tại sảnh,Các ưu đãi đặc biệt khi sử dụng quầy bar tại sảnh,Hai ban công ngắm trọn cảnh biển', 4000000, 'BON 1.jpeg,BON 2.png,BON 3.jpeg'),
('phòng đôi', 12, 45, 'Một giường đôi,Wifi miễn phí,Hệ thống điều hòa đầy đủ,Phòng tắm gồm bồn tắm,LED TV với các kênh kết nối trực tuyến,Miễn phí sử dụng hồ bơi,Miễn phí một suất ăn sáng buffer tại sảnh,Hai ban công ngắm trọn cảnh biển', 2000000, 'DOI 1.jpeg,DOI 2.jpeg,DOI 3.jpeg'),
('phòng đơn', 12, 30, 'Một giường đơn,Wifi miễn phí,Hệ thống điều hòa đầy đủ,Phòng tắm gồm bồn tắm,LED TV với các kênh kết nối trực tuyến,Miễn phí sử dụng hồ bơi,Ban công với cảnh biển xinh đẹp', 1000000, 'DON 1.jpeg,DON 2.png,DON 3.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `ServiceName` varchar(100) NOT NULL,
  `Unit` varchar(50) NOT NULL,
  `ServicePrice` text NOT NULL,
  `ServiceNote` varchar(100) NOT NULL,
  `ServiceImage` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`ServiceName`, `Unit`, `ServicePrice`, `ServiceNote`, `ServiceImage`) VALUES
('bar & karaoke', 'h', '600.000', '', 'BAR & KARAOKE.png'),
('beach coffee', 'h', '500.000', '', 'CA PHE BIEN.jpg'),
('du thuyền', 'h', '1.000.000', '', 'DU THUYEN.jpg'),
('giặt ủi', 'kg', '50.000', '', 'GIAT UI.jpg'),
('golf', 'h', '1.000.000', '', 'SAN GOLF.jpg'),
('phục vụ 24/24', 'ngày', '600.000', '', 'phucvu24.png'),
('spa & fitness', 'h', '1.000.000', '', 'SPA & FITNESS.jpg'),
('thú cưng', 'bé', '500.000', '', 'THU CUNG.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `password` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`password`) VALUES
(123456);

-- --------------------------------------------------------

--
-- Table structure for table `using_voucher`
--

CREATE TABLE `using_voucher` (
  `VoucherCode` varchar(20) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `UsingDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `using_voucher`
--

INSERT INTO `using_voucher` (`VoucherCode`, `Email`, `UsingDate`) VALUES
('GIAM10', 'bebe.yy99@gmail.com', '2022-12-25'),
('GIAM30', '', '2022-12-26'),
('GIAM30', '20520616@gm.uit.edu.vn', '2022-12-25'),
('GIAM30', 'bebe.yy99@gmail.com', '2022-12-24'),
('GIAM50', 'thhuyen.nt@gmail.com', '2022-12-24');

-- --------------------------------------------------------

--
-- Table structure for table `voucher`
--

CREATE TABLE `voucher` (
  `VoucherCode` varchar(20) NOT NULL,
  `Status` int NOT NULL,
  `Percent` int NOT NULL,
  `MinPrice` int NOT NULL,
  `ActiveDate` date DEFAULT NULL,
  `Quantity` int NOT NULL,
  `QuantityUsed` int NOT NULL,
  `VoucherNote` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `voucher`
--

INSERT INTO `voucher` (`VoucherCode`, `Status`, `Percent`, `MinPrice`, `ActiveDate`, `Quantity`, `QuantityUsed`, `VoucherNote`) VALUES
('GIAM10', 1, 20, 1200000, '2022-12-25', 55, 1, 'Giảm giá 20% cho đơn từ 1.200.000VND'),
('GIAM20', 0, 20, 1400000, NULL, 20, 0, 'Giam 20% cho don 1tr4'),
('GIAM30', 1, 30, 2500000, '2022-12-22', 50, 5, 'Giảm 30% cho đơn 2tr5'),
('GIAM5', 1, 5, 500000, '2022-12-24', 3, 3, 'Giam 5%'),
('GIAM50', 1, 50, 10000000, '2022-12-22', 30, 2, 'Giảm giá 90% khi đặt > 5 phòng');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`Email`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`IdCustomer`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`EventName`);

--
-- Indexes for table `invoice_room`
--
ALTER TABLE `invoice_room`
  ADD PRIMARY KEY (`IdInvoiceRoom`),
  ADD KEY `invoice_room_fk_1` (`IdCustomer`);

--
-- Indexes for table `invoice_room_detail`
--
ALTER TABLE `invoice_room_detail`
  ADD PRIMARY KEY (`IdInvoiceRoomDetail`,`IdInvoiceRoom`,`RoomName`),
  ADD KEY `invoice_room_detail_fk_1` (`IdInvoiceRoom`),
  ADD KEY `invoice_room_detail_fk_2` (`RoomTypeName`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `noti_fk_1` (`IdCustomer`),
  ADD KEY `noti_fk_2` (`IdInvoiceRoom`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`RoomName`),
  ADD KEY `roomtype_detail_fk_1` (`RoomTypeName`);

--
-- Indexes for table `roomtype`
--
ALTER TABLE `roomtype`
  ADD PRIMARY KEY (`RoomTypeName`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`ServiceName`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`password`);

--
-- Indexes for table `using_voucher`
--
ALTER TABLE `using_voucher`
  ADD PRIMARY KEY (`VoucherCode`,`Email`);

--
-- Indexes for table `voucher`
--
ALTER TABLE `voucher`
  ADD PRIMARY KEY (`VoucherCode`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `Id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `IdCustomer` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `invoice_room`
--
ALTER TABLE `invoice_room`
  MODIFY `IdInvoiceRoom` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- AUTO_INCREMENT for table `invoice_room_detail`
--
ALTER TABLE `invoice_room_detail`
  MODIFY `IdInvoiceRoomDetail` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `invoice_room`
--
ALTER TABLE `invoice_room`
  ADD CONSTRAINT `invoice_room_fk_1` FOREIGN KEY (`IdCustomer`) REFERENCES `customer` (`IdCustomer`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `invoice_room_detail`
--
ALTER TABLE `invoice_room_detail`
  ADD CONSTRAINT `invoice_room_detail_fk_1` FOREIGN KEY (`IdInvoiceRoom`) REFERENCES `invoice_room` (`IdInvoiceRoom`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `invoice_room_detail_fk_2` FOREIGN KEY (`RoomTypeName`) REFERENCES `roomtype` (`RoomTypeName`) ON UPDATE CASCADE;

--
-- Constraints for table `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `noti_fk_1` FOREIGN KEY (`IdCustomer`) REFERENCES `customer` (`IdCustomer`) ON UPDATE RESTRICT,
  ADD CONSTRAINT `noti_fk_2` FOREIGN KEY (`IdInvoiceRoom`) REFERENCES `invoice_room` (`IdInvoiceRoom`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `room`
--
ALTER TABLE `room`
  ADD CONSTRAINT `roomtype_detail_fk_1` FOREIGN KEY (`RoomTypeName`) REFERENCES `roomtype` (`RoomTypeName`) ON UPDATE CASCADE;

--
-- Constraints for table `using_voucher`
--
ALTER TABLE `using_voucher`
  ADD CONSTRAINT `using_voucher_fk_1` FOREIGN KEY (`VoucherCode`) REFERENCES `voucher` (`VoucherCode`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
