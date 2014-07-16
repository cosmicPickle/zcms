-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 16, 2014 at 12:56 PM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `zcms`
--
CREATE DATABASE IF NOT EXISTS `zcms` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `zcms`;

-- --------------------------------------------------------

--
-- Table structure for table `html_slider`
--

CREATE TABLE IF NOT EXISTS `html_slider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `html_slider`
--

INSERT INTO `html_slider` (`id`, `url`, `image`) VALUES
(1, 'http://localhost/development/personal/zcms/v.0.2/index.php/frontend/pages/index/page_test_new', '["0001.jpg"]');

-- --------------------------------------------------------

--
-- Table structure for table `html_slider_lang`
--

CREATE TABLE IF NOT EXISTS `html_slider_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_` int(11) NOT NULL,
  `lang_id` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `html_slider_lang`
--

INSERT INTO `html_slider_lang` (`id`, `id_`, `lang_id`, `title`) VALUES
(1, 1, 'BG', 'Слайд 1');

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE IF NOT EXISTS `product_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`id`, `parent_id`) VALUES
(1, 0),
(2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `product_categories_lang`
--

CREATE TABLE IF NOT EXISTS `product_categories_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_` int(11) NOT NULL,
  `lang_id` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `category` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `product_categories_lang`
--

INSERT INTO `product_categories_lang` (`id`, `id_`, `lang_id`, `category`) VALUES
(1, 1, 'BG', 'Вентилатори'),
(2, 2, 'BG', 'Двигатели');

-- --------------------------------------------------------

--
-- Table structure for table `product_docs`
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
-- Table structure for table `product_docs_lang`
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
-- Table structure for table `product_filters`
--

CREATE TABLE IF NOT EXISTS `product_filters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `active_for` int(11) NOT NULL,
  `type` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=16 ;

--
-- Dumping data for table `product_filters`
--

INSERT INTO `product_filters` (`id`, `name`, `active_for`, `type`) VALUES
(1, 'section', 0, 'select'),
(3, 'fi', 0, 'select'),
(4, 'valve', 0, 'checkbox'),
(5, 'high_temperature', 0, 'checkbox'),
(6, 'use', 1, 'select'),
(7, 'color', 1, 'select'),
(8, 'led', 1, 'select'),
(9, 'timers_and_sensors', 1, 'select'),
(10, 'twostepped', 1, 'checkbox'),
(11, 'other', 1, 'select'),
(12, 'termal_sensor', 2, 'checkbox'),
(13, 'centrifugal', 2, 'checkbox'),
(14, 'type_va', 3, 'checkbox'),
(15, 'type_pvo', 3, 'checkbox');

-- --------------------------------------------------------

--
-- Table structure for table `product_filters_lang`
--

CREATE TABLE IF NOT EXISTS `product_filters_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_` int(11) NOT NULL,
  `lang_id` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=18 ;

--
-- Dumping data for table `product_filters_lang`
--

INSERT INTO `product_filters_lang` (`id`, `id_`, `lang_id`, `label`) VALUES
(1, 1, 'BG', 'Раздел'),
(3, 3, 'EN', 'Ф'),
(4, 3, 'BG', 'Ф'),
(5, 1, 'EN', 'Раздел'),
(6, 4, 'BG', 'Клапа'),
(7, 5, 'BG', 'Високотемпературни'),
(8, 6, 'BG', 'Предназначение'),
(9, 7, 'BG', 'Цвят'),
(10, 8, 'BG', 'LED Осветление'),
(11, 9, 'BG', 'Датчици и таймери'),
(12, 10, 'BG', 'Двустепенни'),
(13, 11, 'BG', 'Други екстри'),
(14, 12, 'BG', 'Термодатчик'),
(15, 13, 'BG', 'Центробежни'),
(16, 14, 'BG', 'Тип ВА'),
(17, 15, 'BG', 'Тип ПВО');

-- --------------------------------------------------------

--
-- Table structure for table `product_filter_values`
--

CREATE TABLE IF NOT EXISTS `product_filter_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filter_id` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `product_filter_values`
--

INSERT INTO `product_filter_values` (`id`, `filter_id`) VALUES
(1, 'section'),
(2, 'section'),
(3, 'section'),
(4, 'section'),
(5, 'fi');

-- --------------------------------------------------------

--
-- Table structure for table `product_filter_values_lang`
--

CREATE TABLE IF NOT EXISTS `product_filter_values_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_` int(11) NOT NULL,
  `lang_id` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `product_filter_values_lang`
--

INSERT INTO `product_filter_values_lang` (`id`, `id_`, `lang_id`, `value`) VALUES
(1, 1, 'BG', 'Битови вентилатори'),
(2, 2, 'BG', 'Канални вентилатори'),
(3, 3, 'BG', 'Аксиални вентилатори'),
(4, 4, 'BG', 'Проточни системи'),
(5, 5, 'BG', '120');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE IF NOT EXISTS `product_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rel_id` int(11) NOT NULL,
  `file` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `main` int(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rel_id` (`rel_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `rel_id`, `file`, `main`) VALUES
(1, 4, '0006.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_images_lang`
--

CREATE TABLE IF NOT EXISTS `product_images_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_` int(11) NOT NULL,
  `lang_id` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `alt` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_` (`id_`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `product_images_lang`
--

INSERT INTO `product_images_lang` (`id`, `id_`, `lang_id`, `title`, `alt`) VALUES
(1, 1, 'BG', 'Тест', 'Тест');

-- --------------------------------------------------------

--
-- Table structure for table `product_products`
--

CREATE TABLE IF NOT EXISTS `product_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` int(11) NOT NULL,
  `filters` text COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `schematic` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `product_products`
--

INSERT INTO `product_products` (`id`, `category`, `filters`, `code`, `schematic`) VALUES
(4, 2, '{"section":"1","fi":"5","valve":"0","high_temperature":"0","use":"","color":"","led":"","timers_and_sensors":"","twostepped":"0","other":"","termal_sensor":"0","centrifugal":"0","type_va":"0","type_pvo":"0"}', '4DJWK', '[]');

-- --------------------------------------------------------

--
-- Table structure for table `product_products_lang`
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `product_products_lang`
--

INSERT INTO `product_products_lang` (`id`, `id_`, `lang_id`, `title`, `short_description`, `description`, `technical_info`) VALUES
(5, 4, 'BG', 'Test product', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `zcms_admins`
--

CREATE TABLE IF NOT EXISTS `zcms_admins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `level` int(2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `zcms_admins`
--

INSERT INTO `zcms_admins` (`id`, `username`, `password`, `email`, `level`) VALUES
(1, 'tedobg', '456f733c9d39fe928b732b858fadd6ff ', 'teodorklissarov@gmail.com', 1),
(2, 'admin', '36e630a4aad2edad9775790eaa92fffa', 'admin@dev.bg', 2);

-- --------------------------------------------------------

--
-- Table structure for table `zcms_frontend_menus`
--

CREATE TABLE IF NOT EXISTS `zcms_frontend_menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `page_id` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `page_id` (`page_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `zcms_frontend_menus`
--

INSERT INTO `zcms_frontend_menus` (`id`, `parent_id`, `page_id`) VALUES
(1, 0, '0'),
(2, 1, 'page_test_new'),
(3, 2, 'page_test_new'),
(4, 2, '0'),
(5, 2, '0'),
(6, 1, '0');

-- --------------------------------------------------------

--
-- Table structure for table `zcms_frontend_menus_lang`
--

CREATE TABLE IF NOT EXISTS `zcms_frontend_menus_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_` int(11) NOT NULL,
  `lang_id` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `zcms_frontend_menus_lang`
--

INSERT INTO `zcms_frontend_menus_lang` (`id`, `id_`, `lang_id`, `label`) VALUES
(1, 1, 'BG', 'Главно меню'),
(2, 2, 'BG', 'Фирмена идентичност'),
(3, 3, 'BG', 'История'),
(4, 4, 'BG', 'Фирмена философия'),
(5, 5, 'BG', 'Структура'),
(6, 6, 'BG', 'Продукти');

-- --------------------------------------------------------

--
-- Table structure for table `zcms_languages`
--

CREATE TABLE IF NOT EXISTS `zcms_languages` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `lang_code` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `zcms_languages`
--

INSERT INTO `zcms_languages` (`id`, `lang_code`) VALUES
(1, 'EN'),
(6, 'BG');

-- --------------------------------------------------------

--
-- Table structure for table `zcms_languages_lang`
--

CREATE TABLE IF NOT EXISTS `zcms_languages_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_` int(11) NOT NULL,
  `lang_id` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `language` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `zcms_languages_lang`
--

INSERT INTO `zcms_languages_lang` (`id`, `id_`, `lang_id`, `language`) VALUES
(1, 1, 'EN', 'English'),
(2, 1, 'BG', 'Английски'),
(6, 6, 'EN', 'Bulgarian'),
(7, 6, 'BG', 'Български');

-- --------------------------------------------------------

--
-- Table structure for table `zcms_lang_cache`
--

CREATE TABLE IF NOT EXISTS `zcms_lang_cache` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lang_id` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `ids` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=38 ;

--
-- Dumping data for table `zcms_lang_cache`
--

INSERT INTO `zcms_lang_cache` (`id`, `link`, `lang_id`, `ids`) VALUES
(1, 'backend/translations/edit/1', 'BG', '["67","68","69","70","71","72","73","8","25","61","62","63","48","5"]'),
(2, 'backend/translations/index', 'BG', '["8","25","61","62","63","13","14","15","16","17","12"]'),
(3, 'backend/translations/index/2/lang_id/asc', 'BG', '["8","25","61","62","63","13","14","15","16","17","12"]'),
(4, 'backend/translations/index/2/lang_id/desc', 'BG', '["8","25","61","62","63","13","14","15","16","17","12"]'),
(5, 'backend/translations/index/1/lang_id/desc', 'BG', '["67","68","69","70","71","74","75","76","77","78","79"]'),
(6, 'backend/translations/edit/67', 'BG', '["67","68","69","70","71","72","73"]'),
(7, 'backend/authenticate/logout', 'EN', NULL),
(8, 'backend/authenticate/login', 'EN', NULL),
(9, 'backend/dashboard', 'EN', '["8","25"]'),
(10, 'backend/pages/edit/1', 'EN', '["8","25","45","54","183","80","101","55","46","47","48","5"]'),
(11, 'backend/pages/index', 'EN', '["8","25","45","46","13","14","15","16","17","12"]'),
(12, 'backend/pages/edit', 'EN', '["8","25","45","80","101","55","46","47","48","5","67","68","81","82","102","83","84","85","72","73"]'),
(13, 'backend/pages/edit/2', 'EN', '["67","68","81","82","83","84","85","72","73"]'),
(14, 'backend/pages/edit/3', 'EN', '["8","25","45","54","183","80","101","55","46","47","48","5"]'),
(15, 'frontend/pages/index/page_test_new2', 'EN', '["165","148"]'),
(16, 'backend', 'FR', '["8","25"]'),
(17, 'backend/pages/edit/4', 'FR', '["8","25","45","54","183","80","101","55","46","47","48","5"]'),
(18, 'backend/backend_menu/edit/12', 'EN', '["8","25","50","57","59","60","58","56","48","5"]'),
(19, 'backend/frontend_menus/index', 'EN', '["8","25","50","51","52","13","17","12"]'),
(20, 'backend/frontend_menus/edit', 'EN', '["8","25","50","53","54","48","5"]'),
(21, 'backend/categories/index', 'EN', '["8","25","13","17","12"]'),
(22, 'backend/categories/edit', 'EN', '["8","25","49","164","166","48"]'),
(23, 'backend/products/edit/1', 'EN', '["8","25","119","49","165","167","168","169","171","170","172","173","174","175","176","177","178","179","180","181","182","122","137","144","45","120","46","121","48"]'),
(24, 'backend/product_images/edit', 'EN', '["67","68"]'),
(25, 'backend/pdimages/edit', 'EN', '["67","68","81",140,"72","73"]'),
(26, 'backend/pdimages/delete/2/1', 'EN', '["81","140","72"]'),
(27, 'backend/products/schematic/delete', 'EN', NULL),
(28, 'backend/pdimages/edit/3', 'EN', '["67","68","81","140","72","73",141,"132","133","134"]'),
(29, 'backend/pdimages/delete/3/1', 'EN', '["81","141","140","72"]'),
(30, 'backend/products/index', 'EN', '["8","25","119","45","120","23","11","13","14","15","16","17","12"]'),
(31, 'backend/pdimages/edit/4', 'EN', '["8","25","45","142","143","48","5","1","2","3"]'),
(32, 'backend/pdimages/edit/5', 'EN', '["67","68","81",146,"141","140","72","73","132","133","134"]'),
(33, 'backend/filters/edit', 'EN', '["8","25","153","147","50","150","151","161","162","163","48"]'),
(34, 'backend/filters/edit/3', 'EN', '["8","25","153","147","50","150","151","161","162","163","48","5"]'),
(35, 'backend/filters/index', 'EN', '["8","25","147","50","23","11","13","14","15","16","17","12"]'),
(36, 'backend/filters/edit/1', 'EN', '["8","25","153","147","50","150","151","161","162","163","48","5"]'),
(37, 'backend/pages', 'BG', '["8","25","45","46","13","14","15","16","17","12"]');

-- --------------------------------------------------------

--
-- Table structure for table `zcms_lang_misc`
--

CREATE TABLE IF NOT EXISTS `zcms_lang_misc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang_id` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `text` text COLLATE utf8_unicode_ci NOT NULL,
  `lang` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=185 ;

--
-- Dumping data for table `zcms_lang_misc`
--

INSERT INTO `zcms_lang_misc` (`id`, `lang_id`, `text`, `lang`) VALUES
(1, 'BG', 'You can upload', 'Можете да качвате'),
(2, 'BG', 'Max file size', 'Максимален размер на файла'),
(3, 'BG', 'Max files', 'Максимален брой файлове'),
(5, 'BG', 'Edit/Insert', 'Редакция/Вмъкване'),
(7, 'BG', 'Are you sure you want to delete this file', 'Сигурни ли сте че искате да изтриете този файл'),
(8, 'BG', 'Z-CMS Administration', 'Z-CMS Администрация'),
(9, 'BG', 'Developers'' and Administrators'' favourite tool', 'Идеална за разработчици и администратори'),
(11, 'BG', 'Delete', 'Изтрий'),
(12, 'BG', 'Actions', 'Действия'),
(13, 'BG', 'Listing', 'Листинг'),
(14, 'BG', 'Prev', 'Предишен'),
(15, 'BG', 'Next', 'Следващ'),
(16, 'BG', 'Search', 'Търсене'),
(17, 'BG', 'Add New', 'Добави'),
(19, 'BG', 'Basic', 'Основни'),
(20, 'BG', 'Advanced', 'Разширени'),
(21, 'BG', 'Data', 'Дата'),
(22, 'BG', 'Module Navigation', 'Модулна навигация'),
(23, 'BG', 'Edit', 'Редакция'),
(24, 'BG', 'Modules', 'Модули'),
(25, 'BG', 'Back', 'Обратно'),
(26, 'BG', 'Developer menu', 'Меню Разработчик'),
(27, 'BG', 'Column options', 'Опции колона'),
(28, 'BG', 'Add column', 'Добави Колона'),
(30, 'BG', 'Edit columns', 'Редактирай колона'),
(31, 'BG', 'Action options', 'Настройки действия'),
(32, 'BG', 'Global action', 'Глобално действие'),
(33, 'BG', 'Add action', 'Добави действие'),
(34, 'BG', 'Remove action', 'Премахни действие'),
(35, 'BG', 'Edit actions', 'Редактирай действие'),
(36, 'BG', 'Pagination and search', 'Странициране и търсене'),
(37, 'BG', 'Pagination options', 'Опции странициране'),
(38, 'BG', 'Search options', 'Настройки за търсене'),
(39, 'BG', 'Column Id', 'Колона'),
(40, 'BG', 'Column Label', 'Колона - Етикет'),
(41, 'BG', 'Close', 'Затвори'),
(42, 'BG', 'Refresh page', 'Презареди страницата'),
(43, 'BG', 'Add', 'Добави'),
(44, 'BG', 'Remove', 'Премахни'),
(45, 'BG', 'Title', 'Заглавие'),
(46, 'BG', 'Description', 'Описание'),
(47, 'BG', 'Content', 'Съдържание'),
(48, 'BG', 'Save', 'Запази'),
(49, 'BG', 'Category', 'Категория'),
(50, 'BG', 'Label', 'Етикет'),
(51, 'BG', 'Menu', 'Меню'),
(52, 'BG', 'Item', 'Предмет'),
(53, 'BG', 'New menu', 'Ново меню'),
(54, 'BG', 'None', 'Няма'),
(55, 'BG', 'Keywords', 'Ключови думи'),
(56, 'BG', 'Order', 'Ред'),
(57, 'BG', 'Controller', 'Контролер'),
(58, 'BG', 'Access', 'Достъп'),
(59, 'BG', 'Method', 'Метод'),
(60, 'BG', 'Tail', 'Опашка'),
(61, 'BG', 'Language code', 'Езиков код'),
(62, 'BG', 'Text', 'Текст'),
(63, 'BG', 'Translation', 'Превод'),
(64, 'BG', 'Username', 'Потребител'),
(65, 'BG', 'Email', 'Имейл'),
(66, 'BG', 'Language', 'Език'),
(67, 'EN', 'Z-CMS Administration', ''),
(68, 'EN', 'Back', NULL),
(69, 'EN', 'Language code', NULL),
(70, 'EN', 'Text', NULL),
(71, 'EN', 'Translation', NULL),
(72, 'EN', 'Save', NULL),
(73, 'EN', 'Edit/Insert', NULL),
(74, 'EN', 'Listing', NULL),
(75, 'EN', 'Prev', NULL),
(76, 'EN', 'Next', NULL),
(77, 'EN', 'Search', NULL),
(78, 'EN', 'Add New', NULL),
(79, 'EN', 'Actions', NULL),
(80, 'BG', 'Page Id', 'Страница - ID'),
(81, 'EN', 'Title', NULL),
(82, 'EN', 'Page Id', NULL),
(83, 'EN', 'Keywords', NULL),
(84, 'EN', 'Description', NULL),
(85, 'EN', 'Content', NULL),
(101, 'BG', 'Template', 'Шаблон'),
(102, 'EN', 'Template', NULL),
(103, 'EN', 'Label', NULL),
(104, 'EN', 'Controller', NULL),
(105, 'EN', 'Method', NULL),
(106, 'EN', 'Tail', NULL),
(107, 'EN', 'access', NULL),
(108, 'EN', 'Order', NULL),
(109, 'БГ', 'Z-CMS Administration', NULL),
(110, 'БГ', 'Back', NULL),
(111, 'БГ', 'Label', NULL),
(112, 'БГ', 'Controller', NULL),
(113, 'БГ', 'Method', NULL),
(114, 'БГ', 'Tail', NULL),
(115, 'БГ', 'access', NULL),
(116, 'БГ', 'Order', NULL),
(117, 'БГ', 'Save', NULL),
(118, 'БГ', 'Edit/Insert', NULL),
(119, 'BG', 'Code', 'Код'),
(120, 'BG', 'Short Description', 'Кратко Описание'),
(121, 'BG', 'Technical Info', 'Техническа информация'),
(122, 'BG', 'Images', 'Картинки'),
(123, 'EN', 'Menu', NULL),
(124, 'EN', 'Item', NULL),
(125, 'EN', 'New menu', NULL),
(126, 'EN', 'None', NULL),
(127, 'EN', 'Category', NULL),
(128, 'EN', 'Code', NULL),
(129, 'EN', 'Images', NULL),
(130, 'EN', 'Short Description', NULL),
(131, 'EN', 'Technical Info', NULL),
(132, 'EN', 'You can upload', NULL),
(133, 'EN', 'Max file size', NULL),
(134, 'EN', 'Max files', NULL),
(135, 'EN', 'Edit', NULL),
(136, 'EN', 'Delete', NULL),
(137, 'BG', 'Documents', 'Документи'),
(138, 'EN', 'Documents', NULL),
(139, 'EN', 'Schematic', NULL),
(140, 'EN', 'Alt', NULL),
(141, 'EN', 'Image', NULL),
(142, 'BG', 'Image', ''),
(143, 'BG', 'Alt', 'Алт'),
(144, 'BG', 'Schematic', 'Схема'),
(145, 'BG', 'Main', 'Главно'),
(146, 'EN', 'Main', NULL),
(147, 'BG', 'Name', 'Име'),
(148, 'BG', 'Filter', 'Филтер'),
(149, 'BG', 'Value', 'Стойност'),
(150, 'BG', 'Active for', 'Активен за'),
(151, 'BG', 'All', 'Всички'),
(153, 'BG', 'This is a system field. It cannot be changed.', 'Това е системно поле. Не може да бъде променено.'),
(154, 'EN', 'This is a system field. It cannot be changed.', NULL),
(155, 'EN', 'Name', NULL),
(156, 'EN', 'Active for', NULL),
(157, 'EN', 'All', NULL),
(158, 'EN', 'Select', NULL),
(159, 'EN', 'Checkbox', NULL),
(160, 'EN', 'Type', NULL),
(161, 'BG', 'Type', 'Тип'),
(162, 'BG', 'Select', 'Падащо меню'),
(163, 'BG', 'Checkbox', 'Отметка'),
(164, 'BG', 'Parent Id', 'Родител'),
(165, 'BG', 'Choose', 'Избери'),
(166, 'BG', 'Top', 'Начало'),
(167, 'BG', 'Section', 'Секция'),
(168, 'BG', 'Ф', 'Ф'),
(169, 'BG', 'Valve', 'Клапа'),
(170, 'BG', 'Yes', 'Да'),
(171, 'BG', 'No', 'Не'),
(172, 'BG', 'High Temperature', 'Високотемпературни'),
(173, 'BG', 'Use', 'Предназначение'),
(174, 'BG', 'Color', 'Цвят'),
(175, 'BG', 'LED Light', 'LED осветление'),
(176, 'BG', 'Timers and sensors', 'Датчици и таймери'),
(177, 'BG', 'Two Steped', 'Двустепенен'),
(178, 'BG', 'Other', 'Други'),
(179, 'BG', 'Termal sensor', 'Термосензор'),
(180, 'BG', 'Centrifugal', 'Центробежни'),
(181, 'BG', 'Type VA', 'Тип ВА'),
(182, 'BG', 'Type PVO', 'Тип ПВО'),
(183, 'BG', 'Main menu', NULL),
(184, 'BG', 'URL', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `zcms_logs`
--

CREATE TABLE IF NOT EXISTS `zcms_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=19 ;

--
-- Dumping data for table `zcms_logs`
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
(18, 'INVALID_DEV_ACTION', 2);

-- --------------------------------------------------------

--
-- Table structure for table `zcms_logs_lang`
--

CREATE TABLE IF NOT EXISTS `zcms_logs_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_` int(11) NOT NULL,
  `lang_id` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `text` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_` (`id_`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=20 ;

--
-- Dumping data for table `zcms_logs_lang`
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
(19, 18, 'EN', 'There is no valid developer action corresponding to your query.');

-- --------------------------------------------------------

--
-- Table structure for table `zcms_menu`
--

CREATE TABLE IF NOT EXISTS `zcms_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `controller` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `method` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `order` int(10) NOT NULL,
  `access` int(2) NOT NULL DEFAULT '2',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=16 ;

--
-- Dumping data for table `zcms_menu`
--

INSERT INTO `zcms_menu` (`id`, `controller`, `method`, `tail`, `order`, `access`) VALUES
(3, 'authenticate', 'logout', NULL, 999, 2),
(4, 'pages', '', '', 0, 2),
(6, 'backend_menu', 'index', '', 997, 1),
(7, 'admin', 'index', '', 998, 1),
(8, 'frontend_menus', 'index', '', 5, 2),
(9, 'categories', 'index', '', 1, 2),
(10, 'languages', 'index', '', 995, 1),
(11, 'translations', 'index', '', 996, 1),
(12, 'products', 'index', '', 2, 2),
(13, 'filters', 'index', '', 3, 2),
(14, 'filter_values', '', '', 4, 2),
(15, 'slider', 'index', '', 6, 2);

-- --------------------------------------------------------

--
-- Table structure for table `zcms_menu_lang`
--

CREATE TABLE IF NOT EXISTS `zcms_menu_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_` int(11) NOT NULL,
  `lang_id` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_` (`id_`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=25 ;

--
-- Dumping data for table `zcms_menu_lang`
--

INSERT INTO `zcms_menu_lang` (`id`, `id_`, `lang_id`, `label`) VALUES
(3, 3, 'BG', 'Изход'),
(5, 9, 'BG', 'Kатегории'),
(6, 3, 'EN', 'Logout'),
(7, 4, 'EN', 'Pages'),
(8, 6, 'EN', 'Backend Menu'),
(9, 7, 'EN', 'Admins'),
(10, 8, 'EN', 'Frontend Menus'),
(11, 9, 'EN', 'Product Categories'),
(12, 10, 'EN', 'Languages'),
(13, 11, 'EN', 'Translations'),
(14, 4, 'BG', 'Страници'),
(15, 8, 'BG', 'Менюта'),
(16, 10, 'BG', 'Езици'),
(17, 11, 'BG', 'Преводи'),
(18, 6, 'BG', 'Системно меню'),
(19, 7, 'BG', 'Админисратори'),
(20, 12, 'BG', 'Продукти'),
(21, 12, 'EN', 'Products'),
(22, 13, 'BG', 'Филтри'),
(23, 14, 'BG', 'Филтри Стойности'),
(24, 15, 'BG', 'Слайдър');

-- --------------------------------------------------------

--
-- Table structure for table `zcms_pages`
--

CREATE TABLE IF NOT EXISTS `zcms_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `template` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `main_menu` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `page_id` (`page_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `zcms_pages`
--

INSERT INTO `zcms_pages` (`id`, `page_id`, `template`, `main_menu`) VALUES
(1, 'page_test_new', '', 1),
(3, 'page_test_new2', '', 1),
(4, 'zcms_404', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `zcms_pages_lang`
--

CREATE TABLE IF NOT EXISTS `zcms_pages_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `keywords` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `html` text COLLATE utf8_unicode_ci NOT NULL,
  `id_` int(11) NOT NULL,
  `lang_id` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `zcms_pages_lang`
--

INSERT INTO `zcms_pages_lang` (`id`, `title`, `keywords`, `description`, `html`, `id_`, `lang_id`) VALUES
(1, 'Test page', 'keyword, test, etc', 'Description', '<p>{products/product_listing:1}</p>', 1, 'BG'),
(4, 'Test page 2', 'keyword, test, etc2', 'Description2', '<p><em><strong> HTML !@@@@</strong></em></p>', 3, 'EN'),
(5, 'Тестова страница', 'тест,клщчови, думи', 'Описание 2', '<p>{html/html_slider:1}</p>\r\n<p>{products/product_listing}</p>\r\n<p>{products/product_filter}</p>\r\n<p>{products/product_view}</p>\r\n<p>&nbsp;</p>', 3, 'BG'),
(7, '404 Page not found', '', '', '<p>Unfortunately your page was not found.</p>', 4, 'BG');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `zcms_logs_lang`
--
ALTER TABLE `zcms_logs_lang`
  ADD CONSTRAINT `zcms_logs_lang_ibfk_1` FOREIGN KEY (`id_`) REFERENCES `zcms_logs` (`id`);

--
-- Constraints for table `zcms_menu_lang`
--
ALTER TABLE `zcms_menu_lang`
  ADD CONSTRAINT `zcms_menu_lang_ibfk_1` FOREIGN KEY (`id_`) REFERENCES `zcms_menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
