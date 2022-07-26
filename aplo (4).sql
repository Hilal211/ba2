-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 26, 2022 at 01:32 PM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aplo`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity`
--

DROP TABLE IF EXISTS `activity`;
CREATE TABLE IF NOT EXISTS `activity` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `archived` smallint(1) NOT NULL DEFAULT '0' COMMENT '0:Not Archived, 1:Archived',
  PRIMARY KEY (`id`),
  KEY `FK_updated_by_10` (`updated_by`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `activity`
--

INSERT INTO `activity` (`id`, `name`, `created_date`, `updated_date`, `updated_by`, `archived`) VALUES
(1, 'activity1', '2022-07-25 09:52:51', '2022-07-25 09:52:51', NULL, 0),
(2, 'activity2', '2022-07-25 09:53:10', '2022-07-25 09:53:10', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `login_id` int(10) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `archived` smallint(1) NOT NULL DEFAULT '0' COMMENT '0:Not Archived, 1:Archived',
  PRIMARY KEY (`id`),
  KEY `FK_login_03` (`login_id`),
  KEY `FK_updated_by_09` (`updated_by`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `attribute`
--

DROP TABLE IF EXISTS `attribute`;
CREATE TABLE IF NOT EXISTS `attribute` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `dependencies` smallint(1) NOT NULL COMMENT '1:Inventory, 2:Pictures and Inventory, 3:Informational',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `archived` smallint(1) NOT NULL DEFAULT '0' COMMENT '0:Not Archived, 1:Archived',
  PRIMARY KEY (`id`),
  KEY `FK_updated_by_14` (`updated_by`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attribute`
--

INSERT INTO `attribute` (`id`, `name`, `dependencies`, `created_date`, `updated_date`, `updated_by`, `archived`) VALUES
(1, 'Color', 2, '2022-07-25 14:05:09', '2022-07-25 14:05:09', NULL, 0),
(2, 'Storage capacity', 1, '2022-07-25 14:05:09', '2022-07-25 14:05:09', NULL, 0),
(3, 'Display size', 3, '2022-07-25 14:06:05', '2022-07-25 14:06:05', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `attribute_value`
--

DROP TABLE IF EXISTS `attribute_value`;
CREATE TABLE IF NOT EXISTS `attribute_value` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `attribute_id` int(10) UNSIGNED DEFAULT NULL,
  `value` varchar(50) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `archived` smallint(1) NOT NULL DEFAULT '0' COMMENT '0:Not Archived, 1:Archived',
  PRIMARY KEY (`id`),
  KEY `attribute_id` (`attribute_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attribute_value`
--

INSERT INTO `attribute_value` (`id`, `attribute_id`, `value`, `created_date`, `updated_date`, `updated_by`, `archived`) VALUES
(1, 1, 'Graphite', '2022-07-25 14:35:35', '2022-07-25 14:35:35', NULL, 0),
(2, 1, 'Alpine Green', '2022-07-25 14:35:35', '2022-07-25 14:35:35', NULL, 0),
(3, 1, 'Gold', '2022-07-25 14:35:35', '2022-07-25 14:35:35', NULL, 0),
(4, 1, 'Silver', '2022-07-25 14:35:35', '2022-07-25 14:35:35', NULL, 0),
(5, 2, '125 Gb', '2022-07-25 14:36:08', '2022-07-25 14:36:08', NULL, 0),
(6, 2, '256 Gb', '2022-07-25 14:36:08', '2022-07-25 14:36:08', NULL, 0),
(7, 3, '6\'\'', '2022-07-25 14:36:34', '2022-07-25 14:36:34', NULL, 0),
(8, 3, '7.5\'\'', '2022-07-25 14:36:34', '2022-07-25 14:36:34', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
CREATE TABLE IF NOT EXISTS `brand` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `archived` smallint(1) NOT NULL DEFAULT '0' COMMENT '0:Not Archived, 1:Archived	',
  PRIMARY KEY (`id`),
  KEY `FK_updated_by_08` (`updated_by`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`id`, `name`, `created_date`, `updated_date`, `updated_by`, `archived`) VALUES
(1, 'Apple', '2022-07-25 09:54:20', '2022-07-25 09:54:20', NULL, 0),
(2, 'samsung', '2022-07-25 13:13:45', '2022-07-25 13:13:45', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `business_request`
--

DROP TABLE IF EXISTS `business_request`;
CREATE TABLE IF NOT EXISTS `business_request` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `brand_id` int(10) UNSIGNED DEFAULT NULL,
  `brand_name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `activity_id` int(10) UNSIGNED DEFAULT NULL,
  `activity_name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `full_name` varchar(100) CHARACTER SET utf8 NOT NULL,
  `position` varchar(75) CHARACTER SET utf8 NOT NULL,
  `website` varchar(100) NOT NULL,
  `email` varchar(75) CHARACTER SET utf8 NOT NULL,
  `password` varchar(60) CHARACTER SET utf8 NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_brand_01` (`brand_id`),
  KEY `FK_activity_01` (`activity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `business_request`
--

INSERT INTO `business_request` (`id`, `brand_id`, `brand_name`, `activity_id`, `activity_name`, `full_name`, `position`, `website`, `email`, `password`, `created_date`) VALUES
(1, 1, 'Apple', 1, 'activity1', 'test', 'position', 'www.test.com', 'test@gmail.com', '$2b$10$IwsUYmHAVqx/sLlSCOwcueIynawNvS852h.9DiQL6rZ2IvyB11p7a', '2022-07-25 10:05:58');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `archived` smallint(1) NOT NULL DEFAULT '0' COMMENT '0:Not Archived, 1:Archived',
  PRIMARY KEY (`id`),
  KEY `FK_updated_by_07` (`updated_by`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `parent_id`, `created_date`, `updated_date`, `updated_by`, `archived`) VALUES
(1, 'Electronics', NULL, '2022-07-25 10:07:40', '2022-07-25 10:07:40', NULL, 0),
(2, 'Mobile', 1, '2022-07-25 10:08:17', '2022-07-25 10:08:17', NULL, 0),
(3, 'Computers', 1, '2022-07-25 10:08:17', '2022-07-25 10:08:17', NULL, 0),
(4, 'SmartPhones', 2, '2022-07-25 10:08:52', '2022-07-25 10:08:52', NULL, 0),
(5, 'Laptops', 3, '2022-07-25 10:08:52', '2022-07-25 10:08:52', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
CREATE TABLE IF NOT EXISTS `content` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `slug` varchar(50) NOT NULL,
  `title` varchar(50) CHARACTER SET utf8 NOT NULL,
  `text` text CHARACTER SET utf8 NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `archived` smallint(1) NOT NULL COMMENT '0:Not Archived, 1:Archived',
  PRIMARY KEY (`id`),
  KEY `FK_updated_by_18` (`updated_by`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
CREATE TABLE IF NOT EXISTS `country` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(75) NOT NULL,
  `sortname` varchar(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=247 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`id`, `name`, `sortname`) VALUES
(1, 'Afghanistan', 'AF'),
(2, 'Albania', 'AL'),
(3, 'Algeria', 'DZ'),
(4, 'American Samoa', 'AS'),
(5, 'Andorra', 'AD'),
(6, 'Angola', 'AO'),
(7, 'Anguilla', 'AI'),
(8, 'Antarctica', 'AQ'),
(9, 'Antigua And Barbuda', 'AG'),
(10, 'Argentina', 'AR'),
(11, 'Armenia', 'AM'),
(12, 'Aruba', 'AW'),
(13, 'Australia', 'AU'),
(14, 'Austria', 'AT'),
(15, 'Azerbaijan', 'AZ'),
(16, 'Bahamas The', 'BS'),
(17, 'Bahrain', 'BH'),
(18, 'Bangladesh', 'BD'),
(19, 'Barbados', 'BB'),
(20, 'Belarus', 'BY'),
(21, 'Belgium', 'BE'),
(22, 'Belize', 'BZ'),
(23, 'Benin', 'BJ'),
(24, 'Bermuda', 'BM'),
(25, 'Bhutan', 'BT'),
(26, 'Bolivia', 'BO'),
(27, 'Bosnia and Herzegovina', 'BA'),
(28, 'Botswana', 'BW'),
(29, 'Bouvet Island', 'BV'),
(30, 'Brazil', 'BR'),
(31, 'British Indian Ocean Territory', 'IO'),
(32, 'Brunei', 'BN'),
(33, 'Bulgaria', 'BG'),
(34, 'Burkina Faso', 'BF'),
(35, 'Burundi', 'BI'),
(36, 'Cambodia', 'KH'),
(37, 'Cameroon', 'CM'),
(38, 'Canada', 'CA'),
(39, 'Cape Verde', 'CV'),
(40, 'Cayman Islands', 'KY'),
(41, 'Central African Republic', 'CF'),
(42, 'Chad', 'TD'),
(43, 'Chile', 'CL'),
(44, 'China', 'CN'),
(45, 'Christmas Island', 'CX'),
(46, 'Cocos (Keeling) Islands', 'CC'),
(47, 'Colombia', 'CO'),
(48, 'Comoros', 'KM'),
(49, 'Congo', 'CG'),
(50, 'Congo The Democratic Republic Of The', 'CD'),
(51, 'Cook Islands', 'CK'),
(52, 'Costa Rica', 'CR'),
(53, 'Cote D\'Ivoire (Ivory Coast)', 'CI'),
(54, 'Croatia (Hrvatska)', 'HR'),
(55, 'Cuba', 'CU'),
(56, 'Cyprus', 'CY'),
(57, 'Czech Republic', 'CZ'),
(58, 'Denmark', 'DK'),
(59, 'Djibouti', 'DJ'),
(60, 'Dominica', 'DM'),
(61, 'Dominican Republic', 'DO'),
(62, 'East Timor', 'TP'),
(63, 'Ecuador', 'EC'),
(64, 'Egypt', 'EG'),
(65, 'El Salvador', 'SV'),
(66, 'Equatorial Guinea', 'GQ'),
(67, 'Eritrea', 'ER'),
(68, 'Estonia', 'EE'),
(69, 'Ethiopia', 'ET'),
(70, 'External Territories of Australia', 'XA'),
(71, 'Falkland Islands', 'FK'),
(72, 'Faroe Islands', 'FO'),
(73, 'Fiji Islands', 'FJ'),
(74, 'Finland', 'FI'),
(75, 'France', 'FR'),
(76, 'French Guiana', 'GF'),
(77, 'French Polynesia', 'PF'),
(78, 'French Southern Territories', 'TF'),
(79, 'Gabon', 'GA'),
(80, 'Gambia The', 'GM'),
(81, 'Georgia', 'GE'),
(82, 'Germany', 'DE'),
(83, 'Ghana', 'GH'),
(84, 'Gibraltar', 'GI'),
(85, 'Greece', 'GR'),
(86, 'Greenland', 'GL'),
(87, 'Grenada', 'GD'),
(88, 'Guadeloupe', 'GP'),
(89, 'Guam', 'GU'),
(90, 'Guatemala', 'GT'),
(91, 'Guernsey and Alderney', 'XU'),
(92, 'Guinea', 'GN'),
(93, 'Guinea-Bissau', 'GW'),
(94, 'Guyana', 'GY'),
(95, 'Haiti', 'HT'),
(96, 'Heard and McDonald Islands', 'HM'),
(97, 'Honduras', 'HN'),
(98, 'Hong Kong S.A.R.', 'HK'),
(99, 'Hungary', 'HU'),
(100, 'Iceland', 'IS'),
(101, 'India', 'IN'),
(102, 'Indonesia', 'ID'),
(103, 'Iran', 'IR'),
(104, 'Iraq', 'IQ'),
(105, 'Ireland', 'IE'),
(106, 'Israel', 'IL'),
(107, 'Italy', 'IT'),
(108, 'Jamaica', 'JM'),
(109, 'Japan', 'JP'),
(110, 'Jersey', 'XJ'),
(111, 'Jordan', 'JO'),
(112, 'Kazakhstan', 'KZ'),
(113, 'Kenya', 'KE'),
(114, 'Kiribati', 'KI'),
(115, 'Korea North', 'KP'),
(116, 'Korea South', 'KR'),
(117, 'Kuwait', 'KW'),
(118, 'Kyrgyzstan', 'KG'),
(119, 'Laos', 'LA'),
(120, 'Latvia', 'LV'),
(121, 'Lebanon', 'LB'),
(122, 'Lesotho', 'LS'),
(123, 'Liberia', 'LR'),
(124, 'Libya', 'LY'),
(125, 'Liechtenstein', 'LI'),
(126, 'Lithuania', 'LT'),
(127, 'Luxembourg', 'LU'),
(128, 'Macau S.A.R.', 'MO'),
(129, 'Macedonia', 'MK'),
(130, 'Madagascar', 'MG'),
(131, 'Malawi', 'MW'),
(132, 'Malaysia', 'MY'),
(133, 'Maldives', 'MV'),
(134, 'Mali', 'ML'),
(135, 'Malta', 'MT'),
(136, 'Man (Isle of)', 'XM'),
(137, 'Marshall Islands', 'MH'),
(138, 'Martinique', 'MQ'),
(139, 'Mauritania', 'MR'),
(140, 'Mauritius', 'MU'),
(141, 'Mayotte', 'YT'),
(142, 'Mexico', 'MX'),
(143, 'Micronesia', 'FM'),
(144, 'Moldova', 'MD'),
(145, 'Monaco', 'MC'),
(146, 'Mongolia', 'MN'),
(147, 'Montserrat', 'MS'),
(148, 'Morocco', 'MA'),
(149, 'Mozambique', 'MZ'),
(150, 'Myanmar', 'MM'),
(151, 'Namibia', 'NA'),
(152, 'Nauru', 'NR'),
(153, 'Nepal', 'NP'),
(154, 'Netherlands Antilles', 'AN'),
(155, 'Netherlands The', 'NL'),
(156, 'New Caledonia', 'NC'),
(157, 'New Zealand', 'NZ'),
(158, 'Nicaragua', 'NI'),
(159, 'Niger', 'NE'),
(160, 'Nigeria', 'NG'),
(161, 'Niue', 'NU'),
(162, 'Norfolk Island', 'NF'),
(163, 'Northern Mariana Islands', 'MP'),
(164, 'Norway', 'NO'),
(165, 'Oman', 'OM'),
(166, 'Pakistan', 'PK'),
(167, 'Palau', 'PW'),
(168, 'Palestinian Territory Occupied', 'PS'),
(169, 'Panama', 'PA'),
(170, 'Papua new Guinea', 'PG'),
(171, 'Paraguay', 'PY'),
(172, 'Peru', 'PE'),
(173, 'Philippines', 'PH'),
(174, 'Pitcairn Island', 'PN'),
(175, 'Poland', 'PL'),
(176, 'Portugal', 'PT'),
(177, 'Puerto Rico', 'PR'),
(178, 'Qatar', 'QA'),
(179, 'Reunion', 'RE'),
(180, 'Romania', 'RO'),
(181, 'Russia', 'RU'),
(182, 'Rwanda', 'RW'),
(183, 'Saint Helena', 'SH'),
(184, 'Saint Kitts And Nevis', 'KN'),
(185, 'Saint Lucia', 'LC'),
(186, 'Saint Pierre and Miquelon', 'PM'),
(187, 'Saint Vincent And The Grenadines', 'VC'),
(188, 'Samoa', 'WS'),
(189, 'San Marino', 'SM'),
(190, 'Sao Tome and Principe', 'ST'),
(191, 'Saudi Arabia', 'SA'),
(192, 'Senegal', 'SN'),
(193, 'Serbia', 'RS'),
(194, 'Seychelles', 'SC'),
(195, 'Sierra Leone', 'SL'),
(196, 'Singapore', 'SG'),
(197, 'Slovakia', 'SK'),
(198, 'Slovenia', 'SI'),
(199, 'Smaller Territories of the UK', 'XG'),
(200, 'Solomon Islands', 'SB'),
(201, 'Somalia', 'SO'),
(202, 'South Africa', 'ZA'),
(203, 'South Georgia', 'GS'),
(204, 'South Sudan', 'SS'),
(205, 'Spain', 'ES'),
(206, 'Sri Lanka', 'LK'),
(207, 'Sudan', 'SD'),
(208, 'Suriname', 'SR'),
(209, 'Svalbard And Jan Mayen Islands', 'SJ'),
(210, 'Swaziland', 'SZ'),
(211, 'Sweden', 'SE'),
(212, 'Switzerland', 'CH'),
(213, 'Syria', 'SY'),
(214, 'Taiwan', 'TW'),
(215, 'Tajikistan', 'TJ'),
(216, 'Tanzania', 'TZ'),
(217, 'Thailand', 'TH'),
(218, 'Togo', 'TG'),
(219, 'Tokelau', 'TK'),
(220, 'Tonga', 'TO'),
(221, 'Trinidad And Tobago', 'TT'),
(222, 'Tunisia', 'TN'),
(223, 'Turkey', 'TR'),
(224, 'Turkmenistan', 'TM'),
(225, 'Turks And Caicos Islands', 'TC'),
(226, 'Tuvalu', 'TV'),
(227, 'Uganda', 'UG'),
(228, 'Ukraine', 'UA'),
(229, 'United Arab Emirates', 'AE'),
(230, 'United Kingdom', 'GB'),
(231, 'United States', 'US'),
(232, 'United States Minor Outlying Islands', 'UM'),
(233, 'Uruguay', 'UY'),
(234, 'Uzbekistan', 'UZ'),
(235, 'Vanuatu', 'VU'),
(236, 'Vatican City State (Holy See)', 'VA'),
(237, 'Venezuela', 'VE'),
(238, 'Vietnam', 'VN'),
(239, 'Virgin Islands (British)', 'VG'),
(240, 'Virgin Islands (US)', 'VI'),
(241, 'Wallis And Futuna Islands', 'WF'),
(242, 'Western Sahara', 'EH'),
(243, 'Yemen', 'YE'),
(244, 'Yugoslavia', 'YU'),
(245, 'Zambia', 'ZM'),
(246, 'Zimbabwe', 'ZW');

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
CREATE TABLE IF NOT EXISTS `event` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(150) CHARACTER SET utf8 NOT NULL,
  `text` varchar(500) CHARACTER SET utf8 NOT NULL,
  `store_id` int(10) UNSIGNED DEFAULT NULL,
  `link` varchar(150) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_updated_by_13` (`updated_by`),
  KEY `FK_store` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
CREATE TABLE IF NOT EXISTS `log` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `login_id` int(10) UNSIGNED DEFAULT NULL,
  `file` varchar(150) CHARACTER SET utf8 NOT NULL,
  `extra` text CHARACTER SET utf8 NOT NULL,
  `error` varchar(500) CHARACTER SET utf8 NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_login_04` (`login_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `log`
--

INSERT INTO `log` (`id`, `login_id`, `file`, `extra`, `error`, `created_date`) VALUES
(3, NULL, 'business_request-createBusinessRequest', 'QueryFailedError: ER_NO_SUCH_TABLE: Table \'aplo.business_requests\' doesn\'t exist\n    at Query.<anonymous> (C:\\Users\\Daniel\\Desktop\\Aplo\\api\\src\\driver\\mysql\\MysqlQueryRunner.ts:222:33)\n    at Query.<anonymous> (C:\\Users\\Daniel\\node_modules\\mysql\\lib\\Connection.js:526:10)\n    at Query._callback (C:\\Users\\Daniel\\node_modules\\mysql\\lib\\Connection.js:488:16)\n    at Query.Sequence.end (C:\\Users\\Daniel\\node_modules\\mysql\\lib\\protocol\\sequences\\Sequence.js:83:24)\n    at Query.ErrorPacket (C:\\Users\\Daniel\\node_modules\\mysql\\lib\\protocol\\sequences\\Query.js:92:8)\n    at Protocol._parsePacket (C:\\Users\\Daniel\\node_modules\\mysql\\lib\\protocol\\Protocol.js:291:23)\n    at Parser._parsePacket (C:\\Users\\Daniel\\node_modules\\mysql\\lib\\protocol\\Parser.js:433:10)\n    at Parser.write (C:\\Users\\Daniel\\node_modules\\mysql\\lib\\protocol\\Parser.js:43:10)\n    at Protocol.write (C:\\Users\\Daniel\\node_modules\\mysql\\lib\\protocol\\Protocol.js:38:16)\n    at Socket.<anonymous> (C:\\Users\\Daniel\\node_modules\\mysql\\lib\\Connection.js:88:28)', 'ER_NO_SUCH_TABLE: Table \'aplo.business_requests\' doesn\'t exist', '2022-07-25 09:57:57'),
(4, NULL, 'business_request-createBusinessRequest', 'QueryFailedError: ER_NO_SUCH_TABLE: Table \'aplo.business_requests\' doesn\'t exist\n    at Query.<anonymous> (C:\\Users\\Daniel\\Desktop\\Aplo\\api\\src\\driver\\mysql\\MysqlQueryRunner.ts:222:33)\n    at Query.<anonymous> (C:\\Users\\Daniel\\node_modules\\mysql\\lib\\Connection.js:526:10)\n    at Query._callback (C:\\Users\\Daniel\\node_modules\\mysql\\lib\\Connection.js:488:16)\n    at Query.Sequence.end (C:\\Users\\Daniel\\node_modules\\mysql\\lib\\protocol\\sequences\\Sequence.js:83:24)\n    at Query.ErrorPacket (C:\\Users\\Daniel\\node_modules\\mysql\\lib\\protocol\\sequences\\Query.js:92:8)\n    at Protocol._parsePacket (C:\\Users\\Daniel\\node_modules\\mysql\\lib\\protocol\\Protocol.js:291:23)\n    at Parser._parsePacket (C:\\Users\\Daniel\\node_modules\\mysql\\lib\\protocol\\Parser.js:433:10)\n    at Parser.write (C:\\Users\\Daniel\\node_modules\\mysql\\lib\\protocol\\Parser.js:43:10)\n    at Protocol.write (C:\\Users\\Daniel\\node_modules\\mysql\\lib\\protocol\\Protocol.js:38:16)\n    at Socket.<anonymous> (C:\\Users\\Daniel\\node_modules\\mysql\\lib\\Connection.js:88:28)', 'ER_NO_SUCH_TABLE: Table \'aplo.business_requests\' doesn\'t exist', '2022-07-25 10:02:39'),
(6, NULL, 'product-findAll', 'EntityPropertyNotFoundError: Property \"parent\" was not found in \"Category\". Make sure your query is correct.\n    at C:\\Users\\Daniel\\Desktop\\Aplo\\api\\src\\query-builder\\SelectQueryBuilder.ts:3677:23\n    at Array.forEach (<anonymous>)\n    at SelectQueryBuilder.buildRelations (C:\\Users\\Daniel\\Desktop\\Aplo\\api\\src\\query-builder\\SelectQueryBuilder.ts:3669:32)\n    at C:\\Users\\Daniel\\Desktop\\Aplo\\api\\src\\query-builder\\SelectQueryBuilder.ts:3739:26\n    at Array.forEach (<anonymous>)\n    at SelectQueryBuilder.buildRelations (C:\\Users\\Daniel\\Desktop\\Aplo\\api\\src\\query-builder\\SelectQueryBuilder.ts:3669:32)\n    at SelectQueryBuilder.applyFindOptions (C:\\Users\\Daniel\\Desktop\\Aplo\\api\\src\\query-builder\\SelectQueryBuilder.ts:2911:22)\n    at SelectQueryBuilder.setFindOptions (C:\\Users\\Daniel\\Desktop\\Aplo\\api\\src\\query-builder\\SelectQueryBuilder.ts:103:14)\n    at EntityManager.find (C:\\Users\\Daniel\\Desktop\\Aplo\\api\\src\\entity-manager\\EntityManager.ts:993:14)\n    at Repository.find (C:\\Users\\Daniel\\Desktop\\Aplo\\api\\src\\repository\\Repository.ts:476:29)', 'Property \"parent\" was not found in \"Category\". Make sure your query is correct.', '2022-07-25 10:22:46'),
(7, NULL, 'attributeValue-findMaster', 'EntityPropertyNotFoundError: Property \"value\" was not found in \"AttributeValue\". Make sure your query is correct.\n    at C:\\Users\\Daniel\\Desktop\\Aplo\\api\\src\\query-builder\\SelectQueryBuilder.ts:3677:23\n    at Array.forEach (<anonymous>)\n    at SelectQueryBuilder.buildRelations (C:\\Users\\Daniel\\Desktop\\Aplo\\api\\src\\query-builder\\SelectQueryBuilder.ts:3669:32)\n    at SelectQueryBuilder.applyFindOptions (C:\\Users\\Daniel\\Desktop\\Aplo\\api\\src\\query-builder\\SelectQueryBuilder.ts:2911:22)\n    at SelectQueryBuilder.setFindOptions (C:\\Users\\Daniel\\Desktop\\Aplo\\api\\src\\query-builder\\SelectQueryBuilder.ts:103:14)\n    at EntityManager.find (C:\\Users\\Daniel\\Desktop\\Aplo\\api\\src\\entity-manager\\EntityManager.ts:993:14)\n    at Repository.find (C:\\Users\\Daniel\\Desktop\\Aplo\\api\\src\\repository\\Repository.ts:476:29)\n    at AttributeValueService.findAllWithAttribute (C:\\Users\\Daniel\\Desktop\\Aplo\\api\\src\\attribute_value\\attribute_value.service.ts:14:48)\n    at AttributeValueController.findMaster (C:\\Users\\Daniel\\Desktop\\Aplo\\api\\src\\attribute_value\\attribute_value.controller.ts:26:61)\n    at C:\\Users\\Daniel\\Desktop\\Aplo\\api\\node_modules\\@nestjs\\core\\router\\router-execution-context.js:38:29', 'Property \"value\" was not found in \"AttributeValue\". Make sure your query is correct.', '2022-07-25 15:25:46');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
CREATE TABLE IF NOT EXISTS `login` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` varchar(75) CHARACTER SET utf8 NOT NULL,
  `password` varchar(60) CHARACTER SET utf8 DEFAULT NULL,
  `type` smallint(1) NOT NULL COMMENT '1:user, 2:store, 3:admin',
  `verification_token` varchar(60) CHARACTER SET utf8 NOT NULL,
  `password_reset_token` varchar(60) CHARACTER SET utf8 NOT NULL,
  `social_type` smallint(1) NOT NULL DEFAULT '0' COMMENT '0:None, 1:Apple, 2:Gmail, 3:Facebook',
  `social_token` varchar(60) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `archived` smallint(1) NOT NULL DEFAULT '0' COMMENT '0:Not Archived, 1:Archived',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
CREATE TABLE IF NOT EXISTS `news` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(150) CHARACTER SET utf8 NOT NULL,
  `summary` varchar(250) CHARACTER SET utf8 NOT NULL,
  `text` text CHARACTER SET utf8 NOT NULL,
  `featured_image` varchar(75) NOT NULL,
  `banner_image` varchar(75) NOT NULL,
  `news_date` datetime NOT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `store_id` int(10) UNSIGNED DEFAULT NULL,
  `hashtags` varchar(250) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_category_04` (`category_id`),
  KEY `FK_updated_by_06` (`updated_by`),
  KEY `FK_store_02` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(75) CHARACTER SET utf8 NOT NULL,
  `tag` varchar(75) CHARACTER SET utf8 NOT NULL,
  `brand_id` int(10) UNSIGNED DEFAULT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `upid` varchar(20) CHARACTER SET utf8 NOT NULL,
  `barcode` varchar(20) CHARACTER SET utf8 NOT NULL,
  `featured_image` varchar(75) CHARACTER SET utf8 NOT NULL,
  `rate` smallint(1) DEFAULT NULL,
  `nb_reviews` int(10) UNSIGNED DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `status` smallint(1) NOT NULL COMMENT '0:Not Active, 1:Active, 2:Requested',
  `archived` smallint(1) NOT NULL DEFAULT '0' COMMENT '0:Not Archived, 1:Archived',
  PRIMARY KEY (`id`),
  KEY `FK_brand_03` (`brand_id`),
  KEY `FK_category_05` (`category_id`),
  KEY `FK_updated_by_05` (`updated_by`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `tag`, `brand_id`, `category_id`, `upid`, `barcode`, `featured_image`, `rate`, `nb_reviews`, `created_date`, `updated_date`, `updated_by`, `status`, `archived`) VALUES
(1, 'iPhone 13 Pro', 'iPhone13pro', 1, 4, '123', '1234', '', NULL, NULL, '2022-07-25 10:18:11', '2022-07-25 10:18:11', NULL, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `product_attribute`
--

DROP TABLE IF EXISTS `product_attribute`;
CREATE TABLE IF NOT EXISTS `product_attribute` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `attribute_id` int(10) UNSIGNED DEFAULT NULL,
  `value_id` int(10) UNSIGNED DEFAULT NULL,
  `value` varchar(75) NOT NULL COMMENT 'In case of Information Attributes',
  `default` smallint(1) NOT NULL DEFAULT '0' COMMENT '0:Not Default, 1:Default',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `archived` smallint(1) NOT NULL DEFAULT '0' COMMENT '0:Not Archived, 1:Archived',
  PRIMARY KEY (`id`),
  KEY `FK_product_03` (`product_id`),
  KEY `FK_attribute` (`attribute_id`) USING BTREE,
  KEY `FK_value` (`value_id`),
  KEY `FK_updated_by_15` (`updated_by`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product_attribute_picture`
--

DROP TABLE IF EXISTS `product_attribute_picture`;
CREATE TABLE IF NOT EXISTS `product_attribute_picture` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_attribute_id` int(10) UNSIGNED DEFAULT NULL,
  `image` varchar(75) NOT NULL,
  `default` smallint(6) NOT NULL DEFAULT '0' COMMENT '0:Not Default, 1:Default',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_product_attribute` (`product_attribute_id`),
  KEY `FK_created_by_03` (`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product_picture`
--

DROP TABLE IF EXISTS `product_picture`;
CREATE TABLE IF NOT EXISTS `product_picture` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `image` varchar(75) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_product_04` (`product_id`),
  KEY `FK_created_by_04` (`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product_style`
--

DROP TABLE IF EXISTS `product_style`;
CREATE TABLE IF NOT EXISTS `product_style` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `style_id` int(10) UNSIGNED NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_product_02` (`product_id`),
  KEY `FK_created_by_02` (`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product_variation`
--

DROP TABLE IF EXISTS `product_variation`;
CREATE TABLE IF NOT EXISTS `product_variation` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `variation` json NOT NULL COMMENT '{barcode:949403403, color:Graphite, capacity:265 GB}',
  `created_date` datetime NOT NULL,
  `updated_date` int(10) UNSIGNED NOT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `archived` smallint(1) NOT NULL DEFAULT '0' COMMENT '0:Not Archived, 1:Archived',
  PRIMARY KEY (`id`),
  KEY `FK_product_05` (`product_id`),
  KEY `FK_updated_by_16` (`updated_by`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `profile_category`
--

DROP TABLE IF EXISTS `profile_category`;
CREATE TABLE IF NOT EXISTS `profile_category` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `brand_id` int(10) DEFAULT NULL,
  `store_id` int(10) UNSIGNED DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `archived` smallint(1) DEFAULT '0' COMMENT '0:Not Archived, 1:Archived',
  PRIMARY KEY (`id`),
  KEY `FK_category` (`category_id`),
  KEY `FK_updated_by_04` (`updated_by`),
  KEY `FK_store_04` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `profile_category_product`
--

DROP TABLE IF EXISTS `profile_category_product`;
CREATE TABLE IF NOT EXISTS `profile_category_product` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `profile_category_id` int(10) UNSIGNED DEFAULT NULL,
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_profile_category` (`profile_category_id`),
  KEY `product_id` (`product_id`),
  KEY `FK_created_by_05` (`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `promotion`
--

DROP TABLE IF EXISTS `promotion`;
CREATE TABLE IF NOT EXISTS `promotion` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `text` varchar(250) CHARACTER SET utf8 NOT NULL,
  `store_id` int(10) UNSIGNED DEFAULT NULL,
  `active` smallint(1) NOT NULL DEFAULT '1' COMMENT '0:Not Active, 1:Active',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_login_02` (`store_id`),
  KEY `FK_updated_by_03` (`updated_by`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
CREATE TABLE IF NOT EXISTS `review` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `text` varchar(500) CHARACTER SET utf8 NOT NULL,
  `rate` smallint(1) NOT NULL COMMENT 'From 1 to 5',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_created_by` (`created_by`),
  KEY `FK_product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
CREATE TABLE IF NOT EXISTS `state` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(75) CHARACTER SET utf8 NOT NULL,
  `country_id` int(10) UNSIGNED DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `FK_country` (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `store`
--

DROP TABLE IF EXISTS `store`;
CREATE TABLE IF NOT EXISTS `store` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(75) CHARACTER SET utf8 NOT NULL,
  `brand_id` int(10) UNSIGNED DEFAULT NULL,
  `activity_id` int(10) UNSIGNED DEFAULT NULL,
  `website` varchar(150) CHARACTER SET utf8 NOT NULL,
  `full_name` varchar(100) CHARACTER SET utf8 NOT NULL,
  `position` varchar(75) CHARACTER SET utf8 NOT NULL,
  `login_id` int(10) UNSIGNED DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `status` smallint(1) NOT NULL DEFAULT '1' COMMENT '0:Not Active, 1:Active',
  `archived` smallint(1) NOT NULL COMMENT '0:Not Archived, 1:Archived',
  PRIMARY KEY (`id`),
  KEY `FK_brand_02` (`brand_id`),
  KEY `FK_activity_02` (`activity_id`),
  KEY `FK_login` (`login_id`),
  KEY `FK_updated_by_02` (`updated_by`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `store_product`
--

DROP TABLE IF EXISTS `store_product`;
CREATE TABLE IF NOT EXISTS `store_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_variation_id` int(10) UNSIGNED DEFAULT NULL,
  `qty` int(11) NOT NULL,
  `price` float NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `archived` smallint(1) NOT NULL DEFAULT '0' COMMENT '0:Not Archived, 1:Archived',
  PRIMARY KEY (`id`),
  KEY `FK_product_variation` (`product_variation_id`),
  KEY `FK_updated_by_17` (`updated_by`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `style`
--

DROP TABLE IF EXISTS `style`;
CREATE TABLE IF NOT EXISTS `style` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `archived` smallint(1) NOT NULL COMMENT '0:Not Archived, 1:Archived	',
  PRIMARY KEY (`id`),
  KEY `FK_category_02` (`category_id`),
  KEY `FK_updated_by_11` (`updated_by`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `login_id` int(10) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `gender` smallint(1) DEFAULT NULL COMMENT '1:Male, 2:Female',
  `birthday` date NOT NULL,
  `nationality_id` int(10) UNSIGNED DEFAULT NULL,
  `country_id` int(10) UNSIGNED DEFAULT NULL,
  `state_id` int(10) UNSIGNED DEFAULT NULL,
  `profile_image` varchar(75) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_login_02` (`login_id`),
  KEY `FK_nationality` (`nationality_id`),
  KEY `FK_country_02` (`country_id`),
  KEY `FK_state` (`state_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_address`
--

DROP TABLE IF EXISTS `user_address`;
CREATE TABLE IF NOT EXISTS `user_address` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `country_id` int(10) UNSIGNED DEFAULT NULL,
  `state_id` int(10) UNSIGNED DEFAULT NULL,
  `address` varchar(100) NOT NULL,
  `type` smallint(6) NOT NULL COMMENT '1:Home, 2:Work',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_country_03` (`country_id`),
  KEY `FK_state_02` (`state_id`),
  KEY `FK_user_03` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_dates`
--

DROP TABLE IF EXISTS `user_dates`;
CREATE TABLE IF NOT EXISTS `user_dates` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `date_name` varchar(50) NOT NULL,
  `type` smallint(1) NOT NULL COMMENT '1:Nameday, 2:Anniversary, 3:Other',
  `month` smallint(2) NOT NULL,
  `day` smallint(2) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_user_04` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_email`
--

DROP TABLE IF EXISTS `user_email`;
CREATE TABLE IF NOT EXISTS `user_email` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `email` varchar(75) NOT NULL,
  `type` smallint(1) NOT NULL COMMENT '1:Apple, 2:Google, 3:Personal',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_social_media`
--

DROP TABLE IF EXISTS `user_social_media`;
CREATE TABLE IF NOT EXISTS `user_social_media` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `link` varchar(150) NOT NULL,
  `type` smallint(1) NOT NULL COMMENT '1:Instagram, 2:Facebook, 3:Twitter, 4:Linkedin',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_user_02` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_style`
--

DROP TABLE IF EXISTS `user_style`;
CREATE TABLE IF NOT EXISTS `user_style` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `style_id` int(10) UNSIGNED DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_user_05` (`user_id`),
  KEY `FK_style` (`style_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activity`
--
ALTER TABLE `activity`
  ADD CONSTRAINT `FK_updated_by_10` FOREIGN KEY (`updated_by`) REFERENCES `login` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `FK_login_03` FOREIGN KEY (`login_id`) REFERENCES `login` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `FK_updated_by_09` FOREIGN KEY (`updated_by`) REFERENCES `login` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `attribute`
--
ALTER TABLE `attribute`
  ADD CONSTRAINT `FK_updated_by_14` FOREIGN KEY (`updated_by`) REFERENCES `login` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `attribute_value`
--
ALTER TABLE `attribute_value`
  ADD CONSTRAINT `attribute_value_ibfk_1` FOREIGN KEY (`attribute_id`) REFERENCES `attribute` (`id`);

--
-- Constraints for table `brand`
--
ALTER TABLE `brand`
  ADD CONSTRAINT `FK_updated_by_08` FOREIGN KEY (`updated_by`) REFERENCES `login` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `business_request`
--
ALTER TABLE `business_request`
  ADD CONSTRAINT `FK_activity_01` FOREIGN KEY (`activity_id`) REFERENCES `activity` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `FK_brand_01` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `FK_updated_by_07` FOREIGN KEY (`updated_by`) REFERENCES `login` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `category_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `category` (`id`);

--
-- Constraints for table `content`
--
ALTER TABLE `content`
  ADD CONSTRAINT `FK_updated_by_18` FOREIGN KEY (`updated_by`) REFERENCES `login` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `event`
--
ALTER TABLE `event`
  ADD CONSTRAINT `FK_store` FOREIGN KEY (`store_id`) REFERENCES `store` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `FK_updated_by_13` FOREIGN KEY (`updated_by`) REFERENCES `login` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `log`
--
ALTER TABLE `log`
  ADD CONSTRAINT `FK_login_04` FOREIGN KEY (`login_id`) REFERENCES `login` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `FK_category_04` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `FK_store_02` FOREIGN KEY (`store_id`) REFERENCES `store` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `FK_updated_by_06` FOREIGN KEY (`updated_by`) REFERENCES `login` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_brand_03` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `FK_category_05` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `FK_updated_by_05` FOREIGN KEY (`updated_by`) REFERENCES `login` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `product_attribute`
--
ALTER TABLE `product_attribute`
  ADD CONSTRAINT `FK_attribute` FOREIGN KEY (`attribute_id`) REFERENCES `product_attribute` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `FK_product_03` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `FK_updated_by_15` FOREIGN KEY (`updated_by`) REFERENCES `login` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `FK_value` FOREIGN KEY (`value_id`) REFERENCES `attribute_value` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `product_attribute_picture`
--
ALTER TABLE `product_attribute_picture`
  ADD CONSTRAINT `FK_created_by_03` FOREIGN KEY (`created_by`) REFERENCES `login` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `FK_product_attribute` FOREIGN KEY (`product_attribute_id`) REFERENCES `product_attribute` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `product_picture`
--
ALTER TABLE `product_picture`
  ADD CONSTRAINT `FK_created_by_04` FOREIGN KEY (`created_by`) REFERENCES `login` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `FK_product_04` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `product_style`
--
ALTER TABLE `product_style`
  ADD CONSTRAINT `FK_created_by_02` FOREIGN KEY (`created_by`) REFERENCES `login` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `FK_product_02` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `product_variation`
--
ALTER TABLE `product_variation`
  ADD CONSTRAINT `FK_product_05` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `FK_updated_by_16` FOREIGN KEY (`updated_by`) REFERENCES `login` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `profile_category`
--
ALTER TABLE `profile_category`
  ADD CONSTRAINT `FK_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `FK_store_04` FOREIGN KEY (`store_id`) REFERENCES `store` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `FK_updated_by_04` FOREIGN KEY (`updated_by`) REFERENCES `login` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `profile_category_product`
--
ALTER TABLE `profile_category_product`
  ADD CONSTRAINT `FK_created_by_05` FOREIGN KEY (`created_by`) REFERENCES `login` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `FK_profile_category` FOREIGN KEY (`profile_category_id`) REFERENCES `profile_category` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `promotion`
--
ALTER TABLE `promotion`
  ADD CONSTRAINT `FK_store_03` FOREIGN KEY (`store_id`) REFERENCES `store` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `FK_updated_by_03` FOREIGN KEY (`updated_by`) REFERENCES `login` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `FK_created_by` FOREIGN KEY (`created_by`) REFERENCES `login` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `FK_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `state`
--
ALTER TABLE `state`
  ADD CONSTRAINT `FK_country` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `store`
--
ALTER TABLE `store`
  ADD CONSTRAINT `FK_activity_02` FOREIGN KEY (`activity_id`) REFERENCES `activity` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `FK_brand_02` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `FK_login` FOREIGN KEY (`login_id`) REFERENCES `login` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `FK_updated_by_02` FOREIGN KEY (`updated_by`) REFERENCES `login` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `store_product`
--
ALTER TABLE `store_product`
  ADD CONSTRAINT `FK_product_variation` FOREIGN KEY (`product_variation_id`) REFERENCES `product_variation` (`id`),
  ADD CONSTRAINT `FK_updated_by_17` FOREIGN KEY (`updated_by`) REFERENCES `login` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `style`
--
ALTER TABLE `style`
  ADD CONSTRAINT `FK_category_02` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `FK_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `login` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK_country_02` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `FK_login_02` FOREIGN KEY (`login_id`) REFERENCES `login` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `FK_nationality` FOREIGN KEY (`nationality_id`) REFERENCES `country` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `FK_state` FOREIGN KEY (`state_id`) REFERENCES `state` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `user_address`
--
ALTER TABLE `user_address`
  ADD CONSTRAINT `FK_country_03` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `FK_state_02` FOREIGN KEY (`state_id`) REFERENCES `state` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `FK_user_03` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `user_dates`
--
ALTER TABLE `user_dates`
  ADD CONSTRAINT `FK_user_04` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `user_email`
--
ALTER TABLE `user_email`
  ADD CONSTRAINT `FK_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `user_social_media`
--
ALTER TABLE `user_social_media`
  ADD CONSTRAINT `FK_user_02` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `user_style`
--
ALTER TABLE `user_style`
  ADD CONSTRAINT `FK_style` FOREIGN KEY (`style_id`) REFERENCES `style` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `FK_user_05` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
