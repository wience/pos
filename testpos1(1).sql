-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 11, 2022 at 12:40 AM
-- Server version: 5.6.51-cll-lve
-- PHP Version: 7.3.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `testpos1`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_details` text COLLATE utf8mb4_unicode_ci,
  `account_type_id` int(11) DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_by` int(11) NOT NULL,
  `is_closed` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `account_transactions`
--

CREATE TABLE `account_transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `account_id` int(11) NOT NULL,
  `type` enum('debit','credit') COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_type` enum('opening_balance','fund_transfer','deposit') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(22,4) NOT NULL,
  `reff_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `operation_date` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `transaction_payment_id` int(11) DEFAULT NULL,
  `transfer_transaction_id` int(11) DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `account_types`
--

CREATE TABLE `account_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_account_type_id` int(11) DEFAULT NULL,
  `business_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `log_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `subject_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_id` int(11) DEFAULT NULL,
  `causer_id` int(11) DEFAULT NULL,
  `causer_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `properties` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity_log`
--

INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_id`, `subject_type`, `business_id`, `causer_id`, `causer_type`, `properties`, `created_at`, `updated_at`) VALUES
(1, 'default', 'po_deleted', 41, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":41,\"ref_no\":\"Jdk\"}', '2021-12-05 09:52:30', '2021-12-05 09:52:30'),
(2, 'default', 'purchase_deleted', 47, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":\"900.0000\"}}', '2021-12-05 09:52:39', '2021-12-05 09:52:39'),
(3, 'default', 'purchase_deleted', 1, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":\"500.0000\"}}', '2021-12-05 09:52:43', '2021-12-05 09:52:43'),
(4, 'default', 'sell_deleted', 63, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":63,\"invoice_no\":\"INV0000043\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"260.6400\"}}', '2021-12-05 09:53:04', '2021-12-05 09:53:04'),
(5, 'default', 'sell_deleted', 59, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":59,\"invoice_no\":\"INV0000042\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"22.5000\"}}', '2021-12-05 09:53:09', '2021-12-05 09:53:09'),
(6, 'default', 'sell_deleted', 58, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":58,\"invoice_no\":\"INV0000041\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"22.5000\"}}', '2021-12-05 09:53:18', '2021-12-05 09:53:18'),
(7, 'default', 'sell_deleted', 52, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":52,\"invoice_no\":\"0038\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"22.5000\"}}', '2021-12-05 09:53:21', '2021-12-05 09:53:21'),
(8, 'default', 'sell_deleted', 50, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":50,\"invoice_no\":\"0036\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"25.0000\"}}', '2021-12-05 09:53:24', '2021-12-05 09:53:24'),
(9, 'default', 'sell_deleted', 44, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":44,\"invoice_no\":\"0033\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"201.8800\"}}', '2021-12-05 09:53:28', '2021-12-05 09:53:28'),
(10, 'default', 'sell_deleted', 46, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":46,\"invoice_no\":\"0035\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"403.7600\"}}', '2021-12-05 09:53:30', '2021-12-05 09:53:30'),
(11, 'default', 'sell_deleted', 51, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":51,\"invoice_no\":\"0037\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"22.5000\"}}', '2021-12-05 09:53:33', '2021-12-05 09:53:33'),
(12, 'default', 'sell_deleted', 43, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":43,\"invoice_no\":\"0032\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"316.8800\"}}', '2021-12-05 09:53:37', '2021-12-05 09:53:37'),
(13, 'default', 'sell_deleted', 40, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":40,\"invoice_no\":\"0030\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"173.7600\"}}', '2021-12-05 09:53:40', '2021-12-05 09:53:40'),
(14, 'default', 'sell_deleted', 45, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":45,\"invoice_no\":\"0034\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"201.8800\"}}', '2021-12-05 09:53:43', '2021-12-05 09:53:43'),
(15, 'default', 'sell_deleted', 53, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":53,\"invoice_no\":\"0039\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"22.5000\"}}', '2021-12-05 09:53:47', '2021-12-05 09:53:47'),
(16, 'default', 'sell_deleted', 38, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":38,\"invoice_no\":\"0029\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"173.7600\"}}', '2021-12-05 09:53:50', '2021-12-05 09:53:50'),
(17, 'default', 'sell_deleted', 36, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":36,\"invoice_no\":\"0027\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"86.8800\"}}', '2021-12-05 09:53:53', '2021-12-05 09:53:53'),
(18, 'default', 'sell_deleted', 42, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":42,\"invoice_no\":\"0031\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"86.8800\"}}', '2021-12-05 09:54:02', '2021-12-05 09:54:02'),
(19, 'default', 'sell_deleted', 35, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":35,\"invoice_no\":\"0026\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"86.8800\"}}', '2021-12-05 09:54:06', '2021-12-05 09:54:06'),
(20, 'default', 'sell_deleted', 34, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":34,\"invoice_no\":\"0025\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"86.8800\"}}', '2021-12-05 09:54:10', '2021-12-05 09:54:10'),
(21, 'default', 'sell_deleted', 32, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":32,\"invoice_no\":\"0023\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"86.8800\"}}', '2021-12-05 09:54:14', '2021-12-05 09:54:14'),
(22, 'default', 'sell_deleted', 33, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":33,\"invoice_no\":\"0024\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"86.8800\"}}', '2021-12-05 09:54:20', '2021-12-05 09:54:20'),
(23, 'default', 'sell_deleted', 37, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":37,\"invoice_no\":\"0028\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"86.8800\"}}', '2021-12-05 09:54:24', '2021-12-05 09:54:24'),
(24, 'default', 'sell_deleted', 30, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":30,\"invoice_no\":\"0021\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"12.5000\"}}', '2021-12-05 09:54:27', '2021-12-05 09:54:27'),
(25, 'default', 'sell_deleted', 28, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":28,\"invoice_no\":\"0019\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"12.5000\"}}', '2021-12-05 09:54:30', '2021-12-05 09:54:30'),
(26, 'default', 'sell_deleted', 29, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":29,\"invoice_no\":\"0020\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"968.8000\"}}', '2021-12-05 09:54:34', '2021-12-05 09:54:34'),
(27, 'default', 'sell_deleted', 27, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":27,\"invoice_no\":\"0018\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"86.8800\"}}', '2021-12-05 09:54:37', '2021-12-05 09:54:37'),
(28, 'default', 'sell_deleted', 26, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":26,\"invoice_no\":\"0017\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"12.5000\"}}', '2021-12-05 09:54:42', '2021-12-05 09:54:42'),
(29, 'default', 'sell_deleted', 31, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":31,\"invoice_no\":\"0022\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"533.7800\"}}', '2021-12-05 09:54:47', '2021-12-05 09:54:47'),
(30, 'default', 'sell_deleted', 25, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":25,\"invoice_no\":\"0016\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"211.2600\"}}', '2021-12-05 09:54:51', '2021-12-05 09:54:51'),
(31, 'default', 'sell_deleted', 24, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":24,\"invoice_no\":\"0015\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"37.5000\"}}', '2021-12-05 09:54:57', '2021-12-05 09:54:57'),
(32, 'default', 'sell_deleted', 23, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":23,\"invoice_no\":\"0014\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"380.6500\"}}', '2021-12-05 09:55:00', '2021-12-05 09:55:00'),
(33, 'default', 'sell_deleted', 20, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":20,\"invoice_no\":\"0012\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"124.3800\"}}', '2021-12-05 09:55:07', '2021-12-05 09:55:07'),
(34, 'default', 'sell_deleted', 18, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":18,\"invoice_no\":\"0010\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"285.6400\"}}', '2021-12-05 09:55:11', '2021-12-05 09:55:11'),
(35, 'default', 'sell_deleted', 21, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":21,\"invoice_no\":\"0013\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"75.0000\"}}', '2021-12-05 09:55:22', '2021-12-05 09:55:22'),
(36, 'default', 'sell_deleted', 19, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":19,\"invoice_no\":\"0011\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"45.0000\"}}', '2021-12-05 09:55:26', '2021-12-05 09:55:26'),
(37, 'default', 'sell_deleted', 16, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":16,\"invoice_no\":\"0009\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"198.7600\"}}', '2021-12-05 09:55:29', '2021-12-05 09:55:29'),
(38, 'default', 'sell_deleted', 9, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":9,\"invoice_no\":\"0008\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"25.0000\"}}', '2021-12-05 09:55:33', '2021-12-05 09:55:33'),
(39, 'default', 'sell_deleted', 8, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":8,\"invoice_no\":\"0007\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"12.5000\"}}', '2021-12-05 09:55:36', '2021-12-05 09:55:36'),
(40, 'default', 'sell_deleted', 7, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":7,\"invoice_no\":\"0006\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"112.5000\"}}', '2021-12-05 09:55:39', '2021-12-05 09:55:39'),
(41, 'default', 'sell_deleted', 6, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":6,\"invoice_no\":\"0005\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"25.0000\"}}', '2021-12-05 09:55:42', '2021-12-05 09:55:42'),
(42, 'default', 'sell_deleted', 5, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":5,\"invoice_no\":\"0004\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"12.5000\"}}', '2021-12-05 09:55:46', '2021-12-05 09:55:46'),
(43, 'default', 'sell_deleted', 22, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":22,\"invoice_no\":\"2021\\/0008\",\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"proforma\",\"final_total\":\"211.2600\"}}', '2021-12-05 09:56:08', '2021-12-05 09:56:08'),
(44, 'default', 'sell_deleted', 17, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":17,\"invoice_no\":\"2021\\/0007\",\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":\"136.8800\"}}', '2021-12-05 09:56:13', '2021-12-05 09:56:13'),
(45, 'default', 'sell_deleted', 15, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":15,\"invoice_no\":\"2021\\/0006\",\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":\"449.3800\"}}', '2021-12-05 09:56:16', '2021-12-05 09:56:16'),
(46, 'default', 'sell_deleted', 14, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":14,\"invoice_no\":\"2021\\/0005\",\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":\"449.3800\"}}', '2021-12-05 09:56:20', '2021-12-05 09:56:20'),
(47, 'default', 'sell_deleted', 13, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":13,\"invoice_no\":\"2021\\/0004\",\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":\"61.8800\"}}', '2021-12-05 09:56:23', '2021-12-05 09:56:23'),
(48, 'default', 'sell_deleted', 12, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":12,\"invoice_no\":\"2021\\/0003\",\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":\"111.8800\"}}', '2021-12-05 09:56:27', '2021-12-05 09:56:27'),
(49, 'default', 'sell_deleted', 11, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":11,\"invoice_no\":\"2021\\/0002\",\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":\"86.8800\"}}', '2021-12-05 09:56:30', '2021-12-05 09:56:30'),
(50, 'default', 'sell_deleted', 10, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":10,\"invoice_no\":\"2021\\/0001\",\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":\"86.8800\"}}', '2021-12-05 09:56:34', '2021-12-05 09:56:34'),
(51, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-05 10:00:23', '2021-12-05 10:00:23'),
(52, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-05 10:00:27', '2021-12-05 10:00:27'),
(53, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-05 10:00:55', '2021-12-05 10:00:55'),
(54, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-05 10:00:59', '2021-12-05 10:00:59'),
(55, 'default', 'deleted', 4, 'App\\User', 1, 1, 'App\\User', '{\"name\":\"Mr Manager \",\"id\":4}', '2021-12-05 05:03:28', '2021-12-05 05:03:28'),
(56, 'default', 'deleted', 2, 'App\\User', 1, 1, 'App\\User', '{\"name\":\"mr shahzad mahmood\",\"id\":2}', '2021-12-05 05:03:30', '2021-12-05 05:03:30'),
(57, 'default', 'contact_deleted', 5, 'App\\Contact', 1, 1, 'App\\User', '[]', '2021-12-05 05:03:40', '2021-12-05 05:03:40'),
(58, 'default', 'contact_deleted', 8, 'App\\Contact', 1, 1, 'App\\User', '[]', '2021-12-05 05:03:43', '2021-12-05 05:03:43'),
(59, 'default', 'contact_deleted', 4, 'App\\Contact', 1, 1, 'App\\User', '[]', '2021-12-05 05:03:47', '2021-12-05 05:03:47'),
(60, 'default', 'contact_deleted', 2, 'App\\Contact', 1, 1, 'App\\User', '[]', '2021-12-05 05:03:51', '2021-12-05 05:03:51'),
(61, 'default', 'contact_deleted', 7, 'App\\Contact', 1, 1, 'App\\User', '[]', '2021-12-05 05:04:20', '2021-12-05 05:04:20'),
(62, 'default', 'contact_deleted', 6, 'App\\Contact', 1, 1, 'App\\User', '[]', '2021-12-05 05:04:23', '2021-12-05 05:04:23'),
(63, 'default', 'contact_deleted', 3, 'App\\Contact', 1, 1, 'App\\User', '[]', '2021-12-05 05:04:27', '2021-12-05 05:04:27'),
(64, 'default', 'edited', 1, 'App\\Contact', 1, 1, 'App\\User', '[]', '2021-12-05 05:04:50', '2021-12-05 05:04:50'),
(65, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-05 05:04:55', '2021-12-05 05:04:55'),
(66, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-05 05:05:02', '2021-12-05 05:05:02'),
(67, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-05 05:17:31', '2021-12-05 05:17:31'),
(68, 'default', 'added', 10, 'App\\Contact', 1, 1, 'App\\User', '[]', '2021-12-05 05:39:08', '2021-12-05 05:39:08'),
(69, 'default', 'added', 11, 'App\\Contact', 1, 1, 'App\\User', '[]', '2021-12-05 05:39:43', '2021-12-05 05:39:43'),
(70, 'default', 'added', 12, 'App\\Contact', 1, 1, 'App\\User', '[]', '2021-12-05 05:40:07', '2021-12-05 05:40:07'),
(71, 'default', 'added', 13, 'App\\Contact', 1, 1, 'App\\User', '[]', '2021-12-05 05:40:35', '2021-12-05 05:40:35'),
(72, 'default', 'added', 14, 'App\\Contact', 1, 1, 'App\\User', '[]', '2021-12-05 05:41:31', '2021-12-05 05:41:31'),
(73, 'default', 'added', 15, 'App\\Contact', 1, 1, 'App\\User', '[]', '2021-12-05 06:00:30', '2021-12-05 06:00:30'),
(74, 'default', 'added', 16, 'App\\Contact', 1, 1, 'App\\User', '[]', '2021-12-05 06:00:52', '2021-12-05 06:00:52'),
(75, 'default', 'added', 17, 'App\\Contact', 1, 1, 'App\\User', '[]', '2021-12-05 06:01:04', '2021-12-05 06:01:04'),
(76, 'default', 'edited', 17, 'App\\Contact', 1, 1, 'App\\User', '[]', '2021-12-05 06:01:43', '2021-12-05 06:01:43'),
(77, 'default', 'added', 18, 'App\\Contact', 1, 1, 'App\\User', '[]', '2021-12-05 06:02:12', '2021-12-05 06:02:12'),
(78, 'default', 'added', 19, 'App\\Contact', 1, 1, 'App\\User', '[]', '2021-12-05 06:03:16', '2021-12-05 06:03:16'),
(79, 'default', 'added', 20, 'App\\Contact', 1, 1, 'App\\User', '[]', '2021-12-05 06:03:39', '2021-12-05 06:03:39'),
(80, 'default', 'added', 21, 'App\\Contact', 1, 1, 'App\\User', '[]', '2021-12-05 06:03:58', '2021-12-05 06:03:58'),
(81, 'default', 'added', 64, 'App\\Transaction', 1, 1, 'App\\User', '[]', '2021-12-05 06:37:51', '2021-12-05 06:37:51'),
(82, 'default', 'status_updated', 64, 'App\\Transaction', 1, 1, 'App\\User', '{\"from\":\"ordered\",\"to\":\"completed\"}', '2021-12-05 06:38:06', '2021-12-05 06:38:06'),
(83, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-05 19:51:10', '2021-12-05 19:51:10'),
(84, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-05 22:05:58', '2021-12-05 22:05:58'),
(85, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-06 01:19:15', '2021-12-06 01:19:15'),
(86, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-06 01:19:19', '2021-12-06 01:19:19'),
(87, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-11 06:33:15', '2021-12-11 06:33:15'),
(88, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-11 12:51:38', '2021-12-11 12:51:38'),
(89, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-11 13:53:16', '2021-12-11 13:53:16'),
(90, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-11 15:37:44', '2021-12-11 15:37:44'),
(91, 'default', 'added', 22, 'App\\Contact', 1, 1, 'App\\User', '[]', '2021-12-11 16:53:45', '2021-12-11 16:53:45'),
(92, 'default', 'added', 66, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":2300}}', '2021-12-11 16:54:53', '2021-12-11 16:54:53'),
(93, 'default', 'added', 67, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":5000}}', '2021-12-11 19:14:42', '2021-12-11 19:14:42'),
(94, 'default', 'added', 68, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":2500}}', '2021-12-11 19:15:56', '2021-12-11 19:15:56'),
(95, 'default', 'added', 69, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":2500}}', '2021-12-11 19:25:02', '2021-12-11 19:25:02'),
(96, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-12 06:30:42', '2021-12-12 06:30:42'),
(97, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-12 12:34:32', '2021-12-12 12:34:32'),
(98, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-13 09:26:44', '2021-12-13 09:26:44'),
(99, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-13 15:36:16', '2021-12-13 15:36:16'),
(100, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-14 02:24:19', '2021-12-14 02:24:19'),
(101, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-14 03:22:04', '2021-12-14 03:22:04'),
(102, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-14 16:29:09', '2021-12-14 16:29:09'),
(103, 'default', 'added', 71, 'App\\Transaction', 1, 1, 'App\\User', '[]', '2021-12-14 17:07:25', '2021-12-14 17:07:25'),
(104, 'default', 'added', 73, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":182.5}}', '2021-12-14 17:21:45', '2021-12-14 17:21:45'),
(105, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-15 01:22:45', '2021-12-15 01:22:45'),
(106, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-15 02:52:39', '2021-12-15 02:52:39'),
(107, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-15 02:55:00', '2021-12-15 02:55:00'),
(108, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-15 02:56:35', '2021-12-15 02:56:35'),
(109, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-15 02:59:46', '2021-12-15 02:59:46'),
(110, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-15 03:00:47', '2021-12-15 03:00:47'),
(111, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-15 03:08:04', '2021-12-15 03:08:04'),
(112, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-15 04:19:10', '2021-12-15 04:19:10'),
(113, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-15 04:19:21', '2021-12-15 04:19:21'),
(114, 'default', 'added', 75, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1000}}', '2021-12-15 04:41:58', '2021-12-15 04:41:58'),
(115, 'default', 'edited', 73, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":210},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"182.5000\"}}', '2021-12-15 05:28:12', '2021-12-15 05:28:12'),
(116, 'default', 'sell_deleted', 73, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":73,\"invoice_no\":\"INV0000047\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"210.0000\"}}', '2021-12-15 05:28:42', '2021-12-15 05:28:42'),
(117, 'default', 'added', 76, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1000}}', '2021-12-15 07:08:26', '2021-12-15 07:08:26'),
(118, 'default', 'added', 77, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":31.25}}', '2021-12-15 07:09:49', '2021-12-15 07:09:49'),
(119, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-15 08:42:52', '2021-12-15 08:42:52'),
(120, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-15 09:49:23', '2021-12-15 09:49:23'),
(121, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-15 18:37:55', '2021-12-15 18:37:55'),
(122, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-16 06:51:56', '2021-12-16 06:51:56'),
(123, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-16 13:09:28', '2021-12-16 13:09:28'),
(124, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-16 13:41:09', '2021-12-16 13:41:09'),
(125, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-17 13:05:42', '2021-12-17 13:05:42'),
(126, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-17 15:37:24', '2021-12-17 15:37:24'),
(127, 'default', 'added', 78, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":155}}', '2021-12-17 15:38:53', '2021-12-17 15:38:53'),
(128, 'default', 'added', 79, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"final_total\":2500}}', '2021-12-17 15:39:33', '2021-12-17 15:39:33'),
(129, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-17 19:10:10', '2021-12-17 19:10:10'),
(130, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-17 22:11:46', '2021-12-17 22:11:46'),
(131, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-17 23:28:33', '2021-12-17 23:28:33'),
(132, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-17 23:40:24', '2021-12-17 23:40:24'),
(133, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-18 00:33:22', '2021-12-18 00:33:22'),
(134, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-18 00:33:52', '2021-12-18 00:33:52'),
(135, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-18 15:52:41', '2021-12-18 15:52:41'),
(136, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-18 16:03:28', '2021-12-18 16:03:28'),
(137, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-18 16:22:14', '2021-12-18 16:22:14'),
(138, 'default', 'added', 80, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":27.5}}', '2021-12-18 16:27:55', '2021-12-18 16:27:55'),
(139, 'default', 'added', 23, 'App\\Contact', 1, 1, 'App\\User', '[]', '2021-12-18 17:16:27', '2021-12-18 17:16:27'),
(140, 'default', 'added', 82, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":236.25}}', '2021-12-18 17:16:42', '2021-12-18 17:16:42'),
(141, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-18 18:30:40', '2021-12-18 18:30:40'),
(142, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-18 20:23:28', '2021-12-18 20:23:28'),
(143, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-19 13:14:49', '2021-12-19 13:14:49'),
(144, 'default', 'added', 83, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":2290}}', '2021-12-19 13:32:37', '2021-12-19 13:32:37'),
(145, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-19 19:31:39', '2021-12-19 19:31:39'),
(146, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-20 01:25:33', '2021-12-20 01:25:33'),
(147, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-20 01:28:28', '2021-12-20 01:28:28'),
(148, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-20 01:28:54', '2021-12-20 01:28:54'),
(149, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-20 01:32:35', '2021-12-20 01:32:35'),
(150, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-20 01:33:06', '2021-12-20 01:33:06'),
(151, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-20 04:39:41', '2021-12-20 04:39:41'),
(152, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-20 04:52:05', '2021-12-20 04:52:05'),
(153, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-20 06:45:44', '2021-12-20 06:45:44'),
(154, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-20 11:21:19', '2021-12-20 11:21:19'),
(155, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-20 19:59:42', '2021-12-20 19:59:42'),
(156, 'default', 'added', 84, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":2410}}', '2021-12-20 20:05:16', '2021-12-20 20:05:16'),
(157, 'default', 'added', 85, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":2800}}', '2021-12-20 20:05:52', '2021-12-20 20:05:52'),
(158, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-21 20:55:44', '2021-12-21 20:55:44'),
(159, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-22 05:09:26', '2021-12-22 05:09:26'),
(160, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-22 21:07:31', '2021-12-22 21:07:31'),
(161, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-22 21:37:34', '2021-12-22 21:37:34'),
(162, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-23 00:09:52', '2021-12-23 00:09:52'),
(163, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-23 01:07:04', '2021-12-23 01:07:04'),
(164, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-23 10:50:45', '2021-12-23 10:50:45'),
(165, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-23 11:06:49', '2021-12-23 11:06:49'),
(166, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-23 11:39:02', '2021-12-23 11:39:02'),
(167, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-23 11:39:17', '2021-12-23 11:39:17'),
(168, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-23 11:41:51', '2021-12-23 11:41:51'),
(169, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-23 12:04:48', '2021-12-23 12:04:48'),
(170, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-23 18:12:08', '2021-12-23 18:12:08'),
(171, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-23 18:13:31', '2021-12-23 18:13:31'),
(172, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-23 19:14:43', '2021-12-23 19:14:43'),
(173, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-23 20:31:07', '2021-12-23 20:31:07'),
(174, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-23 22:04:19', '2021-12-23 22:04:19'),
(175, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-23 22:40:19', '2021-12-23 22:40:19'),
(176, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-23 23:41:24', '2021-12-23 23:41:24'),
(177, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-24 01:03:32', '2021-12-24 01:03:32'),
(178, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-24 01:03:40', '2021-12-24 01:03:40'),
(179, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-24 02:26:22', '2021-12-24 02:26:22'),
(180, 'default', 'added', 86, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"final_total\":2942.5}}', '2021-12-24 02:26:52', '2021-12-24 02:26:52'),
(181, 'default', 'added', 87, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":831.25}}', '2021-12-24 02:27:01', '2021-12-24 02:27:01'),
(182, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-24 09:30:57', '2021-12-24 09:30:57'),
(183, 'default', 'added', 88, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":831.25}}', '2021-12-24 09:32:40', '2021-12-24 09:32:40'),
(184, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-24 13:21:14', '2021-12-24 13:21:14'),
(185, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-25 04:55:24', '2021-12-25 04:55:24'),
(186, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-25 04:59:40', '2021-12-25 04:59:40'),
(187, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-25 04:59:49', '2021-12-25 04:59:49'),
(188, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-25 05:00:14', '2021-12-25 05:00:14'),
(189, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-25 16:38:08', '2021-12-25 16:38:08'),
(190, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-25 20:59:12', '2021-12-25 20:59:12'),
(191, 'default', 'added', 90, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":19.469999999999998863131622783839702606201171875}}', '2021-12-25 21:11:38', '2021-12-25 21:11:38'),
(192, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-25 21:15:57', '2021-12-25 21:15:57'),
(193, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-26 04:11:39', '2021-12-26 04:11:39'),
(194, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-26 14:43:09', '2021-12-26 14:43:09'),
(195, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-26 20:03:36', '2021-12-26 20:03:36'),
(196, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-27 05:37:30', '2021-12-27 05:37:30'),
(197, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-27 20:20:14', '2021-12-27 20:20:14'),
(198, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-27 20:44:07', '2021-12-27 20:44:07'),
(199, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-27 20:49:30', '2021-12-27 20:49:30'),
(200, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-27 22:54:26', '2021-12-27 22:54:26'),
(201, 'default', 'added', 91, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":6.4900000000000002131628207280300557613372802734375}}', '2021-12-27 22:55:27', '2021-12-27 22:55:27'),
(202, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-28 03:13:45', '2021-12-28 03:13:45'),
(203, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-28 16:54:28', '2021-12-28 16:54:28'),
(204, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-29 15:49:37', '2021-12-29 15:49:37'),
(205, 'default', 'added', 24, 'App\\Contact', 1, 1, 'App\\User', '[]', '2021-12-29 15:53:03', '2021-12-29 15:53:03'),
(206, 'default', 'added', 92, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":5000}}', '2021-12-29 16:07:18', '2021-12-29 16:07:18'),
(207, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-29 17:54:47', '2021-12-29 17:54:47'),
(208, 'default', 'added', 25, 'App\\Contact', 1, 1, 'App\\User', '[]', '2021-12-29 18:01:14', '2021-12-29 18:01:14'),
(209, 'default', 'added', 93, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1840}}', '2021-12-29 18:06:42', '2021-12-29 18:06:42'),
(210, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-29 18:09:10', '2021-12-29 18:09:10'),
(211, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-29 18:09:17', '2021-12-29 18:09:17'),
(212, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-29 18:09:55', '2021-12-29 18:09:55'),
(213, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-29 22:09:17', '2021-12-29 22:09:17'),
(214, 'default', 'added', 94, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":2166.239999999999781721271574497222900390625}}', '2021-12-29 22:15:08', '2021-12-29 22:15:08'),
(215, 'default', 'added', 95, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1865}}', '2021-12-29 22:15:49', '2021-12-29 22:15:49'),
(216, 'default', 'added', 96, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":25}}', '2021-12-29 22:16:37', '2021-12-29 22:16:37'),
(217, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-30 18:42:47', '2021-12-30 18:42:47'),
(218, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-30 21:53:22', '2021-12-30 21:53:22'),
(219, 'default', 'added', 97, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1914.75}}', '2021-12-30 21:54:50', '2021-12-30 21:54:50'),
(220, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-31 02:24:57', '2021-12-31 02:24:57'),
(221, 'default', 'sell_deleted', 86, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":86,\"invoice_no\":\"2021\\/0012\",\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"final_total\":\"2942.5000\"}}', '2021-12-31 02:32:09', '2021-12-31 02:32:09'),
(222, 'default', 'sell_deleted', 79, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":79,\"invoice_no\":\"2021\\/0010\",\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"final_total\":\"2500.0000\"}}', '2021-12-31 02:32:14', '2021-12-31 02:32:14'),
(223, 'default', 'sell_deleted', 94, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":94,\"invoice_no\":\"2021\\/0013\",\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":\"2166.2400\"}}', '2021-12-31 02:32:19', '2021-12-31 02:32:19'),
(224, 'default', 'sell_deleted', 68, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":68,\"invoice_no\":\"2021\\/0009\",\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":\"2500.0000\"}}', '2021-12-31 02:32:30', '2021-12-31 02:32:30'),
(225, 'default', 'sell_deleted', 97, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":97,\"invoice_no\":\"INV0000063\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"1914.7500\"}}', '2021-12-31 02:32:37', '2021-12-31 02:32:37'),
(226, 'default', 'sell_deleted', 82, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":82,\"invoice_no\":\"INV0000053\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"236.2500\"}}', '2021-12-31 02:32:41', '2021-12-31 02:32:41'),
(227, 'default', 'sell_deleted', 95, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":95,\"invoice_no\":\"INV0000061\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"1865.0000\"}}', '2021-12-31 02:32:45', '2021-12-31 02:32:45'),
(228, 'default', 'sell_deleted', 84, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":84,\"invoice_no\":\"INV0000055\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"2410.0000\"}}', '2021-12-31 02:32:50', '2021-12-31 02:32:50'),
(229, 'default', 'sell_deleted', 77, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":77,\"invoice_no\":\"INV0000050\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"31.2500\"}}', '2021-12-31 02:32:53', '2021-12-31 02:32:53'),
(230, 'default', 'sell_deleted', 90, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":90,\"invoice_no\":\"INV0000058\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"19.4700\"}}', '2021-12-31 02:32:58', '2021-12-31 02:32:58'),
(231, 'default', 'sell_deleted', 91, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":91,\"invoice_no\":\"INV0000059\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"6.4900\"}}', '2021-12-31 02:33:01', '2021-12-31 02:33:01'),
(232, 'default', 'sell_deleted', 96, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":96,\"invoice_no\":\"INV0000062\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"25.0000\"}}', '2021-12-31 02:33:06', '2021-12-31 02:33:06'),
(233, 'default', 'sell_deleted', 93, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":93,\"invoice_no\":\"INV0000060\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"1840.0000\"}}', '2021-12-31 02:33:10', '2021-12-31 02:33:10'),
(234, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-31 03:53:19', '2021-12-31 03:53:19'),
(235, 'default', 'added', 98, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":2024}}', '2021-12-31 03:57:11', '2021-12-31 03:57:11'),
(236, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2021-12-31 13:18:59', '2021-12-31 13:18:59'),
(237, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-01 03:26:15', '2022-01-01 03:26:15'),
(238, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-01 21:34:49', '2022-01-01 21:34:49'),
(239, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-02 01:32:42', '2022-01-02 01:32:42'),
(240, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-02 01:38:01', '2022-01-02 01:38:01'),
(241, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-02 04:35:36', '2022-01-02 04:35:36'),
(242, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-02 13:50:32', '2022-01-02 13:50:32'),
(243, 'default', 'added', 99, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":4600}}', '2022-01-02 13:57:37', '2022-01-02 13:57:37'),
(244, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-02 14:41:42', '2022-01-02 14:41:42'),
(245, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-02 16:48:52', '2022-01-02 16:48:52'),
(246, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-03 01:44:38', '2022-01-03 01:44:38'),
(247, 'default', 'added', 100, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":2325}}', '2022-01-03 01:45:48', '2022-01-03 01:45:48'),
(248, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-03 03:45:54', '2022-01-03 03:45:54'),
(249, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-03 04:28:32', '2022-01-03 04:28:32'),
(250, 'default', 'added', 26, 'App\\Contact', 1, 1, 'App\\User', '[]', '2022-01-03 04:45:09', '2022-01-03 04:45:09'),
(251, 'default', 'added', 27, 'App\\Contact', 1, 1, 'App\\User', '[]', '2022-01-03 04:46:23', '2022-01-03 04:46:23'),
(252, 'default', 'added', 101, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":50000}}', '2022-01-03 04:51:59', '2022-01-03 04:51:59'),
(253, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-03 04:56:07', '2022-01-03 04:56:07'),
(254, 'default', 'added', 102, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":2300}}', '2022-01-03 05:01:30', '2022-01-03 05:01:30'),
(255, 'default', 'added', 103, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":109760}}', '2022-01-03 05:05:48', '2022-01-03 05:05:48'),
(256, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-03 05:18:10', '2022-01-03 05:18:10'),
(257, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-03 05:18:58', '2022-01-03 05:18:58'),
(258, 'default', 'added', 104, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":2300}}', '2022-01-03 05:22:41', '2022-01-03 05:22:41'),
(259, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-03 05:27:54', '2022-01-03 05:27:54'),
(260, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-03 06:11:40', '2022-01-03 06:11:40'),
(261, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-03 07:30:34', '2022-01-03 07:30:34'),
(262, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-03 13:44:45', '2022-01-03 13:44:45'),
(263, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-03 18:44:34', '2022-01-03 18:44:34'),
(264, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-03 18:45:36', '2022-01-03 18:45:36'),
(265, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-03 21:09:41', '2022-01-03 21:09:41'),
(266, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-04 00:33:49', '2022-01-04 00:33:49'),
(267, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-04 01:10:25', '2022-01-04 01:10:25'),
(268, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-04 01:44:39', '2022-01-04 01:44:39'),
(269, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-04 07:36:08', '2022-01-04 07:36:08'),
(270, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-04 14:04:48', '2022-01-04 14:04:48'),
(271, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-04 17:19:48', '2022-01-04 17:19:48'),
(272, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-04 17:50:59', '2022-01-04 17:50:59'),
(273, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-04 20:57:03', '2022-01-04 20:57:03'),
(274, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-05 01:07:11', '2022-01-05 01:07:11'),
(275, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-05 03:17:35', '2022-01-05 03:17:35'),
(276, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-05 09:32:31', '2022-01-05 09:32:31'),
(277, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-05 09:39:41', '2022-01-05 09:39:41'),
(278, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-05 12:29:03', '2022-01-05 12:29:03'),
(279, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-05 22:47:29', '2022-01-05 22:47:29'),
(280, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-06 11:01:52', '2022-01-06 11:01:52'),
(281, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-06 13:40:17', '2022-01-06 13:40:17'),
(282, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-06 14:21:24', '2022-01-06 14:21:24'),
(283, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-06 14:29:17', '2022-01-06 14:29:17'),
(284, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-06 18:49:43', '2022-01-06 18:49:43'),
(285, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-06 22:39:46', '2022-01-06 22:39:46'),
(286, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-07 00:36:26', '2022-01-07 00:36:26'),
(287, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-07 04:39:33', '2022-01-07 04:39:33'),
(288, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-07 08:58:11', '2022-01-07 08:58:11'),
(289, 'default', 'added', 105, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":229.990000000000009094947017729282379150390625}}', '2022-01-07 09:29:55', '2022-01-07 09:29:55'),
(290, 'default', 'added', 106, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"final_total\":25}}', '2022-01-07 09:31:21', '2022-01-07 09:31:21'),
(291, 'default', 'added', 29, 'App\\Contact', 1, 1, 'App\\User', '[]', '2022-01-07 09:32:00', '2022-01-07 09:32:00'),
(292, 'default', 'added', 107, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":157.479999999999989768184605054557323455810546875}}', '2022-01-07 09:32:28', '2022-01-07 09:32:28'),
(293, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-07 12:38:34', '2022-01-07 12:38:34'),
(294, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-07 15:00:40', '2022-01-07 15:00:40'),
(295, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-07 15:24:30', '2022-01-07 15:24:30'),
(296, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-07 15:36:57', '2022-01-07 15:36:57'),
(297, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-07 16:01:49', '2022-01-07 16:01:49'),
(298, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-07 16:05:48', '2022-01-07 16:05:48'),
(299, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-07 18:10:04', '2022-01-07 18:10:04'),
(300, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-07 18:12:52', '2022-01-07 18:12:52'),
(301, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-07 18:13:35', '2022-01-07 18:13:35'),
(302, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-07 18:14:31', '2022-01-07 18:14:31'),
(303, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-07 18:14:54', '2022-01-07 18:14:54'),
(304, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-07 19:16:41', '2022-01-07 19:16:41'),
(305, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-08 00:20:15', '2022-01-08 00:20:15'),
(306, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-08 00:22:50', '2022-01-08 00:22:50'),
(307, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-08 00:23:21', '2022-01-08 00:23:21'),
(308, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-08 00:25:43', '2022-01-08 00:25:43'),
(309, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-08 04:20:03', '2022-01-08 04:20:03'),
(310, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-08 06:19:17', '2022-01-08 06:19:17');
INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_id`, `subject_type`, `business_id`, `causer_id`, `causer_type`, `properties`, `created_at`, `updated_at`) VALUES
(311, 'default', 'added', 108, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":6.4900000000000002131628207280300557613372802734375}}', '2022-01-08 06:56:13', '2022-01-08 06:56:13'),
(312, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-08 11:34:22', '2022-01-08 11:34:22'),
(313, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-08 15:15:02', '2022-01-08 15:15:02'),
(314, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-08 15:26:47', '2022-01-08 15:26:47'),
(315, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-08 16:46:05', '2022-01-08 16:46:05'),
(316, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-08 23:17:21', '2022-01-08 23:17:21'),
(317, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-08 23:30:55', '2022-01-08 23:30:55'),
(318, 'default', 'added', 109, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"final_total\":6.4900000000000002131628207280300557613372802734375}}', '2022-01-08 23:38:22', '2022-01-08 23:38:22'),
(319, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-09 22:22:00', '2022-01-09 22:22:00'),
(320, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-10 08:40:46', '2022-01-10 08:40:46'),
(321, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-10 15:23:03', '2022-01-10 15:23:03'),
(322, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-10 16:34:26', '2022-01-10 16:34:26'),
(323, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-10 21:11:32', '2022-01-10 21:11:32'),
(324, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-10 21:46:18', '2022-01-10 21:46:18'),
(325, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-10 22:17:58', '2022-01-10 22:17:58'),
(326, 'default', 'added', 8, 'App\\User', 1, 1, 'App\\User', '{\"name\":\"MR PABLO GONZALO\"}', '2022-01-10 22:26:49', '2022-01-10 22:26:49'),
(327, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-10 22:27:11', '2022-01-10 22:27:11'),
(328, 'default', 'login', 8, 'App\\User', 1, 8, 'App\\User', '[]', '2022-01-10 22:27:25', '2022-01-10 22:27:25'),
(329, 'default', 'logout', 8, 'App\\User', 1, 8, 'App\\User', '[]', '2022-01-10 22:28:50', '2022-01-10 22:28:50'),
(330, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-10 22:29:26', '2022-01-10 22:29:26'),
(331, 'default', 'added', 9, 'App\\User', 1, 1, 'App\\User', '{\"name\":\"MR ALEJANDRO SALINAS\"}', '2022-01-10 22:33:53', '2022-01-10 22:33:53'),
(332, 'default', 'edited', 9, 'App\\User', 1, 1, 'App\\User', '{\"name\":\"MR ALEJANDRO SALINAS\"}', '2022-01-10 22:34:47', '2022-01-10 22:34:47'),
(333, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-10 22:35:20', '2022-01-10 22:35:20'),
(334, 'default', 'login', 9, 'App\\User', 1, 9, 'App\\User', '[]', '2022-01-10 22:35:32', '2022-01-10 22:35:32'),
(335, 'default', 'logout', 9, 'App\\User', 1, 9, 'App\\User', '[]', '2022-01-10 22:40:10', '2022-01-10 22:40:10'),
(336, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-10 22:40:14', '2022-01-10 22:40:14'),
(337, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-11 02:57:37', '2022-01-11 02:57:37'),
(338, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-11 06:38:01', '2022-01-11 06:38:01'),
(339, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-11 06:39:02', '2022-01-11 06:39:02'),
(340, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-11 06:39:33', '2022-01-11 06:39:33'),
(341, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-11 21:57:45', '2022-01-11 21:57:45'),
(342, 'default', 'added', 110, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":12.980000000000000426325641456060111522674560546875}}', '2022-01-11 22:01:39', '2022-01-11 22:01:39'),
(343, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-11 22:15:59', '2022-01-11 22:15:59'),
(344, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-11 23:44:40', '2022-01-11 23:44:40'),
(345, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-12 02:01:55', '2022-01-12 02:01:55'),
(346, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-12 02:51:34', '2022-01-12 02:51:34'),
(347, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-12 17:06:23', '2022-01-12 17:06:23'),
(348, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-12 18:05:12', '2022-01-12 18:05:12'),
(349, 'default', 'added', 111, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":2506.489999999999781721271574497222900390625}}', '2022-01-12 18:10:11', '2022-01-12 18:10:11'),
(350, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-12 19:12:18', '2022-01-12 19:12:18'),
(351, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-12 19:13:17', '2022-01-12 19:13:17'),
(352, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-12 19:15:46', '2022-01-12 19:15:46'),
(353, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-12 21:24:23', '2022-01-12 21:24:23'),
(354, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-12 21:44:13', '2022-01-12 21:44:13'),
(355, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-12 21:44:40', '2022-01-12 21:44:40'),
(356, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-12 23:16:35', '2022-01-12 23:16:35'),
(357, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-13 00:38:51', '2022-01-13 00:38:51'),
(358, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-13 00:39:08', '2022-01-13 00:39:08'),
(359, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-13 04:36:06', '2022-01-13 04:36:06'),
(360, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-13 05:21:14', '2022-01-13 05:21:14'),
(361, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-13 06:43:45', '2022-01-13 06:43:45'),
(362, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-13 08:23:06', '2022-01-13 08:23:06'),
(363, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-13 19:50:40', '2022-01-13 19:50:40'),
(364, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-13 22:44:13', '2022-01-13 22:44:13'),
(365, 'default', 'added', 112, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":6.4900000000000002131628207280300557613372802734375}}', '2022-01-13 22:53:20', '2022-01-13 22:53:20'),
(366, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-14 01:21:45', '2022-01-14 01:21:45'),
(367, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-14 01:59:31', '2022-01-14 01:59:31'),
(368, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-14 02:17:57', '2022-01-14 02:17:57'),
(369, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-14 02:38:21', '2022-01-14 02:38:21'),
(370, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-14 02:38:36', '2022-01-14 02:38:36'),
(371, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-14 02:38:55', '2022-01-14 02:38:55'),
(372, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-14 04:14:11', '2022-01-14 04:14:11'),
(373, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-14 04:14:33', '2022-01-14 04:14:33'),
(374, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-14 04:14:51', '2022-01-14 04:14:51'),
(375, 'default', 'added', 113, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"final_total\":123.75}}', '2022-01-14 04:27:01', '2022-01-14 04:27:01'),
(376, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-14 19:51:37', '2022-01-14 19:51:37'),
(377, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-14 21:14:08', '2022-01-14 21:14:08'),
(378, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-14 21:24:01', '2022-01-14 21:24:01'),
(379, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-14 21:33:40', '2022-01-14 21:33:40'),
(380, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-14 21:51:07', '2022-01-14 21:51:07'),
(381, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-14 23:25:14', '2022-01-14 23:25:14'),
(382, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-14 23:26:04', '2022-01-14 23:26:04'),
(383, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-15 02:43:31', '2022-01-15 02:43:31'),
(384, 'default', 'added', 30, 'App\\Contact', 1, 1, 'App\\User', '[]', '2022-01-15 02:45:08', '2022-01-15 02:45:08'),
(385, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-15 11:14:51', '2022-01-15 11:14:51'),
(386, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-15 12:16:20', '2022-01-15 12:16:20'),
(387, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-15 15:00:49', '2022-01-15 15:00:49'),
(388, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-15 19:43:15', '2022-01-15 19:43:15'),
(389, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-15 19:48:25', '2022-01-15 19:48:25'),
(390, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-15 19:53:37', '2022-01-15 19:53:37'),
(391, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-15 20:35:11', '2022-01-15 20:35:11'),
(392, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-15 20:47:39', '2022-01-15 20:47:39'),
(393, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-15 20:48:38', '2022-01-15 20:48:38'),
(394, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-15 22:41:07', '2022-01-15 22:41:07'),
(395, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-15 23:33:37', '2022-01-15 23:33:37'),
(396, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-16 00:30:01', '2022-01-16 00:30:01'),
(397, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-16 00:41:49', '2022-01-16 00:41:49'),
(398, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-16 00:43:56', '2022-01-16 00:43:56'),
(399, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-16 00:47:26', '2022-01-16 00:47:26'),
(400, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-16 01:18:28', '2022-01-16 01:18:28'),
(401, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-16 06:40:34', '2022-01-16 06:40:34'),
(402, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-17 01:14:22', '2022-01-17 01:14:22'),
(403, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-17 01:19:35', '2022-01-17 01:19:35'),
(404, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-17 01:51:17', '2022-01-17 01:51:17'),
(405, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-17 12:26:30', '2022-01-17 12:26:30'),
(406, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-17 12:41:42', '2022-01-17 12:41:42'),
(407, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-17 15:47:51', '2022-01-17 15:47:51'),
(408, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-17 19:37:16', '2022-01-17 19:37:16'),
(409, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-17 19:42:00', '2022-01-17 19:42:00'),
(410, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-17 19:48:45', '2022-01-17 19:48:45'),
(411, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-17 21:53:25', '2022-01-17 21:53:25'),
(412, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-17 22:21:56', '2022-01-17 22:21:56'),
(413, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-17 22:26:51', '2022-01-17 22:26:51'),
(414, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-17 22:53:57', '2022-01-17 22:53:57'),
(415, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-18 01:37:07', '2022-01-18 01:37:07'),
(416, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-18 07:07:41', '2022-01-18 07:07:41'),
(417, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-18 12:37:17', '2022-01-18 12:37:17'),
(418, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-18 13:21:14', '2022-01-18 13:21:14'),
(419, 'default', 'added', 31, 'App\\Contact', 1, 1, 'App\\User', '[]', '2022-01-18 13:27:05', '2022-01-18 13:27:05'),
(420, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-18 14:31:32', '2022-01-18 14:31:32'),
(421, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-18 18:00:03', '2022-01-18 18:00:03'),
(422, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-18 20:05:06', '2022-01-18 20:05:06'),
(423, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-19 01:01:29', '2022-01-19 01:01:29'),
(424, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-19 01:23:28', '2022-01-19 01:23:28'),
(425, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-19 01:34:26', '2022-01-19 01:34:26'),
(426, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-19 04:42:52', '2022-01-19 04:42:52'),
(427, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-19 05:09:06', '2022-01-19 05:09:06'),
(428, 'default', 'added', 116, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":11500}}', '2022-01-19 05:11:06', '2022-01-19 05:11:06'),
(429, 'default', 'added', 117, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":4600}}', '2022-01-19 05:12:06', '2022-01-19 05:12:06'),
(430, 'default', 'added', 118, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"final_total\":4600}}', '2022-01-19 05:13:04', '2022-01-19 05:13:04'),
(431, 'default', 'added', 119, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":4600}}', '2022-01-19 05:14:00', '2022-01-19 05:14:00'),
(432, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-19 07:42:46', '2022-01-19 07:42:46'),
(433, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-19 07:56:51', '2022-01-19 07:56:51'),
(434, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-19 10:10:57', '2022-01-19 10:10:57'),
(435, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-19 14:33:27', '2022-01-19 14:33:27'),
(436, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-19 18:07:58', '2022-01-19 18:07:58'),
(437, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-19 18:11:15', '2022-01-19 18:11:15'),
(438, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-19 18:12:20', '2022-01-19 18:12:20'),
(439, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-19 18:12:28', '2022-01-19 18:12:28'),
(440, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-19 18:12:39', '2022-01-19 18:12:39'),
(441, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-19 19:49:22', '2022-01-19 19:49:22'),
(442, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-19 21:30:37', '2022-01-19 21:30:37'),
(443, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-19 22:15:35', '2022-01-19 22:15:35'),
(444, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-19 22:16:12', '2022-01-19 22:16:12'),
(445, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-19 22:18:08', '2022-01-19 22:18:08'),
(446, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-19 22:18:15', '2022-01-19 22:18:15'),
(447, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-19 22:18:25', '2022-01-19 22:18:25'),
(448, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-19 22:18:42', '2022-01-19 22:18:42'),
(449, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-19 22:18:53', '2022-01-19 22:18:53'),
(450, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-19 22:19:05', '2022-01-19 22:19:05'),
(451, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-19 22:19:30', '2022-01-19 22:19:30'),
(452, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-19 22:19:47', '2022-01-19 22:19:47'),
(453, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-19 22:19:54', '2022-01-19 22:19:54'),
(454, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-19 23:27:43', '2022-01-19 23:27:43'),
(455, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-20 01:32:02', '2022-01-20 01:32:02'),
(456, 'default', 'added', 120, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":2300}}', '2022-01-20 01:34:07', '2022-01-20 01:34:07'),
(457, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-20 03:12:40', '2022-01-20 03:12:40'),
(458, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-20 06:00:45', '2022-01-20 06:00:45'),
(459, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-20 12:43:49', '2022-01-20 12:43:49'),
(460, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-20 14:30:47', '2022-01-20 14:30:47'),
(461, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-21 01:53:44', '2022-01-21 01:53:44'),
(462, 'default', 'added', 32, 'App\\Contact', 1, 1, 'App\\User', '[]', '2022-01-21 04:39:37', '2022-01-21 04:39:37'),
(463, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-21 04:42:15', '2022-01-21 04:42:15'),
(464, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-21 06:43:55', '2022-01-21 06:43:55'),
(465, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-21 07:14:55', '2022-01-21 07:14:55'),
(466, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-21 11:36:05', '2022-01-21 11:36:06'),
(467, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-21 18:26:56', '2022-01-21 18:26:56'),
(468, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-21 19:45:52', '2022-01-21 19:45:52'),
(469, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-21 23:33:17', '2022-01-21 23:33:17'),
(470, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-22 00:04:22', '2022-01-22 00:04:22'),
(471, 'default', 'added', 121, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":2648.75}}', '2022-01-22 00:27:17', '2022-01-22 00:27:17'),
(472, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-22 00:42:55', '2022-01-22 00:42:55'),
(473, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-22 01:39:49', '2022-01-22 01:39:49'),
(474, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-22 01:55:17', '2022-01-22 01:55:17'),
(475, 'default', 'added', 33, 'App\\Contact', 1, 1, 'App\\User', '[]', '2022-01-22 01:57:11', '2022-01-22 01:57:11'),
(476, 'default', 'added', 122, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":429.79000000000002046363078989088535308837890625}}', '2022-01-22 02:39:31', '2022-01-22 02:39:31'),
(477, 'default', 'added', 123, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":6.4900000000000002131628207280300557613372802734375}}', '2022-01-22 02:40:31', '2022-01-22 02:40:31'),
(478, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-22 21:12:39', '2022-01-22 21:12:39'),
(479, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-22 23:05:57', '2022-01-22 23:05:57'),
(480, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-22 23:33:03', '2022-01-22 23:33:03'),
(481, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-22 23:44:14', '2022-01-22 23:44:14'),
(482, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-23 10:41:57', '2022-01-23 10:41:57'),
(483, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-23 17:09:55', '2022-01-23 17:09:55'),
(484, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-24 00:42:10', '2022-01-24 00:42:10'),
(485, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-24 02:12:57', '2022-01-24 02:12:57'),
(486, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-24 02:14:33', '2022-01-24 02:14:33'),
(487, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-24 04:31:27', '2022-01-24 04:31:27'),
(488, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-24 05:24:54', '2022-01-24 05:24:54'),
(489, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-24 05:40:57', '2022-01-24 05:40:57'),
(490, 'default', 'added', 124, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":25}}', '2022-01-24 05:45:31', '2022-01-24 05:45:31'),
(491, 'default', 'payment_edited', 124, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"25.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"25.0000\"}}', '2022-01-24 05:47:34', '2022-01-24 05:47:34'),
(492, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-24 09:44:42', '2022-01-24 09:44:42'),
(493, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-24 10:39:19', '2022-01-24 10:39:19'),
(494, 'default', 'added', 125, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"final_total\":157}}', '2022-01-24 10:40:55', '2022-01-24 10:40:55'),
(495, 'default', 'edited', 125, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"payment_status\":\"due\",\"final_total\":157},\"old\":{\"type\":\"sell\",\"status\":\"draft\",\"final_total\":\"157.0000\"}}', '2022-01-24 10:42:26', '2022-01-24 10:42:26'),
(496, 'default', 'edited', 125, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":157},\"old\":{\"type\":\"sell\",\"status\":\"draft\",\"payment_status\":\"due\",\"final_total\":\"157.0000\"}}', '2022-01-24 10:43:23', '2022-01-24 10:43:23'),
(497, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-24 16:34:39', '2022-01-24 16:34:39'),
(498, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-24 22:49:42', '2022-01-24 22:49:42'),
(499, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-24 22:50:40', '2022-01-24 22:50:40'),
(500, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-24 22:56:33', '2022-01-24 22:56:33'),
(501, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-25 20:03:34', '2022-01-25 20:03:34'),
(502, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-25 22:22:57', '2022-01-25 22:22:57'),
(503, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-26 13:29:44', '2022-01-26 13:29:44'),
(504, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-26 23:42:32', '2022-01-26 23:42:32'),
(505, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-26 23:44:43', '2022-01-26 23:44:43'),
(506, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-26 23:44:57', '2022-01-26 23:44:57'),
(507, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-27 07:32:28', '2022-01-27 07:32:28'),
(508, 'default', 'added', 126, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":5000}}', '2022-01-27 07:37:40', '2022-01-27 07:37:40'),
(509, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-27 07:39:30', '2022-01-27 07:39:30'),
(510, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-27 14:37:19', '2022-01-27 14:37:19'),
(511, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-27 18:24:09', '2022-01-27 18:24:09'),
(512, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-27 18:46:36', '2022-01-27 18:46:36'),
(513, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-27 21:43:51', '2022-01-27 21:43:51'),
(514, 'default', 'added', 127, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":94.5}}', '2022-01-27 21:46:50', '2022-01-27 21:46:50'),
(515, 'default', 'added', 128, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1000}}', '2022-01-27 22:13:21', '2022-01-27 22:13:21'),
(516, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-28 00:50:22', '2022-01-28 00:50:22'),
(517, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-28 00:52:52', '2022-01-28 00:52:52'),
(518, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-28 00:52:58', '2022-01-28 00:52:58'),
(519, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-28 04:02:04', '2022-01-28 04:02:04'),
(520, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-28 04:58:36', '2022-01-28 04:58:36'),
(521, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-28 05:02:01', '2022-01-28 05:02:01'),
(522, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-28 09:06:19', '2022-01-28 09:06:19'),
(523, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-28 13:00:50', '2022-01-28 13:00:50'),
(524, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-28 23:01:39', '2022-01-28 23:01:39'),
(525, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-28 23:16:42', '2022-01-28 23:16:42'),
(526, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-28 23:43:46', '2022-01-28 23:43:46'),
(527, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-29 01:42:29', '2022-01-29 01:42:29'),
(528, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-29 01:44:29', '2022-01-29 01:44:29'),
(529, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-29 03:37:11', '2022-01-29 03:37:11'),
(530, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-29 04:30:52', '2022-01-29 04:30:52'),
(531, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-30 01:14:12', '2022-01-30 01:14:12'),
(532, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-30 06:44:51', '2022-01-30 06:44:51'),
(533, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-30 06:45:58', '2022-01-30 06:45:58'),
(534, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-30 06:46:12', '2022-01-30 06:46:12'),
(535, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-30 06:46:28', '2022-01-30 06:46:28'),
(536, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-30 09:49:32', '2022-01-30 09:49:32'),
(537, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-30 14:51:01', '2022-01-30 14:51:01'),
(538, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-30 15:43:19', '2022-01-30 15:43:19'),
(539, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-30 15:44:36', '2022-01-30 15:44:36'),
(540, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-30 21:15:11', '2022-01-30 21:15:11'),
(541, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-30 22:01:37', '2022-01-30 22:01:37'),
(542, 'default', 'added', 129, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":94.5}}', '2022-01-30 22:06:17', '2022-01-30 22:06:17'),
(543, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-30 22:43:47', '2022-01-30 22:43:47'),
(544, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-30 22:48:30', '2022-01-30 22:48:30'),
(545, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-30 22:49:24', '2022-01-30 22:49:24'),
(546, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-30 22:49:58', '2022-01-30 22:49:58'),
(547, 'default', 'added', 130, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":124.5}}', '2022-01-30 23:01:07', '2022-01-30 23:01:07'),
(548, 'default', 'added', 131, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":47.2000000000000028421709430404007434844970703125}}', '2022-01-30 23:04:37', '2022-01-30 23:04:37'),
(549, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-31 01:24:59', '2022-01-31 01:24:59'),
(550, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-31 01:25:36', '2022-01-31 01:25:36'),
(551, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-31 01:25:48', '2022-01-31 01:25:48'),
(552, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-31 01:40:04', '2022-01-31 01:40:04'),
(553, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-31 03:33:39', '2022-01-31 03:33:39'),
(554, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-31 04:11:06', '2022-01-31 04:11:06'),
(555, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-01-31 19:03:08', '2022-01-31 19:03:08'),
(556, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-01 00:49:45', '2022-02-01 00:49:45'),
(557, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-01 00:56:10', '2022-02-01 00:56:10'),
(558, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-01 00:56:42', '2022-02-01 00:56:42'),
(559, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-01 00:57:20', '2022-02-01 00:57:20'),
(560, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-01 00:57:24', '2022-02-01 00:57:24'),
(561, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-01 00:57:38', '2022-02-01 00:57:38'),
(562, 'default', 'login', 12, 'App\\User', 3, 12, 'App\\User', '[]', '2022-02-01 01:07:39', '2022-02-01 01:07:39'),
(563, 'default', 'added', 5, 'Modules\\Essentials\\Entities\\ToDo', 3, 12, 'App\\User', '{\"attributes\":{\"status\":\"new\"}}', '2022-02-01 01:21:54', '2022-02-01 01:21:54'),
(564, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-01 01:21:57', '2022-02-01 01:21:57'),
(565, 'default', 'logout', 12, 'App\\User', 3, 12, 'App\\User', '[]', '2022-02-01 01:26:18', '2022-02-01 01:26:18'),
(566, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-01 03:49:08', '2022-02-01 03:49:08'),
(567, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-01 03:49:47', '2022-02-01 03:49:47'),
(568, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-01 12:33:49', '2022-02-01 12:33:49'),
(569, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-01 12:33:49', '2022-02-01 12:33:49'),
(570, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-01 14:22:02', '2022-02-01 14:22:02'),
(571, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-01 15:38:32', '2022-02-01 15:38:32'),
(572, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-02 01:05:44', '2022-02-02 01:05:44'),
(573, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-02 01:07:28', '2022-02-02 01:07:28'),
(574, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-02 02:12:51', '2022-02-02 02:12:51'),
(575, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-02 02:52:55', '2022-02-02 02:52:55'),
(576, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-02 03:07:50', '2022-02-02 03:07:50'),
(577, 'default', 'added', 35, 'App\\Contact', 1, 1, 'App\\User', '[]', '2022-02-02 03:12:37', '2022-02-02 03:12:37'),
(578, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-02 18:03:06', '2022-02-02 18:03:06'),
(579, 'default', 'added', 133, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":13.3800000000000007815970093361102044582366943359375}}', '2022-02-02 18:13:25', '2022-02-02 18:13:25'),
(580, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-02 22:03:48', '2022-02-02 22:03:48'),
(581, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-02 22:12:52', '2022-02-02 22:12:52'),
(582, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-02 22:17:14', '2022-02-02 22:17:14'),
(583, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-02 23:59:23', '2022-02-02 23:59:23'),
(584, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-03 17:51:18', '2022-02-03 17:51:18'),
(585, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-03 20:43:42', '2022-02-03 20:43:42'),
(586, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-03 23:00:33', '2022-02-03 23:00:33'),
(587, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-04 02:38:53', '2022-02-04 02:38:54'),
(588, 'default', 'added', 134, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":330.75}}', '2022-02-04 02:41:53', '2022-02-04 02:41:53'),
(589, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-04 03:24:58', '2022-02-04 03:24:58'),
(590, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-04 14:35:55', '2022-02-04 14:35:55'),
(591, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-04 14:41:11', '2022-02-04 14:41:11'),
(592, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-04 16:41:07', '2022-02-04 16:41:07'),
(593, 'default', 'added', 36, 'App\\Contact', 1, 1, 'App\\User', '[]', '2022-02-04 16:49:46', '2022-02-04 16:49:46'),
(594, 'default', 'added', 136, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":375}}', '2022-02-04 16:50:54', '2022-02-04 16:50:54'),
(595, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-04 16:57:05', '2022-02-04 16:57:05'),
(596, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-04 16:57:27', '2022-02-04 16:57:27'),
(597, 'default', 'added', 37, 'App\\Contact', 1, 1, 'App\\User', '[]', '2022-02-04 17:54:24', '2022-02-04 17:54:24'),
(598, 'default', 'added', 138, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":100}}', '2022-02-04 17:56:44', '2022-02-04 17:56:44'),
(599, 'default', 'added', 139, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":12.5}}', '2022-02-04 17:57:34', '2022-02-04 17:57:34'),
(600, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-05 07:08:22', '2022-02-05 07:08:22'),
(601, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-05 07:10:34', '2022-02-05 07:10:34'),
(602, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-05 07:47:56', '2022-02-05 07:47:56'),
(603, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-05 16:49:05', '2022-02-05 16:49:05'),
(604, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-05 16:51:52', '2022-02-05 16:51:52'),
(605, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-05 23:13:02', '2022-02-05 23:13:02'),
(606, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-07 03:11:23', '2022-02-07 03:11:23'),
(607, 'default', 'added', 140, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":50}}', '2022-02-07 03:15:20', '2022-02-07 03:15:20'),
(608, 'default', 'added', 141, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":25}}', '2022-02-07 03:17:22', '2022-02-07 03:17:22'),
(609, 'default', 'added', 142, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":55}}', '2022-02-07 03:18:24', '2022-02-07 03:18:24'),
(610, 'default', 'added', 143, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":11}}', '2022-02-07 03:45:47', '2022-02-07 03:45:47'),
(611, 'default', 'added', 144, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":12.5}}', '2022-02-07 04:47:26', '2022-02-07 04:47:26'),
(612, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-07 14:04:42', '2022-02-07 14:04:42'),
(613, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-07 14:13:58', '2022-02-07 14:13:58'),
(614, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-07 17:55:32', '2022-02-07 17:55:32'),
(615, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-08 00:16:07', '2022-02-08 00:16:07'),
(616, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-08 01:02:21', '2022-02-08 01:02:21'),
(617, 'default', 'added', 145, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":12.5}}', '2022-02-08 01:53:56', '2022-02-08 01:53:56'),
(618, 'default', 'added', 146, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":12.5}}', '2022-02-08 01:54:30', '2022-02-08 01:54:30'),
(619, 'default', 'added', 147, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":12.5}}', '2022-02-08 01:55:09', '2022-02-08 01:55:09'),
(620, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-08 18:09:19', '2022-02-08 18:09:19'),
(621, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-08 18:16:40', '2022-02-08 18:16:40'),
(622, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-08 19:39:18', '2022-02-08 19:39:18'),
(623, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-08 21:35:01', '2022-02-08 21:35:01'),
(624, 'default', 'added', 148, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":20}}', '2022-02-08 21:38:17', '2022-02-08 21:38:17'),
(625, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-08 22:05:32', '2022-02-08 22:05:32'),
(626, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-08 22:27:34', '2022-02-08 22:27:34'),
(627, 'default', 'added', 149, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":50}}', '2022-02-08 22:45:28', '2022-02-08 22:45:28'),
(628, 'default', 'added', 150, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":12.5}}', '2022-02-08 22:46:24', '2022-02-08 22:46:24'),
(629, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-09 22:50:19', '2022-02-09 22:50:19'),
(630, 'default', 'added', 38, 'App\\Contact', 1, 1, 'App\\User', '[]', '2022-02-09 22:52:00', '2022-02-09 22:52:00'),
(631, 'default', 'added', 39, 'App\\Contact', 1, 1, 'App\\User', '[]', '2022-02-09 22:58:16', '2022-02-09 22:58:16'),
(632, 'default', 'added', 151, 'App\\Transaction', 1, 1, 'App\\User', '[]', '2022-02-09 22:58:45', '2022-02-09 22:58:45'),
(633, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-10 03:47:14', '2022-02-10 03:47:14'),
(634, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-10 04:09:30', '2022-02-10 04:09:30'),
(635, 'default', 'added', 152, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"final_total\":12.5}}', '2022-02-10 04:10:50', '2022-02-10 04:10:50'),
(636, 'default', 'added', 153, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":6.4900000000000002131628207280300557613372802734375}}', '2022-02-10 04:11:23', '2022-02-10 04:11:23'),
(637, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-10 22:50:48', '2022-02-10 22:50:48'),
(638, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-11 03:05:51', '2022-02-11 03:05:51'),
(639, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-11 11:31:21', '2022-02-11 11:31:21'),
(640, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-11 14:01:23', '2022-02-11 14:01:23'),
(641, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-11 16:35:42', '2022-02-11 16:35:42'),
(642, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-12 00:24:29', '2022-02-12 00:24:29'),
(643, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-12 00:46:19', '2022-02-12 00:46:19'),
(644, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-12 01:35:07', '2022-02-12 01:35:07'),
(645, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-12 17:11:17', '2022-02-12 17:11:17'),
(646, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-12 17:23:08', '2022-02-12 17:23:08'),
(647, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-12 17:55:39', '2022-02-12 17:55:39'),
(648, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-12 19:10:15', '2022-02-12 19:10:15'),
(649, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-13 02:36:30', '2022-02-13 02:36:30'),
(650, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-13 17:45:21', '2022-02-13 17:45:21'),
(651, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-13 20:19:43', '2022-02-13 20:19:43'),
(652, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-13 20:23:38', '2022-02-13 20:23:38'),
(653, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-15 17:25:36', '2022-02-15 17:25:36'),
(654, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-15 19:12:23', '2022-02-15 19:12:23'),
(655, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-16 01:18:40', '2022-02-16 01:18:40'),
(656, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-16 18:13:46', '2022-02-16 18:13:46'),
(657, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-16 18:14:50', '2022-02-16 18:14:50'),
(658, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-17 01:19:18', '2022-02-17 01:19:18'),
(659, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-18 00:28:49', '2022-02-18 00:28:49'),
(660, 'default', 'added', 154, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":41.25}}', '2022-02-18 00:30:48', '2022-02-18 00:30:48'),
(661, 'default', 'payment_edited', 155, 'App\\Transaction', 1, 1, 'App\\User', '[]', '2022-02-18 00:35:15', '2022-02-18 00:35:15'),
(662, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-18 17:52:01', '2022-02-18 17:52:01'),
(663, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-18 21:36:48', '2022-02-18 21:36:48'),
(664, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-18 21:38:18', '2022-02-18 21:38:18'),
(665, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-18 21:39:24', '2022-02-18 21:39:24'),
(666, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-19 17:41:09', '2022-02-19 17:41:09'),
(667, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-19 20:59:06', '2022-02-19 20:59:06'),
(668, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-20 08:04:24', '2022-02-20 08:04:24'),
(669, 'default', 'added', 156, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":12.5}}', '2022-02-20 08:09:20', '2022-02-20 08:09:20'),
(670, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-20 16:17:48', '2022-02-20 16:17:48'),
(671, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-21 00:17:12', '2022-02-21 00:17:12'),
(672, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-21 00:35:18', '2022-02-21 00:35:18'),
(673, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-21 01:49:23', '2022-02-21 01:49:23'),
(674, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-21 10:20:15', '2022-02-21 10:20:15'),
(675, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-21 10:25:50', '2022-02-21 10:25:50'),
(676, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-21 10:25:53', '2022-02-21 10:25:53'),
(677, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-21 10:30:17', '2022-02-21 10:30:17'),
(678, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-21 10:47:15', '2022-02-21 10:47:15'),
(679, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-21 10:47:29', '2022-02-21 10:47:29'),
(680, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-21 10:56:39', '2022-02-21 10:56:39'),
(681, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-21 10:58:26', '2022-02-21 10:58:26'),
(682, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-21 11:15:39', '2022-02-21 11:15:39'),
(683, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-21 11:15:43', '2022-02-21 11:15:43'),
(684, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-21 15:32:31', '2022-02-21 15:32:31'),
(685, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-21 17:15:04', '2022-02-21 17:15:04'),
(686, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-21 18:52:00', '2022-02-21 18:52:00'),
(687, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-21 18:53:15', '2022-02-21 18:53:15'),
(688, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-21 18:53:36', '2022-02-21 18:53:36'),
(689, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-21 18:53:44', '2022-02-21 18:53:44'),
(690, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-22 02:10:38', '2022-02-22 02:10:38'),
(691, 'default', 'added', 157, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":12.5}}', '2022-02-22 02:11:28', '2022-02-22 02:11:28'),
(692, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-22 15:57:58', '2022-02-22 15:57:58'),
(693, 'default', 'added', 158, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":82.5}}', '2022-02-22 16:02:50', '2022-02-22 16:02:50'),
(694, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-22 16:20:07', '2022-02-22 16:20:07'),
(695, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-22 17:53:48', '2022-02-22 17:53:48'),
(696, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-22 18:07:26', '2022-02-22 18:07:26'),
(697, 'default', 'added', 159, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":93.7399999999999948840923025272786617279052734375}}', '2022-02-22 18:10:42', '2022-02-22 18:10:42');
INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_id`, `subject_type`, `business_id`, `causer_id`, `causer_type`, `properties`, `created_at`, `updated_at`) VALUES
(698, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-22 22:29:44', '2022-02-22 22:29:44'),
(699, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-23 02:44:36', '2022-02-23 02:44:36'),
(700, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-23 03:30:41', '2022-02-23 03:30:41'),
(701, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-23 08:58:39', '2022-02-23 08:58:39'),
(702, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-23 08:59:39', '2022-02-23 08:59:39'),
(703, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-23 17:41:22', '2022-02-23 17:41:22'),
(704, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-23 18:13:03', '2022-02-23 18:13:03'),
(705, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-23 21:13:31', '2022-02-23 21:13:31'),
(706, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-24 00:59:27', '2022-02-24 00:59:27'),
(707, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-24 01:00:23', '2022-02-24 01:00:23'),
(708, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-24 01:00:33', '2022-02-24 01:00:33'),
(709, 'default', 'added', 160, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":25}}', '2022-02-24 01:01:02', '2022-02-24 01:01:02'),
(710, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-24 02:23:14', '2022-02-24 02:23:14'),
(711, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-24 09:16:25', '2022-02-24 09:16:25'),
(712, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-24 09:18:25', '2022-02-24 09:18:25'),
(713, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-24 12:24:35', '2022-02-24 12:24:35'),
(714, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-24 12:45:31', '2022-02-24 12:45:31'),
(715, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-24 12:59:41', '2022-02-24 12:59:41'),
(716, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-24 13:04:21', '2022-02-24 13:04:21'),
(717, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-24 13:07:56', '2022-02-24 13:07:56'),
(718, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-24 13:08:07', '2022-02-24 13:08:07'),
(719, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-24 13:09:08', '2022-02-24 13:09:08'),
(720, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-24 13:28:01', '2022-02-24 13:28:01'),
(721, 'default', 'added', 161, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1113.75}}', '2022-02-24 14:07:40', '2022-02-24 14:07:40'),
(722, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-24 14:56:56', '2022-02-24 14:56:56'),
(723, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-24 17:00:00', '2022-02-24 17:00:00'),
(724, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-25 01:53:15', '2022-02-25 01:53:15'),
(725, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-25 04:13:34', '2022-02-25 04:13:34'),
(726, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-25 05:50:17', '2022-02-25 05:50:17'),
(727, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-25 07:05:48', '2022-02-25 07:05:48'),
(728, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-25 07:21:56', '2022-02-25 07:21:56'),
(729, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-25 07:25:58', '2022-02-25 07:25:58'),
(730, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-25 13:47:09', '2022-02-25 13:47:09'),
(731, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-26 00:18:04', '2022-02-26 00:18:04'),
(732, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-26 03:31:04', '2022-02-26 03:31:04'),
(733, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-26 16:29:25', '2022-02-26 16:29:25'),
(734, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-26 21:39:19', '2022-02-26 21:39:19'),
(735, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-27 00:45:13', '2022-02-27 00:45:13'),
(736, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-27 07:53:11', '2022-02-27 07:53:11'),
(737, 'default', 'added', 162, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":6.4900000000000002131628207280300557613372802734375}}', '2022-02-27 07:53:57', '2022-02-27 07:53:57'),
(738, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-27 11:26:22', '2022-02-27 11:26:22'),
(739, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-27 18:20:42', '2022-02-27 18:20:42'),
(740, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-28 02:32:37', '2022-02-28 02:32:37'),
(741, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-28 08:51:12', '2022-02-28 08:51:12'),
(742, 'default', 'added', 40, 'App\\Contact', 1, 1, 'App\\User', '[]', '2022-02-28 09:49:36', '2022-02-28 09:49:36'),
(743, 'default', 'edited', 8, 'App\\User', 1, 1, 'App\\User', '{\"name\":\"MR PABLO GONZALO\"}', '2022-02-28 10:57:33', '2022-02-28 10:57:33'),
(744, 'default', 'added', 41, 'App\\Contact', 1, 1, 'App\\User', '[]', '2022-02-28 11:00:05', '2022-02-28 11:00:05'),
(745, 'default', 'added', 42, 'App\\Contact', 1, 1, 'App\\User', '[]', '2022-02-28 11:06:37', '2022-02-28 11:06:37'),
(746, 'default', 'added', 43, 'App\\Contact', 1, 1, 'App\\User', '[]', '2022-02-28 11:14:56', '2022-02-28 11:14:56'),
(747, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-28 12:26:45', '2022-02-28 12:26:45'),
(748, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-28 12:27:25', '2022-02-28 12:27:25'),
(749, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-02-28 20:13:00', '2022-02-28 20:13:00'),
(750, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-01 01:23:01', '2022-03-01 01:23:01'),
(751, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-01 13:52:22', '2022-03-01 13:52:22'),
(752, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-01 13:54:34', '2022-03-01 13:54:34'),
(753, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-01 14:00:37', '2022-03-01 14:00:37'),
(754, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-01 16:10:36', '2022-03-01 16:10:36'),
(755, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-02 01:10:46', '2022-03-02 01:10:46'),
(756, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-02 16:30:03', '2022-03-02 16:30:03'),
(757, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-02 16:38:02', '2022-03-02 16:38:02'),
(758, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-02 18:17:57', '2022-03-02 18:17:57'),
(759, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-02 20:40:45', '2022-03-02 20:40:45'),
(760, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-02 21:45:09', '2022-03-02 21:45:09'),
(761, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-02 23:23:02', '2022-03-02 23:23:02'),
(762, 'default', 'added', 44, 'App\\Contact', 1, 1, 'App\\User', '[]', '2022-03-02 23:36:50', '2022-03-02 23:36:50'),
(763, 'default', 'added', 163, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1052.5}}', '2022-03-02 23:38:46', '2022-03-02 23:38:46'),
(764, 'default', 'added', 164, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"ordered\",\"payment_status\":\"due\",\"final_total\":54.13000000000000255795384873636066913604736328125}}', '2022-03-02 23:47:28', '2022-03-02 23:47:28'),
(765, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-03 01:05:21', '2022-03-03 01:05:21'),
(766, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-03 01:46:57', '2022-03-03 01:46:57'),
(767, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-03 02:38:17', '2022-03-03 02:38:17'),
(768, 'default', 'added', 166, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":107}}', '2022-03-03 02:42:22', '2022-03-03 02:42:22'),
(769, 'default', 'added', 45, 'App\\Contact', 1, 1, 'App\\User', '[]', '2022-03-03 02:44:50', '2022-03-03 02:44:50'),
(770, 'default', 'added', 167, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":59.75}}', '2022-03-03 02:44:53', '2022-03-03 02:44:53'),
(771, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-03 02:46:34', '2022-03-03 02:46:34'),
(772, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-03 02:46:39', '2022-03-03 02:46:39'),
(773, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-03 05:59:47', '2022-03-03 05:59:47'),
(774, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-03 21:34:40', '2022-03-03 21:34:40'),
(775, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-04 02:04:20', '2022-03-04 02:04:20'),
(776, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-04 06:48:00', '2022-03-04 06:48:00'),
(777, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-04 07:02:32', '2022-03-04 07:02:32'),
(778, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-04 08:38:26', '2022-03-04 08:38:26'),
(779, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-04 13:25:30', '2022-03-04 13:25:30'),
(780, 'default', 'added', 169, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1650}}', '2022-03-04 13:28:58', '2022-03-04 13:28:58'),
(781, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-04 16:09:42', '2022-03-04 16:09:42'),
(782, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-04 16:16:37', '2022-03-04 16:16:37'),
(783, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-04 20:42:07', '2022-03-04 20:42:07'),
(784, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-04 23:39:46', '2022-03-04 23:39:46'),
(785, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-05 00:13:52', '2022-03-05 00:13:52'),
(786, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-05 01:08:37', '2022-03-05 01:08:37'),
(787, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-05 01:17:49', '2022-03-05 01:17:49'),
(788, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-05 02:06:00', '2022-03-05 02:06:00'),
(789, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-05 02:54:14', '2022-03-05 02:54:14'),
(790, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-05 04:48:15', '2022-03-05 04:48:15'),
(791, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-05 10:46:20', '2022-03-05 10:46:20'),
(792, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-05 10:56:49', '2022-03-05 10:56:49'),
(793, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-05 14:39:27', '2022-03-05 14:39:27'),
(794, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-05 22:37:26', '2022-03-05 22:37:26'),
(795, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-06 00:22:17', '2022-03-06 00:22:17'),
(796, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-06 04:06:50', '2022-03-06 04:06:50'),
(797, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-06 16:26:33', '2022-03-06 16:26:33'),
(798, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-06 17:11:57', '2022-03-06 17:11:57'),
(799, 'default', 'added', 170, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"final_total\":48.2999999999999971578290569595992565155029296875}}', '2022-03-06 17:15:42', '2022-03-06 17:15:42'),
(800, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-06 17:44:17', '2022-03-06 17:44:17'),
(801, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-07 00:34:08', '2022-03-07 00:34:08'),
(802, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-07 05:58:50', '2022-03-07 05:58:50'),
(803, 'default', 'added', 46, 'App\\Contact', 1, 1, 'App\\User', '[]', '2022-03-07 06:03:57', '2022-03-07 06:03:57'),
(804, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-07 16:28:49', '2022-03-07 16:28:49'),
(805, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-07 23:17:32', '2022-03-07 23:17:32'),
(806, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-08 01:30:48', '2022-03-08 01:30:48'),
(807, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-08 01:39:33', '2022-03-08 01:39:33'),
(808, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-08 02:09:50', '2022-03-08 02:09:50'),
(809, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-08 07:09:49', '2022-03-08 07:09:49'),
(810, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-08 15:25:51', '2022-03-08 15:25:51'),
(811, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-08 16:11:46', '2022-03-08 16:11:46'),
(812, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-08 19:20:29', '2022-03-08 19:20:29'),
(813, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-08 21:57:29', '2022-03-08 21:57:29'),
(814, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-09 08:41:23', '2022-03-09 08:41:23'),
(815, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-09 09:25:39', '2022-03-09 09:25:39'),
(816, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-09 13:17:42', '2022-03-09 13:17:42'),
(817, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-09 13:33:36', '2022-03-09 13:33:36'),
(818, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-09 13:33:48', '2022-03-09 13:33:48'),
(819, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-09 16:45:52', '2022-03-09 16:45:52'),
(820, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-09 22:08:33', '2022-03-09 22:08:33'),
(821, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-09 23:53:10', '2022-03-09 23:53:10'),
(822, 'default', 'added', 171, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":103.9500000000000028421709430404007434844970703125}}', '2022-03-09 23:55:52', '2022-03-09 23:55:52'),
(823, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-10 00:54:59', '2022-03-10 00:54:59'),
(824, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-10 08:47:53', '2022-03-10 08:47:53'),
(825, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-10 08:54:06', '2022-03-10 08:54:06'),
(826, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-10 18:29:04', '2022-03-10 18:29:04'),
(827, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-11 01:28:18', '2022-03-11 01:28:18'),
(828, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-11 02:32:19', '2022-03-11 02:32:19'),
(829, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-11 02:33:24', '2022-03-11 02:33:24'),
(830, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-11 02:48:16', '2022-03-11 02:48:16'),
(831, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-11 10:11:28', '2022-03-11 10:11:28'),
(832, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-11 20:54:03', '2022-03-11 20:54:03'),
(833, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-11 21:06:35', '2022-03-11 21:06:35'),
(834, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-12 02:22:02', '2022-03-12 02:22:02'),
(835, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-12 02:35:56', '2022-03-12 02:35:56'),
(836, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-12 03:31:20', '2022-03-12 03:31:20'),
(837, 'default', 'added', 172, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":23.300000000000000710542735760100185871124267578125}}', '2022-03-12 03:31:57', '2022-03-12 03:31:57'),
(838, 'default', 'added', 173, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1705}}', '2022-03-12 03:49:08', '2022-03-12 03:49:08'),
(839, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-12 11:14:46', '2022-03-12 11:14:46'),
(840, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-12 19:24:27', '2022-03-12 19:24:27'),
(841, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-13 01:44:01', '2022-03-13 01:44:01'),
(842, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-13 14:38:02', '2022-03-13 14:38:02'),
(843, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-13 15:50:03', '2022-03-13 15:50:03'),
(844, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-13 17:44:16', '2022-03-13 17:44:16'),
(845, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-13 17:44:59', '2022-03-13 17:44:59'),
(846, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-13 17:53:00', '2022-03-13 17:53:00'),
(847, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-13 21:23:14', '2022-03-13 21:23:14'),
(848, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-13 22:50:52', '2022-03-13 22:50:52'),
(849, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-13 22:51:18', '2022-03-13 22:51:18'),
(850, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-14 03:10:30', '2022-03-14 03:10:30'),
(851, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-14 05:04:26', '2022-03-14 05:04:26'),
(852, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-14 17:35:15', '2022-03-14 17:35:15'),
(853, 'default', 'added', 174, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":250.25}}', '2022-03-14 17:46:17', '2022-03-14 17:46:17'),
(854, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-14 18:48:51', '2022-03-14 18:48:51'),
(855, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-15 00:31:06', '2022-03-15 00:31:06'),
(856, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-15 05:14:30', '2022-03-15 05:14:30'),
(857, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-15 05:29:26', '2022-03-15 05:29:26'),
(858, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-15 07:22:45', '2022-03-15 07:22:45'),
(859, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-15 13:02:15', '2022-03-15 13:02:15'),
(860, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-15 17:10:38', '2022-03-15 17:10:38'),
(861, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-15 17:12:16', '2022-03-15 17:12:16'),
(862, 'default', 'added', 47, 'App\\Contact', 1, 1, 'App\\User', '[]', '2022-03-15 18:00:47', '2022-03-15 18:00:47'),
(863, 'default', 'added', 175, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":50000}}', '2022-03-15 18:03:36', '2022-03-15 18:03:36'),
(864, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-15 19:29:41', '2022-03-15 19:29:41'),
(865, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-16 00:05:47', '2022-03-16 00:05:47'),
(866, 'default', 'added', 48, 'App\\Contact', 1, 1, 'App\\User', '[]', '2022-03-16 00:07:54', '2022-03-16 00:07:54'),
(867, 'default', 'added', 176, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":12.5}}', '2022-03-16 00:08:39', '2022-03-16 00:08:39'),
(868, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-16 15:12:42', '2022-03-16 15:12:42'),
(869, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-16 22:58:43', '2022-03-16 22:58:43'),
(870, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-17 01:22:34', '2022-03-17 01:22:34'),
(871, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-17 06:25:51', '2022-03-17 06:25:51'),
(872, 'default', 'added', 177, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1667.90000000000009094947017729282379150390625}}', '2022-03-17 06:28:31', '2022-03-17 06:28:31'),
(873, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-17 12:09:30', '2022-03-17 12:09:30'),
(874, 'default', 'added', 178, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":225}}', '2022-03-17 12:17:02', '2022-03-17 12:17:02'),
(875, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-17 19:31:09', '2022-03-17 19:31:09'),
(876, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-17 19:45:34', '2022-03-17 19:45:34'),
(877, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-17 22:36:58', '2022-03-17 22:36:58'),
(878, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-18 00:53:58', '2022-03-18 00:53:58'),
(879, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-18 02:35:19', '2022-03-18 02:35:19'),
(880, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-18 15:26:36', '2022-03-18 15:26:36'),
(881, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-18 15:27:40', '2022-03-18 15:27:40'),
(882, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-18 15:36:56', '2022-03-18 15:36:56'),
(883, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-18 17:00:47', '2022-03-18 17:00:47'),
(884, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-18 19:41:50', '2022-03-18 19:41:50'),
(885, 'default', 'added', 179, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":12.5}}', '2022-03-18 19:50:57', '2022-03-18 19:50:57'),
(886, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-18 22:22:50', '2022-03-18 22:22:50'),
(887, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-19 03:07:53', '2022-03-19 03:07:53'),
(888, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-19 18:29:50', '2022-03-19 18:29:50'),
(889, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-20 07:14:16', '2022-03-20 07:14:16'),
(890, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-20 18:37:56', '2022-03-20 18:37:56'),
(891, 'default', 'added', 180, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":12.5}}', '2022-03-20 18:39:17', '2022-03-20 18:39:17'),
(892, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-20 22:53:56', '2022-03-20 22:53:56'),
(893, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-20 23:18:53', '2022-03-20 23:18:53'),
(894, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-21 07:22:48', '2022-03-21 07:22:48'),
(895, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-21 09:38:45', '2022-03-21 09:38:45'),
(896, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-21 10:10:57', '2022-03-21 10:10:57'),
(897, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-21 15:46:41', '2022-03-21 15:46:41'),
(898, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-21 15:55:08', '2022-03-21 15:55:08'),
(899, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-21 18:02:02', '2022-03-21 18:02:02'),
(900, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-21 20:21:05', '2022-03-21 20:21:05'),
(901, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-21 20:22:58', '2022-03-21 20:22:58'),
(902, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-21 20:32:56', '2022-03-21 20:32:56'),
(903, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-21 21:18:09', '2022-03-21 21:18:09'),
(904, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-22 01:18:54', '2022-03-22 01:18:54'),
(905, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-22 02:46:08', '2022-03-22 02:46:08'),
(906, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-22 02:46:20', '2022-03-22 02:46:20'),
(907, 'default', 'added', 182, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":24.3900000000000005684341886080801486968994140625}}', '2022-03-22 02:46:51', '2022-03-22 02:46:51'),
(908, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-22 02:58:55', '2022-03-22 02:58:55'),
(909, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-22 07:37:36', '2022-03-22 07:37:36'),
(910, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-22 10:45:39', '2022-03-22 10:45:39'),
(911, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-22 13:38:40', '2022-03-22 13:38:40'),
(912, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-22 13:42:45', '2022-03-22 13:42:45'),
(913, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-22 13:56:39', '2022-03-22 13:56:39'),
(914, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-22 14:42:48', '2022-03-22 14:42:48'),
(915, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-22 20:36:58', '2022-03-22 20:36:58'),
(916, 'default', 'added', 183, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":37.5}}', '2022-03-22 21:32:07', '2022-03-22 21:32:07'),
(917, 'default', 'added', 184, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":17.89999999999999857891452847979962825775146484375}}', '2022-03-22 21:34:29', '2022-03-22 21:34:29'),
(918, 'default', 'added', 185, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":247.5}}', '2022-03-22 21:35:02', '2022-03-22 21:35:02'),
(919, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-22 23:36:03', '2022-03-22 23:36:03'),
(920, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-23 04:01:57', '2022-03-23 04:01:57'),
(921, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-23 04:53:57', '2022-03-23 04:53:57'),
(922, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-23 04:54:40', '2022-03-23 04:54:40'),
(923, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-23 04:55:06', '2022-03-23 04:55:06'),
(924, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-23 04:55:48', '2022-03-23 04:55:48'),
(925, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-23 13:11:28', '2022-03-23 13:11:28'),
(926, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-23 17:19:35', '2022-03-23 17:19:35'),
(927, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-23 17:20:52', '2022-03-23 17:20:52'),
(928, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-23 17:39:14', '2022-03-23 17:39:14'),
(929, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-23 19:37:52', '2022-03-23 19:37:52'),
(930, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-23 20:11:39', '2022-03-23 20:11:39'),
(931, 'default', 'added', 186, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":4967.899999999999636202119290828704833984375}}', '2022-03-23 20:16:09', '2022-03-23 20:16:09'),
(932, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-23 20:26:11', '2022-03-23 20:26:11'),
(933, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-24 01:25:31', '2022-03-24 01:25:31'),
(934, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-24 17:52:56', '2022-03-24 17:52:56'),
(935, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-24 18:10:56', '2022-03-24 18:10:56'),
(936, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-24 20:22:56', '2022-03-24 20:22:56'),
(937, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-24 20:54:51', '2022-03-24 20:54:51'),
(938, 'default', 'added', 187, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":12.5}}', '2022-03-24 21:01:15', '2022-03-24 21:01:15'),
(939, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-25 03:16:36', '2022-03-25 03:16:36'),
(940, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-25 08:43:11', '2022-03-25 08:43:11'),
(941, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-25 12:22:27', '2022-03-25 12:22:27'),
(942, 'default', 'added', 188, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":34650}}', '2022-03-25 13:13:17', '2022-03-25 13:13:17'),
(943, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-25 16:45:23', '2022-03-25 16:45:23'),
(944, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-25 17:40:18', '2022-03-25 17:40:18'),
(945, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-25 22:19:51', '2022-03-25 22:19:51'),
(946, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-25 22:21:37', '2022-03-25 22:21:37'),
(947, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-25 22:32:18', '2022-03-25 22:32:18'),
(948, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-25 22:35:03', '2022-03-25 22:35:03'),
(949, 'default', 'added', 189, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":25}}', '2022-03-25 22:39:58', '2022-03-25 22:39:58'),
(950, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-26 01:35:38', '2022-03-26 01:35:38'),
(951, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-26 01:42:08', '2022-03-26 01:42:08'),
(952, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-26 01:42:46', '2022-03-26 01:42:46'),
(953, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-26 01:42:58', '2022-03-26 01:42:58'),
(954, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-03-26 01:43:19', '2022-03-26 01:43:19'),
(955, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-04-03 05:03:13', '2022-04-03 05:03:13'),
(956, 'default', 'purchase_deleted', 175, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":\"50000.0000\"}}', '2022-04-03 05:21:29', '2022-04-03 05:21:29'),
(958, 'default', 'purchase_deleted', 143, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"partial\",\"final_total\":\"11.0000\"}}', '2022-04-03 05:21:40', '2022-04-03 05:21:40'),
(960, 'default', 'sell_deleted', 179, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":179,\"invoice_no\":\"INV0000117\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"12.5000\"}}', '2022-04-03 05:22:03', '2022-04-03 05:22:03'),
(961, 'default', 'sell_deleted', 189, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":189,\"invoice_no\":\"INV0000124\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"25.0000\"}}', '2022-04-03 05:22:13', '2022-04-03 05:22:13'),
(962, 'default', 'sell_deleted', 186, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":186,\"invoice_no\":\"INV0000122\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"4967.9000\"}}', '2022-04-03 05:22:17', '2022-04-03 05:22:17'),
(963, 'default', 'sell_deleted', 178, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":178,\"invoice_no\":\"INV0000116\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"225.0000\"}}', '2022-04-03 05:22:22', '2022-04-03 05:22:22'),
(964, 'default', 'sell_deleted', 172, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":172,\"invoice_no\":\"INV0000112\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"23.3000\"}}', '2022-04-03 05:22:26', '2022-04-03 05:22:26'),
(965, 'default', 'sell_deleted', 180, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":180,\"invoice_no\":\"INV0000118\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"12.5000\"}}', '2022-04-03 05:22:30', '2022-04-03 05:22:30'),
(966, 'default', 'sell_deleted', 184, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":184,\"invoice_no\":\"INV0000121\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"17.9000\"}}', '2022-04-03 05:22:40', '2022-04-03 05:22:40'),
(967, 'default', 'sell_deleted', 182, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":182,\"invoice_no\":\"INV0000119\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"24.3900\"}}', '2022-04-03 05:22:44', '2022-04-03 05:22:44'),
(968, 'default', 'sell_deleted', 177, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":177,\"invoice_no\":\"INV0000115\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"1667.9000\"}}', '2022-04-03 05:23:03', '2022-04-03 05:23:03'),
(969, 'default', 'sell_deleted', 169, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":169,\"invoice_no\":\"INV0000110\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"1650.0000\"}}', '2022-04-03 05:23:09', '2022-04-03 05:23:09'),
(970, 'default', 'sell_deleted', 173, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":173,\"invoice_no\":\"INV0000113\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"1705.0000\"}}', '2022-04-03 05:23:15', '2022-04-03 05:23:15'),
(971, 'default', 'sell_deleted', 176, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":176,\"invoice_no\":\"INV0000114\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"12.5000\"}}', '2022-04-03 05:23:22', '2022-04-03 05:23:22'),
(972, 'default', 'sell_deleted', 183, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":183,\"invoice_no\":\"INV0000120\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"37.5000\"}}', '2022-04-03 05:23:28', '2022-04-03 05:23:28'),
(973, 'default', 'sell_deleted', 164, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":164,\"invoice_no\":\"INV0000107\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"ordered\",\"payment_status\":\"due\",\"final_total\":\"54.1300\"}}', '2022-04-03 05:23:33', '2022-04-03 05:23:33'),
(974, 'default', 'sell_deleted', 166, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":166,\"invoice_no\":\"INV0000108\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"107.0000\"}}', '2022-04-03 05:23:39', '2022-04-03 05:23:39'),
(975, 'default', 'sell_deleted', 163, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":163,\"invoice_no\":\"INV0000106\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"1052.5000\"}}', '2022-04-03 05:23:44', '2022-04-03 05:23:44'),
(976, 'default', 'sell_deleted', 162, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":162,\"invoice_no\":\"INV0000105\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"6.4900\"}}', '2022-04-03 05:23:49', '2022-04-03 05:23:49'),
(977, 'default', 'sell_deleted', 167, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":167,\"invoice_no\":\"INV0000109\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"59.7500\"}}', '2022-04-03 05:23:55', '2022-04-03 05:23:56'),
(978, 'default', 'sell_deleted', 161, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":161,\"invoice_no\":\"INV0000104\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"1113.7500\"}}', '2022-04-03 05:24:04', '2022-04-03 05:24:04'),
(979, 'default', 'sell_deleted', 171, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":171,\"invoice_no\":\"INV0000111\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"103.9500\"}}', '2022-04-03 05:24:12', '2022-04-03 05:24:12'),
(980, 'default', 'sell_deleted', 188, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":188,\"invoice_no\":\"INV0000123\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"34650.0000\"}}', '2022-04-03 05:24:17', '2022-04-03 05:24:17'),
(981, 'default', 'sell_deleted', 160, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":160,\"invoice_no\":\"INV0000103\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"25.0000\"}}', '2022-04-03 05:24:23', '2022-04-03 05:24:23'),
(982, 'default', 'sell_deleted', 159, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":159,\"invoice_no\":\"INV0000102\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"93.7400\"}}', '2022-04-03 05:24:29', '2022-04-03 05:24:29'),
(983, 'default', 'sell_deleted', 158, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":158,\"invoice_no\":\"INV0000101\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"82.5000\"}}', '2022-04-03 05:24:45', '2022-04-03 05:24:45'),
(984, 'default', 'sell_deleted', 157, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":157,\"invoice_no\":\"INV0000100\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"12.5000\"}}', '2022-04-03 05:24:54', '2022-04-03 05:24:54'),
(985, 'default', 'sell_deleted', 153, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":153,\"invoice_no\":\"INV0000099\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"6.4900\"}}', '2022-04-03 05:25:00', '2022-04-03 05:25:00'),
(986, 'default', 'sell_deleted', 150, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":150,\"invoice_no\":\"INV0000098\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"12.5000\"}}', '2022-04-03 05:25:06', '2022-04-03 05:25:06'),
(987, 'default', 'sell_deleted', 149, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":149,\"invoice_no\":\"INV0000097\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"50.0000\"}}', '2022-04-03 05:25:12', '2022-04-03 05:25:12'),
(988, 'default', 'sell_deleted', 147, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":147,\"invoice_no\":\"INV0000096\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"12.5000\"}}', '2022-04-03 05:25:18', '2022-04-03 05:25:18'),
(989, 'default', 'sell_deleted', 146, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":146,\"invoice_no\":\"INV0000095\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"12.5000\"}}', '2022-04-03 05:25:32', '2022-04-03 05:25:32'),
(990, 'default', 'sell_deleted', 145, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":145,\"invoice_no\":\"INV0000094\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"12.5000\"}}', '2022-04-03 05:25:38', '2022-04-03 05:25:38'),
(991, 'default', 'sell_deleted', 144, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":144,\"invoice_no\":\"INV0000093\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"12.5000\"}}', '2022-04-03 05:26:14', '2022-04-03 05:26:14'),
(992, 'default', 'sell_deleted', 142, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":142,\"invoice_no\":\"INV0000092\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"55.0000\"}}', '2022-04-03 05:26:35', '2022-04-03 05:26:35'),
(993, 'default', 'sell_deleted', 141, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":141,\"invoice_no\":\"INV0000091\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"25.0000\"}}', '2022-04-03 05:26:42', '2022-04-03 05:26:42'),
(994, 'default', 'sell_deleted', 140, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":140,\"invoice_no\":\"INV0000090\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"50.0000\"}}', '2022-04-03 05:26:48', '2022-04-03 05:26:48'),
(995, 'default', 'sell_deleted', 138, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":138,\"invoice_no\":\"INV0000089\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"100.0000\"}}', '2022-04-03 05:26:54', '2022-04-03 05:26:54'),
(996, 'default', 'sell_deleted', 136, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":136,\"invoice_no\":\"INV0000088\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"375.0000\"}}', '2022-04-03 05:27:00', '2022-04-03 05:27:00'),
(997, 'default', 'sell_deleted', 134, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":134,\"invoice_no\":\"INV0000087\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"330.7500\"}}', '2022-04-03 05:27:05', '2022-04-03 05:27:05'),
(998, 'default', 'sell_deleted', 133, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":133,\"invoice_no\":\"INV0000086\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"13.3800\"}}', '2022-04-03 05:27:10', '2022-04-03 05:27:10'),
(999, 'default', 'sell_deleted', 129, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":129,\"invoice_no\":\"INV0000084\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"94.5000\"}}', '2022-04-03 05:27:15', '2022-04-03 05:27:15'),
(1000, 'default', 'sell_deleted', 130, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":130,\"invoice_no\":\"INV0000085\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"124.5000\"}}', '2022-04-03 05:27:24', '2022-04-03 05:27:24'),
(1001, 'default', 'sell_deleted', 128, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":128,\"invoice_no\":\"INV0000083\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"1000.0000\"}}', '2022-04-03 05:27:30', '2022-04-03 05:27:30'),
(1002, 'default', 'sell_deleted', 126, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":126,\"invoice_no\":\"INV0000082\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"5000.0000\"}}', '2022-04-03 05:27:36', '2022-04-03 05:27:36'),
(1003, 'default', 'sell_deleted', 125, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":125,\"invoice_no\":\"INV0000081\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"157.0000\"}}', '2022-04-03 05:27:43', '2022-04-03 05:27:43'),
(1004, 'default', 'sell_deleted', 124, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":124,\"invoice_no\":\"INV0000080\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"25.0000\"}}', '2022-04-03 05:27:47', '2022-04-03 05:27:47'),
(1005, 'default', 'sell_deleted', 123, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":123,\"invoice_no\":\"INV0000079\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"6.4900\"}}', '2022-04-03 05:27:53', '2022-04-03 05:27:53'),
(1006, 'default', 'sell_deleted', 122, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":122,\"invoice_no\":\"INV0000078\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"429.7900\"}}', '2022-04-03 05:27:58', '2022-04-03 05:27:58'),
(1007, 'default', 'sell_deleted', 120, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":120,\"invoice_no\":\"INV0000077\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"2300.0000\"}}', '2022-04-03 05:28:04', '2022-04-03 05:28:04'),
(1008, 'default', 'sell_deleted', 119, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":119,\"invoice_no\":\"INV0000076\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"4600.0000\"}}', '2022-04-03 05:28:09', '2022-04-03 05:28:09'),
(1009, 'default', 'sell_deleted', 117, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":117,\"invoice_no\":\"INV0000075\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"4600.0000\"}}', '2022-04-03 05:28:18', '2022-04-03 05:28:18'),
(1010, 'default', 'sell_deleted', 116, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":116,\"invoice_no\":\"INV0000074\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"11500.0000\"}}', '2022-04-03 05:28:22', '2022-04-03 05:28:22'),
(1011, 'default', 'sell_deleted', 112, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":112,\"invoice_no\":\"INV0000073\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"6.4900\"}}', '2022-04-03 05:28:27', '2022-04-03 05:28:27'),
(1012, 'default', 'sell_deleted', 111, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":111,\"invoice_no\":\"INV0000072\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"2506.4900\"}}', '2022-04-03 05:28:38', '2022-04-03 05:28:38'),
(1013, 'default', 'sell_deleted', 105, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":105,\"invoice_no\":\"INV0000070\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"229.9900\"}}', '2022-04-03 05:28:45', '2022-04-03 05:28:45'),
(1014, 'default', 'sell_deleted', 110, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":110,\"invoice_no\":\"INV0000071\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"12.9800\"}}', '2022-04-03 05:28:52', '2022-04-03 05:28:52'),
(1015, 'default', 'sell_deleted', 104, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":104,\"invoice_no\":\"INV0000069\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"2300.0000\"}}', '2022-04-03 05:28:56', '2022-04-03 05:28:56'),
(1016, 'default', 'sell_deleted', 103, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":103,\"invoice_no\":\"INV0000068\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"109760.0000\"}}', '2022-04-03 05:29:02', '2022-04-03 05:29:02'),
(1017, 'default', 'sell_deleted', 102, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":102,\"invoice_no\":\"INV0000067\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"2300.0000\"}}', '2022-04-03 05:29:07', '2022-04-03 05:29:07'),
(1018, 'default', 'sell_deleted', 100, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":100,\"invoice_no\":\"INV0000066\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"2325.0000\"}}', '2022-04-03 05:29:13', '2022-04-03 05:29:13');
INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_id`, `subject_type`, `business_id`, `causer_id`, `causer_type`, `properties`, `created_at`, `updated_at`) VALUES
(1019, 'default', 'sell_deleted', 99, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":99,\"invoice_no\":\"INV0000065\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"4600.0000\"}}', '2022-04-03 05:29:19', '2022-04-03 05:29:19'),
(1020, 'default', 'sell_deleted', 187, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":187,\"invoice_no\":\"2022\\/0032\",\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":\"12.5000\"}}', '2022-04-03 05:29:32', '2022-04-03 05:29:32'),
(1021, 'default', 'sell_deleted', 185, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":185,\"invoice_no\":\"2022\\/0031\",\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":\"247.5000\"}}', '2022-04-03 05:29:37', '2022-04-03 05:29:37'),
(1022, 'default', 'sell_deleted', 174, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":174,\"invoice_no\":\"2022\\/0030\",\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":\"250.2500\"}}', '2022-04-03 05:29:43', '2022-04-03 05:29:43'),
(1023, 'default', 'sell_deleted', 156, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":156,\"invoice_no\":\"2022\\/0028\",\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":\"12.5000\"}}', '2022-04-03 05:29:48', '2022-04-03 05:29:48'),
(1024, 'default', 'sell_deleted', 154, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":154,\"invoice_no\":\"2022\\/0027\",\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":\"41.2500\"}}', '2022-04-03 05:29:54', '2022-04-03 05:29:54'),
(1025, 'default', 'sell_deleted', 139, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":139,\"invoice_no\":\"2022\\/0025\",\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":\"12.5000\"}}', '2022-04-03 05:29:59', '2022-04-03 05:29:59'),
(1026, 'default', 'sell_deleted', 127, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":127,\"invoice_no\":\"2022\\/0023\",\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":\"94.5000\"}}', '2022-04-03 05:30:04', '2022-04-03 05:30:04'),
(1027, 'default', 'sell_deleted', 131, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":131,\"invoice_no\":\"2022\\/0024\",\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":\"47.2000\"}}', '2022-04-03 05:30:08', '2022-04-03 05:30:08'),
(1028, 'default', 'sell_deleted', 121, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":121,\"invoice_no\":\"2022\\/0021\",\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":\"2648.7500\"}}', '2022-04-03 05:30:13', '2022-04-03 05:30:13'),
(1029, 'default', 'sell_deleted', 108, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":108,\"invoice_no\":\"2022\\/0016\",\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":\"6.4900\"}}', '2022-04-03 05:30:18', '2022-04-03 05:30:18'),
(1030, 'default', 'sell_deleted', 107, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":107,\"invoice_no\":\"2022\\/0015\",\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":\"157.4800\"}}', '2022-04-03 05:30:23', '2022-04-03 05:30:23'),
(1031, 'default', 'sell_deleted', 170, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":170,\"invoice_no\":\"2022\\/0029\",\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"final_total\":\"48.3000\"}}', '2022-04-03 05:30:32', '2022-04-03 05:30:32'),
(1032, 'default', 'sell_deleted', 152, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":152,\"invoice_no\":\"2022\\/0026\",\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"final_total\":\"12.5000\"}}', '2022-04-03 05:30:37', '2022-04-03 05:30:37'),
(1033, 'default', 'sell_deleted', 118, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":118,\"invoice_no\":\"2022\\/0020\",\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"final_total\":\"4600.0000\"}}', '2022-04-03 05:30:43', '2022-04-03 05:30:43'),
(1034, 'default', 'sell_deleted', 114, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":114,\"invoice_no\":\"2022\\/0019\",\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"final_total\":\"6.4900\"}}', '2022-04-03 05:30:47', '2022-04-03 05:30:47'),
(1035, 'default', 'sell_deleted', 113, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":113,\"invoice_no\":\"2022\\/0018\",\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"final_total\":\"123.7500\"}}', '2022-04-03 05:30:52', '2022-04-03 05:30:52'),
(1036, 'default', 'sell_deleted', 109, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":109,\"invoice_no\":\"2022\\/0017\",\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"final_total\":\"6.4900\"}}', '2022-04-03 05:30:58', '2022-04-03 05:30:58'),
(1037, 'default', 'sell_deleted', 106, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":106,\"invoice_no\":\"2022\\/0014\",\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"final_total\":\"25.0000\"}}', '2022-04-03 05:31:05', '2022-04-03 05:31:05'),
(1038, 'default', 'purchase_deleted', 148, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":\"20.0000\"}}', '2022-04-03 05:31:46', '2022-04-03 05:31:46'),
(1039, 'default', 'purchase_deleted', 101, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":\"50000.0000\"}}', '2022-04-03 05:31:50', '2022-04-03 05:31:50'),
(1040, 'default', 'po_deleted', 151, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":151,\"ref_no\":\"2022\\/0003\"}', '2022-04-03 05:36:46', '2022-04-03 05:36:46'),
(1041, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-04-03 05:46:32', '2022-04-03 05:46:32'),
(1042, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-04-03 05:47:44', '2022-04-03 05:47:44'),
(1043, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-04-03 12:59:01', '2022-04-03 12:59:01'),
(1044, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-04-04 00:30:39', '2022-04-04 00:30:39'),
(1045, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-07-11 15:29:54', '2022-07-11 15:29:54'),
(1046, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-07-11 15:37:10', '2022-07-11 15:37:10');

-- --------------------------------------------------------

--
-- Table structure for table `barcodes`
--

CREATE TABLE `barcodes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `width` double(22,4) DEFAULT NULL,
  `height` double(22,4) DEFAULT NULL,
  `paper_width` double(22,4) DEFAULT NULL,
  `paper_height` double(22,4) DEFAULT NULL,
  `top_margin` double(22,4) DEFAULT NULL,
  `left_margin` double(22,4) DEFAULT NULL,
  `row_distance` double(22,4) DEFAULT NULL,
  `col_distance` double(22,4) DEFAULT NULL,
  `stickers_in_one_row` int(11) DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `is_continuous` tinyint(1) NOT NULL DEFAULT '0',
  `stickers_in_one_sheet` int(11) DEFAULT NULL,
  `business_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `barcodes`
--

INSERT INTO `barcodes` (`id`, `name`, `description`, `width`, `height`, `paper_width`, `paper_height`, `top_margin`, `left_margin`, `row_distance`, `col_distance`, `stickers_in_one_row`, `is_default`, `is_continuous`, `stickers_in_one_sheet`, `business_id`, `created_at`, `updated_at`) VALUES
(1, '20 Labels per Sheet', 'Sheet Size: 8.5\" x 11\", Label Size: 4\" x 1\", Labels per sheet: 20', 4.0000, 1.0000, 8.5000, 11.0000, 0.5000, 0.1250, 0.0000, 0.1875, 2, 0, 0, 20, NULL, '2017-12-18 13:13:44', '2017-12-18 13:13:44'),
(2, '30 Labels per sheet', 'Sheet Size: 8.5\" x 11\", Label Size: 2.625\" x 1\", Labels per sheet: 30', 2.6250, 1.0000, 8.5000, 11.0000, 0.5000, 0.1880, 0.0000, 0.1250, 3, 0, 0, 30, NULL, '2017-12-18 13:04:39', '2017-12-18 13:10:40'),
(3, '32 Labels per sheet', 'Sheet Size: 8.5\" x 11\", Label Size: 2\" x 1.25\", Labels per sheet: 32', 2.0000, 1.2500, 8.5000, 11.0000, 0.5000, 0.2500, 0.0000, 0.0000, 4, 0, 0, 32, NULL, '2017-12-18 12:55:40', '2017-12-18 12:55:40'),
(4, '40 Labels per sheet', 'Sheet Size: 8.5\" x 11\", Label Size: 2\" x 1\", Labels per sheet: 40', 2.0000, 1.0000, 8.5000, 11.0000, 0.5000, 0.2500, 0.0000, 0.0000, 4, 0, 0, 40, NULL, '2017-12-18 12:58:40', '2017-12-18 12:58:40'),
(5, '50 Labels per Sheet', 'Sheet Size: 8.5\" x 11\", Label Size: 1.5\" x 1\", Labels per sheet: 50', 1.5000, 1.0000, 8.5000, 11.0000, 0.5000, 0.5000, 0.0000, 0.0000, 5, 0, 0, 50, NULL, '2017-12-18 12:51:10', '2017-12-18 12:51:10'),
(6, 'Continuous Rolls - 31.75mm x 25.4mm', 'Label Size: 31.75mm x 25.4mm, Gap: 3.18mm', 1.2500, 1.0000, 1.2500, 0.0000, 0.1250, 0.0000, 0.1250, 0.0000, 1, 0, 1, NULL, NULL, '2017-12-18 12:51:10', '2017-12-18 12:51:10'),
(7, 'DEFAULT', NULL, 2.0000, 1.2000, 2.0000, 1.2000, 0.0000, 0.0000, 0.0000, 0.0000, 1, 1, 0, 1, 1, '2022-01-05 09:49:25', '2022-01-05 09:49:36');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(10) UNSIGNED NOT NULL,
  `contact_id` int(10) UNSIGNED NOT NULL,
  `waiter_id` int(10) UNSIGNED DEFAULT NULL,
  `table_id` int(10) UNSIGNED DEFAULT NULL,
  `correspondent_id` int(11) DEFAULT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `booking_start` datetime NOT NULL,
  `booking_end` datetime NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `booking_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `booking_note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `contact_id`, `waiter_id`, `table_id`, `correspondent_id`, `business_id`, `location_id`, `booking_start`, `booking_end`, `created_by`, `booking_status`, `booking_note`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL, NULL, 1, 1, '2022-02-24 09:35:00', '2022-02-24 11:35:00', 1, 'booked', NULL, '2022-02-24 13:36:48', '2022-02-24 13:36:48');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_by` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `business_id`, `name`, `description`, `created_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Samsung', NULL, 1, '2022-04-03 05:35:41', '2022-01-21 04:43:05', '2022-04-03 05:35:41'),
(2, 1, 'Huawei', 'n', 1, '2022-04-03 05:35:31', '2022-01-21 04:43:40', '2022-04-03 05:35:31'),
(3, 1, 'sony', NULL, 1, '2022-04-03 05:35:47', '2022-01-21 04:44:07', '2022-04-03 05:35:47'),
(4, 1, 'OUP', NULL, 1, '2022-04-03 05:35:37', '2022-01-27 18:27:29', '2022-04-03 05:35:37'),
(5, 1, 'white label', NULL, 1, '2022-04-03 05:35:50', '2022-01-31 04:15:16', '2022-04-03 05:35:50'),
(6, 1, 'Qrt', NULL, 1, '2022-04-03 05:35:44', '2022-02-02 18:05:47', '2022-04-03 05:35:44'),
(7, 1, 'H&S', NULL, 1, '2022-04-03 05:35:28', '2022-02-09 22:52:21', '2022-04-03 05:35:28'),
(8, 1, 'BMW', NULL, 1, '2022-04-03 05:35:25', '2022-02-21 10:45:31', '2022-04-03 05:35:25'),
(9, 1, 'xiaomi', 'smartphone', 1, '2022-04-03 05:35:53', '2022-02-27 11:53:54', '2022-04-03 05:35:53'),
(10, 1, 'Nivea', NULL, 1, '2022-04-03 05:35:34', '2022-03-22 20:58:31', '2022-04-03 05:35:34');

-- --------------------------------------------------------

--
-- Table structure for table `business`
--

CREATE TABLE `business` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_id` int(10) UNSIGNED NOT NULL,
  `start_date` date DEFAULT NULL,
  `tax_number_1` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_label_1` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_number_2` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_label_2` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code_label_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code_label_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_sales_tax` int(10) UNSIGNED DEFAULT NULL,
  `default_profit_percent` double(5,2) NOT NULL DEFAULT '0.00',
  `owner_id` int(10) UNSIGNED NOT NULL,
  `time_zone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Asia/Kolkata',
  `fy_start_month` tinyint(4) NOT NULL DEFAULT '1',
  `accounting_method` enum('fifo','lifo','avco') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fifo',
  `default_sales_discount` decimal(5,2) DEFAULT NULL,
  `sell_price_tax` enum('includes','excludes') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'includes',
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku_prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enable_product_expiry` tinyint(1) NOT NULL DEFAULT '0',
  `expiry_type` enum('add_expiry','add_manufacturing') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'add_expiry',
  `on_product_expiry` enum('keep_selling','stop_selling','auto_delete') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'keep_selling',
  `stop_selling_before` int(11) NOT NULL COMMENT 'Stop selling expied item n days before expiry',
  `enable_tooltip` tinyint(1) NOT NULL DEFAULT '1',
  `purchase_in_diff_currency` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Allow purchase to be in different currency then the business currency',
  `purchase_currency_id` int(10) UNSIGNED DEFAULT NULL,
  `p_exchange_rate` decimal(20,3) NOT NULL DEFAULT '1.000',
  `transaction_edit_days` int(10) UNSIGNED NOT NULL DEFAULT '30',
  `stock_expiry_alert_days` int(10) UNSIGNED NOT NULL DEFAULT '30',
  `keyboard_shortcuts` text COLLATE utf8mb4_unicode_ci,
  `pos_settings` text COLLATE utf8mb4_unicode_ci,
  `woocommerce_api_settings` text COLLATE utf8mb4_unicode_ci,
  `woocommerce_skipped_orders` text COLLATE utf8mb4_unicode_ci,
  `woocommerce_wh_oc_secret` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `woocommerce_wh_ou_secret` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `woocommerce_wh_od_secret` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `woocommerce_wh_or_secret` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `essentials_settings` longtext COLLATE utf8mb4_unicode_ci,
  `weighing_scale_setting` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'used to store the configuration of weighing scale',
  `enable_brand` tinyint(1) NOT NULL DEFAULT '1',
  `enable_category` tinyint(1) NOT NULL DEFAULT '1',
  `enable_sub_category` tinyint(1) NOT NULL DEFAULT '1',
  `enable_price_tax` tinyint(1) NOT NULL DEFAULT '1',
  `enable_purchase_status` tinyint(1) DEFAULT '1',
  `enable_lot_number` tinyint(1) NOT NULL DEFAULT '0',
  `default_unit` int(11) DEFAULT NULL,
  `enable_sub_units` tinyint(1) NOT NULL DEFAULT '0',
  `enable_racks` tinyint(1) NOT NULL DEFAULT '0',
  `enable_row` tinyint(1) NOT NULL DEFAULT '0',
  `enable_position` tinyint(1) NOT NULL DEFAULT '0',
  `enable_editing_product_from_purchase` tinyint(1) NOT NULL DEFAULT '1',
  `sales_cmsn_agnt` enum('logged_in_user','user','cmsn_agnt') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_addition_method` tinyint(1) NOT NULL DEFAULT '1',
  `enable_inline_tax` tinyint(1) NOT NULL DEFAULT '1',
  `currency_symbol_placement` enum('before','after') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'before',
  `enabled_modules` text COLLATE utf8mb4_unicode_ci,
  `date_format` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'm/d/Y',
  `time_format` enum('12','24') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '24',
  `ref_no_prefixes` text COLLATE utf8mb4_unicode_ci,
  `theme_color` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `repair_settings` text COLLATE utf8mb4_unicode_ci,
  `enable_rp` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'rp is the short form of reward points',
  `rp_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `amount_for_unit_rp` decimal(22,4) NOT NULL DEFAULT '1.0000' COMMENT 'rp is the short form of reward points',
  `min_order_total_for_rp` decimal(22,4) NOT NULL DEFAULT '1.0000' COMMENT 'rp is the short form of reward points',
  `max_rp_per_order` int(11) DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `redeem_amount_per_unit_rp` decimal(22,4) NOT NULL DEFAULT '1.0000' COMMENT 'rp is the short form of reward points',
  `min_order_total_for_redeem` decimal(22,4) NOT NULL DEFAULT '1.0000' COMMENT 'rp is the short form of reward points',
  `min_redeem_point` int(11) DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `max_redeem_point` int(11) DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `rp_expiry_period` int(11) DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `rp_expiry_type` enum('month','year') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'year' COMMENT 'rp is the short form of reward points',
  `email_settings` text COLLATE utf8mb4_unicode_ci,
  `sms_settings` text COLLATE utf8mb4_unicode_ci,
  `custom_labels` text COLLATE utf8mb4_unicode_ci,
  `common_settings` text COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business`
--

INSERT INTO `business` (`id`, `name`, `currency_id`, `start_date`, `tax_number_1`, `tax_label_1`, `tax_number_2`, `tax_label_2`, `code_label_1`, `code_1`, `code_label_2`, `code_2`, `default_sales_tax`, `default_profit_percent`, `owner_id`, `time_zone`, `fy_start_month`, `accounting_method`, `default_sales_discount`, `sell_price_tax`, `logo`, `sku_prefix`, `enable_product_expiry`, `expiry_type`, `on_product_expiry`, `stop_selling_before`, `enable_tooltip`, `purchase_in_diff_currency`, `purchase_currency_id`, `p_exchange_rate`, `transaction_edit_days`, `stock_expiry_alert_days`, `keyboard_shortcuts`, `pos_settings`, `woocommerce_api_settings`, `woocommerce_skipped_orders`, `woocommerce_wh_oc_secret`, `woocommerce_wh_ou_secret`, `woocommerce_wh_od_secret`, `woocommerce_wh_or_secret`, `essentials_settings`, `weighing_scale_setting`, `enable_brand`, `enable_category`, `enable_sub_category`, `enable_price_tax`, `enable_purchase_status`, `enable_lot_number`, `default_unit`, `enable_sub_units`, `enable_racks`, `enable_row`, `enable_position`, `enable_editing_product_from_purchase`, `sales_cmsn_agnt`, `item_addition_method`, `enable_inline_tax`, `currency_symbol_placement`, `enabled_modules`, `date_format`, `time_format`, `ref_no_prefixes`, `theme_color`, `created_by`, `repair_settings`, `enable_rp`, `rp_name`, `amount_for_unit_rp`, `min_order_total_for_rp`, `max_rp_per_order`, `redeem_amount_per_unit_rp`, `min_order_total_for_redeem`, `min_redeem_point`, `max_redeem_point`, `rp_expiry_period`, `rp_expiry_type`, `email_settings`, `sms_settings`, `custom_labels`, `common_settings`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Test POS', 95, '2000-01-01', NULL, 'VAT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25.00, 1, 'Europe/London', 1, 'fifo', 0.00, 'includes', '1648937684_GREENMAXX-1536x589.jpg', 'GM', 0, 'add_expiry', 'keep_selling', 0, 1, 0, NULL, 1.000, 30, 30, '{\"pos\":{\"express_checkout\":\"shift+e\",\"pay_n_ckeckout\":\"shift+p\",\"draft\":\"shift+d\",\"cancel\":\"shift+c\",\"recent_product_quantity\":\"f2\",\"weighing_scale\":null,\"edit_discount\":\"shift+i\",\"edit_order_tax\":\"shift+t\",\"add_payment_row\":\"shift+r\",\"finalize_payment\":\"shift+f\",\"add_new_product\":\"f4\"}}', '{\"cmmsn_calculation_type\":\"invoice_value\",\"amount_rounding_method\":null,\"enable_sales_order\":\"1\",\"cash_denominations\":null,\"disable_pay_checkout\":0,\"disable_draft\":0,\"disable_express_checkout\":0,\"hide_product_suggestion\":0,\"hide_recent_trans\":0,\"disable_discount\":0,\"disable_order_tax\":0,\"is_pos_subtotal_editable\":0}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"label_prefix\":null,\"product_sku_length\":\"4\",\"qty_length\":\"3\",\"qty_length_decimal\":\"2\"}', 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, NULL, 1, 0, 'before', '[\"purchases\",\"add_sale\",\"pos_sale\",\"stock_transfers\",\"stock_adjustment\",\"expenses\",\"account\"]', 'm/d/Y', '24', '{\"purchase\":\"PO\",\"purchase_return\":\"PR\",\"purchase_order\":null,\"stock_transfer\":\"ST\",\"stock_adjustment\":\"SA\",\"sell_return\":\"CUSTOMER RETURN\",\"expense\":\"EP\",\"contacts\":\"CO\",\"purchase_payment\":\"PP\",\"sell_payment\":\"SP\",\"expense_payment\":null,\"business_location\":\"BL\",\"username\":null,\"subscription\":null,\"draft\":null,\"sales_order\":\"SO\"}', 'blue', NULL, '{\"repair_tc_condition\":\"<p><strong><span style=\\\"color: #e03e2d;\\\">IMPORTANTE<\\/span>&nbsp;<\\/strong> <span style=\\\"color: #3598db;\\\"><strong>1<\\/strong><\\/span> El cliente se compromete a retirar su dispositivo en un plazo maximo de 7 dias despues de la finalizado el proseso de reparaci&oacute;n&nbsp;<\\/p>\\r\\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <strong><span style=\\\"color: #3598db;\\\">2<\\/span><\\/strong> Pasado los 30 dias de la finalizaci&oacute;n del proseso de reparaci&oacute;n el equipo pasar&aacute; a bodega, comprometiendose a pagar el costo diario del mismo como responsabilidad de la&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;empresa para cubrir danos ocurridos al mismo.<\\/p>\",\"job_sheet_prefix\":null,\"problem_reported_by_customer\":null,\"product_condition\":null,\"product_configuration\":null,\"job_sheet_custom_field_1\":null,\"job_sheet_custom_field_2\":null,\"job_sheet_custom_field_3\":null,\"job_sheet_custom_field_4\":null,\"job_sheet_custom_field_5\":null,\"default_status\":\"2\"}', 0, NULL, 1.0000, 1.0000, NULL, 1.0000, 1.0000, NULL, NULL, NULL, 'year', '{\"mail_driver\":\"smtp\",\"mail_host\":null,\"mail_port\":null,\"mail_username\":null,\"mail_password\":null,\"mail_encryption\":null,\"mail_from_address\":null,\"mail_from_name\":null}', '{\"sms_service\":\"other\",\"nexmo_key\":null,\"nexmo_secret\":null,\"nexmo_from\":null,\"twilio_sid\":null,\"twilio_token\":null,\"twilio_from\":null,\"url\":null,\"send_to_param_name\":\"to\",\"msg_param_name\":\"text\",\"request_method\":\"post\",\"header_1\":null,\"header_val_1\":null,\"header_2\":null,\"header_val_2\":null,\"header_3\":null,\"header_val_3\":null,\"param_1\":null,\"param_val_1\":null,\"param_2\":null,\"param_val_2\":null,\"param_3\":null,\"param_val_3\":null,\"param_4\":null,\"param_val_4\":null,\"param_5\":null,\"param_val_5\":null,\"param_6\":null,\"param_val_6\":null,\"param_7\":null,\"param_val_7\":null,\"param_8\":null,\"param_val_8\":null,\"param_9\":null,\"param_val_9\":null,\"param_10\":null,\"param_val_10\":null}', '{\"payments\":{\"custom_pay_1\":\"Electronic Bank Transfers (EFT Payments)\",\"custom_pay_2\":\"e-Transfer\",\"custom_pay_3\":null,\"custom_pay_4\":null,\"custom_pay_5\":null,\"custom_pay_6\":null,\"custom_pay_7\":null},\"contact\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"custom_field_5\":null,\"custom_field_6\":null,\"custom_field_7\":null,\"custom_field_8\":null,\"custom_field_9\":null,\"custom_field_10\":null},\"product\":{\"custom_field_1\":\"Serial Number\",\"custom_field_2\":\"Batch Number\",\"custom_field_3\":\"Product Grade\",\"custom_field_4\":\"Part Number\\/Model\"},\"location\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"user\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"purchase\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"purchase_shipping\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"custom_field_5\":null},\"sell\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"shipping\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"custom_field_5\":null},\"types_of_service\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"custom_field_5\":null,\"custom_field_6\":null}}', '{\"is_enabled_export\":\"1\",\"enable_product_warranty\":\"1\",\"default_credit_limit\":null,\"enable_purchase_order\":\"1\",\"default_datatable_page_entries\":\"50\"}', 1, '2021-09-08 08:52:16', '2022-07-11 15:34:32'),
(2, 'A1HARDWARE STORE', 108, '2021-12-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25.00, 5, 'Africa/Harare', 1, 'fifo', NULL, 'includes', NULL, NULL, 0, 'add_expiry', 'keep_selling', 0, 1, 0, NULL, 1.000, 30, 30, '{\"pos\":{\"express_checkout\":\"shift+e\",\"pay_n_ckeckout\":\"shift+p\",\"draft\":\"shift+d\",\"cancel\":\"shift+c\",\"edit_discount\":\"shift+i\",\"edit_order_tax\":\"shift+t\",\"add_payment_row\":\"shift+r\",\"finalize_payment\":\"shift+f\",\"recent_product_quantity\":\"f2\",\"add_new_product\":\"f4\"}}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, 1, 1, 1, 1, 0, NULL, 0, 0, 0, 0, 1, NULL, 1, 0, 'before', '[\"purchases\",\"add_sale\",\"pos_sale\",\"stock_transfers\",\"stock_adjustment\",\"expenses\"]', 'm/d/Y', '24', '{\"purchase\":\"PO\",\"stock_transfer\":\"ST\",\"stock_adjustment\":\"SA\",\"sell_return\":\"CN\",\"expense\":\"EP\",\"contacts\":\"CO\",\"purchase_payment\":\"PP\",\"sell_payment\":\"SP\",\"business_location\":\"BL\"}', NULL, NULL, NULL, 0, NULL, 1.0000, 1.0000, NULL, 1.0000, 1.0000, NULL, NULL, NULL, 'year', NULL, NULL, NULL, NULL, 1, '2021-12-04 00:58:45', '2021-12-04 00:58:45'),
(3, 'Grandsoft (PTY )LTD', 16, '2022-01-31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25.00, 12, 'UTC', 1, 'fifo', NULL, 'includes', NULL, NULL, 0, 'add_expiry', 'keep_selling', 0, 1, 0, NULL, 1.000, 30, 30, '{\"pos\":{\"express_checkout\":\"shift+e\",\"pay_n_ckeckout\":\"shift+p\",\"draft\":\"shift+d\",\"cancel\":\"shift+c\",\"edit_discount\":\"shift+i\",\"edit_order_tax\":\"shift+t\",\"add_payment_row\":\"shift+r\",\"finalize_payment\":\"shift+f\",\"recent_product_quantity\":\"f2\",\"add_new_product\":\"f4\"}}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, 1, 1, 1, 1, 0, NULL, 0, 0, 0, 0, 1, NULL, 1, 0, 'before', '[\"purchases\",\"add_sale\",\"pos_sale\",\"stock_transfers\",\"stock_adjustment\",\"expenses\"]', 'm/d/Y', '24', '{\"purchase\":\"PO\",\"stock_transfer\":\"ST\",\"stock_adjustment\":\"SA\",\"sell_return\":\"CN\",\"expense\":\"EP\",\"contacts\":\"CO\",\"purchase_payment\":\"PP\",\"sell_payment\":\"SP\",\"business_location\":\"BL\"}', NULL, NULL, NULL, 0, NULL, 1.0000, 1.0000, NULL, 1.0000, 1.0000, NULL, NULL, NULL, 'year', NULL, NULL, NULL, NULL, 1, '2022-02-01 06:06:44', '2022-02-01 06:06:44');

-- --------------------------------------------------------

--
-- Table structure for table `business_locations`
--

CREATE TABLE `business_locations` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `landmark` text COLLATE utf8mb4_unicode_ci,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip_code` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_scheme_id` int(10) UNSIGNED NOT NULL,
  `invoice_layout_id` int(10) UNSIGNED NOT NULL,
  `sale_invoice_layout_id` int(11) DEFAULT NULL,
  `selling_price_group_id` int(11) DEFAULT NULL,
  `print_receipt_on_invoice` tinyint(1) DEFAULT '1',
  `receipt_printer_type` enum('browser','printer') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'browser',
  `printer_id` int(11) DEFAULT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternate_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `featured_products` text COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `default_payment_accounts` text COLLATE utf8mb4_unicode_ci,
  `custom_field1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business_locations`
--

INSERT INTO `business_locations` (`id`, `business_id`, `location_id`, `name`, `landmark`, `country`, `state`, `city`, `zip_code`, `invoice_scheme_id`, `invoice_layout_id`, `sale_invoice_layout_id`, `selling_price_group_id`, `print_receipt_on_invoice`, `receipt_printer_type`, `printer_id`, `mobile`, `alternate_number`, `email`, `website`, `featured_products`, `is_active`, `default_payment_accounts`, `custom_field1`, `custom_field2`, `custom_field3`, `custom_field4`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'BL0001', 'Green Maxx', NULL, '', '', '140 - 11100 Bridgeport Road Richmond, British Columbia Canada', 'V6X 1T2', 1, 1, 1, NULL, 1, 'browser', NULL, '+1-800-945-9936', '+1-800-945-9936', NULL, 'https://greenmaxx.ca/', NULL, 1, '{\"cash\":{\"is_enabled\":\"1\"},\"card\":{\"is_enabled\":\"1\"},\"cheque\":{\"is_enabled\":\"1\"},\"bank_transfer\":{\"is_enabled\":\"1\"},\"other\":{\"is_enabled\":\"1\"},\"custom_pay_1\":{\"is_enabled\":\"1\"},\"custom_pay_2\":{\"is_enabled\":\"1\"},\"custom_pay_3\":{\"is_enabled\":\"1\"},\"custom_pay_4\":{\"is_enabled\":\"1\"},\"custom_pay_5\":{\"is_enabled\":\"1\"},\"custom_pay_6\":{\"is_enabled\":\"1\"},\"custom_pay_7\":{\"is_enabled\":\"1\"}}', NULL, NULL, NULL, NULL, NULL, '2021-09-08 08:52:16', '2022-04-03 05:18:57');

-- --------------------------------------------------------

--
-- Table structure for table `cash_registers`
--

CREATE TABLE `cash_registers` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(11) DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `status` enum('close','open') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `closed_at` datetime DEFAULT NULL,
  `closing_amount` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `total_card_slips` int(11) NOT NULL DEFAULT '0',
  `total_cheques` int(11) NOT NULL DEFAULT '0',
  `denominations` text COLLATE utf8mb4_unicode_ci,
  `closing_note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cash_registers`
--

INSERT INTO `cash_registers` (`id`, `business_id`, `location_id`, `user_id`, `status`, `closed_at`, `closing_amount`, `total_card_slips`, `total_cheques`, `denominations`, `closing_note`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 'open', NULL, 0.0000, 0, 0, NULL, NULL, '2021-09-08 09:24:00', '2021-09-08 09:24:46'),
(2, 1, 1, 2, 'open', NULL, 0.0000, 0, 0, NULL, NULL, '2021-09-15 19:45:00', '2021-09-15 19:45:34'),
(3, 2, 4, 5, 'open', NULL, 0.0000, 0, 0, NULL, NULL, '2021-12-04 02:25:00', '2021-12-04 02:25:37'),
(4, 3, 5, 12, 'open', NULL, 0.0000, 0, 0, NULL, NULL, '2022-02-01 01:24:00', '2022-02-01 01:24:07');

-- --------------------------------------------------------

--
-- Table structure for table `cash_register_transactions`
--

CREATE TABLE `cash_register_transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `cash_register_id` int(10) UNSIGNED NOT NULL,
  `amount` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `pay_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('debit','credit') COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_type` enum('initial','sell','transfer','refund') COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cash_register_transactions`
--

INSERT INTO `cash_register_transactions` (`id`, `cash_register_id`, `amount`, `pay_method`, `type`, `transaction_type`, `transaction_id`, `created_at`, `updated_at`) VALUES
(1, 1, 3000.0000, 'cash', 'credit', 'sell', 67, '2021-12-11 19:14:42', '2021-12-11 19:14:42'),
(2, 1, 2000.0000, 'bank_transfer', 'credit', 'sell', 67, '2021-12-11 19:14:42', '2021-12-11 19:14:42'),
(3, 1, 0.0000, 'cash', 'credit', 'sell', 67, '2021-12-11 19:14:42', '2021-12-11 19:14:42'),
(4, 1, 2500.0000, 'cash', 'credit', 'sell', 69, '2021-12-11 19:25:02', '2021-12-11 19:25:02'),
(5, 1, 0.0000, 'cash', 'credit', 'sell', 69, '2021-12-11 19:25:02', '2021-12-11 19:25:02'),
(8, 1, 1000.0000, 'card', 'credit', 'sell', 75, '2021-12-15 04:41:58', '2021-12-15 04:41:58'),
(9, 1, 0.0000, 'cash', 'credit', 'sell', 75, '2021-12-15 04:41:58', '2021-12-15 04:41:58'),
(11, 1, 200.0000, 'custom_pay_1', 'credit', 'sell', 76, '2021-12-15 07:08:26', '2021-12-15 07:08:26'),
(12, 1, 500.0000, 'cash', 'credit', 'sell', 76, '2021-12-15 07:08:26', '2021-12-15 07:08:26'),
(13, 1, 300.0000, 'cash', 'credit', 'sell', 76, '2021-12-15 07:08:26', '2021-12-15 07:08:26'),
(14, 1, 0.0000, 'cash', 'credit', 'sell', 76, '2021-12-15 07:08:26', '2021-12-15 07:08:26'),
(15, 1, 0.0000, 'cash', 'credit', 'sell', 76, '2021-12-15 07:08:26', '2021-12-15 07:08:26'),
(16, 1, 155.0000, 'card', 'credit', 'sell', 78, '2021-12-17 15:38:53', '2021-12-17 15:38:53'),
(17, 1, 0.0000, 'cash', 'credit', 'sell', 78, '2021-12-17 15:38:53', '2021-12-17 15:38:53'),
(18, 1, 20.0000, 'card', 'credit', 'sell', 80, '2021-12-18 16:27:55', '2021-12-18 16:27:55'),
(19, 1, 7.5000, 'cash', 'credit', 'sell', 80, '2021-12-18 16:27:55', '2021-12-18 16:27:55'),
(20, 1, 0.0000, 'cash', 'credit', 'sell', 80, '2021-12-18 16:27:55', '2021-12-18 16:27:55'),
(23, 1, 2290.0000, 'cash', 'credit', 'sell', 83, '2021-12-19 13:32:37', '2021-12-19 13:32:37'),
(24, 1, 0.0000, 'cash', 'credit', 'sell', 83, '2021-12-19 13:32:37', '2021-12-19 13:32:37'),
(27, 1, 831.2500, 'cash', 'credit', 'sell', 87, '2021-12-24 02:27:01', '2021-12-24 02:27:01'),
(28, 1, 0.0000, 'cash', 'credit', 'sell', 87, '2021-12-24 02:27:01', '2021-12-24 02:27:01'),
(29, 1, 331.2500, 'cash', 'credit', 'sell', 88, '2021-12-24 09:32:40', '2021-12-24 09:32:40'),
(30, 1, 500.0000, 'card', 'credit', 'sell', 88, '2021-12-24 09:32:40', '2021-12-24 09:32:40'),
(31, 1, 0.0000, 'cash', 'credit', 'sell', 88, '2021-12-24 09:32:40', '2021-12-24 09:32:40'),
(44, 1, 2024.0000, 'cash', 'credit', 'sell', 98, '2021-12-31 03:57:11', '2021-12-31 03:57:11'),
(45, 1, 0.0000, 'cash', 'credit', 'sell', 98, '2021-12-31 03:57:11', '2021-12-31 03:57:11'),
(82, 4, 2000.0000, 'cash', 'credit', 'initial', NULL, '2022-02-01 01:24:07', '2022-02-01 01:24:07');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `short_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `woocommerce_cat_id` int(11) DEFAULT NULL,
  `category_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `business_id`, `short_code`, `parent_id`, `created_by`, `woocommerce_cat_id`, `category_type`, `description`, `slug`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'General', 1, '1', 0, 1, NULL, 'product', NULL, NULL, '2021-09-21 01:28:06', '2021-09-08 09:18:50', '2021-09-21 01:28:06'),
(2, 'Soap', 1, '2', 0, 1, NULL, 'product', NULL, NULL, '2021-09-21 01:28:11', '2021-09-08 09:21:50', '2021-09-21 01:28:11'),
(3, 'Smartphone Reparatie', 1, '001', 0, 1, NULL, 'product', 'Reparatie van smartphones', NULL, '2021-12-05 09:51:21', '2021-09-21 01:27:58', '2021-12-05 09:51:21'),
(4, 'Tablet Reparatie', 1, '002', 0, 1, NULL, 'product', NULL, NULL, '2021-12-05 09:51:23', '2021-09-21 01:28:26', '2021-12-05 09:51:23'),
(5, 'MacBook Pro', 1, NULL, 0, 1, NULL, 'product', NULL, NULL, '2021-12-25 21:04:54', '2021-12-05 05:34:11', '2021-12-25 21:04:54'),
(6, 'MacBook Air', 1, NULL, 0, 1, NULL, 'product', NULL, NULL, '2021-12-25 21:04:48', '2021-12-05 05:34:24', '2021-12-25 21:04:48'),
(7, 'MacBook Core M', 1, NULL, 0, 1, NULL, 'product', NULL, NULL, '2021-12-25 21:04:51', '2021-12-05 05:34:53', '2021-12-25 21:04:51'),
(8, '5005', 1, NULL, 0, 1, NULL, 'product', 'Food Supply', NULL, '2022-04-03 05:35:57', '2021-12-25 21:03:34', '2022-04-03 05:35:57'),
(9, 'CCTV', 1, NULL, 0, 1, NULL, 'product', 'HIK', NULL, '2022-04-03 05:36:04', '2022-01-10 17:14:04', '2022-04-03 05:36:04'),
(10, 'cables & Adapters', 1, 'c&a', 0, 1, NULL, 'product', 'CABLE AND ADAPTERS', NULL, '2022-04-03 05:36:02', '2022-01-14 20:02:32', '2022-04-03 05:36:02'),
(11, 'CHARGING CABLE', 1, 'CC', 10, 1, NULL, 'product', 'CHARGING CABLE', NULL, '2022-04-03 05:36:21', '2022-01-14 20:03:10', '2022-04-03 05:36:21'),
(12, 'Display cable', 1, 'dc', 10, 1, NULL, 'product', 'Display cable', NULL, '2022-04-03 05:36:17', '2022-01-14 20:04:24', '2022-04-03 05:36:17'),
(13, 'modelo', 1, NULL, 0, 1, NULL, 'product', NULL, NULL, '2022-04-03 05:36:15', '2022-01-21 06:51:05', '2022-04-03 05:36:15'),
(14, 'Sheet Music', 1, 'SM', 0, 1, NULL, 'product', NULL, NULL, '2022-04-03 05:36:13', '2022-01-27 18:26:16', '2022-04-03 05:36:13'),
(15, 'Clarinet', 1, 'CL', 14, 1, NULL, 'product', NULL, NULL, '2022-04-03 05:36:06', '2022-01-27 18:26:41', '2022-04-03 05:36:06'),
(16, 'Tops', 1, 'P', 0, 1, NULL, 'product', NULL, NULL, '2022-04-03 05:36:09', '2022-02-02 18:08:55', '2022-04-03 05:36:09'),
(17, 'Shampoo', 1, NULL, 0, 1, NULL, 'product', NULL, NULL, '2022-04-03 05:36:08', '2022-02-09 22:52:46', '2022-04-03 05:36:08'),
(18, 'reparación', 1, 'st', 8, 1, NULL, 'product', 'servicio técnico', NULL, '2022-04-03 05:36:11', '2022-02-27 11:59:05', '2022-04-03 05:36:11'),
(19, 'celulares', 1, NULL, 0, 1, NULL, 'device', NULL, NULL, NULL, '2022-02-28 10:04:57', '2022-02-28 10:04:57'),
(20, 'Tablets', 1, NULL, 0, 1, NULL, 'device', NULL, NULL, NULL, '2022-02-28 10:05:10', '2022-02-28 10:05:10'),
(21, 'laptops', 1, NULL, 0, 1, NULL, 'device', NULL, NULL, NULL, '2022-02-28 10:05:24', '2022-02-28 10:05:24'),
(22, 'técnico', 1, 'servicio de reparaciones', 0, 1, NULL, 'hrm_department', NULL, NULL, NULL, '2022-02-28 10:33:23', '2022-02-28 10:33:23'),
(23, 'ventas', 1, 'puntos de ventas', 0, 1, NULL, 'hrm_department', NULL, NULL, NULL, '2022-02-28 10:34:23', '2022-02-28 10:34:23'),
(24, 'jefe de área', 1, NULL, 0, 1, NULL, 'hrm_designation', NULL, NULL, NULL, '2022-02-28 10:35:10', '2022-02-28 10:35:10'),
(25, 'operador de área', 1, NULL, 0, 1, NULL, 'hrm_designation', NULL, NULL, NULL, '2022-02-28 10:35:35', '2022-02-28 10:35:35'),
(26, 'ejecutivo de área', 1, NULL, 0, 1, NULL, 'hrm_designation', NULL, NULL, NULL, '2022-02-28 10:35:58', '2022-02-28 10:35:58');

-- --------------------------------------------------------

--
-- Table structure for table `categorizables`
--

CREATE TABLE `categorizables` (
  `category_id` int(11) NOT NULL,
  `categorizable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categorizable_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `supplier_business_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `middle_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `tax_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_line_1` text COLLATE utf8mb4_unicode_ci,
  `address_line_2` text COLLATE utf8mb4_unicode_ci,
  `zip_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `landline` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternate_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pay_term_number` int(11) DEFAULT NULL,
  `pay_term_type` enum('days','months') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `credit_limit` decimal(22,4) DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `balance` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `total_rp` int(11) NOT NULL DEFAULT '0' COMMENT 'rp is the short form of reward points',
  `total_rp_used` int(11) NOT NULL DEFAULT '0' COMMENT 'rp is the short form of reward points',
  `total_rp_expired` int(11) NOT NULL DEFAULT '0' COMMENT 'rp is the short form of reward points',
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `shipping_address` text COLLATE utf8mb4_unicode_ci,
  `shipping_custom_field_details` longtext COLLATE utf8mb4_unicode_ci,
  `is_export` tinyint(1) NOT NULL DEFAULT '0',
  `export_custom_field_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `export_custom_field_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `export_custom_field_3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `export_custom_field_4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `export_custom_field_5` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `export_custom_field_6` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_group_id` int(11) DEFAULT NULL,
  `custom_field1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field5` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field6` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field7` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field8` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field9` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field10` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `business_id`, `type`, `supplier_business_name`, `name`, `prefix`, `first_name`, `middle_name`, `last_name`, `email`, `contact_id`, `contact_status`, `tax_number`, `city`, `state`, `country`, `address_line_1`, `address_line_2`, `zip_code`, `dob`, `mobile`, `landline`, `alternate_number`, `pay_term_number`, `pay_term_type`, `credit_limit`, `created_by`, `balance`, `total_rp`, `total_rp_used`, `total_rp_expired`, `is_default`, `shipping_address`, `shipping_custom_field_details`, `is_export`, `export_custom_field_1`, `export_custom_field_2`, `export_custom_field_3`, `export_custom_field_4`, `export_custom_field_5`, `export_custom_field_6`, `position`, `customer_group_id`, `custom_field1`, `custom_field2`, `custom_field3`, `custom_field4`, `custom_field5`, `custom_field6`, `custom_field7`, `custom_field8`, `custom_field9`, `custom_field10`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'customer', NULL, 'Walk In Customer', NULL, 'Walk In Customer', NULL, NULL, NULL, 'CO0001', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '000', NULL, NULL, NULL, NULL, 0.0000, 1, 0.0000, 0, 0, 0, 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-09-08 08:52:16', '2021-12-05 05:04:50'),
(2, 1, 'supplier', NULL, 'Test', NULL, 'Test', NULL, NULL, NULL, 'ABC', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0313-7399975', NULL, NULL, NULL, NULL, NULL, 1, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-05 05:03:51', '2021-09-08 09:25:24', '2021-12-05 05:03:51'),
(3, 1, 'customer', NULL, 'Dhr Thierry Mooring', 'Dhr', 'Thierry', NULL, 'Mooring', 'thierry@re-factory.nl', 'CO0003', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '06-00000000', NULL, NULL, NULL, NULL, NULL, 1, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-05 05:04:27', '2021-09-21 01:15:51', '2021-12-05 05:04:27'),
(4, 1, 'supplier', NULL, '', NULL, NULL, NULL, NULL, NULL, 'CO0004', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '43243432324', NULL, NULL, NULL, NULL, NULL, 1, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-05 05:03:47', '2021-10-08 02:09:14', '2021-12-05 05:03:47'),
(5, 1, 'supplier', 'Jdjdn ndjd', '', NULL, NULL, NULL, NULL, 'bxjdk@dnfhs.com', 'Sbch', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '989898900000', NULL, '8635191037', NULL, NULL, NULL, 1, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-05 05:03:40', '2021-10-25 14:27:09', '2021-12-05 05:03:40'),
(6, 1, 'customer', NULL, 'Mr Kashan Hussain', 'Mr', 'Kashan', NULL, 'Hussain', 'kashan@mobogeniemax.com', 'CO0006', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '971525583825', NULL, NULL, NULL, NULL, NULL, 1, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-05 05:04:23', '2021-11-23 19:23:32', '2021-12-05 05:04:23'),
(7, 1, 'customer', NULL, 'Mr Kashan Hussain', 'Mr', 'Kashan', NULL, 'Hussain', 'kashan@ymail.com', 'CO0007', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '+971525583825', NULL, NULL, NULL, NULL, NULL, 1, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-05 05:04:20', '2021-11-24 06:04:12', '2021-12-05 05:04:20'),
(8, 1, 'supplier', NULL, 'Mr Kashan Hussain', 'Mr', 'Kashan', NULL, 'Hussain', 'kashan@mobogeniemax.com', 'CO0008', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '+923122375902', NULL, NULL, NULL, NULL, NULL, 1, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-05 05:03:43', '2021-11-25 23:23:56', '2021-12-05 05:03:43'),
(9, 2, 'customer', NULL, 'Walk-In Customer', NULL, NULL, NULL, NULL, NULL, 'CO0001', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 0.0000, 5, 0.0000, 0, 0, 0, 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-04 00:58:45', '2021-12-04 00:58:45'),
(10, 1, 'customer', 'EBay', '', NULL, NULL, NULL, NULL, NULL, 'CO0009', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '12345', NULL, NULL, NULL, NULL, NULL, 1, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-05 05:39:08', '2021-12-05 05:39:08'),
(11, 1, 'customer', 'Amazon', '', NULL, NULL, NULL, NULL, NULL, 'CO0010', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '123', NULL, NULL, NULL, NULL, NULL, 1, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-05 05:39:43', '2021-12-05 05:39:43'),
(12, 1, 'customer', 'Onbuy', '', NULL, NULL, NULL, NULL, NULL, 'CO0011', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1234', NULL, NULL, NULL, NULL, NULL, 1, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-05 05:40:07', '2021-12-05 05:40:07'),
(13, 1, 'customer', 'BKM', '', NULL, NULL, NULL, NULL, NULL, 'CO0012', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '333', NULL, NULL, NULL, NULL, NULL, 1, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-05 05:40:35', '2021-12-05 05:40:35'),
(14, 1, 'customer', NULL, 'BEN BEN', 'BEN', 'BEN', NULL, NULL, NULL, 'CO0013', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '11', NULL, NULL, NULL, NULL, NULL, 1, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-05 05:41:31', '2021-12-05 05:41:31'),
(15, 1, 'supplier', 'HX', '', NULL, NULL, NULL, NULL, NULL, 'CO0014', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '234', NULL, NULL, NULL, NULL, NULL, 1, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-05 06:00:30', '2021-12-05 06:00:30'),
(16, 1, 'supplier', 'CMR', '', NULL, NULL, NULL, NULL, NULL, 'CO0015', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '444', NULL, NULL, NULL, NULL, NULL, 1, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-05 06:00:52', '2021-12-05 06:00:52'),
(17, 1, 'supplier', 'CWI', '', NULL, NULL, NULL, NULL, NULL, 'CO0016', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '99', NULL, NULL, NULL, NULL, NULL, 1, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-05 06:01:04', '2021-12-05 06:01:43'),
(18, 1, 'supplier', 'CHB', '', NULL, NULL, NULL, NULL, NULL, 'CO0017', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '54', NULL, NULL, NULL, NULL, NULL, 1, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-05 06:02:12', '2021-12-05 06:02:12'),
(19, 1, 'supplier', 'PL', '', NULL, NULL, NULL, NULL, NULL, 'CO0018', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '89', NULL, NULL, NULL, NULL, NULL, 1, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-05 06:03:16', '2021-12-05 06:03:16'),
(20, 1, 'supplier', 'AUS', '', NULL, NULL, NULL, NULL, NULL, 'CO0019', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '88', NULL, NULL, NULL, NULL, NULL, 1, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-05 06:03:39', '2021-12-05 06:03:39'),
(21, 1, 'supplier', 'DA', '', NULL, NULL, NULL, NULL, NULL, 'CO0020', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '09', NULL, NULL, NULL, NULL, NULL, 1, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-05 06:03:58', '2021-12-05 06:03:58'),
(22, 1, 'customer', NULL, 'Mr Sam M', 'Mr', 'Sam', NULL, 'M', NULL, 'Sam', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0118526210', NULL, NULL, NULL, NULL, NULL, 1, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-11 16:53:45', '2021-12-11 16:53:45'),
(23, 1, 'customer', 'Sharaf DG', '', NULL, NULL, NULL, NULL, NULL, 'CO0022', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0589868408', NULL, NULL, NULL, NULL, NULL, 1, 0.0000, 0, 0, 0, 0, 'Al Ain Mall', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-18 17:16:27', '2021-12-18 17:16:27'),
(24, 1, 'supplier', 'Comms Equipment Pte Ltd', '', NULL, NULL, NULL, NULL, NULL, 'CEPL', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '611111111', NULL, NULL, NULL, 'days', NULL, 1, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-29 15:53:03', '2021-12-29 15:53:03'),
(25, 1, 'customer', NULL, '', NULL, NULL, NULL, NULL, '5345345@gmail.com', '45455', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '53535345', '53535', '34534535', NULL, NULL, NULL, 1, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-29 18:01:14', '2021-12-29 18:01:14'),
(26, 1, 'supplier', 'n1p', '', NULL, NULL, NULL, NULL, NULL, 'CO0025', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '000', NULL, NULL, NULL, NULL, NULL, 1, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-03 04:45:09', '2022-01-03 04:45:09'),
(27, 1, 'supplier', 'phs', '', NULL, NULL, NULL, NULL, NULL, 'CO0026', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '444', NULL, NULL, NULL, NULL, NULL, 1, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-03 04:46:23', '2022-01-03 04:46:23'),
(29, 1, 'customer', NULL, 'mr waqas', 'mr', 'waqas', NULL, NULL, NULL, 'CO0027', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '9540608104', NULL, NULL, NULL, NULL, NULL, 1, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-07 09:32:00', '2022-01-07 09:32:00'),
(30, 1, 'supplier', NULL, '', NULL, NULL, NULL, NULL, NULL, 'CO0028', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '01111', NULL, NULL, NULL, NULL, NULL, 1, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-15 02:45:08', '2022-01-15 02:45:08'),
(31, 1, 'customer', 'Leela Lunches', '', NULL, NULL, NULL, NULL, NULL, 'CO0029', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '+923215351217', NULL, NULL, NULL, NULL, NULL, 1, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-18 13:27:05', '2022-01-18 13:27:05'),
(32, 1, 'customer', NULL, '', NULL, NULL, NULL, NULL, 'johao1000@hotmail.com', '097625278286', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '+593987119104', '042562725', '0987166252', NULL, NULL, NULL, 1, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-21 04:39:37', '2022-01-21 04:39:37'),
(33, 1, 'customer', NULL, 'Mr Sofia xz', 'Mr', 'Sofia', NULL, 'xz', NULL, 'CO0031', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '+20233904524', NULL, NULL, NULL, NULL, NULL, 1, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-22 01:57:11', '2022-01-22 01:57:11'),
(34, 3, 'customer', NULL, 'Walk-In Customer', NULL, NULL, NULL, NULL, NULL, 'CO0001', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 0.0000, 12, 0.0000, 0, 0, 0, 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-01 06:06:44', '2022-02-01 06:06:44'),
(35, 1, 'customer', NULL, 'Mr. Peter Sang Tugul', 'Mr.', 'Peter', 'Sang', 'Tugul', NULL, '3456786543', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3456', NULL, NULL, NULL, NULL, NULL, 1, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Custom Field 1', 'CF 2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-02 03:12:37', '2022-02-02 03:12:37'),
(36, 1, 'customer', 'vishal', '', NULL, NULL, NULL, NULL, NULL, 'CO0033', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '7874165752', NULL, NULL, NULL, NULL, NULL, 1, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-04 16:49:46', '2022-02-04 16:49:46'),
(37, 1, 'customer', 'CREATIVE TRUNK', '', NULL, NULL, NULL, NULL, 'CREATIVETRUNK@GMAIL.COM', 'VISHAL BHAI', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '7874165752', NULL, NULL, 10, 'days', 2000.0000, 1, 300.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-04 17:54:24', '2022-02-04 18:07:18'),
(38, 1, 'supplier', 'Gemy', '', NULL, NULL, NULL, NULL, NULL, 'CO0035', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, 1, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-09 22:52:00', '2022-02-09 22:52:00'),
(39, 1, 'supplier', 'Gemy', '', NULL, NULL, NULL, NULL, NULL, 'CO0036', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, 1, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-09 22:58:16', '2022-02-09 22:58:16'),
(40, 1, 'customer', NULL, 'senor Milton Conza Bravo', 'senor', 'Milton', 'Conza', 'Bravo', 'johao1000@hotmail.com', '096278266262', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-28', '+593987119104', NULL, NULL, NULL, NULL, NULL, 1, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-28 09:49:36', '2022-02-28 09:49:36'),
(41, 1, 'customer', 'inport', '', NULL, NULL, NULL, NULL, 'joh0@hotmail.com', '0976252782', 'active', NULL, 'Guayaquil', NULL, 'Ecuador', 'Francisco P Icaza 407 y Córdoba Condominio El Alfil piso 3 oficina 3', 'Francisco P Icaza 407 y Córdoba Condominio El Alfil piso 3 oficina 3', '090313', NULL, '042329253', NULL, NULL, NULL, NULL, NULL, 1, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-28 11:00:05', '2022-02-28 11:00:05'),
(42, 1, 'customer', NULL, 'senor jose Conza zambrano', 'senor', 'jose', 'Conza', 'zambrano', 'joha@hotmail.com', 'CO0039', 'active', NULL, 'Guayaquil', 'Guayas', 'Ecuador', 'sucre y rumichaca', 'sucre y rumichaca', '201578', '1980-02-29', '042329253', NULL, NULL, NULL, NULL, NULL, 1, 0.0000, 0, 0, 0, 0, 'sucre y rumichaca', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-28 11:06:37', '2022-02-28 11:06:37'),
(43, 1, 'customer', NULL, 'senor agustin Conza salamea', 'senor', 'agustin', 'Conza', 'salamea', 'joh0@hotmail.com', '09762527', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1988-02-09', '+593987119180', NULL, NULL, NULL, NULL, NULL, 1, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-28 11:14:56', '2022-02-28 11:14:56'),
(44, 1, 'customer', NULL, 'Milton Conza Bravo', NULL, 'Milton', 'Conza', 'Bravo', 'johao1000@hotmail.com', '0918733374884', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1980-12-09', '+59398714', NULL, NULL, NULL, NULL, NULL, 1, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-02 23:36:50', '2022-03-02 23:36:50'),
(45, 1, 'customer', NULL, 'sami sami sami', NULL, 'sami', 'sami', 'sami', NULL, '1', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0657501232', NULL, NULL, NULL, NULL, NULL, 1, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-03 02:44:50', '2022-03-03 02:44:50'),
(46, 1, 'customer', NULL, '', NULL, NULL, NULL, NULL, NULL, 'gj', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2548556895', NULL, NULL, NULL, NULL, NULL, 1, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-07 06:03:57', '2022-03-07 06:03:57'),
(47, 1, 'supplier', NULL, 'Danial', NULL, 'Danial', NULL, NULL, NULL, 'CO0044', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000000000', NULL, NULL, NULL, NULL, NULL, 1, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-15 18:00:47', '2022-03-15 18:00:47'),
(48, 1, 'customer', NULL, 'Jose', NULL, 'Jose', NULL, NULL, 'prueba@prueba.com', 'CO0045', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-15', '5555555555', NULL, NULL, NULL, NULL, NULL, 1, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-16 00:07:54', '2022-03-16 00:07:54');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int(10) UNSIGNED NOT NULL,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thousand_separator` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `decimal_separator` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `country`, `currency`, `code`, `symbol`, `thousand_separator`, `decimal_separator`, `created_at`, `updated_at`) VALUES
(1, 'Albania', 'Leke', 'ALL', 'Lek', ',', '.', NULL, NULL),
(2, 'America', 'Dollars', 'USD', '$', ',', '.', NULL, NULL),
(3, 'Afghanistan', 'Afghanis', 'AF', '؋', ',', '.', NULL, NULL),
(4, 'Argentina', 'Pesos', 'ARS', '$', ',', '.', NULL, NULL),
(5, 'Aruba', 'Guilders', 'AWG', 'ƒ', ',', '.', NULL, NULL),
(6, 'Australia', 'Dollars', 'AUD', '$', ',', '.', NULL, NULL),
(7, 'Azerbaijan', 'New Manats', 'AZ', 'ман', ',', '.', NULL, NULL),
(8, 'Bahamas', 'Dollars', 'BSD', '$', ',', '.', NULL, NULL),
(9, 'Barbados', 'Dollars', 'BBD', '$', ',', '.', NULL, NULL),
(10, 'Belarus', 'Rubles', 'BYR', 'p.', ',', '.', NULL, NULL),
(11, 'Belgium', 'Euro', 'EUR', '€', ',', '.', NULL, NULL),
(12, 'Beliz', 'Dollars', 'BZD', 'BZ$', ',', '.', NULL, NULL),
(13, 'Bermuda', 'Dollars', 'BMD', '$', ',', '.', NULL, NULL),
(14, 'Bolivia', 'Bolivianos', 'BOB', '$b', ',', '.', NULL, NULL),
(15, 'Bosnia and Herzegovina', 'Convertible Marka', 'BAM', 'KM', ',', '.', NULL, NULL),
(16, 'Botswana', 'Pula\'s', 'BWP', 'P', ',', '.', NULL, NULL),
(17, 'Bulgaria', 'Leva', 'BG', 'лв', ',', '.', NULL, NULL),
(18, 'Brazil', 'Reais', 'BRL', 'R$', ',', '.', NULL, NULL),
(19, 'Britain [United Kingdom]', 'Pounds', 'GBP', '£', ',', '.', NULL, NULL),
(20, 'Brunei Darussalam', 'Dollars', 'BND', '$', ',', '.', NULL, NULL),
(21, 'Cambodia', 'Riels', 'KHR', '៛', ',', '.', NULL, NULL),
(22, 'Canada', 'Dollars', 'CAD', '$', ',', '.', NULL, NULL),
(23, 'Cayman Islands', 'Dollars', 'KYD', '$', ',', '.', NULL, NULL),
(24, 'Chile', 'Pesos', 'CLP', '$', ',', '.', NULL, NULL),
(25, 'China', 'Yuan Renminbi', 'CNY', '¥', ',', '.', NULL, NULL),
(26, 'Colombia', 'Pesos', 'COP', '$', ',', '.', NULL, NULL),
(27, 'Costa Rica', 'Colón', 'CRC', '₡', ',', '.', NULL, NULL),
(28, 'Croatia', 'Kuna', 'HRK', 'kn', ',', '.', NULL, NULL),
(29, 'Cuba', 'Pesos', 'CUP', '₱', ',', '.', NULL, NULL),
(30, 'Cyprus', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(31, 'Czech Republic', 'Koruny', 'CZK', 'Kč', ',', '.', NULL, NULL),
(32, 'Denmark', 'Kroner', 'DKK', 'kr', ',', '.', NULL, NULL),
(33, 'Dominican Republic', 'Pesos', 'DOP ', 'RD$', ',', '.', NULL, NULL),
(34, 'East Caribbean', 'Dollars', 'XCD', '$', ',', '.', NULL, NULL),
(35, 'Egypt', 'Pounds', 'EGP', '£', ',', '.', NULL, NULL),
(36, 'El Salvador', 'Colones', 'SVC', '$', ',', '.', NULL, NULL),
(37, 'England [United Kingdom]', 'Pounds', 'GBP', '£', ',', '.', NULL, NULL),
(38, 'Euro', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(39, 'Falkland Islands', 'Pounds', 'FKP', '£', ',', '.', NULL, NULL),
(40, 'Fiji', 'Dollars', 'FJD', '$', ',', '.', NULL, NULL),
(41, 'France', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(42, 'Ghana', 'Cedis', 'GHS', '¢', ',', '.', NULL, NULL),
(43, 'Gibraltar', 'Pounds', 'GIP', '£', ',', '.', NULL, NULL),
(44, 'Greece', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(45, 'Guatemala', 'Quetzales', 'GTQ', 'Q', ',', '.', NULL, NULL),
(46, 'Guernsey', 'Pounds', 'GGP', '£', ',', '.', NULL, NULL),
(47, 'Guyana', 'Dollars', 'GYD', '$', ',', '.', NULL, NULL),
(48, 'Holland [Netherlands]', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(49, 'Honduras', 'Lempiras', 'HNL', 'L', ',', '.', NULL, NULL),
(50, 'Hong Kong', 'Dollars', 'HKD', '$', ',', '.', NULL, NULL),
(51, 'Hungary', 'Forint', 'HUF', 'Ft', ',', '.', NULL, NULL),
(52, 'Iceland', 'Kronur', 'ISK', 'kr', ',', '.', NULL, NULL),
(53, 'India', 'Rupees', 'INR', '₹', ',', '.', NULL, NULL),
(54, 'Indonesia', 'Rupiahs', 'IDR', 'Rp', ',', '.', NULL, NULL),
(55, 'Iran', 'Rials', 'IRR', '﷼', ',', '.', NULL, NULL),
(56, 'Ireland', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(57, 'Isle of Man', 'Pounds', 'IMP', '£', ',', '.', NULL, NULL),
(58, 'Israel', 'New Shekels', 'ILS', '₪', ',', '.', NULL, NULL),
(59, 'Italy', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(60, 'Jamaica', 'Dollars', 'JMD', 'J$', ',', '.', NULL, NULL),
(61, 'Japan', 'Yen', 'JPY', '¥', ',', '.', NULL, NULL),
(62, 'Jersey', 'Pounds', 'JEP', '£', ',', '.', NULL, NULL),
(63, 'Kazakhstan', 'Tenge', 'KZT', 'лв', ',', '.', NULL, NULL),
(64, 'Korea [North]', 'Won', 'KPW', '₩', ',', '.', NULL, NULL),
(65, 'Korea [South]', 'Won', 'KRW', '₩', ',', '.', NULL, NULL),
(66, 'Kyrgyzstan', 'Soms', 'KGS', 'лв', ',', '.', NULL, NULL),
(67, 'Laos', 'Kips', 'LAK', '₭', ',', '.', NULL, NULL),
(68, 'Latvia', 'Lati', 'LVL', 'Ls', ',', '.', NULL, NULL),
(69, 'Lebanon', 'Pounds', 'LBP', '£', ',', '.', NULL, NULL),
(70, 'Liberia', 'Dollars', 'LRD', '$', ',', '.', NULL, NULL),
(71, 'Liechtenstein', 'Switzerland Francs', 'CHF', 'CHF', ',', '.', NULL, NULL),
(72, 'Lithuania', 'Litai', 'LTL', 'Lt', ',', '.', NULL, NULL),
(73, 'Luxembourg', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(74, 'Macedonia', 'Denars', 'MKD', 'ден', ',', '.', NULL, NULL),
(75, 'Malaysia', 'Ringgits', 'MYR', 'RM', ',', '.', NULL, NULL),
(76, 'Malta', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(77, 'Mauritius', 'Rupees', 'MUR', '₨', ',', '.', NULL, NULL),
(78, 'Mexico', 'Pesos', 'MXN', '$', ',', '.', NULL, NULL),
(79, 'Mongolia', 'Tugriks', 'MNT', '₮', ',', '.', NULL, NULL),
(80, 'Mozambique', 'Meticais', 'MZ', 'MT', ',', '.', NULL, NULL),
(81, 'Namibia', 'Dollars', 'NAD', '$', ',', '.', NULL, NULL),
(82, 'Nepal', 'Rupees', 'NPR', '₨', ',', '.', NULL, NULL),
(83, 'Netherlands Antilles', 'Guilders', 'ANG', 'ƒ', ',', '.', NULL, NULL),
(84, 'Netherlands', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(85, 'New Zealand', 'Dollars', 'NZD', '$', ',', '.', NULL, NULL),
(86, 'Nicaragua', 'Cordobas', 'NIO', 'C$', ',', '.', NULL, NULL),
(87, 'Nigeria', 'Nairas', 'NGN', '₦', ',', '.', NULL, NULL),
(88, 'North Korea', 'Won', 'KPW', '₩', ',', '.', NULL, NULL),
(89, 'Norway', 'Krone', 'NOK', 'kr', ',', '.', NULL, NULL),
(90, 'Oman', 'Rials', 'OMR', '﷼', ',', '.', NULL, NULL),
(91, 'Pakistan', 'Rupees', 'PKR', '₨', ',', '.', NULL, NULL),
(92, 'Panama', 'Balboa', 'PAB', 'B/.', ',', '.', NULL, NULL),
(93, 'Paraguay', 'Guarani', 'PYG', 'Gs', ',', '.', NULL, NULL),
(94, 'Peru', 'Nuevos Soles', 'PE', 'S/.', ',', '.', NULL, NULL),
(95, 'Philippines', 'Pesos', 'PHP', 'Php', ',', '.', NULL, NULL),
(96, 'Poland', 'Zlotych', 'PL', 'zł', ',', '.', NULL, NULL),
(97, 'Qatar', 'Rials', 'QAR', '﷼', ',', '.', NULL, NULL),
(98, 'Romania', 'New Lei', 'RO', 'lei', ',', '.', NULL, NULL),
(99, 'Russia', 'Rubles', 'RUB', 'руб', ',', '.', NULL, NULL),
(100, 'Saint Helena', 'Pounds', 'SHP', '£', ',', '.', NULL, NULL),
(101, 'Saudi Arabia', 'Riyals', 'SAR', '﷼', ',', '.', NULL, NULL),
(102, 'Serbia', 'Dinars', 'RSD', 'Дин.', ',', '.', NULL, NULL),
(103, 'Seychelles', 'Rupees', 'SCR', '₨', ',', '.', NULL, NULL),
(104, 'Singapore', 'Dollars', 'SGD', '$', ',', '.', NULL, NULL),
(105, 'Slovenia', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(106, 'Solomon Islands', 'Dollars', 'SBD', '$', ',', '.', NULL, NULL),
(107, 'Somalia', 'Shillings', 'SOS', 'S', ',', '.', NULL, NULL),
(108, 'South Africa', 'Rand', 'ZAR', 'R', ',', '.', NULL, NULL),
(109, 'South Korea', 'Won', 'KRW', '₩', ',', '.', NULL, NULL),
(110, 'Spain', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(111, 'Sri Lanka', 'Rupees', 'LKR', '₨', ',', '.', NULL, NULL),
(112, 'Sweden', 'Kronor', 'SEK', 'kr', ',', '.', NULL, NULL),
(113, 'Switzerland', 'Francs', 'CHF', 'CHF', ',', '.', NULL, NULL),
(114, 'Suriname', 'Dollars', 'SRD', '$', ',', '.', NULL, NULL),
(115, 'Syria', 'Pounds', 'SYP', '£', ',', '.', NULL, NULL),
(116, 'Taiwan', 'New Dollars', 'TWD', 'NT$', ',', '.', NULL, NULL),
(117, 'Thailand', 'Baht', 'THB', '฿', ',', '.', NULL, NULL),
(118, 'Trinidad and Tobago', 'Dollars', 'TTD', 'TT$', ',', '.', NULL, NULL),
(119, 'Turkey', 'Lira', 'TRY', 'TL', ',', '.', NULL, NULL),
(120, 'Turkey', 'Liras', 'TRL', '£', ',', '.', NULL, NULL),
(121, 'Tuvalu', 'Dollars', 'TVD', '$', ',', '.', NULL, NULL),
(122, 'Ukraine', 'Hryvnia', 'UAH', '₴', ',', '.', NULL, NULL),
(123, 'United Kingdom', 'Pounds', 'GBP', '£', ',', '.', NULL, NULL),
(124, 'United States of America', 'Dollars', 'USD', '$', ',', '.', NULL, NULL),
(125, 'Uruguay', 'Pesos', 'UYU', '$U', ',', '.', NULL, NULL),
(126, 'Uzbekistan', 'Sums', 'UZS', 'лв', ',', '.', NULL, NULL),
(127, 'Vatican City', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(128, 'Venezuela', 'Bolivares Fuertes', 'VEF', 'Bs', ',', '.', NULL, NULL),
(129, 'Vietnam', 'Dong', 'VND', '₫', ',', '.', NULL, NULL),
(130, 'Yemen', 'Rials', 'YER', '﷼', ',', '.', NULL, NULL),
(131, 'Zimbabwe', 'Zimbabwe Dollars', 'ZWD', 'Z$', ',', '.', NULL, NULL),
(132, 'Iraq', 'Iraqi dinar', 'IQD', 'د.ع', ',', '.', NULL, NULL),
(133, 'Kenya', 'Kenyan shilling', 'KES', 'KSh', ',', '.', NULL, NULL),
(134, 'Bangladesh', 'Taka', 'BDT', '৳', ',', '.', NULL, NULL),
(135, 'Algerie', 'Algerian dinar', 'DZD', 'د.ج', ' ', '.', NULL, NULL),
(136, 'United Arab Emirates', 'United Arab Emirates dirham', 'AED', 'د.إ', ',', '.', NULL, NULL),
(137, 'Uganda', 'Uganda shillings', 'UGX', 'USh', ',', '.', NULL, NULL),
(138, 'Tanzania', 'Tanzanian shilling', 'TZS', 'TSh', ',', '.', NULL, NULL),
(139, 'Angola', 'Kwanza', 'AOA', 'Kz', ',', '.', NULL, NULL),
(140, 'Kuwait', 'Kuwaiti dinar', 'KWD', 'KD', ',', '.', NULL, NULL),
(141, 'Bahrain', 'Bahraini dinar', 'BHD', 'BD', ',', '.', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer_groups`
--

CREATE TABLE `customer_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(5,2) NOT NULL,
  `price_calculation_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'percentage',
  `selling_price_group_id` int(11) DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_groups`
--

INSERT INTO `customer_groups` (`id`, `business_id`, `name`, `amount`, `price_calculation_type`, `selling_price_group_id`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 1, 'servicio técnico', 0.00, 'percentage', NULL, 1, '2022-02-28 11:02:46', '2022-02-28 11:02:46');

-- --------------------------------------------------------

--
-- Table structure for table `dashboard_configurations`
--

CREATE TABLE `dashboard_configurations` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `created_by` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `configuration` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discounts`
--

CREATE TABLE `discounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int(11) NOT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `discount_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `starts_at` datetime DEFAULT NULL,
  `ends_at` datetime DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `applicable_in_spg` tinyint(1) DEFAULT '0',
  `applicable_in_cg` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discount_variations`
--

CREATE TABLE `discount_variations` (
  `discount_id` int(11) NOT NULL,
  `variation_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `discount_variations`
--

INSERT INTO `discount_variations` (`discount_id`, `variation_id`) VALUES
(1, 20);

-- --------------------------------------------------------

--
-- Table structure for table `document_and_notes`
--

CREATE TABLE `document_and_notes` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `notable_id` int(11) NOT NULL,
  `notable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `heading` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `is_private` tinyint(1) NOT NULL DEFAULT '0',
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `essentials_allowances_and_deductions`
--

CREATE TABLE `essentials_allowances_and_deductions` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('allowance','deduction') COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(22,4) NOT NULL,
  `amount_type` enum('fixed','percent') COLLATE utf8mb4_unicode_ci NOT NULL,
  `applicable_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `essentials_attendances`
--

CREATE TABLE `essentials_attendances` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `business_id` int(11) NOT NULL,
  `clock_in_time` datetime DEFAULT NULL,
  `clock_out_time` datetime DEFAULT NULL,
  `essentials_shift_id` int(11) DEFAULT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clock_in_note` text COLLATE utf8mb4_unicode_ci,
  `clock_out_note` text COLLATE utf8mb4_unicode_ci,
  `clock_in_location` text COLLATE utf8mb4_unicode_ci,
  `clock_out_location` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `essentials_documents`
--

CREATE TABLE `essentials_documents` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `essentials_document_shares`
--

CREATE TABLE `essentials_document_shares` (
  `id` int(10) UNSIGNED NOT NULL,
  `document_id` int(11) NOT NULL,
  `value_type` enum('user','role') COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `essentials_holidays`
--

CREATE TABLE `essentials_holidays` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `business_id` int(11) NOT NULL,
  `location_id` int(11) DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `essentials_kb`
--

CREATE TABLE `essentials_kb` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `business_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kb_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'id from essentials_kb table',
  `share_with` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'public, private, only_with',
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `essentials_kb_users`
--

CREATE TABLE `essentials_kb_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kb_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `essentials_leaves`
--

CREATE TABLE `essentials_leaves` (
  `id` int(10) UNSIGNED NOT NULL,
  `essentials_leave_type_id` int(11) DEFAULT NULL,
  `business_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `ref_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('pending','approved','cancelled') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci,
  `status_note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `essentials_leave_types`
--

CREATE TABLE `essentials_leave_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `leave_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `max_leave_count` int(11) DEFAULT NULL,
  `leave_count_interval` enum('month','year') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `essentials_leave_types`
--

INSERT INTO `essentials_leave_types` (`id`, `leave_type`, `max_leave_count`, `leave_count_interval`, `business_id`, `created_at`, `updated_at`) VALUES
(1, 'ABC', 12, 'year', 1, '2022-02-21 01:53:08', '2022-02-21 01:53:08');

-- --------------------------------------------------------

--
-- Table structure for table `essentials_messages`
--

CREATE TABLE `essentials_messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `location_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `essentials_messages`
--

INSERT INTO `essentials_messages` (`id`, `business_id`, `user_id`, `message`, `location_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'hi', 1, '2021-11-01 21:44:03', '2021-11-01 21:44:03');

-- --------------------------------------------------------

--
-- Table structure for table `essentials_payroll_groups`
--

CREATE TABLE `essentials_payroll_groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'due',
  `gross_total` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `essentials_payroll_groups`
--

INSERT INTO `essentials_payroll_groups` (`id`, `business_id`, `name`, `status`, `payment_status`, `gross_total`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 1, 'Payroll for February 2022', 'final', 'due', 2000.0000, 1, '2022-02-18 00:34:29', '2022-02-18 00:34:29');

-- --------------------------------------------------------

--
-- Table structure for table `essentials_payroll_group_transactions`
--

CREATE TABLE `essentials_payroll_group_transactions` (
  `payroll_group_id` bigint(20) UNSIGNED NOT NULL,
  `transaction_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `essentials_payroll_group_transactions`
--

INSERT INTO `essentials_payroll_group_transactions` (`payroll_group_id`, `transaction_id`) VALUES
(1, 155);

-- --------------------------------------------------------

--
-- Table structure for table `essentials_reminders`
--

CREATE TABLE `essentials_reminders` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `end_time` time DEFAULT NULL,
  `repeat` enum('one_time','every_day','every_week','every_month') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `essentials_shifts`
--

CREATE TABLE `essentials_shifts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('fixed_shift','flexible_shift') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fixed_shift',
  `business_id` int(11) NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `is_allowed_auto_clockout` tinyint(1) NOT NULL DEFAULT '0',
  `auto_clockout_time` time DEFAULT NULL,
  `holidays` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `essentials_shifts`
--

INSERT INTO `essentials_shifts` (`id`, `name`, `type`, `business_id`, `start_time`, `end_time`, `is_allowed_auto_clockout`, `auto_clockout_time`, `holidays`, `created_at`, `updated_at`) VALUES
(1, 'Ben', 'fixed_shift', 3, '18:08:00', '18:08:00', 0, NULL, NULL, '2022-02-01 01:09:06', '2022-02-01 01:09:06');

-- --------------------------------------------------------

--
-- Table structure for table `essentials_todos_users`
--

CREATE TABLE `essentials_todos_users` (
  `todo_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `essentials_todos_users`
--

INSERT INTO `essentials_todos_users` (`todo_id`, `user_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 12);

-- --------------------------------------------------------

--
-- Table structure for table `essentials_todo_comments`
--

CREATE TABLE `essentials_todo_comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `task_id` int(11) NOT NULL,
  `comment_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `essentials_to_dos`
--

CREATE TABLE `essentials_to_dos` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `task` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `task_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estimated_hours` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `essentials_to_dos`
--

INSERT INTO `essentials_to_dos` (`id`, `business_id`, `task`, `date`, `end_date`, `task_id`, `description`, `status`, `estimated_hours`, `priority`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 1, 'Toooooo', '2021-10-27 09:05:00', '2021-10-28 09:05:00', '2021/0001', NULL, 'new', '3', 'high', 1, '2021-10-27 16:06:10', '2021-10-27 16:06:10'),
(2, 1, 'quotation', '2021-12-04 09:18:00', '2021-12-13 09:19:00', '2021/0002', NULL, 'new', NULL, NULL, 1, '2021-12-04 16:19:20', '2021-12-04 16:19:20'),
(3, 1, 'quotation', '2021-12-04 09:18:00', '2021-12-13 09:19:00', '2021/0003', NULL, 'new', NULL, NULL, 1, '2021-12-04 16:19:27', '2021-12-04 16:19:27'),
(4, 1, 'quotation', '2021-12-04 09:20:00', '2021-12-08 09:21:00', '2021/0004', NULL, 'new', NULL, 'low', 1, '2021-12-04 16:21:51', '2021-12-04 16:21:51'),
(5, 3, 'gjjg', '2022-01-31 18:21:00', NULL, '2022/0001', NULL, 'new', NULL, NULL, 12, '2022-02-01 01:21:54', '2022-02-01 01:21:54');

-- --------------------------------------------------------

--
-- Table structure for table `essentials_user_allowance_and_deductions`
--

CREATE TABLE `essentials_user_allowance_and_deductions` (
  `user_id` int(11) NOT NULL,
  `allowance_deduction_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `essentials_user_shifts`
--

CREATE TABLE `essentials_user_shifts` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `essentials_shift_id` int(11) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expense_categories`
--

CREATE TABLE `expense_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expense_categories`
--

INSERT INTO `expense_categories` (`id`, `name`, `business_id`, `code`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'General Expense', 1, '1', NULL, '2022-01-03 04:42:05', '2022-01-03 04:42:05');

-- --------------------------------------------------------

--
-- Table structure for table `group_sub_taxes`
--

CREATE TABLE `group_sub_taxes` (
  `group_tax_id` int(10) UNSIGNED NOT NULL,
  `tax_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_layouts`
--

CREATE TABLE `invoice_layouts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `header_text` text COLLATE utf8mb4_unicode_ci,
  `invoice_no_prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quotation_no_prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_heading` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line5` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_heading_not_paid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_heading_paid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quotation_heading` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_total_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `round_off_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_due_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_client_id` tinyint(1) NOT NULL DEFAULT '0',
  `client_id_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_tax_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_time_format` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_time` tinyint(1) NOT NULL DEFAULT '1',
  `show_brand` tinyint(1) NOT NULL DEFAULT '0',
  `show_sku` tinyint(1) NOT NULL DEFAULT '1',
  `show_cat_code` tinyint(1) NOT NULL DEFAULT '1',
  `show_expiry` tinyint(1) NOT NULL DEFAULT '0',
  `show_lot` tinyint(1) NOT NULL DEFAULT '0',
  `show_image` tinyint(1) NOT NULL DEFAULT '0',
  `show_sale_description` tinyint(1) NOT NULL DEFAULT '0',
  `sales_person_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_sales_person` tinyint(1) NOT NULL DEFAULT '0',
  `table_product_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_qty_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_unit_price_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_subtotal_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cat_code_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_logo` tinyint(1) NOT NULL DEFAULT '0',
  `show_business_name` tinyint(1) NOT NULL DEFAULT '0',
  `show_location_name` tinyint(1) NOT NULL DEFAULT '1',
  `show_landmark` tinyint(1) NOT NULL DEFAULT '1',
  `show_city` tinyint(1) NOT NULL DEFAULT '1',
  `show_state` tinyint(1) NOT NULL DEFAULT '1',
  `show_zip_code` tinyint(1) NOT NULL DEFAULT '1',
  `show_country` tinyint(1) NOT NULL DEFAULT '1',
  `show_mobile_number` tinyint(1) NOT NULL DEFAULT '1',
  `show_alternate_number` tinyint(1) NOT NULL DEFAULT '0',
  `show_email` tinyint(1) NOT NULL DEFAULT '0',
  `show_tax_1` tinyint(1) NOT NULL DEFAULT '1',
  `show_tax_2` tinyint(1) NOT NULL DEFAULT '0',
  `show_barcode` tinyint(1) NOT NULL DEFAULT '0',
  `show_payments` tinyint(1) NOT NULL DEFAULT '0',
  `show_customer` tinyint(1) NOT NULL DEFAULT '0',
  `customer_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `commission_agent_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_commission_agent` tinyint(1) NOT NULL DEFAULT '0',
  `show_reward_point` tinyint(1) NOT NULL DEFAULT '0',
  `highlight_color` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_text` text COLLATE utf8mb4_unicode_ci,
  `module_info` text COLLATE utf8mb4_unicode_ci,
  `common_settings` text COLLATE utf8mb4_unicode_ci,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `business_id` int(10) UNSIGNED NOT NULL,
  `show_qr_code` tinyint(1) NOT NULL DEFAULT '0',
  `qr_code_fields` text COLLATE utf8mb4_unicode_ci,
  `design` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT 'classic',
  `cn_heading` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'cn = credit note',
  `cn_no_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cn_amount_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_tax_headings` text COLLATE utf8mb4_unicode_ci,
  `show_previous_bal` tinyint(1) NOT NULL DEFAULT '0',
  `prev_bal_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `change_return_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_custom_fields` text COLLATE utf8mb4_unicode_ci,
  `contact_custom_fields` text COLLATE utf8mb4_unicode_ci,
  `location_custom_fields` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_layouts`
--

INSERT INTO `invoice_layouts` (`id`, `name`, `header_text`, `invoice_no_prefix`, `quotation_no_prefix`, `invoice_heading`, `sub_heading_line1`, `sub_heading_line2`, `sub_heading_line3`, `sub_heading_line4`, `sub_heading_line5`, `invoice_heading_not_paid`, `invoice_heading_paid`, `quotation_heading`, `sub_total_label`, `discount_label`, `tax_label`, `total_label`, `round_off_label`, `total_due_label`, `paid_label`, `show_client_id`, `client_id_label`, `client_tax_label`, `date_label`, `date_time_format`, `show_time`, `show_brand`, `show_sku`, `show_cat_code`, `show_expiry`, `show_lot`, `show_image`, `show_sale_description`, `sales_person_label`, `show_sales_person`, `table_product_label`, `table_qty_label`, `table_unit_price_label`, `table_subtotal_label`, `cat_code_label`, `logo`, `show_logo`, `show_business_name`, `show_location_name`, `show_landmark`, `show_city`, `show_state`, `show_zip_code`, `show_country`, `show_mobile_number`, `show_alternate_number`, `show_email`, `show_tax_1`, `show_tax_2`, `show_barcode`, `show_payments`, `show_customer`, `customer_label`, `commission_agent_label`, `show_commission_agent`, `show_reward_point`, `highlight_color`, `footer_text`, `module_info`, `common_settings`, `is_default`, `business_id`, `show_qr_code`, `qr_code_fields`, `design`, `cn_heading`, `cn_no_label`, `cn_amount_label`, `table_tax_headings`, `show_previous_bal`, `prev_bal_label`, `change_return_label`, `product_custom_fields`, `contact_custom_fields`, `location_custom_fields`, `created_at`, `updated_at`) VALUES
(1, 'Default', NULL, 'Invoice No.', NULL, 'Invoice', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Subtotal', 'Discount', 'Tax', 'Total', NULL, 'Total Due', 'Total Paid', 0, NULL, NULL, 'Date', NULL, 1, 0, 1, 1, 0, 0, 0, 0, NULL, 0, 'Product', 'Quantity', 'Unit Price', 'Subtotal', NULL, '1648937987_GREENMAXX-1536x589.jpg', 1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 1, 1, 1, 'Customer', NULL, 0, 0, '#000000', NULL, '{\"types_of_service\":{\"types_of_service_label\":null},\"tables\":{\"table_label\":null},\"service_staff\":{\"service_staff_label\":null},\"repair\":{\"repair_status_label\":null,\"repair_warranty_label\":null,\"brand_label\":null,\"device_label\":null,\"model_no_label\":null,\"serial_no_label\":null,\"defects_label\":null,\"repair_checklist_label\":null}}', '{\"proforma_heading\":null,\"due_date_label\":null,\"total_quantity_label\":null,\"item_discount_label\":null,\"num_to_word_format\":\"international\"}', 1, 1, 0, NULL, 'slim2', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-09-08 08:52:16', '2022-04-03 05:19:47'),
(2, 'Default', NULL, 'Invoice No.', NULL, 'Invoice', NULL, NULL, NULL, NULL, NULL, '', '', NULL, 'Subtotal', 'Discount', 'Tax', 'Total', NULL, 'Total Due', 'Total Paid', 0, NULL, NULL, 'Date', NULL, 1, 0, 1, 1, 0, 0, 0, 0, NULL, 0, 'Product', 'Quantity', 'Unit Price', 'Subtotal', NULL, NULL, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 1, 'Customer', NULL, 0, 0, '#000000', '', NULL, NULL, 1, 2, 0, NULL, 'classic', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-12-04 00:58:45', '2021-12-04 00:58:45'),
(3, 'Default', NULL, 'Invoice No.', NULL, 'Invoice', NULL, NULL, NULL, NULL, NULL, '', '', NULL, 'Subtotal', 'Discount', 'Tax', 'Total', NULL, 'Total Due', 'Total Paid', 0, NULL, NULL, 'Date', NULL, 1, 0, 1, 1, 0, 0, 0, 0, NULL, 0, 'Product', 'Quantity', 'Unit Price', 'Subtotal', NULL, NULL, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 1, 'Customer', NULL, 0, 0, '#000000', '', NULL, NULL, 1, 3, 0, NULL, 'classic', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-01 06:06:44', '2022-02-01 06:06:44');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_schemes`
--

CREATE TABLE `invoice_schemes` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `scheme_type` enum('blank','year') COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_number` int(11) DEFAULT NULL,
  `invoice_count` int(11) NOT NULL DEFAULT '0',
  `total_digits` int(11) DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_schemes`
--

INSERT INTO `invoice_schemes` (`id`, `business_id`, `name`, `scheme_type`, `prefix`, `start_number`, `invoice_count`, `total_digits`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 1, 'Invoice Max', 'blank', 'INV', 1, 124, 7, 1, '2021-09-08 08:52:16', '2022-03-25 22:39:58'),
(2, 2, 'Default', 'blank', '', 1, 0, 4, 1, '2021-12-04 00:58:45', '2021-12-04 00:58:45'),
(3, 3, 'Default', 'blank', '', 1, 0, 4, 1, '2022-02-01 06:06:44', '2022-02-01 06:06:44'),
(4, 1, 'Casa Milad', 'blank', NULL, 0, 0, 4, 0, '2022-03-22 21:33:00', '2022-03-22 21:33:00');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `uploaded_by` int(11) DEFAULT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `woocommerce_media_id` int(11) DEFAULT NULL,
  `model_media_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `business_id`, `file_name`, `description`, `uploaded_by`, `model_type`, `woocommerce_media_id`, `model_media_type`, `model_id`, `created_at`, `updated_at`) VALUES
(1, 1, '1631049869_1210365253_dove.png', NULL, 1, 'App\\Variation', NULL, NULL, 1, '2021-09-08 09:24:29', '2021-09-08 09:24:29');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2017_07_05_071953_create_currencies_table', 1),
(9, '2017_07_05_073658_create_business_table', 1),
(10, '2017_07_22_075923_add_business_id_users_table', 1),
(11, '2017_07_23_113209_create_brands_table', 1),
(12, '2017_07_26_083429_create_permission_tables', 1),
(13, '2017_07_26_110000_create_tax_rates_table', 1),
(14, '2017_07_26_122313_create_units_table', 1),
(15, '2017_07_27_075706_create_contacts_table', 1),
(16, '2017_08_04_071038_create_categories_table', 1),
(17, '2017_08_08_115903_create_products_table', 1),
(18, '2017_08_09_061616_create_variation_templates_table', 1),
(19, '2017_08_09_061638_create_variation_value_templates_table', 1),
(20, '2017_08_10_061146_create_product_variations_table', 1),
(21, '2017_08_10_061216_create_variations_table', 1),
(22, '2017_08_19_054827_create_transactions_table', 1),
(23, '2017_08_31_073533_create_purchase_lines_table', 1),
(24, '2017_10_15_064638_create_transaction_payments_table', 1),
(25, '2017_10_31_065621_add_default_sales_tax_to_business_table', 1),
(26, '2017_11_20_051930_create_table_group_sub_taxes', 1),
(27, '2017_11_20_063603_create_transaction_sell_lines', 1),
(28, '2017_11_21_064540_create_barcodes_table', 1),
(29, '2017_11_23_181237_create_invoice_schemes_table', 1),
(30, '2017_12_25_122822_create_business_locations_table', 1),
(31, '2017_12_25_160253_add_location_id_to_transactions_table', 1),
(32, '2017_12_25_163227_create_variation_location_details_table', 1),
(33, '2018_01_04_115627_create_sessions_table', 1),
(34, '2018_01_05_112817_create_invoice_layouts_table', 1),
(35, '2018_01_06_112303_add_invoice_scheme_id_and_invoice_layout_id_to_business_locations', 1),
(36, '2018_01_08_104124_create_expense_categories_table', 1),
(37, '2018_01_08_123327_modify_transactions_table_for_expenses', 1),
(38, '2018_01_09_111005_modify_payment_status_in_transactions_table', 1),
(39, '2018_01_09_111109_add_paid_on_column_to_transaction_payments_table', 1),
(40, '2018_01_25_172439_add_printer_related_fields_to_business_locations_table', 1),
(41, '2018_01_27_184322_create_printers_table', 1),
(42, '2018_01_30_181442_create_cash_registers_table', 1),
(43, '2018_01_31_125836_create_cash_register_transactions_table', 1),
(44, '2018_02_07_173326_modify_business_table', 1),
(45, '2018_02_08_105425_add_enable_product_expiry_column_to_business_table', 1),
(46, '2018_02_08_111027_add_expiry_period_and_expiry_period_type_columns_to_products_table', 1),
(47, '2018_02_08_131118_add_mfg_date_and_exp_date_purchase_lines_table', 1),
(48, '2018_02_08_155348_add_exchange_rate_to_transactions_table', 1),
(49, '2018_02_09_124945_modify_transaction_payments_table_for_contact_payments', 1),
(50, '2018_02_12_113640_create_transaction_sell_lines_purchase_lines_table', 1),
(51, '2018_02_12_114605_add_quantity_sold_in_purchase_lines_table', 1),
(52, '2018_02_13_183323_alter_decimal_fields_size', 1),
(53, '2018_02_14_161928_add_transaction_edit_days_to_business_table', 1),
(54, '2018_02_15_161032_add_document_column_to_transactions_table', 1),
(55, '2018_02_17_124709_add_more_options_to_invoice_layouts', 1),
(56, '2018_02_19_111517_add_keyboard_shortcut_column_to_business_table', 1),
(57, '2018_02_19_121537_stock_adjustment_move_to_transaction_table', 1),
(58, '2018_02_20_165505_add_is_direct_sale_column_to_transactions_table', 1),
(59, '2018_02_21_105329_create_system_table', 1),
(60, '2018_02_23_100549_version_1_2', 1),
(61, '2018_02_23_125648_add_enable_editing_sp_from_purchase_column_to_business_table', 1),
(62, '2018_02_26_103612_add_sales_commission_agent_column_to_business_table', 1),
(63, '2018_02_26_130519_modify_users_table_for_sales_cmmsn_agnt', 1),
(64, '2018_02_26_134500_add_commission_agent_to_transactions_table', 1),
(65, '2018_02_27_121422_add_item_addition_method_to_business_table', 1),
(66, '2018_02_27_170232_modify_transactions_table_for_stock_transfer', 1),
(67, '2018_03_05_153510_add_enable_inline_tax_column_to_business_table', 1),
(68, '2018_03_06_210206_modify_product_barcode_types', 1),
(69, '2018_03_13_181541_add_expiry_type_to_business_table', 1),
(70, '2018_03_16_113446_product_expiry_setting_for_business', 1),
(71, '2018_03_19_113601_add_business_settings_options', 1),
(72, '2018_03_26_125334_add_pos_settings_to_business_table', 1),
(73, '2018_03_26_165350_create_customer_groups_table', 1),
(74, '2018_03_27_122720_customer_group_related_changes_in_tables', 1),
(75, '2018_03_29_110138_change_tax_field_to_nullable_in_business_table', 1),
(76, '2018_03_29_115502_add_changes_for_sr_number_in_products_and_sale_lines_table', 1),
(77, '2018_03_29_134340_add_inline_discount_fields_in_purchase_lines', 1),
(78, '2018_03_31_140921_update_transactions_table_exchange_rate', 1),
(79, '2018_04_03_103037_add_contact_id_to_contacts_table', 1),
(80, '2018_04_03_122709_add_changes_to_invoice_layouts_table', 1),
(81, '2018_04_09_135320_change_exchage_rate_size_in_business_table', 1),
(82, '2018_04_17_123122_add_lot_number_to_business', 1),
(83, '2018_04_17_160845_add_product_racks_table', 1),
(84, '2018_04_20_182015_create_res_tables_table', 1),
(85, '2018_04_24_105246_restaurant_fields_in_transaction_table', 1),
(86, '2018_04_24_114149_add_enabled_modules_business_table', 1),
(87, '2018_04_24_133704_add_modules_fields_in_invoice_layout_table', 1),
(88, '2018_04_27_132653_quotation_related_change', 1),
(89, '2018_05_02_104439_add_date_format_and_time_format_to_business', 1),
(90, '2018_05_02_111939_add_sell_return_to_transaction_payments', 1),
(91, '2018_05_14_114027_add_rows_positions_for_products', 1),
(92, '2018_05_14_125223_add_weight_to_products_table', 1),
(93, '2018_05_14_164754_add_opening_stock_permission', 1),
(94, '2018_05_15_134729_add_design_to_invoice_layouts', 1),
(95, '2018_05_16_183307_add_tax_fields_invoice_layout', 1),
(96, '2018_05_18_191956_add_sell_return_to_transaction_table', 1),
(97, '2018_05_21_131349_add_custom_fileds_to_contacts_table', 1),
(98, '2018_05_21_131607_invoice_layout_fields_for_sell_return', 1),
(99, '2018_05_21_131949_add_custom_fileds_and_website_to_business_locations_table', 1),
(100, '2018_05_22_123527_create_reference_counts_table', 1),
(101, '2018_05_22_154540_add_ref_no_prefixes_column_to_business_table', 1),
(102, '2018_05_24_132620_add_ref_no_column_to_transaction_payments_table', 1),
(103, '2018_05_24_161026_add_location_id_column_to_business_location_table', 1),
(104, '2018_05_25_180603_create_modifiers_related_table', 1),
(105, '2018_05_29_121714_add_purchase_line_id_to_stock_adjustment_line_table', 1),
(106, '2018_05_31_114645_add_res_order_status_column_to_transactions_table', 1),
(107, '2018_06_05_103530_rename_purchase_line_id_in_stock_adjustment_lines_table', 1),
(108, '2018_06_05_111905_modify_products_table_for_modifiers', 1),
(109, '2018_06_06_110524_add_parent_sell_line_id_column_to_transaction_sell_lines_table', 1),
(110, '2018_06_07_152443_add_is_service_staff_to_roles_table', 1),
(111, '2018_06_07_182258_add_image_field_to_products_table', 1),
(112, '2018_06_13_133705_create_bookings_table', 1),
(113, '2018_06_15_173636_add_email_column_to_contacts_table', 1),
(114, '2018_06_27_182835_add_superadmin_related_fields_business', 1),
(115, '2018_07_10_101913_add_custom_fields_to_products_table', 1),
(116, '2018_07_17_103434_add_sales_person_name_label_to_invoice_layouts_table', 1),
(117, '2018_07_17_163920_add_theme_skin_color_column_to_business_table', 1),
(118, '2018_07_24_160319_add_lot_no_line_id_to_transaction_sell_lines_table', 1),
(119, '2018_07_25_110004_add_show_expiry_and_show_lot_colums_to_invoice_layouts_table', 1),
(120, '2018_07_25_172004_add_discount_columns_to_transaction_sell_lines_table', 1),
(121, '2018_07_26_124720_change_design_column_type_in_invoice_layouts_table', 1),
(122, '2018_07_26_170424_add_unit_price_before_discount_column_to_transaction_sell_line_table', 1),
(123, '2018_07_28_103614_add_credit_limit_column_to_contacts_table', 1),
(124, '2018_08_08_110755_add_new_payment_methods_to_transaction_payments_table', 1),
(125, '2018_08_08_122225_modify_cash_register_transactions_table_for_new_payment_methods', 1),
(126, '2018_08_14_104036_add_opening_balance_type_to_transactions_table', 1),
(127, '2018_09_04_155900_create_accounts_table', 1),
(128, '2018_09_06_114438_create_selling_price_groups_table', 1),
(129, '2018_09_06_154057_create_variation_group_prices_table', 1),
(130, '2018_09_07_102413_add_permission_to_access_default_selling_price', 1),
(131, '2018_09_07_134858_add_selling_price_group_id_to_transactions_table', 1),
(132, '2018_09_10_112448_update_product_type_to_single_if_null_in_products_table', 1),
(133, '2018_09_10_152703_create_account_transactions_table', 1),
(134, '2018_09_10_173656_add_account_id_column_to_transaction_payments_table', 1),
(135, '2018_09_19_123914_create_notification_templates_table', 1),
(136, '2018_09_22_110504_add_sms_and_email_settings_columns_to_business_table', 1),
(137, '2018_09_24_134942_add_lot_no_line_id_to_stock_adjustment_lines_table', 1),
(138, '2018_09_26_105557_add_transaction_payments_for_existing_expenses', 1),
(139, '2018_09_27_111609_modify_transactions_table_for_purchase_return', 1),
(140, '2018_09_27_131154_add_quantity_returned_column_to_purchase_lines_table', 1),
(141, '2018_10_02_131401_add_return_quantity_column_to_transaction_sell_lines_table', 1),
(142, '2018_10_03_104918_add_qty_returned_column_to_transaction_sell_lines_purchase_lines_table', 1),
(143, '2018_10_03_185947_add_default_notification_templates_to_database', 1),
(144, '2018_10_09_153105_add_business_id_to_transaction_payments_table', 1),
(145, '2018_10_16_135229_create_permission_for_sells_and_purchase', 1),
(146, '2018_10_22_114441_add_columns_for_variable_product_modifications', 1),
(147, '2018_10_22_134428_modify_variable_product_data', 1),
(148, '2018_10_30_181558_add_table_tax_headings_to_invoice_layout', 1),
(149, '2018_10_31_122619_add_pay_terms_field_transactions_table', 1),
(150, '2018_10_31_161328_add_new_permissions_for_pos_screen', 1),
(151, '2018_10_31_174752_add_access_selected_contacts_only_to_users_table', 1),
(152, '2018_10_31_175627_add_user_contact_access', 1),
(153, '2018_10_31_180559_add_auto_send_sms_column_to_notification_templates_table', 1),
(154, '2018_11_02_171949_change_card_type_column_to_varchar_in_transaction_payments_table', 1),
(155, '2018_11_08_105621_add_role_permissions', 1),
(156, '2018_11_26_114135_add_is_suspend_column_to_transactions_table', 1),
(157, '2018_11_28_104410_modify_units_table_for_multi_unit', 1),
(158, '2018_11_28_170952_add_sub_unit_id_to_purchase_lines_and_sell_lines', 1),
(159, '2018_11_29_115918_add_primary_key_in_system_table', 1),
(160, '2018_12_03_185546_add_product_description_column_to_products_table', 1),
(161, '2018_12_06_114937_modify_system_table_and_users_table', 1),
(162, '2018_12_13_160007_add_custom_fields_display_options_to_invoice_layouts_table', 1),
(163, '2018_12_14_103307_modify_system_table', 1),
(164, '2018_12_18_133837_add_prev_balance_due_columns_to_invoice_layouts_table', 1),
(165, '2018_12_18_170656_add_invoice_token_column_to_transaction_table', 1),
(166, '2018_12_20_133639_add_date_time_format_column_to_invoice_layouts_table', 1),
(167, '2018_12_21_120659_add_recurring_invoice_fields_to_transactions_table', 1),
(168, '2018_12_24_154933_create_notifications_table', 1),
(169, '2019_01_08_112015_add_document_column_to_transaction_payments_table', 1),
(170, '2019_01_10_124645_add_account_permission', 1),
(171, '2019_01_16_125825_add_subscription_no_column_to_transactions_table', 1),
(172, '2019_01_28_111647_add_order_addresses_column_to_transactions_table', 1),
(173, '2019_02_13_173821_add_is_inactive_column_to_products_table', 1),
(174, '2019_02_19_103118_create_discounts_table', 1),
(175, '2019_02_21_120324_add_discount_id_column_to_transaction_sell_lines_table', 1),
(176, '2019_02_21_134324_add_permission_for_discount', 1),
(177, '2019_03_04_170832_add_service_staff_columns_to_transaction_sell_lines_table', 1),
(178, '2019_03_09_102425_add_sub_type_column_to_transactions_table', 1),
(179, '2019_03_09_124457_add_indexing_transaction_sell_lines_purchase_lines_table', 1),
(180, '2019_03_12_120336_create_activity_log_table', 1),
(181, '2019_03_15_132925_create_media_table', 1),
(182, '2019_05_08_130339_add_indexing_to_parent_id_in_transaction_payments_table', 1),
(183, '2019_05_10_132311_add_missing_column_indexing', 1),
(184, '2019_05_14_091812_add_show_image_column_to_invoice_layouts_table', 1),
(185, '2019_05_25_104922_add_view_purchase_price_permission', 1),
(186, '2019_06_17_103515_add_profile_informations_columns_to_users_table', 1),
(187, '2019_06_18_135524_add_permission_to_view_own_sales_only', 1),
(188, '2019_06_19_112058_add_database_changes_for_reward_points', 1),
(189, '2019_06_28_133732_change_type_column_to_string_in_transactions_table', 1),
(190, '2019_07_13_111420_add_is_created_from_api_column_to_transactions_table', 1),
(191, '2019_07_15_165136_add_fields_for_combo_product', 1),
(192, '2019_07_19_103446_add_mfg_quantity_used_column_to_purchase_lines_table', 1),
(193, '2019_07_22_152649_add_not_for_selling_in_product_table', 1),
(194, '2019_07_29_185351_add_show_reward_point_column_to_invoice_layouts_table', 1),
(195, '2019_08_08_162302_add_sub_units_related_fields', 1),
(196, '2019_08_26_133419_update_price_fields_decimal_point', 1),
(197, '2019_09_02_160054_remove_location_permissions_from_roles', 1),
(198, '2019_09_03_185259_add_permission_for_pos_screen', 1),
(199, '2019_09_04_163141_add_location_id_to_cash_registers_table', 1),
(200, '2019_09_04_184008_create_types_of_services_table', 1),
(201, '2019_09_06_131445_add_types_of_service_fields_to_transactions_table', 1),
(202, '2019_09_09_134810_add_default_selling_price_group_id_column_to_business_locations_table', 1),
(203, '2019_09_12_105616_create_product_locations_table', 1),
(204, '2019_09_17_122522_add_custom_labels_column_to_business_table', 1),
(205, '2019_09_18_164319_add_shipping_fields_to_transactions_table', 1),
(206, '2019_09_19_170927_close_all_active_registers', 1),
(207, '2019_09_23_161906_add_media_description_cloumn_to_media_table', 1),
(208, '2019_10_18_155633_create_account_types_table', 1),
(209, '2019_10_22_163335_add_common_settings_column_to_business_table', 1),
(210, '2019_10_29_132521_add_update_purchase_status_permission', 1),
(211, '2019_11_09_110522_add_indexing_to_lot_number', 1),
(212, '2019_11_19_170824_add_is_active_column_to_business_locations_table', 1),
(213, '2019_11_21_162913_change_quantity_field_types_to_decimal', 1),
(214, '2019_11_25_160340_modify_categories_table_for_polymerphic_relationship', 1),
(215, '2019_12_02_105025_create_warranties_table', 1),
(216, '2019_12_03_180342_add_common_settings_field_to_invoice_layouts_table', 1),
(217, '2019_12_05_183955_add_more_fields_to_users_table', 1),
(218, '2019_12_06_174904_add_change_return_label_column_to_invoice_layouts_table', 1),
(219, '2019_12_11_121307_add_draft_and_quotation_list_permissions', 1),
(220, '2019_12_12_180126_copy_expense_total_to_total_before_tax', 1),
(221, '2019_12_19_181412_make_alert_quantity_field_nullable_on_products_table', 1),
(222, '2019_12_25_173413_create_dashboard_configurations_table', 1),
(223, '2020_01_08_133506_create_document_and_notes_table', 1),
(224, '2020_01_09_113252_add_cc_bcc_column_to_notification_templates_table', 1),
(225, '2020_01_16_174818_add_round_off_amount_field_to_transactions_table', 1),
(226, '2020_01_28_162345_add_weighing_scale_settings_in_business_settings_table', 1),
(227, '2020_02_18_172447_add_import_fields_to_transactions_table', 1),
(228, '2020_03_13_135844_add_is_active_column_to_selling_price_groups_table', 1),
(229, '2020_03_16_115449_add_contact_status_field_to_contacts_table', 1),
(230, '2020_03_26_124736_add_allow_login_column_in_users_table', 1),
(231, '2020_04_13_154150_add_feature_products_column_to_business_loactions', 1),
(232, '2020_04_15_151802_add_user_type_to_users_table', 1),
(233, '2020_04_22_153905_add_subscription_repeat_on_column_to_transactions_table', 1),
(234, '2020_04_28_111436_add_shipping_address_to_contacts_table', 1),
(235, '2020_06_01_094654_add_max_sale_discount_column_to_users_table', 1),
(236, '2020_06_12_162245_modify_contacts_table', 1),
(237, '2020_06_22_103104_change_recur_interval_default_to_one', 1),
(238, '2020_07_09_174621_add_balance_field_to_contacts_table', 1),
(239, '2020_07_23_104933_change_status_column_to_varchar_in_transaction_table', 1),
(240, '2020_09_07_171059_change_completed_stock_transfer_status_to_final', 1),
(241, '2020_09_21_123224_modify_booking_status_column_in_bookings_table', 1),
(242, '2020_09_22_121639_create_discount_variations_table', 1),
(243, '2020_10_05_121550_modify_business_location_table_for_invoice_layout', 1),
(244, '2020_10_16_175726_set_status_as_received_for_opening_stock', 1),
(245, '2020_10_23_170823_add_for_group_tax_column_to_tax_rates_table', 1),
(246, '2020_11_04_130940_add_more_custom_fields_to_contacts_table', 1),
(247, '2020_11_10_152841_add_cash_register_permissions', 1),
(248, '2020_11_17_164041_modify_type_column_to_varchar_in_contacts_table', 1),
(249, '2020_12_18_181447_add_shipping_custom_fields_to_transactions_table', 1),
(250, '2020_12_22_164303_add_sub_status_column_to_transactions_table', 1),
(251, '2020_12_24_153050_add_custom_fields_to_transactions_table', 1),
(252, '2020_12_28_105403_add_whatsapp_text_column_to_notification_templates_table', 1),
(253, '2020_12_29_165925_add_model_document_type_to_media_table', 1),
(254, '2021_02_08_175632_add_contact_number_fields_to_users_table', 1),
(255, '2021_02_11_172217_add_indexing_for_multiple_columns', 1),
(256, '2021_02_23_122043_add_more_columns_to_customer_groups_table', 1),
(257, '2021_02_24_175551_add_print_invoice_permission_to_all_roles', 1),
(258, '2021_03_03_162021_add_purchase_order_columns_to_purchase_lines_and_transactions_table', 1),
(259, '2021_03_11_120229_add_sales_order_columns', 1),
(260, '2021_03_16_120705_add_business_id_to_activity_log_table', 1),
(261, '2021_03_16_153427_add_code_columns_to_business_table', 1),
(262, '2021_03_18_173308_add_account_details_column_to_accounts_table', 1),
(263, '2021_03_18_183119_add_prefer_payment_account_columns_to_transactions_table', 1),
(264, '2021_03_22_120810_add_more_types_of_service_custom_fields', 1),
(265, '2021_03_24_183132_add_shipping_export_custom_field_details_to_contacts_table', 1),
(266, '2021_03_25_170715_add_export_custom_fields_info_to_transactions_table', 1),
(267, '2021_04_15_063449_add_denominations_column_to_cash_registers_table', 1),
(268, '2021_05_22_083426_add_indexing_to_account_transactions_table', 1),
(269, '2021_07_08_065808_add_additional_expense_columns_to_transaction_table', 1),
(270, '2021_07_13_082918_add_qr_code_columns_to_invoice_layouts_table', 1),
(271, '2021_07_21_061615_add_fields_to_show_commission_agent_in_invoice_layout', 1),
(272, '2021_08_13_105549_add_crm_contact_id_to_users_table', 1),
(273, '2018_10_01_151252_create_documents_table', 2),
(274, '2018_10_02_151803_create_document_shares_table', 2),
(275, '2018_10_09_134558_create_reminders_table', 2),
(276, '2018_11_16_170756_create_to_dos_table', 2),
(277, '2019_02_22_120329_essentials_messages', 2),
(278, '2019_02_22_161513_add_message_permissions', 2),
(279, '2019_03_29_164339_add_essentials_version_to_system_table', 2),
(280, '2019_05_17_153306_create_essentials_leave_types_table', 2),
(281, '2019_05_17_175921_create_essentials_leaves_table', 2),
(282, '2019_05_21_154517_add_essentials_settings_columns_to_business_table', 2),
(283, '2019_05_21_181653_create_table_essentials_attendance', 2),
(284, '2019_05_30_110049_create_essentials_payrolls_table', 2),
(285, '2019_06_04_105723_create_essentials_holidays_table', 2),
(286, '2019_06_28_134217_add_payroll_columns_to_transactions_table', 2),
(287, '2019_08_26_103520_add_approve_leave_permission', 2),
(288, '2019_08_27_103724_create_essentials_allowance_and_deduction_table', 2),
(289, '2019_08_27_105236_create_essentials_user_allowances_and_deductions', 2),
(290, '2019_09_20_115906_add_more_columns_to_essentials_to_dos_table', 2),
(291, '2019_09_23_120439_create_essentials_todo_comments_table', 2),
(292, '2019_12_05_170724_add_hrm_columns_to_users_table', 2),
(293, '2019_12_09_105809_add_allowance_and_deductions_permission', 2),
(294, '2020_03_28_152838_create_essentials_shift_table', 2),
(295, '2020_03_30_162029_create_user_shifts_table', 2),
(296, '2020_03_31_134558_add_shift_id_to_attendance_table', 2),
(297, '2020_11_05_105157_modify_todos_date_column_type', 2),
(298, '2020_11_11_174852_add_end_time_column_to_essentials_reminders_table', 2),
(299, '2020_11_26_170527_create_essentials_kb_table', 2),
(300, '2020_11_30_112615_create_essentials_kb_users_table', 2),
(301, '2021_02_12_185514_add_clock_in_location_to_essentials_attendances_table', 2),
(302, '2021_02_16_190203_add_essentials_module_indexing', 2),
(303, '2021_02_27_133448_add_columns_to_users_table', 2),
(304, '2021_03_04_174857_create_payroll_groups_table', 2),
(305, '2021_03_04_175025_create_payroll_group_transactions_table', 2),
(306, '2021_03_09_123914_add_auto_clockout_to_essentials_shifts', 2),
(307, '2018_10_10_110400_add_module_version_to_system_table', 3),
(308, '2018_10_10_122845_add_woocommerce_api_settings_to_business_table', 3),
(309, '2018_10_10_162041_add_woocommerce_category_id_to_categories_table', 3),
(310, '2018_10_11_173839_create_woocommerce_sync_logs_table', 3),
(311, '2018_10_16_123522_add_woocommerce_tax_rate_id_column_to_tax_rates_table', 3),
(312, '2018_10_23_111555_add_woocommerce_attr_id_column_to_variation_templates_table', 3),
(313, '2018_12_03_163945_add_woocommerce_permissions', 3),
(314, '2019_02_18_154414_change_woocommerce_sync_logs_table', 3),
(315, '2019_04_19_174129_add_disable_woocommerce_sync_column_to_products_table', 3),
(316, '2019_06_08_132440_add_woocommerce_wh_oc_secret_column_to_business_table', 3),
(317, '2019_10_01_171828_add_woocommerce_media_id_columns', 3),
(318, '2020_09_07_124952_add_woocommerce_skipped_orders_fields_to_business_table', 3),
(319, '2019_03_07_155813_make_repair_statuses_table', 4),
(320, '2019_03_08_120634_add_repair_columns_to_transactions_table', 4),
(321, '2019_03_14_182704_add_repair_permissions', 4),
(322, '2019_03_29_110241_add_repair_version_column_to_system_table', 4),
(323, '2019_04_12_113901_add_repair_settings_column_to_business_table', 4),
(324, '2020_05_05_125008_create_device_models_table', 4),
(325, '2020_05_06_103135_add_repair_model_id_column_to_products_table', 4),
(326, '2020_07_11_120308_add_columns_to_repair_statuses_table', 4),
(327, '2020_07_31_130737_create_job_sheets_table', 4),
(328, '2020_08_07_124241_add_job_sheet_id_to_transactions_table', 4),
(329, '2020_08_22_104640_add_email_template_field_to_repair_status_table', 4),
(330, '2020_10_19_131934_add_job_sheet_custom_fields_to_repair_job_sheets_table', 4),
(331, '2018_06_27_185405_create_packages_table', 5),
(332, '2018_06_28_182803_create_subscriptions_table', 5),
(333, '2018_07_17_182021_add_rows_to_system_table', 5),
(334, '2018_07_19_131721_add_options_to_packages_table', 5),
(335, '2018_08_17_155534_add_min_termination_alert_days', 5),
(336, '2018_08_28_105945_add_business_based_username_settings_to_system_table', 5),
(337, '2018_08_30_105906_add_superadmin_communicator_logs_table', 5),
(338, '2018_11_02_130636_add_custom_permissions_to_packages_table', 5),
(339, '2018_11_05_161848_add_more_fields_to_packages_table', 5),
(340, '2018_12_10_124621_modify_system_table_values_null_default', 5),
(341, '2019_05_10_135434_add_missing_database_column_indexes', 5),
(342, '2019_08_16_115300_create_superadmin_frontend_pages_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_permissions`
--

INSERT INTO `model_has_permissions` (`permission_id`, `model_type`, `model_id`) VALUES
(80, 'App\\User', 2),
(82, 'App\\User', 4),
(100, 'App\\User', 4),
(80, 'App\\User', 6),
(80, 'App\\User', 7),
(82, 'App\\User', 8),
(80, 'App\\User', 9);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\User', 1),
(4, 'App\\User', 5),
(5, 'App\\User', 6),
(4, 'App\\User', 7),
(12, 'App\\User', 8),
(10, 'App\\User', 12);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notification_templates`
--

CREATE TABLE `notification_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `template_for` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_body` text COLLATE utf8mb4_unicode_ci,
  `sms_body` text COLLATE utf8mb4_unicode_ci,
  `whatsapp_text` text COLLATE utf8mb4_unicode_ci,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cc` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bcc` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auto_send` tinyint(1) NOT NULL DEFAULT '0',
  `auto_send_sms` tinyint(1) NOT NULL DEFAULT '0',
  `auto_send_wa_notif` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notification_templates`
--

INSERT INTO `notification_templates` (`id`, `business_id`, `template_for`, `email_body`, `sms_body`, `whatsapp_text`, `subject`, `cc`, `bcc`, `auto_send`, `auto_send_sms`, `auto_send_wa_notif`, `created_at`, `updated_at`) VALUES
(1, 1, 'new_sale', '<p>Dear {contact_name},</p>\r\n<p>Your invoice number is {invoice_number}<br />Total amount: {total_amount}<br />Paid amount: {received_amount}</p>\r\n<p>Thank you for shopping with us.</p>\r\n<p>{business_logo}</p>\r\n<p>&nbsp;</p>', 'Dear {contact_name}, Thank you for shopping with us. {business_name}', 'Dear {contact_name},\r\n\r\nYour invoice number is {invoice_number}\r\nTotal amount: {total_amount}\r\nPaid amount: {received_amount}\r\n\r\nThank you for shopping with us.', 'Thank you from {business_name}', NULL, NULL, 0, 0, 1, '2021-09-08 08:52:16', '2021-11-23 20:09:02'),
(2, 1, 'payment_received', '<p>Dear {contact_name},</p>\r\n<p>We have received a payment of {received_amount}</p>\r\n<p>{business_logo}</p>', 'Dear {contact_name}, We have received a payment of {received_amount}. {business_name}', NULL, 'Payment Received, from {business_name}', NULL, NULL, 0, 0, 0, '2021-09-08 08:52:16', '2021-11-23 20:09:02'),
(3, 1, 'payment_reminder', '<p>Dear {contact_name},</p>\r\n<p>This is to remind you that you have pending payment of {due_amount}. Kindly pay it as soon as possible.</p>\r\n<p>{business_logo}</p>', 'Dear {contact_name}, You have pending payment of {due_amount}. Kindly pay it as soon as possible. {business_name}', NULL, 'Payment Reminder, from {business_name}', NULL, NULL, 0, 0, 0, '2021-09-08 08:52:16', '2021-11-23 20:09:02'),
(4, 1, 'new_booking', '<p>Dear {contact_name},</p>\r\n<p>Your booking is confirmed</p>\r\n<p>Date: {start_time} to {end_time}</p>\r\n<p>Table: {table}</p>\r\n<p>Location: {location}</p>\r\n<p>{business_logo}</p>', 'Dear {contact_name}, Your booking is confirmed. Date: {start_time} to {end_time}, Table: {table}, Location: {location}', NULL, 'Booking Confirmed - {business_name}', NULL, NULL, 0, 0, 0, '2021-09-08 08:52:16', '2021-11-23 20:09:02'),
(5, 1, 'new_order', '<p>Dear {contact_name},</p>\r\n<p>We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible.</p>\r\n<p>{business_name}<br />{business_logo}</p>', 'Dear {contact_name}, We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible. {business_name}', NULL, 'New Order, from {business_name}', NULL, NULL, 0, 0, 0, '2021-09-08 08:52:16', '2021-11-23 20:09:02'),
(6, 1, 'payment_paid', '<p>Dear {contact_name},</p>\r\n<p>We have paid amount {paid_amount} again invoice number {order_ref_number}.<br />Kindly note it down.</p>\r\n<p>{business_name}<br />{business_logo}</p>', 'We have paid amount {paid_amount} again invoice number {order_ref_number}.\r\n                    Kindly note it down. {business_name}', NULL, 'Payment Paid, from {business_name}', NULL, NULL, 0, 0, 0, '2021-09-08 08:52:16', '2021-11-23 20:09:02'),
(7, 1, 'items_received', '<p>Dear {contact_name},</p>\r\n<p>We have received all items from invoice reference number {order_ref_number}. Thank you for processing it.</p>\r\n<p>{business_name}<br />{business_logo}</p>', 'We have received all items from invoice reference number {order_ref_number}. Thank you for processing it. {business_name}', NULL, 'Items received, from {business_name}', NULL, NULL, 0, 0, 0, '2021-09-08 08:52:16', '2021-11-23 20:09:02'),
(8, 1, 'items_pending', '<p>Dear {contact_name},<br />This is to remind you that we have not yet received some items from invoice reference number {order_ref_number}. Please process it as soon as possible.</p>\r\n<p>{business_name}<br />{business_logo}</p>', 'This is to remind you that we have not yet received some items from invoice reference number {order_ref_number} . Please process it as soon as possible.{business_name}', NULL, 'Items Pending, from {business_name}', NULL, NULL, 0, 0, 0, '2021-09-08 08:52:16', '2021-11-23 20:09:02'),
(9, 1, 'new_quotation', '<p>Dear {contact_name},</p>\r\n<p>Your quotation number is {invoice_number}<br />Total amount: {total_amount}</p>\r\n<p>Thank you for shopping with us.</p>\r\n<p>{business_logo}</p>\r\n<p>&nbsp;</p>', 'Dear {contact_name}, Thank you for shopping with us. {business_name}', NULL, 'Thank you from {business_name}', NULL, NULL, 0, 0, 0, '2021-09-08 08:52:16', '2021-11-23 20:09:02'),
(10, 1, 'send_ledger', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-11-23 20:09:02', '2021-11-23 20:09:02'),
(11, 2, 'new_sale', '<p>Dear {contact_name},</p>\n\n                    <p>Your invoice number is {invoice_number}<br />\n                    Total amount: {total_amount}<br />\n                    Paid amount: {received_amount}</p>\n\n                    <p>Thank you for shopping with us.</p>\n\n                    <p>{business_logo}</p>\n\n                    <p>&nbsp;</p>', 'Dear {contact_name}, Thank you for shopping with us. {business_name}', NULL, 'Thank you from {business_name}', NULL, NULL, 0, 0, 0, '2021-12-04 00:58:45', '2021-12-04 00:58:45'),
(12, 2, 'payment_received', '<p>Dear {contact_name},</p>\n\n                <p>We have received a payment of {received_amount}</p>\n\n                <p>{business_logo}</p>', 'Dear {contact_name}, We have received a payment of {received_amount}. {business_name}', NULL, 'Payment Received, from {business_name}', NULL, NULL, 0, 0, 0, '2021-12-04 00:58:45', '2021-12-04 00:58:45'),
(13, 2, 'payment_reminder', '<p>Dear {contact_name},</p>\n\n                    <p>This is to remind you that you have pending payment of {due_amount}. Kindly pay it as soon as possible.</p>\n\n                    <p>{business_logo}</p>', 'Dear {contact_name}, You have pending payment of {due_amount}. Kindly pay it as soon as possible. {business_name}', NULL, 'Payment Reminder, from {business_name}', NULL, NULL, 0, 0, 0, '2021-12-04 00:58:45', '2021-12-04 00:58:45'),
(14, 2, 'new_booking', '<p>Dear {contact_name},</p>\n\n                    <p>Your booking is confirmed</p>\n\n                    <p>Date: {start_time} to {end_time}</p>\n\n                    <p>Table: {table}</p>\n\n                    <p>Location: {location}</p>\n\n                    <p>{business_logo}</p>', 'Dear {contact_name}, Your booking is confirmed. Date: {start_time} to {end_time}, Table: {table}, Location: {location}', NULL, 'Booking Confirmed - {business_name}', NULL, NULL, 0, 0, 0, '2021-12-04 00:58:45', '2021-12-04 00:58:45'),
(15, 2, 'new_order', '<p>Dear {contact_name},</p>\n\n                    <p>We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'Dear {contact_name}, We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible. {business_name}', NULL, 'New Order, from {business_name}', NULL, NULL, 0, 0, 0, '2021-12-04 00:58:45', '2021-12-04 00:58:45'),
(16, 2, 'payment_paid', '<p>Dear {contact_name},</p>\n\n                    <p>We have paid amount {paid_amount} again invoice number {order_ref_number}.<br />\n                    Kindly note it down.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'We have paid amount {paid_amount} again invoice number {order_ref_number}.\n                    Kindly note it down. {business_name}', NULL, 'Payment Paid, from {business_name}', NULL, NULL, 0, 0, 0, '2021-12-04 00:58:45', '2021-12-04 00:58:45'),
(17, 2, 'items_received', '<p>Dear {contact_name},</p>\n\n                    <p>We have received all items from invoice reference number {order_ref_number}. Thank you for processing it.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'We have received all items from invoice reference number {order_ref_number}. Thank you for processing it. {business_name}', NULL, 'Items received, from {business_name}', NULL, NULL, 0, 0, 0, '2021-12-04 00:58:45', '2021-12-04 00:58:45'),
(18, 2, 'items_pending', '<p>Dear {contact_name},<br />\n                    This is to remind you that we have not yet received some items from invoice reference number {order_ref_number}. Please process it as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'This is to remind you that we have not yet received some items from invoice reference number {order_ref_number} . Please process it as soon as possible.{business_name}', NULL, 'Items Pending, from {business_name}', NULL, NULL, 0, 0, 0, '2021-12-04 00:58:45', '2021-12-04 00:58:45'),
(19, 2, 'new_quotation', '<p>Dear {contact_name},</p>\n\n                    <p>Your quotation number is {invoice_number}<br />\n                    Total amount: {total_amount}</p>\n\n                    <p>Thank you for shopping with us.</p>\n\n                    <p>{business_logo}</p>\n\n                    <p>&nbsp;</p>', 'Dear {contact_name}, Thank you for shopping with us. {business_name}', NULL, 'Thank you from {business_name}', NULL, NULL, 0, 0, 0, '2021-12-04 00:58:45', '2021-12-04 00:58:45'),
(20, 3, 'new_sale', '<p>Dear {contact_name},</p>\n\n                    <p>Your invoice number is {invoice_number}<br />\n                    Total amount: {total_amount}<br />\n                    Paid amount: {received_amount}</p>\n\n                    <p>Thank you for shopping with us.</p>\n\n                    <p>{business_logo}</p>\n\n                    <p>&nbsp;</p>', 'Dear {contact_name}, Thank you for shopping with us. {business_name}', NULL, 'Thank you from {business_name}', NULL, NULL, 0, 0, 0, '2022-02-01 06:06:44', '2022-02-01 06:06:44'),
(21, 3, 'payment_received', '<p>Dear {contact_name},</p>\n\n                <p>We have received a payment of {received_amount}</p>\n\n                <p>{business_logo}</p>', 'Dear {contact_name}, We have received a payment of {received_amount}. {business_name}', NULL, 'Payment Received, from {business_name}', NULL, NULL, 0, 0, 0, '2022-02-01 06:06:44', '2022-02-01 06:06:44'),
(22, 3, 'payment_reminder', '<p>Dear {contact_name},</p>\n\n                    <p>This is to remind you that you have pending payment of {due_amount}. Kindly pay it as soon as possible.</p>\n\n                    <p>{business_logo}</p>', 'Dear {contact_name}, You have pending payment of {due_amount}. Kindly pay it as soon as possible. {business_name}', NULL, 'Payment Reminder, from {business_name}', NULL, NULL, 0, 0, 0, '2022-02-01 06:06:44', '2022-02-01 06:06:44'),
(23, 3, 'new_booking', '<p>Dear {contact_name},</p>\n\n                    <p>Your booking is confirmed</p>\n\n                    <p>Date: {start_time} to {end_time}</p>\n\n                    <p>Table: {table}</p>\n\n                    <p>Location: {location}</p>\n\n                    <p>{business_logo}</p>', 'Dear {contact_name}, Your booking is confirmed. Date: {start_time} to {end_time}, Table: {table}, Location: {location}', NULL, 'Booking Confirmed - {business_name}', NULL, NULL, 0, 0, 0, '2022-02-01 06:06:44', '2022-02-01 06:06:44'),
(24, 3, 'new_order', '<p>Dear {contact_name},</p>\n\n                    <p>We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'Dear {contact_name}, We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible. {business_name}', NULL, 'New Order, from {business_name}', NULL, NULL, 0, 0, 0, '2022-02-01 06:06:44', '2022-02-01 06:06:44'),
(25, 3, 'payment_paid', '<p>Dear {contact_name},</p>\n\n                    <p>We have paid amount {paid_amount} again invoice number {order_ref_number}.<br />\n                    Kindly note it down.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'We have paid amount {paid_amount} again invoice number {order_ref_number}.\n                    Kindly note it down. {business_name}', NULL, 'Payment Paid, from {business_name}', NULL, NULL, 0, 0, 0, '2022-02-01 06:06:44', '2022-02-01 06:06:44'),
(26, 3, 'items_received', '<p>Dear {contact_name},</p>\n\n                    <p>We have received all items from invoice reference number {order_ref_number}. Thank you for processing it.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'We have received all items from invoice reference number {order_ref_number}. Thank you for processing it. {business_name}', NULL, 'Items received, from {business_name}', NULL, NULL, 0, 0, 0, '2022-02-01 06:06:44', '2022-02-01 06:06:44'),
(27, 3, 'items_pending', '<p>Dear {contact_name},<br />\n                    This is to remind you that we have not yet received some items from invoice reference number {order_ref_number}. Please process it as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'This is to remind you that we have not yet received some items from invoice reference number {order_ref_number} . Please process it as soon as possible.{business_name}', NULL, 'Items Pending, from {business_name}', NULL, NULL, 0, 0, 0, '2022-02-01 06:06:44', '2022-02-01 06:06:44'),
(28, 3, 'new_quotation', '<p>Dear {contact_name},</p>\n\n                    <p>Your quotation number is {invoice_number}<br />\n                    Total amount: {total_amount}</p>\n\n                    <p>Thank you for shopping with us.</p>\n\n                    <p>{business_logo}</p>\n\n                    <p>&nbsp;</p>', 'Dear {contact_name}, Thank you for shopping with us. {business_name}', NULL, 'Thank you from {business_name}', NULL, NULL, 0, 0, 0, '2022-02-01 06:06:44', '2022-02-01 06:06:44');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `location_count` int(11) NOT NULL COMMENT 'No. of Business Locations, 0 = infinite option.',
  `user_count` int(11) NOT NULL,
  `product_count` int(11) NOT NULL,
  `bookings` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Enable/Disable bookings',
  `kitchen` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Enable/Disable kitchen',
  `order_screen` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Enable/Disable order_screen',
  `tables` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Enable/Disable tables',
  `invoice_count` int(11) NOT NULL,
  `interval` enum('days','months','years') COLLATE utf8mb4_unicode_ci NOT NULL,
  `interval_count` int(11) NOT NULL,
  `trial_days` int(11) NOT NULL,
  `price` decimal(22,4) NOT NULL,
  `custom_permissions` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT '0',
  `is_one_time` tinyint(1) NOT NULL DEFAULT '0',
  `enable_custom_link` tinyint(1) NOT NULL DEFAULT '0',
  `custom_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_link_text` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `name`, `description`, `location_count`, `user_count`, `product_count`, `bookings`, `kitchen`, `order_screen`, `tables`, `invoice_count`, `interval`, `interval_count`, `trial_days`, `price`, `custom_permissions`, `created_by`, `sort_order`, `is_active`, `is_private`, `is_one_time`, `enable_custom_link`, `custom_link`, `custom_link_text`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Package A', 'Package A annual', 0, 0, 0, 0, 0, 0, 0, 0, 'years', 1, 3, 0.0000, '{\"essentials_module\":\"1\",\"repair_module\":\"1\",\"woocommerce_module\":\"1\"}', 1, 1, 1, 0, 1, 0, '', '', NULL, '2022-02-24 18:18:08', '2022-02-24 18:18:08'),
(2, 'paquete b', 'prueba del sistema', 0, 0, 0, 0, 0, 0, 0, 0, 'days', 10, 10, 0.0000, '{\"essentials_module\":\"1\",\"repair_module\":\"1\",\"woocommerce_module\":\"1\"}', 1, 1, 1, 1, 1, 0, '', '', NULL, '2022-02-28 16:58:55', '2022-02-28 17:00:39');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'profit_loss_report.view', 'web', '2021-09-08 08:48:40', NULL),
(2, 'direct_sell.access', 'web', '2021-09-08 08:48:40', NULL),
(3, 'product.opening_stock', 'web', '2021-09-08 08:48:40', '2021-09-08 08:48:40'),
(4, 'crud_all_bookings', 'web', '2021-09-08 08:48:40', '2021-09-08 08:48:40'),
(5, 'crud_own_bookings', 'web', '2021-09-08 08:48:40', '2021-09-08 08:48:40'),
(6, 'access_default_selling_price', 'web', '2021-09-08 08:48:41', '2021-09-08 08:48:41'),
(7, 'purchase.payments', 'web', '2021-09-08 08:48:41', '2021-09-08 08:48:41'),
(8, 'sell.payments', 'web', '2021-09-08 08:48:41', '2021-09-08 08:48:41'),
(9, 'edit_product_price_from_sale_screen', 'web', '2021-09-08 08:48:41', '2021-09-08 08:48:41'),
(10, 'edit_product_discount_from_sale_screen', 'web', '2021-09-08 08:48:41', '2021-09-08 08:48:41'),
(11, 'roles.view', 'web', '2021-09-08 08:48:41', '2021-09-08 08:48:41'),
(12, 'roles.create', 'web', '2021-09-08 08:48:41', '2021-09-08 08:48:41'),
(13, 'roles.update', 'web', '2021-09-08 08:48:41', '2021-09-08 08:48:41'),
(14, 'roles.delete', 'web', '2021-09-08 08:48:41', '2021-09-08 08:48:41'),
(15, 'account.access', 'web', '2021-09-08 08:48:41', '2021-09-08 08:48:41'),
(16, 'discount.access', 'web', '2021-09-08 08:48:41', '2021-09-08 08:48:41'),
(17, 'view_purchase_price', 'web', '2021-09-08 08:48:41', '2021-09-08 08:48:41'),
(18, 'view_own_sell_only', 'web', '2021-09-08 08:48:41', '2021-09-08 08:48:41'),
(19, 'edit_product_discount_from_pos_screen', 'web', '2021-09-08 08:48:41', '2021-09-08 08:48:41'),
(20, 'edit_product_price_from_pos_screen', 'web', '2021-09-08 08:48:41', '2021-09-08 08:48:41'),
(21, 'access_shipping', 'web', '2021-09-08 08:48:42', '2021-09-08 08:48:42'),
(22, 'purchase.update_status', 'web', '2021-09-08 08:48:42', '2021-09-08 08:48:42'),
(23, 'list_drafts', 'web', '2021-09-08 08:48:42', '2021-09-08 08:48:42'),
(24, 'list_quotations', 'web', '2021-09-08 08:48:42', '2021-09-08 08:48:42'),
(25, 'view_cash_register', 'web', '2021-09-08 08:48:42', '2021-09-08 08:48:42'),
(26, 'close_cash_register', 'web', '2021-09-08 08:48:42', '2021-09-08 08:48:42'),
(27, 'print_invoice', 'web', '2021-09-08 08:48:43', '2021-09-08 08:48:43'),
(28, 'user.view', 'web', '2021-09-08 08:48:43', NULL),
(29, 'user.create', 'web', '2021-09-08 08:48:43', NULL),
(30, 'user.update', 'web', '2021-09-08 08:48:43', NULL),
(31, 'user.delete', 'web', '2021-09-08 08:48:43', NULL),
(32, 'supplier.view', 'web', '2021-09-08 08:48:43', NULL),
(33, 'supplier.create', 'web', '2021-09-08 08:48:43', NULL),
(34, 'supplier.update', 'web', '2021-09-08 08:48:43', NULL),
(35, 'supplier.delete', 'web', '2021-09-08 08:48:43', NULL),
(36, 'customer.view', 'web', '2021-09-08 08:48:43', NULL),
(37, 'customer.create', 'web', '2021-09-08 08:48:43', NULL),
(38, 'customer.update', 'web', '2021-09-08 08:48:43', NULL),
(39, 'customer.delete', 'web', '2021-09-08 08:48:43', NULL),
(40, 'product.view', 'web', '2021-09-08 08:48:43', NULL),
(41, 'product.create', 'web', '2021-09-08 08:48:43', NULL),
(42, 'product.update', 'web', '2021-09-08 08:48:43', NULL),
(43, 'product.delete', 'web', '2021-09-08 08:48:43', NULL),
(44, 'purchase.view', 'web', '2021-09-08 08:48:43', NULL),
(45, 'purchase.create', 'web', '2021-09-08 08:48:43', NULL),
(46, 'purchase.update', 'web', '2021-09-08 08:48:43', NULL),
(47, 'purchase.delete', 'web', '2021-09-08 08:48:43', NULL),
(48, 'sell.view', 'web', '2021-09-08 08:48:43', NULL),
(49, 'sell.create', 'web', '2021-09-08 08:48:43', NULL),
(50, 'sell.update', 'web', '2021-09-08 08:48:43', NULL),
(51, 'sell.delete', 'web', '2021-09-08 08:48:43', NULL),
(52, 'purchase_n_sell_report.view', 'web', '2021-09-08 08:48:43', NULL),
(53, 'contacts_report.view', 'web', '2021-09-08 08:48:43', NULL),
(54, 'stock_report.view', 'web', '2021-09-08 08:48:43', NULL),
(55, 'tax_report.view', 'web', '2021-09-08 08:48:43', NULL),
(56, 'trending_product_report.view', 'web', '2021-09-08 08:48:43', NULL),
(57, 'register_report.view', 'web', '2021-09-08 08:48:43', NULL),
(58, 'sales_representative.view', 'web', '2021-09-08 08:48:43', NULL),
(59, 'expense_report.view', 'web', '2021-09-08 08:48:43', NULL),
(60, 'business_settings.access', 'web', '2021-09-08 08:48:43', NULL),
(61, 'barcode_settings.access', 'web', '2021-09-08 08:48:43', NULL),
(62, 'invoice_settings.access', 'web', '2021-09-08 08:48:43', NULL),
(63, 'brand.view', 'web', '2021-09-08 08:48:43', NULL),
(64, 'brand.create', 'web', '2021-09-08 08:48:43', NULL),
(65, 'brand.update', 'web', '2021-09-08 08:48:43', NULL),
(66, 'brand.delete', 'web', '2021-09-08 08:48:43', NULL),
(67, 'tax_rate.view', 'web', '2021-09-08 08:48:43', NULL),
(68, 'tax_rate.create', 'web', '2021-09-08 08:48:43', NULL),
(69, 'tax_rate.update', 'web', '2021-09-08 08:48:43', NULL),
(70, 'tax_rate.delete', 'web', '2021-09-08 08:48:43', NULL),
(71, 'unit.view', 'web', '2021-09-08 08:48:43', NULL),
(72, 'unit.create', 'web', '2021-09-08 08:48:43', NULL),
(73, 'unit.update', 'web', '2021-09-08 08:48:43', NULL),
(74, 'unit.delete', 'web', '2021-09-08 08:48:43', NULL),
(75, 'category.view', 'web', '2021-09-08 08:48:43', NULL),
(76, 'category.create', 'web', '2021-09-08 08:48:43', NULL),
(77, 'category.update', 'web', '2021-09-08 08:48:43', NULL),
(78, 'category.delete', 'web', '2021-09-08 08:48:43', NULL),
(79, 'expense.access', 'web', '2021-09-08 08:48:43', NULL),
(80, 'access_all_locations', 'web', '2021-09-08 08:48:43', NULL),
(81, 'dashboard.data', 'web', '2021-09-08 08:48:43', NULL),
(82, 'location.1', 'web', '2021-09-08 08:52:16', '2021-09-08 08:52:16'),
(83, 'essentials.create_message', 'web', '2021-09-08 09:11:32', '2021-09-08 09:11:32'),
(84, 'essentials.view_message', 'web', '2021-09-08 09:11:32', '2021-09-08 09:11:32'),
(85, 'essentials.approve_leave', 'web', '2021-09-08 09:11:32', '2021-09-08 09:11:32'),
(86, 'essentials.assign_todos', 'web', '2021-09-08 09:11:32', '2021-09-08 09:11:32'),
(87, 'essentials.add_allowance_and_deduction', 'web', '2021-09-08 09:11:32', '2021-09-08 09:11:32'),
(88, 'woocommerce.syc_categories', 'web', '2021-09-08 09:11:39', '2021-09-08 09:11:39'),
(89, 'woocommerce.sync_products', 'web', '2021-09-08 09:11:39', '2021-09-08 09:11:39'),
(90, 'woocommerce.sync_orders', 'web', '2021-09-08 09:11:39', '2021-09-08 09:11:39'),
(91, 'woocommerce.map_tax_rates', 'web', '2021-09-08 09:11:39', '2021-09-08 09:11:39'),
(92, 'woocommerce.access_woocommerce_api_settings', 'web', '2021-09-08 09:11:39', '2021-09-08 09:11:39'),
(93, 'repair.create', 'web', '2021-09-08 09:12:37', '2021-09-08 09:12:37'),
(94, 'repair.update', 'web', '2021-09-08 09:12:37', '2021-09-08 09:12:37'),
(95, 'repair.view', 'web', '2021-09-08 09:12:37', '2021-09-08 09:12:37'),
(96, 'repair.delete', 'web', '2021-09-08 09:12:37', '2021-09-08 09:12:37'),
(97, 'repair_status.update', 'web', '2021-09-08 09:12:37', '2021-09-08 09:12:37'),
(98, 'repair_status.access', 'web', '2021-09-08 09:12:37', '2021-09-08 09:12:37'),
(99, 'location.2', 'web', '2021-09-21 01:42:33', '2021-09-21 01:42:33'),
(100, 'location.3', 'web', '2021-10-20 16:18:59', '2021-10-20 16:18:59'),
(101, 'purchase_order.create', 'web', '2021-10-25 14:26:12', '2021-10-25 14:26:12'),
(102, 'purchase_order.update', 'web', '2021-10-25 14:26:14', '2021-10-25 14:26:14'),
(103, 'purchase_order.delete', 'web', '2021-10-25 14:26:14', '2021-10-25 14:26:14'),
(104, 'direct_sell.update', 'web', '2021-10-25 14:26:14', '2021-10-25 14:26:14'),
(105, 'direct_sell.delete', 'web', '2021-10-25 14:26:14', '2021-10-25 14:26:14'),
(106, 'access_types_of_service', 'web', '2021-10-25 14:26:14', '2021-10-25 14:26:14'),
(107, 'draft.update', 'web', '2021-10-25 14:26:14', '2021-10-25 14:26:14'),
(108, 'quotation.update', 'web', '2021-10-25 14:26:14', '2021-10-25 14:26:14'),
(109, 'quotation.delete', 'web', '2021-10-25 14:26:14', '2021-10-25 14:26:14'),
(110, 'access_pending_shipments_only', 'web', '2021-10-25 14:26:14', '2021-10-25 14:26:14'),
(111, 'access_commission_agent_shipping', 'web', '2021-10-25 14:26:14', '2021-10-25 14:26:14'),
(112, 'view_product_stock_value', 'web', '2021-10-25 14:26:14', '2021-10-25 14:26:14'),
(113, 'access_printers', 'web', '2021-10-25 14:26:14', '2021-10-25 14:26:14'),
(114, 'supplier.view_own', 'web', '2021-10-25 14:26:14', '2021-10-25 14:26:14'),
(115, 'customer.view_own', 'web', '2021-10-25 14:26:14', '2021-10-25 14:26:14'),
(116, 'customer_with_no_sell_one_year', 'web', '2021-10-25 14:26:14', '2021-10-25 14:26:14'),
(117, 'view_own_purchase', 'web', '2021-10-25 14:26:14', '2021-10-25 14:26:14'),
(118, 'purchase_order.view_own', 'web', '2021-10-25 14:26:14', '2021-10-25 14:26:14'),
(119, 'quotation.view_own', 'web', '2021-10-25 14:26:18', '2021-10-25 14:26:18'),
(120, 'access_own_shipping', 'web', '2021-10-25 14:26:18', '2021-10-25 14:26:18'),
(121, 'view_paid_sells_only', 'web', '2021-10-27 15:45:02', '2021-10-27 15:45:02'),
(122, 'view_due_sells_only', 'web', '2021-10-27 15:45:02', '2021-10-27 15:45:02'),
(123, 'view_partial_sells_only', 'web', '2021-10-27 15:45:02', '2021-10-27 15:45:02'),
(124, 'view_overdue_sells_only', 'web', '2021-10-27 15:45:04', '2021-10-27 15:45:04'),
(125, 'view_commission_agent_sell', 'web', '2021-10-27 15:45:04', '2021-10-27 15:45:04'),
(126, 'access_sell_return', 'web', '2021-10-27 15:45:04', '2021-10-27 15:45:04'),
(127, 'access_own_sell_return', 'web', '2021-10-27 15:45:04', '2021-10-27 15:45:04'),
(128, 'edit_invoice_number', 'web', '2021-10-27 15:45:04', '2021-10-27 15:45:04'),
(129, 'draft.delete', 'web', '2021-10-27 15:45:04', '2021-10-27 15:45:04'),
(130, 'expense.add', 'web', '2021-10-27 15:45:04', '2021-10-27 15:45:04'),
(131, 'purchase_order.view_all', 'web', '2021-10-27 15:45:04', '2021-10-27 15:45:04'),
(132, 'direct_sell.view', 'web', '2021-10-27 15:45:04', '2021-10-27 15:45:04'),
(133, 'draft.view_all', 'web', '2021-10-27 15:45:04', '2021-10-27 15:45:04'),
(134, 'quotation.view_all', 'web', '2021-10-27 15:45:04', '2021-10-27 15:45:04'),
(135, 'location.4', 'web', '2021-12-04 00:58:45', '2021-12-04 00:58:45'),
(136, 'location.5', 'web', '2022-02-01 06:06:45', '2022-02-01 06:06:45'),
(137, 'expense.edit', 'web', '2022-02-28 09:58:45', '2022-02-28 09:58:45'),
(138, 'expense.delete', 'web', '2022-02-28 09:58:45', '2022-02-28 09:58:45'),
(139, 'access_tables', 'web', '2022-02-28 09:58:45', '2022-02-28 09:58:45'),
(140, 'essentials.crud_leave_type', 'web', '2022-02-28 09:58:45', '2022-02-28 09:58:45'),
(141, 'essentials.crud_all_leave', 'web', '2022-02-28 09:58:45', '2022-02-28 09:58:45'),
(142, 'essentials.crud_own_leave', 'web', '2022-02-28 09:58:46', '2022-02-28 09:58:46'),
(143, 'essentials.crud_all_attendance', 'web', '2022-02-28 09:58:46', '2022-02-28 09:58:46'),
(144, 'essentials.view_own_attendance', 'web', '2022-02-28 09:58:46', '2022-02-28 09:58:46'),
(145, 'essentials.allow_users_for_attendance_from_web', 'web', '2022-02-28 09:58:46', '2022-02-28 09:58:46'),
(146, 'essentials.allow_users_for_attendance_from_api', 'web', '2022-02-28 09:58:46', '2022-02-28 09:58:46'),
(147, 'essentials.view_allowance_and_deduction', 'web', '2022-02-28 09:58:46', '2022-02-28 09:58:46'),
(148, 'essentials.crud_department', 'web', '2022-02-28 09:58:46', '2022-02-28 09:58:46'),
(149, 'essentials.crud_designation', 'web', '2022-02-28 09:58:46', '2022-02-28 09:58:46'),
(150, 'job_sheet.create', 'web', '2022-02-28 09:58:46', '2022-02-28 09:58:46'),
(151, 'job_sheet.edit', 'web', '2022-02-28 09:58:49', '2022-02-28 09:58:49'),
(152, 'job_sheet.delete', 'web', '2022-02-28 09:58:49', '2022-02-28 09:58:49'),
(153, 'job_sheet.view_assigned', 'web', '2022-02-28 09:58:49', '2022-02-28 09:58:49'),
(154, 'job_sheet.view_all', 'web', '2022-02-28 09:58:49', '2022-02-28 09:58:49'),
(155, 'superadmin.access_package_subscriptions', 'web', '2022-02-28 09:58:49', '2022-02-28 09:58:49'),
(156, 'draft.view_own', 'web', '2022-02-28 09:58:49', '2022-02-28 09:58:49'),
(157, 'view_own_expense', 'web', '2022-02-28 09:58:49', '2022-02-28 09:58:49'),
(158, 'selling_price_group.1', 'web', '2022-03-03 00:32:41', '2022-03-03 00:32:41');

-- --------------------------------------------------------

--
-- Table structure for table `printers`
--

CREATE TABLE `printers` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection_type` enum('network','windows','linux') COLLATE utf8mb4_unicode_ci NOT NULL,
  `capability_profile` enum('default','simple','SP2000','TEP-200M','P822D') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `char_per_line` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `port` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `type` enum('single','variable','modifier','combo') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_id` int(11) UNSIGNED DEFAULT NULL,
  `sub_unit_ids` text COLLATE utf8mb4_unicode_ci,
  `brand_id` int(10) UNSIGNED DEFAULT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `sub_category_id` int(10) UNSIGNED DEFAULT NULL,
  `tax` int(10) UNSIGNED DEFAULT NULL,
  `tax_type` enum('inclusive','exclusive') COLLATE utf8mb4_unicode_ci NOT NULL,
  `enable_stock` tinyint(1) NOT NULL DEFAULT '0',
  `alert_quantity` decimal(22,4) DEFAULT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `barcode_type` enum('C39','C128','EAN13','EAN8','UPCA','UPCE') COLLATE utf8mb4_unicode_ci DEFAULT 'C128',
  `expiry_period` decimal(4,2) DEFAULT NULL,
  `expiry_period_type` enum('days','months') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enable_sr_no` tinyint(1) NOT NULL DEFAULT '0',
  `weight` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_custom_field1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_custom_field2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_custom_field3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_custom_field4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `woocommerce_media_id` int(11) DEFAULT NULL,
  `product_description` text COLLATE utf8mb4_unicode_ci,
  `created_by` int(10) UNSIGNED NOT NULL,
  `woocommerce_product_id` int(11) DEFAULT NULL,
  `woocommerce_disable_sync` tinyint(1) NOT NULL DEFAULT '0',
  `warranty_id` int(11) DEFAULT NULL,
  `is_inactive` tinyint(1) NOT NULL DEFAULT '0',
  `repair_model_id` int(10) UNSIGNED DEFAULT NULL,
  `not_for_selling` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_locations`
--

CREATE TABLE `product_locations` (
  `product_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_locations`
--

INSERT INTO `product_locations` (`product_id`, `location_id`) VALUES
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 5),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(43, 1),
(45, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_racks`
--

CREATE TABLE `product_racks` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `rack` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `row` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_variations`
--

CREATE TABLE `product_variations` (
  `id` int(10) UNSIGNED NOT NULL,
  `variation_template_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `is_dummy` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_lines`
--

CREATE TABLE `purchase_lines` (
  `id` int(10) UNSIGNED NOT NULL,
  `transaction_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `variation_id` int(10) UNSIGNED NOT NULL,
  `quantity` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `pp_without_discount` decimal(22,4) NOT NULL DEFAULT '0.0000' COMMENT 'Purchase price before inline discounts',
  `discount_percent` decimal(5,2) NOT NULL DEFAULT '0.00' COMMENT 'Inline discount percentage',
  `purchase_price` decimal(22,4) NOT NULL,
  `purchase_price_inc_tax` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `item_tax` decimal(22,4) NOT NULL COMMENT 'Tax for one quantity',
  `tax_id` int(10) UNSIGNED DEFAULT NULL,
  `purchase_order_line_id` int(11) DEFAULT NULL,
  `quantity_sold` decimal(22,4) NOT NULL DEFAULT '0.0000' COMMENT 'Quanity sold from this purchase line',
  `quantity_adjusted` decimal(22,4) NOT NULL DEFAULT '0.0000' COMMENT 'Quanity adjusted in stock adjustment from this purchase line',
  `quantity_returned` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `po_quantity_purchased` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `mfg_quantity_used` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `mfg_date` date DEFAULT NULL,
  `exp_date` date DEFAULT NULL,
  `lot_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_unit_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reference_counts`
--

CREATE TABLE `reference_counts` (
  `id` int(10) UNSIGNED NOT NULL,
  `ref_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ref_count` int(11) NOT NULL,
  `business_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reference_counts`
--

INSERT INTO `reference_counts` (`id`, `ref_type`, `ref_count`, `business_id`, `created_at`, `updated_at`) VALUES
(1, 'contacts', 45, 1, '2021-09-08 08:52:16', '2022-03-16 00:07:54'),
(2, 'business_location', 6, 1, '2021-09-08 08:52:16', '2022-01-22 00:57:45'),
(3, 'purchase', 7, 1, '2021-09-08 09:25:46', '2022-03-15 18:03:36'),
(4, 'subscription', 2, 1, '2021-09-08 13:21:48', '2022-02-04 17:56:44'),
(5, 'sell_payment', 121, 1, '2021-09-08 13:21:48', '2022-03-25 22:39:58'),
(6, 'draft', 32, 1, '2021-09-21 01:11:50', '2022-03-24 21:01:15'),
(7, 'purchase_order', 3, 1, '2021-10-25 14:29:14', '2022-02-09 22:58:45'),
(8, 'essentials_todos', 4, 1, '2021-10-27 16:06:10', '2021-12-04 16:21:51'),
(9, 'stock_adjustment', 8, 1, '2021-11-14 02:23:27', '2021-12-14 17:07:25'),
(10, 'purchase_return', 1, 1, '2021-11-26 00:13:51', '2021-11-26 00:13:51'),
(11, 'contacts', 1, 2, '2021-12-04 00:58:45', '2021-12-04 00:58:45'),
(12, 'business_location', 1, 2, '2021-12-04 00:58:45', '2021-12-04 00:58:45'),
(13, 'job_sheet', 3, 1, '2022-01-22 01:57:35', '2022-02-28 11:24:13'),
(14, 'contacts', 1, 3, '2022-02-01 06:06:44', '2022-02-01 06:06:44'),
(15, 'business_location', 1, 3, '2022-02-01 06:06:44', '2022-02-01 06:06:44'),
(16, 'essentials_todos', 1, 3, '2022-02-01 01:21:54', '2022-02-01 01:21:54'),
(17, 'purchase_payment', 2, 1, '2022-02-07 03:45:47', '2022-02-18 00:35:15'),
(18, 'payroll', 1, 1, '2022-02-18 00:34:29', '2022-02-18 00:34:29');

-- --------------------------------------------------------

--
-- Table structure for table `repair_device_models`
--

CREATE TABLE `repair_device_models` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `repair_checklist` text COLLATE utf8mb4_unicode_ci,
  `brand_id` int(10) UNSIGNED DEFAULT NULL,
  `device_id` int(10) UNSIGNED DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `repair_device_models`
--

INSERT INTO `repair_device_models` (`id`, `business_id`, `name`, `repair_checklist`, `brand_id`, `device_id`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 1, 'j5 2015', NULL, NULL, 19, 1, '2022-02-28 10:06:54', '2022-02-28 10:06:54'),
(2, 1, 'mate 20 lite', NULL, 2, 19, 1, '2022-02-28 10:07:30', '2022-02-28 10:07:30'),
(3, 1, 'tab 2', NULL, 1, 20, 1, '2022-02-28 10:08:32', '2022-02-28 10:08:32'),
(4, 1, 'p30', NULL, 2, 19, 1, '2022-02-28 11:32:55', '2022-02-28 11:33:09');

-- --------------------------------------------------------

--
-- Table structure for table `repair_job_sheets`
--

CREATE TABLE `repair_job_sheets` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED DEFAULT NULL,
  `contact_id` int(10) UNSIGNED NOT NULL,
  `job_sheet_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `service_type` enum('carry_in','pick_up','on_site') COLLATE utf8mb4_unicode_ci NOT NULL,
  `pick_up_on_site_addr` text COLLATE utf8mb4_unicode_ci,
  `brand_id` int(10) UNSIGNED DEFAULT NULL,
  `device_id` int(10) UNSIGNED DEFAULT NULL,
  `device_model_id` int(10) UNSIGNED DEFAULT NULL,
  `checklist` text COLLATE utf8mb4_unicode_ci,
  `security_pwd` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `security_pattern` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `serial_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_id` int(11) NOT NULL,
  `delivery_date` datetime DEFAULT NULL,
  `product_configuration` text COLLATE utf8mb4_unicode_ci,
  `defects` text COLLATE utf8mb4_unicode_ci,
  `product_condition` text COLLATE utf8mb4_unicode_ci,
  `service_staff` int(10) UNSIGNED DEFAULT NULL,
  `comment_by_ss` text COLLATE utf8mb4_unicode_ci COMMENT 'comment made by technician',
  `estimated_cost` decimal(22,4) DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `custom_field_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_5` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `repair_job_sheets`
--

INSERT INTO `repair_job_sheets` (`id`, `business_id`, `location_id`, `contact_id`, `job_sheet_no`, `service_type`, `pick_up_on_site_addr`, `brand_id`, `device_id`, `device_model_id`, `checklist`, `security_pwd`, `security_pattern`, `serial_no`, `status_id`, `delivery_date`, `product_configuration`, `defects`, `product_condition`, `service_staff`, `comment_by_ss`, `estimated_cost`, `created_by`, `custom_field_1`, `custom_field_2`, `custom_field_3`, `custom_field_4`, `custom_field_5`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 33, '2022/0001', 'carry_in', NULL, 2, NULL, NULL, NULL, NULL, NULL, '1412412', 0, '2022-01-21 18:57:00', NULL, NULL, NULL, NULL, NULL, 1000.0000, 1, NULL, NULL, NULL, NULL, NULL, '2022-01-22 01:57:35', '2022-01-22 01:57:35'),
(2, 1, 1, 22, '2022/0002', 'pick_up', 'Pick up/On site address', 1, NULL, NULL, NULL, NULL, NULL, '14124121', 2, '2022-01-22 18:59:00', NULL, NULL, NULL, NULL, NULL, 1000.0000, 1, NULL, NULL, NULL, NULL, NULL, '2022-01-22 01:59:43', '2022-02-26 16:33:22'),
(3, 1, 1, 43, '2022/0003', 'carry_in', NULL, 1, 19, NULL, NULL, '1234456', '74256983', '028028726262', 3, '2022-03-09 04:19:00', '[{\"value\":\"sin chip\"},{\"value\":\"sn estuche\"}]', '[{\"value\":\"norteo carga\"},{\"value\":\"hgaus\"},{\"value\":\"gramogaus\"}]', '[{\"value\":\"Bicel danado\"},{\"value\":\"mica con burbujas yysvshs\"},{\"value\":\"hsvdvdhd\"},{\"value\":\"Bugdy\"}]', NULL, 'batería', 45.0000, 1, NULL, NULL, NULL, NULL, NULL, '2022-02-28 11:24:13', '2022-03-05 02:58:57');

-- --------------------------------------------------------

--
-- Table structure for table `repair_statuses`
--

CREATE TABLE `repair_statuses` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `business_id` int(11) NOT NULL,
  `is_completed_status` tinyint(1) NOT NULL DEFAULT '0',
  `sms_template` text COLLATE utf8mb4_unicode_ci,
  `email_subject` text COLLATE utf8mb4_unicode_ci,
  `email_body` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `repair_statuses`
--

INSERT INTO `repair_statuses` (`id`, `name`, `color`, `sort_order`, `business_id`, `is_completed_status`, `sms_template`, `email_subject`, `email_body`, `created_at`, `updated_at`) VALUES
(1, 'Pending', '#000000', 1, 1, 0, NULL, NULL, NULL, '2022-01-22 01:58:43', '2022-01-22 01:58:43'),
(2, 'Completed', '#000000', 3, 1, 1, NULL, NULL, NULL, '2022-01-22 01:58:58', '2022-02-28 11:30:35'),
(3, 'en proceso', '#7fe77b', 2, 1, 0, 'Hola estimad@ cliente, su equipo ingresó al proceso de reparación', 'Proceso de reparación', NULL, '2022-02-28 11:30:01', '2022-02-28 11:30:25');

-- --------------------------------------------------------

--
-- Table structure for table `res_product_modifier_sets`
--

CREATE TABLE `res_product_modifier_sets` (
  `modifier_set_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL COMMENT 'Table use to store the modifier sets applicable for a product'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `res_tables`
--

CREATE TABLE `res_tables` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_by` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `is_service_staff` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `business_id`, `is_default`, `is_service_staff`, `created_at`, `updated_at`) VALUES
(1, 'Admin#1', 'web', 1, 1, 0, '2021-09-08 08:52:16', '2021-09-08 08:52:16'),
(4, 'Admin#2', 'web', 2, 1, 0, '2021-12-04 00:58:45', '2021-12-04 00:58:45'),
(5, 'Cashier#2', 'web', 2, 0, 0, '2021-12-04 00:58:45', '2021-12-04 00:58:45'),
(6, 'INAM UR REHMAN#2', 'web', 2, 0, 0, '2021-12-03 22:07:26', '2021-12-03 22:07:26'),
(7, 'kashif butt#2', 'web', 2, 0, 0, '2021-12-03 22:11:55', '2021-12-03 22:11:55'),
(10, 'Admin#3', 'web', 3, 1, 0, '2022-02-01 06:06:44', '2022-02-01 06:06:44'),
(11, 'Cashier#3', 'web', 3, 0, 0, '2022-02-01 06:06:44', '2022-02-01 06:06:44'),
(12, 'supervisor#1', 'web', 1, 0, 0, '2022-02-28 09:58:45', '2022-02-28 10:56:40');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(25, 5),
(26, 5),
(48, 5),
(49, 5),
(50, 5),
(51, 5),
(6, 6),
(81, 6),
(1, 7),
(6, 7),
(11, 7),
(12, 7),
(13, 7),
(14, 7),
(28, 7),
(29, 7),
(30, 7),
(31, 7),
(54, 7),
(57, 7),
(58, 7),
(60, 7),
(61, 7),
(62, 7),
(81, 7),
(112, 7),
(113, 7),
(25, 11),
(26, 11),
(48, 11),
(49, 11),
(50, 11),
(51, 11),
(80, 11),
(11, 12),
(12, 12),
(13, 12),
(14, 12),
(28, 12),
(29, 12),
(30, 12),
(31, 12);

-- --------------------------------------------------------

--
-- Table structure for table `selling_price_groups`
--

CREATE TABLE `selling_price_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `business_id` int(10) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `selling_price_groups`
--

INSERT INTO `selling_price_groups` (`id`, `name`, `description`, `business_id`, `is_active`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'estudiantes', 'alumnos de KStech Academy', 1, 1, NULL, '2022-03-03 00:32:41', '2022-03-03 00:32:41');

-- --------------------------------------------------------

--
-- Table structure for table `sell_line_warranties`
--

CREATE TABLE `sell_line_warranties` (
  `sell_line_id` int(11) NOT NULL,
  `warranty_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sell_line_warranties`
--

INSERT INTO `sell_line_warranties` (`sell_line_id`, `warranty_id`) VALUES
(40, 1),
(132, 1),
(134, 1),
(136, 1),
(138, 1),
(140, 1),
(145, 1),
(146, 1),
(150, 1),
(155, 1),
(159, 1),
(160, 1),
(161, 1),
(162, 1),
(164, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_adjustments_temp`
--

CREATE TABLE `stock_adjustments_temp` (
  `id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `stock_adjustment_lines`
--

CREATE TABLE `stock_adjustment_lines` (
  `id` int(10) UNSIGNED NOT NULL,
  `transaction_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `variation_id` int(10) UNSIGNED NOT NULL,
  `quantity` decimal(22,4) NOT NULL,
  `unit_price` decimal(22,4) DEFAULT NULL COMMENT 'Last purchase unit price',
  `removed_purchase_line` int(11) DEFAULT NULL,
  `lot_no_line_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `package_id` int(10) UNSIGNED NOT NULL,
  `start_date` date DEFAULT NULL,
  `trial_end_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `package_price` decimal(22,4) NOT NULL,
  `package_details` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_id` int(10) UNSIGNED NOT NULL,
  `paid_via` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_transaction_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('approved','waiting','declined') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'waiting',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `business_id`, `package_id`, `start_date`, `trial_end_date`, `end_date`, `package_price`, `package_details`, `created_id`, `paid_via`, `payment_transaction_id`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2022-02-24', '2023-02-27', '2023-02-24', 0.0000, '{\"location_count\":\"0\",\"user_count\":\"0\",\"product_count\":\"0\",\"invoice_count\":\"0\",\"name\":\"Package A\",\"essentials_module\":\"1\",\"repair_module\":\"1\",\"woocommerce_module\":\"1\"}', 1, NULL, 'FREE', 'approved', NULL, '2022-02-24 14:07:03', '2022-02-24 14:07:03');

-- --------------------------------------------------------

--
-- Table structure for table `superadmin_communicator_logs`
--

CREATE TABLE `superadmin_communicator_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_ids` text COLLATE utf8mb4_unicode_ci,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `superadmin_frontend_pages`
--

CREATE TABLE `superadmin_frontend_pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_shown` tinyint(1) NOT NULL,
  `menu_order` int(11) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `system`
--

CREATE TABLE `system` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `system`
--

INSERT INTO `system` (`id`, `key`, `value`) VALUES
(1, 'db_version', '4.4'),
(2, 'default_business_active_status', '1'),
(3, 'essentials_version', '3.0'),
(4, 'woocommerce_version', '2.5'),
(6, 'superadmin_version', '2.8'),
(7, 'app_currency_id', '2'),
(8, 'invoice_business_name', 'Online Offline POS'),
(9, 'invoice_business_landmark', 'Landmark'),
(10, 'invoice_business_zip', 'Zip'),
(11, 'invoice_business_state', 'State'),
(12, 'invoice_business_city', 'City'),
(13, 'invoice_business_country', 'Country'),
(14, 'email', 'superadmin@example.com'),
(15, 'package_expiry_alert_days', '5'),
(16, 'enable_business_based_username', '0');

-- --------------------------------------------------------

--
-- Table structure for table `tax_rates`
--

CREATE TABLE `tax_rates` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(22,4) NOT NULL,
  `is_tax_group` tinyint(1) NOT NULL DEFAULT '0',
  `for_tax_group` tinyint(1) NOT NULL DEFAULT '0',
  `created_by` int(10) UNSIGNED NOT NULL,
  `woocommerce_tax_rate_id` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tax_rates`
--

INSERT INTO `tax_rates` (`id`, `business_id`, `name`, `amount`, `is_tax_group`, `for_tax_group`, `created_by`, `woocommerce_tax_rate_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'VAT', 10.0000, 0, 0, 1, NULL, '2022-02-04 18:00:25', '2021-09-27 06:59:20', '2022-02-04 18:00:25'),
(2, 1, 'MARGINAL', 16.0000, 0, 0, 1, NULL, '2021-12-25 21:01:50', '2021-12-05 06:28:09', '2021-12-25 21:01:50'),
(3, 1, 'Product Levy', 2.5000, 0, 0, 1, NULL, '2022-02-04 18:00:23', '2021-12-25 21:01:29', '2022-02-04 18:00:23');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED DEFAULT NULL,
  `res_table_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'fields to restaurant module',
  `res_waiter_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'fields to restaurant module',
  `res_order_status` enum('received','cooked','served') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_quotation` tinyint(1) NOT NULL DEFAULT '0',
  `payment_status` enum('paid','due','partial') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adjustment_type` enum('normal','abnormal') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_id` int(11) UNSIGNED DEFAULT NULL,
  `customer_group_id` int(11) DEFAULT NULL COMMENT 'used to add customer group while selling',
  `invoice_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subscription_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subscription_repeat_on` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_date` datetime NOT NULL,
  `total_before_tax` decimal(22,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total before the purchase/invoice tax, this includeds the indivisual product tax',
  `tax_id` int(10) UNSIGNED DEFAULT NULL,
  `tax_amount` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `discount_type` enum('fixed','percentage') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(22,4) DEFAULT '0.0000',
  `rp_redeemed` int(11) NOT NULL DEFAULT '0' COMMENT 'rp is the short form of reward points',
  `rp_redeemed_amount` decimal(22,4) NOT NULL DEFAULT '0.0000' COMMENT 'rp is the short form of reward points',
  `shipping_details` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_address` text COLLATE utf8mb4_unicode_ci,
  `shipping_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivered_to` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_charges` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `shipping_custom_field_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_custom_field_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_custom_field_3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_custom_field_4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_custom_field_5` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional_notes` text COLLATE utf8mb4_unicode_ci,
  `staff_note` text COLLATE utf8mb4_unicode_ci,
  `is_export` tinyint(1) NOT NULL DEFAULT '0',
  `export_custom_fields_info` longtext COLLATE utf8mb4_unicode_ci,
  `round_off_amount` decimal(22,4) NOT NULL DEFAULT '0.0000' COMMENT 'Difference of rounded total and actual total',
  `additional_expense_key_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional_expense_value_1` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `additional_expense_key_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional_expense_value_2` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `additional_expense_key_3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional_expense_value_3` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `additional_expense_key_4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional_expense_value_4` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `final_total` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `expense_category_id` int(10) UNSIGNED DEFAULT NULL,
  `expense_for` int(10) UNSIGNED DEFAULT NULL,
  `commission_agent` int(11) DEFAULT NULL,
  `document` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_direct_sale` tinyint(1) NOT NULL DEFAULT '0',
  `is_suspend` tinyint(1) NOT NULL DEFAULT '0',
  `exchange_rate` decimal(20,3) NOT NULL DEFAULT '1.000',
  `total_amount_recovered` decimal(22,4) DEFAULT NULL COMMENT 'Used for stock adjustment.',
  `transfer_parent_id` int(11) DEFAULT NULL,
  `return_parent_id` int(11) DEFAULT NULL,
  `opening_stock_product_id` int(11) DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `repair_completed_on` datetime DEFAULT NULL,
  `repair_warranty_id` int(11) DEFAULT NULL,
  `repair_brand_id` int(11) DEFAULT NULL,
  `repair_status_id` int(11) DEFAULT NULL,
  `repair_model_id` int(11) DEFAULT NULL,
  `repair_job_sheet_id` int(10) UNSIGNED DEFAULT NULL,
  `repair_defects` text COLLATE utf8mb4_unicode_ci,
  `repair_serial_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `repair_checklist` text COLLATE utf8mb4_unicode_ci,
  `repair_security_pwd` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `repair_security_pattern` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `repair_due_date` datetime DEFAULT NULL,
  `repair_device_id` int(11) DEFAULT NULL,
  `repair_updates_notif` tinyint(1) NOT NULL DEFAULT '0',
  `woocommerce_order_id` int(11) DEFAULT NULL,
  `essentials_duration` decimal(8,2) NOT NULL,
  `essentials_duration_unit` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `essentials_amount_per_unit_duration` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `essentials_allowances` text COLLATE utf8mb4_unicode_ci,
  `essentials_deductions` text COLLATE utf8mb4_unicode_ci,
  `prefer_payment_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prefer_payment_account` int(11) DEFAULT NULL,
  `sales_order_ids` text COLLATE utf8mb4_unicode_ci,
  `purchase_order_ids` text COLLATE utf8mb4_unicode_ci,
  `custom_field_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `import_batch` int(11) DEFAULT NULL,
  `import_time` datetime DEFAULT NULL,
  `types_of_service_id` int(11) DEFAULT NULL,
  `packing_charge` decimal(22,4) DEFAULT NULL,
  `packing_charge_type` enum('fixed','percent') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `service_custom_field_1` text COLLATE utf8mb4_unicode_ci,
  `service_custom_field_2` text COLLATE utf8mb4_unicode_ci,
  `service_custom_field_3` text COLLATE utf8mb4_unicode_ci,
  `service_custom_field_4` text COLLATE utf8mb4_unicode_ci,
  `service_custom_field_5` text COLLATE utf8mb4_unicode_ci,
  `service_custom_field_6` text COLLATE utf8mb4_unicode_ci,
  `is_created_from_api` tinyint(1) NOT NULL DEFAULT '0',
  `rp_earned` int(11) NOT NULL DEFAULT '0' COMMENT 'rp is the short form of reward points',
  `order_addresses` text COLLATE utf8mb4_unicode_ci,
  `is_recurring` tinyint(1) NOT NULL DEFAULT '0',
  `recur_interval` double(22,4) DEFAULT NULL,
  `recur_interval_type` enum('days','months','years') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recur_repetitions` int(11) DEFAULT NULL,
  `recur_stopped_on` datetime DEFAULT NULL,
  `recur_parent_id` int(11) DEFAULT NULL,
  `invoice_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pay_term_number` int(11) DEFAULT NULL,
  `pay_term_type` enum('days','months') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `selling_price_group_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `business_id`, `location_id`, `res_table_id`, `res_waiter_id`, `res_order_status`, `type`, `sub_type`, `status`, `sub_status`, `is_quotation`, `payment_status`, `adjustment_type`, `contact_id`, `customer_group_id`, `invoice_no`, `ref_no`, `subscription_no`, `subscription_repeat_on`, `transaction_date`, `total_before_tax`, `tax_id`, `tax_amount`, `discount_type`, `discount_amount`, `rp_redeemed`, `rp_redeemed_amount`, `shipping_details`, `shipping_address`, `shipping_status`, `delivered_to`, `shipping_charges`, `shipping_custom_field_1`, `shipping_custom_field_2`, `shipping_custom_field_3`, `shipping_custom_field_4`, `shipping_custom_field_5`, `additional_notes`, `staff_note`, `is_export`, `export_custom_fields_info`, `round_off_amount`, `additional_expense_key_1`, `additional_expense_value_1`, `additional_expense_key_2`, `additional_expense_value_2`, `additional_expense_key_3`, `additional_expense_value_3`, `additional_expense_key_4`, `additional_expense_value_4`, `final_total`, `expense_category_id`, `expense_for`, `commission_agent`, `document`, `is_direct_sale`, `is_suspend`, `exchange_rate`, `total_amount_recovered`, `transfer_parent_id`, `return_parent_id`, `opening_stock_product_id`, `created_by`, `repair_completed_on`, `repair_warranty_id`, `repair_brand_id`, `repair_status_id`, `repair_model_id`, `repair_job_sheet_id`, `repair_defects`, `repair_serial_no`, `repair_checklist`, `repair_security_pwd`, `repair_security_pattern`, `repair_due_date`, `repair_device_id`, `repair_updates_notif`, `woocommerce_order_id`, `essentials_duration`, `essentials_duration_unit`, `essentials_amount_per_unit_duration`, `essentials_allowances`, `essentials_deductions`, `prefer_payment_method`, `prefer_payment_account`, `sales_order_ids`, `purchase_order_ids`, `custom_field_1`, `custom_field_2`, `custom_field_3`, `custom_field_4`, `import_batch`, `import_time`, `types_of_service_id`, `packing_charge`, `packing_charge_type`, `service_custom_field_1`, `service_custom_field_2`, `service_custom_field_3`, `service_custom_field_4`, `service_custom_field_5`, `service_custom_field_6`, `is_created_from_api`, `rp_earned`, `order_addresses`, `is_recurring`, `recur_interval`, `recur_interval_type`, `recur_repetitions`, `recur_stopped_on`, `recur_parent_id`, `invoice_token`, `pay_term_number`, `pay_term_type`, `selling_price_group_id`, `created_at`, `updated_at`) VALUES
(64, 1, 1, NULL, NULL, NULL, 'purchase_order', NULL, 'completed', NULL, 0, NULL, NULL, 15, NULL, NULL, '2021/0002', NULL, NULL, '2021-12-04 23:35:00', 4000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 4000.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-05 06:37:51', '2021-12-05 06:38:06'),
(65, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-01 09:46:12', 24999.9600, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 24999.9600, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 19, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-11 16:46:12', '2021-12-11 16:46:12'),
(66, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 22, NULL, 'INV0000044', '', NULL, NULL, '2021-12-11 09:50:00', 2300.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 2300.0000, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, '3768363be866506a613959d71d1cc6b1', NULL, NULL, NULL, '2021-12-11 16:54:52', '2021-12-11 17:17:27'),
(67, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 22, NULL, 'INV0000045', '', NULL, NULL, '2021-12-11 12:14:42', 5000.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 5000.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-11 19:14:42', '2021-12-11 19:14:42'),
(69, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, 'INV0000046', '', NULL, NULL, '2021-12-11 12:25:02', 2500.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 2500.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-12-11 19:25:02', '2021-12-11 19:25:02'),
(70, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-01 12:46:23', 5250.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 5250.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 20, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-11 19:46:23', '2021-12-11 19:46:23'),
(71, 1, 1, NULL, NULL, NULL, 'stock_adjustment', NULL, '', NULL, 0, NULL, 'normal', NULL, NULL, NULL, 'SA2021/0008', NULL, NULL, '2021-12-14 09:34:00', 0.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 'defective', NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 5000.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, 0.0000, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-14 17:07:25', '2021-12-14 17:07:25'),
(72, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-01 10:19:28', 936.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 936.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 21, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-14 17:19:28', '2021-12-14 17:19:28'),
(74, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-01 10:39:42', 2574.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 2574.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 22, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-14 17:39:42', '2021-12-14 17:39:42'),
(75, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, 'INV0000048', '', NULL, NULL, '2021-12-14 21:41:58', 1000.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 1000.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-12-15 04:41:58', '2021-12-15 04:41:58'),
(76, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, 'INV0000049', '', NULL, NULL, '2021-12-15 00:08:26', 1000.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 1000.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-12-15 07:08:26', '2021-12-15 07:08:26'),
(78, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, 'INV0000051', '', NULL, NULL, '2021-12-17 08:38:53', 155.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 155.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-12-17 15:38:53', '2021-12-17 15:38:53'),
(80, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, 'INV0000052', '', NULL, NULL, '2021-12-18 09:27:55', 27.5000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 27.5000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-12-18 16:27:55', '2021-12-18 16:27:55'),
(81, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-01 10:13:25', 3780.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 3780.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 23, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-18 17:13:25', '2021-12-18 17:13:25'),
(83, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, 'INV0000054', '', NULL, NULL, '2021-12-19 06:32:37', 2280.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 2290.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 10.0000, 'fixed', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-12-19 13:32:37', '2021-12-19 13:32:37'),
(85, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, NULL, '2021/0011', '', NULL, NULL, '2021-12-20 13:05:52', 2800.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 2800.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10.0000, 'fixed', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-12-20 20:05:52', '2021-12-20 20:05:52'),
(87, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, 'INV0000056', '', NULL, NULL, '2021-12-23 19:27:01', 831.2500, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 831.2500, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-12-24 02:27:01', '2021-12-24 02:27:01'),
(88, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, 'INV0000057', '', NULL, NULL, '2021-12-24 02:32:40', 831.2500, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 831.2500, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-12-24 09:32:40', '2021-12-24 09:32:40'),
(89, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-01 14:08:20', 82.5000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 82.5000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 25, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-25 21:08:20', '2021-12-25 21:08:20'),
(92, 1, 1, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'due', NULL, 24, NULL, NULL, 'Dgc', NULL, NULL, '2021-12-29 09:05:00', 5000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 5000.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 2, 'days', NULL, '2021-12-29 16:07:18', '2021-12-29 16:07:18'),
(98, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, 'INV0000064', '', NULL, NULL, '2021-12-30 20:57:11', 1840.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 2024.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 10.0000, 'percent', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-12-31 03:57:11', '2021-12-31 03:57:11'),
(115, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 21:56:51', 10000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 10000.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 26, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-19 04:56:51', '2022-01-19 04:56:51'),
(132, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 11:07:56', 100.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 100.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 32, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-02 18:07:56', '2022-02-02 18:07:56'),
(135, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 09:50:43', 2000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 2000.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 33, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-04 16:50:43', '2022-02-04 16:50:43'),
(137, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 10:56:22', 100.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 100.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 34, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-04 17:56:22', '2022-02-04 17:56:22'),
(155, 1, NULL, NULL, NULL, NULL, 'payroll', NULL, 'final', NULL, 0, 'paid', NULL, NULL, NULL, NULL, '2022/0001', NULL, NULL, '2022-02-01 00:00:00', 2000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 2000.0000, NULL, 8, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1.00, 'Month', 2000.0000, '{\"allowance_names\":[],\"allowance_amounts\":[],\"allowance_types\":[\"fixed\"],\"allowance_percents\":[]}', '{\"deduction_names\":[],\"deduction_amounts\":[],\"deduction_types\":[\"fixed\"],\"deduction_percents\":[]}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-18 00:34:29', '2022-02-18 00:35:15'),
(165, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 17:19:45', 36360.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 36360.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 39, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-03 00:19:45', '2022-03-03 00:26:45'),
(168, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 06:28:29', 129000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 129000.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 40, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-04 13:28:29', '2022-03-04 13:28:29'),
(181, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 15:55:53', 75.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 75.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 42, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.00, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-20 22:55:53', '2022-03-20 22:55:53');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_payments`
--

CREATE TABLE `transaction_payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `transaction_id` int(11) UNSIGNED DEFAULT NULL,
  `business_id` int(11) DEFAULT NULL,
  `is_return` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Used during sales to return the change',
  `amount` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_transaction_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_holder_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_month` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_year` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_security` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cheque_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_account_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_on` datetime DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `is_advance` tinyint(1) NOT NULL DEFAULT '0',
  `payment_for` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `document` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_ref_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction_payments`
--

INSERT INTO `transaction_payments` (`id`, `transaction_id`, `business_id`, `is_return`, `amount`, `method`, `transaction_no`, `card_transaction_number`, `card_number`, `card_type`, `card_holder_name`, `card_month`, `card_year`, `card_security`, `cheque_number`, `bank_account_number`, `paid_on`, `created_by`, `is_advance`, `payment_for`, `parent_id`, `note`, `document`, `payment_ref_no`, `account_id`, `created_at`, `updated_at`) VALUES
(1, 66, 1, 0, 2300.0000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-11 09:50:00', 1, 0, 22, NULL, NULL, NULL, 'SP2021/0045', NULL, '2021-12-11 16:54:52', '2021-12-11 16:54:52'),
(2, 67, 1, 0, 3000.0000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-11 12:14:42', 1, 0, 22, NULL, NULL, NULL, 'SP2021/0046', NULL, '2021-12-11 19:14:42', '2021-12-11 19:14:42'),
(3, 67, 1, 0, 2000.0000, 'bank_transfer', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-11 12:14:42', 1, 0, 22, NULL, NULL, NULL, 'SP2021/0047', NULL, '2021-12-11 19:14:42', '2021-12-11 19:14:42'),
(4, 69, 1, 0, 2500.0000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-11 12:25:02', 1, 0, 1, NULL, NULL, NULL, 'SP2021/0048', NULL, '2021-12-11 19:25:02', '2021-12-11 19:25:02'),
(6, 75, 1, 0, 1000.0000, 'card', NULL, NULL, NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-14 21:41:58', 1, 0, 1, NULL, NULL, NULL, 'SP2021/0050', NULL, '2021-12-15 04:41:58', '2021-12-15 04:41:58'),
(7, 76, 1, 0, 200.0000, 'custom_pay_1', '75468', NULL, NULL, 'credit', NULL, NULL, NULL, NULL, '01213', NULL, '2021-12-15 00:08:26', 1, 0, 1, NULL, 'jmljlkjlkj', NULL, 'SP2021/0051', NULL, '2021-12-15 07:08:26', '2021-12-15 07:08:26'),
(8, 76, 1, 0, 500.0000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-15 00:08:26', 1, 0, 1, NULL, NULL, NULL, 'SP2021/0052', NULL, '2021-12-15 07:08:26', '2021-12-15 07:08:26'),
(9, 76, 1, 0, 300.0000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-15 00:08:26', 1, 0, 1, NULL, NULL, NULL, 'SP2021/0053', NULL, '2021-12-15 07:08:26', '2021-12-15 07:08:26'),
(10, 78, 1, 0, 155.0000, 'card', NULL, NULL, NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-17 08:38:53', 1, 0, 1, NULL, NULL, NULL, 'SP2021/0054', NULL, '2021-12-17 15:38:53', '2021-12-17 15:38:53'),
(11, 80, 1, 0, 20.0000, 'card', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-18 09:27:55', 1, 0, 1, NULL, NULL, NULL, 'SP2021/0055', NULL, '2021-12-18 16:27:55', '2021-12-18 16:27:55'),
(12, 80, 1, 0, 7.5000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-18 09:27:55', 1, 0, 1, NULL, NULL, NULL, 'SP2021/0056', NULL, '2021-12-18 16:27:55', '2021-12-18 16:27:55'),
(14, 83, 1, 0, 2290.0000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-19 06:32:37', 1, 0, 1, NULL, NULL, NULL, 'SP2021/0058', NULL, '2021-12-19 13:32:37', '2021-12-19 13:32:37'),
(16, 87, 1, 0, 831.2500, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-23 19:27:01', 1, 0, 1, NULL, NULL, NULL, 'SP2021/0060', NULL, '2021-12-24 02:27:01', '2021-12-24 02:27:01'),
(17, 88, 1, 0, 331.2500, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-24 02:32:40', 1, 0, 1, NULL, NULL, NULL, 'SP2021/0061', NULL, '2021-12-24 09:32:40', '2021-12-24 09:32:40'),
(18, 88, 1, 0, 500.0000, 'card', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-24 02:32:40', 1, 0, 1, NULL, NULL, NULL, 'SP2021/0062', NULL, '2021-12-24 09:32:40', '2021-12-24 09:32:40'),
(25, 98, 1, 0, 2024.0000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-30 20:57:11', 1, 0, 1, NULL, NULL, NULL, 'SP2021/0069', NULL, '2021-12-31 03:57:11', '2021-12-31 03:57:11'),
(49, NULL, 1, 0, 300.0000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-04 11:07:00', 1, 1, 37, NULL, NULL, NULL, 'SP2022/0093', NULL, '2022-02-04 18:07:18', '2022-02-04 18:07:18'),
(57, 155, 1, 0, 2000.0000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-17 17:34:00', 1, 0, NULL, NULL, NULL, NULL, 'PP2022/0002', NULL, '2022-02-18 00:35:15', '2022-02-18 00:35:15');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_sell_lines`
--

CREATE TABLE `transaction_sell_lines` (
  `id` int(10) UNSIGNED NOT NULL,
  `transaction_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `variation_id` int(10) UNSIGNED NOT NULL,
  `quantity` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `quantity_returned` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `unit_price_before_discount` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `unit_price` decimal(22,4) DEFAULT NULL COMMENT 'Sell price excluding tax',
  `line_discount_type` enum('fixed','percentage') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `line_discount_amount` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `unit_price_inc_tax` decimal(22,4) DEFAULT NULL COMMENT 'Sell price including tax',
  `item_tax` decimal(22,4) NOT NULL COMMENT 'Tax for one quantity',
  `tax_id` int(10) UNSIGNED DEFAULT NULL,
  `discount_id` int(11) DEFAULT NULL,
  `lot_no_line_id` int(11) DEFAULT NULL,
  `sell_line_note` text COLLATE utf8mb4_unicode_ci,
  `woocommerce_line_items_id` int(11) DEFAULT NULL,
  `so_line_id` int(11) DEFAULT NULL,
  `so_quantity_invoiced` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `res_service_staff_id` int(11) DEFAULT NULL,
  `res_line_order_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_sell_line_id` int(11) DEFAULT NULL,
  `children_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Type of children for the parent, like modifier or combo',
  `sub_unit_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transaction_sell_lines_purchase_lines`
--

CREATE TABLE `transaction_sell_lines_purchase_lines` (
  `id` int(10) UNSIGNED NOT NULL,
  `sell_line_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'id from transaction_sell_lines',
  `stock_adjustment_line_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'id from stock_adjustment_lines',
  `purchase_line_id` int(10) UNSIGNED NOT NULL COMMENT 'id from purchase_lines',
  `quantity` decimal(22,4) NOT NULL,
  `qty_returned` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction_sell_lines_purchase_lines`
--

INSERT INTO `transaction_sell_lines_purchase_lines` (`id`, `sell_line_id`, `stock_adjustment_line_id`, `purchase_line_id`, `quantity`, `qty_returned`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 2, 1.0000, 0.0000, '2021-12-11 16:54:52', '2021-12-11 16:54:52'),
(2, 2, NULL, 2, 2.0000, 0.0000, '2021-12-11 19:14:42', '2021-12-11 19:14:42'),
(3, 4, NULL, 2, 1.0000, 0.0000, '2021-12-11 19:25:02', '2021-12-11 19:25:02'),
(4, NULL, 1, 2, 2.0000, 0.0000, '2021-12-14 17:07:25', '2021-12-14 17:07:25'),
(7, 7, NULL, 3, 1.0000, 0.0000, '2021-12-15 04:41:58', '2021-12-15 04:41:58'),
(9, 8, NULL, 3, 1.0000, 0.0000, '2021-12-15 07:08:26', '2021-12-15 07:08:26'),
(11, 10, NULL, 4, 1.0000, 0.0000, '2021-12-17 15:38:53', '2021-12-17 15:38:53'),
(12, 11, NULL, 9, 1.0000, 0.0000, '2021-12-17 15:38:53', '2021-12-17 15:38:53'),
(13, 13, NULL, 6, 1.0000, 0.0000, '2021-12-18 16:27:55', '2021-12-18 16:27:55'),
(16, 16, NULL, 4, 5.0000, 0.0000, '2021-12-19 13:32:37', '2021-12-19 13:32:37'),
(17, 17, NULL, 2, 1.0000, 0.0000, '2021-12-19 13:32:37', '2021-12-19 13:32:37'),
(18, 18, NULL, 7, 1.0000, 0.0000, '2021-12-19 13:32:37', '2021-12-19 13:32:37'),
(20, 27, NULL, 3, 1.0000, 0.0000, '2021-12-24 02:27:01', '2021-12-24 02:27:01'),
(21, 28, NULL, 4, 1.0000, 0.0000, '2021-12-24 02:27:01', '2021-12-24 02:27:01'),
(22, 29, NULL, 3, 1.0000, 0.0000, '2021-12-24 09:32:40', '2021-12-24 09:32:40'),
(23, 30, NULL, 4, 1.0000, 0.0000, '2021-12-24 09:32:40', '2021-12-24 09:32:40'),
(33, 46, NULL, 14, 1.0000, 0.0000, '2021-12-31 03:57:11', '2021-12-31 03:57:11');

-- --------------------------------------------------------

--
-- Table structure for table `types_of_services`
--

CREATE TABLE `types_of_services` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `business_id` int(11) NOT NULL,
  `location_price_group` text COLLATE utf8mb4_unicode_ci,
  `packing_charge` decimal(22,4) DEFAULT NULL,
  `packing_charge_type` enum('fixed','percent') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enable_custom_fields` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `types_of_services`
--

INSERT INTO `types_of_services` (`id`, `name`, `description`, `business_id`, `location_price_group`, `packing_charge`, `packing_charge_type`, `enable_custom_fields`, `created_at`, `updated_at`) VALUES
(1, 'Service Charge', 'Service Charge', 1, '{\"1\":\"0\"}', 10.0000, 'percent', 0, '2021-10-20 16:29:53', '2021-12-25 21:02:44');

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `actual_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `allow_decimal` tinyint(1) NOT NULL,
  `base_unit_id` int(11) DEFAULT NULL,
  `base_unit_multiplier` decimal(20,4) DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `business_id`, `actual_name`, `short_name`, `allow_decimal`, `base_unit_id`, `base_unit_multiplier`, `created_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Pieces', 'Pc(s)', 0, NULL, NULL, 1, NULL, '2021-09-08 08:52:16', '2021-09-08 08:52:16'),
(2, 1, 'Aantallen', 'aantal', 1, NULL, NULL, 1, '2021-12-05 09:51:13', '2021-09-21 01:29:35', '2021-12-05 09:51:13'),
(3, 2, 'Pieces', 'Pc(s)', 0, NULL, NULL, 5, NULL, '2021-12-04 00:58:45', '2021-12-04 00:58:45'),
(4, 1, 'Lb', 'pounds', 1, NULL, NULL, 1, '2022-04-03 06:34:38', '2021-12-25 21:05:42', '2022-04-03 06:34:38'),
(5, 3, 'Pieces', 'Pc(s)', 0, NULL, NULL, 12, NULL, '2022-02-01 06:06:44', '2022-02-01 06:06:44'),
(6, 1, 'Runtz', 'Runtz', 1, NULL, NULL, 1, '2022-02-21 10:47:59', '2022-02-21 10:46:17', '2022-02-21 10:47:59'),
(7, 1, 'caixa', 'CX', 1, NULL, NULL, 1, '2022-04-03 06:34:02', '2022-03-22 20:56:21', '2022-04-03 06:34:02'),
(8, 1, 'emb', 'emb', 1, 7, 6.0000, 1, '2022-04-03 06:34:33', '2022-03-22 20:56:44', '2022-04-03 06:34:33'),
(9, 1, 'BOX', 'BOX', 1, 1, 12.0000, 1, '2022-04-03 06:36:53', '2022-04-03 06:35:02', '2022-04-03 06:36:53');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `surname` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `contact_no` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_id` int(10) UNSIGNED DEFAULT NULL,
  `essentials_department_id` int(11) DEFAULT NULL,
  `essentials_designation_id` int(11) DEFAULT NULL,
  `essentials_salary` decimal(22,4) DEFAULT NULL,
  `essentials_pay_period` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `essentials_pay_cycle` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `max_sales_discount_percent` decimal(5,2) DEFAULT NULL,
  `allow_login` tinyint(1) NOT NULL DEFAULT '1',
  `status` enum('active','inactive','terminated') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `crm_contact_id` int(10) UNSIGNED DEFAULT NULL,
  `is_cmmsn_agnt` tinyint(1) NOT NULL DEFAULT '0',
  `cmmsn_percent` decimal(4,2) NOT NULL DEFAULT '0.00',
  `selected_contacts` tinyint(1) NOT NULL DEFAULT '0',
  `dob` date DEFAULT NULL,
  `gender` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `marital_status` enum('married','unmarried','divorced') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blood_group` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_number` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alt_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `family_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fb_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_media_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_media_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permanent_address` text COLLATE utf8mb4_unicode_ci,
  `current_address` text COLLATE utf8mb4_unicode_ci,
  `guardian_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_details` longtext COLLATE utf8mb4_unicode_ci,
  `id_proof_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_proof_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_type`, `surname`, `first_name`, `last_name`, `username`, `email`, `password`, `language`, `contact_no`, `address`, `remember_token`, `business_id`, `essentials_department_id`, `essentials_designation_id`, `essentials_salary`, `essentials_pay_period`, `essentials_pay_cycle`, `max_sales_discount_percent`, `allow_login`, `status`, `crm_contact_id`, `is_cmmsn_agnt`, `cmmsn_percent`, `selected_contacts`, `dob`, `gender`, `marital_status`, `blood_group`, `contact_number`, `alt_number`, `family_number`, `fb_link`, `twitter_link`, `social_media_1`, `social_media_2`, `permanent_address`, `current_address`, `guardian_name`, `custom_field_1`, `custom_field_2`, `custom_field_3`, `custom_field_4`, `bank_details`, `id_proof_name`, `id_proof_number`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'user', 'Mr', 'Admin', NULL, 'admin', 'info@1pixelcoding.com', '$2y$10$GHggWtW1dbtuD4ozT.0FQuZjXObpOOalx.uQN4Y5DpVwB86atiGme', 'en', NULL, NULL, 'grqLD56xUULFo4LyiiGvcHa2nlciUuzwqv9IUg9qE6IxPKOIUSkSXRooE4Ji', 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'active', NULL, 0, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, NULL, '2021-09-08 08:52:16', '2022-01-22 01:37:48'),
(2, 'user', 'mr', 'shahzad', 'mahmood', 'shahzad', 'dummy1@gmail.com', '$2y$10$rOXE0BUIl2UKehhLZlpKbuBCCleWU4V.TcyKEoT1sk81qhRXwXyGK', 'en', NULL, NULL, NULL, 1, NULL, NULL, 0.0000, 'month', NULL, NULL, 1, 'active', NULL, 0, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, '2021-12-05 05:03:30', '2021-09-15 19:43:04', '2021-12-05 05:03:30'),
(3, 'user', NULL, 'JP', NULL, NULL, NULL, NULL, 'en', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'active', NULL, 1, 1.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-27 15:46:05', '2021-10-27 15:46:05'),
(4, 'user', 'Mr', 'Manager', NULL, 'manager', 'manager@gmail.com', '$2y$10$EmEqERMmgMcHUdNWAyblk.RE8bFqK7Vw4K3v3tUEok3ncjZvHcQI6', 'en', NULL, NULL, NULL, 1, NULL, NULL, NULL, 'month', NULL, NULL, 1, 'active', NULL, 0, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, '2021-12-05 05:03:28', '2021-12-03 11:02:31', '2021-12-05 05:03:28'),
(5, 'user', 'MR', 'INAM UR', 'REHMAN', 'INAM', 'irbluen@gmail.com', '$2y$10$PpOiRwYIDhj5LMoXl8C6eu7mpCdyLIGjfxjeQFpcdMCGuWwKzZ/5u', 'en', NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'active', NULL, 0, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-04 00:58:45', '2021-12-04 00:58:45'),
(6, 'user', 'MR', 'kashif', 'butt', 'kashif', 'irbluen43@gmail.com', '$2y$10$Gp/Fvb51Y5e9sgjQ1Khn0OIQqem1MEC.FWHAWn5QZ.GbYjdc6vani', 'en', NULL, NULL, NULL, 2, NULL, NULL, NULL, 'month', NULL, NULL, 1, 'active', NULL, 0, 0.00, 0, NULL, NULL, NULL, NULL, '+913014300024', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, NULL, '2021-12-03 22:04:06', '2021-12-03 22:04:07'),
(7, 'user', 'MR', 'hammad', 'MUHAMMAD', 'hammad', 'irbluen443@gmail.com', '$2y$10$jRhG36BgcrjFUeRD5dWMqeyS2A9o.QRO1UZ8wy1fS2KUNkTAkXIt.', 'en', NULL, NULL, NULL, 2, NULL, NULL, NULL, 'month', NULL, NULL, 1, 'active', NULL, 0, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, NULL, '2021-12-03 22:06:21', '2021-12-03 22:06:21'),
(8, 'user', 'MR', 'PABLO', 'GONZALO', 'PABLOTECNICO', 'EJEMPLO@GMAIL.COM', '$2y$10$/HGRoehrURojdITCMYxKvOP7VAzuht9UH6GfmgKJWqX7d1ZNGfmw6', 'en', NULL, NULL, NULL, 1, NULL, NULL, NULL, 'month', NULL, NULL, 1, 'active', NULL, 0, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, NULL, '2022-01-10 22:26:49', '2022-02-28 10:57:33'),
(9, 'user', 'MR', 'ALEJANDRO', 'SALINAS', 'alejandrotec', 'ejemplo@hotmail.com', '$2y$10$8nmDzuZf7Xi6WTK76INjaO4OAjrK0tQG.Loyjozjo8/tdT5o5GwoC', 'en', NULL, NULL, NULL, 1, NULL, NULL, NULL, 'month', NULL, NULL, 1, 'active', NULL, 0, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, NULL, '2022-01-10 22:33:53', '2022-01-10 22:34:47'),
(10, 'user', 'mil', 'Milton', 'Conza', NULL, 'johao1000@hotmail.com', NULL, 'en', '0987119104', 'Francisco P Icaza 407 y Córdoba Condominio El Alfil piso 3 oficina 3', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'active', NULL, 1, 50.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-28 10:58:01', '2022-01-21 07:16:41', '2022-02-28 10:58:01'),
(11, 'user', 'mil', 'Milton', 'Conza', NULL, 'johao1000@hotmail.com', NULL, 'en', '0987119104', 'Francisco P Icaza 407 y Córdoba Condominio El Alfil piso 3 oficina 3', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'active', NULL, 1, 50.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-28 10:58:05', '2022-01-21 07:16:41', '2022-02-28 10:58:05'),
(12, 'user', 'mr', 'Grand', 'Proprietary', 'ben@grandsoft.co.bw', 'mphoben.07@gmail.com', '$2y$10$Ubae13qUjckw/CalT9/6gO/7m1Kq3Dq64nYqRcLBX8IrLySuAolR.', 'en', NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'active', NULL, 0, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-01 06:06:44', '2022-02-01 06:06:44');

-- --------------------------------------------------------

--
-- Table structure for table `user_contact_access`
--

CREATE TABLE `user_contact_access` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `variations`
--

CREATE TABLE `variations` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `sub_sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_variation_id` int(10) UNSIGNED NOT NULL,
  `woocommerce_variation_id` int(11) DEFAULT NULL,
  `variation_value_id` int(11) DEFAULT NULL,
  `default_purchase_price` decimal(22,4) DEFAULT NULL,
  `dpp_inc_tax` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `profit_percent` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `default_sell_price` decimal(22,4) DEFAULT NULL,
  `sell_price_inc_tax` decimal(22,4) DEFAULT NULL COMMENT 'Sell price including tax',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `combo_variations` text COLLATE utf8mb4_unicode_ci COMMENT 'Contains the combo variation details'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `variation_group_prices`
--

CREATE TABLE `variation_group_prices` (
  `id` int(10) UNSIGNED NOT NULL,
  `variation_id` int(10) UNSIGNED NOT NULL,
  `price_group_id` int(10) UNSIGNED NOT NULL,
  `price_inc_tax` decimal(22,4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `variation_location_details`
--

CREATE TABLE `variation_location_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `product_variation_id` int(10) UNSIGNED NOT NULL COMMENT 'id from product_variations table',
  `variation_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `qty_available` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `variation_templates`
--

CREATE TABLE `variation_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `woocommerce_attr_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variation_templates`
--

INSERT INTO `variation_templates` (`id`, `name`, `business_id`, `woocommerce_attr_id`, `created_at`, `updated_at`) VALUES
(1, 'Cabbage Variety', 1, NULL, '2021-12-14 17:18:12', '2021-12-25 21:09:39'),
(2, 'Colors', 1, NULL, '2022-01-19 20:05:30', '2022-01-19 20:05:30'),
(3, 'Ram Size', 1, NULL, '2022-01-19 20:06:46', '2022-01-19 20:08:01'),
(4, 'Screen Size', 1, NULL, '2022-01-19 20:09:05', '2022-01-19 20:09:05'),
(5, 'Processor', 1, NULL, '2022-01-19 20:15:00', '2022-01-19 20:15:00');

-- --------------------------------------------------------

--
-- Table structure for table `variation_value_templates`
--

CREATE TABLE `variation_value_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `variation_template_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variation_value_templates`
--

INSERT INTO `variation_value_templates` (`id`, `name`, `variation_template_id`, `created_at`, `updated_at`) VALUES
(1, 'Purple', 1, '2021-12-14 17:18:12', '2021-12-25 21:09:39'),
(2, 'White', 1, '2021-12-14 17:18:12', '2021-12-25 21:09:39'),
(3, 'Green (imported)', 1, '2021-12-14 17:18:12', '2021-12-25 21:09:39'),
(4, 'Red.', 2, '2022-01-19 20:05:30', '2022-01-19 20:05:30'),
(5, 'Blue', 2, '2022-01-19 20:05:30', '2022-01-19 20:05:30'),
(6, 'Green', 2, '2022-01-19 20:05:30', '2022-01-19 20:05:30'),
(7, '2GB', 3, '2022-01-19 20:06:46', '2022-01-19 20:08:01'),
(8, '4GB', 3, '2022-01-19 20:06:46', '2022-01-19 20:08:01'),
(9, '8GB', 3, '2022-01-19 20:06:46', '2022-01-19 20:08:01'),
(10, '12GB', 3, '2022-01-19 20:08:01', '2022-01-19 20:08:01'),
(11, '16GB', 3, '2022-01-19 20:08:01', '2022-01-19 20:08:01'),
(12, '24GB', 3, '2022-01-19 20:08:01', '2022-01-19 20:08:01'),
(13, '32GB', 3, '2022-01-19 20:08:01', '2022-01-19 20:08:01'),
(14, '64GB', 3, '2022-01-19 20:08:01', '2022-01-19 20:08:01'),
(15, '128GB', 3, '2022-01-19 20:08:01', '2022-01-19 20:08:01'),
(16, '256GB', 3, '2022-01-19 20:08:01', '2022-01-19 20:08:01'),
(17, '7.9 inches', 4, '2022-01-19 20:09:05', '2022-01-19 20:09:05'),
(18, '8 inches', 4, '2022-01-19 20:09:05', '2022-01-19 20:09:05'),
(19, '9.7 inches', 4, '2022-01-19 20:09:22', '2022-01-19 20:13:25'),
(20, '10 inches', 4, '2022-01-19 20:13:25', '2022-01-19 20:13:25'),
(21, '10.5 inches', 4, '2022-01-19 20:13:25', '2022-01-19 20:13:25'),
(22, '11 inches', 4, '2022-01-19 20:13:25', '2022-01-19 20:13:25'),
(23, '12 inches', 4, '2022-01-19 20:13:25', '2022-01-19 20:13:25'),
(24, '12.5 inches', 4, '2022-01-19 20:13:25', '2022-01-19 20:13:25'),
(25, '13 inches', 4, '2022-01-19 20:13:25', '2022-01-19 20:13:25'),
(26, '13.5 inches', 4, '2022-01-19 20:13:25', '2022-01-19 20:13:25'),
(27, '14 inches', 4, '2022-01-19 20:13:25', '2022-01-19 20:13:25'),
(28, '14.5', 4, '2022-01-19 20:13:25', '2022-01-19 20:13:25'),
(29, '15 inches', 4, '2022-01-19 20:13:25', '2022-01-19 20:13:25'),
(30, '15.6 inches', 4, '2022-01-19 20:13:25', '2022-01-19 20:13:25'),
(31, '16 inches', 4, '2022-01-19 20:13:25', '2022-01-19 20:13:25'),
(32, '17 inches', 4, '2022-01-19 20:13:25', '2022-01-19 20:13:25'),
(33, '19 inches', 4, '2022-01-19 20:13:25', '2022-01-19 20:13:25'),
(34, '20 inches', 4, '2022-01-19 20:13:25', '2022-01-19 20:13:25'),
(35, '21 inches', 4, '2022-01-19 20:13:25', '2022-01-19 20:13:25'),
(36, '22 inches', 4, '2022-01-19 20:13:25', '2022-01-19 20:13:25'),
(37, '23 inches', 4, '2022-01-19 20:13:25', '2022-01-19 20:13:25'),
(38, '24 inches', 4, '2022-01-19 20:13:25', '2022-01-19 20:13:25'),
(39, '27 inches', 4, '2022-01-19 20:13:25', '2022-01-19 20:13:25'),
(40, '28 inches', 4, '2022-01-19 20:13:25', '2022-01-19 20:13:25'),
(41, '30 inches', 4, '2022-01-19 20:13:25', '2022-01-19 20:13:25'),
(42, '32 inches', 4, '2022-01-19 20:13:25', '2022-01-19 20:13:25'),
(43, '34 inches', 4, '2022-01-19 20:13:25', '2022-01-19 20:13:25'),
(44, 'Core 2 Duo', 5, '2022-01-19 20:15:00', '2022-01-19 20:15:00'),
(45, 'i3', 5, '2022-01-19 20:15:00', '2022-01-19 20:15:00'),
(46, 'i5', 5, '2022-01-19 20:15:00', '2022-01-19 20:15:00'),
(47, 'i7', 5, '2022-01-19 20:15:00', '2022-01-19 20:15:00'),
(48, 'i9', 5, '2022-01-19 20:15:00', '2022-01-19 20:15:00'),
(49, 'Xenon', 5, '2022-01-19 20:15:00', '2022-01-19 20:15:00'),
(50, 'Ryzen 3', 5, '2022-01-19 20:15:00', '2022-01-19 20:15:00'),
(51, 'Ryzen 5', 5, '2022-01-19 20:15:00', '2022-01-19 20:15:00'),
(52, 'Ryzen 7', 5, '2022-01-19 20:15:00', '2022-01-19 20:15:00'),
(53, 'Ryzen 9', 5, '2022-01-19 20:15:00', '2022-01-19 20:15:00');

-- --------------------------------------------------------

--
-- Table structure for table `warranties`
--

CREATE TABLE `warranties` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int(11) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `duration` int(11) NOT NULL,
  `duration_type` enum('days','months','years') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `warranties`
--

INSERT INTO `warranties` (`id`, `name`, `business_id`, `description`, `duration`, `duration_type`, `created_at`, `updated_at`) VALUES
(1, 'Reparatie garantie', 1, 'Je hebt 12 maanden garantie op het door ons vervangen onderdeel. Overige schade valt niet onder de garantie.', 12, 'months', '2021-09-21 01:25:45', '2021-09-21 01:25:45'),
(2, 'Waterdichtheid & fabrieksgarantie', 1, 'Wanneer je het toestel door ons laat repareren komt de fabrieksgarantie te vervallen en de waterdichtheid van het toestel is na reparatie altijd minder dan voorheen.\r\n\r\n\r\n\r\nHandtekening:   ..............................................', 1, 'years', '2021-09-21 01:27:19', '2021-09-21 01:27:19');

-- --------------------------------------------------------

--
-- Table structure for table `woocommerce_sync_logs`
--

CREATE TABLE `woocommerce_sync_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `sync_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `operation_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` longtext COLLATE utf8mb4_unicode_ci,
  `details` longtext COLLATE utf8mb4_unicode_ci,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accounts_business_id_index` (`business_id`),
  ADD KEY `accounts_account_type_id_index` (`account_type_id`),
  ADD KEY `accounts_created_by_index` (`created_by`);

--
-- Indexes for table `account_transactions`
--
ALTER TABLE `account_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_transactions_account_id_index` (`account_id`),
  ADD KEY `account_transactions_transaction_id_index` (`transaction_id`),
  ADD KEY `account_transactions_transaction_payment_id_index` (`transaction_payment_id`),
  ADD KEY `account_transactions_transfer_transaction_id_index` (`transfer_transaction_id`),
  ADD KEY `account_transactions_created_by_index` (`created_by`),
  ADD KEY `account_transactions_type_index` (`type`),
  ADD KEY `account_transactions_sub_type_index` (`sub_type`),
  ADD KEY `account_transactions_operation_date_index` (`operation_date`);

--
-- Indexes for table `account_types`
--
ALTER TABLE `account_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_types_parent_account_type_id_index` (`parent_account_type_id`),
  ADD KEY `account_types_business_id_index` (`business_id`);

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activity_log_log_name_index` (`log_name`);

--
-- Indexes for table `barcodes`
--
ALTER TABLE `barcodes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `barcodes_business_id_foreign` (`business_id`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bookings_contact_id_foreign` (`contact_id`),
  ADD KEY `bookings_business_id_foreign` (`business_id`),
  ADD KEY `bookings_created_by_foreign` (`created_by`),
  ADD KEY `bookings_table_id_index` (`table_id`),
  ADD KEY `bookings_waiter_id_index` (`waiter_id`),
  ADD KEY `bookings_location_id_index` (`location_id`),
  ADD KEY `bookings_booking_status_index` (`booking_status`),
  ADD KEY `bookings_correspondent_id_index` (`correspondent_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brands_business_id_foreign` (`business_id`),
  ADD KEY `brands_created_by_foreign` (`created_by`);

--
-- Indexes for table `business`
--
ALTER TABLE `business`
  ADD PRIMARY KEY (`id`),
  ADD KEY `business_owner_id_foreign` (`owner_id`),
  ADD KEY `business_currency_id_foreign` (`currency_id`),
  ADD KEY `business_default_sales_tax_foreign` (`default_sales_tax`);

--
-- Indexes for table `business_locations`
--
ALTER TABLE `business_locations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `business_locations_business_id_index` (`business_id`),
  ADD KEY `business_locations_invoice_scheme_id_foreign` (`invoice_scheme_id`),
  ADD KEY `business_locations_invoice_layout_id_foreign` (`invoice_layout_id`),
  ADD KEY `business_locations_sale_invoice_layout_id_index` (`sale_invoice_layout_id`),
  ADD KEY `business_locations_selling_price_group_id_index` (`selling_price_group_id`),
  ADD KEY `business_locations_receipt_printer_type_index` (`receipt_printer_type`),
  ADD KEY `business_locations_printer_id_index` (`printer_id`);

--
-- Indexes for table `cash_registers`
--
ALTER TABLE `cash_registers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cash_registers_business_id_foreign` (`business_id`),
  ADD KEY `cash_registers_user_id_foreign` (`user_id`),
  ADD KEY `cash_registers_location_id_index` (`location_id`);

--
-- Indexes for table `cash_register_transactions`
--
ALTER TABLE `cash_register_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cash_register_transactions_cash_register_id_foreign` (`cash_register_id`),
  ADD KEY `cash_register_transactions_transaction_id_index` (`transaction_id`),
  ADD KEY `cash_register_transactions_type_index` (`type`),
  ADD KEY `cash_register_transactions_transaction_type_index` (`transaction_type`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_business_id_foreign` (`business_id`),
  ADD KEY `categories_created_by_foreign` (`created_by`),
  ADD KEY `categories_parent_id_index` (`parent_id`);

--
-- Indexes for table `categorizables`
--
ALTER TABLE `categorizables`
  ADD KEY `categorizables_categorizable_type_categorizable_id_index` (`categorizable_type`,`categorizable_id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contacts_business_id_foreign` (`business_id`),
  ADD KEY `contacts_created_by_foreign` (`created_by`),
  ADD KEY `contacts_type_index` (`type`),
  ADD KEY `contacts_contact_status_index` (`contact_status`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_groups`
--
ALTER TABLE `customer_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_groups_business_id_foreign` (`business_id`),
  ADD KEY `customer_groups_created_by_index` (`created_by`),
  ADD KEY `customer_groups_price_calculation_type_index` (`price_calculation_type`),
  ADD KEY `customer_groups_selling_price_group_id_index` (`selling_price_group_id`);

--
-- Indexes for table `dashboard_configurations`
--
ALTER TABLE `dashboard_configurations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dashboard_configurations_business_id_foreign` (`business_id`);

--
-- Indexes for table `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `discounts_business_id_index` (`business_id`),
  ADD KEY `discounts_brand_id_index` (`brand_id`),
  ADD KEY `discounts_category_id_index` (`category_id`),
  ADD KEY `discounts_location_id_index` (`location_id`),
  ADD KEY `discounts_priority_index` (`priority`);

--
-- Indexes for table `discount_variations`
--
ALTER TABLE `discount_variations`
  ADD KEY `discount_variations_discount_id_index` (`discount_id`),
  ADD KEY `discount_variations_variation_id_index` (`variation_id`);

--
-- Indexes for table `document_and_notes`
--
ALTER TABLE `document_and_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `document_and_notes_business_id_index` (`business_id`),
  ADD KEY `document_and_notes_notable_id_index` (`notable_id`),
  ADD KEY `document_and_notes_created_by_index` (`created_by`);

--
-- Indexes for table `essentials_allowances_and_deductions`
--
ALTER TABLE `essentials_allowances_and_deductions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `essentials_allowances_and_deductions_business_id_index` (`business_id`);

--
-- Indexes for table `essentials_attendances`
--
ALTER TABLE `essentials_attendances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `essentials_attendances_user_id_index` (`user_id`),
  ADD KEY `essentials_attendances_business_id_index` (`business_id`),
  ADD KEY `essentials_attendances_essentials_shift_id_index` (`essentials_shift_id`);

--
-- Indexes for table `essentials_documents`
--
ALTER TABLE `essentials_documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `essentials_document_shares`
--
ALTER TABLE `essentials_document_shares`
  ADD PRIMARY KEY (`id`),
  ADD KEY `essentials_document_shares_document_id_index` (`document_id`),
  ADD KEY `essentials_document_shares_value_type_index` (`value_type`);

--
-- Indexes for table `essentials_holidays`
--
ALTER TABLE `essentials_holidays`
  ADD PRIMARY KEY (`id`),
  ADD KEY `essentials_holidays_business_id_index` (`business_id`),
  ADD KEY `essentials_holidays_location_id_index` (`location_id`);

--
-- Indexes for table `essentials_kb`
--
ALTER TABLE `essentials_kb`
  ADD PRIMARY KEY (`id`),
  ADD KEY `essentials_kb_business_id_index` (`business_id`),
  ADD KEY `essentials_kb_parent_id_index` (`parent_id`),
  ADD KEY `essentials_kb_created_by_index` (`created_by`);

--
-- Indexes for table `essentials_kb_users`
--
ALTER TABLE `essentials_kb_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `essentials_kb_users_kb_id_index` (`kb_id`),
  ADD KEY `essentials_kb_users_user_id_index` (`user_id`);

--
-- Indexes for table `essentials_leaves`
--
ALTER TABLE `essentials_leaves`
  ADD PRIMARY KEY (`id`),
  ADD KEY `essentials_leaves_essentials_leave_type_id_index` (`essentials_leave_type_id`),
  ADD KEY `essentials_leaves_business_id_index` (`business_id`),
  ADD KEY `essentials_leaves_user_id_index` (`user_id`);

--
-- Indexes for table `essentials_leave_types`
--
ALTER TABLE `essentials_leave_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `essentials_leave_types_business_id_index` (`business_id`);

--
-- Indexes for table `essentials_messages`
--
ALTER TABLE `essentials_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `essentials_messages_business_id_index` (`business_id`),
  ADD KEY `essentials_messages_user_id_index` (`user_id`),
  ADD KEY `essentials_messages_location_id_index` (`location_id`);

--
-- Indexes for table `essentials_payroll_groups`
--
ALTER TABLE `essentials_payroll_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `essentials_payroll_group_transactions`
--
ALTER TABLE `essentials_payroll_group_transactions`
  ADD KEY `essentials_payroll_group_transactions_payroll_group_id_foreign` (`payroll_group_id`);

--
-- Indexes for table `essentials_reminders`
--
ALTER TABLE `essentials_reminders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `essentials_reminders_business_id_index` (`business_id`),
  ADD KEY `essentials_reminders_user_id_index` (`user_id`);

--
-- Indexes for table `essentials_shifts`
--
ALTER TABLE `essentials_shifts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `essentials_shifts_type_index` (`type`),
  ADD KEY `essentials_shifts_business_id_index` (`business_id`);

--
-- Indexes for table `essentials_todo_comments`
--
ALTER TABLE `essentials_todo_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `essentials_todo_comments_task_id_index` (`task_id`),
  ADD KEY `essentials_todo_comments_comment_by_index` (`comment_by`);

--
-- Indexes for table `essentials_to_dos`
--
ALTER TABLE `essentials_to_dos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `essentials_to_dos_status_index` (`status`),
  ADD KEY `essentials_to_dos_priority_index` (`priority`),
  ADD KEY `essentials_to_dos_created_by_index` (`created_by`),
  ADD KEY `essentials_to_dos_business_id_index` (`business_id`),
  ADD KEY `essentials_to_dos_task_id_index` (`task_id`);

--
-- Indexes for table `essentials_user_allowance_and_deductions`
--
ALTER TABLE `essentials_user_allowance_and_deductions`
  ADD KEY `essentials_user_allowance_and_deductions_user_id_index` (`user_id`),
  ADD KEY `allow_deduct_index` (`allowance_deduction_id`);

--
-- Indexes for table `essentials_user_shifts`
--
ALTER TABLE `essentials_user_shifts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `essentials_user_shifts_user_id_index` (`user_id`),
  ADD KEY `essentials_user_shifts_essentials_shift_id_index` (`essentials_shift_id`);

--
-- Indexes for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expense_categories_business_id_foreign` (`business_id`);

--
-- Indexes for table `group_sub_taxes`
--
ALTER TABLE `group_sub_taxes`
  ADD KEY `group_sub_taxes_group_tax_id_foreign` (`group_tax_id`),
  ADD KEY `group_sub_taxes_tax_id_foreign` (`tax_id`);

--
-- Indexes for table `invoice_layouts`
--
ALTER TABLE `invoice_layouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_layouts_business_id_foreign` (`business_id`);

--
-- Indexes for table `invoice_schemes`
--
ALTER TABLE `invoice_schemes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_schemes_business_id_foreign` (`business_id`),
  ADD KEY `invoice_schemes_scheme_type_index` (`scheme_type`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`),
  ADD KEY `media_business_id_index` (`business_id`),
  ADD KEY `media_uploaded_by_index` (`uploaded_by`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `notification_templates`
--
ALTER TABLE `notification_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `printers`
--
ALTER TABLE `printers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `printers_business_id_foreign` (`business_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_brand_id_foreign` (`brand_id`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_sub_category_id_foreign` (`sub_category_id`),
  ADD KEY `products_tax_foreign` (`tax`),
  ADD KEY `products_name_index` (`name`),
  ADD KEY `products_business_id_index` (`business_id`),
  ADD KEY `products_unit_id_index` (`unit_id`),
  ADD KEY `products_created_by_index` (`created_by`),
  ADD KEY `products_warranty_id_index` (`warranty_id`),
  ADD KEY `products_type_index` (`type`),
  ADD KEY `products_tax_type_index` (`tax_type`),
  ADD KEY `products_barcode_type_index` (`barcode_type`),
  ADD KEY `products_repair_model_id_foreign` (`repair_model_id`);

--
-- Indexes for table `product_locations`
--
ALTER TABLE `product_locations`
  ADD KEY `product_locations_product_id_index` (`product_id`),
  ADD KEY `product_locations_location_id_index` (`location_id`);

--
-- Indexes for table `product_racks`
--
ALTER TABLE `product_racks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_racks_business_id_index` (`business_id`),
  ADD KEY `product_racks_location_id_index` (`location_id`),
  ADD KEY `product_racks_product_id_index` (`product_id`);

--
-- Indexes for table `product_variations`
--
ALTER TABLE `product_variations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_variations_name_index` (`name`),
  ADD KEY `product_variations_product_id_index` (`product_id`);

--
-- Indexes for table `purchase_lines`
--
ALTER TABLE `purchase_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_lines_transaction_id_foreign` (`transaction_id`),
  ADD KEY `purchase_lines_product_id_foreign` (`product_id`),
  ADD KEY `purchase_lines_variation_id_foreign` (`variation_id`),
  ADD KEY `purchase_lines_tax_id_foreign` (`tax_id`),
  ADD KEY `purchase_lines_sub_unit_id_index` (`sub_unit_id`),
  ADD KEY `purchase_lines_lot_number_index` (`lot_number`);

--
-- Indexes for table `reference_counts`
--
ALTER TABLE `reference_counts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reference_counts_business_id_index` (`business_id`);

--
-- Indexes for table `repair_device_models`
--
ALTER TABLE `repair_device_models`
  ADD PRIMARY KEY (`id`),
  ADD KEY `repair_device_models_business_id_foreign` (`business_id`),
  ADD KEY `repair_device_models_brand_id_foreign` (`brand_id`),
  ADD KEY `repair_device_models_device_id_foreign` (`device_id`),
  ADD KEY `repair_device_models_created_by_foreign` (`created_by`);

--
-- Indexes for table `repair_job_sheets`
--
ALTER TABLE `repair_job_sheets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `repair_job_sheets_business_id_foreign` (`business_id`),
  ADD KEY `repair_job_sheets_contact_id_foreign` (`contact_id`),
  ADD KEY `repair_job_sheets_brand_id_foreign` (`brand_id`),
  ADD KEY `repair_job_sheets_device_id_foreign` (`device_id`),
  ADD KEY `repair_job_sheets_device_model_id_foreign` (`device_model_id`),
  ADD KEY `repair_job_sheets_service_staff_foreign` (`service_staff`),
  ADD KEY `repair_job_sheets_created_by_foreign` (`created_by`);

--
-- Indexes for table `repair_statuses`
--
ALTER TABLE `repair_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `res_product_modifier_sets`
--
ALTER TABLE `res_product_modifier_sets`
  ADD KEY `res_product_modifier_sets_modifier_set_id_foreign` (`modifier_set_id`);

--
-- Indexes for table `res_tables`
--
ALTER TABLE `res_tables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `res_tables_business_id_foreign` (`business_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `roles_business_id_foreign` (`business_id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `selling_price_groups`
--
ALTER TABLE `selling_price_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `selling_price_groups_business_id_foreign` (`business_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD UNIQUE KEY `sessions_id_unique` (`id`);

--
-- Indexes for table `stock_adjustment_lines`
--
ALTER TABLE `stock_adjustment_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_adjustment_lines_product_id_foreign` (`product_id`),
  ADD KEY `stock_adjustment_lines_variation_id_foreign` (`variation_id`),
  ADD KEY `stock_adjustment_lines_transaction_id_index` (`transaction_id`),
  ADD KEY `stock_adjustment_lines_lot_no_line_id_index` (`lot_no_line_id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subscriptions_business_id_foreign` (`business_id`),
  ADD KEY `subscriptions_package_id_index` (`package_id`),
  ADD KEY `subscriptions_created_id_index` (`created_id`);

--
-- Indexes for table `superadmin_communicator_logs`
--
ALTER TABLE `superadmin_communicator_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `superadmin_frontend_pages`
--
ALTER TABLE `superadmin_frontend_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system`
--
ALTER TABLE `system`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tax_rates`
--
ALTER TABLE `tax_rates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tax_rates_business_id_foreign` (`business_id`),
  ADD KEY `tax_rates_created_by_foreign` (`created_by`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_tax_id_foreign` (`tax_id`),
  ADD KEY `transactions_business_id_index` (`business_id`),
  ADD KEY `transactions_type_index` (`type`),
  ADD KEY `transactions_contact_id_index` (`contact_id`),
  ADD KEY `transactions_transaction_date_index` (`transaction_date`),
  ADD KEY `transactions_created_by_index` (`created_by`),
  ADD KEY `transactions_location_id_index` (`location_id`),
  ADD KEY `transactions_expense_for_foreign` (`expense_for`),
  ADD KEY `transactions_expense_category_id_index` (`expense_category_id`),
  ADD KEY `transactions_sub_type_index` (`sub_type`),
  ADD KEY `transactions_return_parent_id_index` (`return_parent_id`),
  ADD KEY `type` (`type`),
  ADD KEY `transactions_status_index` (`status`),
  ADD KEY `transactions_sub_status_index` (`sub_status`),
  ADD KEY `transactions_res_table_id_index` (`res_table_id`),
  ADD KEY `transactions_res_waiter_id_index` (`res_waiter_id`),
  ADD KEY `transactions_res_order_status_index` (`res_order_status`),
  ADD KEY `transactions_payment_status_index` (`payment_status`),
  ADD KEY `transactions_discount_type_index` (`discount_type`),
  ADD KEY `transactions_commission_agent_index` (`commission_agent`),
  ADD KEY `transactions_transfer_parent_id_index` (`transfer_parent_id`),
  ADD KEY `transactions_types_of_service_id_index` (`types_of_service_id`),
  ADD KEY `transactions_packing_charge_type_index` (`packing_charge_type`),
  ADD KEY `transactions_recur_parent_id_index` (`recur_parent_id`),
  ADD KEY `transactions_selling_price_group_id_index` (`selling_price_group_id`),
  ADD KEY `transactions_repair_model_id_index` (`repair_model_id`),
  ADD KEY `transactions_repair_job_sheet_id_foreign` (`repair_job_sheet_id`);

--
-- Indexes for table `transaction_payments`
--
ALTER TABLE `transaction_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_payments_transaction_id_foreign` (`transaction_id`),
  ADD KEY `transaction_payments_created_by_index` (`created_by`),
  ADD KEY `transaction_payments_parent_id_index` (`parent_id`);

--
-- Indexes for table `transaction_sell_lines`
--
ALTER TABLE `transaction_sell_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_sell_lines_transaction_id_foreign` (`transaction_id`),
  ADD KEY `transaction_sell_lines_product_id_foreign` (`product_id`),
  ADD KEY `transaction_sell_lines_variation_id_foreign` (`variation_id`),
  ADD KEY `transaction_sell_lines_tax_id_foreign` (`tax_id`),
  ADD KEY `transaction_sell_lines_children_type_index` (`children_type`),
  ADD KEY `transaction_sell_lines_parent_sell_line_id_index` (`parent_sell_line_id`),
  ADD KEY `transaction_sell_lines_line_discount_type_index` (`line_discount_type`),
  ADD KEY `transaction_sell_lines_discount_id_index` (`discount_id`),
  ADD KEY `transaction_sell_lines_lot_no_line_id_index` (`lot_no_line_id`),
  ADD KEY `transaction_sell_lines_sub_unit_id_index` (`sub_unit_id`);

--
-- Indexes for table `transaction_sell_lines_purchase_lines`
--
ALTER TABLE `transaction_sell_lines_purchase_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sell_line_id` (`sell_line_id`),
  ADD KEY `stock_adjustment_line_id` (`stock_adjustment_line_id`),
  ADD KEY `purchase_line_id` (`purchase_line_id`);

--
-- Indexes for table `types_of_services`
--
ALTER TABLE `types_of_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `types_of_services_business_id_index` (`business_id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`),
  ADD KEY `units_business_id_foreign` (`business_id`),
  ADD KEY `units_created_by_foreign` (`created_by`),
  ADD KEY `units_base_unit_id_index` (`base_unit_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD KEY `users_business_id_foreign` (`business_id`),
  ADD KEY `users_user_type_index` (`user_type`),
  ADD KEY `users_crm_contact_id_foreign` (`crm_contact_id`),
  ADD KEY `users_essentials_department_id_index` (`essentials_department_id`),
  ADD KEY `users_essentials_designation_id_index` (`essentials_designation_id`);

--
-- Indexes for table `user_contact_access`
--
ALTER TABLE `user_contact_access`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_contact_access_user_id_index` (`user_id`),
  ADD KEY `user_contact_access_contact_id_index` (`contact_id`);

--
-- Indexes for table `variations`
--
ALTER TABLE `variations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variations_product_id_foreign` (`product_id`),
  ADD KEY `variations_product_variation_id_foreign` (`product_variation_id`),
  ADD KEY `variations_name_index` (`name`),
  ADD KEY `variations_sub_sku_index` (`sub_sku`),
  ADD KEY `variations_variation_value_id_index` (`variation_value_id`);

--
-- Indexes for table `variation_group_prices`
--
ALTER TABLE `variation_group_prices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variation_group_prices_variation_id_foreign` (`variation_id`),
  ADD KEY `variation_group_prices_price_group_id_foreign` (`price_group_id`);

--
-- Indexes for table `variation_location_details`
--
ALTER TABLE `variation_location_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variation_location_details_location_id_foreign` (`location_id`),
  ADD KEY `variation_location_details_product_id_index` (`product_id`),
  ADD KEY `variation_location_details_product_variation_id_index` (`product_variation_id`),
  ADD KEY `variation_location_details_variation_id_index` (`variation_id`);

--
-- Indexes for table `variation_templates`
--
ALTER TABLE `variation_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variation_templates_business_id_foreign` (`business_id`);

--
-- Indexes for table `variation_value_templates`
--
ALTER TABLE `variation_value_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variation_value_templates_name_index` (`name`),
  ADD KEY `variation_value_templates_variation_template_id_index` (`variation_template_id`);

--
-- Indexes for table `warranties`
--
ALTER TABLE `warranties`
  ADD PRIMARY KEY (`id`),
  ADD KEY `warranties_business_id_index` (`business_id`),
  ADD KEY `warranties_duration_type_index` (`duration_type`);

--
-- Indexes for table `woocommerce_sync_logs`
--
ALTER TABLE `woocommerce_sync_logs`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `account_transactions`
--
ALTER TABLE `account_transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `account_types`
--
ALTER TABLE `account_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1047;

--
-- AUTO_INCREMENT for table `barcodes`
--
ALTER TABLE `barcodes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `business`
--
ALTER TABLE `business`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `business_locations`
--
ALTER TABLE `business_locations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cash_registers`
--
ALTER TABLE `cash_registers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cash_register_transactions`
--
ALTER TABLE `cash_register_transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- AUTO_INCREMENT for table `customer_groups`
--
ALTER TABLE `customer_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `dashboard_configurations`
--
ALTER TABLE `dashboard_configurations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `discounts`
--
ALTER TABLE `discounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `document_and_notes`
--
ALTER TABLE `document_and_notes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `essentials_allowances_and_deductions`
--
ALTER TABLE `essentials_allowances_and_deductions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `essentials_attendances`
--
ALTER TABLE `essentials_attendances`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `essentials_documents`
--
ALTER TABLE `essentials_documents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `essentials_document_shares`
--
ALTER TABLE `essentials_document_shares`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `essentials_holidays`
--
ALTER TABLE `essentials_holidays`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `essentials_kb`
--
ALTER TABLE `essentials_kb`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `essentials_kb_users`
--
ALTER TABLE `essentials_kb_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `essentials_leaves`
--
ALTER TABLE `essentials_leaves`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `essentials_leave_types`
--
ALTER TABLE `essentials_leave_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `essentials_messages`
--
ALTER TABLE `essentials_messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `essentials_payroll_groups`
--
ALTER TABLE `essentials_payroll_groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `essentials_reminders`
--
ALTER TABLE `essentials_reminders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `essentials_shifts`
--
ALTER TABLE `essentials_shifts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `essentials_todo_comments`
--
ALTER TABLE `essentials_todo_comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `essentials_to_dos`
--
ALTER TABLE `essentials_to_dos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `essentials_user_shifts`
--
ALTER TABLE `essentials_user_shifts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expense_categories`
--
ALTER TABLE `expense_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `invoice_layouts`
--
ALTER TABLE `invoice_layouts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `invoice_schemes`
--
ALTER TABLE `invoice_schemes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=343;

--
-- AUTO_INCREMENT for table `notification_templates`
--
ALTER TABLE `notification_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=159;

--
-- AUTO_INCREMENT for table `printers`
--
ALTER TABLE `printers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `product_racks`
--
ALTER TABLE `product_racks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_variations`
--
ALTER TABLE `product_variations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `purchase_lines`
--
ALTER TABLE `purchase_lines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `reference_counts`
--
ALTER TABLE `reference_counts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `repair_device_models`
--
ALTER TABLE `repair_device_models`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `repair_job_sheets`
--
ALTER TABLE `repair_job_sheets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `repair_statuses`
--
ALTER TABLE `repair_statuses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `res_tables`
--
ALTER TABLE `res_tables`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `selling_price_groups`
--
ALTER TABLE `selling_price_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `stock_adjustment_lines`
--
ALTER TABLE `stock_adjustment_lines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `superadmin_communicator_logs`
--
ALTER TABLE `superadmin_communicator_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `superadmin_frontend_pages`
--
ALTER TABLE `superadmin_frontend_pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `system`
--
ALTER TABLE `system`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tax_rates`
--
ALTER TABLE `tax_rates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=190;

--
-- AUTO_INCREMENT for table `transaction_payments`
--
ALTER TABLE `transaction_payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `transaction_sell_lines`
--
ALTER TABLE `transaction_sell_lines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=166;

--
-- AUTO_INCREMENT for table `transaction_sell_lines_purchase_lines`
--
ALTER TABLE `transaction_sell_lines_purchase_lines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT for table `types_of_services`
--
ALTER TABLE `types_of_services`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `user_contact_access`
--
ALTER TABLE `user_contact_access`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `variations`
--
ALTER TABLE `variations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `variation_group_prices`
--
ALTER TABLE `variation_group_prices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `variation_location_details`
--
ALTER TABLE `variation_location_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `variation_templates`
--
ALTER TABLE `variation_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `variation_value_templates`
--
ALTER TABLE `variation_value_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `warranties`
--
ALTER TABLE `warranties`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `woocommerce_sync_logs`
--
ALTER TABLE `woocommerce_sync_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barcodes`
--
ALTER TABLE `barcodes`
  ADD CONSTRAINT `barcodes_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `brands`
--
ALTER TABLE `brands`
  ADD CONSTRAINT `brands_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `brands_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `business`
--
ALTER TABLE `business`
  ADD CONSTRAINT `business_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  ADD CONSTRAINT `business_default_sales_tax_foreign` FOREIGN KEY (`default_sales_tax`) REFERENCES `tax_rates` (`id`),
  ADD CONSTRAINT `business_owner_id_foreign` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `business_locations`
--
ALTER TABLE `business_locations`
  ADD CONSTRAINT `business_locations_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `business_locations_invoice_layout_id_foreign` FOREIGN KEY (`invoice_layout_id`) REFERENCES `invoice_layouts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `business_locations_invoice_scheme_id_foreign` FOREIGN KEY (`invoice_scheme_id`) REFERENCES `invoice_schemes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cash_registers`
--
ALTER TABLE `cash_registers`
  ADD CONSTRAINT `cash_registers_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cash_registers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cash_register_transactions`
--
ALTER TABLE `cash_register_transactions`
  ADD CONSTRAINT `cash_register_transactions_cash_register_id_foreign` FOREIGN KEY (`cash_register_id`) REFERENCES `cash_registers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `categories_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `contacts`
--
ALTER TABLE `contacts`
  ADD CONSTRAINT `contacts_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `contacts_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `customer_groups`
--
ALTER TABLE `customer_groups`
  ADD CONSTRAINT `customer_groups_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `dashboard_configurations`
--
ALTER TABLE `dashboard_configurations`
  ADD CONSTRAINT `dashboard_configurations_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `essentials_kb`
--
ALTER TABLE `essentials_kb`
  ADD CONSTRAINT `essentials_kb_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `essentials_kb` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `essentials_payroll_group_transactions`
--
ALTER TABLE `essentials_payroll_group_transactions`
  ADD CONSTRAINT `essentials_payroll_group_transactions_payroll_group_id_foreign` FOREIGN KEY (`payroll_group_id`) REFERENCES `essentials_payroll_groups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD CONSTRAINT `expense_categories_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `group_sub_taxes`
--
ALTER TABLE `group_sub_taxes`
  ADD CONSTRAINT `group_sub_taxes_group_tax_id_foreign` FOREIGN KEY (`group_tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `group_sub_taxes_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invoice_layouts`
--
ALTER TABLE `invoice_layouts`
  ADD CONSTRAINT `invoice_layouts_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invoice_schemes`
--
ALTER TABLE `invoice_schemes`
  ADD CONSTRAINT `invoice_schemes_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `printers`
--
ALTER TABLE `printers`
  ADD CONSTRAINT `printers_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_repair_model_id_foreign` FOREIGN KEY (`repair_model_id`) REFERENCES `repair_device_models` (`id`),
  ADD CONSTRAINT `products_sub_category_id_foreign` FOREIGN KEY (`sub_category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_tax_foreign` FOREIGN KEY (`tax`) REFERENCES `tax_rates` (`id`),
  ADD CONSTRAINT `products_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_variations`
--
ALTER TABLE `product_variations`
  ADD CONSTRAINT `product_variations_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `purchase_lines`
--
ALTER TABLE `purchase_lines`
  ADD CONSTRAINT `purchase_lines_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchase_lines_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchase_lines_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchase_lines_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `repair_device_models`
--
ALTER TABLE `repair_device_models`
  ADD CONSTRAINT `repair_device_models_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`),
  ADD CONSTRAINT `repair_device_models_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `repair_device_models_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `repair_device_models_device_id_foreign` FOREIGN KEY (`device_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `repair_job_sheets`
--
ALTER TABLE `repair_job_sheets`
  ADD CONSTRAINT `repair_job_sheets_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`),
  ADD CONSTRAINT `repair_job_sheets_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `repair_job_sheets_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `repair_job_sheets_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `repair_job_sheets_device_id_foreign` FOREIGN KEY (`device_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `repair_job_sheets_device_model_id_foreign` FOREIGN KEY (`device_model_id`) REFERENCES `repair_device_models` (`id`),
  ADD CONSTRAINT `repair_job_sheets_service_staff_foreign` FOREIGN KEY (`service_staff`) REFERENCES `users` (`id`);

--
-- Constraints for table `res_product_modifier_sets`
--
ALTER TABLE `res_product_modifier_sets`
  ADD CONSTRAINT `res_product_modifier_sets_modifier_set_id_foreign` FOREIGN KEY (`modifier_set_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `res_tables`
--
ALTER TABLE `res_tables`
  ADD CONSTRAINT `res_tables_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `roles`
--
ALTER TABLE `roles`
  ADD CONSTRAINT `roles_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `selling_price_groups`
--
ALTER TABLE `selling_price_groups`
  ADD CONSTRAINT `selling_price_groups_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `stock_adjustment_lines`
--
ALTER TABLE `stock_adjustment_lines`
  ADD CONSTRAINT `stock_adjustment_lines_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `stock_adjustment_lines_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `stock_adjustment_lines_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD CONSTRAINT `subscriptions_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tax_rates`
--
ALTER TABLE `tax_rates`
  ADD CONSTRAINT `tax_rates_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tax_rates_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_expense_category_id_foreign` FOREIGN KEY (`expense_category_id`) REFERENCES `expense_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_expense_for_foreign` FOREIGN KEY (`expense_for`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `business_locations` (`id`),
  ADD CONSTRAINT `transactions_repair_job_sheet_id_foreign` FOREIGN KEY (`repair_job_sheet_id`) REFERENCES `repair_job_sheets` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transaction_payments`
--
ALTER TABLE `transaction_payments`
  ADD CONSTRAINT `transaction_payments_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transaction_sell_lines`
--
ALTER TABLE `transaction_sell_lines`
  ADD CONSTRAINT `transaction_sell_lines_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transaction_sell_lines_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transaction_sell_lines_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transaction_sell_lines_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `units`
--
ALTER TABLE `units`
  ADD CONSTRAINT `units_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `units_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `users_crm_contact_id_foreign` FOREIGN KEY (`crm_contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `variations`
--
ALTER TABLE `variations`
  ADD CONSTRAINT `variations_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `variations_product_variation_id_foreign` FOREIGN KEY (`product_variation_id`) REFERENCES `product_variations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `variation_group_prices`
--
ALTER TABLE `variation_group_prices`
  ADD CONSTRAINT `variation_group_prices_price_group_id_foreign` FOREIGN KEY (`price_group_id`) REFERENCES `selling_price_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `variation_group_prices_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `variation_location_details`
--
ALTER TABLE `variation_location_details`
  ADD CONSTRAINT `variation_location_details_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `business_locations` (`id`),
  ADD CONSTRAINT `variation_location_details_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`);

--
-- Constraints for table `variation_templates`
--
ALTER TABLE `variation_templates`
  ADD CONSTRAINT `variation_templates_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `variation_value_templates`
--
ALTER TABLE `variation_value_templates`
  ADD CONSTRAINT `variation_value_templates_variation_template_id_foreign` FOREIGN KEY (`variation_template_id`) REFERENCES `variation_templates` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
