-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июн 06 2025 г., 13:59
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
-- База данных: `jamoa`
--

-- --------------------------------------------------------

--
-- Структура таблицы `mahsulotlar`
--

CREATE TABLE `mahsulotlar` (
  `id` int(11) NOT NULL,
  `mahsulot_nomi` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unical_id` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `mahsulotlar`
--

INSERT INTO `mahsulotlar` (`id`, `mahsulot_nomi`, `unical_id`) VALUES
(1, 'Raxmatilla Gaybullayev', 'loyiha ustozi va muallifi'),
(2, 'Mironshox Qosimov', 'loyiha o\'quvchisi'),
(3, 'Ezoz Narziyev', 'loyiha o\'quvchisi'),
(4, 'Jaxongir Azimov', 'loyiha o\'quvchisi'),
(17, 'Jaloliddin Choriyev', 'dasturchi'),
(18, 'Asilbek Obidov', 'dasturchi');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `mahsulotlar`
--
ALTER TABLE `mahsulotlar`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `mahsulotlar`
--
ALTER TABLE `mahsulotlar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
