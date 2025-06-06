-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июн 06 2025 г., 14:00
-- Версия сервера: 10.3.13-MariaDB-log
-- Версия PHP: 7.1.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `products_db`
--

-- --------------------------------------------------------

--
-- Структура таблицы `mahsulotlar`
--

CREATE TABLE `mahsulotlar` (
  `id` int(11) NOT NULL,
  `mahsulot_nomi` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unical_id` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `mahsulotlar`
--

INSERT INTO `mahsulotlar` (`id`, `mahsulot_nomi`, `unical_id`) VALUES
(1, 'banan', '1001'),
(2, 'Oq kartoshka', '1002'),
(3, 'karam', '1003'),
(4, 'bodring', '1004'),
(5, 'Qizil sabzi', '1005'),
(6, 'Sariq sabzi', '1006'),
(7, 'Qora kartoshka', '1007'),
(8, 'avacado', '1008'),
(9, 'Qizil pomidor', '1009'),
(10, 'Pushti pomidor', '1010'),
(11, 'qovoq', '1011'),
(12, 'baqlajon', '1012'),
(13, 'olma', '1013'),
(14, 'nok', '1014'),
(15, 'uzum', '1015'),
(16, 'oq piyoz', '1016'),
(17, 'sariq piyoz', '1017'),
(18, 'qizil piyoz', '1018');

-- --------------------------------------------------------

--
-- Структура таблицы `narx`
--

CREATE TABLE `narx` (
  `id` int(11) NOT NULL,
  `mahsulot_id` int(11) NOT NULL,
  `narx` decimal(10,2) NOT NULL,
  `reg_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `narx`
--

INSERT INTO `narx` (`id`, `mahsulot_id`, `narx`, `reg_date`) VALUES
(1, 1006, '6000.00', '2025-05-31 10:00:00'),
(2, 1007, '2000.00', '2025-05-31 10:05:00'),
(3, 1009, '30000.00', '2025-05-31 10:10:00'),
(4, 1004, '5000.00', '2025-05-31 10:15:00'),
(5, 1017, '5000.00', '2025-05-31 10:15:00'),
(6, 1002, '6500.00', '2025-05-31 10:20:00');

-- --------------------------------------------------------

--
-- Структура таблицы `omborxona`
--

CREATE TABLE `omborxona` (
  `id` int(11) NOT NULL,
  `mahsulot` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `massa` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `narx` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sana` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `omborxona`
--

INSERT INTO `omborxona` (`id`, `mahsulot`, `massa`, `narx`, `sana`) VALUES
(15, '1017', '12', '6500', '2025-02-24 08:38:19'),
(19, '1018', '10', '10000', '2025-02-26 05:30:22'),
(22, '1005', '80', '2500', '2025-02-26 05:32:01'),
(23, '1006', '100', '5800', '2025-02-26 05:32:34'),
(24, '1007', '100', '9000', '2025-02-26 05:32:54'),
(25, '1012', '20', '8000', '2025-02-26 06:00:11'),
(26, '1013', '20', '10000', '2025-02-26 06:44:31'),
(28, '1012', '100', '2500', '2025-04-04 13:10:04'),
(29, '1014', '15', '2800', '2025-04-04 13:10:49');

-- --------------------------------------------------------

--
-- Структура таблицы `sale`
--

CREATE TABLE `sale` (
  `id` int(11) NOT NULL,
  `mahsulot` varchar(20) DEFAULT NULL,
  `massa` varchar(20) DEFAULT NULL,
  `sana` timestamp NOT NULL DEFAULT current_timestamp(),
  `sessiya_id` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `sale`
--

INSERT INTO `sale` (`id`, `mahsulot`, `massa`, `sana`, `sessiya_id`) VALUES
(22, '1004', '233.08', '2025-05-31 04:37:57', '1000'),
(23, '1004', '232.65', '2025-05-31 04:38:12', '1000'),
(25, '1004', '226.56', '2025-05-31 05:08:06', '1000'),
(26, '1009', '223.20', '2025-05-31 05:10:34', '1000'),
(27, '1009', '225.34', '2025-05-31 05:19:01', '1000');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `mahsulotlar`
--
ALTER TABLE `mahsulotlar`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `narx`
--
ALTER TABLE `narx`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `omborxona`
--
ALTER TABLE `omborxona`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `sale`
--
ALTER TABLE `sale`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `mahsulotlar`
--
ALTER TABLE `mahsulotlar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT для таблицы `narx`
--
ALTER TABLE `narx`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `omborxona`
--
ALTER TABLE `omborxona`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT для таблицы `sale`
--
ALTER TABLE `sale`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
