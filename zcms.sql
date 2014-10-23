-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Време на генериране: 
-- Версия на сървъра: 5.6.12-log
-- Версия на PHP: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- БД: `zcms_v04`
--
CREATE DATABASE IF NOT EXISTS `zcms_v04` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `zcms_v04`;

-- --------------------------------------------------------

--
-- Структура на таблица `content_articles`
--

CREATE TABLE IF NOT EXISTS `content_articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alias` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `category` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `author` int(11) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Схема на данните от таблица `content_articles`
--

INSERT INTO `content_articles` (`id`, `alias`, `category`, `author`, `date`) VALUES
(1, '404_page_not_found', 'uncategorised', 1, '2014-10-22'),
(2, 'simple_news', 'news', 2, '2014-10-23'),
(3, 'simple_news_2', 'news', 1, '2014-10-22'),
(4, 'simple_news_3', 'news', 1, '2014-10-22'),
(5, 'simple_news_4', 'news', 1, '2014-10-22'),
(6, 'lorem_ipsum', 'uncategorised', 1, '2014-10-24');

-- --------------------------------------------------------

--
-- Структура на таблица `content_articles_lang`
--

CREATE TABLE IF NOT EXISTS `content_articles_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_` int(11) NOT NULL,
  `lang_id` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `keywords` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Схема на данните от таблица `content_articles_lang`
--

INSERT INTO `content_articles_lang` (`id`, `id_`, `lang_id`, `title`, `keywords`, `description`, `content`) VALUES
(1, 1, 'EN', '404 Page not Found', '404, not found', '404 page not found', '<p>Ooooops! The page you are looking for has gone missing.</p>'),
(2, 2, 'EN', 'Simple News', 'Simple, news, keywords', 'Simple News Description', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ut, tenetur natus doloremque laborum quos iste ipsum rerum obcaecati impedit odit illo dolorum ab tempora nihil dicta earum fugiat. Temporibus, voluptatibus.</p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eos, doloribus, dolorem iusto blanditiis unde eius illum consequuntur neque dicta incidunt ullam ea hic porro optio ratione repellat perspiciatis. Enim, iure!</p>'),
(3, 3, 'EN', 'Simple News 2', 'simple, news', 'Simple news 2', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ut, tenetur natus doloremque laborum quos iste ipsum rerum obcaecati impedit odit illo dolorum ab tempora nihil dicta earum fugiat. Temporibus, voluptatibus.</p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eos, doloribus, dolorem iusto blanditiis unde eius illum consequuntur neque dicta incidunt ullam ea hic porro optio ratione repellat perspiciatis. Enim, iure!</p>'),
(4, 4, 'EN', 'Simple News 3', 'simple, news', 'Simple news 3', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ut, tenetur natus doloremque laborum quos iste ipsum rerum obcaecati impedit odit illo dolorum ab tempora nihil dicta earum fugiat. Temporibus, voluptatibus.</p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eos, doloribus, dolorem iusto blanditiis unde eius illum consequuntur neque dicta incidunt ullam ea hic porro optio ratione repellat perspiciatis. Enim, iure!</p>'),
(5, 5, 'EN', 'Simple News 4', 'simple, news', 'Simple news 4', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ut, tenetur natus doloremque laborum quos iste ipsum rerum obcaecati impedit odit illo dolorum ab tempora nihil dicta earum fugiat. Temporibus, voluptatibus.</p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eos, doloribus, dolorem iusto blanditiis unde eius illum consequuntur neque dicta incidunt ullam ea hic porro optio ratione repellat perspiciatis. Enim, iure!</p>'),
(6, 6, 'EN', 'Lorem Ipsum', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras commodo lacus vitae ipsum mattis, in gravida sem luctus. In bibendum, eros at condimentum mattis, nibh nibh vulputate est, eu facilisis tortor ligula lacinia erat. Nunc ullamcorper orci eget quam consequat, sit amet varius orci rhoncus. Cras sit amet orci pellentesque, pulvinar odio a, semper eros. Aliquam sem magna, pellentesque quis semper ut, efficitur in libero. Nulla purus leo, pulvinar et molestie et, pretium et mauris. Aenean nec nunc dictum, feugiat neque vel, tincidunt ligula. Donec ut ante felis. Etiam vel purus eros.</p>\r\n<p>&nbsp;</p>\r\n<p>Aenean a aliquam libero. Morbi at lorem magna. Morbi elementum elementum risus sed interdum. Curabitur ultricies lorem non lacinia pellentesque. Quisque ut convallis diam. Donec facilisis sodales maximus. Nulla ut laoreet nisl. In consequat, tortor vitae tristique porttitor, lorem leo ultrices ex, ac placerat nibh nunc et mi. Ut vel metus et lacus tincidunt tincidunt pellentesque ut urna. Quisque vulputate libero id imperdiet tincidunt. Proin ultrices libero eget lectus volutpat, et placerat nisl pellentesque. Sed vel lacinia libero. Nulla nisi ex, pharetra at felis vitae, tincidunt sagittis nulla. Suspendisse potenti. Aliquam facilisis iaculis sem, non blandit velit luctus ac.</p>');

-- --------------------------------------------------------

--
-- Структура на таблица `content_categories`
--

CREATE TABLE IF NOT EXISTS `content_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alias` varchar(128) NOT NULL,
  `parent` int(11) NOT NULL,
  `order` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Схема на данните от таблица `content_categories`
--

INSERT INTO `content_categories` (`id`, `alias`, `parent`, `order`) VALUES
(1, 'news', 0, 1),
(2, 'uncategorised', 0, 0);

-- --------------------------------------------------------

--
-- Структура на таблица `content_categories_lang`
--

CREATE TABLE IF NOT EXISTS `content_categories_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_` int(11) NOT NULL,
  `lang_id` varchar(5) NOT NULL,
  `label` varchar(256) NOT NULL,
  `keywords` varchar(256) NOT NULL,
  `description` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Схема на данните от таблица `content_categories_lang`
--

INSERT INTO `content_categories_lang` (`id`, `id_`, `lang_id`, `label`, `keywords`, `description`) VALUES
(1, 1, 'EN', 'News', '', ''),
(2, 2, 'EN', 'Uncategorised', 'Uncategorised, articles', 'Uncategorised articles');

-- --------------------------------------------------------

--
-- Структура на таблица `menus_frontend_menus`
--

CREATE TABLE IF NOT EXISTS `menus_frontend_menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `page_id` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `params` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `order` int(11) NOT NULL,
  `alias` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `page_id` (`page_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Схема на данните от таблица `menus_frontend_menus`
--

INSERT INTO `menus_frontend_menus` (`id`, `parent_id`, `page_id`, `params`, `order`, `alias`) VALUES
(1, 0, '0', '', 0, 'main'),
(2, 1, 'default_category_article_page', 'category/news', 0, ''),
(3, 1, 'zcms_404', '', 1, ''),
(4, 3, 'one_column_layout', 'article/lorem_ipsum', 0, ''),
(5, 3, 'zcms_404', '', 1, ''),
(6, 3, 'zcms_404', '', 2, '');

-- --------------------------------------------------------

--
-- Структура на таблица `menus_frontend_menus_lang`
--

CREATE TABLE IF NOT EXISTS `menus_frontend_menus_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_` int(11) NOT NULL,
  `lang_id` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Схема на данните от таблица `menus_frontend_menus_lang`
--

INSERT INTO `menus_frontend_menus_lang` (`id`, `id_`, `lang_id`, `label`) VALUES
(1, 1, 'EN', 'Main menu'),
(2, 2, 'EN', 'Home'),
(3, 3, 'EN', 'Layout Tests'),
(4, 4, 'EN', 'One column layout'),
(5, 5, 'EN', 'Two column layout'),
(6, 6, 'EN', 'Three column layout');

-- --------------------------------------------------------

--
-- Структура на таблица `product_categories`
--

CREATE TABLE IF NOT EXISTS `product_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alias` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура на таблица `product_categories_lang`
--

CREATE TABLE IF NOT EXISTS `product_categories_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_` int(11) NOT NULL,
  `lang_id` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура на таблица `product_docs`
--

CREATE TABLE IF NOT EXISTS `product_docs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rel_id` int(11) NOT NULL,
  `file` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rel_id` (`rel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура на таблица `product_docs_lang`
--

CREATE TABLE IF NOT EXISTS `product_docs_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_` int(11) NOT NULL,
  `lang_id` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_` (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура на таблица `product_images`
--

CREATE TABLE IF NOT EXISTS `product_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rel_id` int(11) NOT NULL,
  `file` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `main` int(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rel_id` (`rel_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=28 ;

-- --------------------------------------------------------

--
-- Структура на таблица `product_images_lang`
--

CREATE TABLE IF NOT EXISTS `product_images_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_` int(11) NOT NULL,
  `lang_id` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `alt` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_` (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура на таблица `product_products`
--

CREATE TABLE IF NOT EXISTS `product_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL,
  `filters` text COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `top_offer` tinyint(1) NOT NULL,
  `categories` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Схема на данните от таблица `product_products`
--

INSERT INTO `product_products` (`id`, `type`, `filters`, `code`, `top_offer`, `categories`) VALUES
(1, 0, '', '1233', 1, '');

-- --------------------------------------------------------

--
-- Структура на таблица `product_products_lang`
--

CREATE TABLE IF NOT EXISTS `product_products_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_` int(11) NOT NULL,
  `lang_id` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `short_description` text COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `technical_info` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_` (`id_`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Схема на данните от таблица `product_products_lang`
--

INSERT INTO `product_products_lang` (`id`, `id_`, `lang_id`, `title`, `short_description`, `description`, `technical_info`) VALUES
(1, 1, 'EN', 'title', '', '', '');

-- --------------------------------------------------------

--
-- Структура на таблица `zcms_admins`
--

CREATE TABLE IF NOT EXISTS `zcms_admins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `level` int(2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Схема на данните от таблица `zcms_admins`
--

INSERT INTO `zcms_admins` (`id`, `username`, `password`, `email`, `image`, `level`) VALUES
(1, 'tedobg', '456f733c9d39fe928b732b858fadd6ff ', 'teodorklissarov@gmail.com', '["10628058_760530170676435_4429408701370286876_n.jpg"]', 1),
(2, 'admin', '36e630a4aad2edad9775790eaa92fffa', 'admin@dev.bg', '', 2);

-- --------------------------------------------------------

--
-- Структура на таблица `zcms_admins_lang`
--

CREATE TABLE IF NOT EXISTS `zcms_admins_lang` (
  `id` int(11) NOT NULL,
  `id_` int(11) NOT NULL,
  `lang_id` varchar(5) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Схема на данните от таблица `zcms_admins_lang`
--

INSERT INTO `zcms_admins_lang` (`id`, `id_`, `lang_id`, `name`) VALUES
(0, 2, 'EN', 'Admin'),
(0, 1, 'EN', 'Teodor Klissarov');

-- --------------------------------------------------------

--
-- Структура на таблица `zcms_languages`
--

CREATE TABLE IF NOT EXISTS `zcms_languages` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `lang_code` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Схема на данните от таблица `zcms_languages`
--

INSERT INTO `zcms_languages` (`id`, `lang_code`) VALUES
(1, 'EN');

-- --------------------------------------------------------

--
-- Структура на таблица `zcms_languages_lang`
--

CREATE TABLE IF NOT EXISTS `zcms_languages_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_` int(11) NOT NULL,
  `lang_id` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `language` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Схема на данните от таблица `zcms_languages_lang`
--

INSERT INTO `zcms_languages_lang` (`id`, `id_`, `lang_id`, `language`) VALUES
(1, 1, 'EN', 'English'),
(2, 1, 'BG', 'Английски');

-- --------------------------------------------------------

--
-- Структура на таблица `zcms_lang_cache`
--

CREATE TABLE IF NOT EXISTS `zcms_lang_cache` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lang_id` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `ids` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура на таблица `zcms_lang_misc`
--

CREATE TABLE IF NOT EXISTS `zcms_lang_misc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang_id` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `text` text COLLATE utf8_unicode_ci NOT NULL,
  `lang` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=84 ;

--
-- Схема на данните от таблица `zcms_lang_misc`
--

INSERT INTO `zcms_lang_misc` (`id`, `lang_id`, `text`, `lang`) VALUES
(1, 'EN', 'Z-CMS Administration', NULL),
(2, 'EN', 'Languages', NULL),
(3, 'EN', 'Back', NULL),
(4, 'EN', 'Order', NULL),
(5, 'EN', 'Label', NULL),
(6, 'EN', 'Controller', NULL),
(7, 'EN', 'Access', NULL),
(8, 'EN', 'Listing', NULL),
(9, 'EN', 'Prev', NULL),
(10, 'EN', 'Next', NULL),
(11, 'EN', 'Search', NULL),
(12, 'EN', 'Add New', NULL),
(13, 'EN', 'Actions', NULL),
(14, 'EN', 'Title', NULL),
(15, 'EN', 'Description', NULL),
(16, 'EN', 'None', NULL),
(17, 'EN', 'Main menu', NULL),
(18, 'EN', 'Page Id', NULL),
(19, 'EN', 'Template', NULL),
(20, 'EN', 'Default page template', NULL),
(21, 'EN', 'Static page template', NULL),
(22, 'EN', 'Front page template', NULL),
(23, 'EN', 'Category page template', NULL),
(24, 'EN', 'Product page template', NULL),
(25, 'EN', 'Keywords', NULL),
(26, 'EN', 'Images', NULL),
(27, 'EN', 'Content', NULL),
(28, 'EN', 'Save', NULL),
(29, 'EN', 'Edit/Insert', NULL),
(30, 'EN', 'You can upload', NULL),
(31, 'EN', 'Max file size', NULL),
(32, 'EN', 'Max files', NULL),
(33, 'EN', 'Layout', NULL),
(34, 'EN', 'Code', NULL),
(35, 'EN', 'Edit', NULL),
(36, 'EN', 'Delete', NULL),
(37, 'EN', 'Copy', NULL),
(38, 'EN', 'Menu', NULL),
(39, 'EN', 'Item', NULL),
(40, 'EN', 'Method', NULL),
(41, 'EN', 'Tail', NULL),
(42, 'EN', 'Change Language', NULL),
(43, 'EN', 'Username', NULL),
(44, 'EN', 'Email', NULL),
(45, 'EN', 'Password', NULL),
(46, 'EN', 'Image', NULL),
(47, 'EN', 'Collection', NULL),
(48, 'EN', 'Choose', NULL),
(49, 'EN', 'Solutions', NULL),
(50, 'EN', 'Deals', NULL),
(51, 'EN', 'Documents', NULL),
(52, 'EN', 'Main', NULL),
(53, 'EN', 'Alt', NULL),
(54, 'EN', 'Parent', NULL),
(55, 'EN', 'Top', NULL),
(56, 'EN', 'Icon', NULL),
(57, 'EN', 'sign in now', NULL),
(58, 'EN', 'sign in now', NULL),
(59, 'EN', 'Language', NULL),
(60, 'EN', 'Language Code', NULL),
(61, 'EN', 'Text', NULL),
(62, 'EN', 'Translation', NULL),
(63, 'EN', 'Parent Id', NULL),
(64, 'EN', 'New menu', NULL),
(65, 'EN', 'Page', NULL),
(66, 'EN', 'Params', NULL),
(67, 'EN', 'Category', NULL),
(68, 'EN', 'Type', NULL),
(69, 'EN', 'Alias', NULL),
(70, 'EN', 'Author', NULL),
(71, 'EN', 'Name', NULL),
(72, 'EN', 'Date', NULL),
(73, 'EN', 'See More', NULL),
(74, 'EN', 'Modules', NULL),
(75, 'EN', 'Showing ', NULL),
(76, 'EN', 'of ', NULL),
(77, 'EN', 'First', NULL),
(78, 'EN', 'Last', NULL),
(79, 'EN', 'Toggle navigation', NULL),
(80, 'EN', 'Site logo', NULL),
(81, 'EN', ' by ', NULL),
(82, 'EN', 'Posted on ', NULL),
(83, 'EN', ' in ', NULL);

-- --------------------------------------------------------

--
-- Структура на таблица `zcms_logs`
--

CREATE TABLE IF NOT EXISTS `zcms_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=21 ;

--
-- Схема на данните от таблица `zcms_logs`
--

INSERT INTO `zcms_logs` (`id`, `name`, `type`) VALUES
(1, 'INP_REQUIRED', 2),
(2, 'INVALID_LOGIN', 2),
(3, 'UPLOAD_ERROR', 2),
(4, 'UPLOAD_SIZE', 2),
(5, 'UPLOAD_TYPE', 2),
(6, 'UPLOAD_COUNT', 2),
(7, 'INP_ALPHANUM', 2),
(8, 'INP_WORD', 2),
(9, 'INP_EMAIL', 2),
(10, 'INP_MINSIZE', 2),
(11, 'INP_MAXSIZE', 2),
(12, 'INP_MATCH', 2),
(13, 'INP_UNIQUE', 2),
(14, 'MODIFY_SUCCESS', 4),
(15, 'NO_LISTING', 3),
(16, 'NO_FORM', 3),
(17, 'NO_LIST_COLUMNS', 3),
(18, 'INVALID_DEV_ACTION', 2),
(19, 'MAIL_SUCCESS', 4),
(20, 'MAIL_ERROR', 2);

-- --------------------------------------------------------

--
-- Структура на таблица `zcms_logs_lang`
--

CREATE TABLE IF NOT EXISTS `zcms_logs_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_` int(11) NOT NULL,
  `lang_id` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `text` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_` (`id_`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=39 ;

--
-- Схема на данните от таблица `zcms_logs_lang`
--

INSERT INTO `zcms_logs_lang` (`id`, `id_`, `lang_id`, `text`) VALUES
(1, 1, 'BG', 'Полето %s е задължително.'),
(2, 1, 'EN', 'The field %s is required.'),
(3, 2, 'EN', 'You have entered invalid username and/or password.'),
(4, 3, 'EN', 'There has been an error uploading your file. Please try again later.'),
(5, 4, 'EN', 'One ore more of the files you are uploading exceeds the size limit.'),
(6, 5, 'EN', 'One or more of the files you are uploading is not of the supported types.'),
(7, 6, 'EN', 'You have exceeded the maximum number of files to upload.'),
(8, 7, 'EN', 'The field %s must be alphanumeric'),
(9, 8, 'EN', 'The field %s must contain only letters, numbers and underscope.'),
(10, 9, 'EN', 'The field %s must be a valid e-mail.'),
(11, 10, 'EN', 'The field %s must be at least %d symbols long.'),
(12, 11, 'EN', 'The field %s must be at most %s symbols long.'),
(13, 12, 'EN', 'The field %s must match %s.'),
(14, 13, 'EN', 'The field %s must be unique in table %s.'),
(15, 14, 'EN', 'The changes have been saved.'),
(16, 15, 'EN', 'No listing has been detected on the system for the selected table.'),
(17, 16, 'EN', 'No form has been rendered for this table.'),
(18, 17, 'EN', 'No columns were selected for listing.'),
(19, 18, 'EN', 'There is no valid developer action corresponding to your query.'),
(20, 19, 'BG', 'Имейла беше изпратен успешно.'),
(21, 20, 'BG', 'Възникна грешка при изпращане на имейла. Моля опитайте пак по късно.'),
(22, 2, 'BG', 'Възвели сте невалиден потребител/парола.'),
(23, 3, 'BG', 'Имаше грешка при качване на файловете. Моля опитайте отново по късно.'),
(24, 4, 'BG', 'Един или повече от файловете прехвърлят позволения размер.'),
(25, 5, 'BG', 'Един или повече от файловете не са в поддържан формат.'),
(26, 6, 'BG', 'You have exceeded the maximum number of files to upload.'),
(27, 7, 'BG', 'Полето %s трябва да съдържа само букви и цифри.'),
(28, 8, 'BG', 'Полето %s трябва да съдъжа само букви, цифри и долна черта.'),
(29, 9, 'BG', 'Полето %s трябва да e валиден имейл.'),
(30, 10, 'BG', 'Полето %s трябва да е поне %d символа.'),
(31, 11, 'BG', 'Полето %s трябва да най много %s символа.'),
(32, 12, 'BG', 'Полето %s трябва да съвпада с полето %s.'),
(33, 13, 'BG', 'Избраната стойност за полето %s е заета.'),
(34, 14, 'BG', 'Промените са запазени.'),
(35, 15, 'BG', 'Няма засечени настройки за листинг за избраната таблица. Моля свържете се с разработчик.'),
(36, 16, 'BG', 'Не е създадена форма за избраната таблиза. Моля свържете се с разработчик.'),
(37, 17, 'BG', 'Няма колони за избрания листинг.Моля свържете се с разработчик.'),
(38, 18, 'BG', 'Няма валидно действие, което да отговаря на вашето запитване. Моля свържете се с разработчик.');

-- --------------------------------------------------------

--
-- Структура на таблица `zcms_menu`
--

CREATE TABLE IF NOT EXISTS `zcms_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `controller` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `method` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `order` int(10) NOT NULL,
  `access` int(2) NOT NULL DEFAULT '2',
  `parent` int(11) NOT NULL,
  `icon` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=26 ;

--
-- Схема на данните от таблица `zcms_menu`
--

INSERT INTO `zcms_menu` (`id`, `controller`, `method`, `tail`, `order`, `access`, `parent`, `icon`) VALUES
(3, 'authenticate', 'logout', '', 999, 2, 0, 'fa-lock'),
(4, 'content', 'pages_list', '', 0, 2, 18, ''),
(6, 'menus', 'backend_menu_list', '', 0, 1, 19, ''),
(7, 'admin', 'index', '', 998, 1, 0, 'fa-user'),
(8, 'menus', 'frontend_menu_list', '', 1, 1, 19, ''),
(10, 'localisation', 'languages_list', '', 995, 1, 21, ''),
(11, 'localisation', 'translations_list', '', 996, 1, 21, ''),
(12, 'catalog', 'product_list', '', 1, 2, 20, ''),
(18, '', '', '', 0, 2, 0, 'fa-list-alt'),
(19, '', '', '', 2, 2, 0, 'fa-link'),
(20, '', '', '', 1, 2, 0, ' fa-cubes'),
(21, '', '', '', 3, 2, 0, ' fa-flag'),
(22, 'content', 'category_list', '', 1, 2, 18, ''),
(23, 'content', 'articles_list', '', 2, 2, 18, ''),
(24, 'catalog', 'category_list', '', 0, 2, 20, ''),
(25, 'content', 'news_list', '', 3, 2, 18, '');

-- --------------------------------------------------------

--
-- Структура на таблица `zcms_menu_lang`
--

CREATE TABLE IF NOT EXISTS `zcms_menu_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_` int(11) NOT NULL,
  `lang_id` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_` (`id_`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=39 ;

--
-- Схема на данните от таблица `zcms_menu_lang`
--

INSERT INTO `zcms_menu_lang` (`id`, `id_`, `lang_id`, `label`) VALUES
(6, 3, 'EN', 'Logout'),
(7, 4, 'EN', 'Pages'),
(8, 6, 'EN', 'Backend Menu'),
(9, 7, 'EN', 'Admins'),
(10, 8, 'EN', 'Frontend Menus'),
(12, 10, 'EN', 'Languages'),
(13, 11, 'EN', 'Translations'),
(21, 12, 'EN', 'Products'),
(31, 18, 'EN', 'Content'),
(32, 19, 'EN', 'Menus'),
(33, 20, 'EN', 'Catalog'),
(34, 21, 'EN', 'Localisation'),
(35, 22, 'EN', 'Categories'),
(36, 23, 'EN', 'Articles'),
(37, 24, 'EN', 'Categories'),
(38, 25, 'EN', 'News');

-- --------------------------------------------------------

--
-- Структура на таблица `zcms_pages`
--

CREATE TABLE IF NOT EXISTS `zcms_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `template` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `html` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `modules` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `page_id` (`page_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=17 ;

--
-- Схема на данните от таблица `zcms_pages`
--

INSERT INTO `zcms_pages` (`id`, `page_id`, `template`, `html`, `modules`) VALUES
(1, 'zcms_404', 'pages', 'single_column_layout', '<p>{menus/menus_recursive:top_menu,menus_recursive?menu=main}@top<br />{content/content_article:single_article,single_article?show_date=0&amp;show_author=0&amp;show_category=0}@pos_1_1</p>'),
(15, 'home', 'pages', 'home_page_layout', '<p>{menus/menus_recursive:top_menu,menus_recursive?menu=main}@top</p>'),
(16, 'one_column_layout', 'pages', 'single_column_layout', '<p>{menus/menus_recursive:top_menu,menus_recursive?menu=main}@top<br />{content/content_article:single_article,single_article}@pos_1_1</p>');

-- --------------------------------------------------------

--
-- Структура на таблица `zcms_pages_lang`
--

CREATE TABLE IF NOT EXISTS `zcms_pages_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `keywords` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_` int(11) NOT NULL,
  `lang_id` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=17 ;

--
-- Схема на данните от таблица `zcms_pages_lang`
--

INSERT INTO `zcms_pages_lang` (`id`, `title`, `keywords`, `description`, `id_`, `lang_id`) VALUES
(1, '404 Page not found', '', '', 1, 'EN'),
(15, 'Home page', '', '', 15, 'EN'),
(16, 'One Column Layout', '', '', 16, 'EN');

--
-- Ограничения за дъмпнати таблици
--

--
-- Ограничения за таблица `zcms_logs_lang`
--
ALTER TABLE `zcms_logs_lang`
  ADD CONSTRAINT `zcms_logs_lang_ibfk_1` FOREIGN KEY (`id_`) REFERENCES `zcms_logs` (`id`);

--
-- Ограничения за таблица `zcms_menu_lang`
--
ALTER TABLE `zcms_menu_lang`
  ADD CONSTRAINT `zcms_menu_lang_ibfk_1` FOREIGN KEY (`id_`) REFERENCES `zcms_menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
