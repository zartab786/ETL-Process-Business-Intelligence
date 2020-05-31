-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 25, 2020 at 07:09 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dw_etl`
--

-- --------------------------------------------------------

--
-- Table structure for table `cancel`
--

CREATE TABLE `cancel` (
  `event_sid` int(11) NOT NULL,
  `S.no` int(11) NOT NULL,
  `Event Budget` int(10) NOT NULL,
  `Resources Available` varchar(5) NOT NULL,
  `Reasons` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cancel`
--

INSERT INTO `cancel` (`event_sid`, `S.no`, `Event Budget`, `Resources Available`, `Reasons`) VALUES
(2, 1, 75000, 'No', ''),
(4, 2, 35000, 'Yes', 'Sponsorship Issue'),
(6, 3, 20000, 'No', '');

-- --------------------------------------------------------

--
-- Table structure for table `change_venue`
--

CREATE TABLE `change_venue` (
  `event_sid` int(11) NOT NULL,
  `oldvenue_sid` int(11) NOT NULL,
  `S.no` int(11) NOT NULL,
  `New Venue` varchar(25) NOT NULL,
  `Cost of change` float NOT NULL,
  `Change in Inventory` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `change_venue`
--

INSERT INTO `change_venue` (`event_sid`, `oldvenue_sid`, `S.no`, `New Venue`, `Cost of change`, `Change in Inventory`) VALUES
(13, 5, 1, 'c11', 5000, 'Lights'),
(3, 1, 2, 'gym', 1000, 'equipment'),
(6, 5, 3, 'cse lab', 2000, 'papers');

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `event_sid` int(11) NOT NULL,
  `nid` varchar(11) NOT NULL,
  `Event_id` varchar(35) NOT NULL,
  `Event_name` varchar(35) NOT NULL,
  `Update_Flag` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`event_sid`, `nid`, `Event_id`, `Event_name`, `Update_Flag`) VALUES
(1, 'n1', 'e01', 'treasure', 'N'),
(2, 'n2', 'e02', 'street dance', 'Y'),
(3, 'n3', 'e03', 'daddy\'s princess', 'Y'),
(4, 'n4', 'e04', 'face off', 'Y'),
(5, 'n5', 'e06', 'jumanji', 'Y'),
(6, 'n6', 'e07', 'singing', 'Y'),
(7, 'n7', 'e08', 'drama', 'Y'),
(12, 'n1', 'e01', 'treasure_hunt', 'N'),
(13, 'n1', 'e01', 'treasure', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `event_cost`
--

CREATE TABLE `event_cost` (
  `event_sid` int(11) NOT NULL,
  `S.no` int(11) NOT NULL,
  `No of Participants` int(10) NOT NULL,
  `Inventory Cost` float NOT NULL,
  `Prize Money` int(35) NOT NULL,
  `Setup Cost` float NOT NULL,
  `Cost for Special Requirement` float NOT NULL,
  `Event Type` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `event_cost`
--

INSERT INTO `event_cost` (`event_sid`, `S.no`, `No of Participants`, `Inventory Cost`, `Prize Money`, `Setup Cost`, `Cost for Special Requirement`, `Event Type`) VALUES
(2, 1, 200, 12000, 5000, 7000, 1000, 'Technical'),
(13, 2, 150, 300, 7500, 5000, 0, 'Non-Technical'),
(5, 3, 120, 600, 6000, 6000, 2000, 'Music'),
(6, 4, 200, 12000, 5000, 7000, 1000, 'Dance'),
(3, 5, 150, 300, 7500, 5000, 0, 'Music'),
(4, 6, 120, 600, 6000, 6000, 2000, 'Sports');

-- --------------------------------------------------------

--
-- Table structure for table `event_selection`
--

CREATE TABLE `event_selection` (
  `event_sid` int(11) NOT NULL,
  `S.no` int(11) NOT NULL,
  `Event Budget` float NOT NULL,
  `Number of Participants Expected` int(10) NOT NULL,
  `Entry Fee` float NOT NULL,
  `Management Team Size` int(10) NOT NULL,
  `Inventory Required` varchar(35) NOT NULL,
  `Venue of Event` varchar(35) NOT NULL,
  `Event Duration` int(5) NOT NULL,
  `Special Requirement` varchar(35) NOT NULL,
  `Advertisement Cost` float NOT NULL,
  `Event Type` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `event_selection`
--

INSERT INTO `event_selection` (`event_sid`, `S.no`, `Event Budget`, `Number of Participants Expected`, `Entry Fee`, `Management Team Size`, `Inventory Required`, `Venue of Event`, `Event Duration`, `Special Requirement`, `Advertisement Cost`, `Event Type`) VALUES
(13, 1, 25000, 50, 600, 8, 'Electric Guitar', 'Audi-1', 3, '', 3500, 'Music'),
(4, 3, 10000, 40, 300, 4, 'Speakers', 'Lecture Hall-1', 2, '', 1000, 'Dance'),
(2, 4, 50000, 100, 1000, 10, 'Batteries', 'Sports Ground', 4, '', 10000, 'Sports');

-- --------------------------------------------------------

--
-- Table structure for table `event_sponsors`
--

CREATE TABLE `event_sponsors` (
  `sponsor_sid` int(11) NOT NULL,
  `S.no` int(11) NOT NULL,
  `Amount Received` float NOT NULL,
  `Fund Available` float NOT NULL,
  `Refund Amount in Agreement` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `event_sponsors`
--

INSERT INTO `event_sponsors` (`sponsor_sid`, `S.no`, `Amount Received`, `Fund Available`, `Refund Amount in Agreement`) VALUES
(6, 1, 1000, 15000, 7000),
(3, 2, 2000, 5000, 2500),
(4, 3, 5000, 20000, 12500);

-- --------------------------------------------------------

--
-- Table structure for table `event_theme`
--

CREATE TABLE `event_theme` (
  `Sid` int(11) NOT NULL,
  `nid` varchar(20) NOT NULL,
  `Title` varchar(50) NOT NULL,
  `invitation` varchar(50) NOT NULL,
  `Stage_design` varchar(50) NOT NULL,
  `Update_Flag` varchar(2) DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `event_theme`
--

INSERT INTO `event_theme` (`Sid`, `nid`, `Title`, `invitation`, `Stage_design`, `Update_Flag`) VALUES
(1, 'n1', 'GOT', 'NCR', 'Rectangular', 'N'),
(2, 'n2', 'Pirates of the carrabian', 'Delhi only', 'square', 'Y'),
(3, 'n3', 'Indo-western', 'All India', 'circle', 'Y'),
(4, 'n4', 'japnese', 'Asia', 'Rectangular', 'Y'),
(5, 'n1', 'GOT', 'Goa', 'Rectangular', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `event_venue`
--

CREATE TABLE `event_venue` (
  `event_theme_sid` int(11) NOT NULL,
  `S.no` int(11) NOT NULL,
  `Number of participants` int(10) NOT NULL,
  `Event Budget` float NOT NULL,
  `Weather` varchar(20) NOT NULL,
  `Event time` time(6) NOT NULL,
  `Event Type` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `event_venue`
--

INSERT INTO `event_venue` (`event_theme_sid`, `S.no`, `Number of participants`, `Event Budget`, `Weather`, `Event time`, `Event Type`) VALUES
(3, 1, 200, 15000, 'Sunny', '11:00:00.000000', 'Non-Technical'),
(5, 2, 150, 10000, 'Sunny', '09:30:00.000000', 'Art and Culture'),
(4, 3, 120, 12000, 'Cloudy', '16:00:00.000000', 'Music');

-- --------------------------------------------------------

--
-- Table structure for table `expected_participant`
--

CREATE TABLE `expected_participant` (
  `event_sid` int(11) NOT NULL,
  `event_theme_sid` int(11) NOT NULL,
  `S.no` int(11) NOT NULL,
  `Student Interest` varchar(25) NOT NULL,
  `Entry Fee` float NOT NULL,
  `Audience Scope` varchar(5) NOT NULL,
  `Event Type` varchar(35) NOT NULL,
  `Advertisement` varchar(5) NOT NULL,
  `College Type` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `expected_participant`
--

INSERT INTO `expected_participant` (`event_sid`, `event_theme_sid`, `S.no`, `Student Interest`, `Entry Fee`, `Audience Scope`, `Event Type`, `Advertisement`, `College Type`) VALUES
(2, 5, 1, 'High', 500, 'Yes', 'Technical', 'Yes', 'Engineering'),
(3, 4, 2, 'Average', 400, 'Yes', 'Non-Technical', 'No', 'Management'),
(6, 3, 3, 'High', 600, 'No', 'Technical', 'Yes', 'Law');

-- --------------------------------------------------------

--
-- Table structure for table `fact_dimension`
--

CREATE TABLE `fact_dimension` (
  `S.no` int(11) NOT NULL,
  `Fact_name` varchar(50) NOT NULL,
  `Dimension_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fact_dimension`
--

INSERT INTO `fact_dimension` (`S.no`, `Fact_name`, `Dimension_name`) VALUES
(1, 'event_selection', 'event'),
(2, 'venue_feasibility', 'venue'),
(3, 'inventory_status', 'price'),
(4, 'cancel', 'event'),
(5, 'expected_participant', 'event'),
(6, 'expected_participant', 'event_theme'),
(8, 'event_venue', 'event_theme'),
(9, 'event_sponsors', 'sponsor'),
(10, 'change_venue', 'oldvenue'),
(11, 'change_venue', 'event'),
(12, 'weather_condition', 'season'),
(13, 'status_of_participation', 'event'),
(14, 'event_cost', 'event');

-- --------------------------------------------------------

--
-- Table structure for table `inventory_status`
--

CREATE TABLE `inventory_status` (
  `price_sid` int(11) NOT NULL,
  `S.no` int(11) NOT NULL,
  `Quality` varchar(15) NOT NULL,
  `Quantity` int(50) NOT NULL,
  `Discount` float NOT NULL,
  `Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `inventory_status`
--

INSERT INTO `inventory_status` (`price_sid`, `S.no`, `Quality`, `Quantity`, `Discount`, `Date`) VALUES
(5, 1, 'Basic', 250, 8, '2020-02-05'),
(4, 2, 'Classic', 900, 5, '2020-05-03'),
(3, 3, 'Premium', 400, 10, '2020-04-07');

-- --------------------------------------------------------

--
-- Table structure for table `oldvenue`
--

CREATE TABLE `oldvenue` (
  `Sid` int(11) NOT NULL,
  `nid` varchar(11) NOT NULL,
  `Name` varchar(10) NOT NULL,
  `Location` varchar(25) NOT NULL,
  `Capacity` int(5) NOT NULL,
  `Update_Flag` varchar(2) DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `oldvenue`
--

INSERT INTO `oldvenue` (`Sid`, `nid`, `Name`, `Location`, `Capacity`, `Update_Flag`) VALUES
(1, 'n1', 'a01', 'rnd block', 100, 'Y'),
(2, 'n2', 'a02', 'rnd block', 100, 'Y'),
(3, 'n3', 'open theat', 'rnd block', 300, 'N'),
(4, 'n4', 'ground', 'sport complex', 1000, 'Y'),
(5, 'n3', 'open theat', 'rnd block', 800, 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `price`
--

CREATE TABLE `price` (
  `Sid` int(11) NOT NULL,
  `nid` varchar(20) NOT NULL,
  `cost_price` float NOT NULL,
  `tax` float NOT NULL,
  `Update_Flag` varchar(2) DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `price`
--

INSERT INTO `price` (`Sid`, `nid`, `cost_price`, `tax`, `Update_Flag`) VALUES
(1, 'n1', 250, 5, 'N'),
(2, 'n2', 1000, 30, 'Y'),
(3, 'n3', 12000, 300, 'Y'),
(4, 'n4', 13, 0.15, 'Y'),
(5, 'n1', 250, 5, 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `season`
--

CREATE TABLE `season` (
  `Sid` int(11) NOT NULL,
  `nid` varchar(10) NOT NULL,
  `Season_name` varchar(25) NOT NULL,
  `season_duration` varchar(25) NOT NULL,
  `Update_Flag` varchar(2) DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `season`
--

INSERT INTO `season` (`Sid`, `nid`, `Season_name`, `season_duration`, `Update_Flag`) VALUES
(1, 'n1', 'autumn', '3 months', 'N'),
(2, 'n2', 'rainy', '3 months', 'Y'),
(3, 'n3', 'winter', '3 months', 'Y'),
(4, 'n4', 'summer', '3 months', 'Y'),
(5, 'n1', 'autumn', '2 month', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `sponsor`
--

CREATE TABLE `sponsor` (
  `Sid` int(11) NOT NULL,
  `nid` varchar(20) NOT NULL,
  `sponsor_id` varchar(5) NOT NULL,
  `sponsor_name` varchar(20) NOT NULL,
  `contact_person` varchar(35) NOT NULL,
  `Update_Flag` varchar(2) DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sponsor`
--

INSERT INTO `sponsor` (`Sid`, `nid`, `sponsor_id`, `sponsor_name`, `contact_person`, `Update_Flag`) VALUES
(1, 'n1', 's01', 'TCS', 'head operation', 'N'),
(2, 'n2', 's02', 'Monster', 'head event', 'N'),
(3, 'n3', 's03', 'Manforce', 'incharge event', 'Y'),
(4, 'n4', 's04', 'tinder', 'seceratary', 'Y'),
(5, 'n1', 's01', 'HP', 'head operation', 'Y'),
(6, 'n2', 's02', 'Dell', 'head event', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `status_of_participation`
--

CREATE TABLE `status_of_participation` (
  `event_sid` int(11) NOT NULL,
  `S.no` int(11) NOT NULL,
  `Current Strength` int(5) NOT NULL,
  `Required Strength` int(5) NOT NULL,
  `Amount Received` float NOT NULL,
  `Total Amount Required` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `status_of_participation`
--

INSERT INTO `status_of_participation` (`event_sid`, `S.no`, `Current Strength`, `Required Strength`, `Amount Received`, `Total Amount Required`) VALUES
(2, 1, 200, 550, 20000, 55000),
(4, 2, 150, 300, 7500, 15000),
(6, 3, 120, 600, 6000, 30000);

-- --------------------------------------------------------

--
-- Table structure for table `venue`
--

CREATE TABLE `venue` (
  `Sid` int(11) NOT NULL,
  `nid` varchar(20) NOT NULL,
  `Name` varchar(5) NOT NULL,
  `Location` varchar(35) NOT NULL,
  `Capacity` int(5) NOT NULL,
  `Update_Flag` varchar(2) DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `venue`
--

INSERT INTO `venue` (`Sid`, `nid`, `Name`, `Location`, `Capacity`, `Update_Flag`) VALUES
(1, 'n1', 'c01', 'old acadmic block', 150, 'Y'),
(2, 'n2', 'c02', 'old acadmic block', 150, 'Y'),
(3, 'n3', 'c301', 'Seminar block', 300, 'Y'),
(4, 'n4', 'c302', 'Seminar block', 300, 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `venue_feasibility`
--

CREATE TABLE `venue_feasibility` (
  `venue_sid` int(11) NOT NULL,
  `S.no` int(11) NOT NULL,
  `Venue Capacity` int(5) NOT NULL,
  `Require Capacity` int(5) NOT NULL,
  `Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `venue_feasibility`
--

INSERT INTO `venue_feasibility` (`venue_sid`, `S.no`, `Venue Capacity`, `Require Capacity`, `Date`) VALUES
(4, 1, 300, 250, '2020-04-07'),
(1, 2, 1000, 900, '2020-03-13'),
(2, 3, 500, 400, '2020-04-07'),
(3, 4, 600, 550, '2020-04-15');

-- --------------------------------------------------------

--
-- Table structure for table `weather_condition`
--

CREATE TABLE `weather_condition` (
  `season_sid` int(11) NOT NULL,
  `S.no` int(11) NOT NULL,
  `Weather Forecasting` varchar(20) NOT NULL,
  `Location Required` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `weather_condition`
--

INSERT INTO `weather_condition` (`season_sid`, `S.no`, `Weather Forecasting`, `Location Required`) VALUES
(2, 1, 'sunny', 'ground'),
(5, 2, 'cloudy', 'canteen'),
(4, 3, 'rainy', 'gym');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cancel`
--
ALTER TABLE `cancel`
  ADD PRIMARY KEY (`S.no`),
  ADD KEY `cons_4` (`event_sid`);

--
-- Indexes for table `change_venue`
--
ALTER TABLE `change_venue`
  ADD PRIMARY KEY (`S.no`),
  ADD KEY `cons_9` (`event_sid`),
  ADD KEY `cons_10` (`oldvenue_sid`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`event_sid`);

--
-- Indexes for table `event_cost`
--
ALTER TABLE `event_cost`
  ADD PRIMARY KEY (`S.no`),
  ADD KEY `cons_13` (`event_sid`);

--
-- Indexes for table `event_selection`
--
ALTER TABLE `event_selection`
  ADD PRIMARY KEY (`S.no`),
  ADD KEY `cons_1` (`event_sid`);

--
-- Indexes for table `event_sponsors`
--
ALTER TABLE `event_sponsors`
  ADD PRIMARY KEY (`S.no`),
  ADD KEY `cons_8` (`sponsor_sid`);

--
-- Indexes for table `event_theme`
--
ALTER TABLE `event_theme`
  ADD PRIMARY KEY (`Sid`);

--
-- Indexes for table `event_venue`
--
ALTER TABLE `event_venue`
  ADD PRIMARY KEY (`S.no`),
  ADD KEY `cons_7` (`event_theme_sid`);

--
-- Indexes for table `expected_participant`
--
ALTER TABLE `expected_participant`
  ADD PRIMARY KEY (`S.no`),
  ADD KEY `cons_5` (`event_sid`),
  ADD KEY `cons_6` (`event_theme_sid`);

--
-- Indexes for table `fact_dimension`
--
ALTER TABLE `fact_dimension`
  ADD PRIMARY KEY (`S.no`);

--
-- Indexes for table `inventory_status`
--
ALTER TABLE `inventory_status`
  ADD PRIMARY KEY (`S.no`),
  ADD KEY `cons_3` (`price_sid`);

--
-- Indexes for table `oldvenue`
--
ALTER TABLE `oldvenue`
  ADD PRIMARY KEY (`Sid`);

--
-- Indexes for table `price`
--
ALTER TABLE `price`
  ADD PRIMARY KEY (`Sid`);

--
-- Indexes for table `season`
--
ALTER TABLE `season`
  ADD PRIMARY KEY (`Sid`);

--
-- Indexes for table `sponsor`
--
ALTER TABLE `sponsor`
  ADD PRIMARY KEY (`Sid`);

--
-- Indexes for table `status_of_participation`
--
ALTER TABLE `status_of_participation`
  ADD PRIMARY KEY (`S.no`),
  ADD KEY `cons_12` (`event_sid`);

--
-- Indexes for table `venue`
--
ALTER TABLE `venue`
  ADD PRIMARY KEY (`Sid`);

--
-- Indexes for table `venue_feasibility`
--
ALTER TABLE `venue_feasibility`
  ADD PRIMARY KEY (`S.no`),
  ADD KEY `cons_2` (`venue_sid`);

--
-- Indexes for table `weather_condition`
--
ALTER TABLE `weather_condition`
  ADD PRIMARY KEY (`S.no`),
  ADD KEY `cons_11` (`season_sid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cancel`
--
ALTER TABLE `cancel`
  MODIFY `S.no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `change_venue`
--
ALTER TABLE `change_venue`
  MODIFY `S.no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `event_sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `event_cost`
--
ALTER TABLE `event_cost`
  MODIFY `S.no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `event_selection`
--
ALTER TABLE `event_selection`
  MODIFY `S.no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `event_sponsors`
--
ALTER TABLE `event_sponsors`
  MODIFY `S.no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `event_theme`
--
ALTER TABLE `event_theme`
  MODIFY `Sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `event_venue`
--
ALTER TABLE `event_venue`
  MODIFY `S.no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `expected_participant`
--
ALTER TABLE `expected_participant`
  MODIFY `S.no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `fact_dimension`
--
ALTER TABLE `fact_dimension`
  MODIFY `S.no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `inventory_status`
--
ALTER TABLE `inventory_status`
  MODIFY `S.no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `oldvenue`
--
ALTER TABLE `oldvenue`
  MODIFY `Sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `price`
--
ALTER TABLE `price`
  MODIFY `Sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `season`
--
ALTER TABLE `season`
  MODIFY `Sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sponsor`
--
ALTER TABLE `sponsor`
  MODIFY `Sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `status_of_participation`
--
ALTER TABLE `status_of_participation`
  MODIFY `S.no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `venue`
--
ALTER TABLE `venue`
  MODIFY `Sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `venue_feasibility`
--
ALTER TABLE `venue_feasibility`
  MODIFY `S.no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `weather_condition`
--
ALTER TABLE `weather_condition`
  MODIFY `S.no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cancel`
--
ALTER TABLE `cancel`
  ADD CONSTRAINT `cons_4` FOREIGN KEY (`event_sid`) REFERENCES `event` (`event_sid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `change_venue`
--
ALTER TABLE `change_venue`
  ADD CONSTRAINT `cons_10` FOREIGN KEY (`oldvenue_sid`) REFERENCES `oldvenue` (`Sid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cons_9` FOREIGN KEY (`event_sid`) REFERENCES `event` (`event_sid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `event_cost`
--
ALTER TABLE `event_cost`
  ADD CONSTRAINT `cons_13` FOREIGN KEY (`event_sid`) REFERENCES `event` (`event_sid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `event_selection`
--
ALTER TABLE `event_selection`
  ADD CONSTRAINT `cons_1` FOREIGN KEY (`event_sid`) REFERENCES `event` (`event_sid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `event_sponsors`
--
ALTER TABLE `event_sponsors`
  ADD CONSTRAINT `cons_8` FOREIGN KEY (`sponsor_sid`) REFERENCES `sponsor` (`Sid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `event_venue`
--
ALTER TABLE `event_venue`
  ADD CONSTRAINT `cons_7` FOREIGN KEY (`event_theme_sid`) REFERENCES `event_theme` (`Sid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `expected_participant`
--
ALTER TABLE `expected_participant`
  ADD CONSTRAINT `cons_5` FOREIGN KEY (`event_sid`) REFERENCES `event` (`event_sid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cons_6` FOREIGN KEY (`event_theme_sid`) REFERENCES `event_theme` (`Sid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `inventory_status`
--
ALTER TABLE `inventory_status`
  ADD CONSTRAINT `cons_3` FOREIGN KEY (`price_sid`) REFERENCES `price` (`Sid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `status_of_participation`
--
ALTER TABLE `status_of_participation`
  ADD CONSTRAINT `cons_12` FOREIGN KEY (`event_sid`) REFERENCES `event` (`event_sid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `venue_feasibility`
--
ALTER TABLE `venue_feasibility`
  ADD CONSTRAINT `cons_2` FOREIGN KEY (`venue_sid`) REFERENCES `venue` (`Sid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `weather_condition`
--
ALTER TABLE `weather_condition`
  ADD CONSTRAINT `cons_11` FOREIGN KEY (`season_sid`) REFERENCES `season` (`Sid`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
