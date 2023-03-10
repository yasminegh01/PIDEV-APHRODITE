-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 10, 2023 at 12:08 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aphrodite`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment_request`
--

CREATE TABLE `appointment_request` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthday` date NOT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phonenumber` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `new_old` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `appointmentprocedure` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `appointmentdate` date NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lien` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `appointmentime` time NOT NULL,
  `id_patient_id` int(11) NOT NULL,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `appointment_request`
--

INSERT INTO `appointment_request` (`id`, `name`, `lastname`, `birthday`, `gender`, `phonenumber`, `email`, `new_old`, `appointmentprocedure`, `appointmentdate`, `type`, `lien`, `appointmentime`, `id_patient_id`, `status`) VALUES
(13, 'jgggggg', 'Abbes', '2021-10-30', 'Female', '+21653413551', 'abbesashraf@gmail.com', 'yes', 'Result Analysis', '2021-10-30', 'cabinet', 'dddddddddd', '01:00:00', 1, ''),
(14, 'Achraf', 'Abbes', '2022-10-29', 'Female', '+21653413551', 'abbesashraf@gmail.com', 'yes', 'Result Analysis', '2022-11-30', 'cabinet', 'dddddd', '00:00:00', 2, ''),
(16, 'ggggg', 'Abbes', '2021-09-29', 'Female', '+21653413551', 'abbesashraf@gmail.com', 'no', 'Result Analysis', '2022-10-30', 'cabinet', 'sssssssss', '02:01:00', 3, ''),
(17, 'Achraf', 'Abbes', '2019-09-27', 'Female', '+21653413551', 'abbesashraf@gmail.com', 'yes', 'Check-up', '2021-09-27', 'cabinet', 'dddddddd', '00:00:00', 3, '');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `published_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`id`, `post_id`, `author_id`, `content`, `published_at`) VALUES
(12, 3, 3, 'Morbi tempus commodo mattis. Eros diam egestas libero eu vulputate risus. Diatrias tolerare tanquam noster caesium. Lorem ipsum dolor sit amet consectetur adipiscing elit. Ubi est audax amicitia. Mauris dapibus risus quis suscipit vulputate. Abnobas sunt hilotaes de placidus vita. Vae humani generis.', '2023-02-13 17:01:11'),
(13, 3, 3, 'Sunt seculaes transferre talis camerarius fluctuies. Era brevis ratione est. Ubi est barbatus nix. Eposs sunt solems de superbus fortis. Morbi tempus commodo mattis. Teres talis saepe tractare de camerarius flavum sensorem. Potus sensim ad ferox abnoba. Abnobas sunt hilotaes de placidus vita. In hac habitasse platea dictumst. Aliquam sodales odio id eleifend tristique.', '2023-02-13 17:01:12'),
(14, 3, 3, 'Vae humani generis. Ut suscipit posuere justo at vulputate. Eros diam egestas libero eu vulputate risus. Pellentesque vitae velit ex. Nulla porta lobortis ligula vel egestas. Teres talis saepe tractare de camerarius flavum sensorem. Diatrias tolerare tanquam noster caesium. Abnobas sunt hilotaes de placidus vita. Sed varius a risus eget aliquam. Sunt torquises imitari velox mirabilis medicinaes. Ubi est barbatus nix. Urna nisl sollicitudin id varius orci quam id turpis.', '2023-02-13 17:01:13'),
(15, 3, 3, 'Mauris dapibus risus quis suscipit vulputate. Pellentesque et sapien pulvinar consectetur. Sunt accentores vitare salvus flavum parses. Era brevis ratione est. Sed varius a risus eget aliquam. Sunt torquises imitari velox mirabilis medicinaes. Teres talis saepe tractare de camerarius flavum sensorem. Ut suscipit posuere justo at vulputate. Lorem ipsum dolor sit amet consectetur adipiscing elit. Silva de secundus galatae demitto quadra. Pellentesque vitae velit ex.', '2023-02-13 17:01:14'),
(16, 4, 3, 'Pellentesque vitae velit ex. Ut suscipit posuere justo at vulputate. Eposs sunt solems de superbus fortis. Sed varius a risus eget aliquam. Ut eleifend mauris et risus ultrices egestas. Sunt seculaes transferre talis camerarius fluctuies. Diatrias tolerare tanquam noster caesium. Ubi est barbatus nix. Bassus fatalis classiss virtualiter transferre de flavum. Urna nisl sollicitudin id varius orci quam id turpis.', '2023-02-13 17:01:10'),
(17, 4, 3, 'Era brevis ratione est. Ut eleifend mauris et risus ultrices egestas. Teres talis saepe tractare de camerarius flavum sensorem. Sunt torquises imitari velox mirabilis medicinaes. Eposs sunt solems de superbus fortis. Mineralis persuadere omnes finises desiderium.', '2023-02-13 17:01:11'),
(18, 4, 3, 'Sunt torquises imitari velox mirabilis medicinaes. Ubi est audax amicitia. Sunt seculaes transferre talis camerarius fluctuies. Nunc viverra elit ac laoreet suscipit. Mauris dapibus risus quis suscipit vulputate. Lorem ipsum dolor sit amet consectetur adipiscing elit. Era brevis ratione est. Sunt accentores vitare salvus flavum parses. In hac habitasse platea dictumst. Vae humani generis. Teres talis saepe tractare de camerarius flavum sensorem. Ubi est barbatus nix.', '2023-02-13 17:01:12'),
(19, 4, 3, 'Teres talis saepe tractare de camerarius flavum sensorem. Nulla porta lobortis ligula vel egestas. Abnobas sunt hilotaes de placidus vita. In hac habitasse platea dictumst. Silva de secundus galatae demitto quadra. Sed varius a risus eget aliquam. Ut suscipit posuere justo at vulputate. Ut eleifend mauris et risus ultrices egestas. Ubi est audax amicitia. Mineralis persuadere omnes finises desiderium. Sunt accentores vitare salvus flavum parses. Nunc viverra elit ac laoreet suscipit.', '2023-02-13 17:01:13'),
(20, 4, 3, 'Silva de secundus galatae demitto quadra. Mauris dapibus risus quis suscipit vulputate. Mineralis persuadere omnes finises desiderium. In hac habitasse platea dictumst. Bassus fatalis classiss virtualiter transferre de flavum. Sunt seculaes transferre talis camerarius fluctuies. Urna nisl sollicitudin id varius orci quam id turpis.', '2023-02-13 17:01:14'),
(26, 6, 3, 'Aliquam sodales odio id eleifend tristique. Pellentesque vitae velit ex. In hac habitasse platea dictumst. Urna nisl sollicitudin id varius orci quam id turpis. Abnobas sunt hilotaes de placidus vita. Sunt accentores vitare salvus flavum parses. Ut eleifend mauris et risus ultrices egestas.', '2023-02-13 17:01:10'),
(27, 6, 3, 'Sunt torquises imitari velox mirabilis medicinaes. Lorem ipsum dolor sit amet consectetur adipiscing elit. Morbi tempus commodo mattis. Sunt seculaes transferre talis camerarius fluctuies. Era brevis ratione est. Nunc viverra elit ac laoreet suscipit. Ubi est audax amicitia. Silva de secundus galatae demitto quadra.', '2023-02-13 17:01:11'),
(28, 6, 3, 'Nunc viverra elit ac laoreet suscipit. In hac habitasse platea dictumst. Sunt accentores vitare salvus flavum parses. Ubi est barbatus nix. Eros diam egestas libero eu vulputate risus. Mineralis persuadere omnes finises desiderium. Lorem ipsum dolor sit amet consectetur adipiscing elit. Teres talis saepe tractare de camerarius flavum sensorem. Sed varius a risus eget aliquam. Era brevis ratione est. Sunt seculaes transferre talis camerarius fluctuies.', '2023-02-13 17:01:12'),
(29, 6, 3, 'Eros diam egestas libero eu vulputate risus. Bassus fatalis classiss virtualiter transferre de flavum. Ubi est barbatus nix. Morbi tempus commodo mattis. In hac habitasse platea dictumst. Ut eleifend mauris et risus ultrices egestas. Pellentesque et sapien pulvinar consectetur. Mineralis persuadere omnes finises desiderium. Nulla porta lobortis ligula vel egestas. Vae humani generis. Ubi est audax amicitia. Sunt seculaes transferre talis camerarius fluctuies. Era brevis ratione est.', '2023-02-13 17:01:13'),
(30, 6, 3, 'Urna nisl sollicitudin id varius orci quam id turpis. Bassus fatalis classiss virtualiter transferre de flavum. Sunt seculaes transferre talis camerarius fluctuies. Vae humani generis. Potus sensim ad ferox abnoba. Teres talis saepe tractare de camerarius flavum sensorem. In hac habitasse platea dictumst. Ut suscipit posuere justo at vulputate. Curabitur aliquam euismod dolor non ornare.', '2023-02-13 17:01:14'),
(31, 7, 3, 'Eros diam egestas libero eu vulputate risus. Mauris dapibus risus quis suscipit vulputate. Ubi est barbatus nix. Urna nisl sollicitudin id varius orci quam id turpis. Era brevis ratione est. Eposs sunt solems de superbus fortis. Lorem ipsum dolor sit amet consectetur adipiscing elit. In hac habitasse platea dictumst. Sunt accentores vitare salvus flavum parses. Pellentesque et sapien pulvinar consectetur. Morbi tempus commodo mattis.', '2023-02-13 17:01:10'),
(32, 7, 3, 'Potus sensim ad ferox abnoba. Ut eleifend mauris et risus ultrices egestas. Diatrias tolerare tanquam noster caesium. Morbi tempus commodo mattis. Silva de secundus galatae demitto quadra. Vae humani generis. Ut suscipit posuere justo at vulputate.', '2023-02-13 17:01:11'),
(33, 7, 3, 'Lorem ipsum dolor sit amet consectetur adipiscing elit. Eposs sunt solems de superbus fortis. Ut eleifend mauris et risus ultrices egestas. Potus sensim ad ferox abnoba. Eros diam egestas libero eu vulputate risus. Pellentesque et sapien pulvinar consectetur. Morbi tempus commodo mattis. Nulla porta lobortis ligula vel egestas.', '2023-02-13 17:01:12'),
(34, 7, 3, 'Pellentesque et sapien pulvinar consectetur. Bassus fatalis classiss virtualiter transferre de flavum. Silva de secundus galatae demitto quadra. Diatrias tolerare tanquam noster caesium. Lorem ipsum dolor sit amet consectetur adipiscing elit. Curabitur aliquam euismod dolor non ornare. Urna nisl sollicitudin id varius orci quam id turpis.', '2023-02-13 17:01:13'),
(35, 7, 3, 'In hac habitasse platea dictumst. Eposs sunt solems de superbus fortis. Curabitur aliquam euismod dolor non ornare. Abnobas sunt hilotaes de placidus vita. Eros diam egestas libero eu vulputate risus. Aliquam sodales odio id eleifend tristique. Pellentesque et sapien pulvinar consectetur.', '2023-02-13 17:01:14'),
(36, 8, 3, 'Bassus fatalis classiss virtualiter transferre de flavum. Ubi est audax amicitia. Ut suscipit posuere justo at vulputate. In hac habitasse platea dictumst. Lorem ipsum dolor sit amet consectetur adipiscing elit. Sed varius a risus eget aliquam. Pellentesque vitae velit ex. Morbi tempus commodo mattis. Ubi est barbatus nix. Aliquam sodales odio id eleifend tristique. Eposs sunt solems de superbus fortis. Eros diam egestas libero eu vulputate risus.', '2023-02-13 17:01:10'),
(37, 8, 3, 'Morbi tempus commodo mattis. Pellentesque et sapien pulvinar consectetur. Ut suscipit posuere justo at vulputate. Sunt torquises imitari velox mirabilis medicinaes. Eros diam egestas libero eu vulputate risus. Vae humani generis. Sunt accentores vitare salvus flavum parses. Aliquam sodales odio id eleifend tristique. Lorem ipsum dolor sit amet consectetur adipiscing elit. Urna nisl sollicitudin id varius orci quam id turpis.', '2023-02-13 17:01:11'),
(38, 8, 3, 'Ut suscipit posuere justo at vulputate. Abnobas sunt hilotaes de placidus vita. Mauris dapibus risus quis suscipit vulputate. Teres talis saepe tractare de camerarius flavum sensorem. Sunt torquises imitari velox mirabilis medicinaes. Ut eleifend mauris et risus ultrices egestas. Curabitur aliquam euismod dolor non ornare. Vae humani generis. Ubi est barbatus nix. Sunt seculaes transferre talis camerarius fluctuies. Sunt accentores vitare salvus flavum parses.', '2023-02-13 17:01:12'),
(39, 8, 3, 'Bassus fatalis classiss virtualiter transferre de flavum. Ubi est barbatus nix. Era brevis ratione est. Eposs sunt solems de superbus fortis. Sunt accentores vitare salvus flavum parses. Morbi tempus commodo mattis. Potus sensim ad ferox abnoba.', '2023-02-13 17:01:13'),
(40, 8, 3, 'Eros diam egestas libero eu vulputate risus. Vae humani generis. Nunc viverra elit ac laoreet suscipit. Ut eleifend mauris et risus ultrices egestas. Eposs sunt solems de superbus fortis. Ubi est barbatus nix. Potus sensim ad ferox abnoba. Mineralis persuadere omnes finises desiderium.', '2023-02-13 17:01:14'),
(41, 9, 3, 'Curabitur aliquam euismod dolor non ornare. Aliquam sodales odio id eleifend tristique. Abnobas sunt hilotaes de placidus vita. Nulla porta lobortis ligula vel egestas. Mauris dapibus risus quis suscipit vulputate. Nunc viverra elit ac laoreet suscipit. Diatrias tolerare tanquam noster caesium. Morbi tempus commodo mattis. Silva de secundus galatae demitto quadra. Ut eleifend mauris et risus ultrices egestas.', '2023-02-13 17:01:10'),
(42, 9, 3, 'Ubi est audax amicitia. Sunt torquises imitari velox mirabilis medicinaes. Ut eleifend mauris et risus ultrices egestas. Bassus fatalis classiss virtualiter transferre de flavum. Lorem ipsum dolor sit amet consectetur adipiscing elit. Sunt seculaes transferre talis camerarius fluctuies.', '2023-02-13 17:01:11'),
(43, 9, 3, 'Mineralis persuadere omnes finises desiderium. Urna nisl sollicitudin id varius orci quam id turpis. Eposs sunt solems de superbus fortis. Sunt seculaes transferre talis camerarius fluctuies. Bassus fatalis classiss virtualiter transferre de flavum. Sunt accentores vitare salvus flavum parses. Eros diam egestas libero eu vulputate risus.', '2023-02-13 17:01:12'),
(44, 9, 3, 'Urna nisl sollicitudin id varius orci quam id turpis. Nulla porta lobortis ligula vel egestas. Curabitur aliquam euismod dolor non ornare. Ut suscipit posuere justo at vulputate. Era brevis ratione est. Eros diam egestas libero eu vulputate risus. Bassus fatalis classiss virtualiter transferre de flavum. Pellentesque vitae velit ex.', '2023-02-13 17:01:13'),
(45, 9, 3, 'Bassus fatalis classiss virtualiter transferre de flavum. Ubi est barbatus nix. Curabitur aliquam euismod dolor non ornare. Eposs sunt solems de superbus fortis. Pellentesque vitae velit ex. Era brevis ratione est. Mauris dapibus risus quis suscipit vulputate. In hac habitasse platea dictumst. Nunc viverra elit ac laoreet suscipit. Sed varius a risus eget aliquam. Pellentesque et sapien pulvinar consectetur.', '2023-02-13 17:01:14'),
(46, 10, 3, 'Nulla porta lobortis ligula vel egestas. Pellentesque et sapien pulvinar consectetur. Sunt torquises imitari velox mirabilis medicinaes. Eposs sunt solems de superbus fortis. Morbi tempus commodo mattis. Curabitur aliquam euismod dolor non ornare. Silva de secundus galatae demitto quadra. Lorem ipsum dolor sit amet consectetur adipiscing elit. Teres talis saepe tractare de camerarius flavum sensorem.', '2023-02-13 17:01:10'),
(47, 10, 3, 'Sunt torquises imitari velox mirabilis medicinaes. Teres talis saepe tractare de camerarius flavum sensorem. Diatrias tolerare tanquam noster caesium. Potus sensim ad ferox abnoba. Sunt accentores vitare salvus flavum parses. Mineralis persuadere omnes finises desiderium. Pellentesque et sapien pulvinar consectetur.', '2023-02-13 17:01:11'),
(48, 10, 3, 'Lorem ipsum dolor sit amet consectetur adipiscing elit. Morbi tempus commodo mattis. Mineralis persuadere omnes finises desiderium. Era brevis ratione est. Abnobas sunt hilotaes de placidus vita. Silva de secundus galatae demitto quadra. Pellentesque et sapien pulvinar consectetur. Ut eleifend mauris et risus ultrices egestas.', '2023-02-13 17:01:12'),
(49, 10, 3, 'Diatrias tolerare tanquam noster caesium. Pellentesque et sapien pulvinar consectetur. Pellentesque vitae velit ex. Ubi est barbatus nix. Silva de secundus galatae demitto quadra. Morbi tempus commodo mattis. Aliquam sodales odio id eleifend tristique. Sunt torquises imitari velox mirabilis medicinaes. Era brevis ratione est. Eros diam egestas libero eu vulputate risus. In hac habitasse platea dictumst. Ut eleifend mauris et risus ultrices egestas.', '2023-02-13 17:01:13'),
(50, 10, 3, 'Urna nisl sollicitudin id varius orci quam id turpis. Eposs sunt solems de superbus fortis. Ut eleifend mauris et risus ultrices egestas. Sunt torquises imitari velox mirabilis medicinaes. Abnobas sunt hilotaes de placidus vita. Lorem ipsum dolor sit amet consectetur adipiscing elit. In hac habitasse platea dictumst. Era brevis ratione est. Sed varius a risus eget aliquam. Vae humani generis. Silva de secundus galatae demitto quadra.', '2023-02-13 17:01:14'),
(51, 11, 3, 'Sed varius a risus eget aliquam. Ut suscipit posuere justo at vulputate. Sunt seculaes transferre talis camerarius fluctuies. Lorem ipsum dolor sit amet consectetur adipiscing elit. Era brevis ratione est. Pellentesque et sapien pulvinar consectetur. Bassus fatalis classiss virtualiter transferre de flavum. Nunc viverra elit ac laoreet suscipit. Vae humani generis. Aliquam sodales odio id eleifend tristique. Teres talis saepe tractare de camerarius flavum sensorem.', '2023-02-13 17:01:10'),
(52, 11, 3, 'Eros diam egestas libero eu vulputate risus. Potus sensim ad ferox abnoba. Pellentesque vitae velit ex. Mineralis persuadere omnes finises desiderium. Ubi est barbatus nix. Nunc viverra elit ac laoreet suscipit. Sed varius a risus eget aliquam. Nulla porta lobortis ligula vel egestas. Teres talis saepe tractare de camerarius flavum sensorem. Pellentesque et sapien pulvinar consectetur. Sunt accentores vitare salvus flavum parses.', '2023-02-13 17:01:11'),
(53, 11, 3, 'Teres talis saepe tractare de camerarius flavum sensorem. Ut suscipit posuere justo at vulputate. Curabitur aliquam euismod dolor non ornare. Vae humani generis. Pellentesque et sapien pulvinar consectetur. Potus sensim ad ferox abnoba. In hac habitasse platea dictumst. Mauris dapibus risus quis suscipit vulputate. Ubi est audax amicitia. Abnobas sunt hilotaes de placidus vita.', '2023-02-13 17:01:12'),
(54, 11, 3, 'Ubi est audax amicitia. Sunt seculaes transferre talis camerarius fluctuies. Eposs sunt solems de superbus fortis. Vae humani generis. Sed varius a risus eget aliquam. Ut eleifend mauris et risus ultrices egestas. Nulla porta lobortis ligula vel egestas. Ut suscipit posuere justo at vulputate.', '2023-02-13 17:01:13'),
(55, 11, 3, 'Silva de secundus galatae demitto quadra. Sed varius a risus eget aliquam. Nulla porta lobortis ligula vel egestas. Nunc viverra elit ac laoreet suscipit. Ubi est audax amicitia. Mauris dapibus risus quis suscipit vulputate. Ubi est barbatus nix. Era brevis ratione est. Urna nisl sollicitudin id varius orci quam id turpis.', '2023-02-13 17:01:14'),
(56, 12, 3, 'Ubi est barbatus nix. Era brevis ratione est. Eposs sunt solems de superbus fortis. Sed varius a risus eget aliquam. Ubi est audax amicitia. Sunt torquises imitari velox mirabilis medicinaes. Nulla porta lobortis ligula vel egestas. Pellentesque vitae velit ex. Abnobas sunt hilotaes de placidus vita. In hac habitasse platea dictumst. Pellentesque et sapien pulvinar consectetur.', '2023-02-13 17:01:10'),
(57, 12, 3, 'Sunt accentores vitare salvus flavum parses. Morbi tempus commodo mattis. Curabitur aliquam euismod dolor non ornare. Potus sensim ad ferox abnoba. Pellentesque vitae velit ex. Mauris dapibus risus quis suscipit vulputate. Bassus fatalis classiss virtualiter transferre de flavum. Teres talis saepe tractare de camerarius flavum sensorem. Ubi est audax amicitia.', '2023-02-13 17:01:11'),
(58, 12, 3, 'Ut suscipit posuere justo at vulputate. Abnobas sunt hilotaes de placidus vita. Eposs sunt solems de superbus fortis. Pellentesque et sapien pulvinar consectetur. Nunc viverra elit ac laoreet suscipit. Morbi tempus commodo mattis. Sunt seculaes transferre talis camerarius fluctuies.', '2023-02-13 17:01:12'),
(59, 12, 3, 'Ubi est audax amicitia. Teres talis saepe tractare de camerarius flavum sensorem. Ut eleifend mauris et risus ultrices egestas. Sunt torquises imitari velox mirabilis medicinaes. Mauris dapibus risus quis suscipit vulputate. Eposs sunt solems de superbus fortis. Era brevis ratione est. Mineralis persuadere omnes finises desiderium. Potus sensim ad ferox abnoba.', '2023-02-13 17:01:13'),
(60, 12, 3, 'Bassus fatalis classiss virtualiter transferre de flavum. Sunt seculaes transferre talis camerarius fluctuies. Morbi tempus commodo mattis. Ubi est audax amicitia. Eros diam egestas libero eu vulputate risus. In hac habitasse platea dictumst. Urna nisl sollicitudin id varius orci quam id turpis. Sunt accentores vitare salvus flavum parses. Abnobas sunt hilotaes de placidus vita.', '2023-02-13 17:01:14'),
(61, 13, 3, 'Silva de secundus galatae demitto quadra. Diatrias tolerare tanquam noster caesium. Vae humani generis. In hac habitasse platea dictumst. Eposs sunt solems de superbus fortis. Bassus fatalis classiss virtualiter transferre de flavum. Mauris dapibus risus quis suscipit vulputate. Eros diam egestas libero eu vulputate risus. Mineralis persuadere omnes finises desiderium.', '2023-02-13 17:01:10'),
(62, 13, 3, 'Sunt torquises imitari velox mirabilis medicinaes. Curabitur aliquam euismod dolor non ornare. Era brevis ratione est. Pellentesque et sapien pulvinar consectetur. Vae humani generis. Ubi est barbatus nix. Sed varius a risus eget aliquam. Aliquam sodales odio id eleifend tristique. Potus sensim ad ferox abnoba. Eposs sunt solems de superbus fortis. Ut eleifend mauris et risus ultrices egestas. Nunc viverra elit ac laoreet suscipit. Mineralis persuadere omnes finises desiderium.', '2023-02-13 17:01:11'),
(63, 13, 3, 'Sunt torquises imitari velox mirabilis medicinaes. Nunc viverra elit ac laoreet suscipit. Diatrias tolerare tanquam noster caesium. Ubi est barbatus nix. Eposs sunt solems de superbus fortis. Ubi est audax amicitia. Abnobas sunt hilotaes de placidus vita. Nulla porta lobortis ligula vel egestas. Aliquam sodales odio id eleifend tristique. In hac habitasse platea dictumst.', '2023-02-13 17:01:12'),
(64, 13, 3, 'Vae humani generis. Potus sensim ad ferox abnoba. Ubi est audax amicitia. Diatrias tolerare tanquam noster caesium. Era brevis ratione est. In hac habitasse platea dictumst. Sed varius a risus eget aliquam.', '2023-02-13 17:01:13'),
(65, 13, 3, 'Era brevis ratione est. Potus sensim ad ferox abnoba. Teres talis saepe tractare de camerarius flavum sensorem. Abnobas sunt hilotaes de placidus vita. Silva de secundus galatae demitto quadra. Bassus fatalis classiss virtualiter transferre de flavum. Lorem ipsum dolor sit amet consectetur adipiscing elit. Pellentesque et sapien pulvinar consectetur. Diatrias tolerare tanquam noster caesium. Morbi tempus commodo mattis.', '2023-02-13 17:01:14'),
(66, 14, 3, 'Sed varius a risus eget aliquam. Ut suscipit posuere justo at vulputate. Silva de secundus galatae demitto quadra. Ut eleifend mauris et risus ultrices egestas. Teres talis saepe tractare de camerarius flavum sensorem. Ubi est audax amicitia. Mineralis persuadere omnes finises desiderium. Urna nisl sollicitudin id varius orci quam id turpis. Potus sensim ad ferox abnoba.', '2023-02-13 17:01:10'),
(67, 14, 3, 'Diatrias tolerare tanquam noster caesium. Curabitur aliquam euismod dolor non ornare. Sed varius a risus eget aliquam. Silva de secundus galatae demitto quadra. Sunt seculaes transferre talis camerarius fluctuies. Urna nisl sollicitudin id varius orci quam id turpis. Potus sensim ad ferox abnoba. Vae humani generis. Nunc viverra elit ac laoreet suscipit. In hac habitasse platea dictumst. Mineralis persuadere omnes finises desiderium.', '2023-02-13 17:01:11'),
(68, 14, 3, 'Mauris dapibus risus quis suscipit vulputate. In hac habitasse platea dictumst. Sed varius a risus eget aliquam. Eposs sunt solems de superbus fortis. Vae humani generis. Curabitur aliquam euismod dolor non ornare. Bassus fatalis classiss virtualiter transferre de flavum. Eros diam egestas libero eu vulputate risus. Ubi est barbatus nix.', '2023-02-13 17:01:12'),
(69, 14, 3, 'Eros diam egestas libero eu vulputate risus. Bassus fatalis classiss virtualiter transferre de flavum. Potus sensim ad ferox abnoba. Ubi est barbatus nix. Nunc viverra elit ac laoreet suscipit. Abnobas sunt hilotaes de placidus vita. Silva de secundus galatae demitto quadra. Urna nisl sollicitudin id varius orci quam id turpis. Sunt accentores vitare salvus flavum parses.', '2023-02-13 17:01:13'),
(70, 14, 3, 'Nulla porta lobortis ligula vel egestas. Sunt accentores vitare salvus flavum parses. Ubi est barbatus nix. Mineralis persuadere omnes finises desiderium. Vae humani generis. Ut suscipit posuere justo at vulputate. Morbi tempus commodo mattis. Mauris dapibus risus quis suscipit vulputate. Sunt seculaes transferre talis camerarius fluctuies.', '2023-02-13 17:01:14'),
(71, 15, 3, 'Diatrias tolerare tanquam noster caesium. Pellentesque et sapien pulvinar consectetur. Vae humani generis. Ut eleifend mauris et risus ultrices egestas. Curabitur aliquam euismod dolor non ornare. Mineralis persuadere omnes finises desiderium. Lorem ipsum dolor sit amet consectetur adipiscing elit. Sed varius a risus eget aliquam. Ubi est barbatus nix.', '2023-02-13 17:01:10'),
(72, 15, 3, 'Ut eleifend mauris et risus ultrices egestas. Sunt torquises imitari velox mirabilis medicinaes. Potus sensim ad ferox abnoba. Nunc viverra elit ac laoreet suscipit. Mineralis persuadere omnes finises desiderium. Curabitur aliquam euismod dolor non ornare. Ut suscipit posuere justo at vulputate. Lorem ipsum dolor sit amet consectetur adipiscing elit. Ubi est barbatus nix.', '2023-02-13 17:01:11'),
(73, 15, 3, 'Nunc viverra elit ac laoreet suscipit. Teres talis saepe tractare de camerarius flavum sensorem. Sunt torquises imitari velox mirabilis medicinaes. Ut eleifend mauris et risus ultrices egestas. Nulla porta lobortis ligula vel egestas. Sunt accentores vitare salvus flavum parses. Mineralis persuadere omnes finises desiderium. Vae humani generis. Sunt seculaes transferre talis camerarius fluctuies. Era brevis ratione est. Ubi est barbatus nix.', '2023-02-13 17:01:12'),
(74, 15, 3, 'Potus sensim ad ferox abnoba. Sunt seculaes transferre talis camerarius fluctuies. Sunt torquises imitari velox mirabilis medicinaes. In hac habitasse platea dictumst. Ubi est barbatus nix. Lorem ipsum dolor sit amet consectetur adipiscing elit. Diatrias tolerare tanquam noster caesium. Abnobas sunt hilotaes de placidus vita.', '2023-02-13 17:01:13'),
(75, 15, 3, 'Sed varius a risus eget aliquam. Aliquam sodales odio id eleifend tristique. Sunt torquises imitari velox mirabilis medicinaes. Eposs sunt solems de superbus fortis. Morbi tempus commodo mattis. Potus sensim ad ferox abnoba. Era brevis ratione est. Curabitur aliquam euismod dolor non ornare.', '2023-02-13 17:01:14'),
(76, 16, 3, 'Nulla porta lobortis ligula vel egestas. Nunc viverra elit ac laoreet suscipit. Ut suscipit posuere justo at vulputate. Urna nisl sollicitudin id varius orci quam id turpis. Sunt seculaes transferre talis camerarius fluctuies. Diatrias tolerare tanquam noster caesium. Lorem ipsum dolor sit amet consectetur adipiscing elit. Silva de secundus galatae demitto quadra.', '2023-02-13 17:01:10'),
(77, 16, 3, 'Sunt accentores vitare salvus flavum parses. Potus sensim ad ferox abnoba. Sunt seculaes transferre talis camerarius fluctuies. Ubi est barbatus nix. Pellentesque vitae velit ex. Urna nisl sollicitudin id varius orci quam id turpis. Nunc viverra elit ac laoreet suscipit. Nulla porta lobortis ligula vel egestas. Ubi est audax amicitia. Morbi tempus commodo mattis. Eros diam egestas libero eu vulputate risus. Mineralis persuadere omnes finises desiderium.', '2023-02-13 17:01:11'),
(78, 16, 3, 'Teres talis saepe tractare de camerarius flavum sensorem. Ut eleifend mauris et risus ultrices egestas. Sunt seculaes transferre talis camerarius fluctuies. Sunt torquises imitari velox mirabilis medicinaes. Abnobas sunt hilotaes de placidus vita. Potus sensim ad ferox abnoba. Sunt accentores vitare salvus flavum parses. Nulla porta lobortis ligula vel egestas. Eros diam egestas libero eu vulputate risus. Sed varius a risus eget aliquam. Diatrias tolerare tanquam noster caesium.', '2023-02-13 17:01:12'),
(79, 16, 3, 'Pellentesque et sapien pulvinar consectetur. Mauris dapibus risus quis suscipit vulputate. Curabitur aliquam euismod dolor non ornare. Era brevis ratione est. Ubi est barbatus nix. Abnobas sunt hilotaes de placidus vita. Bassus fatalis classiss virtualiter transferre de flavum. Potus sensim ad ferox abnoba.', '2023-02-13 17:01:13'),
(80, 16, 3, 'Curabitur aliquam euismod dolor non ornare. Sed varius a risus eget aliquam. In hac habitasse platea dictumst. Silva de secundus galatae demitto quadra. Era brevis ratione est. Lorem ipsum dolor sit amet consectetur adipiscing elit. Sunt accentores vitare salvus flavum parses. Aliquam sodales odio id eleifend tristique. Eposs sunt solems de superbus fortis. Mauris dapibus risus quis suscipit vulputate.', '2023-02-13 17:01:14'),
(81, 17, 3, 'Era brevis ratione est. Vae humani generis. Abnobas sunt hilotaes de placidus vita. Ubi est audax amicitia. Pellentesque et sapien pulvinar consectetur. Ubi est barbatus nix. Bassus fatalis classiss virtualiter transferre de flavum. Mauris dapibus risus quis suscipit vulputate. Morbi tempus commodo mattis. Nulla porta lobortis ligula vel egestas. In hac habitasse platea dictumst. Nunc viverra elit ac laoreet suscipit. Diatrias tolerare tanquam noster caesium.', '2023-02-13 17:01:10'),
(82, 17, 3, 'Pellentesque et sapien pulvinar consectetur. Era brevis ratione est. Ubi est audax amicitia. Silva de secundus galatae demitto quadra. Urna nisl sollicitudin id varius orci quam id turpis. Sunt accentores vitare salvus flavum parses. Curabitur aliquam euismod dolor non ornare. In hac habitasse platea dictumst. Eros diam egestas libero eu vulputate risus. Sunt torquises imitari velox mirabilis medicinaes. Ut eleifend mauris et risus ultrices egestas.', '2023-02-13 17:01:11'),
(83, 17, 3, 'Era brevis ratione est. Ut suscipit posuere justo at vulputate. Nunc viverra elit ac laoreet suscipit. Aliquam sodales odio id eleifend tristique. Sed varius a risus eget aliquam. Urna nisl sollicitudin id varius orci quam id turpis. Teres talis saepe tractare de camerarius flavum sensorem. Diatrias tolerare tanquam noster caesium. Morbi tempus commodo mattis.', '2023-02-13 17:01:12'),
(84, 17, 3, 'Nunc viverra elit ac laoreet suscipit. Diatrias tolerare tanquam noster caesium. Silva de secundus galatae demitto quadra. Nulla porta lobortis ligula vel egestas. Sunt accentores vitare salvus flavum parses. Urna nisl sollicitudin id varius orci quam id turpis. Pellentesque et sapien pulvinar consectetur. Ubi est audax amicitia. Mauris dapibus risus quis suscipit vulputate.', '2023-02-13 17:01:13'),
(85, 17, 3, 'Mineralis persuadere omnes finises desiderium. Teres talis saepe tractare de camerarius flavum sensorem. Diatrias tolerare tanquam noster caesium. Sed varius a risus eget aliquam. Potus sensim ad ferox abnoba. Era brevis ratione est. Curabitur aliquam euismod dolor non ornare. Ubi est audax amicitia. Nunc viverra elit ac laoreet suscipit. In hac habitasse platea dictumst.', '2023-02-13 17:01:14'),
(86, 18, 3, 'Curabitur aliquam euismod dolor non ornare. Era brevis ratione est. Ubi est barbatus nix. Abnobas sunt hilotaes de placidus vita. Nulla porta lobortis ligula vel egestas. Lorem ipsum dolor sit amet consectetur adipiscing elit. Mauris dapibus risus quis suscipit vulputate. Pellentesque vitae velit ex. Sunt accentores vitare salvus flavum parses. Nunc viverra elit ac laoreet suscipit. Eros diam egestas libero eu vulputate risus. Ut eleifend mauris et risus ultrices egestas.', '2023-02-13 17:01:10'),
(87, 18, 3, 'Ut eleifend mauris et risus ultrices egestas. Vae humani generis. Sunt seculaes transferre talis camerarius fluctuies. In hac habitasse platea dictumst. Morbi tempus commodo mattis. Bassus fatalis classiss virtualiter transferre de flavum. Curabitur aliquam euismod dolor non ornare.', '2023-02-13 17:01:11'),
(88, 18, 3, 'Potus sensim ad ferox abnoba. Morbi tempus commodo mattis. Pellentesque vitae velit ex. Eposs sunt solems de superbus fortis. Ubi est barbatus nix. In hac habitasse platea dictumst. Pellentesque et sapien pulvinar consectetur. Aliquam sodales odio id eleifend tristique. Sunt torquises imitari velox mirabilis medicinaes. Diatrias tolerare tanquam noster caesium. Silva de secundus galatae demitto quadra. Eros diam egestas libero eu vulputate risus. Era brevis ratione est.', '2023-02-13 17:01:12'),
(89, 18, 3, 'Sunt seculaes transferre talis camerarius fluctuies. Era brevis ratione est. Pellentesque et sapien pulvinar consectetur. Morbi tempus commodo mattis. Silva de secundus galatae demitto quadra. Ut suscipit posuere justo at vulputate. Vae humani generis. Mauris dapibus risus quis suscipit vulputate.', '2023-02-13 17:01:13'),
(90, 18, 3, 'Ut suscipit posuere justo at vulputate. Ut eleifend mauris et risus ultrices egestas. Morbi tempus commodo mattis. Silva de secundus galatae demitto quadra. Sed varius a risus eget aliquam. Aliquam sodales odio id eleifend tristique. Curabitur aliquam euismod dolor non ornare. In hac habitasse platea dictumst.', '2023-02-13 17:01:14'),
(91, 19, 3, 'Teres talis saepe tractare de camerarius flavum sensorem. Ubi est audax amicitia. Aliquam sodales odio id eleifend tristique. Abnobas sunt hilotaes de placidus vita. Urna nisl sollicitudin id varius orci quam id turpis. Ubi est barbatus nix. Sunt seculaes transferre talis camerarius fluctuies. Potus sensim ad ferox abnoba. Sunt accentores vitare salvus flavum parses. Lorem ipsum dolor sit amet consectetur adipiscing elit. Curabitur aliquam euismod dolor non ornare.', '2023-02-13 17:01:10'),
(92, 19, 3, 'Lorem ipsum dolor sit amet consectetur adipiscing elit. Mauris dapibus risus quis suscipit vulputate. Ubi est audax amicitia. Aliquam sodales odio id eleifend tristique. Sunt seculaes transferre talis camerarius fluctuies. Abnobas sunt hilotaes de placidus vita.', '2023-02-13 17:01:11'),
(93, 19, 3, 'Pellentesque et sapien pulvinar consectetur. Aliquam sodales odio id eleifend tristique. Mauris dapibus risus quis suscipit vulputate. Ut suscipit posuere justo at vulputate. Era brevis ratione est. Nulla porta lobortis ligula vel egestas. Abnobas sunt hilotaes de placidus vita. Urna nisl sollicitudin id varius orci quam id turpis. Pellentesque vitae velit ex. Mineralis persuadere omnes finises desiderium. Diatrias tolerare tanquam noster caesium. Sunt torquises imitari velox mirabilis medicinaes.', '2023-02-13 17:01:12'),
(94, 19, 3, 'Bassus fatalis classiss virtualiter transferre de flavum. Mauris dapibus risus quis suscipit vulputate. Ut suscipit posuere justo at vulputate. Pellentesque et sapien pulvinar consectetur. Pellentesque vitae velit ex. Silva de secundus galatae demitto quadra. Potus sensim ad ferox abnoba. Sunt torquises imitari velox mirabilis medicinaes. Lorem ipsum dolor sit amet consectetur adipiscing elit. Nulla porta lobortis ligula vel egestas.', '2023-02-13 17:01:13'),
(95, 19, 3, 'In hac habitasse platea dictumst. Nulla porta lobortis ligula vel egestas. Mauris dapibus risus quis suscipit vulputate. Nunc viverra elit ac laoreet suscipit. Sunt accentores vitare salvus flavum parses. Curabitur aliquam euismod dolor non ornare. Mineralis persuadere omnes finises desiderium. Lorem ipsum dolor sit amet consectetur adipiscing elit. Era brevis ratione est. Pellentesque et sapien pulvinar consectetur. Sunt seculaes transferre talis camerarius fluctuies.', '2023-02-13 17:01:14'),
(96, 20, 3, 'Aliquam sodales odio id eleifend tristique. Curabitur aliquam euismod dolor non ornare. Pellentesque et sapien pulvinar consectetur. Ubi est barbatus nix. Sunt torquises imitari velox mirabilis medicinaes. Lorem ipsum dolor sit amet consectetur adipiscing elit.', '2023-02-13 17:01:10'),
(97, 20, 3, 'Ut eleifend mauris et risus ultrices egestas. Sunt accentores vitare salvus flavum parses. Vae humani generis. Sunt seculaes transferre talis camerarius fluctuies. Bassus fatalis classiss virtualiter transferre de flavum. Abnobas sunt hilotaes de placidus vita. Ubi est audax amicitia. Era brevis ratione est.', '2023-02-13 17:01:11'),
(98, 20, 3, 'Vae humani generis. Abnobas sunt hilotaes de placidus vita. Sed varius a risus eget aliquam. Lorem ipsum dolor sit amet consectetur adipiscing elit. Teres talis saepe tractare de camerarius flavum sensorem. Pellentesque vitae velit ex. Potus sensim ad ferox abnoba.', '2023-02-13 17:01:12'),
(99, 20, 3, 'Eros diam egestas libero eu vulputate risus. Abnobas sunt hilotaes de placidus vita. Ubi est barbatus nix. Sunt accentores vitare salvus flavum parses. Ut suscipit posuere justo at vulputate. Silva de secundus galatae demitto quadra. Bassus fatalis classiss virtualiter transferre de flavum. Pellentesque vitae velit ex.', '2023-02-13 17:01:13'),
(100, 20, 3, 'Teres talis saepe tractare de camerarius flavum sensorem. Urna nisl sollicitudin id varius orci quam id turpis. Silva de secundus galatae demitto quadra. Eposs sunt solems de superbus fortis. Lorem ipsum dolor sit amet consectetur adipiscing elit. Potus sensim ad ferox abnoba. Abnobas sunt hilotaes de placidus vita.', '2023-02-13 17:01:14'),
(101, 21, 3, 'Aliquam sodales odio id eleifend tristique. Mineralis persuadere omnes finises desiderium. Abnobas sunt hilotaes de placidus vita. Bassus fatalis classiss virtualiter transferre de flavum. Era brevis ratione est. Ubi est audax amicitia. Morbi tempus commodo mattis. Diatrias tolerare tanquam noster caesium.', '2023-02-13 17:01:10'),
(102, 21, 3, 'Morbi tempus commodo mattis. Aliquam sodales odio id eleifend tristique. Eposs sunt solems de superbus fortis. Era brevis ratione est. Sed varius a risus eget aliquam. Teres talis saepe tractare de camerarius flavum sensorem. Diatrias tolerare tanquam noster caesium. Pellentesque vitae velit ex. Ubi est audax amicitia.', '2023-02-13 17:01:11'),
(103, 21, 3, 'Pellentesque vitae velit ex. Sunt seculaes transferre talis camerarius fluctuies. Morbi tempus commodo mattis. Ut eleifend mauris et risus ultrices egestas. Mineralis persuadere omnes finises desiderium. Ubi est barbatus nix. Aliquam sodales odio id eleifend tristique. Ubi est audax amicitia.', '2023-02-13 17:01:12'),
(104, 21, 3, 'Ut suscipit posuere justo at vulputate. Eposs sunt solems de superbus fortis. Ubi est barbatus nix. Nunc viverra elit ac laoreet suscipit. Era brevis ratione est. Ut eleifend mauris et risus ultrices egestas. Mauris dapibus risus quis suscipit vulputate. Ubi est audax amicitia. Eros diam egestas libero eu vulputate risus.', '2023-02-13 17:01:13'),
(105, 21, 3, 'Sunt accentores vitare salvus flavum parses. Ut eleifend mauris et risus ultrices egestas. Teres talis saepe tractare de camerarius flavum sensorem. Sunt seculaes transferre talis camerarius fluctuies. Sunt torquises imitari velox mirabilis medicinaes. Abnobas sunt hilotaes de placidus vita. Bassus fatalis classiss virtualiter transferre de flavum.', '2023-02-13 17:01:14'),
(106, 22, 3, 'Nulla porta lobortis ligula vel egestas. Lorem ipsum dolor sit amet consectetur adipiscing elit. Sunt torquises imitari velox mirabilis medicinaes. Potus sensim ad ferox abnoba. Diatrias tolerare tanquam noster caesium. Sunt accentores vitare salvus flavum parses. Mauris dapibus risus quis suscipit vulputate. Pellentesque vitae velit ex. Curabitur aliquam euismod dolor non ornare. Mineralis persuadere omnes finises desiderium.', '2023-02-13 17:01:10'),
(107, 22, 3, 'In hac habitasse platea dictumst. Aliquam sodales odio id eleifend tristique. Morbi tempus commodo mattis. Era brevis ratione est. Eros diam egestas libero eu vulputate risus. Bassus fatalis classiss virtualiter transferre de flavum. Pellentesque et sapien pulvinar consectetur. Sunt accentores vitare salvus flavum parses. Mineralis persuadere omnes finises desiderium. Mauris dapibus risus quis suscipit vulputate.', '2023-02-13 17:01:11'),
(108, 22, 3, 'Nulla porta lobortis ligula vel egestas. Silva de secundus galatae demitto quadra. Eposs sunt solems de superbus fortis. Bassus fatalis classiss virtualiter transferre de flavum. Sed varius a risus eget aliquam. Mauris dapibus risus quis suscipit vulputate. Nunc viverra elit ac laoreet suscipit. Abnobas sunt hilotaes de placidus vita. Lorem ipsum dolor sit amet consectetur adipiscing elit.', '2023-02-13 17:01:12'),
(109, 22, 3, 'Pellentesque vitae velit ex. Sunt accentores vitare salvus flavum parses. Nunc viverra elit ac laoreet suscipit. Eposs sunt solems de superbus fortis. Sunt torquises imitari velox mirabilis medicinaes. Bassus fatalis classiss virtualiter transferre de flavum. Mauris dapibus risus quis suscipit vulputate.', '2023-02-13 17:01:13'),
(110, 22, 3, 'Mauris dapibus risus quis suscipit vulputate. Mineralis persuadere omnes finises desiderium. Pellentesque et sapien pulvinar consectetur. Pellentesque vitae velit ex. Morbi tempus commodo mattis. Nulla porta lobortis ligula vel egestas. Abnobas sunt hilotaes de placidus vita. Urna nisl sollicitudin id varius orci quam id turpis.', '2023-02-13 17:01:14'),
(111, 23, 3, 'In hac habitasse platea dictumst. Teres talis saepe tractare de camerarius flavum sensorem. Vae humani generis. Aliquam sodales odio id eleifend tristique. Urna nisl sollicitudin id varius orci quam id turpis. Diatrias tolerare tanquam noster caesium. Ubi est barbatus nix. Mauris dapibus risus quis suscipit vulputate.', '2023-02-13 17:01:10'),
(112, 23, 3, 'Silva de secundus galatae demitto quadra. Urna nisl sollicitudin id varius orci quam id turpis. Teres talis saepe tractare de camerarius flavum sensorem. Ubi est audax amicitia. Ubi est barbatus nix. Nunc viverra elit ac laoreet suscipit. In hac habitasse platea dictumst. Aliquam sodales odio id eleifend tristique. Nulla porta lobortis ligula vel egestas. Morbi tempus commodo mattis. Diatrias tolerare tanquam noster caesium.', '2023-02-13 17:01:11'),
(113, 23, 3, 'Pellentesque et sapien pulvinar consectetur. Pellentesque vitae velit ex. Eros diam egestas libero eu vulputate risus. Diatrias tolerare tanquam noster caesium. Sunt accentores vitare salvus flavum parses. Urna nisl sollicitudin id varius orci quam id turpis. Silva de secundus galatae demitto quadra. Nulla porta lobortis ligula vel egestas. Ubi est barbatus nix.', '2023-02-13 17:01:12'),
(114, 23, 3, 'In hac habitasse platea dictumst. Bassus fatalis classiss virtualiter transferre de flavum. Teres talis saepe tractare de camerarius flavum sensorem. Eros diam egestas libero eu vulputate risus. Diatrias tolerare tanquam noster caesium. Sed varius a risus eget aliquam.', '2023-02-13 17:01:13'),
(115, 23, 3, 'Silva de secundus galatae demitto quadra. Sed varius a risus eget aliquam. Sunt seculaes transferre talis camerarius fluctuies. Pellentesque et sapien pulvinar consectetur. Vae humani generis. Nunc viverra elit ac laoreet suscipit. Morbi tempus commodo mattis. Sunt accentores vitare salvus flavum parses.', '2023-02-13 17:01:14'),
(116, 24, 3, 'Sed varius a risus eget aliquam. Diatrias tolerare tanquam noster caesium. Nulla porta lobortis ligula vel egestas. Sunt torquises imitari velox mirabilis medicinaes. Eposs sunt solems de superbus fortis. Ubi est barbatus nix. Era brevis ratione est. Mauris dapibus risus quis suscipit vulputate. Potus sensim ad ferox abnoba. Mineralis persuadere omnes finises desiderium. Pellentesque vitae velit ex.', '2023-02-13 17:01:10'),
(117, 24, 3, 'Lorem ipsum dolor sit amet consectetur adipiscing elit. Sed varius a risus eget aliquam. Nulla porta lobortis ligula vel egestas. Nunc viverra elit ac laoreet suscipit. Ut eleifend mauris et risus ultrices egestas. Mineralis persuadere omnes finises desiderium. Pellentesque vitae velit ex. Teres talis saepe tractare de camerarius flavum sensorem.', '2023-02-13 17:01:11'),
(118, 24, 3, 'Ubi est audax amicitia. Ut eleifend mauris et risus ultrices egestas. Sunt accentores vitare salvus flavum parses. Eposs sunt solems de superbus fortis. Mauris dapibus risus quis suscipit vulputate. Sunt seculaes transferre talis camerarius fluctuies. Curabitur aliquam euismod dolor non ornare.', '2023-02-13 17:01:12'),
(119, 24, 3, 'Sed varius a risus eget aliquam. Eposs sunt solems de superbus fortis. Era brevis ratione est. Nunc viverra elit ac laoreet suscipit. Urna nisl sollicitudin id varius orci quam id turpis. Morbi tempus commodo mattis. Curabitur aliquam euismod dolor non ornare. Lorem ipsum dolor sit amet consectetur adipiscing elit. Sunt seculaes transferre talis camerarius fluctuies. Ubi est audax amicitia. Sunt torquises imitari velox mirabilis medicinaes.', '2023-02-13 17:01:13'),
(120, 24, 3, 'Aliquam sodales odio id eleifend tristique. In hac habitasse platea dictumst. Teres talis saepe tractare de camerarius flavum sensorem. Ubi est barbatus nix. Pellentesque vitae velit ex. Pellentesque et sapien pulvinar consectetur. Lorem ipsum dolor sit amet consectetur adipiscing elit. Sunt accentores vitare salvus flavum parses. Ubi est audax amicitia. Ut suscipit posuere justo at vulputate. Nunc viverra elit ac laoreet suscipit. Vae humani generis.', '2023-02-13 17:01:14'),
(121, 25, 3, 'Ut eleifend mauris et risus ultrices egestas. Sunt torquises imitari velox mirabilis medicinaes. Ubi est barbatus nix. Mauris dapibus risus quis suscipit vulputate. Lorem ipsum dolor sit amet consectetur adipiscing elit. Abnobas sunt hilotaes de placidus vita.', '2023-02-13 17:01:10'),
(122, 25, 3, 'Diatrias tolerare tanquam noster caesium. Ut eleifend mauris et risus ultrices egestas. Mineralis persuadere omnes finises desiderium. Bassus fatalis classiss virtualiter transferre de flavum. Teres talis saepe tractare de camerarius flavum sensorem. Mauris dapibus risus quis suscipit vulputate. Eros diam egestas libero eu vulputate risus. Silva de secundus galatae demitto quadra. Nulla porta lobortis ligula vel egestas. Curabitur aliquam euismod dolor non ornare.', '2023-02-13 17:01:11'),
(123, 25, 3, 'Sed varius a risus eget aliquam. Sunt torquises imitari velox mirabilis medicinaes. Mauris dapibus risus quis suscipit vulputate. Lorem ipsum dolor sit amet consectetur adipiscing elit. Era brevis ratione est. Ubi est audax amicitia. Ut eleifend mauris et risus ultrices egestas.', '2023-02-13 17:01:12'),
(124, 25, 3, 'Silva de secundus galatae demitto quadra. Eposs sunt solems de superbus fortis. Vae humani generis. Ubi est audax amicitia. In hac habitasse platea dictumst. Aliquam sodales odio id eleifend tristique. Pellentesque vitae velit ex. Ut eleifend mauris et risus ultrices egestas.', '2023-02-13 17:01:13'),
(125, 25, 3, 'Pellentesque vitae velit ex. Ut suscipit posuere justo at vulputate. Lorem ipsum dolor sit amet consectetur adipiscing elit. Sed varius a risus eget aliquam. Ut eleifend mauris et risus ultrices egestas. In hac habitasse platea dictumst. Sunt seculaes transferre talis camerarius fluctuies. Nulla porta lobortis ligula vel egestas. Morbi tempus commodo mattis.', '2023-02-13 17:01:14'),
(126, 26, 3, 'Curabitur aliquam euismod dolor non ornare. Potus sensim ad ferox abnoba. Pellentesque et sapien pulvinar consectetur. Morbi tempus commodo mattis. Sunt torquises imitari velox mirabilis medicinaes. Sunt seculaes transferre talis camerarius fluctuies. Sunt accentores vitare salvus flavum parses. Vae humani generis. Ut suscipit posuere justo at vulputate.', '2023-02-13 17:01:10'),
(127, 26, 3, 'Abnobas sunt hilotaes de placidus vita. Mauris dapibus risus quis suscipit vulputate. In hac habitasse platea dictumst. Aliquam sodales odio id eleifend tristique. Diatrias tolerare tanquam noster caesium. Morbi tempus commodo mattis. Ubi est barbatus nix. Lorem ipsum dolor sit amet consectetur adipiscing elit.', '2023-02-13 17:01:11'),
(128, 26, 3, 'Eros diam egestas libero eu vulputate risus. Bassus fatalis classiss virtualiter transferre de flavum. Potus sensim ad ferox abnoba. Sunt seculaes transferre talis camerarius fluctuies. Era brevis ratione est. Ubi est barbatus nix. Teres talis saepe tractare de camerarius flavum sensorem. Nunc viverra elit ac laoreet suscipit. Aliquam sodales odio id eleifend tristique. Mauris dapibus risus quis suscipit vulputate. Pellentesque vitae velit ex.', '2023-02-13 17:01:12'),
(129, 26, 3, 'Curabitur aliquam euismod dolor non ornare. Pellentesque vitae velit ex. Diatrias tolerare tanquam noster caesium. Nunc viverra elit ac laoreet suscipit. Teres talis saepe tractare de camerarius flavum sensorem. Bassus fatalis classiss virtualiter transferre de flavum. Morbi tempus commodo mattis.', '2023-02-13 17:01:13'),
(130, 26, 3, 'Pellentesque et sapien pulvinar consectetur. Vae humani generis. Pellentesque vitae velit ex. Era brevis ratione est. Curabitur aliquam euismod dolor non ornare. Urna nisl sollicitudin id varius orci quam id turpis. Abnobas sunt hilotaes de placidus vita.', '2023-02-13 17:01:14'),
(131, 27, 3, 'Abnobas sunt hilotaes de placidus vita. Lorem ipsum dolor sit amet consectetur adipiscing elit. Morbi tempus commodo mattis. Ut eleifend mauris et risus ultrices egestas. Ubi est barbatus nix. Ubi est audax amicitia. Pellentesque vitae velit ex. Potus sensim ad ferox abnoba. Nulla porta lobortis ligula vel egestas. Mauris dapibus risus quis suscipit vulputate. In hac habitasse platea dictumst. Pellentesque et sapien pulvinar consectetur.', '2023-02-13 17:01:10'),
(132, 27, 3, 'Sunt torquises imitari velox mirabilis medicinaes. Morbi tempus commodo mattis. In hac habitasse platea dictumst. Aliquam sodales odio id eleifend tristique. Potus sensim ad ferox abnoba. Nunc viverra elit ac laoreet suscipit. Pellentesque et sapien pulvinar consectetur. Sunt seculaes transferre talis camerarius fluctuies.', '2023-02-13 17:01:11'),
(133, 27, 3, 'Era brevis ratione est. Mauris dapibus risus quis suscipit vulputate. Sunt accentores vitare salvus flavum parses. Eros diam egestas libero eu vulputate risus. Nulla porta lobortis ligula vel egestas. Ut suscipit posuere justo at vulputate. Pellentesque vitae velit ex. Mineralis persuadere omnes finises desiderium. Diatrias tolerare tanquam noster caesium. Eposs sunt solems de superbus fortis. Lorem ipsum dolor sit amet consectetur adipiscing elit.', '2023-02-13 17:01:12'),
(134, 27, 3, 'Curabitur aliquam euismod dolor non ornare. Sunt torquises imitari velox mirabilis medicinaes. Era brevis ratione est. Nulla porta lobortis ligula vel egestas. Sunt accentores vitare salvus flavum parses. Ubi est audax amicitia. Bassus fatalis classiss virtualiter transferre de flavum.', '2023-02-13 17:01:13'),
(135, 27, 3, 'Mineralis persuadere omnes finises desiderium. Eros diam egestas libero eu vulputate risus. Nulla porta lobortis ligula vel egestas. Aliquam sodales odio id eleifend tristique. Potus sensim ad ferox abnoba. Sed varius a risus eget aliquam. In hac habitasse platea dictumst. Nunc viverra elit ac laoreet suscipit.', '2023-02-13 17:01:14'),
(136, 28, 3, 'Sunt accentores vitare salvus flavum parses. Ubi est audax amicitia. Sunt seculaes transferre talis camerarius fluctuies. Abnobas sunt hilotaes de placidus vita. Eros diam egestas libero eu vulputate risus. Sed varius a risus eget aliquam. Vae humani generis. Era brevis ratione est. Aliquam sodales odio id eleifend tristique. Curabitur aliquam euismod dolor non ornare. Nulla porta lobortis ligula vel egestas.', '2023-02-13 17:01:10'),
(137, 28, 3, 'Pellentesque et sapien pulvinar consectetur. In hac habitasse platea dictumst. Ubi est audax amicitia. Nulla porta lobortis ligula vel egestas. Urna nisl sollicitudin id varius orci quam id turpis. Silva de secundus galatae demitto quadra. Curabitur aliquam euismod dolor non ornare. Sunt accentores vitare salvus flavum parses. Nunc viverra elit ac laoreet suscipit. Mauris dapibus risus quis suscipit vulputate. Vae humani generis. Ubi est barbatus nix.', '2023-02-13 17:01:11'),
(138, 28, 3, 'Teres talis saepe tractare de camerarius flavum sensorem. Sunt accentores vitare salvus flavum parses. Curabitur aliquam euismod dolor non ornare. Vae humani generis. Diatrias tolerare tanquam noster caesium. Silva de secundus galatae demitto quadra. Mineralis persuadere omnes finises desiderium. Potus sensim ad ferox abnoba. Pellentesque vitae velit ex. Eros diam egestas libero eu vulputate risus. In hac habitasse platea dictumst. Sunt seculaes transferre talis camerarius fluctuies.', '2023-02-13 17:01:12');
INSERT INTO `comment` (`id`, `post_id`, `author_id`, `content`, `published_at`) VALUES
(139, 28, 3, 'Silva de secundus galatae demitto quadra. Mineralis persuadere omnes finises desiderium. Ut suscipit posuere justo at vulputate. Nulla porta lobortis ligula vel egestas. Diatrias tolerare tanquam noster caesium. Ubi est barbatus nix. Pellentesque et sapien pulvinar consectetur. Nunc viverra elit ac laoreet suscipit.', '2023-02-13 17:01:13'),
(140, 28, 3, 'Lorem ipsum dolor sit amet consectetur adipiscing elit. Eposs sunt solems de superbus fortis. Silva de secundus galatae demitto quadra. Nulla porta lobortis ligula vel egestas. Era brevis ratione est. Eros diam egestas libero eu vulputate risus. Pellentesque et sapien pulvinar consectetur.', '2023-02-13 17:01:14'),
(141, 29, 3, 'Teres talis saepe tractare de camerarius flavum sensorem. Nulla porta lobortis ligula vel egestas. Mineralis persuadere omnes finises desiderium. Aliquam sodales odio id eleifend tristique. Morbi tempus commodo mattis. Mauris dapibus risus quis suscipit vulputate.', '2023-02-13 17:01:10'),
(142, 29, 3, 'Lorem ipsum dolor sit amet consectetur adipiscing elit. Teres talis saepe tractare de camerarius flavum sensorem. Eros diam egestas libero eu vulputate risus. Eposs sunt solems de superbus fortis. In hac habitasse platea dictumst. Potus sensim ad ferox abnoba.', '2023-02-13 17:01:11'),
(143, 29, 3, 'Teres talis saepe tractare de camerarius flavum sensorem. Abnobas sunt hilotaes de placidus vita. In hac habitasse platea dictumst. Ut suscipit posuere justo at vulputate. Eposs sunt solems de superbus fortis. Era brevis ratione est.', '2023-02-13 17:01:12'),
(144, 29, 3, 'Era brevis ratione est. Mauris dapibus risus quis suscipit vulputate. Abnobas sunt hilotaes de placidus vita. Vae humani generis. Ubi est audax amicitia. Eposs sunt solems de superbus fortis. Aliquam sodales odio id eleifend tristique. Pellentesque vitae velit ex. In hac habitasse platea dictumst. Silva de secundus galatae demitto quadra.', '2023-02-13 17:01:13'),
(145, 29, 3, 'Lorem ipsum dolor sit amet consectetur adipiscing elit. Ut eleifend mauris et risus ultrices egestas. In hac habitasse platea dictumst. Silva de secundus galatae demitto quadra. Era brevis ratione est. Ubi est audax amicitia. Mineralis persuadere omnes finises desiderium.', '2023-02-13 17:01:14'),
(155, 36, 3, 'ssssssss', '2023-02-17 21:00:05'),
(156, 36, 1, 'ccccccccc', '2023-02-17 22:21:06'),
(157, 36, 3, 'fccccvcvcvcv', '2023-02-17 22:21:30'),
(158, 36, 1, 'sdsdsdsd', '2023-02-17 22:37:00'),
(160, 15, 1, 'hhhhhhhhhhhhh', '2023-02-18 01:15:00'),
(161, 36, 3, 'vvvvvvvvvvvvvv', '2023-02-18 01:18:21'),
(163, 3, 1, 'sssss', '2023-02-18 01:59:22'),
(164, 3, 1, 'ddddddd', '2023-02-18 02:00:51'),
(165, 16, 1, 'ddddd', '2023-02-18 02:21:31'),
(166, 16, 1, 'fdfffff', '2023-02-18 02:31:20'),
(167, 16, 2, 'ddddddd', '2023-02-18 02:45:58'),
(168, 36, 3, 'hello hello', '2023-02-18 15:59:54'),
(170, 4, 3, 'zzzzzzzzzzzzzzzz', '2023-02-18 17:00:09'),
(171, 4, 3, 'ssssssssssssssssss', '2023-02-18 17:05:16'),
(172, 36, 1, 'dddddddd', '2023-02-18 18:30:21'),
(174, 3, 3, 'ssssss', '2023-02-18 21:29:39'),
(175, 25, 1, 'ssssssss', '2023-02-18 22:33:20'),
(176, 3, 3, 'zzzzz', '2023-02-18 22:53:29'),
(177, 38, 3, 'a great article', '2023-02-18 23:57:48'),
(178, 38, 3, 'nice post', '2023-02-19 14:48:43'),
(181, 40, 3, 'very nice', '2023-02-20 14:38:56'),
(182, 3, 1, 'ssssss', '2023-02-20 16:06:56'),
(183, 3, 1, 'sssssssssss', '2023-02-20 16:07:54'),
(184, 39, 1, 'great article', '2023-02-20 16:25:26'),
(185, 39, 3, 'nice article', '2023-02-20 16:26:04'),
(186, 39, 3, 'ccccccccccccccccc', '2023-02-20 16:30:02'),
(187, 38, 3, 'test test', '2023-02-21 10:58:47');

-- --------------------------------------------------------

--
-- Table structure for table `diagnostic`
--

CREATE TABLE `diagnostic` (
  `id` int(11) NOT NULL,
  `age` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `overweight` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cigarettes` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `recently_injured` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `high_cholesterol` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hyper_tension` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `diabetes` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symptoms` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `diagnostic`
--

INSERT INTO `diagnostic` (`id`, `age`, `overweight`, `cigarettes`, `recently_injured`, `high_cholesterol`, `hyper_tension`, `diabetes`, `symptoms`, `date`) VALUES
(6, '23', 'Yes', 'Yes', 'No', 'don\'t know', 'No', 'Yes', 'a:2:{i:0;s:9:\"symptom-3\";i:1;s:9:\"symptom-2\";}', '2023-02-24 05:30:55'),
(14, '58', 'Yes', 'Yes', 'No', 'don\'t know', 'Yes', 'Yes', 'a:0:{}', '2023-02-24 09:27:55'),
(15, '40', 'Yes', 'don\'t know', 'Yes', 'don\'t know', 'No', 'don\'t know', 'a:3:{i:0;s:12:\"Constipation\";i:1;s:9:\"Heartburn\";i:2;s:24:\"Darkening of the nipples\";}', '2023-02-24 10:27:44'),
(17, '4', 'yes', 'yes', 'yes', 'yes', 'yes', 'yes', 'a:2:{i:0;s:4:\"sym1\";i:1;s:4:\"sym2\";}', '2023-02-26 20:33:18'),
(18, '4', 'yes', 'yes', 'yes', 'yes', 'yes', 'yes', 'a:2:{i:0;s:4:\"sym1\";i:1;s:4:\"sym2\";}', '2023-02-26 20:33:25'),
(19, '4', 'yes', 'yes', 'yes', 'yes', 'yes', 'yes', 'a:2:{i:0;s:4:\"sym1\";i:1;s:4:\"sym2\";}', '2023-02-26 20:35:54'),
(20, '4', 'yes', 'yes', 'yes', 'yes', 'yes', 'yes', 'a:2:{i:0;s:4:\"sym1\";i:1;s:4:\"sym2\";}', '2023-02-26 20:36:24'),
(21, '0', 'Yes', 'No', 'No', 'No', 'don\'t know', 'No', 'a:5:{i:0;s:13:\"Absent period\";i:1;s:9:\"Headaches\";i:2;s:14:\"Fetal movement\";i:3;s:24:\"Darkening of the nipples\";i:4;s:9:\"Heartburn\";}', '2023-02-28 22:36:47'),
(22, '29', 'Yes', 'Yes', 'No', 'Yes', 'No', 'Yes', 'a:6:{i:0;s:13:\"Absent period\";i:1;s:26:\"Spotting or light bleeding\";i:2;s:19:\"Shortness of breath\";i:3;s:15:\"Placenta previa\";i:4;s:10:\"Stillbirth\";i:5;s:15:\"Premature labor\";}', '2023-03-03 12:10:06'),
(23, '36', 'Yes', 'No', 'Yes', 'No', 'don\'t know', 'No', 'a:3:{i:0;s:19:\"Shortness of breath\";i:1;s:18:\"Frequent urination\";i:2;s:24:\"Darkening of the nipples\";}', '2023-03-08 18:02:13'),
(24, '62', 'Yes', 'don\'t know', 'No', 'No', 'don\'t know', 'don\'t know', 'a:2:{i:0;s:20:\"Gestational diabetes\";i:1;s:16:\"Edema (swelling)\";}', '2023-03-08 18:09:21'),
(25, '67', 'Yes', 'No', 'No', 'don\'t know', 'No', 'No', 'a:3:{i:0;s:26:\"Food cravings or aversions\";i:1;s:24:\"Darkening of the nipples\";i:2;s:11:\"Mood swings\";}', '2023-03-08 18:19:21');

-- --------------------------------------------------------

--
-- Table structure for table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fiche_patient`
--

CREATE TABLE `fiche_patient` (
  `id` int(11) NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symptome` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `medicament` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `progres` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `rendez_vous_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `title` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `published_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`id`, `author_id`, `title`, `slug`, `summary`, `content`, `published_at`) VALUES
(3, 2, 'Mauris dapibus risus quis suscipit vulputate', 'mauris-dapibus-risus-quis-suscipit-vulputate', 'Vae humani generis. Abnobas sunt hilotaes de placidus vita. Teres talis saepe tractare de camerarius flavum sensorem. Sunt accentores vitare salvus flavum parses. In hac habitasse platea dictumst. Ubi est audax amicitia.', 'Lorem ipsum dolor sit amet consectetur adipisicing elit, sed do eiusmod tempor\nincididunt ut labore et **dolore magna aliqua**: Duis aute irure dolor in\nreprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia\ndeserunt mollit anim id est laborum.\n\n  * Ut enim ad minim veniam\n  * Quis nostrud exercitation *ullamco laboris*\n  * Nisi ut aliquip ex ea commodo consequat\n\nPraesent id fermentum lorem. Ut est lorem, fringilla at accumsan nec, euismod at\nnunc. Aenean mattis sollicitudin mattis. Nullam pulvinar vestibulum bibendum.\nClass aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos\nhimenaeos. Fusce nulla purus, gravida ac interdum ut, blandit eget ex. Duis a\nluctus dolor.\n\nInteger auctor massa maximus nulla scelerisque accumsan. *Aliquam ac malesuada*\nex. Pellentesque tortor magna, vulputate eu vulputate ut, venenatis ac lectus.\nPraesent ut lacinia sem. Mauris a lectus eget felis mollis feugiat. Quisque\nefficitur, mi ut semper pulvinar, urna urna blandit massa, eget tincidunt augue\nnulla vitae est.\n\nUt posuere aliquet tincidunt. Aliquam erat volutpat. **Class aptent taciti**\nsociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Morbi\narcu orci, gravida eget aliquam eu, suscipit et ante. Morbi vulputate metus vel\nipsum finibus, ut dapibus massa feugiat. Vestibulum vel lobortis libero. Sed\ntincidunt tellus et viverra scelerisque. Pellentesque tincidunt cursus felis.\nSed in egestas erat.\n\nAliquam pulvinar interdum massa, vel ullamcorper ante consectetur eu. Vestibulum\nlacinia ac enim vel placerat. Integer pulvinar magna nec dui malesuada, nec\ncongue nisl dictum. Donec mollis nisl tortor, at congue erat consequat a. Nam\ntempus elit porta, blandit elit vel, viverra lorem. Sed sit amet tellus\ntincidunt, faucibus nisl in, aliquet libero.', '2023-02-11 17:01:09'),
(4, 2, 'Eros diam egestas libero eu vulputate risus', 'eros-diam-egestas-libero-eu-vulputate-risus', 'Mauris dapibus risus quis suscipit vulputate. Curabitur aliquam euismod dolor non ornare. Abnobas sunt hilotaes de placidus vita. Pellentesque et sapien pulvinar consectetur. Ut eleifend mauris et risus ultrices egestas.', 'Lorem ipsum dolor sit amet consectetur adipisicing elit, sed do eiusmod tempor\nincididunt ut labore et **dolore magna aliqua**: Duis aute irure dolor in\nreprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia\ndeserunt mollit anim id est laborum.\n\n  * Ut enim ad minim veniam\n  * Quis nostrud exercitation *ullamco laboris*\n  * Nisi ut aliquip ex ea commodo consequat\n\nPraesent id fermentum lorem. Ut est lorem, fringilla at accumsan nec, euismod at\nnunc. Aenean mattis sollicitudin mattis. Nullam pulvinar vestibulum bibendum.\nClass aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos\nhimenaeos. Fusce nulla purus, gravida ac interdum ut, blandit eget ex. Duis a\nluctus dolor.\n\nInteger auctor massa maximus nulla scelerisque accumsan. *Aliquam ac malesuada*\nex. Pellentesque tortor magna, vulputate eu vulputate ut, venenatis ac lectus.\nPraesent ut lacinia sem. Mauris a lectus eget felis mollis feugiat. Quisque\nefficitur, mi ut semper pulvinar, urna urna blandit massa, eget tincidunt augue\nnulla vitae est.\n\nUt posuere aliquet tincidunt. Aliquam erat volutpat. **Class aptent taciti**\nsociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Morbi\narcu orci, gravida eget aliquam eu, suscipit et ante. Morbi vulputate metus vel\nipsum finibus, ut dapibus massa feugiat. Vestibulum vel lobortis libero. Sed\ntincidunt tellus et viverra scelerisque. Pellentesque tincidunt cursus felis.\nSed in egestas erat.\n\nAliquam pulvinar interdum massa, vel ullamcorper ante consectetur eu. Vestibulum\nlacinia ac enim vel placerat. Integer pulvinar magna nec dui malesuada, nec\ncongue nisl dictum. Donec mollis nisl tortor, at congue erat consequat a. Nam\ntempus elit porta, blandit elit vel, viverra lorem. Sed sit amet tellus\ntincidunt, faucibus nisl in, aliquet libero.', '2023-02-10 17:01:09'),
(6, 2, 'Morbi tempus commodo mattis', 'morbi-tempus-commodo-mattis', 'Potus sensim ad ferox abnoba. Lorem ipsum dolor sit amet consectetur adipiscing elit. Urna nisl sollicitudin id varius orci quam id turpis. Bassus fatalis classiss virtualiter transferre de flavum. Sunt accentores vitare salvus flavum parses.', 'Lorem ipsum dolor sit amet consectetur adipisicing elit, sed do eiusmod tempor\nincididunt ut labore et **dolore magna aliqua**: Duis aute irure dolor in\nreprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia\ndeserunt mollit anim id est laborum.\n\n  * Ut enim ad minim veniam\n  * Quis nostrud exercitation *ullamco laboris*\n  * Nisi ut aliquip ex ea commodo consequat\n\nPraesent id fermentum lorem. Ut est lorem, fringilla at accumsan nec, euismod at\nnunc. Aenean mattis sollicitudin mattis. Nullam pulvinar vestibulum bibendum.\nClass aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos\nhimenaeos. Fusce nulla purus, gravida ac interdum ut, blandit eget ex. Duis a\nluctus dolor.\n\nInteger auctor massa maximus nulla scelerisque accumsan. *Aliquam ac malesuada*\nex. Pellentesque tortor magna, vulputate eu vulputate ut, venenatis ac lectus.\nPraesent ut lacinia sem. Mauris a lectus eget felis mollis feugiat. Quisque\nefficitur, mi ut semper pulvinar, urna urna blandit massa, eget tincidunt augue\nnulla vitae est.\n\nUt posuere aliquet tincidunt. Aliquam erat volutpat. **Class aptent taciti**\nsociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Morbi\narcu orci, gravida eget aliquam eu, suscipit et ante. Morbi vulputate metus vel\nipsum finibus, ut dapibus massa feugiat. Vestibulum vel lobortis libero. Sed\ntincidunt tellus et viverra scelerisque. Pellentesque tincidunt cursus felis.\nSed in egestas erat.\n\nAliquam pulvinar interdum massa, vel ullamcorper ante consectetur eu. Vestibulum\nlacinia ac enim vel placerat. Integer pulvinar magna nec dui malesuada, nec\ncongue nisl dictum. Donec mollis nisl tortor, at congue erat consequat a. Nam\ntempus elit porta, blandit elit vel, viverra lorem. Sed sit amet tellus\ntincidunt, faucibus nisl in, aliquet libero.', '2023-02-08 17:01:09'),
(7, 1, 'Ut suscipit posuere justo at vulputate', 'ut-suscipit-posuere-justo-at-vulputate', 'Nulla porta lobortis ligula vel egestas. Ut eleifend mauris et risus ultrices egestas. Ubi est barbatus nix. Mauris dapibus risus quis suscipit vulputate. Sunt torquises imitari velox mirabilis medicinaes.', 'Lorem ipsum dolor sit amet consectetur adipisicing elit, sed do eiusmod tempor\nincididunt ut labore et **dolore magna aliqua**: Duis aute irure dolor in\nreprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia\ndeserunt mollit anim id est laborum.\n\n  * Ut enim ad minim veniam\n  * Quis nostrud exercitation *ullamco laboris*\n  * Nisi ut aliquip ex ea commodo consequat\n\nPraesent id fermentum lorem. Ut est lorem, fringilla at accumsan nec, euismod at\nnunc. Aenean mattis sollicitudin mattis. Nullam pulvinar vestibulum bibendum.\nClass aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos\nhimenaeos. Fusce nulla purus, gravida ac interdum ut, blandit eget ex. Duis a\nluctus dolor.\n\nInteger auctor massa maximus nulla scelerisque accumsan. *Aliquam ac malesuada*\nex. Pellentesque tortor magna, vulputate eu vulputate ut, venenatis ac lectus.\nPraesent ut lacinia sem. Mauris a lectus eget felis mollis feugiat. Quisque\nefficitur, mi ut semper pulvinar, urna urna blandit massa, eget tincidunt augue\nnulla vitae est.\n\nUt posuere aliquet tincidunt. Aliquam erat volutpat. **Class aptent taciti**\nsociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Morbi\narcu orci, gravida eget aliquam eu, suscipit et ante. Morbi vulputate metus vel\nipsum finibus, ut dapibus massa feugiat. Vestibulum vel lobortis libero. Sed\ntincidunt tellus et viverra scelerisque. Pellentesque tincidunt cursus felis.\nSed in egestas erat.\n\nAliquam pulvinar interdum massa, vel ullamcorper ante consectetur eu. Vestibulum\nlacinia ac enim vel placerat. Integer pulvinar magna nec dui malesuada, nec\ncongue nisl dictum. Donec mollis nisl tortor, at congue erat consequat a. Nam\ntempus elit porta, blandit elit vel, viverra lorem. Sed sit amet tellus\ntincidunt, faucibus nisl in, aliquet libero.', '2023-02-07 17:01:09'),
(8, 1, 'Ut eleifend mauris et risus ultrices egestas', 'ut-eleifend-mauris-et-risus-ultrices-egestas', 'Abnobas sunt hilotaes de placidus vita. Urna nisl sollicitudin id varius orci quam id turpis. Diatrias tolerare tanquam noster caesium. Pellentesque vitae velit ex. Sunt accentores vitare salvus flavum parses.', 'Lorem ipsum dolor sit amet consectetur adipisicing elit, sed do eiusmod tempor\nincididunt ut labore et **dolore magna aliqua**: Duis aute irure dolor in\nreprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia\ndeserunt mollit anim id est laborum.\n\n  * Ut enim ad minim veniam\n  * Quis nostrud exercitation *ullamco laboris*\n  * Nisi ut aliquip ex ea commodo consequat\n\nPraesent id fermentum lorem. Ut est lorem, fringilla at accumsan nec, euismod at\nnunc. Aenean mattis sollicitudin mattis. Nullam pulvinar vestibulum bibendum.\nClass aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos\nhimenaeos. Fusce nulla purus, gravida ac interdum ut, blandit eget ex. Duis a\nluctus dolor.\n\nInteger auctor massa maximus nulla scelerisque accumsan. *Aliquam ac malesuada*\nex. Pellentesque tortor magna, vulputate eu vulputate ut, venenatis ac lectus.\nPraesent ut lacinia sem. Mauris a lectus eget felis mollis feugiat. Quisque\nefficitur, mi ut semper pulvinar, urna urna blandit massa, eget tincidunt augue\nnulla vitae est.\n\nUt posuere aliquet tincidunt. Aliquam erat volutpat. **Class aptent taciti**\nsociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Morbi\narcu orci, gravida eget aliquam eu, suscipit et ante. Morbi vulputate metus vel\nipsum finibus, ut dapibus massa feugiat. Vestibulum vel lobortis libero. Sed\ntincidunt tellus et viverra scelerisque. Pellentesque tincidunt cursus felis.\nSed in egestas erat.\n\nAliquam pulvinar interdum massa, vel ullamcorper ante consectetur eu. Vestibulum\nlacinia ac enim vel placerat. Integer pulvinar magna nec dui malesuada, nec\ncongue nisl dictum. Donec mollis nisl tortor, at congue erat consequat a. Nam\ntempus elit porta, blandit elit vel, viverra lorem. Sed sit amet tellus\ntincidunt, faucibus nisl in, aliquet libero.', '2023-02-06 17:01:09'),
(9, 1, 'Aliquam sodales odio id eleifend tristique', 'aliquam-sodales-odio-id-eleifend-tristique', 'Abnobas sunt hilotaes de placidus vita. Eros diam egestas libero eu vulputate risus. Mineralis persuadere omnes finises desiderium. Sed varius a risus eget aliquam. Nunc viverra elit ac laoreet suscipit. Vae humani generis.', 'Lorem ipsum dolor sit amet consectetur adipisicing elit, sed do eiusmod tempor\nincididunt ut labore et **dolore magna aliqua**: Duis aute irure dolor in\nreprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia\ndeserunt mollit anim id est laborum.\n\n  * Ut enim ad minim veniam\n  * Quis nostrud exercitation *ullamco laboris*\n  * Nisi ut aliquip ex ea commodo consequat\n\nPraesent id fermentum lorem. Ut est lorem, fringilla at accumsan nec, euismod at\nnunc. Aenean mattis sollicitudin mattis. Nullam pulvinar vestibulum bibendum.\nClass aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos\nhimenaeos. Fusce nulla purus, gravida ac interdum ut, blandit eget ex. Duis a\nluctus dolor.\n\nInteger auctor massa maximus nulla scelerisque accumsan. *Aliquam ac malesuada*\nex. Pellentesque tortor magna, vulputate eu vulputate ut, venenatis ac lectus.\nPraesent ut lacinia sem. Mauris a lectus eget felis mollis feugiat. Quisque\nefficitur, mi ut semper pulvinar, urna urna blandit massa, eget tincidunt augue\nnulla vitae est.\n\nUt posuere aliquet tincidunt. Aliquam erat volutpat. **Class aptent taciti**\nsociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Morbi\narcu orci, gravida eget aliquam eu, suscipit et ante. Morbi vulputate metus vel\nipsum finibus, ut dapibus massa feugiat. Vestibulum vel lobortis libero. Sed\ntincidunt tellus et viverra scelerisque. Pellentesque tincidunt cursus felis.\nSed in egestas erat.\n\nAliquam pulvinar interdum massa, vel ullamcorper ante consectetur eu. Vestibulum\nlacinia ac enim vel placerat. Integer pulvinar magna nec dui malesuada, nec\ncongue nisl dictum. Donec mollis nisl tortor, at congue erat consequat a. Nam\ntempus elit porta, blandit elit vel, viverra lorem. Sed sit amet tellus\ntincidunt, faucibus nisl in, aliquet libero.', '2023-02-05 17:01:09'),
(10, 1, 'Urna nisl sollicitudin id varius orci quam id turpis', 'urna-nisl-sollicitudin-id-varius-orci-quam-id-turpis', 'Ubi est barbatus nix. Nulla porta lobortis ligula vel egestas. Silva de secundus galatae demitto quadra. Vae humani generis. Pellentesque vitae velit ex. Abnobas sunt hilotaes de placidus vita. Mauris dapibus risus quis suscipit vulputate.', 'Lorem ipsum dolor sit amet consectetur adipisicing elit, sed do eiusmod tempor\nincididunt ut labore et **dolore magna aliqua**: Duis aute irure dolor in\nreprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia\ndeserunt mollit anim id est laborum.\n\n  * Ut enim ad minim veniam\n  * Quis nostrud exercitation *ullamco laboris*\n  * Nisi ut aliquip ex ea commodo consequat\n\nPraesent id fermentum lorem. Ut est lorem, fringilla at accumsan nec, euismod at\nnunc. Aenean mattis sollicitudin mattis. Nullam pulvinar vestibulum bibendum.\nClass aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos\nhimenaeos. Fusce nulla purus, gravida ac interdum ut, blandit eget ex. Duis a\nluctus dolor.\n\nInteger auctor massa maximus nulla scelerisque accumsan. *Aliquam ac malesuada*\nex. Pellentesque tortor magna, vulputate eu vulputate ut, venenatis ac lectus.\nPraesent ut lacinia sem. Mauris a lectus eget felis mollis feugiat. Quisque\nefficitur, mi ut semper pulvinar, urna urna blandit massa, eget tincidunt augue\nnulla vitae est.\n\nUt posuere aliquet tincidunt. Aliquam erat volutpat. **Class aptent taciti**\nsociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Morbi\narcu orci, gravida eget aliquam eu, suscipit et ante. Morbi vulputate metus vel\nipsum finibus, ut dapibus massa feugiat. Vestibulum vel lobortis libero. Sed\ntincidunt tellus et viverra scelerisque. Pellentesque tincidunt cursus felis.\nSed in egestas erat.\n\nAliquam pulvinar interdum massa, vel ullamcorper ante consectetur eu. Vestibulum\nlacinia ac enim vel placerat. Integer pulvinar magna nec dui malesuada, nec\ncongue nisl dictum. Donec mollis nisl tortor, at congue erat consequat a. Nam\ntempus elit porta, blandit elit vel, viverra lorem. Sed sit amet tellus\ntincidunt, faucibus nisl in, aliquet libero.', '2023-02-04 17:01:09'),
(11, 1, 'Nulla porta lobortis ligula vel egestas', 'nulla-porta-lobortis-ligula-vel-egestas', 'Sed varius a risus eget aliquam. Sunt torquises imitari velox mirabilis medicinaes. Silva de secundus galatae demitto quadra. Potus sensim ad ferox abnoba. Eros diam egestas libero eu vulputate risus. Nulla porta lobortis ligula vel egestas.', 'Lorem ipsum dolor sit amet consectetur adipisicing elit, sed do eiusmod tempor\nincididunt ut labore et **dolore magna aliqua**: Duis aute irure dolor in\nreprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia\ndeserunt mollit anim id est laborum.\n\n  * Ut enim ad minim veniam\n  * Quis nostrud exercitation *ullamco laboris*\n  * Nisi ut aliquip ex ea commodo consequat\n\nPraesent id fermentum lorem. Ut est lorem, fringilla at accumsan nec, euismod at\nnunc. Aenean mattis sollicitudin mattis. Nullam pulvinar vestibulum bibendum.\nClass aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos\nhimenaeos. Fusce nulla purus, gravida ac interdum ut, blandit eget ex. Duis a\nluctus dolor.\n\nInteger auctor massa maximus nulla scelerisque accumsan. *Aliquam ac malesuada*\nex. Pellentesque tortor magna, vulputate eu vulputate ut, venenatis ac lectus.\nPraesent ut lacinia sem. Mauris a lectus eget felis mollis feugiat. Quisque\nefficitur, mi ut semper pulvinar, urna urna blandit massa, eget tincidunt augue\nnulla vitae est.\n\nUt posuere aliquet tincidunt. Aliquam erat volutpat. **Class aptent taciti**\nsociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Morbi\narcu orci, gravida eget aliquam eu, suscipit et ante. Morbi vulputate metus vel\nipsum finibus, ut dapibus massa feugiat. Vestibulum vel lobortis libero. Sed\ntincidunt tellus et viverra scelerisque. Pellentesque tincidunt cursus felis.\nSed in egestas erat.\n\nAliquam pulvinar interdum massa, vel ullamcorper ante consectetur eu. Vestibulum\nlacinia ac enim vel placerat. Integer pulvinar magna nec dui malesuada, nec\ncongue nisl dictum. Donec mollis nisl tortor, at congue erat consequat a. Nam\ntempus elit porta, blandit elit vel, viverra lorem. Sed sit amet tellus\ntincidunt, faucibus nisl in, aliquet libero.', '2023-02-03 17:01:09'),
(12, 2, 'Curabitur aliquam euismod dolor non ornare', 'curabitur-aliquam-euismod-dolor-non-ornare', 'Vae humani generis. Nunc viverra elit ac laoreet suscipit. Eros diam egestas libero eu vulputate risus. Era brevis ratione est. Urna nisl sollicitudin id varius orci quam id turpis. Morbi tempus commodo mattis. In hac habitasse platea dictumst.', 'Lorem ipsum dolor sit amet consectetur adipisicing elit, sed do eiusmod tempor\nincididunt ut labore et **dolore magna aliqua**: Duis aute irure dolor in\nreprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia\ndeserunt mollit anim id est laborum.\n\n  * Ut enim ad minim veniam\n  * Quis nostrud exercitation *ullamco laboris*\n  * Nisi ut aliquip ex ea commodo consequat\n\nPraesent id fermentum lorem. Ut est lorem, fringilla at accumsan nec, euismod at\nnunc. Aenean mattis sollicitudin mattis. Nullam pulvinar vestibulum bibendum.\nClass aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos\nhimenaeos. Fusce nulla purus, gravida ac interdum ut, blandit eget ex. Duis a\nluctus dolor.\n\nInteger auctor massa maximus nulla scelerisque accumsan. *Aliquam ac malesuada*\nex. Pellentesque tortor magna, vulputate eu vulputate ut, venenatis ac lectus.\nPraesent ut lacinia sem. Mauris a lectus eget felis mollis feugiat. Quisque\nefficitur, mi ut semper pulvinar, urna urna blandit massa, eget tincidunt augue\nnulla vitae est.\n\nUt posuere aliquet tincidunt. Aliquam erat volutpat. **Class aptent taciti**\nsociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Morbi\narcu orci, gravida eget aliquam eu, suscipit et ante. Morbi vulputate metus vel\nipsum finibus, ut dapibus massa feugiat. Vestibulum vel lobortis libero. Sed\ntincidunt tellus et viverra scelerisque. Pellentesque tincidunt cursus felis.\nSed in egestas erat.\n\nAliquam pulvinar interdum massa, vel ullamcorper ante consectetur eu. Vestibulum\nlacinia ac enim vel placerat. Integer pulvinar magna nec dui malesuada, nec\ncongue nisl dictum. Donec mollis nisl tortor, at congue erat consequat a. Nam\ntempus elit porta, blandit elit vel, viverra lorem. Sed sit amet tellus\ntincidunt, faucibus nisl in, aliquet libero.', '2023-02-02 17:01:09'),
(13, 2, 'Sed varius a risus eget aliquam', 'sed-varius-a-risus-eget-aliquam', 'Diatrias tolerare tanquam noster caesium. Silva de secundus galatae demitto quadra. Pellentesque vitae velit ex. Curabitur aliquam euismod dolor non ornare. Aliquam sodales odio id eleifend tristique. Potus sensim ad ferox abnoba.', 'Lorem ipsum dolor sit amet consectetur adipisicing elit, sed do eiusmod tempor\nincididunt ut labore et **dolore magna aliqua**: Duis aute irure dolor in\nreprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia\ndeserunt mollit anim id est laborum.\n\n  * Ut enim ad minim veniam\n  * Quis nostrud exercitation *ullamco laboris*\n  * Nisi ut aliquip ex ea commodo consequat\n\nPraesent id fermentum lorem. Ut est lorem, fringilla at accumsan nec, euismod at\nnunc. Aenean mattis sollicitudin mattis. Nullam pulvinar vestibulum bibendum.\nClass aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos\nhimenaeos. Fusce nulla purus, gravida ac interdum ut, blandit eget ex. Duis a\nluctus dolor.\n\nInteger auctor massa maximus nulla scelerisque accumsan. *Aliquam ac malesuada*\nex. Pellentesque tortor magna, vulputate eu vulputate ut, venenatis ac lectus.\nPraesent ut lacinia sem. Mauris a lectus eget felis mollis feugiat. Quisque\nefficitur, mi ut semper pulvinar, urna urna blandit massa, eget tincidunt augue\nnulla vitae est.\n\nUt posuere aliquet tincidunt. Aliquam erat volutpat. **Class aptent taciti**\nsociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Morbi\narcu orci, gravida eget aliquam eu, suscipit et ante. Morbi vulputate metus vel\nipsum finibus, ut dapibus massa feugiat. Vestibulum vel lobortis libero. Sed\ntincidunt tellus et viverra scelerisque. Pellentesque tincidunt cursus felis.\nSed in egestas erat.\n\nAliquam pulvinar interdum massa, vel ullamcorper ante consectetur eu. Vestibulum\nlacinia ac enim vel placerat. Integer pulvinar magna nec dui malesuada, nec\ncongue nisl dictum. Donec mollis nisl tortor, at congue erat consequat a. Nam\ntempus elit porta, blandit elit vel, viverra lorem. Sed sit amet tellus\ntincidunt, faucibus nisl in, aliquet libero.', '2023-02-01 17:01:09'),
(14, 1, 'Nunc viverra elit ac laoreet suscipit', 'nunc-viverra-elit-ac-laoreet-suscipit', 'Vae humani generis. Nunc viverra elit ac laoreet suscipit. Mineralis persuadere omnes finises desiderium. Diatrias tolerare tanquam noster caesium. Pellentesque vitae velit ex. Sunt torquises imitari velox mirabilis medicinaes.', 'Lorem ipsum dolor sit amet consectetur adipisicing elit, sed do eiusmod tempor\nincididunt ut labore et **dolore magna aliqua**: Duis aute irure dolor in\nreprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia\ndeserunt mollit anim id est laborum.\n\n  * Ut enim ad minim veniam\n  * Quis nostrud exercitation *ullamco laboris*\n  * Nisi ut aliquip ex ea commodo consequat\n\nPraesent id fermentum lorem. Ut est lorem, fringilla at accumsan nec, euismod at\nnunc. Aenean mattis sollicitudin mattis. Nullam pulvinar vestibulum bibendum.\nClass aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos\nhimenaeos. Fusce nulla purus, gravida ac interdum ut, blandit eget ex. Duis a\nluctus dolor.\n\nInteger auctor massa maximus nulla scelerisque accumsan. *Aliquam ac malesuada*\nex. Pellentesque tortor magna, vulputate eu vulputate ut, venenatis ac lectus.\nPraesent ut lacinia sem. Mauris a lectus eget felis mollis feugiat. Quisque\nefficitur, mi ut semper pulvinar, urna urna blandit massa, eget tincidunt augue\nnulla vitae est.\n\nUt posuere aliquet tincidunt. Aliquam erat volutpat. **Class aptent taciti**\nsociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Morbi\narcu orci, gravida eget aliquam eu, suscipit et ante. Morbi vulputate metus vel\nipsum finibus, ut dapibus massa feugiat. Vestibulum vel lobortis libero. Sed\ntincidunt tellus et viverra scelerisque. Pellentesque tincidunt cursus felis.\nSed in egestas erat.\n\nAliquam pulvinar interdum massa, vel ullamcorper ante consectetur eu. Vestibulum\nlacinia ac enim vel placerat. Integer pulvinar magna nec dui malesuada, nec\ncongue nisl dictum. Donec mollis nisl tortor, at congue erat consequat a. Nam\ntempus elit porta, blandit elit vel, viverra lorem. Sed sit amet tellus\ntincidunt, faucibus nisl in, aliquet libero.', '2023-01-31 17:01:09'),
(15, 2, 'Pellentesque et sapien pulvinar consectetur', 'pellentesque-et-sapien-pulvinar-consectetur', 'Nulla porta lobortis ligula vel egestas. Sunt accentores vitare salvus flavum parses. Eposs sunt solems de superbus fortis. In hac habitasse platea dictumst. Abnobas sunt hilotaes de placidus vita. Vae humani generis.', 'Lorem ipsum dolor sit amet consectetur adipisicing elit, sed do eiusmod tempor\nincididunt ut labore et **dolore magna aliqua**: Duis aute irure dolor in\nreprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia\ndeserunt mollit anim id est laborum.\n\n  * Ut enim ad minim veniam\n  * Quis nostrud exercitation *ullamco laboris*\n  * Nisi ut aliquip ex ea commodo consequat\n\nPraesent id fermentum lorem. Ut est lorem, fringilla at accumsan nec, euismod at\nnunc. Aenean mattis sollicitudin mattis. Nullam pulvinar vestibulum bibendum.\nClass aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos\nhimenaeos. Fusce nulla purus, gravida ac interdum ut, blandit eget ex. Duis a\nluctus dolor.\n\nInteger auctor massa maximus nulla scelerisque accumsan. *Aliquam ac malesuada*\nex. Pellentesque tortor magna, vulputate eu vulputate ut, venenatis ac lectus.\nPraesent ut lacinia sem. Mauris a lectus eget felis mollis feugiat. Quisque\nefficitur, mi ut semper pulvinar, urna urna blandit massa, eget tincidunt augue\nnulla vitae est.\n\nUt posuere aliquet tincidunt. Aliquam erat volutpat. **Class aptent taciti**\nsociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Morbi\narcu orci, gravida eget aliquam eu, suscipit et ante. Morbi vulputate metus vel\nipsum finibus, ut dapibus massa feugiat. Vestibulum vel lobortis libero. Sed\ntincidunt tellus et viverra scelerisque. Pellentesque tincidunt cursus felis.\nSed in egestas erat.\n\nAliquam pulvinar interdum massa, vel ullamcorper ante consectetur eu. Vestibulum\nlacinia ac enim vel placerat. Integer pulvinar magna nec dui malesuada, nec\ncongue nisl dictum. Donec mollis nisl tortor, at congue erat consequat a. Nam\ntempus elit porta, blandit elit vel, viverra lorem. Sed sit amet tellus\ntincidunt, faucibus nisl in, aliquet libero.', '2023-01-30 17:01:09'),
(16, 1, 'Ubi est barbatus nix', 'ubi-est-barbatus-nix', 'Ubi est barbatus nix. Nunc viverra elit ac laoreet suscipit. Nulla porta lobortis ligula vel egestas. Vae humani generis. Sed varius a risus eget aliquam. Ubi est audax amicitia. Eros diam egestas libero eu vulputate risus.', 'Lorem ipsum dolor sit amet consectetur adipisicing elit, sed do eiusmod tempor\nincididunt ut labore et **dolore magna aliqua**: Duis aute irure dolor in\nreprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia\ndeserunt mollit anim id est laborum.\n\n  * Ut enim ad minim veniam\n  * Quis nostrud exercitation *ullamco laboris*\n  * Nisi ut aliquip ex ea commodo consequat\n\nPraesent id fermentum lorem. Ut est lorem, fringilla at accumsan nec, euismod at\nnunc. Aenean mattis sollicitudin mattis. Nullam pulvinar vestibulum bibendum.\nClass aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos\nhimenaeos. Fusce nulla purus, gravida ac interdum ut, blandit eget ex. Duis a\nluctus dolor.\n\nInteger auctor massa maximus nulla scelerisque accumsan. *Aliquam ac malesuada*\nex. Pellentesque tortor magna, vulputate eu vulputate ut, venenatis ac lectus.\nPraesent ut lacinia sem. Mauris a lectus eget felis mollis feugiat. Quisque\nefficitur, mi ut semper pulvinar, urna urna blandit massa, eget tincidunt augue\nnulla vitae est.\n\nUt posuere aliquet tincidunt. Aliquam erat volutpat. **Class aptent taciti**\nsociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Morbi\narcu orci, gravida eget aliquam eu, suscipit et ante. Morbi vulputate metus vel\nipsum finibus, ut dapibus massa feugiat. Vestibulum vel lobortis libero. Sed\ntincidunt tellus et viverra scelerisque. Pellentesque tincidunt cursus felis.\nSed in egestas erat.\n\nAliquam pulvinar interdum massa, vel ullamcorper ante consectetur eu. Vestibulum\nlacinia ac enim vel placerat. Integer pulvinar magna nec dui malesuada, nec\ncongue nisl dictum. Donec mollis nisl tortor, at congue erat consequat a. Nam\ntempus elit porta, blandit elit vel, viverra lorem. Sed sit amet tellus\ntincidunt, faucibus nisl in, aliquet libero.', '2023-01-29 17:01:09'),
(17, 2, 'Abnobas sunt hilotaes de placidus vita', 'abnobas-sunt-hilotaes-de-placidus-vita', 'Mineralis persuadere omnes finises desiderium. Diatrias tolerare tanquam noster caesium. Curabitur aliquam euismod dolor non ornare. Abnobas sunt hilotaes de placidus vita. Ubi est audax amicitia. Nulla porta lobortis ligula vel egestas.', 'Lorem ipsum dolor sit amet consectetur adipisicing elit, sed do eiusmod tempor\nincididunt ut labore et **dolore magna aliqua**: Duis aute irure dolor in\nreprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia\ndeserunt mollit anim id est laborum.\n\n  * Ut enim ad minim veniam\n  * Quis nostrud exercitation *ullamco laboris*\n  * Nisi ut aliquip ex ea commodo consequat\n\nPraesent id fermentum lorem. Ut est lorem, fringilla at accumsan nec, euismod at\nnunc. Aenean mattis sollicitudin mattis. Nullam pulvinar vestibulum bibendum.\nClass aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos\nhimenaeos. Fusce nulla purus, gravida ac interdum ut, blandit eget ex. Duis a\nluctus dolor.\n\nInteger auctor massa maximus nulla scelerisque accumsan. *Aliquam ac malesuada*\nex. Pellentesque tortor magna, vulputate eu vulputate ut, venenatis ac lectus.\nPraesent ut lacinia sem. Mauris a lectus eget felis mollis feugiat. Quisque\nefficitur, mi ut semper pulvinar, urna urna blandit massa, eget tincidunt augue\nnulla vitae est.\n\nUt posuere aliquet tincidunt. Aliquam erat volutpat. **Class aptent taciti**\nsociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Morbi\narcu orci, gravida eget aliquam eu, suscipit et ante. Morbi vulputate metus vel\nipsum finibus, ut dapibus massa feugiat. Vestibulum vel lobortis libero. Sed\ntincidunt tellus et viverra scelerisque. Pellentesque tincidunt cursus felis.\nSed in egestas erat.\n\nAliquam pulvinar interdum massa, vel ullamcorper ante consectetur eu. Vestibulum\nlacinia ac enim vel placerat. Integer pulvinar magna nec dui malesuada, nec\ncongue nisl dictum. Donec mollis nisl tortor, at congue erat consequat a. Nam\ntempus elit porta, blandit elit vel, viverra lorem. Sed sit amet tellus\ntincidunt, faucibus nisl in, aliquet libero.', '2023-01-28 17:01:09'),
(18, 2, 'Ubi est audax amicitia', 'ubi-est-audax-amicitia', 'Mauris dapibus risus quis suscipit vulputate. Morbi tempus commodo mattis. Sunt torquises imitari velox mirabilis medicinaes. Sunt accentores vitare salvus flavum parses. Ubi est barbatus nix. Teres talis saepe tractare de camerarius flavum sensorem.', 'Lorem ipsum dolor sit amet consectetur adipisicing elit, sed do eiusmod tempor\nincididunt ut labore et **dolore magna aliqua**: Duis aute irure dolor in\nreprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia\ndeserunt mollit anim id est laborum.\n\n  * Ut enim ad minim veniam\n  * Quis nostrud exercitation *ullamco laboris*\n  * Nisi ut aliquip ex ea commodo consequat\n\nPraesent id fermentum lorem. Ut est lorem, fringilla at accumsan nec, euismod at\nnunc. Aenean mattis sollicitudin mattis. Nullam pulvinar vestibulum bibendum.\nClass aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos\nhimenaeos. Fusce nulla purus, gravida ac interdum ut, blandit eget ex. Duis a\nluctus dolor.\n\nInteger auctor massa maximus nulla scelerisque accumsan. *Aliquam ac malesuada*\nex. Pellentesque tortor magna, vulputate eu vulputate ut, venenatis ac lectus.\nPraesent ut lacinia sem. Mauris a lectus eget felis mollis feugiat. Quisque\nefficitur, mi ut semper pulvinar, urna urna blandit massa, eget tincidunt augue\nnulla vitae est.\n\nUt posuere aliquet tincidunt. Aliquam erat volutpat. **Class aptent taciti**\nsociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Morbi\narcu orci, gravida eget aliquam eu, suscipit et ante. Morbi vulputate metus vel\nipsum finibus, ut dapibus massa feugiat. Vestibulum vel lobortis libero. Sed\ntincidunt tellus et viverra scelerisque. Pellentesque tincidunt cursus felis.\nSed in egestas erat.\n\nAliquam pulvinar interdum massa, vel ullamcorper ante consectetur eu. Vestibulum\nlacinia ac enim vel placerat. Integer pulvinar magna nec dui malesuada, nec\ncongue nisl dictum. Donec mollis nisl tortor, at congue erat consequat a. Nam\ntempus elit porta, blandit elit vel, viverra lorem. Sed sit amet tellus\ntincidunt, faucibus nisl in, aliquet libero.', '2023-01-27 17:01:09'),
(19, 1, 'Eposs sunt solems de superbus fortis', 'eposs-sunt-solems-de-superbus-fortis', 'Morbi tempus commodo mattis. Silva de secundus galatae demitto quadra. Ut eleifend mauris et risus ultrices egestas. Sunt seculaes transferre talis camerarius fluctuies. Eros diam egestas libero eu vulputate risus. Era brevis ratione est.', 'Lorem ipsum dolor sit amet consectetur adipisicing elit, sed do eiusmod tempor\nincididunt ut labore et **dolore magna aliqua**: Duis aute irure dolor in\nreprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia\ndeserunt mollit anim id est laborum.\n\n  * Ut enim ad minim veniam\n  * Quis nostrud exercitation *ullamco laboris*\n  * Nisi ut aliquip ex ea commodo consequat\n\nPraesent id fermentum lorem. Ut est lorem, fringilla at accumsan nec, euismod at\nnunc. Aenean mattis sollicitudin mattis. Nullam pulvinar vestibulum bibendum.\nClass aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos\nhimenaeos. Fusce nulla purus, gravida ac interdum ut, blandit eget ex. Duis a\nluctus dolor.\n\nInteger auctor massa maximus nulla scelerisque accumsan. *Aliquam ac malesuada*\nex. Pellentesque tortor magna, vulputate eu vulputate ut, venenatis ac lectus.\nPraesent ut lacinia sem. Mauris a lectus eget felis mollis feugiat. Quisque\nefficitur, mi ut semper pulvinar, urna urna blandit massa, eget tincidunt augue\nnulla vitae est.\n\nUt posuere aliquet tincidunt. Aliquam erat volutpat. **Class aptent taciti**\nsociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Morbi\narcu orci, gravida eget aliquam eu, suscipit et ante. Morbi vulputate metus vel\nipsum finibus, ut dapibus massa feugiat. Vestibulum vel lobortis libero. Sed\ntincidunt tellus et viverra scelerisque. Pellentesque tincidunt cursus felis.\nSed in egestas erat.\n\nAliquam pulvinar interdum massa, vel ullamcorper ante consectetur eu. Vestibulum\nlacinia ac enim vel placerat. Integer pulvinar magna nec dui malesuada, nec\ncongue nisl dictum. Donec mollis nisl tortor, at congue erat consequat a. Nam\ntempus elit porta, blandit elit vel, viverra lorem. Sed sit amet tellus\ntincidunt, faucibus nisl in, aliquet libero.', '2023-01-26 17:01:09'),
(20, 1, 'Vae humani generis', 'vae-humani-generis', 'Potus sensim ad ferox abnoba. Sed varius a risus eget aliquam. In hac habitasse platea dictumst. Nunc viverra elit ac laoreet suscipit. Diatrias tolerare tanquam noster caesium. Aliquam sodales odio id eleifend tristique.', 'Lorem ipsum dolor sit amet consectetur adipisicing elit, sed do eiusmod tempor\nincididunt ut labore et **dolore magna aliqua**: Duis aute irure dolor in\nreprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia\ndeserunt mollit anim id est laborum.\n\n  * Ut enim ad minim veniam\n  * Quis nostrud exercitation *ullamco laboris*\n  * Nisi ut aliquip ex ea commodo consequat\n\nPraesent id fermentum lorem. Ut est lorem, fringilla at accumsan nec, euismod at\nnunc. Aenean mattis sollicitudin mattis. Nullam pulvinar vestibulum bibendum.\nClass aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos\nhimenaeos. Fusce nulla purus, gravida ac interdum ut, blandit eget ex. Duis a\nluctus dolor.\n\nInteger auctor massa maximus nulla scelerisque accumsan. *Aliquam ac malesuada*\nex. Pellentesque tortor magna, vulputate eu vulputate ut, venenatis ac lectus.\nPraesent ut lacinia sem. Mauris a lectus eget felis mollis feugiat. Quisque\nefficitur, mi ut semper pulvinar, urna urna blandit massa, eget tincidunt augue\nnulla vitae est.\n\nUt posuere aliquet tincidunt. Aliquam erat volutpat. **Class aptent taciti**\nsociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Morbi\narcu orci, gravida eget aliquam eu, suscipit et ante. Morbi vulputate metus vel\nipsum finibus, ut dapibus massa feugiat. Vestibulum vel lobortis libero. Sed\ntincidunt tellus et viverra scelerisque. Pellentesque tincidunt cursus felis.\nSed in egestas erat.\n\nAliquam pulvinar interdum massa, vel ullamcorper ante consectetur eu. Vestibulum\nlacinia ac enim vel placerat. Integer pulvinar magna nec dui malesuada, nec\ncongue nisl dictum. Donec mollis nisl tortor, at congue erat consequat a. Nam\ntempus elit porta, blandit elit vel, viverra lorem. Sed sit amet tellus\ntincidunt, faucibus nisl in, aliquet libero.', '2023-01-25 17:01:09'),
(21, 2, 'Diatrias tolerare tanquam noster caesium', 'diatrias-tolerare-tanquam-noster-caesium', 'Lorem ipsum dolor sit amet consectetur adipiscing elit. Mauris dapibus risus quis suscipit vulputate. Bassus fatalis classiss virtualiter transferre de flavum. Potus sensim ad ferox abnoba. Sunt accentores vitare salvus flavum parses.', 'Lorem ipsum dolor sit amet consectetur adipisicing elit, sed do eiusmod tempor\nincididunt ut labore et **dolore magna aliqua**: Duis aute irure dolor in\nreprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia\ndeserunt mollit anim id est laborum.\n\n  * Ut enim ad minim veniam\n  * Quis nostrud exercitation *ullamco laboris*\n  * Nisi ut aliquip ex ea commodo consequat\n\nPraesent id fermentum lorem. Ut est lorem, fringilla at accumsan nec, euismod at\nnunc. Aenean mattis sollicitudin mattis. Nullam pulvinar vestibulum bibendum.\nClass aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos\nhimenaeos. Fusce nulla purus, gravida ac interdum ut, blandit eget ex. Duis a\nluctus dolor.\n\nInteger auctor massa maximus nulla scelerisque accumsan. *Aliquam ac malesuada*\nex. Pellentesque tortor magna, vulputate eu vulputate ut, venenatis ac lectus.\nPraesent ut lacinia sem. Mauris a lectus eget felis mollis feugiat. Quisque\nefficitur, mi ut semper pulvinar, urna urna blandit massa, eget tincidunt augue\nnulla vitae est.\n\nUt posuere aliquet tincidunt. Aliquam erat volutpat. **Class aptent taciti**\nsociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Morbi\narcu orci, gravida eget aliquam eu, suscipit et ante. Morbi vulputate metus vel\nipsum finibus, ut dapibus massa feugiat. Vestibulum vel lobortis libero. Sed\ntincidunt tellus et viverra scelerisque. Pellentesque tincidunt cursus felis.\nSed in egestas erat.\n\nAliquam pulvinar interdum massa, vel ullamcorper ante consectetur eu. Vestibulum\nlacinia ac enim vel placerat. Integer pulvinar magna nec dui malesuada, nec\ncongue nisl dictum. Donec mollis nisl tortor, at congue erat consequat a. Nam\ntempus elit porta, blandit elit vel, viverra lorem. Sed sit amet tellus\ntincidunt, faucibus nisl in, aliquet libero.', '2023-01-24 17:01:09'),
(22, 1, 'Teres talis saepe tractare de camerarius flavum sensorem', 'teres-talis-saepe-tractare-de-camerarius-flavum-sensorem', 'Teres talis saepe tractare de camerarius flavum sensorem. Nulla porta lobortis ligula vel egestas. Aliquam sodales odio id eleifend tristique. Sunt accentores vitare salvus flavum parses. Nunc viverra elit ac laoreet suscipit.', 'Lorem ipsum dolor sit amet consectetur adipisicing elit, sed do eiusmod tempor\nincididunt ut labore et **dolore magna aliqua**: Duis aute irure dolor in\nreprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia\ndeserunt mollit anim id est laborum.\n\n  * Ut enim ad minim veniam\n  * Quis nostrud exercitation *ullamco laboris*\n  * Nisi ut aliquip ex ea commodo consequat\n\nPraesent id fermentum lorem. Ut est lorem, fringilla at accumsan nec, euismod at\nnunc. Aenean mattis sollicitudin mattis. Nullam pulvinar vestibulum bibendum.\nClass aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos\nhimenaeos. Fusce nulla purus, gravida ac interdum ut, blandit eget ex. Duis a\nluctus dolor.\n\nInteger auctor massa maximus nulla scelerisque accumsan. *Aliquam ac malesuada*\nex. Pellentesque tortor magna, vulputate eu vulputate ut, venenatis ac lectus.\nPraesent ut lacinia sem. Mauris a lectus eget felis mollis feugiat. Quisque\nefficitur, mi ut semper pulvinar, urna urna blandit massa, eget tincidunt augue\nnulla vitae est.\n\nUt posuere aliquet tincidunt. Aliquam erat volutpat. **Class aptent taciti**\nsociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Morbi\narcu orci, gravida eget aliquam eu, suscipit et ante. Morbi vulputate metus vel\nipsum finibus, ut dapibus massa feugiat. Vestibulum vel lobortis libero. Sed\ntincidunt tellus et viverra scelerisque. Pellentesque tincidunt cursus felis.\nSed in egestas erat.\n\nAliquam pulvinar interdum massa, vel ullamcorper ante consectetur eu. Vestibulum\nlacinia ac enim vel placerat. Integer pulvinar magna nec dui malesuada, nec\ncongue nisl dictum. Donec mollis nisl tortor, at congue erat consequat a. Nam\ntempus elit porta, blandit elit vel, viverra lorem. Sed sit amet tellus\ntincidunt, faucibus nisl in, aliquet libero.', '2023-01-23 17:01:09'),
(23, 1, 'Silva de secundus galatae demitto quadra', 'silva-de-secundus-galatae-demitto-quadra', 'Morbi tempus commodo mattis. Ut suscipit posuere justo at vulputate. Ut eleifend mauris et risus ultrices egestas. In hac habitasse platea dictumst. Ubi est audax amicitia. Era brevis ratione est. Aliquam sodales odio id eleifend tristique.', 'Lorem ipsum dolor sit amet consectetur adipisicing elit, sed do eiusmod tempor\nincididunt ut labore et **dolore magna aliqua**: Duis aute irure dolor in\nreprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia\ndeserunt mollit anim id est laborum.\n\n  * Ut enim ad minim veniam\n  * Quis nostrud exercitation *ullamco laboris*\n  * Nisi ut aliquip ex ea commodo consequat\n\nPraesent id fermentum lorem. Ut est lorem, fringilla at accumsan nec, euismod at\nnunc. Aenean mattis sollicitudin mattis. Nullam pulvinar vestibulum bibendum.\nClass aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos\nhimenaeos. Fusce nulla purus, gravida ac interdum ut, blandit eget ex. Duis a\nluctus dolor.\n\nInteger auctor massa maximus nulla scelerisque accumsan. *Aliquam ac malesuada*\nex. Pellentesque tortor magna, vulputate eu vulputate ut, venenatis ac lectus.\nPraesent ut lacinia sem. Mauris a lectus eget felis mollis feugiat. Quisque\nefficitur, mi ut semper pulvinar, urna urna blandit massa, eget tincidunt augue\nnulla vitae est.\n\nUt posuere aliquet tincidunt. Aliquam erat volutpat. **Class aptent taciti**\nsociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Morbi\narcu orci, gravida eget aliquam eu, suscipit et ante. Morbi vulputate metus vel\nipsum finibus, ut dapibus massa feugiat. Vestibulum vel lobortis libero. Sed\ntincidunt tellus et viverra scelerisque. Pellentesque tincidunt cursus felis.\nSed in egestas erat.\n\nAliquam pulvinar interdum massa, vel ullamcorper ante consectetur eu. Vestibulum\nlacinia ac enim vel placerat. Integer pulvinar magna nec dui malesuada, nec\ncongue nisl dictum. Donec mollis nisl tortor, at congue erat consequat a. Nam\ntempus elit porta, blandit elit vel, viverra lorem. Sed sit amet tellus\ntincidunt, faucibus nisl in, aliquet libero.', '2023-01-22 17:01:09'),
(24, 2, 'Sunt accentores vitare salvus flavum parses', 'sunt-accentores-vitare-salvus-flavum-parses', 'In hac habitasse platea dictumst. Sunt seculaes transferre talis camerarius fluctuies. Silva de secundus galatae demitto quadra. Urna nisl sollicitudin id varius orci quam id turpis. Era brevis ratione est. Curabitur aliquam euismod dolor non ornare.', 'Lorem ipsum dolor sit amet consectetur adipisicing elit, sed do eiusmod tempor\nincididunt ut labore et **dolore magna aliqua**: Duis aute irure dolor in\nreprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia\ndeserunt mollit anim id est laborum.\n\n  * Ut enim ad minim veniam\n  * Quis nostrud exercitation *ullamco laboris*\n  * Nisi ut aliquip ex ea commodo consequat\n\nPraesent id fermentum lorem. Ut est lorem, fringilla at accumsan nec, euismod at\nnunc. Aenean mattis sollicitudin mattis. Nullam pulvinar vestibulum bibendum.\nClass aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos\nhimenaeos. Fusce nulla purus, gravida ac interdum ut, blandit eget ex. Duis a\nluctus dolor.\n\nInteger auctor massa maximus nulla scelerisque accumsan. *Aliquam ac malesuada*\nex. Pellentesque tortor magna, vulputate eu vulputate ut, venenatis ac lectus.\nPraesent ut lacinia sem. Mauris a lectus eget felis mollis feugiat. Quisque\nefficitur, mi ut semper pulvinar, urna urna blandit massa, eget tincidunt augue\nnulla vitae est.\n\nUt posuere aliquet tincidunt. Aliquam erat volutpat. **Class aptent taciti**\nsociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Morbi\narcu orci, gravida eget aliquam eu, suscipit et ante. Morbi vulputate metus vel\nipsum finibus, ut dapibus massa feugiat. Vestibulum vel lobortis libero. Sed\ntincidunt tellus et viverra scelerisque. Pellentesque tincidunt cursus felis.\nSed in egestas erat.\n\nAliquam pulvinar interdum massa, vel ullamcorper ante consectetur eu. Vestibulum\nlacinia ac enim vel placerat. Integer pulvinar magna nec dui malesuada, nec\ncongue nisl dictum. Donec mollis nisl tortor, at congue erat consequat a. Nam\ntempus elit porta, blandit elit vel, viverra lorem. Sed sit amet tellus\ntincidunt, faucibus nisl in, aliquet libero.', '2023-01-21 17:01:09');
INSERT INTO `post` (`id`, `author_id`, `title`, `slug`, `summary`, `content`, `published_at`) VALUES
(25, 2, 'Potus sensim ad ferox abnoba', 'potus-sensim-ad-ferox-abnoba', 'Ut suscipit posuere justo at vulputate. Morbi tempus commodo mattis. Ubi est barbatus nix. Mauris dapibus risus quis suscipit vulputate. Ubi est audax amicitia. Sunt torquises imitari velox mirabilis medicinaes.', 'Lorem ipsum dolor sit amet consectetur adipisicing elit, sed do eiusmod tempor\nincididunt ut labore et **dolore magna aliqua**: Duis aute irure dolor in\nreprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia\ndeserunt mollit anim id est laborum.\n\n  * Ut enim ad minim veniam\n  * Quis nostrud exercitation *ullamco laboris*\n  * Nisi ut aliquip ex ea commodo consequat\n\nPraesent id fermentum lorem. Ut est lorem, fringilla at accumsan nec, euismod at\nnunc. Aenean mattis sollicitudin mattis. Nullam pulvinar vestibulum bibendum.\nClass aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos\nhimenaeos. Fusce nulla purus, gravida ac interdum ut, blandit eget ex. Duis a\nluctus dolor.\n\nInteger auctor massa maximus nulla scelerisque accumsan. *Aliquam ac malesuada*\nex. Pellentesque tortor magna, vulputate eu vulputate ut, venenatis ac lectus.\nPraesent ut lacinia sem. Mauris a lectus eget felis mollis feugiat. Quisque\nefficitur, mi ut semper pulvinar, urna urna blandit massa, eget tincidunt augue\nnulla vitae est.\n\nUt posuere aliquet tincidunt. Aliquam erat volutpat. **Class aptent taciti**\nsociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Morbi\narcu orci, gravida eget aliquam eu, suscipit et ante. Morbi vulputate metus vel\nipsum finibus, ut dapibus massa feugiat. Vestibulum vel lobortis libero. Sed\ntincidunt tellus et viverra scelerisque. Pellentesque tincidunt cursus felis.\nSed in egestas erat.\n\nAliquam pulvinar interdum massa, vel ullamcorper ante consectetur eu. Vestibulum\nlacinia ac enim vel placerat. Integer pulvinar magna nec dui malesuada, nec\ncongue nisl dictum. Donec mollis nisl tortor, at congue erat consequat a. Nam\ntempus elit porta, blandit elit vel, viverra lorem. Sed sit amet tellus\ntincidunt, faucibus nisl in, aliquet libero.', '2023-01-20 17:01:09'),
(26, 2, 'Sunt seculaes transferre talis camerarius fluctuies', 'sunt-seculaes-transferre-talis-camerarius-fluctuies', 'Pellentesque vitae velit ex. Aliquam sodales odio id eleifend tristique. Morbi tempus commodo mattis. Sunt accentores vitare salvus flavum parses. Bassus fatalis classiss virtualiter transferre de flavum. Ut suscipit posuere justo at vulputate.', 'Lorem ipsum dolor sit amet consectetur adipisicing elit, sed do eiusmod tempor\nincididunt ut labore et **dolore magna aliqua**: Duis aute irure dolor in\nreprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia\ndeserunt mollit anim id est laborum.\n\n  * Ut enim ad minim veniam\n  * Quis nostrud exercitation *ullamco laboris*\n  * Nisi ut aliquip ex ea commodo consequat\n\nPraesent id fermentum lorem. Ut est lorem, fringilla at accumsan nec, euismod at\nnunc. Aenean mattis sollicitudin mattis. Nullam pulvinar vestibulum bibendum.\nClass aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos\nhimenaeos. Fusce nulla purus, gravida ac interdum ut, blandit eget ex. Duis a\nluctus dolor.\n\nInteger auctor massa maximus nulla scelerisque accumsan. *Aliquam ac malesuada*\nex. Pellentesque tortor magna, vulputate eu vulputate ut, venenatis ac lectus.\nPraesent ut lacinia sem. Mauris a lectus eget felis mollis feugiat. Quisque\nefficitur, mi ut semper pulvinar, urna urna blandit massa, eget tincidunt augue\nnulla vitae est.\n\nUt posuere aliquet tincidunt. Aliquam erat volutpat. **Class aptent taciti**\nsociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Morbi\narcu orci, gravida eget aliquam eu, suscipit et ante. Morbi vulputate metus vel\nipsum finibus, ut dapibus massa feugiat. Vestibulum vel lobortis libero. Sed\ntincidunt tellus et viverra scelerisque. Pellentesque tincidunt cursus felis.\nSed in egestas erat.\n\nAliquam pulvinar interdum massa, vel ullamcorper ante consectetur eu. Vestibulum\nlacinia ac enim vel placerat. Integer pulvinar magna nec dui malesuada, nec\ncongue nisl dictum. Donec mollis nisl tortor, at congue erat consequat a. Nam\ntempus elit porta, blandit elit vel, viverra lorem. Sed sit amet tellus\ntincidunt, faucibus nisl in, aliquet libero.', '2023-01-19 17:01:09'),
(27, 2, 'Era brevis ratione est', 'era-brevis-ratione-est', 'Diatrias tolerare tanquam noster caesium. Sunt accentores vitare salvus flavum parses. Sunt seculaes transferre talis camerarius fluctuies. In hac habitasse platea dictumst. Teres talis saepe tractare de camerarius flavum sensorem.', 'Lorem ipsum dolor sit amet consectetur adipisicing elit, sed do eiusmod tempor\nincididunt ut labore et **dolore magna aliqua**: Duis aute irure dolor in\nreprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia\ndeserunt mollit anim id est laborum.\n\n  * Ut enim ad minim veniam\n  * Quis nostrud exercitation *ullamco laboris*\n  * Nisi ut aliquip ex ea commodo consequat\n\nPraesent id fermentum lorem. Ut est lorem, fringilla at accumsan nec, euismod at\nnunc. Aenean mattis sollicitudin mattis. Nullam pulvinar vestibulum bibendum.\nClass aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos\nhimenaeos. Fusce nulla purus, gravida ac interdum ut, blandit eget ex. Duis a\nluctus dolor.\n\nInteger auctor massa maximus nulla scelerisque accumsan. *Aliquam ac malesuada*\nex. Pellentesque tortor magna, vulputate eu vulputate ut, venenatis ac lectus.\nPraesent ut lacinia sem. Mauris a lectus eget felis mollis feugiat. Quisque\nefficitur, mi ut semper pulvinar, urna urna blandit massa, eget tincidunt augue\nnulla vitae est.\n\nUt posuere aliquet tincidunt. Aliquam erat volutpat. **Class aptent taciti**\nsociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Morbi\narcu orci, gravida eget aliquam eu, suscipit et ante. Morbi vulputate metus vel\nipsum finibus, ut dapibus massa feugiat. Vestibulum vel lobortis libero. Sed\ntincidunt tellus et viverra scelerisque. Pellentesque tincidunt cursus felis.\nSed in egestas erat.\n\nAliquam pulvinar interdum massa, vel ullamcorper ante consectetur eu. Vestibulum\nlacinia ac enim vel placerat. Integer pulvinar magna nec dui malesuada, nec\ncongue nisl dictum. Donec mollis nisl tortor, at congue erat consequat a. Nam\ntempus elit porta, blandit elit vel, viverra lorem. Sed sit amet tellus\ntincidunt, faucibus nisl in, aliquet libero.', '2023-01-18 17:01:09'),
(28, 1, 'Sunt torquises imitari velox mirabilis medicinaes', 'sunt-torquises-imitari-velox-mirabilis-medicinaes', 'Eros diam egestas libero eu vulputate risus. Lorem ipsum dolor sit amet consectetur adipiscing elit. Vae humani generis. Teres talis saepe tractare de camerarius flavum sensorem. Aliquam sodales odio id eleifend tristique. Era brevis ratione est.', 'Lorem ipsum dolor sit amet consectetur adipisicing elit, sed do eiusmod tempor\nincididunt ut labore et **dolore magna aliqua**: Duis aute irure dolor in\nreprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia\ndeserunt mollit anim id est laborum.\n\n  * Ut enim ad minim veniam\n  * Quis nostrud exercitation *ullamco laboris*\n  * Nisi ut aliquip ex ea commodo consequat\n\nPraesent id fermentum lorem. Ut est lorem, fringilla at accumsan nec, euismod at\nnunc. Aenean mattis sollicitudin mattis. Nullam pulvinar vestibulum bibendum.\nClass aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos\nhimenaeos. Fusce nulla purus, gravida ac interdum ut, blandit eget ex. Duis a\nluctus dolor.\n\nInteger auctor massa maximus nulla scelerisque accumsan. *Aliquam ac malesuada*\nex. Pellentesque tortor magna, vulputate eu vulputate ut, venenatis ac lectus.\nPraesent ut lacinia sem. Mauris a lectus eget felis mollis feugiat. Quisque\nefficitur, mi ut semper pulvinar, urna urna blandit massa, eget tincidunt augue\nnulla vitae est.\n\nUt posuere aliquet tincidunt. Aliquam erat volutpat. **Class aptent taciti**\nsociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Morbi\narcu orci, gravida eget aliquam eu, suscipit et ante. Morbi vulputate metus vel\nipsum finibus, ut dapibus massa feugiat. Vestibulum vel lobortis libero. Sed\ntincidunt tellus et viverra scelerisque. Pellentesque tincidunt cursus felis.\nSed in egestas erat.\n\nAliquam pulvinar interdum massa, vel ullamcorper ante consectetur eu. Vestibulum\nlacinia ac enim vel placerat. Integer pulvinar magna nec dui malesuada, nec\ncongue nisl dictum. Donec mollis nisl tortor, at congue erat consequat a. Nam\ntempus elit porta, blandit elit vel, viverra lorem. Sed sit amet tellus\ntincidunt, faucibus nisl in, aliquet libero.', '2023-01-17 17:01:09'),
(29, 2, 'Mineralis persuadere omnes finises desiderium', 'mineralis-persuadere-omnes-finises-desiderium', 'Nunc viverra elit ac laoreet suscipit. Ubi est barbatus nix. Diatrias tolerare tanquam noster caesium. Ut suscipit posuere justo at vulputate. Bassus fatalis classiss virtualiter transferre de flavum. Silva de secundus galatae demitto quadra.', 'Lorem ipsum dolor sit amet consectetur adipisicing elit, sed do eiusmod tempor\nincididunt ut labore et **dolore magna aliqua**: Duis aute irure dolor in\nreprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia\ndeserunt mollit anim id est laborum.\n\n  * Ut enim ad minim veniam\n  * Quis nostrud exercitation *ullamco laboris*\n  * Nisi ut aliquip ex ea commodo consequat\n\nPraesent id fermentum lorem. Ut est lorem, fringilla at accumsan nec, euismod at\nnunc. Aenean mattis sollicitudin mattis. Nullam pulvinar vestibulum bibendum.\nClass aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos\nhimenaeos. Fusce nulla purus, gravida ac interdum ut, blandit eget ex. Duis a\nluctus dolor.\n\nInteger auctor massa maximus nulla scelerisque accumsan. *Aliquam ac malesuada*\nex. Pellentesque tortor magna, vulputate eu vulputate ut, venenatis ac lectus.\nPraesent ut lacinia sem. Mauris a lectus eget felis mollis feugiat. Quisque\nefficitur, mi ut semper pulvinar, urna urna blandit massa, eget tincidunt augue\nnulla vitae est.\n\nUt posuere aliquet tincidunt. Aliquam erat volutpat. **Class aptent taciti**\nsociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Morbi\narcu orci, gravida eget aliquam eu, suscipit et ante. Morbi vulputate metus vel\nipsum finibus, ut dapibus massa feugiat. Vestibulum vel lobortis libero. Sed\ntincidunt tellus et viverra scelerisque. Pellentesque tincidunt cursus felis.\nSed in egestas erat.\n\nAliquam pulvinar interdum massa, vel ullamcorper ante consectetur eu. Vestibulum\nlacinia ac enim vel placerat. Integer pulvinar magna nec dui malesuada, nec\ncongue nisl dictum. Donec mollis nisl tortor, at congue erat consequat a. Nam\ntempus elit porta, blandit elit vel, viverra lorem. Sed sit amet tellus\ntincidunt, faucibus nisl in, aliquet libero.', '2023-01-16 17:01:09'),
(36, 1, 'sdsdffff', 'sdsd', 'sffffffffffff', 'sfffffffffffff', '2023-02-17 18:10:00'),
(38, 1, 'Pregnancy Guide', 'pregnancy-guide', 'What to expect when you\'re expecting', '<style>\r\n		body {\r\n			font-family: Arial, sans-serif;\r\n			line-height: 1.5;\r\n			margin: 0;\r\n			padding: 0;\r\n		}\r\n\r\n		h1 {\r\n			font-size: 36px;\r\n			margin-top: 20px;\r\n			margin-bottom: 20px;\r\n		}\r\n\r\n		h2 {\r\n			font-size: 28px;\r\n			margin-top: 20px;\r\n			margin-bottom: 20px;\r\n		}\r\n\r\n		p {\r\n			font-size: 18px;\r\n			margin-top: 20px;\r\n			margin-bottom: 20px;\r\n		}\r\n\r\n		img {\r\n			max-width: 100%;\r\n			height: auto;\r\n			display: block;\r\n			margin: 20px auto;\r\n		}\r\n	</style>\r\n</head>\r\n<body>\r\n	<header>\r\n		<h1>Pregnancy Guide</h1>\r\n	</header>\r\n	<main>\r\n		<section>\r\n			<h2>What to expect when you\'re expecting</h2>\r\n			<p>Whether you\'re a first-time mom or a seasoned pro, every pregnancy is different. Here are some general things you can expect during each trimester:</p>\r\n			<ul>\r\n				<li><strong>First trimester (week 1-12):</strong> This is when your body is going through a lot of changes as it prepares for the baby. You may experience morning sickness, fatigue, and mood swings.</li>\r\n				<li><strong>Second trimester (week 13-28):</strong> This is often the easiest trimester, as you\'ll likely have more energy and be feeling better overall. Your baby will be growing quickly during this time.</li>\r\n				<li><strong>Third trimester (week 29-40):</strong> This is when things start to get uncomfortable. Your baby will be getting bigger, which can lead to back pain and difficulty sleeping. You may also experience Braxton Hicks contractions.</li>\r\n			</ul>\r\n		</section>\r\n		<section>\r\n			<h2>Healthy habits to adopt during pregnancy</h2>\r\n			<p>It\'s important to take good care of yourself during pregnancy. Here are some healthy habits to adopt:</p>\r\n			<ol>\r\n				<li><strong>Eat a healthy diet:</strong> Make sure you\'re getting plenty of fruits, vegetables, and protein. Avoid processed foods and sugary drinks.</li>\r\n				<li><strong>Stay active:</strong> Exercise is important during pregnancy, but make sure to talk to your doctor first. Walking and swimming are great low-impact options.</li>\r\n				<li><strong>Get plenty of rest:</strong> Your body is working hard to grow a baby, so make sure to get enough sleep each night. If you\'re having trouble sleeping, try taking a warm bath or practicing relaxation techniques.</li>\r\n				<li><strong>Avoid harmful substances:</strong> This includes smoking, drinking alcohol, and using drugs. Talk to your doctor if you need help quitting.</li>\r\n			</ol>\r\n			<img src=\"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGQL_wG5gfSITBVVqMa7B4W_WMkXPzJ0XcAw&usqp=CAU\" alt=\"Healthy food for pregnancy\">\r\n		</section>\r\n		<section>\r\n			<h2>Preparing for Baby\'s Arrival</h2>\r\nBringing a new baby into the world is an exciting time, but it can also be overwhelming. There are so many things to think about and prepare for before your little one arrives. Here are some tips to help you get ready for your baby\'s big debut.\r\n\r\n<h3>Preparing the Nursery</h3>\r\nOne of the most exciting parts of preparing for a new baby is setting up the nursery. Here are some things to consider:\r\n\r\n<ul>\r\n  <li><strong>Crib:</strong> Your baby will likely spend a lot of time in their crib, so make sure it\'s safe and comfortable. Look for cribs that meet the latest safety standards and come with a firm, supportive mattress.</li>\r\n  <li><strong>Dresser and Changing Table:</strong> You\'ll need a place to store all of your baby\'s clothes and supplies. A dresser and changing table combo is a great space-saving option.</li>\r\n  <li><strong>Glider or Rocking Chair:</strong> A comfortable chair can make those middle-of-the-night feedings a little more bearable.</li>\r\n  <li><strong>Decor:</strong> Choose a theme or color scheme that you love. Consider adding some wall art, a mobile, or a rug to make the space feel more cozy.</li>\r\n</ul>\r\n<h3>Stocking Up on Supplies</h3>\r\nYou\'ll want to have plenty of baby supplies on hand when you bring your little one home. Here are some essentials to add to your shopping list:\r\n\r\n<ul>\r\n  <li><strong>Diapers and Wipes:</strong> Newborns go through a lot of diapers and wipes, so stock up!</li>\r\n  <li><strong>Clothes:</strong> You\'ll want to have a mix of sleepers, onesies, and outfits in various sizes.</li>\r\n  <li><strong>Blankets:</strong> Swaddling blankets are a must-have for newborns.</li>\r\n  <li><strong>Bottles and Formula:</strong> Even if you plan to breastfeed, it\'s a good idea to have some bottles and formula on hand just in case.</li>\r\n  <li><strong>Car Seat:</strong> You won\'t be able to leave the hospital without one!</li>\r\n</ul>\r\n<h3>Preparing Yourself</h3>\r\nDon\'t forget to take care of yourself as you prepare for your baby\'s arrival. Here are some tips to help you get ready:\r\n\r\n<ul>\r\n  <li><strong>Rest:</strong> Growing a human is hard work! Make sure you\'re getting plenty of rest before your baby arrives.</li>\r\n  <li><strong>Healthy Eating:</strong> Eating a healthy, balanced diet can help you and your baby stay healthy.</li>\r\n  <li><strong>Exercise:</strong> Check with your doctor to see what kind of exercise is safe for you during pregnancy.</li>\r\n  <li><strong>Self-Care:</strong> Take some time to do things that make you happy, whether it\'s reading a book, taking a bubble bath, or getting a massage.</li>\r\n</ul>\r\n<h3>Final Thoughts</h3>\r\nPreparing for a new baby can be stressful, but it\'s also an incredibly exciting time. Remember to take things one day at a time, and don\'t hesitate to reach out for help if you need it. With a little preparation, you\'ll be ready to welcome your little one into the world.', '2023-02-19 00:13:16'),
(39, 1, 'Preconception Health', 'preconception-health', 'Preconception Health and Health Care Is Important For All', '<div class=\"w-md-col6 float-md-right ml-md-3 pt-2\"><img class=\"img-fluid\" alt=\"Couple jogging outdoors\" title=\"Couple jogging outdoors\" src=https://www.cdc.gov/preconception/images/couple-jogging-700px.jpg?_=13519\"></div>\r\n<p>Preconception health refers to the health of people during their reproductive years, or the years they can have a child. It focuses on taking steps now to protect the health of a baby they might have some time in the future.</p>\r\n<p>All people can benefit from the principles of preconception health, whether or not they plan to have a baby one day. Preconception health is about people getting and staying healthy overall, across their lifespan. In addition, no one expects an unplanned pregnancy. But it happens often. About half of all pregnancies in the United States are not planned.</p>\r\n<h2><a id=\"PrconceptionHealthCare\" name=\"PrconceptionHealthCare\"></a><!-- -->Preconception Health Care</h2>\r\n<div class=\"w-md-col4 float-md-right ml-md-3\"><div class=\"card mb-3\"><div class=\"card-header h4 bg-tertiary\">Did you know?</div><div class=\"card-body bg-tertiary\"><p>There have been important advances in medicine and prenatal care in recent years. Despite these advances, birth outcomes are worse in the United States than in many other developed countries. Many babies are born early or have low birthweight. Among some groups of people, the problems actually are getting worse. Preconception health and preconception health care can make a difference.</p>\r\n</div></div></div>\r\n<p>Preconception health care is the medical care a person receives from their doctor or other health professionals that focuses on the parts of health that have been shown to increase the chance of having a healthy baby.</p>\r\n<p>Preconception health care is different for every person, depending on their unique needs. Based on a person’s health, the doctor or other health care professional will suggest a course of treatment or follow-up care as needed. Ask your healthcare provider about preconception health care, especially if you plan to become pregnant.</p>\r\n<h2>Preconception Health for Women</h2>\r\n<p>Preconception health is important for every woman―not just those planning a pregnancy. It means taking control and choosing healthy habits. It means living well, being healthy, and feeling good about your life. Preconception health is about planning for the future and taking steps to get there!</p>\r\n<p><a href=\"/preconception/planning.html\">I want to get ready for pregnancy »</a></p>\r\n<h2>Preconception Health for Men</h2>\r\n<p>Preconception health is important for men, too. It means choosing to get and stay as healthy as possible―and helping others to do the same as well. As a partner, it means encouraging and supporting your partner’s health. As a father, it means protecting your children. Preconception health is about providing yourself and your loved ones with a bright and healthy future. Taking care of your health now will help to ensure a better quality of life for yourself and your family in the coming years.</p>\r\n</div></div></div><div class=\"row \"><div class=\"col-md-12\"><div class=\"card mb-3\"><div class=\"card-header h4 bg-gray-l3\">Related Links</div><div class=\"card-body bg-white\"><ul class=\"block-list\">\r\n<li><a href=\"/women/\">Women’s Health</a></li>\r\n<li><a href=\"/reproductivehealth/WomensRH/index.htm\">Women’s Reproductive Health</a></li>\r\n<li><a href=\"/preconception/planning.html\">Get Ready for Pregnancy</a></li>\r\n<li><a href=\"/pregnancy/index.html\">Healthy Pregnancy</a></li>\r\n<li><a href=\"/pregnancy/meds/treatingfortwo/index.html\">Treating for Two</a></li>\r\n</ul>\r\n</div></div></div></div>\r\n				</div>', '2023-02-19 00:27:52'),
(40, 1, 'Planning for Pregnancy', 'planning-for-pregnancy', 'If you are trying to have a baby or are just thinking about it, it is not too early to start getting ready for pregnancy. Preconception health and health care focus on things you can do before and between pregnancies to increase the chances of having a he', 'If you are trying to have a baby or are just thinking about it, it is not too early to start getting ready for pregnancy. Preconception health and health care focus on things you can do before and between pregnancies to increase the chances of having a healthy baby. For some people, getting their bodies ready for pregnancy takes a few months. For other people, it might take longer. Whether this is your first, second, or sixth baby, the following are important steps to help you get ready for the healthiest pregnancy possible.</p>\r\n<h2>1. Make a Plan and Take Action</h2>\r\n<p>Whether or not you’ve written them down, you’ve probably thought about your goals for having or not having children, and how to achieve those goals. For example, when you didn’t want to have a baby, you used effective birth control methods. Now that you’re thinking about getting pregnant, it’s important to <a href=\"/preconception/documents/Pregnancy_Planner_508.pdf\" target=\"_blank\">take steps to achieve your goal <span aria-label=\"pdf icon\" class=\"sr-only\" role=\"img\"></span><span class=\"fi cdc-icon-pdf x16 fill-pdf\" alt=\"\" aria-hidden=\"true\"></span><span class=\"file-details\"></span></a>—getting pregnant and having a healthy baby!</p>\r\n<div class=\"w-md-col4 ml-2 mt-2 float-md-right ml-md-3\"><div class=\"card mb-3\"><div class=\"card-header h4 bg-primary\">Healthfinder Tool</div><div class=\"card-body bg-white\"><div class=\"d-block text-center pt-2\"><a href=\"/prevention/\"><img class=\"img-fluid\" alt=\"Icon of a checklist\" title=\"checklist-icon\" src=\"https://www.cdc.gov/preconception/images/doctor-with-husband-and-wife.jpg?_=81105\"></a></div>\r\n<p>Make sure you are up to date on preventive services. See which screening tests and vaccines you or your loved ones need to stay<strong>&nbsp;healthy.</strong></p>\r\n</div><div class=\"card-footer bt-0 pt-0 bg-white text-right\"><a href=\"/prevention/\" class=\"btn specialLinkIconLeft btn-primary b-primary\">More</a></div></div></div>\r\n<h2>2. See Your Doctor</h2>\r\n<p>Before getting pregnant, talk to your healthcare provider about <a href=\"/preconception/overview.html#PrconceptionHealthCare\">preconception health care</a>. Your provider will want to discuss your health history and any medical conditions you currently have that could affect a pregnancy. They may want to discuss any previous pregnancy problems, medicines you currently are taking, vaccinations you might need, and steps you can take before pregnancy to help prevent certain birth defects.</p>\r\n<p>Take a list of talking points so you don’t forget anything. Be sure to talk to your doctor about:</p>\r\n<h3>Medical Conditions</h3>\r\n<p>If you currently have any medical conditions, be sure they are under control and being treated. Some of these conditions include: <a href=\"/nchhstp/pregnancy/Default.htm\">sexually transmitted diseases (STDs)</a>, <a href=\"/pregnancy/diabetes.html\">diabetes</a>, <a href=\"http://www.nlm.nih.gov/medlineplus/thyroiddiseases.html\" class=\"tp-link-policy\" data-domain-ext=\"gov\">thyroid disease<span aria-label=\"external icon\" class=\"sr-only\" role=\"img\"></span><span class=\"fi cdc-icon-external x16 fill-external\" alt=\"\" aria-hidden=\"true\"></span></a>, <a href=\"https://www.cdc.gov/bloodpressure/pregnancy.htm\">high blood pressure</a>, and other <a href=\"https://www.cdc.gov/chronicdisease/index.htm\">chronic diseases</a>.</p>\r\n<h3>Lifestyle and Behaviors</h3>\r\n<p>Talk with your healthcare provider if you</p>\r\n<ul>\r\n<li><a href=\"https://www.cdc.gov/pregnancy/features/pregnantdontsmoke.html\">smoke</a>, <a href=\"https://www.cdc.gov/ncbddd/fasd/alcohol-use.html\">drink alcohol</a>, or use <a href=\"https://www.cdc.gov/reproductivehealth/maternalinfanthealth/substance-abuse/substance-abuse-during-pregnancy.htm\">certain drugs</a>;</li>\r\n<li>live in a stressful or&nbsp;<a href=\"https://www.cdc.gov/violenceprevention/intimatepartnerviolence/index.html\">abusive environment</a>; or</li>\r\n<li>work with or live around <a href=\"https://www.cdc.gov/niosh/topics/repro/specificexposures.html\">toxic substances.</a></li>\r\n</ul>\r\n<p>Health-care professionals can help you with counseling, treatment, and other support services.</p>\r\n<h3>Medications</h3>\r\n<p>Almost every pregnant person will face a decision about taking <a href=\"/pregnancy/meds/treatingfortwo/facts.html\">medicines before and during pregnancy</a>. Talk to your healthcare providers before starting or stopping any medicines. Be sure to discuss the following with your healthcare providers:</p>\r\n<ul>\r\n<li>All medicines you take, including prescriptions, over-the-counter medicines, herbal and dietary supplements, and vitamins</li>\r\n<li>Best ways to keep any health conditions you have under control</li>\r\n<li>Your personal goals and preferences for the health of you and your baby</li>\r\n</ul>\r\n<h3>Vaccinations (shots)</h3>\r\n<p>Most vaccines are safe during pregnancy and some, such as the flu vaccine and Tdap (adult tetanus, diphtheria and acellular pertussis vaccine), are specifically recommended during pregnancy. <a href=\"https://www.cdc.gov/vaccines/pregnancy/index.html\">Learn about vaccinations during pregnancy</a>&nbsp;and learn more about&nbsp;<a href=\"https://www.cdc.gov/coronavirus/2019-ncov/vaccines/recommendations/pregnancy.html\">COVID-19 vaccines while pregnant or breastfeeding</a>. Having the right vaccinations at the right time can help keep you healthy and help protect your baby from some diseases during the first few months of life.</p>\r\n<h2>3. Get 400 Micrograms of Folic Acid Every Day</h2>\r\n<p>Folic acid is a B vitamin. Having enough folic acid in your body at least 1 month before and during pregnancy can help prevent major birth defects of the developing baby’s brain and spine (<a href=\"https://www.cdc.gov/ncbddd/birthdefects/anencephaly.html\">anencephaly</a>&nbsp;and&nbsp;<a href=\"https://www.cdc.gov/ncbddd/spinabifida/facts.html\">spina bifida</a>). CDC urges all people who can become pregnant to get 400 micrograms (mcg) of folic acid each day, from fortified foods or supplements, or a combination of the two, in addition to a varied diet rich in folate.</p>\r\n<p><a href=\"/ncbddd/folicacid/index.html\">Learn more about folic acid »</a></p>\r\n<h2>4. Stop Drinking Alcohol, Smoking, and Using Certain Drugs</h2>\r\n<p>Smoking, drinking alcohol, and using certain drugs can cause many problems during pregnancy, such as premature birth, birth defects, and infant death.</p>\r\n<p>If you are trying to get pregnant and cannot stop drinking, smoking, or using drugs, contact your healthcare provider, local Alcoholics Anonymous, or local alcohol treatment center.</p>\r\n<h3>Alcohol and Drug Resources</h3>\r\n<p><a href=\"http://findtreatment.samhsa.gov\" class=\"tp-link-policy\" data-domain-ext=\"gov\">Substance Abuse Treatment Facility Locator<span aria-label=\"external icon\" class=\"sr-only\" role=\"img\"></span><span class=\"fi cdc-icon-external x16 fill-external\" alt=\"\" aria-hidden=\"true\"></span></a><br>\r\nThe Substance Abuse and Mental Health Services Administration (SAMHSA) has a treatment facility locator. This locator helps people find drug and alcohol treatment programs in their area.</p>\r\n<p><a href=\"http://www.aa.org/?Media=PlayFlash\" class=\"tp-link-policy\" data-domain-ext=\"org\">Alcoholics Anonymous<span aria-label=\"external icon\" class=\"sr-only\" role=\"img\"></span><span class=\"fi cdc-icon-external x16 fill-external\" alt=\"\" aria-hidden=\"true\"></span></a> (A.A.)<br>\r\nAlcoholics Anonymous® is a fellowship of people who come together to solve their drinking problem. Membership is open to anyone who wants to do something about their drinking problem. A.A.’s primary purpose is to help alcoholics to achieve sobriety. <a href=\"http://www.aa.org/lang/en/meeting_finder.cfm?origpage=29\" class=\"tp-link-policy\" data-domain-ext=\"org\">Locate an A.A. program<span aria-label=\"external icon\" class=\"sr-only\" role=\"img\"></span><span class=\"fi cdc-icon-external x16 fill-external\" alt=\"\" aria-hidden=\"true\"></span></a> near you.</p>\r\n<p><a href=\"https://www.cdc.gov/ncbddd/fasd/alcohol-use.html\">Learn more about alcohol and pregnancy »</a></p>\r\n<h3>Smoking Resources</h3>\r\n<p>1-800-QUIT-NOW (1-800-784-8669)</p>\r\n<p><a href=\"https://www.cdc.gov/pregnancy/features/pregnantdontsmoke.html\">Learn more about smoking during pregnancy »</a></p>\r\n<h2>5. Avoid Toxic Substances and Environmental Contaminants</h2>\r\n<p>Avoid harmful chemicals, environmental contaminants, and other toxic substances such as synthetic chemicals, some metals, fertilizer, bug spray, and cat or rodent feces around the home and in the workplace. These substances can hurt the reproductive systems of men and women. They can make it more difficult to get pregnant. Exposure to even small amounts during pregnancy, infancy, childhood, or puberty can lead to diseases. Learn how to protect yourself and your loved ones from toxic substances at work and at home.</p>\r\n<p><a href=\"/niosh/topics/repro/pregnancy.html\">Learn about the effects of toxic substances on reproductive health »</a></p>\r\n<p><a href=\"http://ephtracking.cdc.gov/showChildEHMain.action\">Learn how CDC tracks Children’s Environmental Health »</a></p>\r\n<h2>6. Reach and Maintain a Healthy Weight</h2>\r\n<p>People who are <a href=\"/obesity\">overweight or obese</a> have a higher risk for many serious conditions, including complications during pregnancy, heart disease, type 2 diabetes, and certain cancers (endometrial, breast, and colon).<sup><a href=\"/preconception/planning.html#ref\">1</a></sup> People who are underweight are also at risk for serious health problems.<sup><a href=\"/preconception/planning.html#ref\">2</a></sup></p>\r\n<p>The key to achieving and maintaining a healthy weight isn’t about short-term dietary changes. It’s about a lifestyle that includes healthy eating and regular physical activity.</p>\r\n<p>If you are underweight, overweight, or obese, talk with your doctor about ways to reach and maintain a healthy weight before you get pregnant.</p>\r\n<p><a href=\"/healthyweight/index.html\">Learn more about healthy weight »</a></p>\r\n<h2>7. Learn Your Family History</h2>\r\n<p>Collecting your family’s health history can help you identify factors that might affect your baby during infancy or childhood or your ability to become pregnant. You might not realize that your sister’s heart defect or your cousin’s sickle cell disease could affect your baby, but sharing this family history information with your doctor can be important.</p>\r\n<p>Based on your family health history, your doctor might refer you for genetic counseling. Other reasons for genetic counseling include having had several miscarriages, infant deaths, or trouble getting pregnant (infertility), or having a genetic condition or birth defect that occurred during a previous pregnancy.</p>\r\n<p><a href=\"https://www.cdc.gov/genomics/famhistory/famhist_plan_pregnancy.htm\">Learn more about family history »</a></p>\r\n<p><a href=\"https://www.cdc.gov/genomics/gtesting/genetic_counseling.htm\">Learn more about genetic counseling »</a></p>\r\n<h2>8. Get Mentally Healthy</h2>\r\n<p>Mental health is how we think, feel, and act as we cope with life. To be at your best, you need to feel good about your life and value yourself. Everyone feels worried, anxious, sad, or stressed sometimes. However, if these feelings do not go away and they interfere with your daily life, get help. Talk with your healthcare provider about your feelings and treatment options.</p>\r\n<p><a href=\"https://www.cdc.gov/mentalhealth/index.htm\">Learn about mental health »</a></p>\r\n<p><a href=\"/reproductivehealth/Depression\">Learn about depression »</a></p>\r\n<h2><a id=\"ref\" name=\"ref\"></a><!-- -->References</h2>\r\n<ol>\r\n<li>NIH, NHLBI Obesity Education Initiative. Clinical Guidelines on the Identification, Evaluation, and Treatment of Overweight and Obesity in Adults. Available online:<br>\r\n<a href=\"http://www.nhlbi.nih.gov/guidelines/obesity/ob_gdlns.pdf\" target=\"_blank\" class=\"tp-link-policy\" data-domain-ext=\"gov\">http://www.nhlbi.nih.gov/guidelines/obesity/ob_gdlns.pdf<span aria-label=\"pdf icon\" class=\"sr-only\" role=\"img\"></span><span class=\"fi cdc-icon-pdf x16 fill-pdf\" alt=\"\" aria-hidden=\"true\"></span><span class=\"file-details\"></span><span aria-label=\"external icon\" class=\"sr-only\" role=\"img\"></span><span class=\"fi cdc-icon-external x16 fill-external\" alt=\"\" aria-hidden=\"true\"></span></a> (PDF-1.25Mb)</li>\r\n<li>Moos, Merry-K, et al. Healthier women, healthier reproductive outcomes: recommendations for the routine care of all women of reproductive age. AJOG Volume 199, Issue 6, Supplement B , Pages S280-S289, December 2008.</li>\r\n</ol>\r\n</div></div></div>\r\n				</div>', '2023-02-19 00:34:00'),
(41, 1, 'eeeedddd', 'zzdd', 'dddddddddddddddd', 'dddddddddddddd', '2023-02-20 14:54:26');

-- --------------------------------------------------------

--
-- Table structure for table `post_tag`
--

CREATE TABLE `post_tag` (
  `post_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_tag`
--

INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES
(3, 3),
(3, 7),
(4, 3),
(4, 5),
(4, 6),
(6, 1),
(6, 4),
(6, 8),
(7, 7),
(7, 8),
(7, 9),
(8, 4),
(8, 5),
(9, 2),
(9, 6),
(10, 4),
(10, 6),
(10, 9),
(11, 1),
(11, 7),
(11, 8),
(12, 3),
(12, 6),
(12, 9),
(13, 2),
(13, 3),
(13, 6),
(13, 8),
(14, 4),
(14, 7),
(14, 8),
(15, 2),
(15, 5),
(15, 6),
(16, 1),
(16, 2),
(16, 4),
(17, 1),
(17, 2),
(17, 3),
(18, 4),
(18, 9),
(19, 5),
(19, 8),
(19, 9),
(20, 6),
(20, 7),
(21, 6),
(21, 7),
(21, 8),
(22, 3),
(22, 5),
(23, 3),
(23, 7),
(23, 9),
(24, 2),
(24, 7),
(24, 9),
(25, 1),
(25, 4),
(26, 7),
(26, 9),
(27, 4),
(27, 5),
(27, 8),
(28, 1),
(28, 3),
(28, 4),
(28, 6),
(29, 1),
(29, 6),
(29, 7),
(36, 10),
(38, 10);

-- --------------------------------------------------------

--
-- Table structure for table `produit`
--

CREATE TABLE `produit` (
  `id` int(11) NOT NULL,
  `promo_id` int(11) DEFAULT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantite` int(255) NOT NULL,
  `prix` double NOT NULL,
  `categorie` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `produit`
--

INSERT INTO `produit` (`id`, `promo_id`, `nom`, `quantite`, `prix`, `categorie`, `description`, `image`, `lat`, `lon`) VALUES
(14, 3, '\"hhhh\"', 5, 12, '\"klk\"', '\"bbb\"', '\"https://th.bing.com/th/id/R.f285ef8c4620e38d59e9fb960b8e00fa?rik=JJBp+zE/5aCZ4Q', '36.74227132668139', '10.529250844216591'),
(15, 3, '\"hhhh\"', 5, 12, '\"klk\"', '\"bbb\"', '\"https://th.bing.com/th/id/R.f285ef8c4620e38d59e9fb960b8e00fa?rik=JJBp+zE/5aCZ4Q', '36.74227132668139', '10.529250844216591'),
(16, 3, '\"hhgggff\"', 5, 12, '\"klk\"', '\"bbb\"', '\"https://th.bing.com/th/id/R.f285ef8c4620e38d59e9fb960b8e00fa?rik=JJBp+zE/5aCZ4Q', '36.74227132668139', '10.529250844216591'),
(17, 2, 'hhhhhhhhh', 22, 225, 'vitamins', 'kkkkkkkkkkkkkk', 'https://th.bing.com/th/id/R.f285ef8c4620e38d59e9fb960b8e00fa?rik=JJBp+zE/5aCZ4Q', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `promotion`
--

CREATE TABLE `promotion` (
  `id` int(11) NOT NULL,
  `date_debut_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `date_fin_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `pourcentage` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `promotion`
--

INSERT INTO `promotion` (`id`, `date_debut_at`, `date_fin_at`, `pourcentage`) VALUES
(2, '2023-01-01 00:00:00', '2023-01-12 00:00:00', 20),
(3, '2023-02-16 21:24:58', '2023-02-23 21:24:58', 15),
(4, '2018-01-01 00:00:00', '2018-01-01 00:00:00', 0),
(9, '2023-08-11 00:00:00', '2024-01-01 00:00:00', 0),
(10, '2023-05-01 00:00:00', '2023-10-01 00:00:00', 50),
(11, '2023-04-01 00:00:00', '2024-10-17 00:00:00', 50),
(12, '2023-07-08 00:00:00', '2023-08-19 00:00:00', 80),
(13, '2024-01-01 00:00:00', '2025-01-01 00:00:00', 20);

-- --------------------------------------------------------

--
-- Table structure for table `reclamation`
--

CREATE TABLE `reclamation` (
  `id` int(11) NOT NULL,
  `id_patient_id` int(11) NOT NULL,
  `titre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reponse`
--

CREATE TABLE `reponse` (
  `id` int(11) NOT NULL,
  `id_reclamation_id` int(11) NOT NULL,
  `reponse` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `resultat`
--

CREATE TABLE `resultat` (
  `id` int(11) NOT NULL,
  `diagnostic_id` int(11) DEFAULT NULL,
  `action` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `possibility` int(11) NOT NULL,
  `doctor_note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `urgency` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `resultat`
--

INSERT INTO `resultat` (`id`, `diagnostic_id`, `action`, `possibility`, `doctor_note`, `urgency`) VALUES
(12, 14, 'Changer les médicaments', 45, 'Waitin to doctors to respond ...', 'No'),
(13, 15, 'Changer les médicaments', 99, 'Waitin to doctors to respond ...', 'No'),
(14, 6, 'done', 80, 'okay', 'yes'),
(20, 21, 'Commencer un traitement médicamenteux', 48, 'Waitin to doctors to respond ...', 'No'),
(21, 22, 'Réduire l\'exposition au soleil', 94, 'Waitin to doctors to respond ...', 'No'),
(22, 23, 'Suivre un programme de réadaptation cardiaque', 60, 'Waitin to doctors to respond ...', 'No'),
(23, 24, 'Commencer un traitement médicamenteux', 86, 'Waitin to doctors to respond ...', 'No'),
(24, 25, 'Suivre un programme de réadaptation cardiaque', 32, 'Waitin to doctors to respond ...', 'No');

-- --------------------------------------------------------

--
-- Table structure for table `stars`
--

CREATE TABLE `stars` (
  `id` int(11) NOT NULL,
  `idpost_id` int(11) DEFAULT NULL,
  `u_id` int(11) DEFAULT NULL,
  `rate_index` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stars`
--

INSERT INTO `stars` (`id`, `idpost_id`, `u_id`, `rate_index`) VALUES
(1, 40, 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

CREATE TABLE `tag` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tag`
--

INSERT INTO `tag` (`id`, `name`) VALUES
(4, 'adipiscing'),
(3, 'consectetur'),
(11, 'dddd'),
(8, 'dolore'),
(5, 'incididunt'),
(2, 'ipsum'),
(6, 'labore'),
(1, 'lorem'),
(9, 'pariatur'),
(10, 'test'),
(7, 'voluptate');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`roles`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `full_name`, `username`, `email`, `password`, `roles`) VALUES
(1, 'aphro admin', 'admin', 'aphroadmin@symfony.com', '$2y$13$39yWIwPZonpxmDi4Bz0Vfu1xLFmRNV0KsfQq1..CGkSQouomFVHCi', '[\"ROLE_ADMIN\"]'),
(2, 'Tom Doe', 'tom_admin', 'tom_admin@symfony.com', '$2y$13$m9SkKmULkjCkKJf5los98.RXnsVC/hRMavZoTVi19Wrd8BI4Tvs0W', '[\"ROLE_ADMIN\"]'),
(3, 'aphro user', 'user', 'aphrouser@symfony.com', '$2y$13$KOgbbgFYIFzLgsfQes.lV.zwWlVu9glZ9dnHJAFvY/.Ti5Y8fFRWq', '[\"ROLE_USER\"]');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment_request`
--
ALTER TABLE `appointment_request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_AAB4BDB7CE0312AE` (`id_patient_id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_9474526C4B89032C` (`post_id`),
  ADD KEY `IDX_9474526CF675F31B` (`author_id`);

--
-- Indexes for table `diagnostic`
--
ALTER TABLE `diagnostic`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `fiche_patient`
--
ALTER TABLE `fiche_patient`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_2DB8C3191EF7EAA` (`rendez_vous_id`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_5A8A6C8DF675F31B` (`author_id`);

--
-- Indexes for table `post_tag`
--
ALTER TABLE `post_tag`
  ADD PRIMARY KEY (`post_id`,`tag_id`),
  ADD KEY `IDX_5ACE3AF04B89032C` (`post_id`),
  ADD KEY `IDX_5ACE3AF0BAD26311` (`tag_id`);

--
-- Indexes for table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_29A5EC27D0C07AFF` (`promo_id`);

--
-- Indexes for table `promotion`
--
ALTER TABLE `promotion`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reclamation`
--
ALTER TABLE `reclamation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_CE606404CE0312AE` (`id_patient_id`);

--
-- Indexes for table `reponse`
--
ALTER TABLE `reponse`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_5FB6DEC7100D1FDF` (`id_reclamation_id`);

--
-- Indexes for table `resultat`
--
ALTER TABLE `resultat`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_E7DB5DE2224CCA91` (`diagnostic_id`);

--
-- Indexes for table `stars`
--
ALTER TABLE `stars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_11DC02C948D5142` (`idpost_id`);

--
-- Indexes for table `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_389B7835E237E06` (`name`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649F85E0677` (`username`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointment_request`
--
ALTER TABLE `appointment_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=188;

--
-- AUTO_INCREMENT for table `diagnostic`
--
ALTER TABLE `diagnostic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `fiche_patient`
--
ALTER TABLE `fiche_patient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `produit`
--
ALTER TABLE `produit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `promotion`
--
ALTER TABLE `promotion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `reclamation`
--
ALTER TABLE `reclamation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reponse`
--
ALTER TABLE `reponse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `resultat`
--
ALTER TABLE `resultat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `stars`
--
ALTER TABLE `stars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tag`
--
ALTER TABLE `tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointment_request`
--
ALTER TABLE `appointment_request`
  ADD CONSTRAINT `FK_AAB4BDB7CE0312AE` FOREIGN KEY (`id_patient_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `FK_9474526C4B89032C` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`),
  ADD CONSTRAINT `FK_9474526CF675F31B` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `fiche_patient`
--
ALTER TABLE `fiche_patient`
  ADD CONSTRAINT `FK_2DB8C3191EF7EAA` FOREIGN KEY (`rendez_vous_id`) REFERENCES `appointment_request` (`id`);

--
-- Constraints for table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `FK_5A8A6C8DF675F31B` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `post_tag`
--
ALTER TABLE `post_tag`
  ADD CONSTRAINT `FK_5ACE3AF04B89032C` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_5ACE3AF0BAD26311` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `FK_29A5EC27D0C07AFF` FOREIGN KEY (`promo_id`) REFERENCES `promotion` (`id`);

--
-- Constraints for table `reclamation`
--
ALTER TABLE `reclamation`
  ADD CONSTRAINT `FK_CE606404CE0312AE` FOREIGN KEY (`id_patient_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `reponse`
--
ALTER TABLE `reponse`
  ADD CONSTRAINT `FK_5FB6DEC7100D1FDF` FOREIGN KEY (`id_reclamation_id`) REFERENCES `reclamation` (`id`);

--
-- Constraints for table `resultat`
--
ALTER TABLE `resultat`
  ADD CONSTRAINT `FK_E7DB5DE2224CCA91` FOREIGN KEY (`diagnostic_id`) REFERENCES `diagnostic` (`id`);

--
-- Constraints for table `stars`
--
ALTER TABLE `stars`
  ADD CONSTRAINT `FK_11DC02C948D5142` FOREIGN KEY (`idpost_id`) REFERENCES `post` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
