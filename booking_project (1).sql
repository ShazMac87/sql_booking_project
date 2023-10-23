-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Oct 23, 2023 at 08:49 PM
-- Server version: 5.7.39
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `booking_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `accessibility`
--

CREATE TABLE `accessibility` (
  `access_id` int(11) NOT NULL,
  `access_type` varchar(255) NOT NULL,
  `access_desc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `accomodation`
--

CREATE TABLE `accomodation` (
  `acc_id` int(11) NOT NULL,
  `sustainability_id` int(11) NOT NULL,
  `acc_name` varchar(255) NOT NULL,
  `accaddress_id` int(11) NOT NULL,
  `acctype_id` varchar(255) NOT NULL,
  `accbrand_id` varchar(255) NOT NULL,
  `acc_image` varbinary(11) NOT NULL,
  `acc_description` text NOT NULL,
  `acc_longitude` point NOT NULL,
  `acc_latitude` point NOT NULL,
  `policy_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `accomodation_brand`
--

CREATE TABLE `accomodation_brand` (
  `abrand_id` int(11) NOT NULL,
  `abrand_name` varchar(255) NOT NULL,
  `abrand_review` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `accomodation_facilities`
--

CREATE TABLE `accomodation_facilities` (
  `accfac_id` int(11) NOT NULL,
  `accfac_name` varchar(255) NOT NULL,
  `accfac_desc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `accomodation_type`
--

CREATE TABLE `accomodation_type` (
  `acctype_id` int(11) NOT NULL,
  `acctype_name` varchar(255) NOT NULL,
  `acctype_desc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `acc_accomodation_facilities`
--

CREATE TABLE `acc_accomodation_facilities` (
  `acc_accfac_id` int(11) NOT NULL,
  `accfac_id` int(11) NOT NULL,
  `acc_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `address_id` int(11) NOT NULL,
  `house_no` int(11) NOT NULL,
  `street_name` varchar(255) NOT NULL,
  `city_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`address_id`, `house_no`, `street_name`, `city_id`) VALUES
(1, 99, 'omagh rd', 1);

-- --------------------------------------------------------

--
-- Table structure for table `bed`
--

CREATE TABLE `bed` (
  `bed_id` int(11) NOT NULL,
  `bed_type` varchar(255) NOT NULL,
  `bed_desc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `booking_id` int(11) NOT NULL,
  `discount_id` int(11) NOT NULL,
  `cust_id` int(11) NOT NULL,
  `policy_id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL,
  `acc_id` int(11) NOT NULL,
  `booking_in` date NOT NULL,
  `booking_out` date NOT NULL,
  `booking_length` int(3) NOT NULL,
  `booking_children` int(3) NOT NULL,
  `booking_adults` int(3) NOT NULL,
  `arrivaltime` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `booking_line_item`
--

CREATE TABLE `booking_line_item` (
  `bli_id` int(11) NOT NULL,
  `bli_name` varchar(255) NOT NULL,
  `bli_desc` text NOT NULL,
  `bli_cost` decimal(2,2) NOT NULL,
  `bli_booking_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `booking_search_location`
--

CREATE TABLE `booking_search_location` (
  `bsearchlocation_id` int(11) NOT NULL,
  `bslocation` varchar(255) NOT NULL,
  `acc_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `booking_search_price`
--

CREATE TABLE `booking_search_price` (
  `bsearchprice_id` int(11) NOT NULL,
  `bsprice` int(11) NOT NULL,
  `room_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `booking_search_rating`
--

CREATE TABLE `booking_search_rating` (
  `bsearchrating_id` int(11) NOT NULL,
  `bsrating` int(11) NOT NULL,
  `acc_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `breakfast`
--

CREATE TABLE `breakfast` (
  `breakfast_id` int(11) NOT NULL,
  `br_type` varchar(255) NOT NULL,
  `br_cost` decimal(2,2) NOT NULL,
  `br_quantity` int(11) NOT NULL,
  `rmbooking_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `card_address`
--

CREATE TABLE `card_address` (
  `cardaddress_id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL,
  `address_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `city_id` int(11) NOT NULL,
  `city_name` varchar(255) NOT NULL,
  `country_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `contact_id` int(11) NOT NULL,
  `cust_id` int(11) NOT NULL,
  `con_phone` int(11) NOT NULL,
  `con_email` varchar(255) NOT NULL,
  `address_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`contact_id`, `cust_id`, `con_phone`, `con_email`, `address_id`) VALUES
(1, 1, 288712312, 'dermot@thefarm.com', 1);

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `country_id` int(11) NOT NULL,
  `country_name` varchar(255) NOT NULL,
  `currency_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `currency`
--

CREATE TABLE `currency` (
  `curr_id` int(11) NOT NULL,
  `curr_name` varchar(255) NOT NULL,
  `country_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `cust_id` int(11) NOT NULL,
  `cust_fname` varchar(255) NOT NULL,
  `cust_lname` varchar(255) NOT NULL,
  `contact_id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL,
  `cuscon_id` int(11) NOT NULL,
  `bhistory_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`cust_id`, `cust_fname`, `cust_lname`, `contact_id`, `payment_id`, `cuscon_id`, `bhistory_id`) VALUES
(1, 'dermot', 'mcaleer', 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `customer_contact`
--

CREATE TABLE `customer_contact` (
  `cuscon_id` int(11) NOT NULL,
  `cust_id` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL,
  `cuscon_pref` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer_contact`
--

INSERT INTO `customer_contact` (`cuscon_id`, `cust_id`, `contact_id`, `cuscon_pref`) VALUES
(1, 1, 1, 'email or phone');

-- --------------------------------------------------------

--
-- Table structure for table `discount`
--

CREATE TABLE `discount` (
  `discount_id` int(11) NOT NULL,
  `dis_type` varchar(255) NOT NULL,
  `dis_value` decimal(2,2) NOT NULL,
  `dis_from` date NOT NULL,
  `dis_to` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fun_things_to_do`
--

CREATE TABLE `fun_things_to_do` (
  `fttd_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `fftd_desc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `guest`
--

CREATE TABLE `guest` (
  `guest_id` int(11) NOT NULL,
  `cust_id` int(11) NOT NULL,
  `guest_name` varchar(255) NOT NULL,
  `guest_email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `landmark`
--

CREATE TABLE `landmark` (
  `landmark_id` int(11) NOT NULL,
  `lm_name` varchar(255) NOT NULL,
  `lm_desc` text NOT NULL,
  `city_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `log_in`
--

CREATE TABLE `log_in` (
  `login_id` int(11) NOT NULL,
  `cust_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varbinary(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `cust_id` int(11) NOT NULL,
  `card_type` varchar(255) NOT NULL,
  `card_no` int(16) NOT NULL,
  `card_exp` int(4) NOT NULL,
  `cardaddress_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `poi`
--

CREATE TABLE `poi` (
  `poi_id` int(11) NOT NULL,
  `poi_name` varchar(255) NOT NULL,
  `poi_description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `poi_accom`
--

CREATE TABLE `poi_accom` (
  `poiacc_id` int(11) NOT NULL,
  `poi_id` int(11) NOT NULL,
  `acc_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `policy`
--

CREATE TABLE `policy` (
  `policy_id` int(11) NOT NULL,
  `policy_type` varchar(255) NOT NULL,
  `policy_desc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rm_room_facilities`
--

CREATE TABLE `rm_room_facilities` (
  `room_rfac_id` int(11) NOT NULL,
  `rfac_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `room_id` int(11) NOT NULL,
  `acc_id` int(11) NOT NULL,
  `breakfast_id` int(11) NOT NULL,
  `roomtype_id` int(11) NOT NULL,
  `policy_id` int(11) NOT NULL,
  `room_cost` decimal(2,2) NOT NULL,
  `room_from` date NOT NULL,
  `room_to` date NOT NULL,
  `currency_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `room_booking`
--

CREATE TABLE `room_booking` (
  `rmbooking_id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `acc_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `room_facility`
--

CREATE TABLE `room_facility` (
  `rfac_id` int(11) NOT NULL,
  `rfac_name` varchar(255) NOT NULL,
  `rfac_desc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `room_type`
--

CREATE TABLE `room_type` (
  `rtype_id` int(11) NOT NULL,
  `rtype_name` varchar(255) NOT NULL,
  `rtype_size` int(11) NOT NULL,
  `rtype_capacity` int(11) NOT NULL,
  `bed_id` int(11) NOT NULL,
  `bed_quantity` int(11) NOT NULL,
  `room_rfac_id` int(11) NOT NULL,
  `access_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sustainability`
--

CREATE TABLE `sustainability` (
  `sustainability_id` int(11) NOT NULL,
  `sus_number` int(11) NOT NULL,
  `sus_desc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accessibility`
--
ALTER TABLE `accessibility`
  ADD PRIMARY KEY (`access_id`);

--
-- Indexes for table `accomodation`
--
ALTER TABLE `accomodation`
  ADD PRIMARY KEY (`acc_id`);

--
-- Indexes for table `accomodation_brand`
--
ALTER TABLE `accomodation_brand`
  ADD PRIMARY KEY (`abrand_id`);

--
-- Indexes for table `accomodation_facilities`
--
ALTER TABLE `accomodation_facilities`
  ADD PRIMARY KEY (`accfac_id`);

--
-- Indexes for table `accomodation_type`
--
ALTER TABLE `accomodation_type`
  ADD PRIMARY KEY (`acctype_id`);

--
-- Indexes for table `acc_accomodation_facilities`
--
ALTER TABLE `acc_accomodation_facilities`
  ADD PRIMARY KEY (`acc_accfac_id`);

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD KEY `FK_contact_address_id` (`address_id`);

--
-- Indexes for table `bed`
--
ALTER TABLE `bed`
  ADD PRIMARY KEY (`bed_id`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`booking_id`);

--
-- Indexes for table `booking_line_item`
--
ALTER TABLE `booking_line_item`
  ADD PRIMARY KEY (`bli_id`);

--
-- Indexes for table `booking_search_location`
--
ALTER TABLE `booking_search_location`
  ADD PRIMARY KEY (`bsearchlocation_id`);

--
-- Indexes for table `booking_search_price`
--
ALTER TABLE `booking_search_price`
  ADD PRIMARY KEY (`bsearchprice_id`);

--
-- Indexes for table `booking_search_rating`
--
ALTER TABLE `booking_search_rating`
  ADD PRIMARY KEY (`bsearchrating_id`);

--
-- Indexes for table `breakfast`
--
ALTER TABLE `breakfast`
  ADD PRIMARY KEY (`breakfast_id`);

--
-- Indexes for table `card_address`
--
ALTER TABLE `card_address`
  ADD PRIMARY KEY (`cardaddress_id`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`city_id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`contact_id`),
  ADD KEY `address_id` (`address_id`),
  ADD KEY `FK_contact_customer_id` (`cust_id`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`country_id`);

--
-- Indexes for table `currency`
--
ALTER TABLE `currency`
  ADD PRIMARY KEY (`curr_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`cust_id`);

--
-- Indexes for table `customer_contact`
--
ALTER TABLE `customer_contact`
  ADD PRIMARY KEY (`cuscon_id`);

--
-- Indexes for table `discount`
--
ALTER TABLE `discount`
  ADD PRIMARY KEY (`discount_id`);

--
-- Indexes for table `fun_things_to_do`
--
ALTER TABLE `fun_things_to_do`
  ADD PRIMARY KEY (`fttd_id`);

--
-- Indexes for table `guest`
--
ALTER TABLE `guest`
  ADD PRIMARY KEY (`guest_id`);

--
-- Indexes for table `landmark`
--
ALTER TABLE `landmark`
  ADD PRIMARY KEY (`landmark_id`);

--
-- Indexes for table `log_in`
--
ALTER TABLE `log_in`
  ADD PRIMARY KEY (`login_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `poi`
--
ALTER TABLE `poi`
  ADD PRIMARY KEY (`poi_id`);

--
-- Indexes for table `poi_accom`
--
ALTER TABLE `poi_accom`
  ADD PRIMARY KEY (`poiacc_id`);

--
-- Indexes for table `policy`
--
ALTER TABLE `policy`
  ADD PRIMARY KEY (`policy_id`);

--
-- Indexes for table `rm_room_facilities`
--
ALTER TABLE `rm_room_facilities`
  ADD PRIMARY KEY (`room_rfac_id`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`room_id`);

--
-- Indexes for table `room_booking`
--
ALTER TABLE `room_booking`
  ADD PRIMARY KEY (`rmbooking_id`);

--
-- Indexes for table `room_facility`
--
ALTER TABLE `room_facility`
  ADD PRIMARY KEY (`rfac_id`);

--
-- Indexes for table `sustainability`
--
ALTER TABLE `sustainability`
  ADD PRIMARY KEY (`sustainability_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accessibility`
--
ALTER TABLE `accessibility`
  MODIFY `access_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `accomodation`
--
ALTER TABLE `accomodation`
  MODIFY `acc_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `accomodation_brand`
--
ALTER TABLE `accomodation_brand`
  MODIFY `abrand_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `accomodation_facilities`
--
ALTER TABLE `accomodation_facilities`
  MODIFY `accfac_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `accomodation_type`
--
ALTER TABLE `accomodation_type`
  MODIFY `acctype_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `acc_accomodation_facilities`
--
ALTER TABLE `acc_accomodation_facilities`
  MODIFY `acc_accfac_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bed`
--
ALTER TABLE `bed`
  MODIFY `bed_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `booking_line_item`
--
ALTER TABLE `booking_line_item`
  MODIFY `bli_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `booking_search_location`
--
ALTER TABLE `booking_search_location`
  MODIFY `bsearchlocation_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `booking_search_price`
--
ALTER TABLE `booking_search_price`
  MODIFY `bsearchprice_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `booking_search_rating`
--
ALTER TABLE `booking_search_rating`
  MODIFY `bsearchrating_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `breakfast`
--
ALTER TABLE `breakfast`
  MODIFY `breakfast_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `card_address`
--
ALTER TABLE `card_address`
  MODIFY `cardaddress_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `city_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `contact_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `country_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currency`
--
ALTER TABLE `currency`
  MODIFY `curr_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `cust_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customer_contact`
--
ALTER TABLE `customer_contact`
  MODIFY `cuscon_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `discount`
--
ALTER TABLE `discount`
  MODIFY `discount_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fun_things_to_do`
--
ALTER TABLE `fun_things_to_do`
  MODIFY `fttd_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `guest`
--
ALTER TABLE `guest`
  MODIFY `guest_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `landmark`
--
ALTER TABLE `landmark`
  MODIFY `landmark_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `log_in`
--
ALTER TABLE `log_in`
  MODIFY `login_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `poi`
--
ALTER TABLE `poi`
  MODIFY `poi_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `poi_accom`
--
ALTER TABLE `poi_accom`
  MODIFY `poiacc_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `policy`
--
ALTER TABLE `policy`
  MODIFY `policy_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rm_room_facilities`
--
ALTER TABLE `rm_room_facilities`
  MODIFY `room_rfac_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `room_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `room_booking`
--
ALTER TABLE `room_booking`
  MODIFY `rmbooking_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `room_facility`
--
ALTER TABLE `room_facility`
  MODIFY `rfac_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sustainability`
--
ALTER TABLE `sustainability`
  MODIFY `sustainability_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `contact`
--
ALTER TABLE `contact`
  ADD CONSTRAINT `FK_contact_customer_id` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`cust_id`),
  ADD CONSTRAINT `contact_ibfk_1` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
