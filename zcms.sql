-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 13, 2014 at 12:12 PM
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
CREATE DATABASE IF NOT EXISTS `zcms` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `zcms`;

-- --------------------------------------------------------

--
-- Table structure for table `mod_test_adv`
--

CREATE TABLE IF NOT EXISTS `mod_test_adv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page` int(11) NOT NULL DEFAULT '0',
  `param1` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `param2` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `mod_test_adv`
--

INSERT INTO `mod_test_adv` (`id`, `page`, `param1`, `param2`) VALUES
(2, 0, 'test133sss', 'test2'),
(3, 1, 'aaaaaaaaa2312', 'bbbbbbbbbbbb');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `zcms_admins`
--

INSERT INTO `zcms_admins` (`id`, `username`, `password`, `email`, `level`) VALUES
(1, 'tedobg', '456f733c9d39fe928b732b858fadd6ff', 'teodorklissarov@gmail.com', 1);

-- --------------------------------------------------------

--
-- Table structure for table `zcms_form_advanced`
--

CREATE TABLE IF NOT EXISTS `zcms_form_advanced` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_` int(11) NOT NULL,
  `disabled_on_insert` int(1) NOT NULL,
  `disabled_on_update` int(1) NOT NULL,
  `validation` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_` (`id_`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `zcms_form_advanced`
--

INSERT INTO `zcms_form_advanced` (`id`, `id_`, `disabled_on_insert`, `disabled_on_update`, `validation`) VALUES
(2, 10, 0, 1, 'required'),
(3, 12, 0, 0, 'required'),
(4, 15, 0, 0, 'required'),
(5, 11, 0, 1, ''),
(6, 22, 0, 1, 'required'),
(7, 23, 0, 1, 'required|word|is_unique');

-- --------------------------------------------------------

--
-- Table structure for table `zcms_form_basic`
--

CREATE TABLE IF NOT EXISTS `zcms_form_basic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `link` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `order` int(2) NOT NULL,
  `css_class` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `css_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `script` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=30 ;

--
-- Dumping data for table `zcms_form_basic`
--

INSERT INTO `zcms_form_basic` (`id`, `link`, `name`, `type`, `label`, `description`, `order`, `css_class`, `css_id`, `script`) VALUES
(10, 'zcms_modules', 'module', 'text', 'Module', 'When creating a module default file with the same name will be created in /libraries/modules/module_name/bundle_name/. The default file will have the same name as the module. This field cannot be changed when edited.', 0, NULL, NULL, NULL),
(11, 'zcms_modules', 'bundle', 'text', 'Bundle', '', 1, NULL, NULL, NULL),
(12, 'zcms_modules', 'label', 'text', 'Label', '', 4, NULL, NULL, NULL),
(13, 'zcms_modules', 'description', 'textarea', 'Description', '', 5, NULL, NULL, NULL),
(14, 'zcms_modules', 'enabled', 'checkbox', 'Enabled', '', 6, NULL, NULL, NULL),
(15, 'zcms_modules', 'access', 'select', 'Access', '', 7, NULL, NULL, NULL),
(16, 'zcms_modules', 'submit', 'submit', 'Save', '', 8, 'btn btn-primary btn-large pull-right', NULL, NULL),
(17, 'zcms_modules', 'advanced', 'select', 'Advanced Settings', '', 3, NULL, NULL, NULL),
(18, 'zcms_modules', 'data_table', 'select', 'Data table', '', 2, NULL, NULL, NULL),
(19, 'mod_test_adv', 'param1', 'text', 'Param1', '', 1, NULL, NULL, NULL),
(20, 'mod_test_adv', 'param2', 'text', 'Param 2', '', 2, NULL, NULL, NULL),
(21, 'mod_test_adv', 'submit', 'submit', 'Save', '', 3, 'btn btn-primary btn-large pull-right', NULL, NULL),
(22, 'zcms_modules', 'author', 'text', 'Author', '', 1, NULL, NULL, NULL),
(23, 'zcms_pages', 'page_id', 'text', 'Page Id', 'This has to be unique value containing alphanumerical characters and underscope. Cannot be changed.', 0, NULL, NULL, NULL),
(24, 'zcms_pages', 'title', 'text', 'Title', NULL, 1, NULL, NULL, NULL),
(25, 'zcms_pages', 'keywords', 'text', 'Keywords', NULL, 2, 'input-xxlarge', NULL, NULL),
(26, 'zcms_pages', 'description', 'text', 'Description', NULL, 3, 'input-xxlarge', NULL, NULL),
(27, 'zcms_pages', 'modules', 'select', 'Modules', NULL, 4, NULL, NULL, NULL),
(28, 'zcms_pages', 'html', 'textarea', 'Page HTML', NULL, 5, NULL, NULL, NULL),
(29, 'zcms_pages', 'submit', 'submit', 'Save', NULL, 6, 'btn btn-primary btn-large pull-right', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `zcms_form_fi`
--

CREATE TABLE IF NOT EXISTS `zcms_form_fi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_` int(11) NOT NULL,
  `path` text COLLATE utf8_unicode_ci NOT NULL,
  `size_limit` int(11) NOT NULL,
  `count_limit` int(5) NOT NULL,
  `ext_limit` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `thumbs` text COLLATE utf8_unicode_ci NOT NULL,
  `crop` int(1) NOT NULL DEFAULT '1',
  `padding` int(1) NOT NULL,
  `padding_color` varchar(7) COLLATE utf8_unicode_ci NOT NULL DEFAULT '#000',
  PRIMARY KEY (`id`),
  KEY `id_` (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `zcms_form_fspec`
--

CREATE TABLE IF NOT EXISTS `zcms_form_fspec` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_` int(11) NOT NULL,
  `opt_val_pairs` text COLLATE utf8_unicode_ci,
  `link_table` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link_opt_column` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link_val_column` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link_query` text COLLATE utf8_unicode_ci,
  `multiple` int(1) NOT NULL DEFAULT '0',
  `checked` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `id_` (`id_`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Dumping data for table `zcms_form_fspec`
--

INSERT INTO `zcms_form_fspec` (`id`, `id_`, `opt_val_pairs`, `link_table`, `link_opt_column`, `link_val_column`, `link_query`, `multiple`, `checked`) VALUES
(6, 15, '{"1":"Developer","2":"Administrator","3":"Moderator"}', NULL, NULL, NULL, NULL, 0, '1'),
(7, 14, NULL, NULL, NULL, NULL, NULL, 0, '1'),
(8, 27, '', 'zcms_modules', 'module', 'label', NULL, 1, '1');

-- --------------------------------------------------------

--
-- Table structure for table `zcms_form_lang`
--

CREATE TABLE IF NOT EXISTS `zcms_form_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_` int(11) NOT NULL,
  `lang_id` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `opt_val_pairs` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `id_` (`id_`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=17 ;

--
-- Dumping data for table `zcms_form_lang`
--

INSERT INTO `zcms_form_lang` (`id`, `id_`, `lang_id`, `label`, `description`, `opt_val_pairs`) VALUES
(8, 10, 'BG', 'Модул', 'При създаване на нов модул ще бъде създаден файл по подразбиране в <b>/libraries/modules/module_name/bundle_name/</b>. Този файл ще има същото име като модула. Това поле не може да бъде променяно при редкация.', NULL),
(9, 11, 'BG', 'Пакет', '', NULL),
(10, 12, 'BG', 'Име', '', NULL),
(11, 13, 'BG', 'Описание', '', NULL),
(12, 14, 'BG', 'Включен', '', NULL),
(13, 15, 'BG', 'Достъп', '', '{"1":"Разработчик","2":"Администратор","3":"Модератор"}'),
(14, 16, 'BG', 'Запази', '', NULL),
(15, 17, 'BG', 'Разширени настройки', '', NULL),
(16, 18, 'BG', 'Дата таблица', '', NULL);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=76 ;

--
-- Dumping data for table `zcms_lang_cache`
--

INSERT INTO `zcms_lang_cache` (`id`, `link`, `lang_id`, `ids`) VALUES
(1, 'backend/dashboard', 'BG', '["1","2","3",5,"8","9",25]'),
(4, 'backend/dashboard/index/13', 'BG', '["8","9","5","1","2","3","7",11,"12"]'),
(5, 'backend/ajax/delete_file', 'BG', NULL),
(6, 'backend/dashboard/index', 'BG', '["8","9"]'),
(7, 'backend/authenticate/login', 'BG', NULL),
(8, 'backend/dashboard/sophnews', 'BG', NULL),
(9, 'backend/dashboard/index/sophnews', 'BG', '["8","9","5","1","2","3"]'),
(10, 'backend/dashboard/index/sophnews/5/title/desc/test1', 'BG', '["8","9","5","1","2","3","7","11"]'),
(11, 'backend/dashboard/index/sophnews/1/title/desc/test1', 'BG', '["8","9","5","1","2","3","7","11"]'),
(12, 'backend/dashboard/index/sophnews/1/title/desc/test1%60', 'BG', '["8","9"]'),
(13, 'backend/dashboard/index/sophnews/1/title/desc/%D1%82%D0%B8%D1%82%D1%83%D0%BB%D0%B5', 'BG', '["8","9"]'),
(14, 'backend/dashboard/index/sophnews/1/title/desc/title', 'BG', '["8","9"]'),
(15, 'backend/dashboard/index/sophnews/1/title/desc', 'BG', '["8","9","5","1","2","3","7","11",12,"13","14","15","16","17"]'),
(16, 'backend/dashboard/index/sophnews/1/title/desc%27', 'BG', '["8","9"]'),
(17, 'backend/dashboard/index/sophnews/1/title%27/desc', 'BG', '["8","9"]'),
(18, 'backend/dashboard/index/sophnews/1%27/title/desc', 'BG', '["8","9"]'),
(19, 'backend/dashboard/index/sophnews/1/title/desc/dashboard/index/13', 'BG', '["8","9"]'),
(20, 'backend/dashboard/index/sophnews/1/title/asc', 'BG', '["8","9","12","13","14","15","16","17",18,"5","1","2","3"]'),
(21, 'backend/dashboard/index/sophnews/2/title/asc', 'BG', '["8","9","13","14","15","16","17","12","5","1","2","3"]'),
(22, 'backend/dashboard/index/sophnews/1/id/asc', 'BG', '["8","9","12","13","14","15","16",17]'),
(23, 'backend/dashboard/index/sophnews/1/id/desc', 'BG', '["8",13,14,15,16,"12","17"]'),
(24, 'backend/dashboard/index/sophnews/1', 'BG', '["8","13","14","15","16","12"]'),
(25, 'backend/dashboard/index/sophnews/1/id/asc/%D1%82%D0%B8%D1%82', 'BG', '["8","13","14","15","16","12"]'),
(26, 'backend/dashboard/index/sophnews/1/title/%D1%82%D0%B8%D1%82', 'BG', '["8"]'),
(27, 'backend/dashboard/index/sophnews/1/title/asc/%D1%82%D0%B8%D1%82', 'BG', '["8","13","14","15","16","12"]'),
(28, 'backend/dashboard/index/sophnews1/2/title/asc', 'BG', '["8","13","14","15","16"]'),
(29, '', 'BG', '["8","5","25"]'),
(30, 'backend/dashboard/index/15', 'BG', '["8"]'),
(31, 'backend/dashboard/index/sophnews/2/title/desc', 'BG', '["8","13","14","15","16","17","12"]'),
(32, 'backend/dashboard/index/sophnews/2/id/asc', 'BG', '["8","13","14","15","16","17","12"]'),
(33, 'backend/dashboard/index/sophnews/2/id/desc', 'BG', '["8","13","14","15","16","17","12"]'),
(34, 'backend/dashboard/index/sophnews/13', 'BG', '["8","5","1","2","3","7","11"]'),
(35, 'backend/dashboard/index/sophnews/16', 'BG', '["8","5","1","2","3"]'),
(36, 'backend/dashboard/index/sophnews/17', 'BG', '["8","5","1","2","3"]'),
(37, 'backend/dashboard/index/sophnews/20', 'BG', '["8","5","1","2","3"]'),
(38, 'backend/modules', 'BG', '["8","13","14","15","16","17","12"]'),
(39, 'backend/modules/modify/1', 'BG', '["8","5"]'),
(40, 'backend/modules/index/zcms_modules/1/module/asc', 'BG', '["8"]'),
(41, 'backend/modules/index', 'BG', '["8","13","14","15","16","17","12","25","26","27","28","29","30","31","32","33","34","35","36","37","38"]'),
(42, 'backend/modules/index/1/id/desc', 'BG', '["8","13","14","15","16","17","12"]'),
(43, 'backend/modules/index/1/module/asc', 'BG', '["8","13","14","15","16","17","12"]'),
(44, 'backend/modules/modify', 'BG', '["8","5"]'),
(45, 'backend/modules/modify/10', 'BG', '["8","5"]'),
(46, 'backend/modules/modify/11', 'BG', '["8","5"]'),
(47, 'backend/modules/basic/1', 'BG', '["8",19,20,21,"5",22]'),
(48, 'backend/modules/advanced/1', 'BG', '["8","22","19","20","21","5"]'),
(49, 'backend/modules/advanced', 'BG', NULL),
(50, 'backend/modules/data/1', 'BG', '["8","22","19","20","21","5","13","14","15","16","17","12"]'),
(51, 'backend/modules/data', 'BG', '["8"]'),
(52, 'backend/authenticate/logout', 'BG', NULL),
(53, 'backend', 'BG', '["8","25"]'),
(54, 'backend/modules/basic', 'BG', '["8","5"]'),
(55, 'backend/modules/advanced/mod_test_adv', 'BG', '["8","22","19","20","21"]'),
(56, 'backend/modules/basic/mod_test_adv', 'BG', '["8","22","19","20","21","5"]'),
(57, 'backend/modules/advanced/1mod_test_adv', 'BG', '["8","22","19","20","21","5"]'),
(58, 'backend/modules/advanced/11', 'BG', '["8","22","19","20","21","5"]'),
(59, 'backend/modules/basic/11', 'BG', '["8","22","19","20","21","5"]'),
(60, 'backend/modules/data/11', 'BG', '["8","22","19","20","21"]'),
(61, 'backend/modules/data/1/page/asc', 'BG', '["8","22","19","20","21"]'),
(62, 'backend/modules/data/1/1/page/asc', 'BG', '["8","22","19","20","21","13","14","15","16","17","12"]'),
(63, 'backend/modules/data/1/1/page/desc', 'BG', '["8","22","19","20","21","13","14","15","16","17","12"]'),
(64, 'backend/modules/data/1/1/id/asc', 'BG', '["8","22","19","20","21","13","14","15","16","17","12"]'),
(65, 'backend/modules/edata/mod_test_adv/2', 'BG', '["22","19","20","21","8"]'),
(66, 'backend/modules/edata/mod_test_adv', 'BG', '["8","22","19","20","21","5"]'),
(67, 'backend/modules/edata/mod_test_adv/3', 'BG', '["8","22","19","20","21","5"]'),
(68, 'backend/modules/data/mod_test_adv', 'BG', '["8","22","19","20","21"]'),
(69, 'backend/modules/edata/1/2', 'BG', '["8","22","19","20","21","5"]'),
(70, 'backend/pages/index', 'BG', '["8","25",26,27,28,29,30,31,32,33,34,35,36,37,38,"13","14","15","16","17","12"]'),
(71, 'backend/pages/modify/1', 'BG', '["8","5",23,"13","14","15","16","17","12","19",24,"25","26","27","28","29","30","31","32","33","34","35","36","37","38"]'),
(72, 'backend/developer/intf/list/zcms_modules/add_column', 'BG', NULL),
(73, 'backend/developer/intf/list/zcms_modules/remove_column', 'BG', NULL),
(74, 'backend/developer/intf/list/zcms_pages/add_column', 'BG', '["28",39,40,41,42,43]'),
(75, 'backend/developer/intf/list/zcms_pages/remove_column', 'BG', '["29","39","41","42",44]');

-- --------------------------------------------------------

--
-- Table structure for table `zcms_lang_misc`
--

CREATE TABLE IF NOT EXISTS `zcms_lang_misc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang_id` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `text` text COLLATE utf8_unicode_ci NOT NULL,
  `lang` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=45 ;

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
(18, 'BG', 'Listing111', NULL),
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
(29, 'BG', 'Remove column', NULL),
(30, 'BG', 'Edit columns', NULL),
(31, 'BG', 'Action options', NULL),
(32, 'BG', 'Global action', NULL),
(33, 'BG', 'Add action', NULL),
(34, 'BG', 'Remove action', 'Премахни действие'),
(35, 'BG', 'Edit actions', NULL),
(36, 'BG', 'Pagination and search', NULL),
(37, 'BG', 'Pagination options', NULL),
(38, 'BG', 'Search options', NULL),
(39, 'BG', 'Column Id', NULL),
(40, 'BG', 'Column Label', NULL),
(41, 'BG', 'Close', NULL),
(42, 'BG', 'Refresh page', NULL),
(43, 'BG', 'Add', NULL),
(44, 'BG', 'Remove', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `zcms_list_labels`
--

CREATE TABLE IF NOT EXISTS `zcms_list_labels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `list_id` int(11) NOT NULL,
  `type` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `cond` text COLLATE utf8_unicode_ci NOT NULL,
  `text` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `list_id` (`list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `zcms_list_labels_lang`
--

CREATE TABLE IF NOT EXISTS `zcms_list_labels_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_` int(11) NOT NULL,
  `lang_id` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `text` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_` (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `zcms_list_settings`
--

CREATE TABLE IF NOT EXISTS `zcms_list_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `link` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `columns` text COLLATE utf8_unicode_ci NOT NULL,
  `ord_by` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `rpp` int(3) NOT NULL,
  `search_fields` text COLLATE utf8_unicode_ci NOT NULL,
  `actions` text COLLATE utf8_unicode_ci NOT NULL,
  `global_action` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `zcms_list_settings`
--

INSERT INTO `zcms_list_settings` (`id`, `link`, `columns`, `ord_by`, `rpp`, `search_fields`, `actions`, `global_action`) VALUES
(2, 'zcms_modules', '{"id":"#","module":"Id","label":"Label","access":"Access"}', 'id', 15, '["label"]', '[{"link":"modules/basic/{@id}","lbl":"Edit"}]', 'modules/basic/'),
(3, 'mod_test_adv', '{"id":"#","page":"Page","param1":"Param 1"}', 'id', 10, '["page"]', '[{"link":"modules/edata/{#module_id}/{@id}","lbl":"Edit"}]', 'modules/edata/{#module_id}'),
(4, 'zcms_pages', '{"id":"#","page_id":"Id","title":"Title"}', 'id', 10, '["title","keywords","description","html","page_id"]', '[{"link":"pages/modify/{@id}","lbl":"Edit"}]', 'pages/modify/');

-- --------------------------------------------------------

--
-- Table structure for table `zcms_list_settings_lang`
--

CREATE TABLE IF NOT EXISTS `zcms_list_settings_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_` int(11) NOT NULL,
  `lang_id` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `columns` text COLLATE utf8_unicode_ci NOT NULL,
  `actions` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_` (`id_`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `zcms_list_settings_lang`
--

INSERT INTO `zcms_list_settings_lang` (`id`, `id_`, `lang_id`, `columns`, `actions`) VALUES
(1, 2, 'BG', '{"id":"#","module":"Id","label": "Име"}', '[{"link":"modules/basic/{@id}","lbl":"Редакция"}]'),
(2, 4, 'BG', '{"id":"#","page_id":"Id","title":"\\u0417\\u0430\\u0433\\u043b\\u0430\\u0432\\u0438\\u0435"}', '[{"link":"pages/modify/{@id}","lbl":"Редактирай"}]');

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
  `lang_id` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `zcms_menu`
--

INSERT INTO `zcms_menu` (`id`, `label`, `controller`, `method`, `tail`, `order`, `access`) VALUES
(1, 'Modules', 'modules', NULL, NULL, 1, 1),
(3, 'Logout', 'authenticate', 'logout', NULL, 999, 2),
(4, 'Pages', 'pages', NULL, NULL, 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `zcms_menu_lang`
--

CREATE TABLE IF NOT EXISTS `zcms_menu_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_` int(11) NOT NULL,
  `lang_id` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_` (`id_`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `zcms_menu_lang`
--

INSERT INTO `zcms_menu_lang` (`id`, `id_`, `lang_id`, `label`) VALUES
(1, 1, 'BG', 'Модули'),
(3, 3, 'BG', 'Изход'),
(4, 4, 'BG', 'Страници');

-- --------------------------------------------------------

--
-- Table structure for table `zcms_modules`
--

CREATE TABLE IF NOT EXISTS `zcms_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `bundle` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `author` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `advanced` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `data_table` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `enabled` int(1) NOT NULL DEFAULT '1',
  `access` int(2) NOT NULL DEFAULT '2',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=14 ;

--
-- Dumping data for table `zcms_modules`
--

INSERT INTO `zcms_modules` (`id`, `module`, `bundle`, `author`, `advanced`, `data_table`, `label`, `description`, `enabled`, `access`) VALUES
(13, 'comments', 'blog', 'Teodor Klissarov', 'mod_test_adv', 'mod_test_adv', 'Comments', '<p>This module will handle comments in the website.</p>', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `zcms_modules_lang`
--

CREATE TABLE IF NOT EXISTS `zcms_modules_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_` int(11) NOT NULL,
  `lang_id` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_` (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

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
  `modules` text COLLATE utf8_unicode_ci,
  `html` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `zcms_pages`
--

INSERT INTO `zcms_pages` (`id`, `page_id`, `title`, `keywords`, `description`, `modules`, `html`) VALUES
(1, 'page_test', 'Page Test', 'page,test', 'This is a page test description', '["","comments"]', ''),
(2, 'page_1', 'Page Test 1', 'keyword1, keyword2', 'dasdasdasdas', '["","comments"]', '<p>gdfsgvs hdf gdfg fd gfzd gdf ghdfh zfd hd hd hz</p>'),
(3, 'page_test_new', 'Page Test New', 'page,test,new', 'Page test new', '[""]', '<p>Page, test new.</p>');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `zcms_form_advanced`
--
ALTER TABLE `zcms_form_advanced`
  ADD CONSTRAINT `zcms_form_advanced_ibfk_1` FOREIGN KEY (`id_`) REFERENCES `zcms_form_basic` (`id`);

--
-- Constraints for table `zcms_form_fi`
--
ALTER TABLE `zcms_form_fi`
  ADD CONSTRAINT `zcms_form_fi_ibfk_1` FOREIGN KEY (`id_`) REFERENCES `zcms_form_basic` (`id`);

--
-- Constraints for table `zcms_form_fspec`
--
ALTER TABLE `zcms_form_fspec`
  ADD CONSTRAINT `zcms_form_fspec_ibfk_1` FOREIGN KEY (`id_`) REFERENCES `zcms_form_basic` (`id`);

--
-- Constraints for table `zcms_form_lang`
--
ALTER TABLE `zcms_form_lang`
  ADD CONSTRAINT `zcms_form_lang_ibfk_1` FOREIGN KEY (`id_`) REFERENCES `zcms_form_basic` (`id`);

--
-- Constraints for table `zcms_list_labels`
--
ALTER TABLE `zcms_list_labels`
  ADD CONSTRAINT `zcms_list_labels_ibfk_1` FOREIGN KEY (`list_id`) REFERENCES `zcms_list_settings` (`id`);

--
-- Constraints for table `zcms_list_labels_lang`
--
ALTER TABLE `zcms_list_labels_lang`
  ADD CONSTRAINT `zcms_list_labels_lang_ibfk_1` FOREIGN KEY (`id_`) REFERENCES `zcms_list_labels` (`id`);

--
-- Constraints for table `zcms_list_settings_lang`
--
ALTER TABLE `zcms_list_settings_lang`
  ADD CONSTRAINT `zcms_list_settings_lang_ibfk_1` FOREIGN KEY (`id_`) REFERENCES `zcms_list_settings` (`id`);

--
-- Constraints for table `zcms_logs_lang`
--
ALTER TABLE `zcms_logs_lang`
  ADD CONSTRAINT `zcms_logs_lang_ibfk_1` FOREIGN KEY (`id_`) REFERENCES `zcms_logs` (`id`);

--
-- Constraints for table `zcms_menu_lang`
--
ALTER TABLE `zcms_menu_lang`
  ADD CONSTRAINT `zcms_menu_lang_ibfk_1` FOREIGN KEY (`id_`) REFERENCES `zcms_menu` (`id`);

--
-- Constraints for table `zcms_modules_lang`
--
ALTER TABLE `zcms_modules_lang`
  ADD CONSTRAINT `zcms_modules_lang_ibfk_1` FOREIGN KEY (`id_`) REFERENCES `zcms_modules` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
