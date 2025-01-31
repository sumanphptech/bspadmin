-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 16, 2024 at 06:29 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bsp`
--

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `tittle` varchar(255) DEFAULT NULL,
  `path` text DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `documents`
--

INSERT INTO `documents` (`id`, `student_id`, `tittle`, `path`, `created_at`, `updated_at`) VALUES
(1, 40, 'Aadhar Copy', '40/To3ICdfdrYRVpfyjcrPIy45Z8WBMFs9q6ZbGBugf.pdf', '2024-12-16 13:37:15', '2024-12-16 13:37:15'),
(2, 40, 'Bonafide Certificate', '40/eZZ6rqn5PfV8fMy2RzA6iPZQcN8xtMC4ilfbpGFK.pdf', '2024-12-16 13:37:15', '2024-12-16 13:37:15'),
(3, 40, 'Caste Certificate', '40/jW5nPWQBCEy5bhO1qpplY0EfKG89Hmui5YS3wHlj.pdf', '2024-12-16 13:37:15', '2024-12-16 13:37:15'),
(4, 40, 'Migration Certificate', '40/UT9eFa8SDDOFnNfEPStrQ0y2oy3bNyH3zPfd4WGR.pdf', '2024-12-16 13:37:15', '2024-12-16 13:37:15'),
(5, 40, 'Photocopy', '40/N4IUYRUNF1ZU5XW0nWq5ZmVhRKKaoVcBE0bverhN.pdf', '2024-12-16 13:37:15', '2024-12-16 13:37:15'),
(6, 40, 'Tenth Certificate', '40/kguazFAu7vIPDXnLOFoDhgeS2XCrKWOmQDWOMts0.pdf', '2024-12-16 13:37:15', '2024-12-16 13:37:15'),
(7, 40, 'Twelth Certificate', '40/S1fGg5h9x2w9Bahiqq4y6rOnuOlYOzQgumm5aJWy.pdf', '2024-12-16 13:37:16', '2024-12-16 13:37:16'),
(8, 41, 'Degree Provisional', '41/qxdcMeQizhTZ6fAoJNpRVUbuY8fEtRc5MJ67Xzce.pdf', '2024-12-16 16:16:39', '2024-12-16 16:16:39'),
(9, 41, 'Tenth Certificate', '41/62muHq1jwHiw7vRxIWWwAOMwWl6hbYPXerx5974A.pdf', '2024-12-16 16:16:39', '2024-12-16 16:16:39'),
(10, 43, 'Tenth Certificate', '43/wBPUBgHAWE7r9BoBzA9NZCTjUX9wKamLJ3aC9Ix6.pdf', '2024-12-16 17:05:42', '2024-12-16 17:05:42');

-- --------------------------------------------------------

--
-- Table structure for table `employment_details`
--

CREATE TABLE `employment_details` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `organization` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `employment_details`
--

INSERT INTO `employment_details` (`id`, `student_id`, `organization`, `role`, `created_at`, `updated_at`) VALUES
(3, 39, 'TCS', 'fin executive', '2024-12-16 13:34:36', '2024-12-16 13:34:36'),
(4, 40, 'TCS', 'fin executive', '2024-12-16 13:37:15', '2024-12-16 13:37:15'),
(5, 43, 'HTMT', 'Mysql Developer', '2024-12-16 17:05:41', '2024-12-16 17:05:41');

-- --------------------------------------------------------

--
-- Table structure for table `parent_details`
--

CREATE TABLE `parent_details` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `relation` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `parent_details`
--

INSERT INTO `parent_details` (`id`, `student_id`, `name`, `relation`, `mobile`, `email`, `created_at`, `updated_at`) VALUES
(39, 39, 'vamsi', 'father', '9568956858', 'vamsi@gmail.com', '2024-12-16 13:34:36', '2024-12-16 13:34:36'),
(40, 40, 'vamsi', 'father', '9568956858', 'vamsi@gmail.com', '2024-12-16 13:37:15', '2024-12-16 13:37:15'),
(41, 41, 'Venkat', 'father', '152415214', 'venkat@gmail.com', '2024-12-16 16:16:39', '2024-12-16 16:16:39'),
(42, 42, 'Prathap', 'father', '6778787878', 'prathap@gmail.com', '2024-12-16 16:28:34', '2024-12-16 16:28:34'),
(43, 43, 'vasumathi', 'mother', '8457845748', 'vasumathi@gmail.com', '2024-12-16 17:05:41', '2024-12-16 17:05:41');

-- --------------------------------------------------------

--
-- Table structure for table `referral_details`
--

CREATE TABLE `referral_details` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `program` varchar(255) DEFAULT NULL,
  `batch_year` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `referral_details`
--

INSERT INTO `referral_details` (`id`, `student_id`, `name`, `mobile`, `program`, `batch_year`, `created_at`, `updated_at`) VALUES
(3, 39, 'kiran', '5656343428', 'Bachelors', 2000, '2024-12-16 13:34:36', '2024-12-16 13:34:36'),
(4, 40, 'kiran', '5656343428', 'Bachelors', 2000, '2024-12-16 13:37:15', '2024-12-16 13:37:15'),
(5, 43, 'madhusudan', '4848484848', 'Bachelors', 1985, '2024-12-16 17:05:42', '2024-12-16 17:05:42');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `nationality` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `aadhar_no` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `pin` int(11) DEFAULT NULL,
  `qualification` varchar(255) DEFAULT NULL,
  `year_completion` int(11) DEFAULT NULL,
  `college` varchar(255) DEFAULT NULL,
  `college_city` varchar(255) DEFAULT NULL,
  `college_board` varchar(255) DEFAULT NULL,
  `employment_status` int(11) DEFAULT NULL,
  `program` int(11) DEFAULT NULL,
  `specialization` int(11) DEFAULT NULL,
  `study_mode` int(11) DEFAULT NULL,
  `referral_channel` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `name`, `dob`, `nationality`, `mobile`, `email`, `aadhar_no`, `address`, `state`, `city`, `pin`, `qualification`, `year_completion`, `college`, `college_city`, `college_board`, `employment_status`, `program`, `specialization`, `study_mode`, `referral_channel`, `created_at`, `updated_at`) VALUES
(39, 'varun', '2024-11-28', 'Indian', '7485748574', 'varun@gmail.com', '748574857485', 'sp nagar', 'telangana', 'hyderabad', 748574, '2', 2022, 'vasavi college', 'vijaywada', 'BIE', NULL, 1, 1, 1, 5, '2024-12-16 13:34:36', '2024-12-16 13:34:36'),
(40, 'reddy', '2024-11-28', 'Indian', '7485748574', 'varun@gmail.com', '748574857485', 'sp nagar', 'telangana', 'hyderabad', 748574, '2', 2022, 'vasavi college', 'vijaywada', 'BIE', NULL, 1, 1, 1, 5, '2024-12-16 13:37:15', '2024-12-16 13:37:15'),
(41, 'vishnu', '2011-01-05', 'Indian', '7485488585', 'vishnu@gmail.com', '142515241462', 'H. No : 2-2-345, Maruthi Nagar', 'Telangana', 'Hyderabad', 845748, '1', 2022, 'prathima school', 'vijayawada', 'SSC', NULL, 2, 3, 1, 3, '2024-12-16 16:16:38', '2024-12-16 16:16:38'),
(42, 'sri', '2024-11-29', 'Indian', '8457485777', 'sri@gmail.com', '142525363636', 'sr nagar', 'telanagan', 'hyderabad', 512425, '4', 1996, 'vasavi degree college', 'hyderabad', 'JNTU', NULL, 3, 2, 2, 1, '2024-12-16 16:28:34', '2024-12-16 16:28:34'),
(43, 'kamal', '2000-06-06', 'Indian', '8457845747', 'kamal@gmail.com', '512451241552', 'banjara hills', 'telangana', 'hyderabad', 512451, '2', 1982, 'Krupa college', 'khammam', 'BIE', 2, 2, 1, 1, 5, '2024-12-16 17:05:41', '2024-12-16 17:05:41');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employment_details`
--
ALTER TABLE `employment_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `parent_details`
--
ALTER TABLE `parent_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `referral_details`
--
ALTER TABLE `referral_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `employment_details`
--
ALTER TABLE `employment_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `parent_details`
--
ALTER TABLE `parent_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `referral_details`
--
ALTER TABLE `referral_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
