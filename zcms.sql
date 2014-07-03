-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 03, 2014 at 11:28 AM
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
-- Table structure for table `product_categories`
--

CREATE TABLE IF NOT EXISTS `product_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `parent_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`id`, `category`, `parent_id`) VALUES
(1, 'Entry 1', 0),
(2, 'Entry 1.1', 1),
(3, 'Entry 2', 0),
(4, 'Entry 1.2', 1),
(5, 'Entry 1.1.1', 2),
(6, 'Entry 1.2.1', 4),
(7, 'Entry 1.2.2', 4);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `product_categories_lang`
--

INSERT INTO `product_categories_lang` (`id`, `id_`, `lang_id`, `category`) VALUES
(1, 1, 'BG', 'Категория 1');

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
  `page_id` int(11) NOT NULL,
  `label` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `zcms_frontend_menus`
--

INSERT INTO `zcms_frontend_menus` (`id`, `parent_id`, `page_id`, `label`) VALUES
(1, 0, 0, 'Main menu'),
(2, 1, 0, 'Ventilation'),
(3, 1, 0, 'Engines');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `zcms_frontend_menus_lang`
--

INSERT INTO `zcms_frontend_menus_lang` (`id`, `id_`, `lang_id`, `label`) VALUES
(1, 3, 'BG', 'Двигатели');

-- --------------------------------------------------------

--
-- Table structure for table `zcms_languages`
--

CREATE TABLE IF NOT EXISTS `zcms_languages` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `lang_id` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `language` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `zcms_languages`
--

INSERT INTO `zcms_languages` (`id`, `lang_id`, `language`) VALUES
(1, 'EN', 'English'),
(2, 'BG', 'Bulgarian');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=28 ;

--
-- Dumping data for table `zcms_lang_cache`
--

INSERT INTO `zcms_lang_cache` (`id`, `link`, `lang_id`, `ids`) VALUES
(1, 'backend/pages/edit/1', 'BG', '["8","25",45,46,47,48,"5"]'),
(2, 'backend/categories/index', 'BG', '["8","25","13","17","12"]'),
(3, 'backend/categories/edit/1', 'BG', '["8","25",49,"48","5"]'),
(4, 'backend/frontend_menus/index', 'BG', '["8","25",50,51,52,"13","17","12"]'),
(5, 'backend/frontend_menus/edit/1', 'BG', '["8","25","50",53,54,"48","5"]'),
(6, 'backend/pages/index', 'BG', '["8","25","45","46","13","14","15","16","17","12"]'),
(7, 'backend/pages/edit/2', 'BG', '["8","25","45",55,"46","47","48","5"]'),
(8, 'backend/backend_menu/index', 'BG', '["8","25",56,"50",57,58,"13","14","15","16","17","12"]'),
(9, 'backend/backend_menu/edit/9', 'BG', '["8","25","50","57",59,60,"58","56","48","5"]'),
(10, 'backend/frontend_menus/edit', 'BG', '["8","25","50","53","54","48","5"]'),
(11, 'backend/frontend_menus/edit/3', 'BG', '["8","25","50","53","54","48","5"]'),
(12, 'backend/translations/edit/45', 'BG', '["8","25",61,62,63,"48","5"]'),
(13, 'backend/translations/index/2/text/asc', 'BG', '["8","25","61","62","63","13","14","15","16","17","12"]'),
(14, 'backend/translations/edit/63', 'BG', '["8","25","61","62","63","48","5"]'),
(15, 'backend/translations/edit/62', 'BG', '["8","25","61","62","63","48","5"]'),
(16, 'backend/translations/edit/48', 'BG', '["8","25","61","62","63","48","5"]'),
(17, 'backend/translations/edit/60', 'BG', '["8","25","61","62","63","48","5"]'),
(18, 'backend/translations/edit/38', 'BG', '["8","25","61","62","63","48","5"]'),
(19, 'backend/translations/edit/29', 'BG', '["8","25","61","62","63","48","5"]'),
(20, 'backend/translations/edit/44', 'BG', '["8","25","61","62","63","48","5"]'),
(21, 'backend/translations/delete/29', 'BG', '["61","62","63","48"]'),
(22, 'backend/translations', 'BG', '["8","25","61","62","63","13","14","15","16","17","12"]'),
(23, 'backend/translations/index/2/lang_id/asc', 'BG', '["8","25","61","62","63","13","14","15","16","17","12"]'),
(24, 'backend/translations/index/1/lang_id/asc', 'BG', '["8","25","61","62","63","13","14","15","16","17","12"]'),
(25, 'backend/translations/index/1/lang/asc', 'BG', '["8","25","61","62","63","13","14","15","16","17","12"]'),
(26, 'backend/translations/delete/18', 'BG', '["61","62","63","48"]'),
(27, 'backend/translations/edit/19', 'BG', '["8","25","61","62","63","48","5"]');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=64 ;

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
(19, 'BG', 'Basic', NULL),
(20, 'BG', 'Advanced', NULL),
(21, 'BG', 'Data', NULL),
(22, 'BG', 'Module Navigation', NULL),
(23, 'BG', 'Edit', 'Редакция'),
(24, 'BG', 'Modules', NULL),
(25, 'BG', 'Back', NULL),
(26, 'BG', 'Developer menu', NULL),
(27, 'BG', 'Column options', NULL),
(28, 'BG', 'Add column', NULL),
(30, 'BG', 'Edit columns', NULL),
(31, 'BG', 'Action options', NULL),
(32, 'BG', 'Global action', NULL),
(33, 'BG', 'Add action', NULL),
(34, 'BG', 'Remove action', 'Премахни действие'),
(35, 'BG', 'Edit actions', NULL),
(36, 'BG', 'Pagination and search', NULL),
(37, 'BG', 'Pagination options', NULL),
(38, 'BG', 'Search options', 'Настройки за търсене'),
(39, 'BG', 'Column Id', NULL),
(40, 'BG', 'Column Label', NULL),
(41, 'BG', 'Close', NULL),
(42, 'BG', 'Refresh page', NULL),
(43, 'BG', 'Add', NULL),
(44, 'BG', 'Remove', 'Премахни'),
(45, 'BG', 'Title', 'Заглавие'),
(46, 'BG', 'Description', NULL),
(47, 'BG', 'Content', 'Съдържание'),
(48, 'BG', 'Save', 'Запази'),
(49, 'BG', 'Category', NULL),
(50, 'BG', 'Label', NULL),
(51, 'BG', 'Menu', NULL),
(52, 'BG', 'Item', NULL),
(53, 'BG', 'New menu', NULL),
(54, 'BG', 'None', NULL),
(55, 'BG', 'Keywords', NULL),
(56, 'BG', 'Order', NULL),
(57, 'BG', 'Controller', NULL),
(58, 'BG', 'Access', NULL),
(59, 'BG', 'Method', NULL),
(60, 'BG', 'Tail', 'Опашка'),
(61, 'BG', 'Language code', NULL),
(62, 'BG', 'Text', 'Текст'),
(63, 'BG', 'Translation', 'Превод');

-- --------------------------------------------------------

--
-- Table structure for table `zcms_logs`
--

CREATE TABLE IF NOT EXISTS `zcms_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(1) NOT NULL,
  `text` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=19 ;

--
-- Dumping data for table `zcms_logs`
--

INSERT INTO `zcms_logs` (`id`, `name`, `type`, `text`) VALUES
(1, 'INP_REQUIRED', 2, 'The field %s is required.'),
(2, 'INVALID_LOGIN', 2, 'You have entered invalid username and/or password.'),
(3, 'UPLOAD_ERROR', 2, 'There has been an error uploading your file. Please try again later.'),
(4, 'UPLOAD_SIZE', 2, 'One ore more of the files you are uploading exceeds the size limit.'),
(5, 'UPLOAD_TYPE', 2, 'One or more of the files you are uploading is not of the supported types.'),
(6, 'UPLOAD_COUNT', 2, 'You have exceeded the maximum number of files to upload.'),
(7, 'INP_ALPHANUM', 2, 'The field %s must be alphanumeric'),
(8, 'INP_WORD', 2, 'The field %s must contain only letters, numbers and underscope.'),
(9, 'INP_EMAIL', 2, 'The field %s must be a valid e-mail.'),
(10, 'INP_MINSIZE', 2, 'The field %s must be at least %d symbols long.'),
(11, 'INP_MAXSIZE', 2, 'The field %s must be at most %s symbols long.'),
(12, 'INP_MATCH', 2, 'The field %s must match %s.'),
(13, 'INP_UNIQUE', 2, 'The field %s must be unique in table %s.'),
(14, 'MODIFY_SUCCESS', 4, 'The changes have been saved.'),
(15, 'NO_LISTING', 3, 'No listing has been detected on the system for the selected table.'),
(16, 'NO_FORM', 3, 'No form has been rendered for this table.'),
(17, 'NO_LIST_COLUMNS', 3, 'No columns were selected for listing.'),
(18, 'INVALID_DEV_ACTION', 2, 'There is no valid developer action corresponding to your query.');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `zcms_logs_lang`
--

INSERT INTO `zcms_logs_lang` (`id`, `id_`, `lang_id`, `text`) VALUES
(1, 1, 'BG', 'Полето %s е задължително.');

-- --------------------------------------------------------

--
-- Table structure for table `zcms_menu`
--

CREATE TABLE IF NOT EXISTS `zcms_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `controller` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `method` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `order` int(10) NOT NULL,
  `access` int(2) NOT NULL DEFAULT '2',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=12 ;

--
-- Dumping data for table `zcms_menu`
--

INSERT INTO `zcms_menu` (`id`, `label`, `controller`, `method`, `tail`, `order`, `access`) VALUES
(3, 'Logout', 'authenticate', 'logout', NULL, 999, 2),
(4, 'Pages', 'pages', NULL, NULL, 0, 2),
(6, 'Backend Menu', 'backend_menu', 'index', '', 997, 1),
(7, 'Admins', 'admin', 'index', '', 998, 1),
(8, 'Frontend Menus', 'frontend_menus', 'index', '', 2, 2),
(9, 'Product Categories', 'categories', 'index', '', 1, 2),
(10, 'Languages', 'languages', 'index', '', 995, 1),
(11, 'Translations', 'translations', 'index', '', 996, 1);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `zcms_menu_lang`
--

INSERT INTO `zcms_menu_lang` (`id`, `id_`, `lang_id`, `label`) VALUES
(3, 3, 'BG', 'Изход'),
(4, 4, 'BG', 'Страници'),
(5, 9, 'BG', 'Продуктови категории');

-- --------------------------------------------------------

--
-- Table structure for table `zcms_pages`
--

CREATE TABLE IF NOT EXISTS `zcms_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `html` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `zcms_pages`
--

INSERT INTO `zcms_pages` (`id`, `page_id`, `title`, `keywords`, `description`, `html`) VALUES
(2, 'page_1', 'Page Test 1', 'keyword1, keyword2', 'dasdasdasdas', '<p>gdfsgvs hdf gdfg fd gfzd gdf ghdfh zfd hd hd hz</p>'),
(3, 'page_test_new', 'Page Test New', 'page,test,new', 'Page test new', '<p>Page, test new.</p>');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

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
