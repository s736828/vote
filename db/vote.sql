-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2023-05-26 10:36:04
-- 伺服器版本： 10.4.28-MariaDB
-- PHP 版本： 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `vote`
--

-- --------------------------------------------------------

--
-- 資料表結構 `logs`
--

CREATE TABLE `logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `mem_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `vote_time` datetime NOT NULL,
  `records` text NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `logs`
--

INSERT INTO `logs` (`id`, `mem_id`, `topic_id`, `vote_time`, `records`, `created_time`) VALUES
(1, 1, 2, '2023-05-22 08:03:17', 'a:1:{i:2;a:2:{i:0;s:1:\"8\";i:1;s:2:\"18\";}}', '2023-05-22 06:03:17'),
(2, 1, 2, '2023-05-22 14:05:34', 'a:1:{i:2;a:1:{i:0;s:2:\"19\";}}', '2023-05-22 06:05:34'),
(3, 1, 2, '2023-05-22 14:21:07', 'a:1:{i:2;a:1:{i:0;s:2:\"18\";}}', '2023-05-22 06:21:07'),
(4, 1, 2, '2023-05-22 14:40:41', 'a:1:{i:2;N;}', '2023-05-22 06:40:41'),
(5, 1, 2, '2023-05-22 15:06:12', 'a:1:{i:2;a:1:{i:0;s:2:\"19\";}}', '2023-05-22 07:06:12'),
(6, 1, 2, '2023-05-23 07:48:54', 'a:1:{i:2;a:1:{i:0;s:2:\"20\";}}', '2023-05-22 23:48:54'),
(7, 1, 2, '2023-05-23 11:59:30', 'a:1:{i:2;a:2:{i:0;s:2:\"18\";i:1;s:2:\"19\";}}', '2023-05-23 03:59:30'),
(8, 1, 6, '2023-05-26 08:22:57', 'a:1:{i:6;a:3:{i:0;s:2:\"25\";i:1;s:2:\"26\";i:2;s:2:\"27\";}}', '2023-05-26 00:22:57'),
(9, 1, 7, '2023-05-26 11:08:58', 'a:1:{i:7;s:2:\"29\";}', '2023-05-26 03:08:58'),
(10, 0, 8, '2023-05-26 11:55:50', 'a:1:{i:8;a:2:{i:0;s:2:\"32\";i:1;s:2:\"33\";}}', '2023-05-26 03:55:50'),
(11, 0, 7, '2023-05-26 11:56:01', 'a:1:{i:7;s:2:\"29\";}', '2023-05-26 03:56:01'),
(12, 0, 5, '2023-05-26 11:56:08', 'a:1:{i:5;s:2:\"22\";}', '2023-05-26 03:56:08'),
(13, 1, 6, '2023-05-26 13:03:31', 'a:1:{i:6;a:1:{i:0;s:2:\"25\";}}', '2023-05-26 05:03:31'),
(14, 0, 8, '2023-05-26 13:07:53', 'a:1:{i:8;a:2:{i:0;s:2:\"32\";i:1;s:2:\"33\";}}', '2023-05-26 05:07:53');

-- --------------------------------------------------------

--
-- 資料表結構 `members`
--

CREATE TABLE `members` (
  `id` int(10) UNSIGNED NOT NULL,
  `acc` varchar(32) NOT NULL,
  `pw` varchar(16) NOT NULL,
  `name` varchar(16) NOT NULL,
  `addr` varchar(128) NOT NULL,
  `email` varchar(64) NOT NULL,
  `pr` varchar(16) NOT NULL DEFAULT 'member'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `members`
--

INSERT INTO `members` (`id`, `acc`, `pw`, `name`, `addr`, `email`, `pr`) VALUES
(1, 'admin', '1234', '吳', '三重', 'abcd@gmail.com', 'admin'),
(2, 'DD', '222', '陳', '板橋', 'abcd@gmail.com', 'admin'),
(3, 'AAA', '111', '', '', '', 'admin'),
(4, 'dd', '5555', 'cxva', '三重', 'abcd@gmail.com', 'admin'),
(5, 'bbb', '222', '3daf', '123456', 'ikj', 'member'),
(6, 'bbb', '222', '3daf', '123456', 'ikj', 'super'),
(7, 'ee', '555', 'dd', '三重', 'abcd@gmail.com', 'super'),
(8, 'aaa', '5678', 'AAA', '三重', 'abcd@gmail.com', 'member');

-- --------------------------------------------------------

--
-- 資料表結構 `options`
--

CREATE TABLE `options` (
  `id` int(10) UNSIGNED NOT NULL,
  `description` text NOT NULL,
  `subject_id` int(10) UNSIGNED NOT NULL,
  `total` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `options`
--

INSERT INTO `options` (`id`, `description`, `subject_id`, `total`, `created_time`, `updated_time`) VALUES
(8, '20分鐘', 2, 15, '2023-05-15 08:19:27', '2023-05-22 06:03:17'),
(18, '2分鐘', 2, 17, '2023-05-19 06:16:31', '2023-05-23 03:59:30'),
(19, '10000秒', 2, 15, '2023-05-19 06:16:31', '2023-05-23 03:59:30'),
(20, '123233132131', 2, 17, '2023-05-19 06:18:06', '2023-05-22 23:48:54'),
(21, '3.5萬', 5, 6, '2023-05-19 06:23:38', '2023-05-19 08:21:18'),
(22, '4萬', 5, 7, '2023-05-19 06:23:38', '2023-05-26 03:56:08'),
(23, '4.5萬', 5, 8, '2023-05-19 06:23:38', '2023-05-19 08:21:10'),
(24, '5萬以上', 5, 38, '2023-05-19 06:23:38', '2023-05-19 08:23:48'),
(25, 'ddd', 6, 2, '2023-05-25 23:57:37', '2023-05-26 05:03:31'),
(26, 'fff', 6, 1, '2023-05-25 23:57:37', '2023-05-26 00:22:57'),
(27, 'eee', 6, 1, '2023-05-25 23:57:37', '2023-05-26 00:22:57'),
(28, '123', 7, 0, '2023-05-26 00:01:28', '2023-05-26 00:01:28'),
(29, '4567', 7, 2, '2023-05-26 00:01:28', '2023-05-26 03:56:01'),
(30, '789', 7, 0, '2023-05-26 00:01:28', '2023-05-26 00:01:28'),
(31, '345', 8, 0, '2023-05-26 00:03:58', '2023-05-26 00:03:58'),
(32, '5435', 8, 2, '2023-05-26 00:03:58', '2023-05-26 05:07:53'),
(33, '65', 8, 2, '2023-05-26 00:03:58', '2023-05-26 05:07:53');

-- --------------------------------------------------------

--
-- 資料表結構 `topics`
--

CREATE TABLE `topics` (
  `id` int(10) UNSIGNED NOT NULL,
  `subject` text NOT NULL,
  `type` int(1) UNSIGNED NOT NULL,
  `login` tinyint(1) NOT NULL,
  `open_time` datetime NOT NULL,
  `close_time` datetime NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `topics`
--

INSERT INTO `topics` (`id`, `subject`, `type`, `login`, `open_time`, `close_time`, `created_time`, `updated_time`) VALUES
(2, '每天要花在通勤時間多久?', 2, 1, '2023-05-17 16:19:00', '2023-05-30 16:19:00', '2023-05-15 08:19:27', '2023-05-26 00:22:37'),
(5, '期望薪水多少?', 1, 0, '2023-05-19 14:25:00', '2023-05-30 14:26:00', '2023-05-19 06:23:38', '2023-05-26 00:22:42'),
(6, 'ddddd', 2, 0, '2023-05-18 07:57:00', '2023-05-31 07:57:00', '2023-05-25 23:57:37', '2023-05-26 00:22:24'),
(7, 'eeeee', 1, 0, '2023-05-18 07:57:00', '2023-05-30 07:57:00', '2023-05-26 00:01:28', '2023-05-26 00:22:28'),
(8, 'abcd', 2, 0, '2023-05-10 08:03:00', '2023-05-29 08:03:00', '2023-05-26 00:03:58', '2023-05-26 00:22:30');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `topics`
--
ALTER TABLE `topics`
  ADD PRIMARY KEY (`id`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `members`
--
ALTER TABLE `members`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `options`
--
ALTER TABLE `options`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `topics`
--
ALTER TABLE `topics`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
