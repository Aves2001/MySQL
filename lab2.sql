-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Мар 25 2022 г., 12:41
-- Версия сервера: 5.7.33-log
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `aobu`
--
CREATE DATABASE IF NOT EXISTS `aobu` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `aobu`;

-- --------------------------------------------------------

--
-- Структура таблицы `associations_client_book_title`
--

CREATE TABLE `associations_client_book_title` (
  `id_user` int(11) NOT NULL,
  `client_book_title` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `book_title` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `authors`
--

CREATE TABLE `authors` (
  `id_author` int(11) NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(65) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `info_update_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `books`
--

CREATE TABLE `books` (
  `id_book` int(11) NOT NULL,
  `book_title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brief_content` text COLLATE utf8mb4_unicode_ci,
  `is_audio` tinyint(1) NOT NULL DEFAULT '0',
  `link` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `info_update_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `books_authors`
--

CREATE TABLE `books_authors` (
  `id_book` int(11) NOT NULL,
  `id_author` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `books_genres`
--

CREATE TABLE `books_genres` (
  `id_book` int(11) NOT NULL,
  `id_genre` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `books_readers`
--

CREATE TABLE `books_readers` (
  `id_book` int(11) NOT NULL,
  `id_reader` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `characteristics`
--

CREATE TABLE `characteristics` (
  `id_book` int(11) NOT NULL,
  `price` int(10) UNSIGNED DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `written` tinyint(1) DEFAULT NULL,
  `number_pages` mediumint(8) UNSIGNED DEFAULT NULL,
  `length` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `cycle`
--

CREATE TABLE `cycle` (
  `id_cycle` int(11) NOT NULL,
  `id_book` int(11) NOT NULL,
  `cycle_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `feedback`
--

CREATE TABLE `feedback` (
  `id_feedback` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `user_message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `complaint` tinyint(1) NOT NULL DEFAULT '0',
  `offer` tinyint(1) NOT NULL DEFAULT '0',
  `receipt_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `readers`
--

CREATE TABLE `readers` (
  `id_reader` int(11) NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `info_update_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `sites`
--

CREATE TABLE `sites` (
  `id_site` int(11) NOT NULL,
  `name` varchar(65) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(65) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(65) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `sites_genres`
--

CREATE TABLE `sites_genres` (
  `id_genre` int(11) NOT NULL,
  `id_site` int(11) NOT NULL,
  `genre` varchar(65) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `access` enum('User','Admin') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'User',
  `last_login_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `user_books`
--

CREATE TABLE `user_books` (
  `id_user` int(11) NOT NULL,
  `book_title` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `found` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `associations_client_book_title`
--
ALTER TABLE `associations_client_book_title`
  ADD KEY `id_user` (`id_user`);

--
-- Индексы таблицы `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`id_author`);

--
-- Индексы таблицы `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id_book`);

--
-- Индексы таблицы `books_authors`
--
ALTER TABLE `books_authors`
  ADD KEY `id_book` (`id_book`),
  ADD KEY `id_author` (`id_author`);

--
-- Индексы таблицы `books_genres`
--
ALTER TABLE `books_genres`
  ADD KEY `id_book` (`id_book`),
  ADD KEY `id_genre` (`id_genre`);

--
-- Индексы таблицы `books_readers`
--
ALTER TABLE `books_readers`
  ADD KEY `id_book` (`id_book`),
  ADD KEY `id_reader` (`id_reader`);

--
-- Индексы таблицы `characteristics`
--
ALTER TABLE `characteristics`
  ADD PRIMARY KEY (`id_book`);

--
-- Индексы таблицы `cycle`
--
ALTER TABLE `cycle`
  ADD PRIMARY KEY (`id_cycle`),
  ADD KEY `id_book` (`id_book`);

--
-- Индексы таблицы `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id_feedback`),
  ADD KEY `id_user` (`id_user`);

--
-- Индексы таблицы `readers`
--
ALTER TABLE `readers`
  ADD PRIMARY KEY (`id_reader`);

--
-- Индексы таблицы `sites`
--
ALTER TABLE `sites`
  ADD PRIMARY KEY (`id_site`);

--
-- Индексы таблицы `sites_genres`
--
ALTER TABLE `sites_genres`
  ADD PRIMARY KEY (`id_genre`),
  ADD KEY `id_site` (`id_site`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- Индексы таблицы `user_books`
--
ALTER TABLE `user_books`
  ADD KEY `id_user` (`id_user`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `authors`
--
ALTER TABLE `authors`
  MODIFY `id_author` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `books`
--
ALTER TABLE `books`
  MODIFY `id_book` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `cycle`
--
ALTER TABLE `cycle`
  MODIFY `id_cycle` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id_feedback` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `readers`
--
ALTER TABLE `readers`
  MODIFY `id_reader` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `sites`
--
ALTER TABLE `sites`
  MODIFY `id_site` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `sites_genres`
--
ALTER TABLE `sites_genres`
  MODIFY `id_genre` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `associations_client_book_title`
--
ALTER TABLE `associations_client_book_title`
  ADD CONSTRAINT `associations_client_book_title_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `books_authors`
--
ALTER TABLE `books_authors`
  ADD CONSTRAINT `books_authors_ibfk_1` FOREIGN KEY (`id_book`) REFERENCES `books` (`id_book`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `books_authors_ibfk_2` FOREIGN KEY (`id_author`) REFERENCES `authors` (`id_author`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `books_genres`
--
ALTER TABLE `books_genres`
  ADD CONSTRAINT `books_genres_ibfk_1` FOREIGN KEY (`id_book`) REFERENCES `books` (`id_book`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `books_genres_ibfk_2` FOREIGN KEY (`id_genre`) REFERENCES `sites_genres` (`id_genre`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `books_readers`
--
ALTER TABLE `books_readers`
  ADD CONSTRAINT `books_readers_ibfk_1` FOREIGN KEY (`id_book`) REFERENCES `books` (`id_book`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `books_readers_ibfk_2` FOREIGN KEY (`id_reader`) REFERENCES `readers` (`id_reader`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `characteristics`
--
ALTER TABLE `characteristics`
  ADD CONSTRAINT `characteristics_ibfk_1` FOREIGN KEY (`id_book`) REFERENCES `books` (`id_book`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `cycle`
--
ALTER TABLE `cycle`
  ADD CONSTRAINT `cycle_ibfk_1` FOREIGN KEY (`id_book`) REFERENCES `books` (`id_book`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `sites_genres`
--
ALTER TABLE `sites_genres`
  ADD CONSTRAINT `sites_genres_ibfk_1` FOREIGN KEY (`id_site`) REFERENCES `sites` (`id_site`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `user_books`
--
ALTER TABLE `user_books`
  ADD CONSTRAINT `user_books_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
