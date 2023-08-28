-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 28, 2023 at 07:11 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `demo_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `id` int(11) NOT NULL,
  `coach_id` int(11) NOT NULL,
  `day_of_week` varchar(255) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`id`, `coach_id`, `day_of_week`, `start_time`, `end_time`, `status`, `is_deleted`) VALUES
(1, 1, 'Monday', '09:00:00', '17:30:00', 1, 0),
(2, 1, 'Tuesday', '08:00:00', '16:00:00', 1, 0),
(3, 1, 'Thursday', '09:00:00', '16:00:00', 1, 0),
(4, 1, 'Friday', '07:00:00', '14:00:00', 1, 0),
(5, 2, 'Tuesday', '08:00:00', '10:00:00', 1, 0),
(6, 2, 'Wednesday', '11:00:00', '18:00:00', 1, 0),
(7, 2, 'Saturday', '09:00:00', '15:00:00', 1, 0),
(8, 2, 'Sunday', '08:00:00', '15:00:00', 1, 0),
(9, 3, 'Monday', '08:00:00', '10:00:00', 1, 0),
(10, 3, 'Tuesday', '11:00:00', '13:00:00', 1, 0),
(11, 3, 'Wednesday', '08:00:00', '10:00:00', 1, 0),
(12, 3, 'Saturday', '08:00:00', '11:00:00', 1, 0),
(13, 3, 'Sunday', '07:00:00', '09:00:00', 1, 0),
(14, 4, 'Monday', '09:00:00', '15:00:00', 1, 0),
(15, 4, 'Tuesday', '06:00:00', '13:00:00', 1, 0),
(16, 4, 'Wednesday', '06:00:00', '11:00:00', 1, 0),
(17, 4, 'Friday', '08:00:00', '12:00:00', 1, 0),
(18, 4, 'Saturday', '09:00:00', '16:00:00', 1, 0),
(19, 4, 'Sunday', '08:00:00', '10:00:00', 1, 0),
(20, 5, 'Thursday', '07:00:00', '14:00:00', 1, 0),
(21, 5, 'Thursday', '15:00:00', '17:00:00', 1, 0),
(22, 1, '', '08:00:00', '16:00:00', 1, 0),
(23, 1, '', '08:00:00', '16:00:00', 1, 0),
(24, 1, '', '08:00:00', '16:00:00', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `coaches`
--

CREATE TABLE `coaches` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `timezone` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `coaches`
--

INSERT INTO `coaches` (`id`, `name`, `timezone`, `status`, `is_deleted`, `created_on`, `updated_on`) VALUES
(1, 'John Doe', '(GMT-06:00) America/North_Dakota/New_Salem', 1, 0, '2023-08-25 21:52:26', '2023-08-25 18:22:15'),
(2, 'John Doe', '(GMT-06:00) Central Time (US & Canada)', 1, 0, '2023-08-25 21:53:33', '2023-08-25 18:22:15'),
(3, 'Rachel Green', '(GMT-09:00) America/Yakutat', 1, 0, '2023-08-25 21:54:55', '2023-08-25 18:22:15'),
(4, 'Margaret Houlihan', '(GMT-06:00) Central Time (US & Canada)', 1, 0, '2023-08-25 21:55:24', '2023-08-25 18:22:15'),
(5, 'Hawkeye Pierce', '(GMT-06:00) Central Time (US & Canada)', 1, 0, '2023-08-25 21:56:07', '2023-08-25 18:22:15');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `coach_id` (`coach_id`);

--
-- Indexes for table `coaches`
--
ALTER TABLE `coaches`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `coaches`
--
ALTER TABLE `coaches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`coach_id`) REFERENCES `coaches` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
