-- phpMyAdmin SQL Dump
-- version 4.0.4.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 01, 2014 at 05:23 PM
-- Server version: 5.1.63-cll
-- PHP Version: 5.3.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `dildesig_mmotors`
--
CREATE DATABASE IF NOT EXISTS `dildesig_mmotors` DEFAULT CHARACTER SET cp1251 COLLATE cp1251_bulgarian_ci;
USE `dildesig_mmotors`;

-- --------------------------------------------------------

--
-- Table structure for table `html_google_maps`
--

CREATE TABLE IF NOT EXISTS `html_google_maps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lat` varchar(255) COLLATE cp1251_bulgarian_ci NOT NULL,
  `lng` varchar(255) COLLATE cp1251_bulgarian_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=cp1251 COLLATE=cp1251_bulgarian_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `html_google_maps`
--

INSERT INTO `html_google_maps` (`id`, `lat`, `lng`) VALUES
(1, '43.4183645', '24.61412919999998');

-- --------------------------------------------------------

--
-- Table structure for table `html_google_maps_lang`
--

CREATE TABLE IF NOT EXISTS `html_google_maps_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_` int(11) NOT NULL,
  `lang_id` varchar(5) COLLATE cp1251_bulgarian_ci NOT NULL,
  `marker` text COLLATE cp1251_bulgarian_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=cp1251 COLLATE=cp1251_bulgarian_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `html_google_maps_lang`
--

INSERT INTO `html_google_maps_lang` (`id`, `id_`, `lang_id`, `marker`) VALUES
(1, 1, 'BG', 'тел.064/835190, 0899919825, 0899919822 <br/> E-mail:mmotors.plasment@gmail.com,<br/> Skype:vtsenov<br/>Асен Халачев №11А<br/>5800 Плевен');

-- --------------------------------------------------------

--
-- Table structure for table `html_news`
--

CREATE TABLE IF NOT EXISTS `html_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `html_news`
--

INSERT INTO `html_news` (`id`, `date`) VALUES
(1, '2014-08-18'),
(2, '2014-07-22');

-- --------------------------------------------------------

--
-- Table structure for table `html_news_lang`
--

CREATE TABLE IF NOT EXISTS `html_news_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_` int(11) NOT NULL,
  `lang_id` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `text` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `html_news_lang`
--

INSERT INTO `html_news_lang` (`id`, `id_`, `lang_id`, `title`, `text`) VALUES
(1, 1, 'BG', 'Компактна вентилационна система  ЕКО СВЕЖЕСТ ', '<p><span lang="BG">Нов високотехнологичен продукт с функция за пречистване на въздуха&nbsp; за вашия дом или офис със следните функции:</span></p>\n<p><span lang="BG"><img style="float: left;" src="http://mmotors.eu/images/stories/458x280-eko-2.jpg" alt="" width="458" height="280" /></span>- контролиран приток на свеж въздух</p>\n<p>- <span lang="BG">контрол на влажността</span> <span lang="BG">в помещението </span></p>\n<p>- подгряване на постъпващия отвън въздух</p>\n<p>- предотвратяване на развитието на плесени и мухъл в помещенията</p>\n<p>- вграден ефективен йонизатор</p>\n<p>- успешна борба с вредни микроорганизми във въздуха</p>\n<p align="JUSTIFY"><span lang="BG">В епоха на глобализация, постоянно влошаване на екологията и стремително разрастване на градовете, човечеството </span><span lang="EN">e </span><span lang="BG">подложено на постоянна атака. По данни на СЗО (Световната здравна организация) най-голяма вреда за човешкия организъм , сред всички други въздействия на средата, нанася замърсеният въздух. </span>Публикуваният през 2013 година доклад обявява замърсения въздух за най-значима заплаха за човешкото здраве и обратно на общоприетото мнение показва, че въздухът в помещенията е по-опасен от този навън.</p>\n<p align="JUSTIFY">В помещенията се съдържат множество бактерии, вируси, спори на мухъл и други микроорганизми, вредни за хората. Някои от тези микроорганизми се развиват в следствие на неправилна климатизация, висока влажност и температура, понякога се дължи на прекалено сух въздух. В повечето случаи, опасни органични частици, съдържащи се в замърсения външен въздух, който прониква нефилтриран в нашите жилища.</p>\n<p align="JUSTIFY">Новите <span lang="BG">дограми, които </span>&bdquo;<span lang="RU">запечатва</span><span lang="BG">т&ldquo; помещенията</span> <span lang="BG">и липсата</span> <span lang="BG">на на принудителна вентилация са довели до масовото заразяване с мухъл в жилищните</span> <span lang="BG">пространства. За да се реши този проблем е създадохме компактна вентилационна система </span><span lang="EN">&bdquo;</span><span lang="BG">Еко</span> <span lang="BG">свежест&ldquo; окомплектована </span><span lang="RU">със сензор за влажност и йонизатор, ко</span><span lang="BG">я</span><span lang="RU">то автоматично поддържа микроклимат</span><span lang="BG">а</span> <span lang="BG">в помещенията и премахва застоялия въздух. Освен защита на помещенията от мухъл, "Еко </span><span lang="RU">Свежест" почиства </span><span lang="BG">входящия</span> <span lang="BG">въздух от твърди частици и миризми, убива микроби и затопля въздуха до стайна температура.</span></p>\n<p align="JUSTIFY">ММоторс предлага цяла <span lang="BG">гама</span> <span lang="BG">от компактни вентилационни устройства под общото название "Еко </span><span lang="RU">Свежест", </span><span lang="BG">с</span> <span lang="BG">различна производи</span><span lang="RU">телност и предназначение. Последните разработки на ММоторс включват устройства, работещи с </span><span lang="BG">реверсивен</span> <span lang="BG">алгоритъм </span><span lang="BG">и използват топлината на затопления въздух в помещенията за затопляне на входящия</span> <span lang="BG">студен въздух. Вентилационната система &laquo;Свежест&raquo; е преминала през многогодишни клинични изпитания в различни медицински заведения и училища. Като доказателство за това служат многобройните референции</span> <span lang="BG">и дипломи.</span></p>'),
(2, 2, 'BG', 'Новина 2', '<p>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum." "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."</p>');

-- --------------------------------------------------------

--
-- Table structure for table `html_slider`
--

CREATE TABLE IF NOT EXISTS `html_slider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `slider_id` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=10 ;

--
-- Dumping data for table `html_slider`
--

INSERT INTO `html_slider` (`id`, `url`, `image`, `slider_id`) VALUES
(1, 'http://localhost/development/work/mmotors/index.php/frontend/pages/index/page_test_new', '["electrodvigateli-7.png"]', 'home'),
(2, 'http://localhost/development/work/mmotors/index.php/frontend/pages/index/page_test_new', '["ventilatori-41.png"]', 'home'),
(3, 'http://localhost/development/work/mmotors/index.php/frontend/pages/index/page_test_new', '["electrodvigateli-5.png"]', 'home'),
(4, 'http://localhost/development/work/mmotors/index.php/frontend/pages/', '["ventilatori-2.png"]', 'fans'),
(5, 'http://localhost/development/work/mmotors/index.php/frontend/pages/', '["ventilatori-3.png"]', 'fans'),
(6, 'http://localhost/development/work/mmotors/index.php/frontend/pages/', '["ventilatori-4.png"]', 'fans'),
(7, 'http://localhost/development/work/mmotors/index.php/frontend/pages/index/mmotors_engines', '["electrodvigateli-1.png"]', 'engines'),
(8, 'http://localhost/development/work/mmotors/index.php/frontend/pages/index/mmotors_engines', '["electrodvigateli-2.png"]', 'engines'),
(9, 'http://localhost/development/work/mmotors/index.php/frontend/pages/index/mmotors_engines', '["electrodvigateli-4.png"]', 'engines');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=10 ;

--
-- Dumping data for table `html_slider_lang`
--

INSERT INTO `html_slider_lang` (`id`, `id_`, `lang_id`, `title`) VALUES
(1, 1, 'BG', '10% НАМАЛЕНИЕ <br/> при онлайн поръчка'),
(2, 2, 'BG', 'Слайд 2'),
(3, 3, 'BG', 'Слайд 3'),
(4, 4, 'BG', 'Слайд 1 Вентилатори'),
(5, 5, 'BG', 'Слайд 2 Вентилатори'),
(6, 6, 'BG', 'Слайд 3 Вентилатори'),
(7, 7, 'BG', 'Слайд 1 Двигатели'),
(8, 8, 'BG', 'Слайд 2 <br> <small> Двигатели </small>'),
(9, 9, 'BG', 'Слайд 3 Двигатели');

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE IF NOT EXISTS `product_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `image` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=15 ;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`id`, `parent_id`, `image`) VALUES
(1, 0, ''),
(2, 0, ''),
(3, 1, '[]'),
(4, 1, ''),
(5, 1, ''),
(6, 1, ''),
(8, 4, '["mm_group11.jpg"]'),
(10, 2, ''),
(11, 2, ''),
(12, 2, ''),
(13, 2, ''),
(14, 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `product_categories_lang`
--

CREATE TABLE IF NOT EXISTS `product_categories_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_` int(11) NOT NULL,
  `lang_id` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `category` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `text` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=15 ;

--
-- Dumping data for table `product_categories_lang`
--

INSERT INTO `product_categories_lang` (`id`, `id_`, `lang_id`, `category`, `text`) VALUES
(1, 1, 'BG', 'Вентилатори', ''),
(2, 2, 'BG', 'Електродвигатели', ''),
(3, 3, 'BG', 'ВЕНТИЛАТОРИ  ММОТОРС', '<table style="height: 666px;" width="681">\n<tbody>\n<tr>\n<td>\n<p style="text-align: justify;">&nbsp;&nbsp;&nbsp;&nbsp; <strong>ММОТОРС</strong> е единственият български производител на вентилатори за баня. Освен за местния пазар фирмата доставя <strong>вентилатори за баня</strong> за страни от ЕС, Русия и Близкия изток. Всички наши изделия се призвеждат от висококачествени материали при спазване на&nbsp;стандартите на ЕС и с грижа за&nbsp;здравето и комфорта на нашите&nbsp;клиенти.&nbsp;&nbsp;</p>\n<p style="text-align: justify;">Предлагаме <strong>8 серии вентилатори за баня&nbsp;</strong>за мрежово напрежение 220V&nbsp;или 12V променливо напрежение,&nbsp;покриващи всички ценови категории, изработени от висококачествени материали, с модерен дизайн - произвеждани в различни цветове и модели:</p>\n<p style="text-align: justify;" align="justify">&bull; <strong>Серия ММ</strong> - вентилатори за баня с &Oslash;100мм, &Oslash;120мм и &Oslash;150мм с висок дебит и елегантен дизайн, чиято технология на производство осигурява до 30 000 часа надеждна и икономична работа. Серията е изключително популярна и вече 10 години е стандарт за качество сред потребителите на среден клас вентилатори.</p>\n<p style="text-align: justify;" align="justify">&bull; <strong>Серии ОК и МТ</strong> &ndash; вентилатори за баня на конкурентни цени - достъпни за всеки потребител, но същевременно с отлично качество и красив дизайн;</p>\n<p style="text-align: justify;" align="justify">&bull; <strong>Серия GOLD</strong> - вентилатори за баня с повишен дебит, покриващи най-високите изисквания за качество. В тази серия са включени вентилатори с датчици и таймери, компактни вентилатори с късо тяло, вентилатори с безшумен режим на работа.</p>\n<p style="text-align: justify;" align="justify">&bull; <strong>Серия LUX</strong> &ndash; вентилатори за баня с оригинален дизайн за взискателни клиенти;</p>\n<p style="text-align: justify;" align="justify">Всички горепосочени серии вентилатори могат да се изработят с <strong>таймер, датчик за влага, светлинен датчик, сензорен прекъсвач</strong>.</p>\n<p style="text-align: justify;" align="justify">&bull;<strong> Вентилатори за сауна и парна баня</strong>: - високотемпературни и устойчиви на висок % влага. Могат да се предлагат заедно с художествено оформени решетки с дърворезба.</p>\n<p style="text-align: justify;"><strong>ММОТОРС</strong> е&nbsp;традиционен&nbsp;производител на аксиални вентилатори&nbsp; &nbsp;със&nbsp;широко приложение.&nbsp; <strong>Аксиалните вентилатори</strong> с марката <strong>ММОТОРС</strong> са синоним&nbsp;на&nbsp;висококачество и надеждност и се използават десетилетя&nbsp;в системи на АЕЦ КОЗЛОДУЙ , ТЕЦ МАРИЦА ИЗТОК, &nbsp;и др&nbsp;</p>\n<p style="text-align: justify;"><strong>Каналните</strong> вентилатори с марката <strong>ММОТОРС&nbsp;</strong>намират приложение във вентилационни и климатични системи, вкл. в отоплителни инсталации предназначени за работа&nbsp;при високи температури на въздуха&nbsp;</p>\n<p style="text-align: justify;">Водещ продукт на компанията с признания от международни изложения е компактната вентилационна система ЕКОСВЕЖЕСТ. Присъствието на този уред във Вашия дом или офис чувствително подобрява качеството на живот и оказва трайно благоприятно влияние върху&nbsp;микроклимата на помещенията и здравето&nbsp;Ви.&nbsp;</p>\n<p style="text-align: justify;">Когато избирате <strong>уреди с марката ММОТОРС&nbsp;&nbsp;</strong>Вие получавате повече качество и&nbsp;повече технология и всичко това на разумна съобразена с българските условия цена.</p>\n</td>\n<td>\n<p><img style="margin-right: auto; margin-left: auto; display: block;" src="http://mmotors.eu/images/stories/va_group1.jpg" alt="" width="150" height="150" /><span style="font-family: ''Calibri''; font-size: 11pt;"><img style="margin-right: auto; margin-left: auto; display: block;" src="http://mmotors.eu/images/stories/mm_group11.jpg" alt="" width="150" height="150" /></span><img style="margin-right: auto; margin-left: auto; display: block;" src="http://mmotors.eu/images/stories/gallery_product_43-1.jpg" alt="" width="150" height="150" /></p>\n<p><img style="margin-right: auto; margin-left: auto; display: block;" src="http://mmotors.eu/images/stories/gallery_product_29-1.jpg" alt="" width="150" height="150" /><img src="http://mmotors.eu/images/stories/gallery_product_104.jpg" alt="" width="145" height="145" /></p>\n</td>\n</tr>\n</tbody>\n</table>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p class="Normal">&nbsp;</p>\n<p class="Normal">&nbsp;</p>'),
(4, 4, 'BG', 'Вентилатори за баня ММ', '<p><strong>Серия ММ</strong> &ndash;вентилатори за баня на ф100мм, 120мм и 150мм с висок дебит и елегантен дизайн, произведени по технология осигуряваща до 30 000 часа надеждна и икономична работа. Серията е изключително популярна и вече 10 години е стандарт за качество сред потребителите на този клас вентилатори.&nbsp; Всички вентилатори в тази серия&nbsp;са с&nbsp;3 години пълна гаранция. Поддържана директно от Българския производител.<img style="float: left; margin-right: 5px; margin-left: 5px;" src="http://mmotors.eu/images/stories/mm_group11.jpg" alt="" width="300" height="300" /></p>\n<p align="justify"><strong>Възможни опции за серията:</strong></p>\n<p align="justify">&nbsp; - изпълнение за 12V променливо напрежение</p>\n<p align="justify">&nbsp; - високотемпературно изпълнение: Сауна и парня баня</p>\n<p>&nbsp; - цветно изпълнение: ИНОКС, ЧЕРЕН, БЕЖОВ</p>\n<p>&nbsp;&nbsp; - възможно светещо изпълнение: в серия LIGHT</p>\n<p><strong>Възможни допълнителни екстри</strong>:</p>\n<p>Т- с таймер . Вентилаторът с таймер се включва от&nbsp; електрическия ключ, а вграденият таймер осигурява работа още 5 мин. след изключване на ключа</p>\n<p>LRT &ndash; с таймер и светлинен датчик. Включва се при&nbsp; осветяване на помещението, а вграденият таймер осигурява работа още 5 минути след като помещението се затъмни.</p>\n<p>THCS-с таймер и датчик за влага . Вентилаторът се включва когато влагата в помещението надвиши 70%, като вградения таймер осигурява още 5 мин. работа след понижаване на влажността под 70%</p>'),
(5, 5, 'BG', 'Вентилатори за камини', ''),
(6, 6, 'BG', 'Прозоречни вентилатори', ''),
(8, 8, 'BG', 'Серия ММ стандарт', '<p><strong>Серия ММ</strong> &ndash;вентилатори за баня на ф100мм, 120мм и 150мм с висок дебит и елегантен дизайн, произведени по технология осигуряваща до 30 000 часа надеждна и икономична работа. Серията е изключително популярна и вече 10 години е стандарт за качество сред потребителите на този клас вентилатори.&nbsp; Всички вентилатори в тази серия&nbsp;са с&nbsp;3 години пълна гаранция. Поддържана директно от Българския производител.<img style="float: left; margin-right: 5px; margin-left: 5px;" src="http://mmotors.eu/images/stories/mm_group11.jpg" alt="" width="300" height="300" /></p>\n<p align="justify"><strong>Възможни опции за серията:</strong></p>\n<p align="justify">&nbsp; - изпълнение за 12V променливо напрежение</p>\n<p align="justify">&nbsp; - високотемпературно изпълнение: Сауна и парня баня</p>\n<p>&nbsp; - цветно изпълнение: ИНОКС, ЧЕРЕН, БЕЖОВ</p>\n<p>&nbsp;&nbsp; - възможно светещо изпълнение: в серия LIGHT</p>\n<p><strong>Възможни допълнителни екстри</strong>:</p>\n<p>Т- с таймер . Вентилаторът с таймер се включва от&nbsp; електрическия ключ, а вграденият таймер осигурява работа още 5 мин. след изключване на ключа</p>\n<p>LRT &ndash; с таймер и светлинен датчик. Включва се при&nbsp; осветяване на помещението, а вграденият таймер осигурява работа още 5 минути след като помещението се затъмни.</p>\n<p>THCS-с таймер и датчик за влага . Вентилаторът се включва когато влагата в помещението надвиши 70%, като вградения таймер осигурява още 5 мин. работа след понижаване на влажността под 70%</p>'),
(10, 10, 'BG', 'Асинхронни', ''),
(11, 11, 'BG', 'С електромагнитна спирачка', ''),
(12, 12, 'BG', 'Ефективност IE2', ''),
(13, 13, 'BG', 'Ефективност IE3', ''),
(14, 14, 'BG', 'Проточни системи', '');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `product_docs`
--

INSERT INTO `product_docs` (`id`, `rel_id`, `file`) VALUES
(2, 7, 'MM_Instructions-UK.pdf'),
(3, 8, 'MM_Instructions-UK1.pdf'),
(4, 12, 'mm.pdf'),
(5, 12, 'END_deklaraciq_za_saotvetstvie_ASKANIA.doc');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `product_docs_lang`
--

INSERT INTO `product_docs_lang` (`id`, `id_`, `lang_id`, `title`) VALUES
(1, 1, 'BG', 'Файл 1'),
(2, 2, 'BG', 'Изтегли инструкции'),
(3, 3, 'BG', 'Изтегли инструкции'),
(4, 4, 'BG', 'Каталог на вентилатори за баня серия ММ'),
(5, 5, 'BG', 'Декларация за съответствие');

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
(1, 1, 'BG', 'Избор на вентилатор'),
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=38 ;

--
-- Dumping data for table `product_filter_values`
--

INSERT INTO `product_filter_values` (`id`, `filter_id`) VALUES
(1, 'section'),
(2, 'section'),
(3, 'section'),
(4, 'section'),
(6, 'fi'),
(7, 'fi'),
(8, 'fi'),
(9, 'fi'),
(10, 'fi'),
(11, 'fi'),
(12, 'fi'),
(13, 'fi'),
(14, 'fi'),
(15, 'fi'),
(16, 'use'),
(17, 'use'),
(18, 'use'),
(19, 'use'),
(20, 'color'),
(21, 'color'),
(22, 'color'),
(23, 'color'),
(24, 'color'),
(25, 'led'),
(26, 'fi'),
(27, 'color'),
(28, 'led'),
(29, 'led'),
(30, 'led'),
(31, 'led'),
(32, 'timers_and_sensors'),
(33, 'timers_and_sensors'),
(34, 'timers_and_sensors'),
(35, 'timers_and_sensors'),
(36, 'timers_and_sensors'),
(37, 'other');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=38 ;

--
-- Dumping data for table `product_filter_values_lang`
--

INSERT INTO `product_filter_values_lang` (`id`, `id_`, `lang_id`, `value`) VALUES
(1, 1, 'BG', 'Битови вентилатори'),
(2, 2, 'BG', 'Канални вентилатори'),
(3, 3, 'BG', 'Аксиални вентилатори'),
(4, 4, 'BG', 'Проточни системи'),
(6, 6, 'BG', '90 mm'),
(7, 7, 'BG', '100 mm'),
(8, 8, 'BG', '110 mm'),
(9, 9, 'BG', '120 mm'),
(10, 10, 'BG', '135 mm'),
(11, 11, 'BG', '150 mm'),
(12, 12, 'BG', '200 mm'),
(13, 13, 'BG', '250 mm'),
(14, 14, 'BG', '300 mm'),
(15, 15, 'BG', '350 mm'),
(16, 16, 'BG', 'Баня/WC'),
(17, 17, 'BG', 'Сауна и Парна баня'),
(18, 18, 'BG', 'Прозеречен'),
(19, 19, 'BG', 'Универсален'),
(20, 20, 'BG', 'Бял'),
(21, 21, 'BG', 'Бежов'),
(22, 22, 'BG', 'Инокс'),
(23, 23, 'BG', 'Черен'),
(24, 24, 'BG', 'Инокс/Черен'),
(25, 25, 'BG', 'LED синьо'),
(26, 26, 'BG', '400 mm'),
(27, 27, 'BG', 'Хром'),
(28, 28, 'BG', 'LED зелено'),
(29, 29, 'BG', 'LED жълто'),
(30, 30, 'BG', 'LED червено'),
(31, 31, 'BG', 'LED бяло'),
(32, 32, 'BG', 'Таймер'),
(33, 33, 'BG', 'Таймер и датчик за влага'),
(34, 34, 'BG', 'Таймер и светлинен датчик'),
(35, 35, 'BG', 'Таймер и Кордов сензор'),
(36, 36, 'BG', 'Таймер и фотодатчик'),
(37, 37, 'BG', 'Реверсивен');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=37 ;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `rel_id`, `file`, `main`) VALUES
(12, 7, 'MM120-Round-Chrome-light-blue1.jpg', 1),
(13, 7, 'MM120-Round2.jpg', 0),
(14, 8, 'MM120-Square.jpg', 1),
(18, 10, 'mm100_cream.jpg', 1),
(19, 10, 'mm100_inox1.jpg', 0),
(20, 10, 'MM-100-round1.jpg', 0),
(27, 15, 'MM-100-round2.jpg', 1),
(28, 15, 'MM100-Round-Wave-light-series-blue.jpg', 0),
(29, 15, 'MM-100-Square.jpg', 0),
(30, 12, 'MM100-Persp-550x550-web.jpg', 1),
(31, 12, 'MM100-beck-550x550-web.jpg', 0),
(32, 12, 'MM100-550x550-web.jpg', 0),
(34, 18, 'MM100-550x550-web1.jpg', 0),
(35, 18, 'MM100-beck-550x550-web1.jpg', 0),
(36, 18, 'MM100-Persp-550x550-web1.jpg', 1);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=17 ;

--
-- Dumping data for table `product_images_lang`
--

INSERT INTO `product_images_lang` (`id`, `id_`, `lang_id`, `title`, `alt`) VALUES
(3, 3, 'BG', '', ''),
(4, 4, 'BG', '', ''),
(5, 5, 'BG', '', ''),
(7, 12, 'BG', '', ''),
(8, 14, 'BG', '', ''),
(9, 17, 'BG', '', ''),
(10, 18, 'BG', '', ''),
(11, 21, 'BG', '', ''),
(12, 23, 'BG', '', ''),
(14, 27, 'BG', '', ''),
(15, 30, 'BG', '', ''),
(16, 36, 'BG', '', '');

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
  `shop_url` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=19 ;

--
-- Dumping data for table `product_products`
--

INSERT INTO `product_products` (`id`, `category`, `filters`, `code`, `schematic`, `shop_url`) VALUES
(7, 8, '{"section":"","fi":"","valve":"0","high_temperature":"0","use":"","color":"","led":"","timers_and_sensors":"","twostepped":"0","other":"","termal_sensor":"0","centrifugal":"0","type_va":"0","type_pvo":"0"}', 'MM 120 - Кръгъл', '["Dimension_MM-120_Round.jpg"]', ''),
(8, 8, '{"section":"","fi":"","valve":"0","high_temperature":"0","use":"","color":"","led":"","timers_and_sensors":"","twostepped":"0","other":"","termal_sensor":"0","centrifugal":"0","type_va":"0","type_pvo":"0"}', 'MM 120 - Квадратен', '["Dimension_MM-120_Square.jpg"]', ''),
(10, 0, '{"section":"1","fi":"","valve":"0","high_temperature":"0","use":"","color":"","led":"","timers_and_sensors":"","twostepped":"0","other":"","termal_sensor":"0","centrifugal":"0","type_va":"0","type_pvo":"0"}', 'ММ-LRT', '["Dimension_MM-100_GOLD_Square.jpg"]', ''),
(12, 8, '{"section":"1","fi":"7","valve":"1","high_temperature":"0","use":"16","color":"20","led":"","timers_and_sensors":"","twostepped":"0","other":"","termal_sensor":"0","centrifugal":"0","type_va":"0","type_pvo":"0"}', '1047', '["Dimension_MM-100_GOLD_Square-600x439.jpg"]', 'http://dildesign-studio.com/dev/mmotors-site/index.php/frontend/pages/index/mmotors_fans_sauna?id=7'),
(15, 0, '{"section":"1","fi":"","valve":"0","high_temperature":"0","use":"","color":"","led":"","timers_and_sensors":"","twostepped":"0","other":"","termal_sensor":"0","centrifugal":"0","type_va":"0","type_pvo":"0"}', 'MM-H', '["Dimension_MM-100_GOLD_Round1.jpg"]', ''),
(18, 8, '{"section":"1","fi":"7","valve":"0","high_temperature":"0","use":"16","color":"20","led":"","timers_and_sensors":"","twostepped":"0","other":"","termal_sensor":"0","centrifugal":"0","type_va":"0","type_pvo":"0"}', '0026', '', 'http://mmotors.eu/index.php?page=shop.product_details&flypage=flypage.tpl&product_id=51&category_id=7&option=com_virtuemart&Itemid=81');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=20 ;

--
-- Dumping data for table `product_products_lang`
--

INSERT INTO `product_products_lang` (`id`, `id_`, `lang_id`, `title`, `short_description`, `description`, `technical_info`) VALUES
(8, 7, 'BG', 'Вентилатор за сауна MM 120 - Кръгъл', '<p>При ползване на сауна или парна баня, в резултат на обилно изпотяване, както и от процеса на топлинно излъчване, във вътрешността на помещението се отделят токсини, флуиди и бактерии, които влияят негативно на дихателната система на човека.</p>\n<p>&nbsp;</p>\n<p>В този аспект вентилацията в сауната е важен фактор за подобряване на комфорта при ползването ѝ, освежава въздуха, намалява риска от увреждане на белите дробове и сърдечно-съдовата система.</p>\n<p>Вентилацията на сауната ускорява собствената лечебна активност на тялото и способността му да се възстановява.</p>', '<p>При ползване на сауна или парна баня, в резултат на обилно изпотяване, както и от процеса на топлинно излъчване, във вътрешността на помещението се отделят токсини, флуиди и бактерии, които влияят негативно на дихателната система на човека.</p>\n<p>&nbsp;</p>\n<p>В този аспект вентилацията в сауната е важен фактор за подобряване на комфорта при ползването ѝ, освежава въздуха, намалява риска от увреждане на белите дробове и сърдечно-съдовата система.</p>\n<p>Вентилацията на сауната ускорява собствената лечебна активност на тялото и способността му да се възстановява.</p>\n<p>&nbsp;</p>\n<p>Във връзка с това, ние разработихме високотемпературен вентилатор специално за сауна и баня, който работи при температура до 140&deg;С и влажност до 100 %.</p>\n<p><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong></p>\n<p>В аспиратора е вграден безшумен електродвигател с търкалящи двойнокапсуловани, високотемпературни NSK или SKF лагери, които гарантират 30 000 ч. безотказна работа на апарата при монтаж в хоризонтално</p>\n<p>или вертикално положение.</p>\n<p>&nbsp;</p>\n<p>Предвидена е затваряща клапа, възпрепятстваща навлизането на студен въздух при неработещ апарат.</p>\n<p>Корпусът, перката и клапата са изработени от стъклонапълнен полиамид и издържат на температра до 200&deg;С, което позволява монтаж на вентилатора непосредствено в помещението.</p>', '<table class="table-striped" style="height: 192px;" width="634">\n<tbody>\n<tr>\n<td>\n<p><strong>Модел</strong></p>\n</td>\n<td>\n<p><strong>Мрежово напрежение</strong></p>\n<p style="text-align: center;"><strong>&nbsp;</strong></p>\n</td>\n<td>\n<p><strong>Мощност</strong></p>\n<p style="text-align: center;"><strong>&nbsp;</strong></p>\n</td>\n<td>\n<p><strong>Ток</strong></p>\n<p style="text-align: center;"><strong>&nbsp;</strong></p>\n</td>\n<td>\n<p><strong>Дебит</strong></p>\n<p style="text-align: center;"><strong>&nbsp;</strong></p>\n</td>\n<td>\n<p><strong>Статичноналягане</strong></p>\n<p style="text-align: center;"><strong>&nbsp;</strong></p>\n</td>\n<td>\n<p><strong>Макс. работна t</strong></p>\n<p><strong>&nbsp;</strong></p>\n</td>\n<td>\n<p><strong>Ниво на шум*</strong></p>\n<p style="text-align: center;"><strong>&nbsp;</strong></p>\n</td>\n<td>\n<p><strong>Тегло</strong></p>\n<p style="text-align: center;"><strong>&nbsp;</strong></p>\n</td>\n<td>\n<p><strong>IP</strong></p>\n</td>\n</tr>\n<tr>\n<td>\n<p><strong>&nbsp;</strong></p>\n</td>\n<td style="text-align: center;">\n<p><strong>&nbsp;V/Hz</strong></p>\n</td>\n<td style="text-align: center;">\n<p><strong>&nbsp;W</strong></p>\n</td>\n<td style="text-align: center;">\n<p><strong>A</strong></p>\n</td>\n<td style="text-align: center;">\n<p><strong>&nbsp;m<sup>3</sup>/h</strong></p>\n</td>\n<td style="text-align: center;">\n<p><strong>&nbsp;Pa</strong></p>\n</td>\n<td style="text-align: center;">\n<p><strong>&nbsp;<sup>o</sup> C &nbsp; &nbsp; &nbsp;&nbsp; <sup>o</sup>F</strong></p>\n</td>\n<td style="text-align: center;">\n<p><strong>&nbsp;dB</strong></p>\n</td>\n<td style="text-align: center;">&nbsp;<strong>kg</strong></td>\n<td>&nbsp;</td>\n</tr>\n<tr>\n<td>\n<p>&nbsp;</p>\n</td>\n<td>\n<p>&nbsp;</p>\n</td>\n<td>\n<p>&nbsp;</p>\n</td>\n<td>\n<p>&nbsp;</p>\n</td>\n<td>\n<p>&nbsp;</p>\n</td>\n<td>\n<p>&nbsp;</p>\n</td>\n<td>\n<p>&nbsp;</p>\n</td>\n<td>\n<p>&nbsp;</p>\n</td>\n<td>\n<p>&nbsp;</p>\n</td>\n<td>\n<p>&nbsp;</p>\n</td>\n</tr>\n</tbody>\n</table>\n<p>*Нивото на шум е измерено лабораторно при следните условия: .......................................</p>\n<p><strong>** Примерна таблица</strong></p>'),
(9, 8, 'BG', 'Вентилатор за сауна MM 120 - Квадратен', '<p>При ползване на сауна или парна баня, в резултат на обилно изпотяване, както и от процеса на топлинно излъчване, във вътрешността на помещението се отделят токсини, флуиди и бактерии, които влияят негативно на дихателната система на човека.</p>\n<p>&nbsp;</p>\n<p>В този аспект вентилацията в сауната е важен фактор за подобряване на комфорта при ползването ѝ, освежава въздуха, намалява риска от увреждане на белите дробове и сърдечно-съдовата система.</p>', '<p>При ползване на сауна или парна баня, в резултат на обилно изпотяване, както и от процеса на топлинно излъчване, във вътрешността на помещението се отделят токсини, флуиди и бактерии, които влияят негативно на дихателната система на човека.</p>\n<p>&nbsp;</p>\n<p>В този аспект вентилацията в сауната е важен фактор за подобряване на комфорта при ползването ѝ, освежава въздуха, намалява риска от увреждане на белите дробове и сърдечно-съдовата система.</p>\n<p>Вентилацията на сауната ускорява собствената лечебна активност на тялото и способността му да се възстановява.</p>\n<p>&nbsp;</p>\n<p>Във връзка с това, ние разработихме високотемпературен вентилатор специално за сауна и баня, който работи при температура до 140&deg;С и влажност до 100 %.</p>\n<p><strong>&nbsp;</strong></p>\n<p><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong></p>\n<p>В аспиратора е вграден безшумен електродвигател с търкалящи двойнокапсуловани, високотемпературни NSK или SKF лагери, които гарантират 30 000 ч. безотказна работа на апарата при монтаж в хоризонтално</p>\n<p>или вертикално положение.</p>\n<p>&nbsp;</p>\n<p>Предвидена е затваряща клапа, възпрепятстваща навлизането на студен въздух при неработещ апарат.</p>\n<p>Корпусът, перката и клапата са изработени от стъклонапълнен полиамид и издържат на температра до 200&deg;С, което позволява монтаж на вентилатора непосредствено в помещението.</p>', '');
INSERT INTO `product_products_lang` (`id`, `id_`, `lang_id`, `title`, `short_description`, `description`, `technical_info`) VALUES
(11, 10, 'BG', 'Вентилатор ММ-LRT Със светлинно реле и таймер', '<p>Включва се при осветяване на помещението, а вграденият таймер осигурява работа още 5 минути след като помещението се затъмни.&nbsp;&nbsp;&nbsp;&nbsp;</p>', '<p><strong>СЕРИЯ </strong><strong>MM</strong></p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>\n<p>Предназначени са за продължителна или прекъсната вентилация</p>\n<p>на малки и средни битови, санитарни и търговски помещения.</p>\n<p>Монтират се на стена, таван, окачен таван, вътрешни стени.</p>\n<p>Могат да се използуват между съседни помещения като топлообменници.</p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>\n<p>Има модели за директно изхвърляне навън в атмосферата назамърсен въздух или вкарване отвън навътре на свеж.</p>\n<p><strong> Модификациите са ММ 100, ММ 120 и ММ 150.</strong></p>\n<p>Аспираторите от серия ММ се предлагат с и без автоматично затваряща се клапа.</p>\n<p>Във всички модели аспиратори от серията ММ, са вградени безшумни електродвигатели с търкалящи, двойнокапсуловани лагери, които гарантират</p>\n<p>30 000 часа безотказна работа на апарата при монтаж в хоризонтално или вертикално положение.</p>\n<p>Корпусът, перката и клапата са изработени от висококачествена пластмаса.</p>\n<p>Корпусът на електродвигателя се изработва от алуминиева сплав или от топлоустойчив материал, гарантиращ добротоохлаждане и повишена пожаробезопасност.</p>\n<p>Степента на защита IP X4 позволява аспиратора да функционира при висока влажност и в агресивни среди.</p>\n<p>&nbsp;</p>\n<p><strong>ММ-</strong><strong>LRT / Със светлинно реле и таймер&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong></p>\n<p>Включва се при осветяване на помещението, а вграденият таймер осигурява работа още 5 минути след като помещението се затъмни.&nbsp;&nbsp;&nbsp;&nbsp;</p>\n<p>&nbsp;</p>\n<p><strong>ВАРИАЦИИ</strong></p>\n<p>&bull; Всички модели от серията ММ GOLD могат да бъдат изпълнени в двускоростен</p>\n<p>режим на работа.</p>\n<p>&bull; Вентилаторите от серията ММ се предлагат в следните цветове: бял, инокс,</p>\n<p>хром, черен, крем и комбинация от тези цветове.</p>\n<p>&bull; По желание на клиента, вентилаторите могат да бъдат изпълнени в различни RAL.</p>\n<p>цветове.</p>\n<p><strong>&nbsp;</strong></p>\n<p><strong>Всички вентилатори могат да бъдат произведени с честота 60 Hz, като останалите характеристики не биха се променили съществено.</strong></p>\n<p><strong>ВНИМАНИЕ: Температурата на околната среда в която работят аспираторите не трябва да достига стойност над 80 С!</strong></p>', '<p>&nbsp;</p>\n<div id="mcePasteBin" style="position: absolute; top: 0px; left: 0; background: red; width: 1px; height: 1px; overflow: hidden;" contenteditable="false">\n<div contenteditable="true"><!--[if gte mso 9]><xml>\n <o:OfficeDocumentSettings>\n  <o:AllowPNG/>\n </o:OfficeDocumentSettings>\n</xml><![endif]-->\n<p class="MsoNormal" style="margin-bottom: .0001pt;"><strong style="mso-bidi-font-weight: normal;">ММ-</strong><strong style="mso-bidi-font-weight: normal;"><span lang="EN-US" style="mso-ansi-language: EN-US;">LRT<span style="mso-spacerun: yes;">&nbsp; </span>/ Със светлинно реле и таймер</span><span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></strong></p>\n<span lang="EN-US" style="font-size: 11.0pt; line-height: 115%; font-family: ''Calibri'',''sans-serif''; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: Calibri; mso-fareast-theme-font: minor-latin; mso-hansi-theme-font: minor-latin; mso-bidi-font-family: ''Times New Roman''; mso-bidi-theme-font: minor-bidi; mso-ansi-language: EN-US; mso-fareast-language: EN-US; mso-bidi-language: AR-SA;">Включва се при<span style="mso-spacerun: yes;">&nbsp; </span>осветяване на<span style="mso-spacerun: yes;">&nbsp; </span>помещението, а вграденият таймер<span style="mso-spacerun: yes;">&nbsp; </span>осигурява работа още 5 минути след<span style="mso-spacerun: yes;">&nbsp; </span>като помещението се затъмни.<span style="mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><!--[if gte mso 9]><xml>\n <w:WordDocument>\n  <w:View>Normal</w:View>\n  <w:Zoom>0</w:Zoom>\n  <w:TrackMoves/>\n  <w:TrackFormatting/>\n  <w:HyphenationZone>21</w:HyphenationZone>\n  <w:PunctuationKerning/>\n  <w:ValidateAgainstSchemas/>\n  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>\n  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>\n  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>\n  <w:DoNotPromoteQF/>\n  <w:LidThemeOther>BG</w:LidThemeOther>\n  <w:LidThemeAsian>X-NONE</w:LidThemeAsian>\n  <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>\n  <w:Compatibility>\n   <w:BreakWrappedTables/>\n   <w:SnapToGridInCell/>\n   <w:WrapTextWithPunct/>\n   <w:UseAsianBreakRules/>\n   <w:DontGrowAutofit/>\n   <w:SplitPgBreakAndParaMark/>\n   <w:EnableOpenTypeKerning/>\n   <w:DontFlipMirrorIndents/>\n   <w:OverrideTableStyleHps/>\n  </w:Compatibility>\n  <m:mathPr>\n   <m:mathFont m:val="Cambria Math"/>\n   <m:brkBin m:val="before"/>\n   <m:brkBinSub m:val="--"/>\n   <m:smallFrac m:val="off"/>\n   <m:dispDef/>\n   <m:lMargin m:val="0"/>\n   <m:rMargin m:val="0"/>\n   <m:defJc m:val="centerGroup"/>\n   <m:wrapIndent m:val="1440"/>\n   <m:intLim m:val="subSup"/>\n   <m:naryLim m:val="undOvr"/>\n  </m:mathPr></w:WordDocument>\n</xml><![endif]--><!--[if gte mso 9]><xml>\n <w:LatentStyles DefLockedState="false" DefUnhideWhenUsed="false"\n  DefSemiHidden="false" DefQFormat="false" DefPriority="99"\n  LatentStyleCount="371">\n  <w:LsdException Locked="false" Priority="0" QFormat="true" Name="Normal"/>\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 1"/>\n  <w:LsdException Locked="false" Priority="9" SemiHidden="true"\n   UnhideWhenUsed="true" QFormat="true" Name="heading 2"/>\n  <w:LsdException Locked="false" Priority="9" SemiHidden="true"\n   UnhideWhenUsed="true" QFormat="true" Name="heading 3"/>\n  <w:LsdException Locked="false" Priority="9" SemiHidden="true"\n   UnhideWhenUsed="true" QFormat="true" Name="heading 4"/>\n  <w:LsdException Locked="false" Priority="9" SemiHidden="true"\n   UnhideWhenUsed="true" QFormat="true" Name="heading 5"/>\n  <w:LsdException Locked="false" Priority="9" SemiHidden="true"\n   UnhideWhenUsed="true" QFormat="true" Name="heading 6"/>\n  <w:LsdException Locked="false" Priority="9" SemiHidden="true"\n   UnhideWhenUsed="true" QFormat="true" Name="heading 7"/>\n  <w:LsdException Locked="false" Priority="9" SemiHidden="true"\n   UnhideWhenUsed="true" QFormat="true" Name="heading 8"/>\n  <w:LsdException Locked="false" Priority="9" SemiHidden="true"\n   UnhideWhenUsed="true" QFormat="true" Name="heading 9"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="index 1"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="index 2"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="index 3"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="index 4"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="index 5"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="index 6"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="index 7"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="index 8"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="index 9"/>\n  <w:LsdException Locked="false" Priority="39" SemiHidden="true"\n   UnhideWhenUsed="true" Name="toc 1"/>\n  <w:LsdException Locked="false" Priority="39" SemiHidden="true"\n   UnhideWhenUsed="true" Name="toc 2"/>\n  <w:LsdException Locked="false" Priority="39" SemiHidden="true"\n   UnhideWhenUsed="true" Name="toc 3"/>\n  <w:LsdException Locked="false" Priority="39" SemiHidden="true"\n   UnhideWhenUsed="true" Name="toc 4"/>\n  <w:LsdException Locked="false" Priority="39" SemiHidden="true"\n   UnhideWhenUsed="true" Name="toc 5"/>\n  <w:LsdException Locked="false" Priority="39" SemiHidden="true"\n   UnhideWhenUsed="true" Name="toc 6"/>\n  <w:LsdException Locked="false" Priority="39" SemiHidden="true"\n   UnhideWhenUsed="true" Name="toc 7"/>\n  <w:LsdException Locked="false" Priority="39" SemiHidden="true"\n   UnhideWhenUsed="true" Name="toc 8"/>\n  <w:LsdException Locked="false" Priority="39" SemiHidden="true"\n   UnhideWhenUsed="true" Name="toc 9"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="Normal Indent"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="footnote text"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="annotation text"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="header"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="footer"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="index heading"/>\n  <w:LsdException Locked="false" Priority="35" SemiHidden="true"\n   UnhideWhenUsed="true" QFormat="true" Name="caption"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="table of figures"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="envelope address"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="envelope return"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="footnote reference"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="annotation reference"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="line number"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="page number"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="endnote reference"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="endnote text"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="table of authorities"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="macro"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="toa heading"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="List"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="List Bullet"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="List Number"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="List 2"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="List 3"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="List 4"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="List 5"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="List Bullet 2"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="List Bullet 3"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="List Bullet 4"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="List Bullet 5"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="List Number 2"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="List Number 3"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="List Number 4"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="List Number 5"/>\n  <w:LsdException Locked="false" Priority="10" QFormat="true" Name="Title"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="Closing"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="Signature"/>\n  <w:LsdException Locked="false" Priority="1" SemiHidden="true"\n   UnhideWhenUsed="true" Name="Default Paragraph Font"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="Body Text"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="Body Text Indent"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="List Continue"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="List Continue 2"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="List Continue 3"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="List Continue 4"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="List Continue 5"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="Message Header"/>\n  <w:LsdException Locked="false" Priority="11" QFormat="true" Name="Subtitle"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="Salutation"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="Date"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="Body Text First Indent"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="Body Text First Indent 2"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="Note Heading"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="Body Text 2"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="Body Text 3"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="Body Text Indent 2"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="Body Text Indent 3"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="Block Text"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="Hyperlink"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="FollowedHyperlink"/>\n  <w:LsdException Locked="false" Priority="22" QFormat="true" Name="Strong"/>\n  <w:LsdException Locked="false" Priority="20" QFormat="true" Name="Emphasis"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="Document Map"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="Plain Text"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="E-mail Signature"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="HTML Top of Form"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="HTML Bottom of Form"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="Normal (Web)"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="HTML Acronym"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="HTML Address"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="HTML Cite"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="HTML Code"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="HTML Definition"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="HTML Keyboard"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="HTML Preformatted"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="HTML Sample"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="HTML Typewriter"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="HTML Variable"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="Normal Table"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="annotation subject"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="No List"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="Outline List 1"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="Outline List 2"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="Outline List 3"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="Table Simple 1"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="Table Simple 2"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="Table Simple 3"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="Table Classic 1"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="Table Classic 2"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="Table Classic 3"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="Table Classic 4"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="Table Colorful 1"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="Table Colorful 2"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="Table Colorful 3"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="Table Columns 1"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="Table Columns 2"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="Table Columns 3"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="Table Columns 4"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="Table Columns 5"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="Table Grid 1"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="Table Grid 2"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="Table Grid 3"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="Table Grid 4"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="Table Grid 5"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="Table Grid 6"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="Table Grid 7"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="Table Grid 8"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="Table List 1"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="Table List 2"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="Table List 3"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="Table List 4"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="Table List 5"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="Table List 6"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="Table List 7"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="Table List 8"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="Table 3D effects 1"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="Table 3D effects 2"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="Table 3D effects 3"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="Table Contemporary"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="Table Elegant"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="Table Professional"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="Table Subtle 1"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="Table Subtle 2"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="Table Web 1"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="Table Web 2"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="Table Web 3"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="Balloon Text"/>\n  <w:LsdException Locked="false" Priority="39" Name="Table Grid"/>\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\n   Name="Table Theme"/>\n  <w:LsdException Locked="false" SemiHidden="true" Name="Placeholder Text"/>\n  <w:LsdException Locked="false" Priority="1" QFormat="true" Name="No Spacing"/>\n  <w:LsdException Locked="false" Priority="60" Name="Light Shading"/>\n  <w:LsdException Locked="false" Priority="61" Name="Light List"/>\n  <w:LsdException Locked="false" Priority="62" Name="Light Grid"/>\n  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1"/>\n  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2"/>\n  <w:LsdException Locked="false" Priority="65" Name="Medium List 1"/>\n  <w:LsdException Locked="false" Priority="66" Name="Medium List 2"/>\n  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1"/>\n  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2"/>\n  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3"/>\n  <w:LsdException Locked="false" Priority="70" Name="Dark List"/>\n  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading"/>\n  <w:LsdException Locked="false" Priority="72" Name="Colorful List"/>\n  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid"/>\n  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 1"/>\n  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 1"/>\n  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 1"/>\n  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 1"/>\n  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 1"/>\n  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 1"/>\n  <w:LsdException Locked="false" SemiHidden="true" Name="Revision"/>\n  <w:LsdException Locked="false" Priority="34" QFormat="true"\n   Name="List Paragraph"/>\n  <w:LsdException Locked="false" Priority="29" QFormat="true" Name="Quote"/>\n  <w:LsdException Locked="false" Priority="30" QFormat="true"\n   Name="Intense Quote"/>\n  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 1"/>\n  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 1"/>\n  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 1"/>\n  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 1"/>\n  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 1"/>\n  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 1"/>\n  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 1"/>\n  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 1"/>\n  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 2"/>\n  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 2"/>\n  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 2"/>\n  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 2"/>\n  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 2"/>\n  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 2"/>\n  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 2"/>\n  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 2"/>\n  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 2"/>\n  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 2"/>\n  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 2"/>\n  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 2"/>\n  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 2"/>\n  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 2"/>\n  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 3"/>\n  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 3"/>\n  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 3"/>\n  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 3"/>\n  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 3"/>\n  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 3"/>\n  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 3"/>\n  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 3"/>\n  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 3"/>\n  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 3"/>\n  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 3"/>\n  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 3"/>\n  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 3"/>\n  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 3"/>\n  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 4"/>\n  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 4"/>\n  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 4"/>\n  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 4"/>\n  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 4"/>\n  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 4"/>\n  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 4"/>\n  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 4"/>\n  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 4"/>\n  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 4"/>\n  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 4"/>\n  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 4"/>\n  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 4"/>\n  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 4"/>\n  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 5"/>\n  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 5"/>\n  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 5"/>\n  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 5"/>\n  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 5"/>\n  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 5"/>\n  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 5"/>\n  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 5"/>\n  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 5"/>\n  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 5"/>\n  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 5"/>\n  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 5"/>\n  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 5"/>\n  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 5"/>\n  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 6"/>\n  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 6"/>\n  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 6"/>\n  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 6"/>\n  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 6"/>\n  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 6"/>\n  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 6"/>\n  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 6"/>\n  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 6"/>\n  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 6"/>\n  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 6"/>\n  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 6"/>\n  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 6"/>\n  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 6"/>\n  <w:LsdException Locked="false" Priority="19" QFormat="true"\n   Name="Subtle Emphasis"/>\n  <w:LsdException Locked="false" Priority="21" QFormat="true"\n   Name="Intense Emphasis"/>\n  <w:LsdException Locked="false" Priority="31" QFormat="true"\n   Name="Subtle Reference"/>\n  <w:LsdException Locked="false" Priority="32" QFormat="true"\n   Name="Intense Reference"/>\n  <w:LsdException Locked="false" Priority="33" QFormat="true" Name="Book Title"/>\n  <w:LsdException Locked="false" Priority="37" SemiHidden="true"\n   UnhideWhenUsed="true" Name="Bibliography"/>\n  <w:LsdException Locked="false" Priority="39" SemiHidden="true"\n   UnhideWhenUsed="true" QFormat="true" Name="TOC Heading"/>\n  <w:LsdException Locked="false" Priority="41" Name="Plain Table 1"/>\n  <w:LsdException Locked="false" Priority="42" Name="Plain Table 2"/>\n  <w:LsdException Locked="false" Priority="43" Name="Plain Table 3"/>\n  <w:LsdException Locked="false" Priority="44" Name="Plain Table 4"/>\n  <w:LsdException Locked="false" Priority="45" Name="Plain Table 5"/>\n  <w:LsdException Locked="false" Priority="40" Name="Grid Table Light"/>\n  <w:LsdException Locked="false" Priority="46" Name="Grid Table 1 Light"/>\n  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2"/>\n  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3"/>\n  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4"/>\n  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark"/>\n  <w:LsdException Locked="false" Priority="51" Name="Grid Table 6 Colorful"/>\n  <w:LsdException Locked="false" Priority="52" Name="Grid Table 7 Colorful"/>\n  <w:LsdException Locked="false" Priority="46"\n   Name="Grid Table 1 Light Accent 1"/>\n  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 1"/>\n  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 1"/>\n  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 1"/>\n  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 1"/>\n  <w:LsdException Locked="false" Priority="51"\n   Name="Grid Table 6 Colorful Accent 1"/>\n  <w:LsdException Locked="false" Priority="52"\n   Name="Grid Table 7 Colorful Accent 1"/>\n  <w:LsdException Locked="false" Priority="46"\n   Name="Grid Table 1 Light Accent 2"/>\n  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 2"/>\n  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 2"/>\n  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 2"/>\n  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 2"/>\n  <w:LsdException Locked="false" Priority="51"\n   Name="Grid Table 6 Colorful Accent 2"/>\n  <w:LsdException Locked="false" Priority="52"\n   Name="Grid Table 7 Colorful Accent 2"/>\n  <w:LsdException Locked="false" Priority="46"\n   Name="Grid Table 1 Light Accent 3"/>\n  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 3"/>\n  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 3"/>\n  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 3"/>\n  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 3"/>\n  <w:LsdException Locked="false" Priority="51"\n   Name="Grid Table 6 Colorful Accent 3"/>\n  <w:LsdException Locked="false" Priority="52"\n   Name="Grid Table 7 Colorful Accent 3"/>\n  <w:LsdException Locked="false" Priority="46"\n   Name="Grid Table 1 Light Accent 4"/>\n  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 4"/>\n  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 4"/>\n  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 4"/>\n  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 4"/>\n  <w:LsdException Locked="false" Priority="51"\n   Name="Grid Table 6 Colorful Accent 4"/>\n  <w:LsdException Locked="false" Priority="52"\n   Name="Grid Table 7 Colorful Accent 4"/>\n  <w:LsdException Locked="false" Priority="46"\n   Name="Grid Table 1 Light Accent 5"/>\n  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 5"/>\n  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 5"/>\n  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 5"/>\n  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 5"/>\n  <w:LsdException Locked="false" Priority="51"\n   Name="Grid Table 6 Colorful Accent 5"/>\n  <w:LsdException Locked="false" Priority="52"\n   Name="Grid Table 7 Colorful Accent 5"/>\n  <w:LsdException Locked="false" Priority="46"\n   Name="Grid Table 1 Light Accent 6"/>\n  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 6"/>\n  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 6"/>\n  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 6"/>\n  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 6"/>\n  <w:LsdException Locked="false" Priority="51"\n   Name="Grid Table 6 Colorful Accent 6"/>\n  <w:LsdException Locked="false" Priority="52"\n   Name="Grid Table 7 Colorful Accent 6"/>\n  <w:LsdException Locked="false" Priority="46" Name="List Table 1 Light"/>\n  <w:LsdException Locked="false" Priority="47" Name="List Table 2"/>\n  <w:LsdException Locked="false" Priority="48" Name="List Table 3"/>\n  <w:LsdException Locked="false" Priority="49" Name="List Table 4"/>\n  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark"/>\n  <w:LsdException Locked="false" Priority="51" Name="List Table 6 Colorful"/>\n  <w:LsdException Locked="false" Priority="52" Name="List Table 7 Colorful"/>\n  <w:LsdException Locked="false" Priority="46"\n   Name="List Table 1 Light Accent 1"/>\n  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 1"/>\n  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 1"/>\n  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 1"/>\n  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 1"/>\n  <w:LsdException Locked="false" Priority="51"\n   Name="List Table 6 Colorful Accent 1"/>\n  <w:LsdException Locked="false" Priority="52"\n   Name="List Table 7 Colorful Accent 1"/>\n  <w:LsdException Locked="false" Priority="46"\n   Name="List Table 1 Light Accent 2"/>\n  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 2"/>\n  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 2"/>\n  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 2"/>\n  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 2"/>\n  <w:LsdException Locked="false" Priority="51"\n   Name="List Table 6 Colorful Accent 2"/>\n  <w:LsdException Locked="false" Priority="52"\n   Name="List Table 7 Colorful Accent 2"/>\n  <w:LsdException Locked="false" Priority="46"\n   Name="List Table 1 Light Accent 3"/>\n  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 3"/>\n  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 3"/>\n  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 3"/>\n  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 3"/>\n  <w:LsdException Locked="false" Priority="51"\n   Name="List Table 6 Colorful Accent 3"/>\n  <w:LsdException Locked="false" Priority="52"\n   Name="List Table 7 Colorful Accent 3"/>\n  <w:LsdException Locked="false" Priority="46"\n   Name="List Table 1 Light Accent 4"/>\n  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 4"/>\n  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 4"/>\n  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 4"/>\n  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 4"/>\n  <w:LsdException Locked="false" Priority="51"\n   Name="List Table 6 Colorful Accent 4"/>\n  <w:LsdException Locked="false" Priority="52"\n   Name="List Table 7 Colorful Accent 4"/>\n  <w:LsdException Locked="false" Priority="46"\n   Name="List Table 1 Light Accent 5"/>\n  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 5"/>\n  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 5"/>\n  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 5"/>\n  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 5"/>\n  <w:LsdException Locked="false" Priority="51"\n   Name="List Table 6 Colorful Accent 5"/>\n  <w:LsdException Locked="false" Priority="52"\n   Name="List Table 7 Colorful Accent 5"/>\n  <w:LsdException Locked="false" Priority="46"\n   Name="List Table 1 Light Accent 6"/>\n  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 6"/>\n  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 6"/>\n  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 6"/>\n  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 6"/>\n  <w:LsdException Locked="false" Priority="51"\n   Name="List Table 6 Colorful Accent 6"/>\n  <w:LsdException Locked="false" Priority="52"\n   Name="List Table 7 Colorful Accent 6"/>\n </w:LatentStyles>\n</xml><![endif]--><!--[if gte mso 10]>\n<style>\n /* Style Definitions */\n table.MsoNormalTable\n	{mso-style-name:"Table Normal";\n	mso-tstyle-rowband-size:0;\n	mso-tstyle-colband-size:0;\n	mso-style-noshow:yes;\n	mso-style-priority:99;\n	mso-style-parent:"";\n	mso-padding-alt:0cm 5.4pt 0cm 5.4pt;\n	mso-para-margin-top:0cm;\n	mso-para-margin-right:0cm;\n	mso-para-margin-bottom:10.0pt;\n	mso-para-margin-left:0cm;\n	line-height:115%;\n	mso-pagination:widow-orphan;\n	font-size:11.0pt;\n	font-family:"Calibri","sans-serif";\n	mso-ascii-font-family:Calibri;\n	mso-ascii-theme-font:minor-latin;\n	mso-hansi-font-family:Calibri;\n	mso-hansi-theme-font:minor-latin;\n	mso-fareast-language:EN-US;}\n</style>\n<![endif]--></div>\n</div>'),
(13, 12, 'BG', 'Вентилатор за баня ММ100SK', '<p>Вентилаторът с таймер се включва от електрическия ключ за осветление на помещението, а вграденият таймер осигурява работа още 5 мин. след изключване на ключа.&nbsp;&nbsp;&nbsp;&nbsp;</p>', '<p><strong>СЕРИЯ </strong><strong>MM</strong></p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>\n<p>Предназначени са за продължителна или прекъсната вентилация</p>\n<p>на малки и средни битови, санитарни и търговски помещения.</p>\n<p>Монтират се на стена, таван, окачен таван, вътрешни стени.</p>\n<p>Могат да се използуват между съседни помещения като топлообменници.</p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>\n<p>Има модели за директно изхвърляне навън в атмосферата назамърсен въздух или вкарване отвън навътре на свеж.</p>\n<p><strong> Модификациите са ММ 100, ММ 120 и ММ 150.</strong></p>\n<p>Аспираторите от серия ММ се предлагат с и без автоматично затваряща се клапа.</p>\n<p>Във всички модели аспиратори от серията ММ, са вградени безшумни електродвигатели с търкалящи, двойнокапсуловани лагери, които гарантират</p>\n<p>30 000 часа безотказна работа на апарата при монтаж в хоризонтално или вертикално положение.</p>\n<p>Корпусът, перката и клапата са изработени от висококачествена пластмаса.</p>\n<p>Корпусът на електродвигателя се изработва от алуминиева сплав или от топлоустойчив материал, гарантиращ добротоохлаждане и повишена пожаробезопасност.</p>\n<p>Степента на защита IP X4 позволява аспиратора да функционира при висока влажност и в агресивни среди.</p>\n<p><strong>&nbsp;</strong></p>\n<p><strong>ММ-Т </strong><strong>/ С ТАЙМЕР</strong></p>\n<p>Вентилаторът с таймер се включва от електрическия ключ за осветление на помещението, а вграденият таймер осигурява работа още 5 мин. след изключване на ключа.&nbsp;&nbsp;&nbsp;&nbsp;</p>\n<p><strong>ВАРИАЦИИ</strong></p>\n<p>&bull; Всички модели от серията ММ GOLD могат да бъдат изпълнени в двускоростен</p>\n<p>режим на работа.</p>\n<p>&bull; Вентилаторите от серията ММ се предлагат в следните цветове: бял, инокс,</p>\n<p>хром, черен, крем и комбинация от тези цветове.</p>\n<p>&bull; По желание на клиента, вентилаторите могат да бъдат изпълнени в различни RAL.</p>\n<p>цветове.</p>\n<p><strong>&nbsp;</strong></p>\n<p><strong>Всички вентилатори могат да бъдат произведени с честота 60 Hz, като останалите характеристики не биха се променили съществено.</strong></p>\n<p><strong>ВНИМАНИЕ: Температурата на околната среда в която работят аспираторите не трябва да достига стойност над 80 С!</strong></p>', '');
INSERT INTO `product_products_lang` (`id`, `id_`, `lang_id`, `title`, `short_description`, `description`, `technical_info`) VALUES
(16, 15, 'BG', 'Вентилатор MM-H С датчик за влага и таймер', '<p>Вентилаторът се включва когато влагата в помещението надвиши 70%, като вградения таймер осигурява още 5 мин. работа след понижаване на влажността под 70%.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>', '<p><strong>СЕРИЯ </strong><strong>MM</strong></p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>\n<p>Предназначени са за продължителна или прекъсната вентилация</p>\n<p>на малки и средни битови, санитарни и търговски помещения.</p>\n<p>Монтират се на стена, таван, окачен таван, вътрешни стени.</p>\n<p>Могат да се използуват между съседни помещения като топлообменници.</p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>\n<p>Има модели за директно изхвърляне навън в атмосферата назамърсен въздух или вкарване отвън навътре на свеж.</p>\n<p><strong> Модификациите са ММ 100, ММ 120 и ММ 150.</strong></p>\n<p>Аспираторите от серия ММ се предлагат с и без автоматично затваряща се клапа.</p>\n<p>Във всички модели аспиратори от серията ММ, са вградени безшумни електродвигатели с търкалящи, двойнокапсуловани лагери, които гарантират</p>\n<p>30 000 часа безотказна работа на апарата при монтаж в хоризонтално или вертикално положение.</p>\n<p>Корпусът, перката и клапата са изработени от висококачествена пластмаса.</p>\n<p>Корпусът на електродвигателя се изработва от алуминиева сплав или от топлоустойчив материал, гарантиращ добротоохлаждане и повишена пожаробезопасност.</p>\n<p>Степента на защита IP X4 позволява аспиратора да функционира при висока влажност и в агресивни среди.</p>\n<p><strong>&nbsp;</strong></p>\n<p><strong>MM-H / С датчик за влага и таймер&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong></p>\n<p>Вентилаторът се включва когато влагата в помещението надвиши 70%, като вградения таймер осигурява още 5 мин. работа след понижаване на влажността под 70%.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>\n<p>&nbsp;</p>\n<p><strong>ВАРИАЦИИ</strong></p>\n<p>&bull; Всички модели от серията ММ GOLD могат да бъдат изпълнени в двускоростен</p>\n<p>режим на работа.</p>\n<p>&bull; Вентилаторите от серията ММ се предлагат в следните цветове: бял, инокс,</p>\n<p>хром, черен, крем и комбинация от тези цветове.</p>\n<p>&bull; По желание на клиента, вентилаторите могат да бъдат изпълнени в различни RAL.</p>\n<p>цветове.</p>\n<p><strong>&nbsp;</strong></p>\n<p><strong>Всички вентилатори могат да бъдат произведени с честота 60 Hz, като останалите характеристики не биха се променили съществено.</strong></p>\n<p><strong>ВНИМАНИЕ: Температурата на околната среда в която работят аспираторите не трябва да достига стойност над 80 С!</strong></p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>', ''),
(19, 18, 'BG', 'Вентилатор за баня ММ100S', '<p>Вентилаторът с таймер се включва от електрическия ключ за осветление на помещението, а вграденият таймер осигурява работа още 5 мин. след изключване на ключа.&nbsp;&nbsp;&nbsp;&nbsp;</p>', '<p><strong>СЕРИЯ </strong><strong>MM</strong></p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>\n<p>Предназначени са за продължителна или прекъсната вентилация</p>\n<p>на малки и средни битови, санитарни и търговски помещения.</p>\n<p>Монтират се на стена, таван, окачен таван, вътрешни стени.</p>\n<p>Могат да се използуват между съседни помещения като топлообменници.</p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>\n<p>Има модели за директно изхвърляне навън в атмосферата назамърсен въздух или вкарване отвън навътре на свеж.</p>\n<p><strong> Модификациите са ММ 100, ММ 120 и ММ 150.</strong></p>\n<p>Аспираторите от серия ММ се предлагат с и без автоматично затваряща се клапа.</p>\n<p>Във всички модели аспиратори от серията ММ, са вградени безшумни електродвигатели с търкалящи, двойнокапсуловани лагери, които гарантират</p>\n<p>30 000 часа безотказна работа на апарата при монтаж в хоризонтално или вертикално положение.</p>\n<p>Корпусът, перката и клапата са изработени от висококачествена пластмаса.</p>\n<p>Корпусът на електродвигателя се изработва от алуминиева сплав или от топлоустойчив материал, гарантиращ добротоохлаждане и повишена пожаробезопасност.</p>\n<p>Степента на защита IP X4 позволява аспиратора да функционира при висока влажност и в агресивни среди.</p>\n<p><strong>&nbsp;</strong></p>\n<p><strong>ММ-Т </strong><strong>/ С ТАЙМЕР</strong></p>\n<p>Вентилаторът с таймер се включва от електрическия ключ за осветление на помещението, а вграденият таймер осигурява работа още 5 мин. след изключване на ключа.&nbsp;&nbsp;&nbsp;&nbsp;</p>\n<p><strong>ВАРИАЦИИ</strong></p>\n<p>&bull; Всички модели от серията ММ GOLD могат да бъдат изпълнени в двускоростен</p>\n<p>режим на работа.</p>\n<p>&bull; Вентилаторите от серията ММ се предлагат в следните цветове: бял, инокс,</p>\n<p>хром, черен, крем и комбинация от тези цветове.</p>\n<p>&bull; По желание на клиента, вентилаторите могат да бъдат изпълнени в различни RAL.</p>\n<p>цветове.</p>\n<p><strong>&nbsp;</strong></p>\n<p><strong>Всички вентилатори могат да бъдат произведени с честота 60 Hz, като останалите характеристики не биха се променили съществено.</strong></p>\n<p><strong>ВНИМАНИЕ: Температурата на околната среда в която работят аспираторите не трябва да достига стойност над 80 С!</strong></p>', '');

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
  `params` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `page_id` (`page_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=97 ;

--
-- Dumping data for table `zcms_frontend_menus`
--

INSERT INTO `zcms_frontend_menus` (`id`, `parent_id`, `page_id`, `params`) VALUES
(1, 0, '0', ''),
(2, 1, '0', ''),
(3, 2, 'mmotors_history', ''),
(4, 2, 'mmotors_philosophy', ''),
(5, 2, 'mmotors_structure', ''),
(6, 1, '0', ''),
(7, 2, 'mmotors_base', ''),
(8, 1, '0', ''),
(9, 1, '0', ''),
(11, 6, 'mmotors_fans', ''),
(12, 6, 'mmotors_engines', ''),
(13, 0, '0', ''),
(14, 13, 'mmotors_fans_bathroom', ''),
(15, 13, 'mmotors_fans_sauna', ''),
(16, 13, 'mmotors_fans_fireplace', ''),
(17, 13, 'mmotors_fans_windows', ''),
(18, 0, '0', ''),
(19, 18, 'mmotors_history', ''),
(20, 18, 'mmotors_philosophy', ''),
(21, 18, 'mmotors_structure', ''),
(22, 18, 'mmotors_base', ''),
(23, 0, '0', ''),
(24, 23, 'page_test_new', ''),
(25, 24, 'mmotors_history', ''),
(26, 24, 'mmotors_philosophy', ''),
(27, 24, 'mmotors_structure', ''),
(28, 23, '0', ''),
(29, 24, 'mmotors_base', ''),
(30, 23, '0', ''),
(31, 23, '0', ''),
(33, 28, 'mmotors_fans_bathroom', ''),
(34, 28, 'mmotors_fans_sauna', ''),
(35, 28, 'mmotors_fans_fireplace', ''),
(36, 28, 'mmotors_fans_windows', ''),
(37, 0, '0', ''),
(38, 37, 'page_test_new', ''),
(39, 38, 'mmotors_history', ''),
(40, 38, 'mmotors_philosophy', ''),
(41, 38, 'mmotors_structure', ''),
(42, 37, '0', ''),
(43, 38, 'mmotors_base', ''),
(44, 37, '0', ''),
(45, 37, '0', ''),
(47, 0, '0', ''),
(48, 47, 'mmotors_engines_1', ''),
(49, 47, 'mmotors_engines_2', ''),
(50, 47, 'mmotors_engines_3', ''),
(51, 47, 'mmotors_engines_4', ''),
(52, 42, 'mmotors_engines_1', ''),
(53, 42, 'mmotors_engines_2', ''),
(54, 42, 'mmotors_engines_3', ''),
(55, 42, 'mmotors_engines_4', ''),
(56, 2, 'mmotors_quality_control', ''),
(57, 18, 'mmotors_quality_control', ''),
(58, 24, 'mmotors_quality_control', ''),
(59, 38, 'mmotors_quality_control', ''),
(60, 2, 'mmotors_inovations', ''),
(61, 18, 'mmotors_inovations', ''),
(62, 24, 'mmotors_inovations', ''),
(63, 38, 'mmotors_inovations', ''),
(64, 2, 'mmotors_references', ''),
(65, 18, 'mmotors_references', ''),
(66, 24, 'mmotors_references', ''),
(67, 38, 'mmotors_references', ''),
(68, 2, 'mmotors_management_team', ''),
(69, 18, 'mmotors_management_team', ''),
(70, 24, 'mmotors_management_team', ''),
(71, 38, 'mmotors_management_team', ''),
(72, 8, 'mmotors_sales_departament', ''),
(73, 30, 'mmotors_sales_departament', ''),
(74, 44, 'mmotors_sales_departament', ''),
(75, 44, 'mmotors_technical_departament', ''),
(76, 8, 'mmotors_technical_departament', ''),
(77, 30, 'mmotors_technical_departament', ''),
(78, 30, 'mmotors_accounting', ''),
(79, 44, 'mmotors_accounting', ''),
(80, 8, 'mmotors_accounting', ''),
(81, 8, 'mmotors_catalogs', ''),
(82, 30, 'mmotors_catalogs', ''),
(83, 44, 'mmotors_catalogs', ''),
(84, 44, 'mmotors_promos', ''),
(85, 30, 'mmotors_promos', ''),
(86, 8, 'mmotors_promos', ''),
(87, 9, '0', ''),
(88, 31, '0', ''),
(89, 45, '0', ''),
(91, 32, 'query', ''),
(93, 13, 'mmotors_flow_systems', ''),
(94, 28, 'mmotors_flow_systems', ''),
(96, 34, 'mmotors_fans_bathroom', '?category=8');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=97 ;

--
-- Dumping data for table `zcms_frontend_menus_lang`
--

INSERT INTO `zcms_frontend_menus_lang` (`id`, `id_`, `lang_id`, `label`) VALUES
(1, 1, 'BG', 'Главно меню'),
(2, 2, 'BG', 'Фирмена идентичност'),
(3, 3, 'BG', 'История'),
(4, 4, 'BG', 'Фирмена философия'),
(5, 5, 'BG', 'Структура'),
(6, 6, 'BG', 'Продукти'),
(7, 7, 'BG', 'Производствена база'),
(8, 8, 'BG', 'Обслужване на търговци'),
(9, 9, 'BG', 'Гаранционно обслужване'),
(11, 11, 'BG', 'Вентилатори'),
(12, 12, 'BG', 'Електродвигатели'),
(13, 13, 'BG', 'Меню Вентилатори Странично'),
(14, 14, 'BG', 'Вентилатори ММоторс'),
(15, 15, 'BG', 'Вентилатори за баня ММ'),
(16, 16, 'BG', 'Вентилатори за камини'),
(17, 17, 'BG', 'Прозоречни вентилатори'),
(18, 18, 'BG', 'Фирмена идентичност'),
(19, 19, 'BG', 'История'),
(20, 20, 'BG', 'Фирмена философия'),
(21, 21, 'BG', 'Структура'),
(22, 22, 'BG', 'Производствена база'),
(23, 23, 'BG', 'Главно меню - Вентилатори'),
(24, 24, 'BG', 'Фирмена идентичност'),
(25, 25, 'BG', 'История'),
(26, 26, 'BG', 'Фирмена философия'),
(27, 27, 'BG', 'Структура'),
(28, 28, 'BG', 'Вентилатори'),
(29, 29, 'BG', 'Производствена база'),
(30, 30, 'BG', 'Обслужване на търговци'),
(31, 31, 'BG', 'Гаранционно обслужване'),
(33, 33, 'BG', 'Вентилатори ММоторс'),
(34, 34, 'BG', 'Вентилатори за баня ММ'),
(35, 35, 'BG', 'Вентилатори за камини'),
(36, 36, 'BG', 'Прозоречни вентилатори'),
(37, 37, 'BG', 'Главно меню - Двигатели'),
(38, 38, 'BG', 'Фирмена идентичност'),
(39, 39, 'BG', 'История'),
(40, 40, 'BG', 'Фирмена философия'),
(41, 41, 'BG', 'Структура'),
(42, 42, 'BG', 'Двигатели'),
(43, 43, 'BG', 'Производствена база'),
(44, 44, 'BG', 'Обслужване на търговци'),
(45, 45, 'BG', 'Гаранционно обслужване'),
(47, 47, 'BG', 'Електродвигатели - Категории'),
(48, 48, 'BG', 'Асинхронни'),
(49, 49, 'BG', 'С ел. спирачка'),
(50, 50, 'BG', 'Ефективност IE2'),
(51, 51, 'BG', 'Ефективност IE3'),
(52, 52, 'BG', 'Асинхронни'),
(53, 53, 'BG', 'С електромагнитна спирачка'),
(54, 54, 'BG', 'Ефективност IE2'),
(55, 55, 'BG', 'Ефективност IE3'),
(56, 56, 'BG', 'Контрол на качеството'),
(57, 57, 'BG', 'Контрол на качеството'),
(58, 58, 'BG', 'Контрол на качеството'),
(59, 59, 'BG', 'Контрол на качеството'),
(60, 60, 'BG', 'Иновации'),
(61, 61, 'BG', 'Иновации'),
(62, 62, 'BG', 'Иновации'),
(63, 63, 'BG', 'Иновации'),
(64, 64, 'BG', 'Референции'),
(65, 65, 'BG', 'Референции'),
(66, 66, 'BG', 'Референции'),
(67, 67, 'BG', 'Референции'),
(68, 68, 'BG', 'Контакт с управленския екип'),
(69, 69, 'BG', 'Контакт с управленския екип'),
(70, 70, 'BG', 'Контакт с управленския екип'),
(71, 71, 'BG', 'Контакт с управленския екип'),
(72, 72, 'BG', 'Търговски отдел'),
(73, 73, 'BG', 'Търговски отдел'),
(74, 74, 'BG', 'Търговски отдел'),
(75, 75, 'BG', 'Технически отдел'),
(76, 76, 'BG', 'Технически отдел'),
(77, 77, 'BG', 'Технически отдел'),
(78, 78, 'BG', 'Счетоводство'),
(79, 79, 'BG', 'Счетоводство'),
(80, 80, 'BG', 'Счетоводство'),
(81, 81, 'BG', 'Каталози за изтегляне'),
(82, 82, 'BG', 'Каталози за изтегляне'),
(83, 83, 'BG', 'Каталози за изтегляне'),
(84, 84, 'BG', 'Промоции и нови продукти'),
(85, 85, 'BG', 'Промоции и нови продукти'),
(86, 86, 'BG', 'Промоции и нови продукти'),
(87, 87, 'BG', 'Форма за контакт'),
(88, 88, 'BG', 'Форма за контакт'),
(89, 89, 'BG', 'Форма за контакт'),
(91, 91, 'BG', 'Форма за контакт'),
(93, 93, 'BG', 'Проточни системи'),
(94, 94, 'BG', 'Проточни системи'),
(96, 96, 'BG', 'Серия ММ Стандарт');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=52 ;

--
-- Dumping data for table `zcms_lang_cache`
--

INSERT INTO `zcms_lang_cache` (`id`, `link`, `lang_id`, `ids`) VALUES
(1, 'backend/translations/edit/1', 'BG', '["67","68","69","70","71","72","73","8","25","61","62","63","48","5"]'),
(2, 'backend/translations/index', 'BG', '["8","265","25","61","62","63","13","14","15","16","17","12"]'),
(3, 'backend/translations/index/2/lang_id/asc', 'BG', '["8","25","61","62","63","13","14","15","16","17","12"]'),
(4, 'backend/translations/index/2/lang_id/desc', 'BG', '["8","25","61","62","63","13","14","15","16","17","12"]'),
(5, 'backend/translations/index/1/lang_id/desc', 'BG', '["67","68","69","70","71","74","75","76","77","78","79"]'),
(6, 'backend/translations/edit/67', 'BG', '["67","68","69","70","71","72","73"]'),
(7, 'backend/authenticate/logout', 'EN', NULL),
(8, 'backend/authenticate/login', 'EN', NULL),
(9, 'backend/dashboard', 'EN', '["8","265","25","67","266","68"]'),
(10, 'backend/pages/edit/1', 'EN', '["8","25","45","54","183","80","101","55","46","47","48","5"]'),
(11, 'backend/pages/index', 'EN', '["8","265","25","45","46","13","14","15","16","17","12","67","266","68","81","84","74","75","76","77","78","79"]'),
(12, 'backend/pages/edit', 'EN', '["8","265","25","45","54","183","80","101","55","46","47","48","5"]'),
(13, 'backend/pages/edit/2', 'EN', '["67","68","81","82","83","84","85","72","73"]'),
(14, 'backend/pages/edit/3', 'EN', '["8","25","45","54","183","80","101","55","46","47","48","5"]'),
(15, 'frontend/pages/index/page_test_new2', 'EN', '["165","148"]'),
(16, 'backend', 'FR', '["202","204","186","221","218","219","220","222","223","224","225","226","230","228","229"]'),
(17, 'backend/pages/edit/4', 'FR', '["8","25","45","54","183","80","101","55","46","47","48","5","67","266","68","81","126","261","82","102","83","129","84","85","72","73","132","133","134"]'),
(18, 'backend/backend_menu/edit/12', 'EN', '["8","25","50","57","59","60","58","56","48","5"]'),
(19, 'backend/frontend_menus/index', 'EN', '["8","265","25","50","51","52","13","17","12"]'),
(20, 'backend/frontend_menus/edit', 'EN', '["8","265","25","50","164","53","264","54","48"]'),
(21, 'backend/categories/index', 'EN', '["8","265","25","13","17","12"]'),
(22, 'backend/categories/edit', 'EN', '["8","265","25","49","62","164","166","142","48","5","1","2","3"]'),
(23, 'backend/products/edit/1', 'EN', '["8","25","119","49","165","167","168","169","171","170","172","173","174","175","176","177","178","179","180","181","182","122","137","144","45","120","46","121","48"]'),
(24, 'backend/product_images/edit', 'EN', '["67","68"]'),
(25, 'backend/pdimages/edit', 'EN', '["67","68","81",140,"72","73"]'),
(26, 'backend/pdimages/delete/2/1', 'EN', '["81","140","72"]'),
(27, 'backend/products/schematic/delete', 'EN', NULL),
(28, 'backend/pdimages/edit/3', 'EN', '["8","25","45","145","142","143","48"]'),
(29, 'backend/pdimages/delete/3/1', 'EN', '["81","141","140","72"]'),
(30, 'backend/products/index', 'EN', '["8","265","25","119","45","23","11","234","13","14","15","16","17","12"]'),
(31, 'backend/pdimages/edit/4', 'EN', '["8","25","45","145","142","143","48"]'),
(32, 'backend/pdimages/edit/5', 'EN', '["8","25","45","145","142","143","48"]'),
(33, 'backend/filters/edit', 'EN', '["8","265","25","153","147","50","150","151","161","162","163","48","5"]'),
(34, 'backend/filters/edit/3', 'EN', '["8","25","153","147","50","150","151","161","162","163","48","5"]'),
(35, 'backend/filters/index', 'EN', '["8","265","25","147","50","23","11","13","14","15","16","17","12"]'),
(36, 'backend/filters/edit/1', 'EN', '["8","265","25","153","147","50","150","151","161","162","163","48","5"]'),
(37, 'backend/pages', 'BG', '["8","25","45","46","13","14","15","16","17","12"]'),
(38, 'frontend/pages/index/home', 'EN', '["202","204","186","221","218","219","220","222","223","224","225","226","230","228","229"]'),
(39, 'frontend/pages/index/mmotors_history', 'EN', '["186","221","218","219","220","222","223","224","225","226","230","228","229"]'),
(40, 'frontend/pages/index/mmotors_philosophy', 'EN', '["186","221","218","219","220","222","223","224","225","226","230","228","229"]'),
(41, 'frontend/pages/index/mmotors_fans', 'EN', '["165","148","186","221","218","219","220","222","223","224","225","226","230","228","229"]'),
(42, 'frontend/pages/index/mmotors_technical_departament', 'EN', '["186","221","218","219","220","222","223","224","225","226","230","228","229"]'),
(43, 'frontend/pages/index/0', 'EN', '["202","204","186","221","218","219","220","222","223","224","225","226","230","228","229"]'),
(44, 'frontend/pages/index/query', 'EN', '["216","206","207","231","232","208","209","210","211","192","187","186","221","218","219","220","222","223","224","225","226","230","228","229"]'),
(45, 'backend/pages/edit/5', ' E', '["8","265","25","45","54","183","80","101","55","122","46","47","48","5","1","2","3"]'),
(46, 'backend/frontend_menus/edit/1', 'EN', '["8","25","50","164","53","264","54","48","5"]'),
(47, 'backend/pages/edit/6', 'EN', '["8","265","25","45","54","183","80","101","55","122","46","47","48","5","1","2","3"]'),
(48, 'frontend/pages/index/mmotors_fans_filter', 'EN', '["165","148","186","221","218","219","220","222","223","224","225","226","230","228","229"]'),
(49, 'front/mmotors_historya', 'EN', '["236","237","238","239","240","241","242","243","244","245","246","247","248"]'),
(50, 'front/mmotors_history', 'EN', '["236","237","238","239","240","241","242","243","244","245","246","247","248"]'),
(51, '', 'EN', '["202","204","186","221","218","219","220","222","223","224","225","226","230","228","229"]');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=269 ;

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
(119, 'BG', 'Code', '№'),
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
(148, 'BG', 'Filter', 'Филтър'),
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
(184, 'BG', 'URL', NULL),
(186, 'BG', 'Buy online', 'Купи онлайн'),
(187, 'BG', 'Categories', 'Категории'),
(188, 'BG', 'Slider Id', NULL),
(189, 'BG', 'Home', NULL),
(190, 'BG', 'Fans', NULL),
(191, 'BG', 'Engines', NULL),
(192, 'BG', 'Филтриране', NULL),
(193, 'BG', 'Кратко представяне', NULL),
(194, 'BG', 'Повече информация', NULL),
(195, 'BG', 'Технически данни', NULL),
(196, 'BG', 'Документи за теглене', NULL),
(197, 'BG', 'Код', '№'),
(198, 'BG', 'Кратко описание', NULL),
(199, 'BG', 'Изпрати запитване', NULL),
(200, 'BG', 'Начало', NULL),
(201, 'BG', 'Date', NULL),
(202, 'BG', 'повече', NULL),
(203, 'BG', 'Новини', NULL),
(204, 'BG', 'Всички новини', NULL),
(205, 'BG', 'Запитване за', NULL),
(206, 'BG', 'Имейл', NULL),
(207, 'BG', 'Въведете имейл', NULL),
(208, 'BG', 'Име', NULL),
(209, 'BG', 'Въведете вашето име', NULL),
(210, 'BG', 'Вашето запитване', NULL),
(211, 'BG', 'Изпрати', NULL),
(212, 'BG', 'Потребителско Заптване', NULL),
(213, 'BG', 'Име на клиента', NULL),
(214, 'BG', 'Имейл на клиента', NULL),
(215, 'BG', 'Запитване относно', NULL),
(216, 'BG', 'Запитване', NULL),
(217, 'BG', 'Общо', NULL),
(218, 'BG', 'Електродвигатели', NULL),
(219, 'BG', 'Вентилатори', NULL),
(220, 'BG', 'Отоплителни системи', NULL),
(221, 'BG', 'Продукти', NULL),
(222, 'BG', 'Търговци', NULL),
(223, 'BG', 'Търговски отдел', NULL),
(224, 'BG', 'Технически отдел', NULL),
(225, 'BG', 'Счетоводство', NULL),
(226, 'BG', 'Каталози за изтегляне', NULL),
(227, 'BG', 'Промоции и нови продукти', NULL),
(228, 'BG', 'Контакти', NULL),
(229, 'BG', 'Форма за контакт', NULL),
(230, 'BG', 'Промоции', NULL),
(231, 'BG', 'Телефон', NULL),
(232, 'BG', 'Въведете вашия телефон', NULL),
(233, 'BG', 'Телефон на клиента', NULL),
(234, 'BG', 'Copy', 'Копирай'),
(235, 'EN', 'Copy', NULL),
(236, 'EN', 'Buy online', NULL),
(237, 'EN', 'Продукти', NULL),
(238, 'EN', 'Електродвигатели', NULL),
(239, 'EN', 'Вентилатори', NULL),
(240, 'EN', 'Отоплителни системи', NULL),
(241, 'EN', 'Търговци', NULL),
(242, 'EN', 'Търговски отдел', NULL),
(243, 'EN', 'Технически отдел', NULL),
(244, 'EN', 'Счетоводство', NULL),
(245, 'EN', 'Каталози за изтегляне', NULL),
(246, 'EN', 'Промоции', NULL),
(247, 'EN', 'Контакти', NULL),
(248, 'EN', 'Форма за контакт', NULL),
(249, ' EN', 'Z-CMS Administration', NULL),
(250, ' EN', 'Back', NULL),
(251, ' EN', 'Title', NULL),
(252, ' EN', 'None', NULL),
(253, ' EN', 'Main menu', NULL),
(255, ' EN', 'Template', NULL),
(256, ' EN', 'Keywords', NULL),
(257, ' EN', 'Description', NULL),
(258, ' EN', 'Content', NULL),
(259, ' EN', 'Save', NULL),
(260, ' EN', 'Edit/Insert', NULL),
(261, 'EN', 'Main menu', NULL),
(262, 'EN', 'повече', NULL),
(263, 'EN', 'Всички новини', NULL),
(264, 'BG', 'Page', 'Страница'),
(265, 'BG', 'Languages', NULL),
(266, 'EN', 'Languages', NULL),
(267, 'BG', 'Shop URL', NULL),
(268, 'BG', 'Params', NULL);

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=17 ;

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
(15, 'slider', 'index', '', 6, 2),
(16, 'news', 'index', '', 7, 2);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=26 ;

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
(24, 15, 'BG', 'Слайдър'),
(25, 16, 'BG', 'Новини');

-- --------------------------------------------------------

--
-- Table structure for table `zcms_pages`
--

CREATE TABLE IF NOT EXISTS `zcms_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `template` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `main_menu` int(11) NOT NULL,
  `images` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `page_id` (`page_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=37 ;

--
-- Dumping data for table `zcms_pages`
--

INSERT INTO `zcms_pages` (`id`, `page_id`, `template`, `main_menu`, `images`) VALUES
(4, 'zcms_404', '', 0, ''),
(5, 'home', 'frontpage', 1, ''),
(6, 'mmotors_fans', 'frontpage', 23, '[]'),
(7, 'mmotors_fans_sauna', '', 23, ''),
(8, 'mmotors_fans_filter', '', 23, ''),
(11, 'news', '', 1, ''),
(12, 'query', '', 1, ''),
(13, 'mmotors_fans_bathroom', '', 23, ''),
(14, 'mmotors_fans_fireplace', '', 23, ''),
(15, 'mmotors_fans_windows', '', 23, ''),
(16, 'mmotors_engines', 'frontpage', 37, ''),
(17, 'mmotors_engines_1', '', 37, ''),
(18, 'mmotors_engines_2', '', 37, ''),
(19, 'mmotors_engines_3', '', 37, ''),
(20, 'mmotors_engines_4', '', 37, ''),
(21, 'mmotors_history', 'static_page', 1, ''),
(22, 'mmotors_philosophy', 'static_page', 1, ''),
(23, 'mmotors_structure', 'static_page', 1, ''),
(24, 'mmotors_base', 'static_page', 1, ''),
(25, 'mmotors_quality_control', 'static_page', 1, ''),
(26, 'mmotors_inovations', 'static_page', 1, ''),
(27, 'mmotors_references', 'static_page', 1, ''),
(28, 'mmotors_management_team', '', 1, ''),
(29, 'mmotors_sales_departament', 'static_page', 1, ''),
(30, 'mmotors_technical_departament', 'static_page', 1, ''),
(31, 'mmotors_accounting', 'static_page', 1, ''),
(32, 'mmotors_catalogs', 'static_page', 1, ''),
(33, 'mmotors_promos', 'static_page', 1, ''),
(34, 'mmotors_flow_systems', '', 23, ''),
(35, 'heaters', 'static_page', 1, ''),
(36, 'medical_association', 'static_page', 1, '');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=42 ;

--
-- Dumping data for table `zcms_pages_lang`
--

INSERT INTO `zcms_pages_lang` (`id`, `title`, `keywords`, `description`, `html`, `id_`, `lang_id`) VALUES
(7, '404 Page not found', '', '', '<div id="bottom-section">\r\n<h3>404 Страницата не е намерена</h3>\r\n<p>За съжаление страницата, която търсите не беше намерена.</p>\r\n</div>', 4, 'BG'),
(8, 'Mmotors - Начало', '', '', '<p>{html/html_slider:home}</p>\n<div id="category-overview">\n<div class="co-row">\n<div class="co-category"><a href="http://dildesign-studio.com/dev/mmotors-site/index.php/frontend/pages/index/mmotors_engines"><img src="/dev/mmotors-site/public/images/co-engines.png" alt="" /><span class="caption"> Производство на електродвигатели</span></a></div>\n<div class="co-category"><a href="http://dildesign-studio.com/dev/mmotors-site/index.php/frontend/pages/index/mmotors_fans"><img src="/dev/mmotors-site/public/images/co-fans.png" alt="" /><span class="caption"> Производство на Вентилатори</span></a></div>\n</div>\n<div class="co-row">\n<div class="co-category"><a href="http://dildesign-studio.com/dev/mmotors-site/index.php/frontend/pages/index/heaters"><img src="/dev/mmotors-site/public/images/co-heating.png" alt="" /><span class="caption"> Производство на отоплителни уреди</span></a></div>\n<div class="co-category"><a href="http://dildesign-studio.com/dev/mmotors-site/index.php/frontend/pages/index/medical_association"><img src="/dev/mmotors-site/public/images/co-medical.png" alt="" /><span class="caption"> Дъщерно лекарско дружество</span></a></div>\n</div>\n</div>\n<div id="news-overview">\n<div class="news-cont">\n<div class="news-cont-cell">\n<h3>MM MOTORS</h3>\n<p>"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>\n<p>&nbsp;</p>\n<p>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum." "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod</p>\n<p><a href="http://dildesign-studio.com/dev/mmotors-site/index.php/frontend/pages/index/mmotors_history">повече...</a></p>\n</div>\n<div class="news-cont-cell">\n<h3>Новини</h3>\n{html/html_news:2,html_news_home}</div>\n</div>\n</div>\n<div id="bottom-section">\n<div class="bs-links-content">\n<div id="mmotors-world" class="bs-link"><a><strong> ММ MOTORS </strong> <br />- представителства по света</a></div>\n<div id="youtube-videos" class="bs-link"><a><strong> ММ MOTORS </strong> <br />- рекламни клипове</a></div>\n<div id="mmotors-coop" class="bs-link"><a><strong> ММ MOTORS </strong> <br />- Предложение за сътрудничество</a></div>\n</div>\n</div>', 5, 'BG'),
(9, 'Mmotors - Вентилатори', '', '', '<p>{html/html_slider:fans}</p>\n<div class="container content">{products/product_filter}\n<div class="col-md-9 productinfo">\n<div class="tab-content" style="min-height: 0;">\n<div id="home" class="tab-pane fade active in">\n<div class="co-row">\n<div id="co-fans" class="co-category-inner"><a href="mmotors_fans_bathroom"><img src="/dev/mmotors-site/public/images/co-fans-small.png" alt="" /> <span class="caption"> Вентилатори за баня</span></a></div>\n<div id="co-fans" class="co-category-inner"><a href="mmotors_flow_systems"><img src="/dev/mmotors-site/public/images/co-fans-small-2.png" alt="" /><span class="caption"> Проточни системи</span></a></div>\n</div>\n<div class="news-cont" style="width: auto;">\n<h3>Статия за вентилатори</h3>\n<p>"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>\n<p>&nbsp;</p>\n<p>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum." "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."</p>\n</div>\n</div>\n</div>\n</div>\n</div>', 6, 'BG'),
(10, 'Вентилатори за сауна', '', '', '<p>{products/product_pathway:4}</p>\r\n<div class="container content">{menus/menus_recursive_simple:13,menus_menu_side} {products/product_listing:4,mmotors_fans_sauna,id}{products/product_view}</div>\r\n<div id="mcePasteBin" style="position: absolute; top: 0px; left: 0; background: red; width: 1px; height: 1px; overflow: hidden;" contenteditable="false">\r\n<div contenteditable="true">X</div>\r\n</div>', 7, 'BG'),
(11, 'Вентилатори - Филтриране', '', '', '<p>{products/product_filter}</p>\n<p>{products/product_listing:0,mmotors_fans_filter,id}{products/product_view}</p>', 8, 'BG'),
(14, 'Новини', '', '', '<div class="container content">{menus/menus_recursive_simple:18,menus_menu_firm} {html/html_news:0}</div>', 11, 'BG'),
(15, 'Запитване', '', '', '<p>{menus/menus_recursive_simple:18,menus_menu_firm} {html/html_query:0,teodorklissarov@gmail.com}</p>\r\n<div id="mcePasteBin" style="position: absolute; top: 0px; left: 0; background: red; width: 1px; height: 1px; overflow: hidden;" contenteditable="false">\r\n<div contenteditable="true">{menus/menus_recursive_simple:13,menus_menu_side} {products/product_listing:4,fans}</div>\r\n</div>', 12, 'BG'),
(16, 'Вентилатори за баня', '', '', '<p>{products/product_pathway:3}</p>\r\n<div class="container content">{menus/menus_recursive_simple:13,menus_menu_side} {products/product_listing:3,mmotors_fans_bathroom,id}{products/product_view}</div>', 13, 'BG'),
(17, 'Вентилатори за камини', '', '', '<p>{products/product_pathway:5}</p>\r\n<div class="container content">{menus/menus_recursive_simple:13,menus_menu_side} {products/product_listing:5,mmotors_fans_fireplace,id}{products/product_view}</div>', 14, 'BG'),
(18, 'Прозоречни вентилатори', '', '', '<p>{products/product_pathway:6}</p>\r\n<div class="container content">{menus/menus_recursive_simple:13,menus_menu_side} {products/product_listing:6,mmotors_fans_windows,id}{products/product_view}</div>', 15, 'BG'),
(19, 'Mmotors - Електродвигатели', '', '', '<p>{html/html_slider:engines}</p>\n<div class="container content">{menus/menus_recursive_simple:47,menus_menu_firm}\n<div class="col-md-9 productinfo">\n<div class="tab-content" style="min-height: 0;">\n<div id="home" class="tab-pane fade active in">\n<div class="co-row">\n<div id="co-fans" class="co-category-inner"><a href="mmotors_engines_1"><img src="/dev/mmotors-site/public/images/co-engines-small.png" alt="" /> <span class="caption">Асинхронни</span></a></div>\n<div id="co-fans" class="co-category-inner"><a href="mmotors_engines_2"><img src="/dev/mmotors-site/public/images/co-engines-small-2.png" alt="" /><span class="caption">С ел. спирачка</span></a></div>\n</div>\n<div class="news-cont" style="width: auto;">\n<h3>Статия за двигатели</h3>\n<p>"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>\n<p>&nbsp;</p>\n<p>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum." "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."</p>\n</div>\n</div>\n</div>\n</div>\n</div>', 16, 'BG'),
(20, 'Асинхронни Електродвигатели ', '', '', '<p>{products/product_pathway:10}</p>\n<div class="container content">{menus/menus_recursive_simple:47,menus_menu_firm} {products/product_listing:10,mmotors_engines_1,id}{products/product_view}</div>', 17, 'BG'),
(21, 'Електродвигатели с електромагнитна спирачка', '', '', '<p>{products/product_pathway:11}</p>\n<div class="container content">{menus/menus_recursive_simple:47,menus_menu_firm} {products/product_listing:11,mmotors_engines_2,id}{products/product_view}</div>', 18, 'BG'),
(22, 'Ефективност IE2', '', '', '<p>{products/product_pathway:12}</p>\n<div class="container content">{menus/menus_recursive_simple:47,menus_menu_firm} {products/product_listing:12,mmotors_engines_1,id}{products/product_view}</div>', 19, 'BG'),
(23, 'Ефективност IE3', '', '', '<p>{products/product_pathway:13}</p>\n<div class="container content">{menus/menus_recursive_simple:47,menus_menu_firm} {products/product_listing:13,mmotors_engines_1,id}{products/product_view}</div>', 20, 'BG');
INSERT INTO `zcms_pages_lang` (`id`, `title`, `keywords`, `description`, `html`, `id_`, `lang_id`) VALUES
(24, 'История', '', '', '<p style="text-align: justify;">&nbsp;</p>\r\n<p style="text-align: justify;">Предприятието е основано през 1961г. като ДИП &bdquo;Метални изделия&rdquo;. С годините, започва усвояването на гама малки електродвигатели за подемно-транспортната техника и бита. През периода 1986-1991г. по френски лиценз се усвояват няколко типа вентилатори с приложение в електронно-изчислителната техника. Извършва се цялостно технологично обновление като за целта от Япония, Швейцария, Германия и Франция са доставени изключително модерни и високопроизводителни за времето си машини &ndash; стругове с &bdquo;ЦПУ&rdquo;, автоматични преси, фрези и др. От фирмата &bdquo;Статомат&rdquo; Германия е доставена автоматизирана линия за производство на статорите за двигателите на 5 вида вентилатори. Оборудвана е леярна за леене под налягане на отливки от цветни метали.</p>\r\n<p style="text-align: justify;">&nbsp;</p>\r\n<p style="text-align: justify;">До политическите промени през през 1990г. фабриката е част от държавно-планираната икономика на страната. В този период освен вентилатори се произвеждат електродвигатели и помпи за перални машини, уреди за бита. Част от продукцията е предназначена за износ предимно в страни от СИВ и Близкия изток.</p>\r\n<p style="text-align: justify;">След промените, които настъпват в страната предприятието е преименувано на &bdquo;Микродвигатели&rdquo; а в периода на раздържавяване - през 1997г. е преобразувано в акционерно дружество. Дружеството е приватизирано през 1997 и малко след това преименувано в &bdquo;ММоторс&rdquo; АД.</p>\r\n<p style="text-align: justify;">&nbsp;</p>\r\n<p style="text-align: justify;">Новото ръководство е изправено пред предизвикателствата на променящата се икономика. Завареното оборудване е остаряло, производството е енергоемко и нерентабилно и в новите пазарни условия компанията започва да губи традиционните си пазари.</p>\r\n<p style="text-align: justify;">&nbsp;</p>\r\n<p style="text-align: justify;">В периода до 2001 с новото частно управление, дружеството преживява бурно развитие свързано с продуктово и технологично обновяване. Усвоено е призводството на асинхронни електродвигатели до 4.0 кW. Разработват се и успешно се налагат на пазара нови серии битови и промишлени вентилатори. Продукцията намира признание в страните от Балканите, ЕС, Русия и Близкия изток.</p>\r\n<p style="text-align: justify;">&nbsp;</p>\r\n<p style="text-align: justify;">Собствените изследвания и разроботки в областта на вентилацията довеждат до създаването на нова концепция за вентилация - проточна система ЕКО СВЕЖЕСТ. Продуктът е отличен със златен медал от Международен Технически панаир &ndash; Пловдив &ndash; 2009. Дружеството е притежател на 5 патента, два от които регистрирани Май и Октомври 2010 год. са вече в серийно производство. Сертифицирана е по ISO 9001:2008, което гарантира качеството на продуктите и практическото постигане на проектните технически параметри на изделията.</p>\r\n<p style="text-align: justify;">&nbsp;</p>\r\n<p style="text-align: justify;">В резултат на непрекъснатото технологично обновяване и внедряването на нови производства, днес фирмата е един от основните производители на електродвигатели и вентилатори и единствен български производител на вентилатори за баня.</p>\r\n<p style="text-align: justify;">&nbsp;</p>\r\n<p style="text-align: justify;"><strong>В произвоствената листа към 2014г. са включени:</strong></p>\r\n<ul>\r\n<li style="text-align: justify;">Еднофазни и трифазни електродвигатели за обща употреба с височина на оста на въртене 56, 63, 71, 80, 90, 100, 112 и 132 мм /мощност от 0,04 до 11,0 kW.&nbsp; Специални електродвигатели - за задвижване на вентилатори, за бетонобъркачки, за подемно-транспортната техника.</li>\r\n<li style="text-align: justify;">9 серии вентилатори за баня</li>\r\n<li style="text-align: justify;">3 серии вентилатори за въздуховоди</li>\r\n<li style="text-align: justify;">2 серии осеви вентилатори</li>\r\n<li style="text-align: justify;">Високотемпературни вентилатори</li>\r\n<li style="text-align: justify;">Вентилационни решетки и клапи</li>\r\n<li style="text-align: justify;">Хидравлични преси за балиране на отпадъци</li>\r\n<li style="text-align: justify;">Висококачествени алуминиеви отливки</li>\r\n</ul>\r\n<p style="text-align: justify;">&nbsp;</p>\r\n<p style="text-align: justify;">&nbsp;</p>\r\n<p style="text-align: justify;">&nbsp;</p>\r\n<p style="text-align: justify;">&nbsp;</p>\r\n<div id="mcePasteBin" style="position: absolute; top: 0px; left: 0; background: red; width: 1px; height: 1px; overflow: hidden;" contenteditable="false">\r\n<div contenteditable="true"><!--[if gte mso 9]><xml>\r\n <o:OfficeDocumentSettings>\r\n  <o:AllowPNG/>\r\n </o:OfficeDocumentSettings>\r\n</xml><![endif]-->\r\n<p class="MsoNormal" style="text-align: justify;"><strong style="mso-bidi-font-weight: normal;"><span lang="EN-US" style="font-family: ''Arial'',''sans-serif''; mso-fareast-font-family: Arial;"><span style="mso-tab-count: 1;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>ИСТОРИЯ:</span></strong></p>\r\n<p class="MsoNormal" style="text-align: justify;"><span lang="EN-US" style="font-family: ''Arial'',''sans-serif''; mso-fareast-font-family: Arial;">&nbsp;</span></p>\r\n<p class="MsoNormal" style="text-align: justify;"><span lang="EN-US" style="font-family: ''Arial'',''sans-serif''; mso-fareast-font-family: Arial;"><span style="mso-tab-count: 1;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Предприятието е основано през 1961г. като ДИП &bdquo;Метални изделия&rdquo;. С годините, започва усвояването на гама малки електродвигатели за подемно-транспортната техника и бита. През периода 1986-1991г. по френски лиценз се усвояват няколко типа вентилатори с приложение в електронно-изчислителната техника. Извършва се цялостно технологично обновление като за целта от Япония, Швейцария, Германия и Франция са доставени изключително модерни и високопроизводителни за времето си машини &ndash; стругове с &bdquo;ЦПУ&rdquo;, автоматични преси, фрези и др. От фирмата &bdquo;Статомат&rdquo; Германия е доставена автоматизирана линия за производство на статорите за двигателите на 5 вида вентилатори. Оборудвана е леярна за леене под налягане на отливки от цветни метали. </span></p>\r\n<p class="MsoNormal" style="text-align: justify;"><span lang="EN-US" style="font-family: ''Arial'',''sans-serif''; mso-fareast-font-family: Arial;"><span style="mso-tab-count: 1;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>До политическите промени през през 1990г. фабриката е част от държавно-планираната икономика на страната. В този период освен вентилатори се произвеждат<span style="mso-spacerun: yes;">&nbsp; </span>електродвигатели и помпи за перални машини, уреди за бита. Част от продукцията е предназначена за износ предимно в страни от СИВ и Близкия изток.</span></p>\r\n<p class="MsoNormal" style="text-align: justify;"><span lang="EN-US" style="font-family: ''Arial'',''sans-serif''; mso-fareast-font-family: Arial;">След промените, които настъпват в страната предприятието е преименувано на &bdquo;Микродвигатели&rdquo;<span style="mso-spacerun: yes;">&nbsp; </span>а в периода на раздържавяване -<span style="mso-spacerun: yes;">&nbsp; </span>през 1997г.<span style="mso-spacerun: yes;">&nbsp; </span>е преобразувано в акционерно дружество. Дружеството е приватизирано през 1997 и малко след това преименувано в &bdquo;ММоторс&rdquo; АД. </span></p>\r\n<p class="MsoNormal" style="text-align: justify;"><span lang="EN-US" style="font-family: ''Arial'',''sans-serif''; mso-fareast-font-family: Arial;">&nbsp;</span></p>\r\n<p class="MsoNormal" style="text-align: justify;"><span lang="EN-US" style="font-family: ''Arial'',''sans-serif''; mso-fareast-font-family: Arial;"><span style="mso-tab-count: 1;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Новото ръководство е изправено пред предизвикателствата на променящата се икономика. Завареното оборудване е остаряло, производството е енергоемко и нерентабилно и в новите пазарни условия компанията започва да губи традиционните си пазари. </span></p>\r\n<p class="MsoNormal" style="text-align: justify;"><span lang="EN-US" style="font-family: ''Arial'',''sans-serif''; mso-fareast-font-family: Arial;">&nbsp;</span></p>\r\n<p class="MsoNormal" style="text-align: justify;"><span lang="EN-US" style="font-family: ''Arial'',''sans-serif''; mso-fareast-font-family: Arial;">В периода до 2001 с новото частно управление, дружеството преживява<span style="mso-spacerun: yes;">&nbsp; </span>бурно развитие свързано с продуктово и технологично обновяване. Усвоено е призводството на асинхронни електродвигатели до 4.0 кW. Разработват се и успешно се налагат на пазара нови серии битови и промишлени вентилатори. Продукцията намира признание в страните от Балканите, ЕС, Русия и Близкия изток. </span></p>\r\n<p class="MsoNormal" style="text-align: justify;"><span lang="EN-US" style="font-family: ''Arial'',''sans-serif''; mso-fareast-font-family: Arial;">&nbsp;</span></p>\r\n<p class="MsoNormal" style="text-align: justify;"><span lang="EN-US" style="font-family: ''Arial'',''sans-serif''; mso-fareast-font-family: Arial;">Собствените изследвания и разроботки в областта на вентилацията довеждат до създаването на нова концепция за вентилация - проточна система ЕКО СВЕЖЕСТ. Продуктът е </span><span style="font-family: ''Arial'',''sans-serif''; mso-fareast-font-family: Arial; mso-font-kerning: 0pt; mso-ansi-language: BG; mso-bidi-language: BG;">отличен със златен медал от Международен Технически панаир &ndash; Пловдив &ndash; </span><span style="font-family: ''Arial'',''sans-serif''; mso-fareast-font-family: Arial; mso-font-kerning: 0pt; mso-ansi-language: BG; mso-fareast-language: BG; mso-bidi-language: BG;">2009. Дружеството е п</span><span style="font-family: ''Arial'',''sans-serif''; mso-fareast-font-family: Arial; mso-font-kerning: 0pt; mso-ansi-language: BG; mso-bidi-language: BG;">ритежател на </span><span style="font-family: ''Arial'',''sans-serif''; mso-fareast-font-family: Arial; mso-font-kerning: 0pt; mso-ansi-language: BG; mso-fareast-language: BG; mso-bidi-language: BG;">5 п</span><span style="font-family: ''Arial'',''sans-serif''; mso-fareast-font-family: Arial; mso-font-kerning: 0pt; mso-ansi-language: BG; mso-bidi-language: BG;">атента</span><span style="font-family: ''Arial'',''sans-serif''; mso-fareast-font-family: Arial; mso-font-kerning: 0pt; mso-ansi-language: BG; mso-fareast-language: BG; mso-bidi-language: BG;">, д</span><span style="font-family: ''Arial'',''sans-serif''; mso-fareast-font-family: Arial; mso-font-kerning: 0pt; mso-ansi-language: BG; mso-bidi-language: BG;">ва от които регистрирани Май и Октомври </span><span style="font-family: ''Arial'',''sans-serif''; mso-fareast-font-family: Arial; mso-font-kerning: 0pt; mso-ansi-language: BG; mso-fareast-language: BG; mso-bidi-language: BG;">2010 г</span><span style="font-family: ''Arial'',''sans-serif''; mso-fareast-font-family: Arial; mso-font-kerning: 0pt; mso-ansi-language: BG; mso-bidi-language: BG;">од</span><span style="font-family: ''Arial'',''sans-serif''; mso-fareast-font-family: Arial; mso-font-kerning: 0pt; mso-ansi-language: BG; mso-fareast-language: BG; mso-bidi-language: BG;">. с</span><span style="font-family: ''Arial'',''sans-serif''; mso-fareast-font-family: Arial; mso-font-kerning: 0pt; mso-ansi-language: BG; mso-bidi-language: BG;">а вече в серийно производство</span><span style="font-family: ''Arial'',''sans-serif''; mso-fareast-font-family: Arial; mso-font-kerning: 0pt; mso-ansi-language: BG; mso-fareast-language: BG; mso-bidi-language: BG;">. С</span><span style="font-family: ''Arial'',''sans-serif''; mso-fareast-font-family: Arial; mso-font-kerning: 0pt; mso-ansi-language: BG; mso-bidi-language: BG;">ертифицирана е по </span><span style="font-family: ''Arial'',''sans-serif''; mso-fareast-font-family: Arial; mso-font-kerning: 0pt; mso-ansi-language: BG; mso-fareast-language: BG; mso-bidi-language: BG;">ISO 9001:2008, к</span><span style="font-family: ''Arial'',''sans-serif''; mso-fareast-font-family: Arial; mso-font-kerning: 0pt; mso-ansi-language: BG; mso-bidi-language: BG;">оето гарантира качеството на продуктите и практическото постигане на проектните технически параметри на изделията</span><span style="font-family: ''Arial'',''sans-serif''; mso-fareast-font-family: Arial; mso-font-kerning: 0pt; mso-ansi-language: BG; mso-fareast-language: BG; mso-bidi-language: BG;">.</span></p>\r\n<p class="MsoNormal" style="text-align: justify;"><span style="font-family: ''Arial'',''sans-serif''; mso-fareast-font-family: Arial; mso-font-kerning: 0pt; mso-ansi-language: BG; mso-fareast-language: BG; mso-bidi-language: BG;">&nbsp;</span></p>\r\n<p class="MsoNormal" style="text-align: justify;"><span style="font-family: ''Arial'',''sans-serif''; mso-fareast-font-family: Arial; mso-font-kerning: 0pt; mso-ansi-language: BG; mso-fareast-language: BG; mso-bidi-language: BG;">В резултат на непрекъснатото технологично обновяване и внедряването на нови производства, днес фирмата е един от основните производители на електродвигатели и вентилатори и единствен български производител на вентилатори за баня.</span></p>\r\n<p class="MsoNormal" style="text-align: justify;"><span lang="EN-US" style="font-family: ''Arial'',''sans-serif''; mso-fareast-font-family: Arial;">&nbsp;</span></p>\r\n<p class="MsoNormal" style="text-align: justify;"><strong style="mso-bidi-font-weight: normal;"><span lang="EN-US" style="font-family: ''Arial'',''sans-serif''; mso-fareast-font-family: Arial;">В произвоствената листа към 2014г. са включени:</span></strong></p>\r\n<p class="MsoNormal" style="text-align: justify;"><span lang="EN-US" style="font-family: ''Arial'',''sans-serif''; mso-fareast-font-family: Arial;">- Е</span><span lang="EN-US" style="font-family: ''Arial'',''sans-serif''; mso-bidi-font-family: ''Times New Roman'';">днофазни и трифазни електродвигатели за обща употреба с височина на оста на въртене 56, 63, 71, 80, 90, 100, 112 и 132 мм /мощност от 0,04 до 11,0 kW. Специални електродвигатели - за задвижване на вентилатори, за бетонобъркачки, за подемно-транспортната техника.</span></p>\r\n<p class="MsoNormal" style="text-align: justify;"><span lang="EN-US" style="font-family: ''Arial'',''sans-serif''; mso-bidi-font-family: ''Times New Roman'';">-<span style="mso-spacerun: yes;">&nbsp; </span>9 серии вентилатори за баня</span></p>\r\n<p class="MsoNormal" style="text-align: justify;"><span lang="EN-US" style="font-family: ''Arial'',''sans-serif''; mso-bidi-font-family: ''Times New Roman'';">-<span style="mso-spacerun: yes;">&nbsp; </span>3 серии вентилатори за въздуховоди</span></p>\r\n<p class="MsoNormal" style="text-align: justify;"><span lang="EN-US" style="font-family: ''Arial'',''sans-serif''; mso-bidi-font-family: ''Times New Roman'';">-<span style="mso-spacerun: yes;">&nbsp; </span>2 серии осеви вентилатори</span></p>\r\n<p class="MsoNormal" style="text-align: justify;"><span lang="EN-US" style="font-family: ''Arial'',''sans-serif''; mso-bidi-font-family: ''Times New Roman'';">-<span style="mso-spacerun: yes;">&nbsp; </span>Високотемпературни вентилатори</span></p>\r\n<p class="MsoNormal" style="text-align: justify;"><span lang="EN-US" style="font-family: ''Arial'',''sans-serif''; mso-bidi-font-family: ''Times New Roman'';">-<span style="mso-spacerun: yes;">&nbsp; </span>Вентилационни решетки и клапи</span></p>\r\n<p class="MsoNormal" style="text-align: justify;"><span lang="EN-US" style="font-family: ''Arial'',''sans-serif''; mso-bidi-font-family: ''Times New Roman'';">-<span style="mso-spacerun: yes;">&nbsp; </span>Хидравлични преси за балиране на отпадъци</span></p>\r\n<p class="MsoNormal" style="text-align: justify;"><span lang="EN-US" style="font-family: ''Arial'',''sans-serif''; mso-bidi-font-family: ''Times New Roman'';">-<span style="mso-spacerun: yes;">&nbsp; </span>Висококачествени алуминиеви отливки</span></p>\r\n<p class="MsoNormal" style="text-align: justify;"><span lang="EN-US" style="font-family: ''Arial'',''sans-serif''; mso-bidi-font-family: ''Times New Roman'';">&nbsp;</span></p>\r\n<p class="MsoNormal" style="text-align: justify;"><span lang="EN-US" style="font-family: ''Arial'',''sans-serif''; mso-bidi-font-family: ''Times New Roman'';">&nbsp;</span></p>\r\n<p class="MsoNormal" style="text-align: justify;"><span lang="EN-US" style="font-family: ''Arial'',''sans-serif''; mso-fareast-font-family: Arial;">&nbsp;</span></p>\r\n<p class="MsoNormal" style="text-align: justify;"><span lang="EN-US" style="font-size: 9.0pt; mso-bidi-font-size: 10.0pt; font-family: ''Arial'',''sans-serif''; mso-bidi-font-family: ''Times New Roman''; color: #595959;">&nbsp;</span></p>\r\n<!--[if gte mso 9]><xml>\r\n <w:WordDocument>\r\n  <w:View>Normal</w:View>\r\n  <w:Zoom>0</w:Zoom>\r\n  <w:TrackMoves/>\r\n  <w:TrackFormatting/>\r\n  <w:HyphenationZone>21</w:HyphenationZone>\r\n  <w:PunctuationKerning/>\r\n  <w:ValidateAgainstSchemas/>\r\n  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>\r\n  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>\r\n  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>\r\n  <w:DoNotPromoteQF/>\r\n  <w:LidThemeOther>BG</w:LidThemeOther>\r\n  <w:LidThemeAsian>X-NONE</w:LidThemeAsian>\r\n  <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>\r\n  <w:Compatibility>\r\n   <w:BreakWrappedTables/>\r\n   <w:SnapToGridInCell/>\r\n   <w:WrapTextWithPunct/>\r\n   <w:UseAsianBreakRules/>\r\n   <w:DontGrowAutofit/>\r\n   <w:SplitPgBreakAndParaMark/>\r\n   <w:EnableOpenTypeKerning/>\r\n   <w:DontFlipMirrorIndents/>\r\n   <w:OverrideTableStyleHps/>\r\n  </w:Compatibility>\r\n  <m:mathPr>\r\n   <m:mathFont m:val="Cambria Math"/>\r\n   <m:brkBin m:val="before"/>\r\n   <m:brkBinSub m:val="--"/>\r\n   <m:smallFrac m:val="off"/>\r\n   <m:dispDef/>\r\n   <m:lMargin m:val="0"/>\r\n   <m:rMargin m:val="0"/>\r\n   <m:defJc m:val="centerGroup"/>\r\n   <m:wrapIndent m:val="1440"/>\r\n   <m:intLim m:val="subSup"/>\r\n   <m:naryLim m:val="undOvr"/>\r\n  </m:mathPr></w:WordDocument>\r\n</xml><![endif]--><!--[if gte mso 9]><xml>\r\n <w:LatentStyles DefLockedState="false" DefUnhideWhenUsed="false"\r\n  DefSemiHidden="false" DefQFormat="false" DefPriority="99"\r\n  LatentStyleCount="371">\r\n  <w:LsdException Locked="false" Priority="0" QFormat="true" Name="Normal"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 1"/>\r\n  <w:LsdException Locked="false" Priority="9" SemiHidden="true"\r\n   UnhideWhenUsed="true" QFormat="true" Name="heading 2"/>\r\n  <w:LsdException Locked="false" Priority="9" SemiHidden="true"\r\n   UnhideWhenUsed="true" QFormat="true" Name="heading 3"/>\r\n  <w:LsdException Locked="false" Priority="9" SemiHidden="true"\r\n   UnhideWhenUsed="true" QFormat="true" Name="heading 4"/>\r\n  <w:LsdException Locked="false" Priority="9" SemiHidden="true"\r\n   UnhideWhenUsed="true" QFormat="true" Name="heading 5"/>\r\n  <w:LsdException Locked="false" Priority="9" SemiHidden="true"\r\n   UnhideWhenUsed="true" QFormat="true" Name="heading 6"/>\r\n  <w:LsdException Locked="false" Priority="9" SemiHidden="true"\r\n   UnhideWhenUsed="true" QFormat="true" Name="heading 7"/>\r\n  <w:LsdException Locked="false" Priority="9" SemiHidden="true"\r\n   UnhideWhenUsed="true" QFormat="true" Name="heading 8"/>\r\n  <w:LsdException Locked="false" Priority="9" SemiHidden="true"\r\n   UnhideWhenUsed="true" QFormat="true" Name="heading 9"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="index 1"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="index 2"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="index 3"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="index 4"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="index 5"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="index 6"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="index 7"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="index 8"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="index 9"/>\r\n  <w:LsdException Locked="false" Priority="39" SemiHidden="true"\r\n   UnhideWhenUsed="true" Name="toc 1"/>\r\n  <w:LsdException Locked="false" Priority="39" SemiHidden="true"\r\n   UnhideWhenUsed="true" Name="toc 2"/>\r\n  <w:LsdException Locked="false" Priority="39" SemiHidden="true"\r\n   UnhideWhenUsed="true" Name="toc 3"/>\r\n  <w:LsdException Locked="false" Priority="39" SemiHidden="true"\r\n   UnhideWhenUsed="true" Name="toc 4"/>\r\n  <w:LsdException Locked="false" Priority="39" SemiHidden="true"\r\n   UnhideWhenUsed="true" Name="toc 5"/>\r\n  <w:LsdException Locked="false" Priority="39" SemiHidden="true"\r\n   UnhideWhenUsed="true" Name="toc 6"/>\r\n  <w:LsdException Locked="false" Priority="39" SemiHidden="true"\r\n   UnhideWhenUsed="true" Name="toc 7"/>\r\n  <w:LsdException Locked="false" Priority="39" SemiHidden="true"\r\n   UnhideWhenUsed="true" Name="toc 8"/>\r\n  <w:LsdException Locked="false" Priority="39" SemiHidden="true"\r\n   UnhideWhenUsed="true" Name="toc 9"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="Normal Indent"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="footnote text"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="annotation text"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="header"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="footer"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="index heading"/>\r\n  <w:LsdException Locked="false" Priority="35" SemiHidden="true"\r\n   UnhideWhenUsed="true" QFormat="true" Name="caption"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="table of figures"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="envelope address"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="envelope return"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="footnote reference"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="annotation reference"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="line number"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="page number"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="endnote reference"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="endnote text"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="table of authorities"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="macro"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="toa heading"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="List"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="List Bullet"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="List Number"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="List 2"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="List 3"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="List 4"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="List 5"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="List Bullet 2"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="List Bullet 3"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="List Bullet 4"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="List Bullet 5"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="List Number 2"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="List Number 3"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="List Number 4"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="List Number 5"/>\r\n  <w:LsdException Locked="false" Priority="10" QFormat="true" Name="Title"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="Closing"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="Signature"/>\r\n  <w:LsdException Locked="false" Priority="0" SemiHidden="true"\r\n   UnhideWhenUsed="true" Name="Default Paragraph Font"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="Body Text"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="Body Text Indent"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="List Continue"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="List Continue 2"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="List Continue 3"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="List Continue 4"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="List Continue 5"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="Message Header"/>\r\n  <w:LsdException Locked="false" Priority="11" QFormat="true" Name="Subtitle"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="Salutation"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="Date"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="Body Text First Indent"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="Body Text First Indent 2"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="Note Heading"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="Body Text 2"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="Body Text 3"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="Body Text Indent 2"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="Body Text Indent 3"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="Block Text"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="Hyperlink"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="FollowedHyperlink"/>\r\n  <w:LsdException Locked="false" Priority="22" QFormat="true" Name="Strong"/>\r\n  <w:LsdException Locked="false" Priority="20" QFormat="true" Name="Emphasis"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="Document Map"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="Plain Text"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="E-mail Signature"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="HTML Top of Form"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="HTML Bottom of Form"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="Normal (Web)"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="HTML Acronym"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="HTML Address"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="HTML Cite"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="HTML Code"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="HTML Definition"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="HTML Keyboard"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="HTML Preformatted"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="HTML Sample"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="HTML Typewriter"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="HTML Variable"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="Normal Table"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="annotation subject"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="No List"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="Outline List 1"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="Outline List 2"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="Outline List 3"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="Table Simple 1"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="Table Simple 2"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="Table Simple 3"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="Table Classic 1"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="Table Classic 2"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="Table Classic 3"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="Table Classic 4"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="Table Colorful 1"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="Table Colorful 2"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="Table Colorful 3"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="Table Columns 1"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="Table Columns 2"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="Table Columns 3"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="Table Columns 4"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="Table Columns 5"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="Table Grid 1"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="Table Grid 2"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="Table Grid 3"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="Table Grid 4"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="Table Grid 5"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="Table Grid 6"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="Table Grid 7"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="Table Grid 8"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="Table List 1"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="Table List 2"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="Table List 3"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="Table List 4"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="Table List 5"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="Table List 6"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="Table List 7"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="Table List 8"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="Table 3D effects 1"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="Table 3D effects 2"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="Table 3D effects 3"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="Table Contemporary"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="Table Elegant"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="Table Professional"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="Table Subtle 1"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="Table Subtle 2"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="Table Web 1"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="Table Web 2"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="Table Web 3"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="Balloon Text"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="Table Grid"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"\r\n   Name="Table Theme"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" Name="Placeholder Text"/>\r\n  <w:LsdException Locked="false" Priority="1" QFormat="true" Name="No Spacing"/>\r\n  <w:LsdException Locked="false" Priority="60" Name="Light Shading"/>\r\n  <w:LsdException Locked="false" Priority="61" Name="Light List"/>\r\n  <w:LsdException Locked="false" Priority="62" Name="Light Grid"/>\r\n  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1"/>\r\n  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2"/>\r\n  <w:LsdException Locked="false" Priority="65" Name="Medium List 1"/>\r\n  <w:LsdException Locked="false" Priority="66" Name="Medium List 2"/>\r\n  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1"/>\r\n  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2"/>\r\n  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3"/>\r\n  <w:LsdException Locked="false" Priority="70" Name="Dark List"/>\r\n  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading"/>\r\n  <w:LsdException Locked="false" Priority="72" Name="Colorful List"/>\r\n  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid"/>\r\n  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 1"/>\r\n  <w:LsdException Locked="false" SemiHidden="true" Name="Revision"/>\r\n  <w:LsdException Locked="false" Priority="34" QFormat="true"\r\n   Name="List Paragraph"/>\r\n  <w:LsdException Locked="false" Priority="29" QFormat="true" Name="Quote"/>\r\n  <w:LsdException Locked="false" Priority="30" QFormat="true"\r\n   Name="Intense Quote"/>\r\n  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="19" QFormat="true"\r\n   Name="Subtle Emphasis"/>\r\n  <w:LsdException Locked="false" Priority="21" QFormat="true"\r\n   Name="Intense Emphasis"/>\r\n  <w:LsdException Locked="false" Priority="31" QFormat="true"\r\n   Name="Subtle Reference"/>\r\n  <w:LsdException Locked="false" Priority="32" QFormat="true"\r\n   Name="Intense Reference"/>\r\n  <w:LsdException Locked="false" Priority="33" QFormat="true" Name="Book Title"/>\r\n  <w:LsdException Locked="false" Priority="37" SemiHidden="true"\r\n   UnhideWhenUsed="true" Name="Bibliography"/>\r\n  <w:LsdException Locked="false" Priority="39" SemiHidden="true"\r\n   UnhideWhenUsed="true" QFormat="true" Name="TOC Heading"/>\r\n  <w:LsdException Locked="false" Priority="41" Name="Plain Table 1"/>\r\n  <w:LsdException Locked="false" Priority="42" Name="Plain Table 2"/>\r\n  <w:LsdException Locked="false" Priority="43" Name="Plain Table 3"/>\r\n  <w:LsdException Locked="false" Priority="44" Name="Plain Table 4"/>\r\n  <w:LsdException Locked="false" Priority="45" Name="Plain Table 5"/>\r\n  <w:LsdException Locked="false" Priority="40" Name="Grid Table Light"/>\r\n  <w:LsdException Locked="false" Priority="46" Name="Grid Table 1 Light"/>\r\n  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2"/>\r\n  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3"/>\r\n  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4"/>\r\n  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark"/>\r\n  <w:LsdException Locked="false" Priority="51" Name="Grid Table 6 Colorful"/>\r\n  <w:LsdException Locked="false" Priority="52" Name="Grid Table 7 Colorful"/>\r\n  <w:LsdException Locked="false" Priority="46"\r\n   Name="Grid Table 1 Light Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="51"\r\n   Name="Grid Table 6 Colorful Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="52"\r\n   Name="Grid Table 7 Colorful Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="46"\r\n   Name="Grid Table 1 Light Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="51"\r\n   Name="Grid Table 6 Colorful Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="52"\r\n   Name="Grid Table 7 Colorful Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="46"\r\n   Name="Grid Table 1 Light Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="51"\r\n   Name="Grid Table 6 Colorful Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="52"\r\n   Name="Grid Table 7 Colorful Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="46"\r\n   Name="Grid Table 1 Light Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="51"\r\n   Name="Grid Table 6 Colorful Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="52"\r\n   Name="Grid Table 7 Colorful Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="46"\r\n   Name="Grid Table 1 Light Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="51"\r\n   Name="Grid Table 6 Colorful Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="52"\r\n   Name="Grid Table 7 Colorful Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="46"\r\n   Name="Grid Table 1 Light Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="51"\r\n   Name="Grid Table 6 Colorful Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="52"\r\n   Name="Grid Table 7 Colorful Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="46" Name="List Table 1 Light"/>\r\n  <w:LsdException Locked="false" Priority="47" Name="List Table 2"/>\r\n  <w:LsdException Locked="false" Priority="48" Name="List Table 3"/>\r\n  <w:LsdException Locked="false" Priority="49" Name="List Table 4"/>\r\n  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark"/>\r\n  <w:LsdException Locked="false" Priority="51" Name="List Table 6 Colorful"/>\r\n  <w:LsdException Locked="false" Priority="52" Name="List Table 7 Colorful"/>\r\n  <w:LsdException Locked="false" Priority="46"\r\n   Name="List Table 1 Light Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="51"\r\n   Name="List Table 6 Colorful Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="52"\r\n   Name="List Table 7 Colorful Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="46"\r\n   Name="List Table 1 Light Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="51"\r\n   Name="List Table 6 Colorful Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="52"\r\n   Name="List Table 7 Colorful Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="46"\r\n   Name="List Table 1 Light Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="51"\r\n   Name="List Table 6 Colorful Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="52"\r\n   Name="List Table 7 Colorful Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="46"\r\n   Name="List Table 1 Light Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="51"\r\n   Name="List Table 6 Colorful Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="52"\r\n   Name="List Table 7 Colorful Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="46"\r\n   Name="List Table 1 Light Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="51"\r\n   Name="List Table 6 Colorful Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="52"\r\n   Name="List Table 7 Colorful Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="46"\r\n   Name="List Table 1 Light Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="51"\r\n   Name="List Table 6 Colorful Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="52"\r\n   Name="List Table 7 Colorful Accent 6"/>\r\n </w:LatentStyles>\r\n</xml><![endif]--><!--[if gte mso 10]>\r\n<style>\r\n /* Style Definitions */\r\n table.MsoNormalTable\r\n	{mso-style-name:"Table Normal";\r\n	mso-tstyle-rowband-size:0;\r\n	mso-tstyle-colband-size:0;\r\n	mso-style-noshow:yes;\r\n	mso-style-priority:99;\r\n	mso-style-parent:"";\r\n	mso-padding-alt:0cm 5.4pt 0cm 5.4pt;\r\n	mso-para-margin:0cm;\r\n	mso-para-margin-bottom:.0001pt;\r\n	mso-pagination:widow-orphan;\r\n	font-size:10.0pt;\r\n	font-family:"Times New Roman","serif";}\r\n</style>\r\n<![endif]--></div>\r\n</div>', 21, 'BG');
INSERT INTO `zcms_pages_lang` (`id`, `title`, `keywords`, `description`, `html`, `id_`, `lang_id`) VALUES
(25, 'Фирмена философия', '', '', '<p style="text-align: justify;">Фирмената философия на ММОТОРС се основава на богатия търговски опит на нейните основатели. Основна мисия е създаването на <strong>к</strong><strong>ачествен и достъпен продукт &ndash; родно производство</strong><strong>, к</strong><strong>онкурентен на водещите световни производители</strong>. Нашата цел е да затвърдим и разширим настоящите си пазарни позиции чрез качество, продуктово многообразие и достъпна цена.</p>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;">Стратегията, която следваме за да постигнем тази цел включва внедряване на най-добрите производствени и търговски практики, постоянни инвестиции в технологично обновяване и увеличаване на производителността на труда. Вярваме, че следвайки този курс, фирмата ще утвърди позициите си на вътрешния и външните пазари и ще бъде предпочитан доставчик, предлагайки по-високо качество и по-достъпни цени.</p>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;">За да постигнем това ние поддържаме тясна връзка с нашите клиенти и дистрибутори. Нашите търговски представители са обучени да разбират и оценяват нуждите на клиентите ни както и да разработват и прилагат цялостни решения за покриване на нуждите на всеки индивидуален клиент.</p>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;">Всички наши продукти се произвеждат от висококачествени материали - разрешени за използване в страните от Европейския Съюз и в съответствие с изискванията на европейското законодателство.</p>\n<p style="text-align: justify;">&nbsp;</p>', 22, 'BG'),
(26, 'Структура', '', '', '<div class="col-md-4" style="font-family: ''Ubuntu Condensed'',Helvetica Nue,Arial,sans-serif;">\n<p><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong></p>\n<p><strong>ПРОИЗВОДСТВО И АДМИНИСТРАЦИЯ:</strong></p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ФАБРИКА - ЕТРОПОЛЕ</p>\n<p><strong>&nbsp;</strong></p>\n<p><strong> ТЪРГОВСКИ ОФИСИ В СТРАНАТА:</strong></p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; СОФИЯ</p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="?id=1">ПЛЕВЕН</a></p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ВАРНА</p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; БУРГАС</p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ПЛОВДИВ</p>\n<p>&nbsp;</p>\n<p><strong>ВЪНШНОТЪРГОВСКИ ПРЕДСТАВИТЕЛСТВА:</strong></p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ОБЕДИНЕНОТО КРАЛСТВО</p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; РУСИЯ</p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ГЪРЦИЯ</p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; EГИПЕТ</p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; МАЛТА</p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; КАЗАХСТАН</p>\n<p><em>&nbsp;</em></p>\n</div>\n<p>{html/html_google_map}</p>', 23, 'BG'),
(27, 'Производствена база', '', '', '<p>...</p>', 24, 'BG'),
(28, 'Контрол на качеството', '', '', '<p>...</p>', 25, 'BG'),
(29, 'Иновации', '', '', '<p>...</p>', 26, 'BG'),
(30, 'Референции', '', '', '<p>...</p>', 27, 'BG'),
(31, 'Контакт с управленския екип', '', '', '<p>{menus/menus_recursive_simple:18,menus_menu_firm} {html/html_query:0,teodorklissarov@gmail.com}</p>', 28, 'BG'),
(32, 'Търговски отдел', '', '', '<p>...</p>', 29, 'BG'),
(33, 'Технически отдел', '', '', '<p>...</p>', 30, 'BG'),
(34, 'Счетоводство', '', '', '<p>...</p>', 31, 'BG'),
(35, 'Каталози за изтегляне', '', '', '<p>...</p>', 32, 'BG'),
(36, 'Промоции и нови продукти', '', '', '<p>...</p>', 33, 'BG'),
(37, 'Проточни системи', '', '', '<p>{products/product_pathway:14}</p>\n<div class="container content">{menus/menus_recursive_simple:13,menus_menu_side} {products/product_listing:14,mmotors_flow_systems,id}{products/product_view}</div>', 34, 'BG'),
(38, 'Производство на отоплителни уреди', '', '', '<p>....</p>', 35, 'BG'),
(39, 'Дъщерно лекарско дружество', '', '', '<p>...</p>', 36, 'BG'),
(40, 'Mmotors - Начало', '', '', '<p>{html/html_slider:home}</p>\n<div id="category-overview">\n<div class="co-row">\n<div class="co-category"><img src="/dev/mmotors-site/public/images/co-engines.png" alt="" /> <a href="http://dildesign-studio.com/dev/mmotors-site/index.php/frontend/pages/index/mmotors_engines">Производство на електродвигатели</a></div>\n<div class="co-category"><img src="/dev/mmotors-site/public/images/co-fans.png" alt="" /> <a href="http://dildesign-studio.com/dev/mmotors-site/index.php/frontend/pages/index/mmotors_fans">Производство на Вентилатори</a></div>\n</div>\n<div class="co-row">\n<div class="co-category"><img src="/dev/mmotors-site/public/images/co-heating.png" alt="" /> <a href="http://dildesign-studio.com/dev/mmotors-site/index.php/frontend/pages/index/heaters">Производство на отоплителни уреди</a></div>\n<div class="co-category"><img src="/dev/mmotors-site/public/images/co-medical.png" alt="" /> <a href="http://dildesign-studio.com/dev/mmotors-site/index.php/frontend/pages/index/medical_association">Дъщерно лекарско дружество</a></div>\n</div>\n</div>\n<div id="news-overview">\n<div class="news-cont">\n<div class="news-cont-cell">\n<h3>MM MOTORS</h3>\n<p>"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>\n<p>&nbsp;</p>\n<p>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum." "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."</p>\n</div>\n<div class="news-cont-cell">\n<h3>Новини</h3>\n{html/html_news:2,html_news_home}</div>\n</div>\n</div>\n<div id="bottom-section">\n<div class="bs-links-content">\n<div id="mmotors-world" class="bs-link"><a><strong> ММ MOTORS </strong> <br />- представителства по света</a></div>\n<div id="youtube-videos" class="bs-link"><a><strong> ММ MOTORS </strong> <br />- рекламни клипове</a></div>\n<div id="mmotors-coop" class="bs-link"><a><strong> ММ MOTORS </strong> <br />- Предложение за сътрудничество</a></div>\n</div>\n</div>', 5, 'EN'),
(41, '404 Page not found', '', '', '<div id="bottom-section">\n<h3>404 Page not found</h3>\n<p>Unfortunatelly the page has not been found.</p>\n</div>', 4, 'EN');

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
