-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 07, 2015 at 10:16 AM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `zcms_v04`
--

-- --------------------------------------------------------

--
-- Table structure for table `catalog_categories`
--

CREATE TABLE IF NOT EXISTS `catalog_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alias` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `video` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `parent` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `catalog_categories`
--

INSERT INTO `catalog_categories` (`id`, `alias`, `type`, `image`, `video`, `parent`) VALUES
(1, 'category-1', '', '[]', 'http://www.youtube.com/watch?v=Eg8a6PHJP50', 0),
(2, 'category-1-1', '', '', '', 1),
(3, 'category-1-2', '', '', '', 1),
(4, 'category-1-3', '', '', '', 1),
(5, 'category-1-2-1', '', '', '', 3),
(6, 'category-1-2-2', '', '', '', 3),
(7, 'category-2', '', '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_categories_lang`
--

CREATE TABLE IF NOT EXISTS `catalog_categories_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_` int(11) NOT NULL,
  `lang_id` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `keywords` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `meta_description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `catalog_categories_lang`
--

INSERT INTO `catalog_categories_lang` (`id`, `id_`, `lang_id`, `keywords`, `meta_description`, `category`, `description`) VALUES
(1, 1, 'EN', 'category, test category, category 1', 'Category 1 is a test category', 'Category 1', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras commodo lacus vitae ipsum mattis, in gravida sem luctus. In bibendum, eros at condimentum mattis, nibh nibh vulputate est, eu facilisis tortor ligula lacinia erat. Nunc ullamcorper orci eget quam consequat, sit amet varius orci rhoncus. Cras sit amet orci pellentesque, pulvinar odio a, semper eros. Aliquam sem magna, pellentesque quis semper ut, efficitur in libero. Nulla purus leo, pulvinar et molestie et, pretium et mauris. Aenean nec nunc dictum, feugiat neque vel, tincidunt ligula. Donec ut ante felis. Etiam vel purus eros.</p>\r\n<p>&nbsp;</p>\r\n<p>Aenean a aliquam libero. Morbi at lorem magna. Morbi elementum elementum risus sed interdum. Curabitur ultricies lorem non lacinia pellentesque. Quisque ut convallis diam. Donec facilisis sodales maximus. Nulla ut laoreet nisl. In consequat, tortor vitae tristique porttitor, lorem leo ultrices ex, ac placerat nibh nunc et mi. Ut vel metus et lacus tincidunt tincidunt pellentesque ut urna. Quisque vulputate libero id imperdiet tincidunt. Proin ultrices libero eget lectus volutpat, et placerat nisl pellentesque. Sed vel lacinia libero. Nulla nisi ex, pharetra at felis vitae, tincidunt sagittis nulla. Suspendisse potenti. Aliquam facilisis iaculis sem, non blandit velit luctus ac.</p>'),
(2, 2, 'EN', '', '', 'Category 1.1', ''),
(3, 3, 'EN', '', '', 'Category 1.2', ''),
(4, 4, 'EN', '', '', 'Category 1.3', ''),
(5, 5, 'EN', '', '', 'Category 1.2.1', ''),
(6, 6, 'EN', '', '', 'Category 1.2.2', ''),
(7, 7, 'EN', '', '', 'Category 2', '');

-- --------------------------------------------------------

--
-- Table structure for table `catalog_products`
--

CREATE TABLE IF NOT EXISTS `catalog_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alias` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `code` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `categories` text COLLATE utf8_unicode_ci NOT NULL,
  `video` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `catalog_products`
--

INSERT INTO `catalog_products` (`id`, `alias`, `type`, `code`, `categories`, `video`) VALUES
(1, 'alias-1', 2, '1233', '["","0","1","5","6","7"]', 'https://www.youtube.com/embed/Eg8a6PHJP50'),
(2, 'alias-2', 2, '1233', '["","0","1","5","6","7"]', ''),
(3, 'alias-3', 2, '1233', '["","0","1","5","6","7"]', ''),
(4, 'alias-4', 2, '1233', '["","0","1","5","6","7"]', ''),
(5, 'alias-5', 2, '1233', '["","0","1","5","6","7"]', ''),
(6, 'alias-6', 2, '1233', '["","0","1","5","6","7"]', ''),
(7, 'alias-7', 2, '1233', '["","0","1","5","6","7"]', '');

-- --------------------------------------------------------

--
-- Table structure for table `catalog_products_lang`
--

CREATE TABLE IF NOT EXISTS `catalog_products_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_` int(11) NOT NULL,
  `lang_id` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `keywords` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `meta_description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `attributes` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_` (`id_`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `catalog_products_lang`
--

INSERT INTO `catalog_products_lang` (`id`, `id_`, `lang_id`, `keywords`, `meta_description`, `title`, `description`, `attributes`) VALUES
(1, 1, 'EN', '', '', 'title', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque pharetra justo ullamcorper nisi pharetra gravida. Pellentesque posuere blandit eros ac auctor. Donec arcu tortor, bibendum eu lacinia sit amet, luctus ut leo. Cras in tristique erat, eu tristique massa. Vivamus at enim id augue hendrerit fringilla a ornare neque. Pellentesque feugiat vitae justo id elementum. Maecenas a egestas enim. Etiam lobortis ullamcorper eleifend. Curabitur vulputate ipsum eget volutpat dapibus. Sed sodales lacinia felis, non scelerisque mauris tincidunt ac. Donec sit amet diam leo. Etiam vitae mi non elit tincidunt scelerisque.</p>\r\n<p>Phasellus ex nisi, convallis aliquet purus sed, tempor sagittis nisl. In ullamcorper mi risus. Aenean a quam vel libero iaculis viverra at faucibus ligula. Etiam id sem vulputate, faucibus velit ut, bibendum dolor. Interdum et malesuada fames ac ante ipsum primis in faucibus. Etiam consectetur, lacus quis commodo blandit, diam libero consequat purus, et mollis augue tellus ac sapien. Phasellus ut ex et risus pellentesque interdum. Nulla dignissim urna a venenatis vulputate.</p>', '{"memory":"2 GHz","processsor":"Dragon Quad Core 1.6 Ghz","hdd":"32 Gb","display_size":"5.2 inch","dimensions":"","weight":"120 g"}'),
(2, 2, 'EN', '', '', 'title', '', '{"memory":"","processsor":"","hdd":"","display_size":"","dimensions":"","weight":""}'),
(3, 3, 'EN', '', '', 'title', '', '{"memory":"","processsor":"","hdd":"","display_size":"","dimensions":"","weight":""}'),
(4, 4, 'EN', '', '', 'title', '', '{"memory":"","processsor":"","hdd":"","display_size":"","dimensions":"","weight":""}'),
(5, 5, 'EN', '', '', 'title', '', '{"memory":"","processsor":"","hdd":"","display_size":"","dimensions":"","weight":""}'),
(6, 6, 'EN', '', '', 'title', '', '{"memory":"","processsor":"","hdd":"","display_size":"","dimensions":"","weight":""}'),
(7, 7, 'EN', '', '', 'title', '', '{"memory":"","processsor":"","hdd":"","display_size":"","dimensions":"","weight":""}');

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_docs`
--

CREATE TABLE IF NOT EXISTS `catalog_product_docs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rel_id` int(11) NOT NULL,
  `file` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rel_id` (`rel_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `catalog_product_docs`
--

INSERT INTO `catalog_product_docs` (`id`, `rel_id`, `file`) VALUES
(1, 1, 'eaf-demo-mz-document-2.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_docs_lang`
--

CREATE TABLE IF NOT EXISTS `catalog_product_docs_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_` int(11) NOT NULL,
  `lang_id` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_` (`id_`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `catalog_product_docs_lang`
--

INSERT INTO `catalog_product_docs_lang` (`id`, `id_`, `lang_id`, `title`) VALUES
(1, 1, 'EN', 'Test Pdf');

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_images`
--

CREATE TABLE IF NOT EXISTS `catalog_product_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rel_id` int(11) NOT NULL,
  `file` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `main` int(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rel_id` (`rel_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=10 ;

--
-- Dumping data for table `catalog_product_images`
--

INSERT INTO `catalog_product_images` (`id`, `rel_id`, `file`, `main`) VALUES
(4, 1, 'maxresdefault.jpg', 1),
(5, 1, 'maxresdefault1.jpg', 0),
(6, 1, 'maxresdefault11.jpg', 0),
(7, 1, 'maxresdefault2.jpg', 0),
(8, 1, 'maxresdefault3.jpg', 0),
(9, 1, 'maxresdefault4.jpg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_images_lang`
--

CREATE TABLE IF NOT EXISTS `catalog_product_images_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_` int(11) NOT NULL,
  `lang_id` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `alt` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_` (`id_`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `catalog_product_images_lang`
--

INSERT INTO `catalog_product_images_lang` (`id`, `id_`, `lang_id`, `title`, `alt`) VALUES
(3, 4, 'EN', '', ''),
(4, 5, 'EN', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `catalog_types`
--

CREATE TABLE IF NOT EXISTS `catalog_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alias` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `catalog_types`
--

INSERT INTO `catalog_types` (`id`, `alias`) VALUES
(1, 'shoes'),
(2, 'phones'),
(3, 'no-attr-test');

-- --------------------------------------------------------

--
-- Table structure for table `catalog_types_lang`
--

CREATE TABLE IF NOT EXISTS `catalog_types_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_` int(11) NOT NULL,
  `lang_id` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `attributes` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `catalog_types_lang`
--

INSERT INTO `catalog_types_lang` (`id`, `id_`, `lang_id`, `label`, `attributes`) VALUES
(1, 1, 'EN', 'Shoes', '{"0":{"alias":"size","label":"Size"},"2":{"alias":"color","label":"Color"}}'),
(2, 2, 'EN', 'Phones', '[{"alias":"memory","label":"Memory"},{"alias":"processsor","label":"Processsor"},{"alias":"hdd","label":"HDD"},{"alias":"display_size","label":"Display size"},{"alias":"dimensions","label":"Dimensions"},{"alias":"weight","label":"Weight"}]'),
(3, 3, 'EN', 'No attributes test', '[{"alias":"","label":""}]');

-- --------------------------------------------------------

--
-- Table structure for table `content_articles`
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
-- Dumping data for table `content_articles`
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
-- Table structure for table `content_articles_lang`
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=13 ;

--
-- Dumping data for table `content_articles_lang`
--

INSERT INTO `content_articles_lang` (`id`, `id_`, `lang_id`, `title`, `keywords`, `description`, `content`) VALUES
(1, 1, 'EN', '404 Page not Found', '404, not found', '404 page not found', '<p>Ooooops! The page you are looking for has gone missing.</p>'),
(2, 2, 'EN', 'Simple News', 'Simple, news, keywords', 'Simple News Description', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ut, tenetur natus doloremque laborum quos iste ipsum rerum obcaecati impedit odit illo dolorum ab tempora nihil dicta earum fugiat. Temporibus, voluptatibus.</p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eos, doloribus, dolorem iusto blanditiis unde eius illum consequuntur neque dicta incidunt ullam ea hic porro optio ratione repellat perspiciatis. Enim, iure!</p>'),
(3, 3, 'EN', 'Simple News 2', 'simple, news', 'Simple news 2', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ut, tenetur natus doloremque laborum quos iste ipsum rerum obcaecati impedit odit illo dolorum ab tempora nihil dicta earum fugiat. Temporibus, voluptatibus.</p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eos, doloribus, dolorem iusto blanditiis unde eius illum consequuntur neque dicta incidunt ullam ea hic porro optio ratione repellat perspiciatis. Enim, iure!</p>'),
(4, 4, 'EN', 'Simple News 3', 'simple, news', 'Simple news 3', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ut, tenetur natus doloremque laborum quos iste ipsum rerum obcaecati impedit odit illo dolorum ab tempora nihil dicta earum fugiat. Temporibus, voluptatibus.</p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eos, doloribus, dolorem iusto blanditiis unde eius illum consequuntur neque dicta incidunt ullam ea hic porro optio ratione repellat perspiciatis. Enim, iure!</p>'),
(5, 5, 'EN', 'Simple News 4', 'simple, news', 'Simple news 4', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ut, tenetur natus doloremque laborum quos iste ipsum rerum obcaecati impedit odit illo dolorum ab tempora nihil dicta earum fugiat. Temporibus, voluptatibus.</p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eos, doloribus, dolorem iusto blanditiis unde eius illum consequuntur neque dicta incidunt ullam ea hic porro optio ratione repellat perspiciatis. Enim, iure!</p>'),
(6, 6, 'EN', 'Lorem Ipsum', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras commodo lacus vitae ipsum mattis, in gravida sem luctus. In bibendum, eros at condimentum mattis, nibh nibh vulputate est, eu facilisis tortor ligula lacinia erat. Nunc ullamcorper orci eget quam consequat, sit amet varius orci rhoncus. Cras sit amet orci pellentesque, pulvinar odio a, semper eros. Aliquam sem magna, pellentesque quis semper ut, efficitur in libero. Nulla purus leo, pulvinar et molestie et, pretium et mauris. Aenean nec nunc dictum, feugiat neque vel, tincidunt ligula. Donec ut ante felis. Etiam vel purus eros.</p>\r\n<p>&nbsp;</p>\r\n<p>Aenean a aliquam libero. Morbi at lorem magna. Morbi elementum elementum risus sed interdum. Curabitur ultricies lorem non lacinia pellentesque. Quisque ut convallis diam. Donec facilisis sodales maximus. Nulla ut laoreet nisl. In consequat, tortor vitae tristique porttitor, lorem leo ultrices ex, ac placerat nibh nunc et mi. Ut vel metus et lacus tincidunt tincidunt pellentesque ut urna. Quisque vulputate libero id imperdiet tincidunt. Proin ultrices libero eget lectus volutpat, et placerat nisl pellentesque. Sed vel lacinia libero. Nulla nisi ex, pharetra at felis vitae, tincidunt sagittis nulla. Suspendisse potenti. Aliquam facilisis iaculis sem, non blandit velit luctus ac.</p>'),
(7, 1, 'BG', '404 Страницата не е намерена', '', '', '<p>Страницата, която търсите не е намерена.</p>'),
(8, 2, 'BG', 'Новина ', 'Новина, ключови, думи', 'Новина Описание', '<p>Внимавайте вие, читатели и слушатели, роде български, които обичате и вземате присърце своя род и своето българско отечество и желаете да разберете и знаете известното за своя български род и за вашите бащи, прадеди и царе, патриарси и светии как изпърво са живели и прекарвали. За вас е потребно и полезно да знаете известното за делата на вашите бащи, както знаят всички други племена и народи своя род и език, имат история и всеки грамотен от тях знае, разказва и се гордее със своя род и език.</p>\r\n<p></p>'),
(9, 3, 'BG', 'Новина 2', 'новини', 'Новина 2', '<p>Така и аз ви написах подред това, което е известно за вашия род и език. Четете и знайте, за да не бивате подигравани и укорявани от други племена и народи. Твърде много обикнах българския род и отечество и много труд употребих да събирам от различни книги и истории, докато събрах и обединих историята на българския род в тая книжка за ваша полза и похвала. Написах я за вас, които обичате своя род и българското отечество и обичате да знаете за своя род и език. Преписвайте тая историйка и платете, нека ви я препишат, които умеят да пишат, и пазете я да не изчезне!</p>'),
(10, 4, 'BG', 'Новина 3', 'simple, news', 'Новина 3', '<p>Внимавайте вие, читатели и слушатели, роде български, които обичате и вземате присърце своя род и своето българско отечество и желаете да разберете и знаете известното за своя български род и за вашите бащи, прадеди и царе, патриарси и светии как изпърво са живели и прекарвали. За вас е потребно и полезно да знаете известното за делата на вашите бащи, както знаят всички други племена и народи своя род и език, имат история и всеки грамотен от тях знае, разказва и се гордее със своя род и език.</p>\r\n<p>Така и аз ви написах подред това, което е известно за вашия род и език. Четете и знайте, за да не бивате подигравани и укорявани от други племена и народи. Твърде много обикнах българския род и отечество и много труд употребих да събирам от различни книги и истории, докато събрах и обединих историята на българския род в тая книжка за ваша полза и похвала. Написах я за вас, които обичате своя род и българското отечество и обичате да знаете за своя род и език. Преписвайте тая историйка и платете, нека ви я препишат, които умеят да пишат, и пазете я да не изчезне!</p>'),
(11, 5, 'BG', 'Новина 4', 'simple, news', 'Новина 4', '<p>Внимавайте вие, читатели и слушатели, роде български, които обичате и вземате присърце своя род и своето българско отечество и желаете да разберете и знаете известното за своя български род и за вашите бащи, прадеди и царе, патриарси и светии как изпърво са живели и прекарвали. За вас е потребно и полезно да знаете известното за делата на вашите бащи, както знаят всички други племена и народи своя род и език, имат история и всеки грамотен от тях знае, разказва и се гордее със своя род и език.</p>\r\n<p>Така и аз ви написах подред това, което е известно за вашия род и език. Четете и знайте, за да не бивате подигравани и укорявани от други племена и народи. Твърде много обикнах българския род и отечество и много труд употребих да събирам от различни книги и истории, докато събрах и обединих историята на българския род в тая книжка за ваша полза и похвала. Написах я за вас, които обичате своя род и българското отечество и обичате да знаете за своя род и език. Преписвайте тая историйка и платете, нека ви я препишат, които умеят да пишат, и пазете я да не изчезне!</p>'),
(12, 6, 'BG', 'О неразумни', '', '', '<p>Внимавайте вие, читатели и слушатели, роде български, които обичате и вземате присърце своя род и своето българско отечество и желаете да разберете и знаете известното за своя български род и за вашите бащи, прадеди и царе, патриарси и светии как изпърво са живели и прекарвали. За вас е потребно и полезно да знаете известното за делата на вашите бащи, както знаят всички други племена и народи своя род и език, имат история и всеки грамотен от тях знае, разказва и се гордее със своя род и език.</p>\r\n<p>Така и аз ви написах подред това, което е известно за вашия род и език. Четете и знайте, за да не бивате подигравани и укорявани от други племена и народи. Твърде много обикнах българския род и отечество и много труд употребих да събирам от различни книги и истории, докато събрах и обединих историята на българския род в тая книжка за ваша полза и похвала. Написах я за вас, които обичате своя род и българското отечество и обичате да знаете за своя род и език. Преписвайте тая историйка и платете, нека ви я препишат, които умеят да пишат, и пазете я да не изчезне!</p>');

-- --------------------------------------------------------

--
-- Table structure for table `content_categories`
--

CREATE TABLE IF NOT EXISTS `content_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alias` varchar(128) NOT NULL,
  `parent` int(11) NOT NULL,
  `order` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `content_categories`
--

INSERT INTO `content_categories` (`id`, `alias`, `parent`, `order`) VALUES
(1, 'news', 0, 1),
(2, 'uncategorised', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `content_categories_lang`
--

CREATE TABLE IF NOT EXISTS `content_categories_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_` int(11) NOT NULL,
  `lang_id` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `keywords` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `content_categories_lang`
--

INSERT INTO `content_categories_lang` (`id`, `id_`, `lang_id`, `label`, `keywords`, `description`) VALUES
(1, 1, 'EN', 'News', '', ''),
(2, 2, 'EN', 'Uncategorised', 'Uncategorised, articles', 'Uncategorised articles'),
(3, 2, 'BG', 'Без категория', 'Без категория', 'Без категория'),
(4, 1, 'BG', 'Новини', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `content_forms`
--

CREATE TABLE IF NOT EXISTS `content_forms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alias` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `parent_id` int(11) NOT NULL,
  `order` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `content_forms`
--

INSERT INTO `content_forms` (`id`, `alias`, `type`, `parent_id`, `order`, `required`, `enabled`) VALUES
(1, 'contact-us', 'form', 0, 0, 0, 1),
(2, 'name', 'text', 1, 0, 1, 1),
(3, 'email', 'text', 1, 10, 1, 1),
(4, 'gender', 'select', 1, 20, 0, 1),
(5, 'subscribe', 'checkbox', 1, 30, 0, 1),
(6, 'query', 'textarea', 1, 40, 1, 1),
(7, 'phone', 'text', 1, 15, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `content_forms_lang`
--

CREATE TABLE IF NOT EXISTS `content_forms_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_` int(11) NOT NULL,
  `lang_id` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `options` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `content_forms_lang`
--

INSERT INTO `content_forms_lang` (`id`, `id_`, `lang_id`, `label`, `options`) VALUES
(1, 1, 'EN', 'Contact Us', ''),
(2, 2, 'EN', 'Name', ''),
(3, 3, 'EN', 'E-mail', ''),
(4, 4, 'EN', 'Gender', '{male:Male}\r\n{female:Female}'),
(5, 5, 'EN', 'Subscribe', ''),
(6, 6, 'EN', 'Query', ''),
(7, 7, 'EN', 'Phone', '');

-- --------------------------------------------------------

--
-- Table structure for table `content_slider`
--

CREATE TABLE IF NOT EXISTS `content_slider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alias` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `parent` int(11) NOT NULL,
  `order` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `content_slider`
--

INSERT INTO `content_slider` (`id`, `alias`, `image`, `link`, `parent`, `order`) VALUES
(1, 'simple_slider', '', '', 0, 0),
(2, 'slide_1', '["slide_one.png"]', 'http://localhost/development/personal/zcms/v.0.4/index.php/front/three_column_layout/article/lorem_ipsum', 1, 1),
(3, 'slide_2', '["slide_two.png"]', 'http://localhost/development/personal/zcms/v.0.4/index.php/front/three_column_layout/article/lorem_ipsum', 1, 2),
(4, 'slide_3', '["slide_three.png"]', 'http://localhost/development/personal/zcms/v.0.4/index.php/front/three_column_layout/article/lorem_ipsum', 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `content_slider_lang`
--

CREATE TABLE IF NOT EXISTS `content_slider_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_` int(11) NOT NULL,
  `lang_id` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Dumping data for table `content_slider_lang`
--

INSERT INTO `content_slider_lang` (`id`, `id_`, `lang_id`, `label`) VALUES
(1, 1, 'EN', 'Simple Slider'),
(2, 2, 'EN', 'Slide 1'),
(3, 3, 'EN', 'Slide 2'),
(4, 4, 'EN', 'Slide 3'),
(5, 1, 'BG', 'Прост слайдър'),
(6, 2, 'BG', 'Слайд 1'),
(7, 3, 'BG', 'Слайд 2'),
(8, 4, 'BG', 'Слайд 3');

-- --------------------------------------------------------

--
-- Table structure for table `content_widgets`
--

CREATE TABLE IF NOT EXISTS `content_widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alias` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `content_widgets`
--

INSERT INTO `content_widgets` (`id`, `alias`, `link`) VALUES
(1, 'bootstrap', 'http://localhost/development/personal/zcms/v.0.4/index.php/front/two_column_layout/category/news');

-- --------------------------------------------------------

--
-- Table structure for table `content_widgets_lang`
--

CREATE TABLE IF NOT EXISTS `content_widgets_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_` int(11) NOT NULL,
  `lang_id` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `content_widgets_lang`
--

INSERT INTO `content_widgets_lang` (`id`, `id_`, `lang_id`, `title`, `content`) VALUES
(1, 1, 'EN', '<p><i class="fa fa-fw fa-check"></i> Bootstrap v3.2.0</p>', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Itaque, optio corporis quae nulla aspernatur in alias at numquam rerum ea excepturi expedita tenetur assumenda voluptatibus eveniet incidunt dicta nostrum quod?</p>'),
(2, 1, 'BG', '<p><i class="fa fa-fw fa-check"></i> Тестов Уиджет</p>', '<p>Но поради що ти, глупави човече, се срамуваш от своя род и се влачиш по чужд език? Но, рече, гърците са по-мъдри и по-културни, а българите са прости и глупави и нямат изтънчени думи. Затова, казва, по-добре да се присъединим към гърците.</p>');

-- --------------------------------------------------------

--
-- Table structure for table `menus_frontend_menus`
--

CREATE TABLE IF NOT EXISTS `menus_frontend_menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `page_id` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'general',
  `article` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `params` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `order` int(11) NOT NULL,
  `alias` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `target` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `page_id` (`page_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `menus_frontend_menus`
--

INSERT INTO `menus_frontend_menus` (`id`, `parent_id`, `page_id`, `type`, `article`, `category`, `params`, `order`, `alias`, `target`) VALUES
(1, 0, '0', 'general', NULL, NULL, '', 0, 'main', ''),
(2, 1, 'home', 'general', NULL, NULL, 'category/news', 0, '', ''),
(3, 1, '0', 'general', NULL, NULL, '', 1, '', ''),
(4, 3, 'one_column_layout', 'article', 'lorem_ipsum', 'news', 'article/lorem_ipsum', 0, '', ''),
(5, 3, 'two_column_layout', 'general', NULL, NULL, 'category/news', 1, '', ''),
(6, 3, 'three_column_layout', 'general', '0', '0', 'form/contact-us', 2, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `menus_frontend_menus_lang`
--

CREATE TABLE IF NOT EXISTS `menus_frontend_menus_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_` int(11) NOT NULL,
  `lang_id` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=14 ;

--
-- Dumping data for table `menus_frontend_menus_lang`
--

INSERT INTO `menus_frontend_menus_lang` (`id`, `id_`, `lang_id`, `label`) VALUES
(1, 1, 'EN', 'Main menu'),
(2, 2, 'EN', 'Home'),
(3, 3, 'EN', 'Layout Tests'),
(4, 4, 'EN', 'One column layout'),
(5, 5, 'EN', 'Two column layout'),
(6, 6, 'EN', 'Three column layout'),
(8, 1, 'BG', 'Главно меню'),
(9, 2, 'BG', 'Начало'),
(10, 3, 'BG', 'Тестове на изгледи'),
(11, 4, 'BG', 'Изглед с една колона'),
(12, 5, 'BG', 'Изглед с две колони'),
(13, 6, 'BG', 'Изглед с три колони');

-- --------------------------------------------------------

--
-- Table structure for table `zcms_admins`
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `zcms_admins`
--

INSERT INTO `zcms_admins` (`id`, `username`, `password`, `email`, `image`, `level`) VALUES
(1, 'tedobg', '456f733c9d39fe928b732b858fadd6ff ', 'teodorklissarov@gmail.com', '["10628058_760530170676435_4429408701370286876_n.jpg"]', 1),
(2, 'admin', '36e630a4aad2edad9775790eaa92fffa', 'admin@dev.bg', '', 2),
(4, 'client', '36e630a4aad2edad9775790eaa92fffa', 'client@test.bg', '', 3);

-- --------------------------------------------------------

--
-- Table structure for table `zcms_admins_lang`
--

CREATE TABLE IF NOT EXISTS `zcms_admins_lang` (
  `id` int(11) NOT NULL,
  `id_` int(11) NOT NULL,
  `lang_id` varchar(5) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `zcms_admins_lang`
--

INSERT INTO `zcms_admins_lang` (`id`, `id_`, `lang_id`, `name`) VALUES
(0, 2, 'EN', 'Admin'),
(0, 1, 'EN', 'Teodor Klissarov'),
(0, 4, 'EN', 'Client'),
(0, 2, 'BG', 'Admin'),
(0, 4, 'BG', 'Client'),
(0, 1, 'BG', 'Teodor Klissarov');

-- --------------------------------------------------------

--
-- Table structure for table `zcms_languages`
--

CREATE TABLE IF NOT EXISTS `zcms_languages` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `lang_code` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `zcms_languages`
--

INSERT INTO `zcms_languages` (`id`, `lang_code`) VALUES
(1, 'EN'),
(2, 'BG');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `zcms_languages_lang`
--

INSERT INTO `zcms_languages_lang` (`id`, `id_`, `lang_id`, `language`) VALUES
(1, 1, 'EN', 'English'),
(2, 1, 'BG', 'Английски'),
(3, 2, 'EN', 'Bulgarian'),
(4, 2, 'BG', 'Български');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=80 ;

--
-- Dumping data for table `zcms_lang_cache`
--

INSERT INTO `zcms_lang_cache` (`id`, `link`, `lang_id`, `ids`) VALUES
(1, 'backend/catalog/product_edit/1', 'BG', '["1","42","92","34","69","215","216","203","55","68","204","205","14","26","51","214","15","28","29","30","31","32","35","36","198"]'),
(2, 'front/home', 'BG', '[110,111,"136","137","138","139"]'),
(3, 'front', 'BG', '["79","80","169","81","82","83"]'),
(4, 'front/home/category/news', 'BG', '["79","80","169","81","82","83"]'),
(5, 'front/one_column_layout/article/lorem_ipsum', 'BG', '["79","80","81","82","83"]'),
(6, 'front/two_column_layout/category/news', 'BG', '["79","80","75","76","174","85","169","77","78"]'),
(7, 'front/three_column_layout/article/lorem_ipsum', 'BG', '["79","80","169"]'),
(8, 'backend/dashboard', 'BG', '["1","42","92"]'),
(9, 'backend/localisation/translations_list', 'BG', '["1","42","92","60","61","62","8","11","12","13","9","10"]'),
(10, 'backend/content/pages_list', 'BG', '["1","42","92","14","15","8","11","12","13","9","10"]'),
(11, 'backend/content/pages_edit/1', 'BG', '["1","42","92","14","18","15","25","19","33","88","74","28","29"]'),
(12, 'backend/content/category_list', 'BG', '["1","42","92","4","5","35","36","8","12","13"]'),
(13, 'backend/content/category_edit/2', 'BG', '["94","95","96","128",129,"102","122",130,131,"127","103","104"]'),
(14, 'backend/content/category_edit/1', 'BG', '["94","95","96","128","129","102","122","130","131","127","103","104"]'),
(15, 'backend/content/articles_list', 'BG', '["1","42","92","14","15","67","8","11","12","13","9","10"]'),
(16, 'backend/content/articles_edit/1', 'BG', '["94","95","96","98","129","132",133,134,"102","122",135,"103","104"]'),
(17, 'backend/content/news_list', 'BG', '["1","42","92","14","15","67","8","11","12","13","9","10"]'),
(18, 'backend/content/news_edit/2', 'BG', '["94","95","96","98","129","132","133","134","102","122","135","103","104"]'),
(19, 'backend/content/news_edit/3', 'BG', '["1","42","92","14","69","67","70","72","15","25","27","28","29","198"]'),
(20, 'backend/content/pages_edit/15', 'BG', '["1","42","92","14","18","15","25","19","33","88","74","28","29"]'),
(21, 'backend/content/pages_edit/16', 'BG', '["1","42","92","14","18","15","25","19","33","88","74","28","29","198"]'),
(22, 'backend/content/pages_edit/19', 'BG', '["1","42","92","14","18","15","25","19","33","88","74","28","29"]'),
(23, 'backend/content/pages_edit/17', 'BG', '["1","42","92","14","18","15","25","19","33","88","74","28","29","198"]'),
(24, 'backend/content/news_edit/4', 'BG', '["94","95","96","98","129","132","133","134","102","122","135","103","104"]'),
(25, 'backend/content/news_edit/5', 'BG', '["94","95","96","98","129","132","133","134","102","122","135","103","104"]'),
(26, 'backend/content/slider_list', 'BG', '["1","42","92","5","35","36","89","90","8","12","13"]'),
(27, 'backend/content/slider_edit/1', 'BG', '["94","95","96","128","129",142,"130",143,"127",144,"103","104","105","106","107"]'),
(28, 'front/home/article/simple_news', 'BG', '["110","111","136","137","138","139"]'),
(29, 'backend/content/slider_edit/2', 'BG', '["1","42","92","5","69","86","54","91","4","46","28","29","30","31","32","36","94","95","96","128","129","142","130","143","127","144","103","104","105","106","107","109"]'),
(30, 'backend/content/slider_edit/3', 'BG', '["94","95","96","128","129","142","130","143","127","144","103","104","105","106","107","109"]'),
(31, 'backend/content/slider_edit/4', 'BG', '["94","95","96","128","129","142","130","143","127","144","103","104","105","106","107","109"]'),
(32, 'backend/content/widgets_list', 'BG', '["94","95","96","98","142","115","116","117","118","119","120"]'),
(33, 'backend/content/widgets_edit/1', 'BG', '["94","95","96","129","142","98","135","103","104"]'),
(34, 'backend/content/articles_edit/6', 'BG', '["94","95","96","98","129","132","133","134","102","122","135","103","104"]'),
(35, 'backend/menus/frontend_menu_list', 'BG', '["1","42","92","5","38","39","8","12","13"]'),
(36, 'backend/menus/frontend_menu_edit/1', 'BG', '["94","95","96","128","129",147,148,149,150,151,"127","103","104"]'),
(37, 'backend/menus/frontend_menu_edit/2', 'BG', '["94","95","96","128","129","147","148","149","150","151","127","103","104"]'),
(38, 'backend/menus/frontend_menu_edit/3', 'BG', '["94","95","96","128","129","147","148","149","150","151","127","103","104"]'),
(39, 'backend/menus/frontend_menu_edit/4', 'BG', '["1","42","92","5","69","63","64","65","16","68","178","177","67","66","4","28","29"]'),
(40, 'backend/menus/frontend_menu_edit/5', 'BG', '["94","95","96","128","129","147","148","149","150","151","127","103","104"]'),
(41, 'backend/menus/frontend_menu_edit/6', 'BG', '["1","42","92","5","69","63","64","65","16","68","178","177","67","66","4","28","29"]'),
(42, 'backend/localisation/translations_edit', 'BG', '["94","95","96","112","113","114","103","104"]'),
(43, 'backend/localisation/translations_edit/136', 'BG', '["94","95","96","112","113","114","103","104"]'),
(44, 'backend/localisation/translations_edit/137', 'BG', '["94","95","96","112","113","114","103","104"]'),
(45, 'backend/localisation/translations_edit/154', 'BG', '["94","95","96","112","113","114","103","104"]'),
(46, 'backend/localisation/translations_edit/139', 'BG', '["94","95","96","112","113","114","103","104"]'),
(47, 'backend/localisation/translations_edit/155', 'BG', '["94","95","96","112","113","114","103","104"]'),
(48, 'backend/localisation/translations_edit/160', 'BG', '["94","95","96","112","113","114","103","104"]'),
(49, 'backend/localisation/languages_list', 'BG', '["94","95","96",161,"112","115","116","117","118","119","120"]'),
(50, 'backend/localisation/languages_edit/2', 'BG', '["94","95","96","112","161","103","104"]'),
(51, 'backend/localisation/translations_edit/94', 'BG', '["94","95","96","112","113","114","103","104"]'),
(52, 'backend/localisation/translations_delete/73', 'BG', '["112","113","114","103"]'),
(53, 'backend/localisation/translations_delete/136', 'BG', '["112","113","114","103"]'),
(54, 'backend/localisation/translations_delete/137', 'BG', '["112","113","114","103"]'),
(55, 'backend/localisation/translations_delete/154', 'BG', '["112","113","114","103"]'),
(56, 'backend/localisation/translations_delete/84', 'BG', '["112","113","114","103"]'),
(57, 'backend/localisation/translations_delete/155', 'BG', '["112","113","114","103"]'),
(58, 'backend/localisation/translations_delete/139', 'BG', '["112","113","114","103"]'),
(59, 'backend/content/articles_edit', 'BG', '["94","95","96","98","129","132","133","134","102","122","135","103","104"]'),
(60, 'backend/admin/index', 'BG', '["1","42","92","43","71","44","7","8","11","12","13","9","10"]'),
(61, 'backend/admin/edit/2', 'BG', '["94","95","96","162","163","164","144",166,"165","103","104","105","106","107"]'),
(62, 'backend/admin/edit/4', 'BG', '["94","95","96","162","163","164","144","166","165","103","104","105","106","107"]'),
(63, 'backend/admin/edit/1', 'BG', '["94","95","96","162","163","164","144","166","165","103","104","105","106","107"]'),
(64, 'backend/content/articles_edit/7', 'BG', '["94","95","96","98","129","132","133","134","102","122","135","103","104"]'),
(65, 'backend/localisation/translations_edit/158', 'BG', '["94","95","96","112","113","114","103","104"]'),
(66, 'backend/localisation/translations_edit/159', 'BG', '["94","95","96","112","113","114","103","104"]'),
(67, 'backend/localisation/translations_edit/152', 'BG', '["94","95","96","112","113","114","103","104"]'),
(68, 'backend/localisation/translations_edit/153', 'BG', '["94","95","96","112","113","114","103","104"]'),
(69, 'front/one_column_layout/article/simple_news', 'BG', '["79","80","81","82","83"]'),
(70, 'backend/localisation/translations_edit/167', 'BG', '["94","95","96","112","113","114","103","104"]'),
(71, 'backend/localisation/translations_edit/168', 'BG', '["94","95","96","112","113","114","103","104"]'),
(72, 'backend/localisation/translations_edit/138', 'BG', '["94","95","96","112","113","114","103","104"]'),
(73, 'backend/catalog/product_list', 'BG', '["1","42","92","34","14","35","36","37","8","11","12","13","9","10"]'),
(74, 'backend/catalog/product_image_delete/28/1', 'BG', '["98",171,"144",172,"103"]'),
(75, 'backend/authenticate/login', 'BG', '["1","57"]'),
(76, 'backend/elf/index/1/cHVibGljL3VwbG9hZHMvbWVkaWE=', 'BG', '["96"]'),
(77, 'backend/elf/init/cHVibGljL3VwbG9hZHMvbWVkaWE=', 'BG', NULL),
(78, 'front/search', 'BG', '["79","80","175","169"]'),
(79, 'backend/content/pages_edit', 'BG', '["1","42","92","14","18","15","25","19","33","88","74","28"]');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=217 ;

--
-- Dumping data for table `zcms_lang_misc`
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
(74, 'EN', 'Modules', NULL),
(75, 'EN', 'Showing ', NULL),
(76, 'EN', 'of ', NULL),
(77, 'EN', 'First', NULL),
(78, 'EN', 'Last', NULL),
(79, 'EN', 'Toggle navigation', NULL),
(80, 'EN', 'Site logo', NULL),
(81, 'EN', ' by ', NULL),
(82, 'EN', 'Posted on ', NULL),
(83, 'EN', ' in ', NULL),
(85, 'EN', 'in', NULL),
(86, 'EN', 'Link', NULL),
(87, 'EN', 'awesome', NULL),
(88, 'EN', 'Assets', NULL),
(89, 'EN', 'Slider', NULL),
(90, 'EN', 'Slide', NULL),
(91, 'EN', 'New Slider', NULL),
(92, 'EN', 'ZCMS: File Upload', NULL),
(93, 'EN', 'File Manager', NULL),
(94, 'BG', 'Z-CMS Administration', NULL),
(95, 'BG', 'Change Language', NULL),
(96, 'BG', 'ZCMS: File Upload', NULL),
(97, 'BG', 'Code', NULL),
(98, 'BG', 'Title', NULL),
(99, 'BG', 'Deals', NULL),
(100, 'BG', 'Images', NULL),
(101, 'BG', 'Documents', NULL),
(102, 'BG', 'Description', NULL),
(103, 'BG', 'Save', NULL),
(104, 'BG', 'Edit/Insert', NULL),
(105, 'BG', 'You can upload', NULL),
(106, 'BG', 'Max file size', NULL),
(107, 'BG', 'Max files', NULL),
(108, 'BG', 'Edit', NULL),
(109, 'BG', 'Delete', NULL),
(110, 'BG', 'Toggle navigation', NULL),
(111, 'BG', 'Site logo', NULL),
(112, 'BG', 'Language Code', NULL),
(113, 'BG', 'Text', NULL),
(114, 'BG', 'Translation', NULL),
(115, 'BG', 'Listing', NULL),
(116, 'BG', 'Search', NULL),
(117, 'BG', 'Add New', NULL),
(118, 'BG', 'Actions', NULL),
(119, 'BG', 'Prev', NULL),
(120, 'BG', 'Next', NULL),
(121, 'BG', 'Page Id', NULL),
(122, 'BG', 'Keywords', NULL),
(123, 'BG', 'Template', NULL),
(124, 'BG', 'Layout', NULL),
(125, 'BG', 'Assets', NULL),
(126, 'BG', 'Modules', NULL),
(127, 'BG', 'Order', NULL),
(128, 'BG', 'Label', NULL),
(129, 'BG', 'Alias', NULL),
(130, 'BG', 'Parent', NULL),
(131, 'BG', 'Top', NULL),
(132, 'BG', 'Category', NULL),
(133, 'BG', 'Author', NULL),
(134, 'BG', 'Date', NULL),
(135, 'BG', 'Content', NULL),
(138, 'BG', 'Posted on ', 'Публикувано на '),
(140, 'BG', 'Slider', NULL),
(141, 'BG', 'Slide', NULL),
(142, 'BG', 'Link', NULL),
(143, 'BG', 'New Slider', NULL),
(144, 'BG', 'Image', NULL),
(145, 'BG', 'Menu', NULL),
(146, 'BG', 'Item', NULL),
(147, 'BG', 'Parent Id', NULL),
(148, 'BG', 'New menu', NULL),
(149, 'BG', 'Page', NULL),
(150, 'BG', 'None', NULL),
(151, 'BG', 'Params', NULL),
(152, 'BG', 'Showing ', 'Показват се'),
(153, 'BG', 'of ', 'от'),
(156, 'BG', 'First', NULL),
(157, 'BG', 'Last', NULL),
(158, 'BG', 'See More', 'Повече'),
(159, 'BG', 'by', 'от'),
(160, 'BG', 'in', 'в'),
(161, 'BG', 'Language', NULL),
(162, 'BG', 'Username', NULL),
(163, 'BG', 'Name', NULL),
(164, 'BG', 'Email', NULL),
(165, 'BG', 'Access', NULL),
(166, 'BG', 'Password', NULL),
(167, 'BG', ' by ', ' от '),
(168, 'BG', ' in ', ' в '),
(169, 'EN', 'See More', NULL),
(170, 'BG', 'Copy', NULL),
(171, 'BG', 'Main', NULL),
(172, 'BG', 'Alt', NULL),
(173, 'BG', 'sign in now', NULL),
(174, 'EN', 'by', NULL),
(175, 'EN', 'Showing results for', NULL),
(176, 'EN', 'There were no results found for your search.', NULL),
(177, 'EN', 'Article', NULL),
(178, 'EN', 'General', NULL),
(179, 'EN', 'Form', NULL),
(180, 'EN', 'Field', NULL),
(181, 'EN', 'New form', NULL),
(182, 'EN', 'Textarea', NULL),
(183, 'EN', 'Dropdown', NULL),
(184, 'EN', 'Options', NULL),
(185, 'EN', 'Checkbox', NULL),
(186, 'EN', 'Required', NULL),
(187, 'EN', 'No', NULL),
(188, 'EN', 'Yes', NULL),
(189, 'EN', 'Enabled', NULL),
(190, 'EN', 'Disabled', NULL),
(191, 'EN', ' Disabled', NULL),
(192, 'EN', 'The field %s is required.', 'The field %s is required.'),
(193, 'EN', 'Installation', NULL),
(194, 'EN', 'General Settings', NULL),
(195, 'EN', 'Database Settings', NULL),
(196, 'EN', 'ZCMS Settings', NULL),
(197, 'EN', 'Install', NULL),
(198, 'EN', 'Cancel', NULL),
(199, 'EN', 'Atributes', NULL),
(200, 'EN', 'Attribute alias', NULL),
(201, 'EN', 'Attribute label', NULL),
(202, 'EN', 'Add', NULL),
(203, 'EN', 'Categories', NULL),
(204, 'EN', 'Default', NULL),
(205, 'EN', 'Please save in order to view/modify the new type''s attributes', NULL),
(206, 'EN', 'Sub-categories', NULL),
(207, 'EN', 'Products', NULL),
(208, 'EN', 'There are no products in this category.', NULL),
(209, 'EN', 'Navigation', NULL),
(210, 'EN', 'You are trying to access a category that does not exist.', NULL),
(211, 'EN', 'An error occured', NULL),
(212, 'EN', 'You are trying to access a product that does not exist.', NULL),
(213, 'EN', 'Additional Info', NULL),
(214, 'EN', 'Video', NULL),
(215, 'EN', 'Meta Keywords', NULL),
(216, 'EN', 'Meta Description', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `zcms_logs`
--

CREATE TABLE IF NOT EXISTS `zcms_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=21 ;

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
(18, 'INVALID_DEV_ACTION', 2),
(19, 'MAIL_SUCCESS', 4),
(20, 'MAIL_ERROR', 2);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=39 ;

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
-- Table structure for table `zcms_menu`
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=30 ;

--
-- Dumping data for table `zcms_menu`
--

INSERT INTO `zcms_menu` (`id`, `controller`, `method`, `tail`, `order`, `access`, `parent`, `icon`) VALUES
(3, 'authenticate', 'logout', '', 999, 2, 0, 'fa-lock'),
(4, 'content', 'pages_list', '', 0, 2, 18, ''),
(6, 'menus', 'backend_menu_list', '', 0, 2, 19, ''),
(7, 'admin', 'index', '', 998, 2, 0, 'fa-user'),
(8, 'menus', 'frontend_menu_list', '', 1, 2, 19, ''),
(10, 'localisation', 'languages_list', '', 995, 2, 21, ''),
(11, 'localisation', 'translations_list', '', 996, 2, 21, ''),
(12, 'catalog', 'product_list', '', 20, 2, 20, ''),
(18, '', '', '', 0, 2, 0, 'fa-list-alt'),
(19, '', '', '', 2, 2, 0, 'fa-link'),
(20, '', '', '', 1, 1, 0, ' fa-cubes'),
(21, '', '', '', 3, 2, 0, ' fa-flag'),
(22, 'content', 'category_list', '', 1, 2, 18, ''),
(23, 'content', 'articles_list', '', 2, 2, 18, ''),
(24, 'catalog', 'category_list', '', 10, 2, 20, ''),
(25, 'content', 'news_list', '', 3, 2, 18, ''),
(26, 'content', 'widgets_list', '', 5, 2, 18, ''),
(27, 'content', 'slider_list', '', 4, 2, 18, ''),
(28, 'content', 'forms_list', '', 50, 2, 18, ''),
(29, 'catalog', 'types_list', '', 0, 2, 20, '');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=43 ;

--
-- Dumping data for table `zcms_menu_lang`
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
(38, 25, 'EN', 'News'),
(39, 26, 'EN', 'Widgets'),
(40, 27, 'EN', 'Slider'),
(41, 28, 'EN', 'Forms'),
(42, 29, 'EN', 'Types');

-- --------------------------------------------------------

--
-- Table structure for table `zcms_pages`
--

CREATE TABLE IF NOT EXISTS `zcms_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `template` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `html` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `assets` text COLLATE utf8_unicode_ci NOT NULL,
  `modules` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `page_id` (`page_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=23 ;

--
-- Dumping data for table `zcms_pages`
--

INSERT INTO `zcms_pages` (`id`, `page_id`, `template`, `html`, `assets`, `modules`) VALUES
(1, 'zcms_404', 'pages', 'single_column_layout', '', '<p>{menus/menus_recursive:top_menu,menus_recursive?menu=main}@top<br />{content/content_article:single_article,single_article?show_date=0&show_author=0&show_category=0}@pos_1_1</p>'),
(15, 'home', 'pages', 'home_page_layout', '{js:carousel-init.js}', ' {menus/menus_recursive:top_menu,menus_recursive?menu=main}@top\r\n {content/content_slider:simple_slider,simple_slider?slider=simple_slider}@slider\r\n{content/content_widgets:simple_widget,simple_widget?widget=bootstrap}@pos_2_1 \r\n{content/content_widgets:simple_widget,simple_widget?widget=bootstrap}@pos_2_2 \r\n{content/content_widgets:simple_widget,simple_widget?widget=bootstrap}@pos_2_3 \r\n{content/content_article:single_article,single_article?article=lorem_ipsum}@pos_1_1'),
(16, 'one_column_layout', 'pages', 'single_column_layout', '', '{menus/menus_recursive:top_menu,menus_recursive?menu=main}@top<br />{content/content_article:single_article,single_article}@pos_1_1'),
(17, 'two_column_layout', 'pages', 'two_column_layout', '', '<p>{menus/menus_recursive:top_menu,menus_recursive?menu=main}@top {menus/menus_recursive:side_menu,menus_recursive?menu=main}@pos_1_1 {content/content_article:category_article,category_article}@pos_1_2</p>'),
(19, 'three_column_layout', 'pages', 'three_column_layout', '', '<p>{menus/menus_recursive:top_menu,menus_recursive?menu=main}@top {content/content_widgets:simple_widget,simple_widget?widget=bootstrap}@pos_1_1 {content/content_forms:simple_form,simple_form?email_to=teodorklissarov@gmail.com&email_template=contact_us}@pos_1_2\r\n{menus/menus_recursive:side_menu,menus_recursive?menu=main}@pos_1_3</p>'),
(20, 'search', 'pages', 'single_column_layout', '', '{menus/menus_recursive:top_menu,menus_recursive?menu=main}@top\r\n{content/content_search:simple_search,simple_search}@pos_1_1'),
(21, 'cat-test-page', 'pages', 'two_column_layout', '', '{menus/menus_recursive:top_menu,menus_recursive?menu=main}@top \r\n{catalog/catalog_menu:recursive_menu,recursive_menu?category=category-1}@pos_1_1\r\n{catalog/catalog_listing:simple_listing,simple_listing?category=category-1}@pos_1_2'),
(22, 'product-test', 'pages', 'single_column_layout', '{js:product_gallery.js}', '{menus/menus_recursive:top_menu,menus_recursive?menu=main}@top \r\n{catalog/catalog_view:simple_view,simple_view}@pos_1_1');

-- --------------------------------------------------------

--
-- Table structure for table `zcms_pages_lang`
--

CREATE TABLE IF NOT EXISTS `zcms_pages_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `keywords` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_` int(11) NOT NULL,
  `lang_id` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=28 ;

--
-- Dumping data for table `zcms_pages_lang`
--

INSERT INTO `zcms_pages_lang` (`id`, `title`, `keywords`, `description`, `id_`, `lang_id`) VALUES
(1, '404 Page not found', '', '', 1, 'EN'),
(15, 'Home page', '', '', 15, 'EN'),
(16, 'One Column Layout', '', '', 16, 'EN'),
(17, 'Two Column Layout', '', '', 17, 'EN'),
(19, 'Three Column Layout', '', '', 19, 'EN'),
(20, 'Начална страница', '', '', 15, 'BG'),
(21, 'Лейаут с една колона', '', '', 16, 'BG'),
(22, 'Лейаут с три колони', '', '', 19, 'BG'),
(23, 'Лейаут с две колони', '', '', 17, 'BG'),
(24, '404 Страницата не е намерена', '', '', 1, 'BG'),
(25, 'Search page', '', '', 20, 'EN'),
(26, 'Catalog Test Page', '', '', 21, 'EN'),
(27, 'Product Test Page', '', '', 22, 'EN');

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
