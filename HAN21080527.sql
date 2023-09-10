-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 27, 2023 at 06:05 PM
-- Server version: 10.2.38-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `HAN21080527`
--

-- --------------------------------------------------------

--
-- Table structure for table `Category`
--

CREATE TABLE `Category` (
  `categoryId` int(11) NOT NULL,
  `categoryName` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Category`
--

INSERT INTO `Category` (`categoryId`, `categoryName`) VALUES
(100, 'Electronics'),
(101, 'Clothing'),
(102, 'Home and Kitchen'),
(103, 'Books'),
(104, 'Sports and Outdoors');

-- --------------------------------------------------------

--
-- Table structure for table `Container`
--

CREATE TABLE `Container` (
  `containerId` int(11) NOT NULL,
  `dimension` decimal(10,2) DEFAULT NULL,
  `weight` decimal(10,2) DEFAULT NULL,
  `containerStatus` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Container`
--

INSERT INTO `Container` (`containerId`, `dimension`, `weight`, `containerStatus`, `description`) VALUES
(11001, '150.25', '1250.75', 'initial', NULL),
(12002, '175.50', '1300.25', 'in transit', 'Fragile items inside'),
(13003, '180.75', '1400.50', 'arrived', 'Handle with care'),
(14004, '120.80', '1100.90', 'initial', NULL),
(15005, '160.00', '1050.25', 'in transit', 'Perishable goods'),
(16006, '190.25', '1320.00', 'arrived', 'Heavy machinery'),
(17007, '130.75', '1250.50', 'initial', NULL),
(18008, '170.50', '1360.75', 'in transit', 'Fragile items inside'),
(19009, '155.25', '1280.25', 'arrived', 'Handle with care'),
(20010, '145.90', '1120.50', 'initial', NULL),
(21011, '165.25', '1450.00', 'in transit', 'Electronics goods'),
(22012, '185.75', '1180.50', 'arrived', 'Handle with care'),
(23013, '140.80', '1290.90', 'initial', NULL),
(24014, '150.00', '1060.25', 'in transit', 'Perishable goods'),
(25015, '175.25', '1350.00', 'arrived', 'Fragile items inside');

-- --------------------------------------------------------

--
-- Table structure for table `ContainerTrans`
--

CREATE TABLE `ContainerTrans` (
  `transportationId` int(11) NOT NULL,
  `containerId` int(11) DEFAULT NULL,
  `transportType` varchar(255) DEFAULT NULL,
  `departureWarehouse` int(11) DEFAULT NULL,
  `destinationWarehouse` int(11) DEFAULT NULL,
  `expectedDeliveryDate` datetime DEFAULT NULL,
  `actualDeliveryDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ContainerTrans`
--

INSERT INTO `ContainerTrans` (`transportationId`, `containerId`, `transportType`, `departureWarehouse`, `destinationWarehouse`, `expectedDeliveryDate`, `actualDeliveryDate`) VALUES
(301, 11001, 'Truck', 705, 701, '2023-06-10 00:00:00', '2023-06-15 00:00:00'),
(302, 12002, 'Ship', 707, 702, '2023-06-11 00:00:00', '2023-06-16 00:00:00'),
(303, 13003, 'Airplane', 710, 703, '2023-06-12 00:00:00', '2023-06-17 00:00:00'),
(304, 14004, 'Truck', 709, 704, '2023-06-13 00:00:00', '2023-06-18 00:00:00'),
(305, 15005, 'Ship', 708, 705, '2023-06-14 00:00:00', '2023-06-19 00:00:00'),
(306, 16006, 'Airplane', 701, 706, '2023-06-15 00:00:00', '2023-06-20 00:00:00'),
(307, 17007, 'Truck', 707, 706, '2023-06-16 00:00:00', '2023-06-21 00:00:00'),
(308, 18008, 'Ship', 702, 707, '2023-06-17 00:00:00', '2023-06-22 00:00:00'),
(309, 19009, 'Airplane', 709, 707, '2023-06-18 00:00:00', '2023-06-23 00:00:00'),
(310, 20010, 'Truck', 710, 708, '2023-06-19 00:00:00', '2023-06-24 00:00:00'),
(311, 21011, 'Ship', 701, 708, '2023-06-20 00:00:00', '2023-06-25 00:00:00'),
(312, 22012, 'Airplane', 702, 709, '2023-06-21 00:00:00', '2023-06-26 00:00:00'),
(313, 23013, 'Truck', 703, 709, '2023-06-22 00:00:00', '2023-06-27 00:00:00'),
(314, 24014, 'Ship', 704, 710, '2023-06-23 00:00:00', '2023-06-28 00:00:00'),
(315, 25015, 'Airplane', 705, 710, '2023-06-24 00:00:00', '2023-06-29 00:00:00');

-- --------------------------------------------------------

--
-- Stand-in structure for view `Country that has ordered most of the highest selling product`
-- (See below for the actual view)
--
CREATE TABLE `Country that has ordered most of the highest selling product` (
`country` varchar(255)
,`order_count` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `Country which has the least clients`
-- (See below for the actual view)
--
CREATE TABLE `Country which has the least clients` (
`country` varchar(255)
,`client_count` bigint(21)
);

-- --------------------------------------------------------

--
-- Table structure for table `CusOrder`
--

CREATE TABLE `CusOrder` (
  `orderId` int(11) NOT NULL,
  `customerId` int(11) DEFAULT NULL,
  `containerId` int(11) DEFAULT NULL,
  `totalPrice` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `CusOrder`
--

INSERT INTO `CusOrder` (`orderId`, `customerId`, `containerId`, `totalPrice`) VALUES
(1, 8544, 11001, '500.00'),
(2, 5231, 11001, '250.00'),
(3, 4236, 12002, '700.00'),
(4, 8823, 12002, '450.00'),
(5, 4440, 13003, '600.00'),
(6, 9001, 13003, '550.00'),
(7, 348, 14004, '800.00'),
(8, 2023, 14004, '400.00'),
(9, 1555, 15005, '350.00'),
(10, 9869, 15005, '750.00'),
(11, 3485, 16006, '900.00'),
(12, 7834, 16006, '650.00'),
(13, 6963, 17007, '850.00'),
(14, 5597, 17007, '950.00'),
(15, 8224, 18008, '600.00'),
(16, 4880, 18008, '700.00'),
(17, 1902, 19009, '550.00'),
(18, 5300, 19009, '400.00'),
(19, 9694, 20010, '650.00'),
(20, 9010, 20010, '800.00'),
(21, 8884, 21011, '450.00'),
(22, 5351, 21011, '700.00'),
(23, 782, 22012, '550.00'),
(24, 2814, 22012, '850.00'),
(25, 704, 23013, '950.00'),
(26, 5701, 23013, '600.00'),
(27, 6041, 24014, '700.00'),
(28, 6677, 24014, '550.00'),
(29, 1422, 25015, '400.00'),
(30, 6886, 25015, '650.00');

-- --------------------------------------------------------

--
-- Table structure for table `Customer`
--

CREATE TABLE `Customer` (
  `customerId` int(11) NOT NULL,
  `fullName` varchar(255) NOT NULL,
  `userAddress` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `tel` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Customer`
--

INSERT INTO `Customer` (`customerId`, `fullName`, `userAddress`, `country`, `tel`, `email`) VALUES
(348, 'Amena Kinney', 'Ap #994-2374 Morbi Ave', 'Singapore', '(0181) 853 2878', 'magna.sed@google.edu'),
(704, 'Erica Pearson', '5780 A, Avenue', 'Nigeria', '0800 1111', 'nullam.feugiat@aol.net'),
(782, 'Alisa Walker', 'P.O. Box 151, 8350 Tristique Road', 'Costa Rica', '0800 377394', 'lobortis.quis@outlook.com'),
(1422, 'Wilma Ratliff', 'P.O. Box 979, 2808 Enim St.', 'Austria', '07624 021823', 'tellus.nunc@icloud.net'),
(1555, 'Andrew Lancaster', '368-7272 Faucibus St.', 'Austria', '(0112) 334 5362', 'mollis.lectus@google.couk'),
(1902, 'Nerea Meadows', 'Ap #607-4877 At St.', 'Nigeria', '(01744) 62865', 'justo.sit@google.edu'),
(2023, 'Gloria Sweet', 'Ap #764-9231 Elit. Rd.', 'Costa Rica', '076 6797 4167', 'elit.pede.malesuada@google.net'),
(2814, 'Vielka Vang', 'Ap #546-1958 Elit Ave', 'Austria', '0800 1111', 'luctus.lobortis@aol.edu'),
(3485, 'Lucas Gibson', 'Ap #795-5669 Eu St.', 'Netherlands', '(01601) 289372', 'integer.tincidunt@icloud.ca'),
(4236, 'Garth Patel', 'P.O. Box 831, 6114 Eu Ave', 'Costa Rica', '055 4044 5638', 'eu@aol.com'),
(4440, 'Joan Buchanan', '707-646 Augue St.', 'France', '0800 859091', 'magna@hotmail.edu'),
(4880, 'Colt Contreras', 'P.O. Box 750, 2936 Donec Ave', 'Mexico', '(01701) 145782', 'et.tristique@icloud.net'),
(5231, 'Indigo Mcmahon', '8550 Nostra, St.', 'Italy', '0800 543281', 'maecenas.mi.felis@yahoo.com'),
(5300, 'Kareem Norton', 'Ap #736-5181 Scelerisque Rd.', 'Vietnam', '07624 485439', 'consectetuer@protonmail.net'),
(5351, 'Hannah Leach', '3615 Eleifend, Road', 'Ireland', '07624 154237', 'ante.nunc@yahoo.edu'),
(5597, 'Ebony Spears', '632-5383 Eu Road', 'Ukraine', '07181 243243', 'sagittis.felis@hotmail.edu'),
(5701, 'Miranda Salas', '972 Curabitur Ave', 'Norway', '(0181) 370 2784', 'fusce.fermentum.fermentum@hotmail.ca'),
(6041, 'Bruno Aguirre', '996-4688 Sit Avenue', 'United States', '0927 850 5033', 'diam.at@icloud.edu'),
(6677, 'Halla Whitehead', '558-3155 Dui, Street', 'Philippines', '0935 056 7140', 'quam.elementum@icloud.ca'),
(6886, 'Gary Marshall', 'P.O. Box 418, 5970 Proin Street', 'United States', '056 5166 5559', 'amet.consectetuer@protonmail.org'),
(6963, 'Gray Strong', 'Ap #813-3046 Enim. Avenue', 'Italy', '0500 329802', 'pede.ultrices@yahoo.edu'),
(7834, 'Christian Parker', 'Ap #547-9571 Vivamus Rd.', 'Poland', '0922 360 1588', 'nec.leo.morbi@protonmail.ca'),
(8224, 'Quintessa Gibson', 'Ap #128-5374 Viverra. Av.', 'India', '(016977) 7809', 'magna.suspendisse@icloud.org'),
(8544, 'Yuri Robbins', 'P.O. Box 411, 3211 Nullam Ave', 'New Zealand', '056 5318 8211', 'viverra.maecenas@yahoo.org'),
(8823, 'Cyrus Acosta', 'Ap #780-4565 Aliquet St.', 'Colombia', '(011442) 06137', 'malesuada.augue.ut@google.edu'),
(8884, 'Flynn Powers', '882-1190 Et, St.', 'France', '0500 618668', 'non.enim@google.org'),
(9001, 'Merritt Carr', 'Ap #368-204 Blandit St.', 'India', '(01753) 837238', 'est@yahoo.org'),
(9010, 'Cooper Houston', '222-2865 Urna Rd.', 'Germany', '(0114) 285 4474', 'nibh@google.edu'),
(9694, 'Owen Erickson', 'Ap #355-1850 Lectus St.', 'Singapore', '(0113) 873 8037', 'mauris.quis@protonmail.com'),
(9869, 'Bevis Wolfe', 'Ap #700-6447 At, Avenue', 'Nigeria', '(016977) 0678', 'tempus.risus.donec@yahoo.ca');

-- --------------------------------------------------------

--
-- Stand-in structure for view `Day of the week that has the most shipment requests`
-- (See below for the actual view)
--
CREATE TABLE `Day of the week that has the most shipment requests` (
`day_of_week` varchar(9)
,`shipment_count` bigint(21)
);

-- --------------------------------------------------------

--
-- Table structure for table `Delivery`
--

CREATE TABLE `Delivery` (
  `deliveryId` int(11) NOT NULL,
  `customerId` int(11) DEFAULT NULL,
  `containerId` int(11) DEFAULT NULL,
  `orderId` int(11) DEFAULT NULL,
  `departure` varchar(255) DEFAULT NULL,
  `destination` varchar(255) DEFAULT NULL,
  `shipmentDate` datetime DEFAULT NULL,
  `expectedDeliveryDate` datetime DEFAULT NULL,
  `actualDeliveryDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Delivery`
--

INSERT INTO `Delivery` (`deliveryId`, `customerId`, `containerId`, `orderId`, `departure`, `destination`, `shipmentDate`, `expectedDeliveryDate`, `actualDeliveryDate`) VALUES
(200, 8544, 11001, 1, 'New York', 'P.O. Box 411, 3211 Nullam Ave', '2023-06-01 00:00:00', '2023-06-08 00:00:00', '2023-06-09 00:00:00'),
(201, 5231, 11001, 2, 'New York', '8550 Nostra, St.', '2023-06-02 00:00:00', '2023-06-09 00:00:00', '2023-06-10 00:00:00'),
(202, 4236, 12002, 3, 'London', 'P.O. Box 831, 6114 Eu Ave', '2023-06-03 00:00:00', '2023-06-10 00:00:00', '2023-06-11 00:00:00'),
(203, 8823, 12002, 4, 'London', 'Ap #780-4565 Aliquet St.', '2023-06-04 00:00:00', '2023-06-11 00:00:00', '2023-06-12 00:00:00'),
(204, 4440, 13003, 5, 'Toronto', '707-646 Augue St.', '2023-06-05 00:00:00', '2023-06-12 00:00:00', '2023-06-13 00:00:00'),
(205, 9001, 13003, 6, 'Toronto', 'Ap #368-204 Blandit St.', '2023-06-06 00:00:00', '2023-06-13 00:00:00', '2023-06-14 00:00:00'),
(206, 348, 14004, 7, 'Sydney', 'Ap #994-2374 Morbi Ave', '2023-06-07 00:00:00', '2023-06-14 00:00:00', '2023-06-15 00:00:00'),
(207, 2023, 14004, 8, 'Sydney', 'Ap #764-9231 Elit. Rd.', '2023-06-08 00:00:00', '2023-06-15 00:00:00', '2023-06-16 00:00:00'),
(208, 1555, 15005, 9, 'Berlin', '368-7272 Faucibus St.', '2023-06-09 00:00:00', '2023-06-16 00:00:00', '2023-06-17 00:00:00'),
(209, 9869, 15005, 10, 'Berlin', 'Ap #700-6447 At, Avenue', '2023-06-10 00:00:00', '2023-06-17 00:00:00', '2023-06-18 00:00:00'),
(210, 3485, 16006, 11, 'Paris', 'Ap #795-5669 Eu St.', '2023-06-11 00:00:00', '2023-06-18 00:00:00', '2023-06-19 00:00:00'),
(211, 7834, 16006, 12, 'Paris', 'Ap #547-9571 Vivamus Rd.', '2023-06-12 00:00:00', '2023-06-19 00:00:00', '2023-06-20 00:00:00'),
(212, 6963, 17007, 13, 'Paris', 'Ap #813-3046 Enim. Avenue', '2023-06-13 00:00:00', '2023-06-20 00:00:00', '2023-06-21 00:00:00'),
(213, 5597, 17007, 14, 'Paris', '632-5383 Eu Road', '2023-06-14 00:00:00', '2023-06-21 00:00:00', '2023-06-22 00:00:00'),
(214, 8224, 18008, 15, 'Tokyo', 'Ap #128-5374 Viverra. Av.', '2023-06-15 00:00:00', '2023-06-22 00:00:00', '2023-06-23 00:00:00'),
(215, 4880, 18008, 16, 'Tokyo', 'P.O. Box 750, 2936 Donec Ave', '2023-06-16 00:00:00', '2023-06-23 00:00:00', '2023-06-24 00:00:00'),
(216, 1902, 19009, 17, 'Tokyo', 'Ap #607-4877 At St.', '2023-06-17 00:00:00', '2023-06-24 00:00:00', '2023-06-25 00:00:00'),
(217, 5300, 19009, 18, 'Tokyo', 'Ap #736-5181 Scelerisque Rd.', '2023-06-18 00:00:00', '2023-06-25 00:00:00', '2023-06-26 00:00:00'),
(218, 9694, 20010, 19, 'Sao Paulo', 'Ap #355-1850 Lectus St.', '2023-06-19 00:00:00', '2023-06-26 00:00:00', '2023-06-27 00:00:00'),
(219, 9010, 20010, 20, 'Sao Paulo', '222-2865 Urna Rd.', '2023-06-20 00:00:00', '2023-06-27 00:00:00', '2023-06-28 00:00:00'),
(220, 8884, 21011, 21, 'Sao Paulo', '882-1190 Et, St.', '2023-06-21 00:00:00', '2023-06-28 00:00:00', '2023-06-29 00:00:00'),
(221, 5351, 21011, 22, 'Sao Paulo', '3615 Eleifend, Road', '2023-06-22 00:00:00', '2023-06-29 00:00:00', '2023-06-30 00:00:00'),
(222, 782, 22012, 23, 'Mumbai', 'P.O. Box 151, 8350 Tristique Road', '2023-06-23 00:00:00', '2023-06-30 00:00:00', '2023-07-01 00:00:00'),
(223, 2814, 22012, 24, 'Mumbai', 'Ap #546-1958 Elit Ave', '2023-06-24 00:00:00', '2023-07-01 00:00:00', '2023-07-02 00:00:00'),
(224, 704, 23013, 25, 'Mumbai', '5780 A, Avenue', '2023-06-25 00:00:00', '2023-07-02 00:00:00', '2023-07-03 00:00:00'),
(225, 5701, 23013, 26, 'Mumbai', '972 Curabitur Ave', '2023-06-26 00:00:00', '2023-07-03 00:00:00', '2023-07-04 00:00:00'),
(226, 6041, 24014, 27, 'Shanghai', '996-4688 Sit Avenue', '2023-06-27 00:00:00', '2023-07-04 00:00:00', '2023-07-05 00:00:00'),
(227, 6677, 24014, 28, 'Shanghai', '558-3155 Dui, Street', '2023-06-28 00:00:00', '2023-07-05 00:00:00', '2023-07-06 00:00:00'),
(228, 1422, 25015, 29, 'Shanghai', 'P.O. Box 979, 2808 Enim St.', '2023-06-29 00:00:00', '2023-07-06 00:00:00', '2023-07-07 00:00:00'),
(229, 6886, 25015, 30, 'Shanghai', 'P.O. Box 418, 5970 Proin Street', '2023-06-30 00:00:00', '2023-07-07 00:00:00', '2023-07-08 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `Invoice`
--

CREATE TABLE `Invoice` (
  `invoiceId` bigint(20) NOT NULL,
  `customerId` int(11) DEFAULT NULL,
  `orderId` int(11) DEFAULT NULL,
  `paymentId` int(11) DEFAULT NULL,
  `invoiceDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Invoice`
--

INSERT INTO `Invoice` (`invoiceId`, `customerId`, `orderId`, `paymentId`, `invoiceDate`) VALUES
(1000001, 8544, 1, 401, '2023-07-01 00:00:00'),
(1000002, 5231, 2, 402, '2023-07-01 00:00:00'),
(1000003, 4236, 3, 403, '2023-07-01 00:00:00'),
(1000004, 8823, 4, 404, '2023-07-02 00:00:00'),
(1000005, 4440, 5, 405, '2023-07-02 00:00:00'),
(1000006, 9001, 6, 406, '2023-07-02 00:00:00'),
(1000007, 348, 7, 407, '2023-07-03 00:00:00'),
(1000008, 2023, 8, 408, '2023-07-03 00:00:00'),
(1000009, 1555, 9, 409, '2023-07-03 00:00:00'),
(1000010, 9869, 10, 410, '2023-07-04 00:00:00'),
(1000011, 3485, 11, 411, '2023-07-04 00:00:00'),
(1000012, 7834, 12, 412, '2023-07-04 00:00:00'),
(1000013, 6963, 13, 413, '2023-07-05 00:00:00'),
(1000014, 5597, 14, 414, '2023-07-05 00:00:00'),
(1000015, 8224, 15, 415, '2023-07-06 00:00:00'),
(1000016, 4880, 16, 416, '2023-07-06 00:00:00'),
(1000017, 1902, 17, 417, '2023-07-06 00:00:00'),
(1000018, 5300, 18, 418, '2023-07-07 00:00:00'),
(1000019, 9694, 19, 419, '2023-07-07 00:00:00'),
(1000020, 9010, 20, 420, '2023-07-07 00:00:00'),
(1000021, 8884, 21, 421, '2023-07-08 00:00:00'),
(1000022, 5351, 22, 422, '2023-07-08 00:00:00'),
(1000023, 782, 23, 423, '2023-07-09 00:00:00'),
(1000024, 2814, 24, 424, '2023-07-09 00:00:00'),
(1000025, 704, 25, 425, '2023-07-10 00:00:00'),
(1000026, 5701, 26, 426, '2023-07-10 00:00:00'),
(1000027, 6041, 27, 427, '2023-07-10 00:00:00'),
(1000028, 6677, 28, 428, '2023-07-11 00:00:00'),
(1000029, 1422, 29, 429, '2023-07-11 00:00:00'),
(1000030, 6886, 30, 430, '2023-07-11 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `Item`
--

CREATE TABLE `Item` (
  `itemId` int(11) DEFAULT NULL,
  `orderId` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Item`
--

INSERT INTO `Item` (`itemId`, `orderId`, `quantity`) VALUES
(50, 1, 1),
(51, 1, 2),
(52, 2, 3),
(53, 2, 1),
(54, 3, 2),
(55, 3, 1),
(56, 4, 3),
(57, 4, 1),
(58, 5, 1),
(59, 5, 2),
(60, 6, 3),
(61, 6, 1),
(62, 7, 2),
(63, 7, 1),
(64, 8, 1),
(65, 8, 2),
(50, 9, 3),
(51, 9, 1),
(52, 10, 2),
(53, 10, 1),
(54, 11, 1),
(55, 11, 2),
(56, 12, 3),
(57, 12, 1),
(58, 13, 2),
(59, 13, 1),
(60, 14, 1),
(61, 14, 2),
(62, 15, 3),
(63, 15, 1),
(64, 16, 2),
(65, 16, 1),
(50, 17, 1),
(51, 17, 2),
(52, 18, 3),
(53, 18, 1),
(54, 19, 2),
(55, 19, 1),
(56, 20, 1),
(57, 20, 2),
(58, 21, 3),
(59, 21, 1),
(60, 22, 2),
(61, 22, 1),
(62, 23, 1),
(63, 23, 2),
(64, 24, 3),
(65, 24, 1),
(50, 25, 2),
(51, 25, 1),
(52, 26, 1),
(53, 26, 2),
(54, 27, 3),
(55, 27, 1),
(56, 28, 2),
(57, 28, 1),
(58, 29, 1),
(59, 29, 2),
(60, 30, 3),
(61, 30, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ItemInfo`
--

CREATE TABLE `ItemInfo` (
  `itemId` int(11) NOT NULL,
  `categoryId` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `itemDescription` varchar(999) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ItemInfo`
--

INSERT INTO `ItemInfo` (`itemId`, `categoryId`, `name`, `itemDescription`, `price`) VALUES
(50, 100, 'Smartphone', 'High-end smartphone with advanced features', '899.99'),
(51, 101, 'T-shirt', 'Cotton t-shirt for everyday wear', '19.99'),
(52, 102, 'Cookware Set', 'Complete set of non-stick cookware', '129.99'),
(53, 103, 'Novel', 'Bestselling fiction novel by a renowned author', '14.99'),
(54, 104, 'Yoga Mat', 'Non-slip yoga mat for exercise and meditation', '29.99'),
(55, 100, 'Headphones', 'Wireless headphones with noise cancellation', '149.99'),
(56, 101, 'Jeans', 'Slim-fit jeans made from premium denim', '59.99'),
(57, 102, 'Blender', 'Powerful blender for making smoothies and soups', '79.99'),
(58, 103, 'Art Book', 'Illustrated art book showcasing famous artworks', '39.99'),
(59, 104, 'Hiking Backpack', 'Durable backpack for outdoor adventures', '79.99'),
(60, 100, 'Smartwatch', 'Fitness tracker with heart rate monitoring', '199.99'),
(61, 101, 'Dress', 'Elegant evening dress for special occasions', '89.99'),
(62, 102, 'Coffee Maker', 'Automatic coffee maker with built-in grinder', '119.99'),
(63, 103, 'Biography', 'Biography of a prominent historical figure', '24.99'),
(64, 104, 'Tennis Racket', 'Professional-grade tennis racket', '159.99'),
(65, 100, 'Laptop', 'High-performance laptop for work and gaming', '1299.99');

-- --------------------------------------------------------

--
-- Stand-in structure for view `Month that has the most shipment requests`
-- (See below for the actual view)
--
CREATE TABLE `Month that has the most shipment requests` (
`month` varchar(9)
,`shipment_count` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `Orders stored in container and the average order cost`
-- (See below for the actual view)
--
CREATE TABLE `Orders stored in container and the average order cost` (
`containerId` int(11)
,`order_count` bigint(21)
,`average_order_cost` decimal(14,6)
);

-- --------------------------------------------------------

--
-- Table structure for table `Payment`
--

CREATE TABLE `Payment` (
  `paymentId` int(11) NOT NULL,
  `invoicePaid` bit(1) DEFAULT NULL,
  `paymentMethod` varchar(255) DEFAULT NULL,
  `paymentDate` datetime DEFAULT NULL,
  `paymentDescription` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Payment`
--

INSERT INTO `Payment` (`paymentId`, `invoicePaid`, `paymentMethod`, `paymentDate`, `paymentDescription`) VALUES
(401, b'1', 'Credit Card', '2023-06-30 00:00:00', 'Payment received'),
(402, b'1', 'PayPal', '2023-06-30 00:00:00', 'Payment completed'),
(403, b'1', 'Bank Transfer', '2023-06-30 00:00:00', 'Payment processed'),
(404, b'0', NULL, NULL, NULL),
(405, b'0', NULL, NULL, NULL),
(406, b'1', 'Credit Card', '2023-07-01 00:00:00', 'Payment received'),
(407, b'1', 'PayPal', '2023-07-01 00:00:00', 'Payment completed'),
(408, b'0', NULL, NULL, NULL),
(409, b'0', NULL, NULL, NULL),
(410, b'1', 'Credit Card', '2023-07-02 00:00:00', 'Payment received'),
(411, b'1', 'PayPal', '2023-07-02 00:00:00', 'Payment completed'),
(412, b'1', 'Bank Transfer', '2023-07-02 00:00:00', 'Payment processed'),
(413, b'0', NULL, NULL, NULL),
(414, b'1', 'Credit Card', '2023-07-03 00:00:00', 'Payment received'),
(415, b'0', NULL, NULL, NULL),
(416, b'1', 'Credit Card', '2023-07-04 00:00:00', 'Payment received'),
(417, b'1', 'PayPal', '2023-07-04 00:00:00', 'Payment completed'),
(418, b'0', NULL, NULL, NULL),
(419, b'0', NULL, NULL, NULL),
(420, b'1', 'Credit Card', '2023-07-05 00:00:00', 'Payment received'),
(421, b'1', 'PayPal', '2023-07-05 00:00:00', 'Payment completed'),
(422, b'1', 'Bank Transfer', '2023-07-05 00:00:00', 'Payment processed'),
(423, b'0', NULL, NULL, NULL),
(424, b'1', 'Credit Card', '2023-07-06 00:00:00', 'Payment received'),
(425, b'0', NULL, NULL, NULL),
(426, b'1', 'Credit Card', '2023-07-07 00:00:00', 'Payment received'),
(427, b'1', 'PayPal', '2023-07-07 00:00:00', 'Payment completed'),
(428, b'0', NULL, NULL, NULL),
(429, b'0', NULL, NULL, NULL),
(430, b'1', 'Credit Card', '2023-07-08 00:00:00', 'Payment received');

-- --------------------------------------------------------

--
-- Stand-in structure for view `Percentage of clients have requested product "Smartphone"`
-- (See below for the actual view)
--
CREATE TABLE `Percentage of clients have requested product "Smartphone"` (
`percentage` decimal(27,4)
);

-- --------------------------------------------------------

--
-- Table structure for table `Review`
--

CREATE TABLE `Review` (
  `reviewId` int(11) NOT NULL,
  `customerId` int(11) DEFAULT NULL,
  `itemId` int(11) DEFAULT NULL,
  `feedback` varchar(999) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Review`
--

INSERT INTO `Review` (`reviewId`, `customerId`, `itemId`, `feedback`) VALUES
(900, 8544, 50, 'Great product! Highly recommend.'),
(901, 8544, 51, 'Excellent service and quality.'),
(902, 5231, 52, 'The item exceeded my expectations.'),
(903, 5231, 53, 'Good value for money.'),
(904, 4236, 54, 'Fast shipping and well-packaged.'),
(905, 4236, 55, 'Satisfied with the purchase.'),
(906, 8823, 56, 'The item arrived damaged, need replacement.'),
(907, 8823, 57, 'Average product, nothing special.'),
(908, 4440, 58, 'Disappointed with the quality.'),
(909, 4440, 59, 'Outstanding customer service!');

-- --------------------------------------------------------

--
-- Stand-in structure for view `The delay delivery date of each container`
-- (See below for the actual view)
--
CREATE TABLE `The delay delivery date of each container` (
`containerId` int(11)
,`expectedDeliveryDate` datetime
,`actualDeliveryDate` datetime
,`delivery_delay` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `The percentage of customer paid their order in each country`
-- (See below for the actual view)
--
CREATE TABLE `The percentage of customer paid their order in each country` (
`country` varchar(255)
,`total_customers` bigint(21)
,`paid_customers` bigint(21)
,`payment_percentage` decimal(27,4)
);

-- --------------------------------------------------------

--
-- Table structure for table `Warehouse`
--

CREATE TABLE `Warehouse` (
  `warehouseId` int(11) NOT NULL,
  `country` varchar(255) DEFAULT NULL,
  `branch` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Warehouse`
--

INSERT INTO `Warehouse` (`warehouseId`, `country`, `branch`) VALUES
(701, 'United States', 'New York'),
(702, 'United Kingdom', 'London'),
(703, 'Canada', 'Toronto'),
(704, 'Australia', 'Sydney'),
(705, 'Germany', 'Berlin'),
(706, 'France', 'Paris'),
(707, 'Japan', 'Tokyo'),
(708, 'Brazil', 'Sao Paulo'),
(709, 'India', 'Mumbai'),
(710, 'China', 'Shanghai');

-- --------------------------------------------------------

--
-- Stand-in structure for view `Year that has the most shipment requests`
-- (See below for the actual view)
--
CREATE TABLE `Year that has the most shipment requests` (
`year` int(4)
,`shipment_count` bigint(21)
);

-- --------------------------------------------------------

--
-- Structure for view `Country that has ordered most of the highest selling product`
--
DROP TABLE IF EXISTS `Country that has ordered most of the highest selling product`;

CREATE ALGORITHM=UNDEFINED DEFINER=`HAN21080527`@`%` SQL SECURITY DEFINER VIEW `Country that has ordered most of the highest selling product`  AS SELECT `c`.`country` AS `country`, count(0) AS `order_count` FROM (((`Customer` `c` join `CusOrder` `o` on(`c`.`customerId` = `o`.`customerId`)) join `Item` `i` on(`o`.`orderId` = `i`.`orderId`)) join `ItemInfo` `ii` on(`i`.`itemId` = `ii`.`itemId`)) WHERE `ii`.`price` = (select max(`ItemInfo`.`price`) from `ItemInfo`) GROUP BY `c`.`country` ORDER BY count(0) DESC LIMIT 0, 11  ;

-- --------------------------------------------------------

--
-- Structure for view `Country which has the least clients`
--
DROP TABLE IF EXISTS `Country which has the least clients`;

CREATE ALGORITHM=UNDEFINED DEFINER=`HAN21080527`@`%` SQL SECURITY DEFINER VIEW `Country which has the least clients`  AS SELECT `Customer`.`country` AS `country`, count(0) AS `client_count` FROM `Customer` GROUP BY `Customer`.`country` ORDER BY count(0) ASC LIMIT 0, 11  ;

-- --------------------------------------------------------

--
-- Structure for view `Day of the week that has the most shipment requests`
--
DROP TABLE IF EXISTS `Day of the week that has the most shipment requests`;

CREATE ALGORITHM=UNDEFINED DEFINER=`HAN21080527`@`%` SQL SECURITY DEFINER VIEW `Day of the week that has the most shipment requests`  AS SELECT dayname(`Delivery`.`shipmentDate`) AS `day_of_week`, count(0) AS `shipment_count` FROM `Delivery` GROUP BY dayname(`Delivery`.`shipmentDate`) ORDER BY count(0) DESC LIMIT 0, 11  ;

-- --------------------------------------------------------

--
-- Structure for view `Month that has the most shipment requests`
--
DROP TABLE IF EXISTS `Month that has the most shipment requests`;

CREATE ALGORITHM=UNDEFINED DEFINER=`HAN21080527`@`%` SQL SECURITY DEFINER VIEW `Month that has the most shipment requests`  AS SELECT monthname(`Delivery`.`shipmentDate`) AS `month`, count(0) AS `shipment_count` FROM `Delivery` GROUP BY monthname(`Delivery`.`shipmentDate`) ORDER BY count(0) DESC LIMIT 0, 11  ;

-- --------------------------------------------------------

--
-- Structure for view `Orders stored in container and the average order cost`
--
DROP TABLE IF EXISTS `Orders stored in container and the average order cost`;

CREATE ALGORITHM=UNDEFINED DEFINER=`HAN21080527`@`%` SQL SECURITY DEFINER VIEW `Orders stored in container and the average order cost`  AS SELECT `c`.`containerId` AS `containerId`, count(`o`.`orderId`) AS `order_count`, avg(`o`.`totalPrice`) AS `average_order_cost` FROM (`Container` `c` left join `CusOrder` `o` on(`c`.`containerId` = `o`.`containerId`)) GROUP BY `c`.`containerId``containerId`  ;

-- --------------------------------------------------------

--
-- Structure for view `Percentage of clients have requested product "Smartphone"`
--
DROP TABLE IF EXISTS `Percentage of clients have requested product "Smartphone"`;

CREATE ALGORITHM=UNDEFINED DEFINER=`HAN21080527`@`%` SQL SECURITY DEFINER VIEW `Percentage of clients have requested product "Smartphone"`  AS SELECT count(distinct `CusOrder`.`customerId`) / (select count(distinct `CusOrder`.`customerId`) from `CusOrder`) * 100 AS `percentage` FROM `CusOrder` WHERE `CusOrder`.`orderId` in (select `Item`.`orderId` from `Item` where `Item`.`itemId` = 50)  ;

-- --------------------------------------------------------

--
-- Structure for view `The delay delivery date of each container`
--
DROP TABLE IF EXISTS `The delay delivery date of each container`;

CREATE ALGORITHM=UNDEFINED DEFINER=`HAN21080527`@`%` SQL SECURITY DEFINER VIEW `The delay delivery date of each container`  AS SELECT `c`.`containerId` AS `containerId`, `d`.`expectedDeliveryDate` AS `expectedDeliveryDate`, `d`.`actualDeliveryDate` AS `actualDeliveryDate`, timestampdiff(DAY,`d`.`expectedDeliveryDate`,`d`.`actualDeliveryDate`) AS `delivery_delay` FROM (`Delivery` `d` join `Container` `c` on(`d`.`containerId` = `c`.`containerId`))  ;

-- --------------------------------------------------------

--
-- Structure for view `The percentage of customer paid their order in each country`
--
DROP TABLE IF EXISTS `The percentage of customer paid their order in each country`;

CREATE ALGORITHM=UNDEFINED DEFINER=`HAN21080527`@`%` SQL SECURITY DEFINER VIEW `The percentage of customer paid their order in each country`  AS SELECT `c`.`country` AS `country`, count(distinct `o`.`customerId`) AS `total_customers`, count(distinct case when `p`.`invoicePaid` = 1 then `o`.`customerId` end) AS `paid_customers`, count(distinct case when `p`.`invoicePaid` = 1 then `o`.`customerId` end) / count(distinct `o`.`customerId`) * 100 AS `payment_percentage` FROM (((`Customer` `c` join `CusOrder` `o` on(`c`.`customerId` = `o`.`customerId`)) join `Invoice` `i` on(`o`.`orderId` = `i`.`orderId`)) join `Payment` `p` on(`i`.`paymentId` = `p`.`paymentId`)) GROUP BY `c`.`country``country`  ;

-- --------------------------------------------------------

--
-- Structure for view `Year that has the most shipment requests`
--
DROP TABLE IF EXISTS `Year that has the most shipment requests`;

CREATE ALGORITHM=UNDEFINED DEFINER=`HAN21080527`@`%` SQL SECURITY DEFINER VIEW `Year that has the most shipment requests`  AS SELECT year(`Delivery`.`shipmentDate`) AS `year`, count(0) AS `shipment_count` FROM `Delivery` GROUP BY year(`Delivery`.`shipmentDate`) ORDER BY count(0) DESC LIMIT 0, 11  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Category`
--
ALTER TABLE `Category`
  ADD PRIMARY KEY (`categoryId`);

--
-- Indexes for table `Container`
--
ALTER TABLE `Container`
  ADD PRIMARY KEY (`containerId`);

--
-- Indexes for table `ContainerTrans`
--
ALTER TABLE `ContainerTrans`
  ADD PRIMARY KEY (`transportationId`),
  ADD KEY `containerId` (`containerId`),
  ADD KEY `departureWarehouse` (`departureWarehouse`),
  ADD KEY `destinationWarehouse` (`destinationWarehouse`);

--
-- Indexes for table `CusOrder`
--
ALTER TABLE `CusOrder`
  ADD PRIMARY KEY (`orderId`),
  ADD KEY `customerId` (`customerId`),
  ADD KEY `containerId` (`containerId`);

--
-- Indexes for table `Customer`
--
ALTER TABLE `Customer`
  ADD PRIMARY KEY (`customerId`),
  ADD UNIQUE KEY `fullName` (`fullName`);

--
-- Indexes for table `Delivery`
--
ALTER TABLE `Delivery`
  ADD PRIMARY KEY (`deliveryId`),
  ADD KEY `customerId` (`customerId`),
  ADD KEY `containerId` (`containerId`),
  ADD KEY `orderId` (`orderId`);

--
-- Indexes for table `Invoice`
--
ALTER TABLE `Invoice`
  ADD PRIMARY KEY (`invoiceId`),
  ADD KEY `customerId` (`customerId`),
  ADD KEY `orderId` (`orderId`),
  ADD KEY `paymentId` (`paymentId`);

--
-- Indexes for table `Item`
--
ALTER TABLE `Item`
  ADD KEY `orderId` (`orderId`),
  ADD KEY `itemId` (`itemId`);

--
-- Indexes for table `ItemInfo`
--
ALTER TABLE `ItemInfo`
  ADD PRIMARY KEY (`itemId`),
  ADD KEY `categoryId` (`categoryId`);

--
-- Indexes for table `Payment`
--
ALTER TABLE `Payment`
  ADD PRIMARY KEY (`paymentId`);

--
-- Indexes for table `Review`
--
ALTER TABLE `Review`
  ADD PRIMARY KEY (`reviewId`),
  ADD KEY `customerId` (`customerId`),
  ADD KEY `itemId` (`itemId`);

--
-- Indexes for table `Warehouse`
--
ALTER TABLE `Warehouse`
  ADD PRIMARY KEY (`warehouseId`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ContainerTrans`
--
ALTER TABLE `ContainerTrans`
  ADD CONSTRAINT `ContainerTrans_ibfk_1` FOREIGN KEY (`containerId`) REFERENCES `Container` (`containerId`),
  ADD CONSTRAINT `ContainerTrans_ibfk_2` FOREIGN KEY (`departureWarehouse`) REFERENCES `Warehouse` (`warehouseId`),
  ADD CONSTRAINT `ContainerTrans_ibfk_3` FOREIGN KEY (`destinationWarehouse`) REFERENCES `Warehouse` (`warehouseId`);

--
-- Constraints for table `CusOrder`
--
ALTER TABLE `CusOrder`
  ADD CONSTRAINT `CusOrder_ibfk_1` FOREIGN KEY (`customerId`) REFERENCES `Customer` (`customerId`),
  ADD CONSTRAINT `CusOrder_ibfk_2` FOREIGN KEY (`containerId`) REFERENCES `Container` (`containerId`);

--
-- Constraints for table `Delivery`
--
ALTER TABLE `Delivery`
  ADD CONSTRAINT `Delivery_ibfk_1` FOREIGN KEY (`customerId`) REFERENCES `Customer` (`customerId`),
  ADD CONSTRAINT `Delivery_ibfk_2` FOREIGN KEY (`containerId`) REFERENCES `Container` (`containerId`),
  ADD CONSTRAINT `Delivery_ibfk_3` FOREIGN KEY (`orderId`) REFERENCES `CusOrder` (`orderId`);

--
-- Constraints for table `Invoice`
--
ALTER TABLE `Invoice`
  ADD CONSTRAINT `Invoice_ibfk_1` FOREIGN KEY (`customerId`) REFERENCES `Customer` (`customerId`),
  ADD CONSTRAINT `Invoice_ibfk_2` FOREIGN KEY (`orderId`) REFERENCES `CusOrder` (`orderId`),
  ADD CONSTRAINT `Invoice_ibfk_3` FOREIGN KEY (`paymentId`) REFERENCES `Payment` (`paymentId`);

--
-- Constraints for table `Item`
--
ALTER TABLE `Item`
  ADD CONSTRAINT `Item_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `CusOrder` (`orderId`),
  ADD CONSTRAINT `Item_ibfk_2` FOREIGN KEY (`itemId`) REFERENCES `ItemInfo` (`itemId`);

--
-- Constraints for table `ItemInfo`
--
ALTER TABLE `ItemInfo`
  ADD CONSTRAINT `ItemInfo_ibfk_1` FOREIGN KEY (`categoryId`) REFERENCES `Category` (`categoryId`);

--
-- Constraints for table `Review`
--
ALTER TABLE `Review`
  ADD CONSTRAINT `Review_ibfk_1` FOREIGN KEY (`customerId`) REFERENCES `Customer` (`customerId`),
  ADD CONSTRAINT `Review_ibfk_2` FOREIGN KEY (`itemId`) REFERENCES `ItemInfo` (`itemId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
