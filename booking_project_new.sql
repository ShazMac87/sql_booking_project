-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Oct 25, 2023 at 07:58 PM
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
-- Database: `booking_project_new`
--

-- --------------------------------------------------------

--
-- Table structure for table `accessibility`
--

CREATE TABLE `accessibility` (
  `access_id` int(11) NOT NULL,
  `access_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `accomodation`
--

CREATE TABLE `accomodation` (
  `acc_id` int(11) NOT NULL,
  `acc_name` varchar(255) NOT NULL,
  `sustainability_id` int(11) NOT NULL,
  `accaddress_id` int(11) NOT NULL,
  `acctype_id` int(11) NOT NULL,
  `accbrand_id` int(11) NOT NULL,
  `acc_description` text NOT NULL,
  `acc_longitude` int(11) NOT NULL,
  `acc_latitude` int(11) NOT NULL,
  `policy_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `accomodation type`
--

CREATE TABLE `accomodation type` (
  `acctype_id` int(11) NOT NULL,
  `acctype_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `accomodation_accessibility`
--

CREATE TABLE `accomodation_accessibility` (
  `access_acc_id` int(11) NOT NULL,
  `access_id` int(11) NOT NULL,
  `acc_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `accomodation_address`
--

CREATE TABLE `accomodation_address` (
  `acc_address_id` int(11) NOT NULL,
  `accbuilding_no` int(11) NOT NULL,
  `accbuilding_name` varchar(255) NOT NULL,
  `accadd_line_one` varchar(255) NOT NULL,
  `accadd_line_two` varchar(255) NOT NULL,
  `accpostcode_zip` varchar(255) NOT NULL,
  `city_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `accomodation_brand`
--

CREATE TABLE `accomodation_brand` (
  `accbrand_id` int(11) NOT NULL,
  `accbrand_name` varchar(255) NOT NULL,
  `accbrand_star_rating` int(1) NOT NULL
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
-- Table structure for table `accomodation_fftd`
--

CREATE TABLE `accomodation_fftd` (
  `acc_fftd_id` int(11) NOT NULL,
  `acc_id` int(11) NOT NULL,
  `fftd_id` int(11) NOT NULL
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

--
-- Dumping data for table `acc_accomodation_facilities`
--

INSERT INTO `acc_accomodation_facilities` (`acc_accfac_id`, `accfac_id`, `acc_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 2),
(4, 2, 3),
(5, 3, 3),
(6, 3, 4),
(7, 4, 4),
(8, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `address_id` int(11) NOT NULL,
  `building_no` int(11) NOT NULL,
  `building_name` varchar(255) NOT NULL,
  `add_line_one` varchar(255) NOT NULL,
  `add_line_two` varchar(255) NOT NULL,
  `postcode_zip` varchar(255) NOT NULL,
  `city_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bed`
--

CREATE TABLE `bed` (
  `bed_id` int(11) NOT NULL,
  `bed_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `booking_accomodation`
--

CREATE TABLE `booking_accomodation` (
  `booking_acc_id` int(11) NOT NULL,
  `booking_in` date NOT NULL,
  `booking_out` date NOT NULL,
  `booking_length` int(11) NOT NULL,
  `booking_made` date NOT NULL,
  `booking_confirmation` varchar(11) NOT NULL,
  `cust_account_id` int(11) NOT NULL,
  `booking_cost` decimal(2,2) NOT NULL,
  `booking_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `booking_line_item`
--

CREATE TABLE `booking_line_item` (
  `bli_id` int(11) NOT NULL,
  `bli_name` varchar(255) NOT NULL,
  `bli_desc` text NOT NULL,
  `bli_cost` float(2,2) NOT NULL,
  `booking_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `booking_preference`
--

CREATE TABLE `booking_preference` (
  `preference_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `booking_preference`
--

INSERT INTO `booking_preference` (`preference_id`, `currency_id`, `language_id`) VALUES
(1, 1, 1),
(2, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `booking_review`
--

CREATE TABLE `booking_review` (
  `breview_id` int(11) NOT NULL,
  `breview_guest` varchar(255) NOT NULL,
  `breview_text` text NOT NULL,
  `breview_rating` int(11) NOT NULL,
  `breview_date` date NOT NULL,
  `breview_pros` text NOT NULL,
  `breview_cons` text NOT NULL,
  `acc_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `booking_room`
--

CREATE TABLE `booking_room` (
  `booking_id` int(11) NOT NULL,
  `discount_id` int(11) NOT NULL,
  `cust_id` int(11) NOT NULL,
  `guest_id` int(11) NOT NULL,
  `booking_adults` int(2) NOT NULL,
  `booking_kids` int(2) NOT NULL,
  `room_id` int(11) NOT NULL,
  `booking_request` text NOT NULL,
  `estimated_arrival` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `breakfast`
--

CREATE TABLE `breakfast` (
  `breakfast_id` int(11) NOT NULL,
  `br_type` varchar(255) NOT NULL,
  `br_cost` decimal(2,2) NOT NULL,
  `br_quantity` int(3) NOT NULL,
  `booking_id` int(11) NOT NULL
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

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`city_id`, `city_name`, `country_id`) VALUES
(1, 'London', 1),
(2, 'Paris', 2),
(3, 'Madrid', 3),
(4, 'Amsterdam', 4),
(5, 'Tokyo', 5);

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `country_id` int(11) NOT NULL,
  `country_name` varchar(255) NOT NULL
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

--
-- Dumping data for table `currency`
--

INSERT INTO `currency` (`curr_id`, `curr_name`, `country_id`) VALUES
(1, 'GBP', 1),
(2, 'Euro', 2),
(3, 'Euro', 3),
(4, 'Euro', 4),
(5, 'Yen', 5);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `cust_id` int(11) NOT NULL,
  `cust_fname` varchar(255) NOT NULL,
  `cust_lname` varchar(255) NOT NULL,
  `cust_disname` varchar(255) NOT NULL,
  `cust_email` varchar(255) NOT NULL,
  `cust_phone` int(16) NOT NULL,
  `phone_code` int(5) NOT NULL,
  `discount_id` int(11) NOT NULL,
  `address_id` int(11) NOT NULL,
  `gender_id` int(11) NOT NULL,
  `nationality_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `customer_account`
--

CREATE TABLE `customer_account` (
  `cust_account_id` int(11) NOT NULL,
  `cust_id` int(11) NOT NULL,
  `preferences_id` int(11) NOT NULL,
  `login_id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fun_things_to_do`
--

CREATE TABLE `fun_things_to_do` (
  `fttd_id` int(11) NOT NULL,
  `fftd_name` varchar(255) NOT NULL,
  `fftd_desc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `gender`
--

CREATE TABLE `gender` (
  `gender_id` int(11) NOT NULL,
  `gender_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `genius_discount`
--

CREATE TABLE `genius_discount` (
  `discount_id` int(11) NOT NULL,
  `dis_level` int(11) NOT NULL,
  `dis_value` decimal(2,2) NOT NULL
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
-- Table structure for table `image`
--

CREATE TABLE `image` (
  `image_id` int(11) NOT NULL,
  `image_url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

CREATE TABLE `language` (
  `language_id` int(11) NOT NULL,
  `language_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `language`
--

INSERT INTO `language` (`language_id`, `language_type`) VALUES
(1, 'English'),
(2, 'French'),
(3, 'Spanish'),
(4, 'Dutch'),
(5, 'Japanese');

-- --------------------------------------------------------

--
-- Table structure for table `log_in`
--

CREATE TABLE `log_in` (
  `login_id` int(11) NOT NULL,
  `cust_id` int(11) NOT NULL,
  `cust_disname` varchar(255) NOT NULL,
  `password` varbinary(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `nationality`
--

CREATE TABLE `nationality` (
  `nationality_id` int(11) NOT NULL,
  `nationality_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `nationality`
--

INSERT INTO `nationality` (`nationality_id`, `nationality_type`) VALUES
(1, 'British'),
(2, 'French'),
(3, 'Spanish'),
(4, 'Dutch'),
(5, 'Japanese'),
(6, 'Irish'),
(7, 'American');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `card_name` varchar(255) NOT NULL,
  `card_type` varchar(255) NOT NULL,
  `card_no` int(16) NOT NULL,
  `card_exp` int(4) NOT NULL
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
  `room_cost_per_night` decimal(6,2) NOT NULL,
  `room_from` date NOT NULL,
  `room_to` date NOT NULL,
  `currency_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `room_accessibility`
--

CREATE TABLE `room_accessibility` (
  `access_rm_id` int(11) NOT NULL,
  `access_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `room_facility`
--

CREATE TABLE `room_facility` (
  `rfac_id` int(11) NOT NULL,
  `rfac_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `room_image`
--

CREATE TABLE `room_image` (
  `room_image_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `image_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `room_type`
--

CREATE TABLE `room_type` (
  `rtype_id` int(11) NOT NULL,
  `rtype_name` varchar(255) NOT NULL,
  `rtype_size` varchar(255) NOT NULL,
  `rtype_capacity` int(3) NOT NULL,
  `bed_id` int(11) NOT NULL,
  `bed_quantity` int(2) NOT NULL,
  `room_rfac_id` int(11) NOT NULL,
  `access_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sustainability`
--

CREATE TABLE `sustainability` (
  `sustainability_id` int(11) NOT NULL,
  `sus_number` int(11) NOT NULL
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
-- Indexes for table `accomodation type`
--
ALTER TABLE `accomodation type`
  ADD PRIMARY KEY (`acctype_id`);

--
-- Indexes for table `accomodation_accessibility`
--
ALTER TABLE `accomodation_accessibility`
  ADD PRIMARY KEY (`access_acc_id`);

--
-- Indexes for table `accomodation_address`
--
ALTER TABLE `accomodation_address`
  ADD PRIMARY KEY (`acc_address_id`);

--
-- Indexes for table `accomodation_brand`
--
ALTER TABLE `accomodation_brand`
  ADD PRIMARY KEY (`accbrand_id`);

--
-- Indexes for table `accomodation_facilities`
--
ALTER TABLE `accomodation_facilities`
  ADD PRIMARY KEY (`accfac_id`);

--
-- Indexes for table `accomodation_fftd`
--
ALTER TABLE `accomodation_fftd`
  ADD PRIMARY KEY (`acc_fftd_id`);

--
-- Indexes for table `acc_accomodation_facilities`
--
ALTER TABLE `acc_accomodation_facilities`
  ADD PRIMARY KEY (`acc_accfac_id`);

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`address_id`);

--
-- Indexes for table `bed`
--
ALTER TABLE `bed`
  ADD PRIMARY KEY (`bed_id`);

--
-- Indexes for table `booking_accomodation`
--
ALTER TABLE `booking_accomodation`
  ADD PRIMARY KEY (`booking_acc_id`);

--
-- Indexes for table `booking_line_item`
--
ALTER TABLE `booking_line_item`
  ADD PRIMARY KEY (`bli_id`);

--
-- Indexes for table `booking_preference`
--
ALTER TABLE `booking_preference`
  ADD PRIMARY KEY (`preference_id`);

--
-- Indexes for table `booking_review`
--
ALTER TABLE `booking_review`
  ADD PRIMARY KEY (`breview_id`);

--
-- Indexes for table `booking_room`
--
ALTER TABLE `booking_room`
  ADD PRIMARY KEY (`booking_id`);

--
-- Indexes for table `breakfast`
--
ALTER TABLE `breakfast`
  ADD PRIMARY KEY (`breakfast_id`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`city_id`);

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
-- Indexes for table `customer_account`
--
ALTER TABLE `customer_account`
  ADD PRIMARY KEY (`cust_account_id`);

--
-- Indexes for table `fun_things_to_do`
--
ALTER TABLE `fun_things_to_do`
  ADD PRIMARY KEY (`fttd_id`);

--
-- Indexes for table `gender`
--
ALTER TABLE `gender`
  ADD PRIMARY KEY (`gender_id`);

--
-- Indexes for table `guest`
--
ALTER TABLE `guest`
  ADD PRIMARY KEY (`guest_id`);

--
-- Indexes for table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`image_id`);

--
-- Indexes for table `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`language_id`);

--
-- Indexes for table `log_in`
--
ALTER TABLE `log_in`
  ADD PRIMARY KEY (`login_id`);

--
-- Indexes for table `nationality`
--
ALTER TABLE `nationality`
  ADD PRIMARY KEY (`nationality_id`);

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
-- Indexes for table `room_accessibility`
--
ALTER TABLE `room_accessibility`
  ADD PRIMARY KEY (`access_rm_id`);

--
-- Indexes for table `room_facility`
--
ALTER TABLE `room_facility`
  ADD PRIMARY KEY (`rfac_id`);

--
-- Indexes for table `room_image`
--
ALTER TABLE `room_image`
  ADD PRIMARY KEY (`room_image_id`);

--
-- Indexes for table `room_type`
--
ALTER TABLE `room_type`
  ADD PRIMARY KEY (`rtype_id`);

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
-- AUTO_INCREMENT for table `accomodation type`
--
ALTER TABLE `accomodation type`
  MODIFY `acctype_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `accomodation_accessibility`
--
ALTER TABLE `accomodation_accessibility`
  MODIFY `access_acc_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `accomodation_address`
--
ALTER TABLE `accomodation_address`
  MODIFY `acc_address_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `accomodation_brand`
--
ALTER TABLE `accomodation_brand`
  MODIFY `accbrand_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `accomodation_facilities`
--
ALTER TABLE `accomodation_facilities`
  MODIFY `accfac_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `accomodation_fftd`
--
ALTER TABLE `accomodation_fftd`
  MODIFY `acc_fftd_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `acc_accomodation_facilities`
--
ALTER TABLE `acc_accomodation_facilities`
  MODIFY `acc_accfac_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bed`
--
ALTER TABLE `bed`
  MODIFY `bed_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `booking_accomodation`
--
ALTER TABLE `booking_accomodation`
  MODIFY `booking_acc_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `booking_line_item`
--
ALTER TABLE `booking_line_item`
  MODIFY `bli_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `booking_preference`
--
ALTER TABLE `booking_preference`
  MODIFY `preference_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `booking_review`
--
ALTER TABLE `booking_review`
  MODIFY `breview_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `booking_room`
--
ALTER TABLE `booking_room`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `breakfast`
--
ALTER TABLE `breakfast`
  MODIFY `breakfast_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `city_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `country_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currency`
--
ALTER TABLE `currency`
  MODIFY `curr_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `cust_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_account`
--
ALTER TABLE `customer_account`
  MODIFY `cust_account_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fun_things_to_do`
--
ALTER TABLE `fun_things_to_do`
  MODIFY `fttd_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gender`
--
ALTER TABLE `gender`
  MODIFY `gender_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `guest`
--
ALTER TABLE `guest`
  MODIFY `guest_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `image`
--
ALTER TABLE `image`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `language`
--
ALTER TABLE `language`
  MODIFY `language_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `log_in`
--
ALTER TABLE `log_in`
  MODIFY `login_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nationality`
--
ALTER TABLE `nationality`
  MODIFY `nationality_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
-- AUTO_INCREMENT for table `room_accessibility`
--
ALTER TABLE `room_accessibility`
  MODIFY `access_rm_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `room_facility`
--
ALTER TABLE `room_facility`
  MODIFY `rfac_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `room_image`
--
ALTER TABLE `room_image`
  MODIFY `room_image_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `room_type`
--
ALTER TABLE `room_type`
  MODIFY `rtype_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sustainability`
--
ALTER TABLE `sustainability`
  MODIFY `sustainability_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
