-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Хост: avm.mysql.ukraine.com.ua
-- Час створення: Чрв 11 2018 р., 13:00
-- Версія сервера: 5.7.16-10-log
-- Версія PHP: 7.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База даних: `avm_nkznew`
--

-- --------------------------------------------------------

--
-- Структура таблиці `osc_about_page`
--

CREATE TABLE `osc_about_page` (
  `id` int(11) NOT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `dev_desc` text,
  `projects_caption` varchar(255) DEFAULT NULL,
  `projects_desc` text,
  `stat` text,
  `map` varchar(255) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_keys` varchar(255) DEFAULT NULL,
  `meta_desc` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `osc_about_page`
--

INSERT INTO `osc_about_page` (`id`, `caption`, `dev_desc`, `projects_caption`, `projects_desc`, `stat`, `map`, `meta_title`, `meta_keys`, `meta_desc`, `created`, `modified`) VALUES
(1, 'avm development group', '<p>Специализация нашей компании - пригородные проекты с развитой инфаструктурой и удобным месторасположением.</p>\r\n<p>Каждый наш проект сочетает в себе преимущества активной городской жизни и тихого, комфортного пригорода.</p>', 'Комплексные строительные проекты', '<p>AVM Development Group реализует комплексные строительные проекты \"под ключ\" от концепции до сдачи в эксплуатацию и предоставляем: </p>\r\n			<ul>\r\n				<li>собственное архитектурное бюро;</li>\r\n				<li>генподрядная организация;</li>\r\n				<li>службы заказчика и обслуживания недвижимости.</li>\r\n			</ul>\r\n', '3 комплекса*строится;\r\n5 комплексов*введено в эксплуатацию;\r\n36 га*площадь застройки;\r\n520 квартир*на стадии строительства;\r\n40 000 м2*сдано в эксплуатацию;\r\n6 лет*на рынке;', 'map.jpg', '', '', '', '2018-01-02 00:00:00', '2018-01-10 17:38:41');

-- --------------------------------------------------------

--
-- Структура таблиці `osc_admin_menu`
--

CREATE TABLE `osc_admin_menu` (
  `id` int(11) NOT NULL,
  `type` int(6) NOT NULL DEFAULT '0',
  `parent` int(6) NOT NULL DEFAULT '0',
  `table` varchar(255) DEFAULT '',
  `additional_fields` text,
  `landing_settings` text,
  `view_settings` text,
  `edit_settings` text,
  `create_settings` text,
  `form_params` longtext,
  `menu_params` longtext,
  `cardRelations` text,
  `assign` int(5) NOT NULL DEFAULT '0',
  `name` varchar(127) NOT NULL DEFAULT '0',
  `alias` varchar(127) NOT NULL DEFAULT '0',
  `filename` varchar(127) NOT NULL DEFAULT '0',
  `order_id` int(5) NOT NULL DEFAULT '0',
  `details` text,
  `block` int(1) NOT NULL DEFAULT '0',
  `link` varchar(255) NOT NULL DEFAULT '#',
  `dateCreate` datetime NOT NULL,
  `dateModify` datetime NOT NULL,
  `adminMod` int(7) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `osc_admin_menu`
--

INSERT INTO `osc_admin_menu` (`id`, `type`, `parent`, `table`, `additional_fields`, `landing_settings`, `view_settings`, `edit_settings`, `create_settings`, `form_params`, `menu_params`, `cardRelations`, `assign`, `name`, `alias`, `filename`, `order_id`, `details`, `block`, `link`, `dateCreate`, `dateModify`, `adminMod`) VALUES
(1, 1, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Учетная запись', 'personal', 'user-icon-slider.png', 1, 'Учетная запись пользователя', 0, '#', '2013-11-15 02:52:32', '2013-11-15 05:40:23', 1),
(2, 1, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Пользователи', 'users', 'all-users-icon-slider.png', 5, 'Управление пользователями системы', 0, '#1', '2013-11-15 02:55:52', '2013-11-15 02:55:52', 1),
(3, 1, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Материалы', 'articles', 'materials-icon-slider.png', 4, 'Управления материалами сайта', 0, '#', '2013-11-15 02:57:55', '2013-11-15 02:57:55', 1),
(5, 1, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Настройки', 'settings', 'settings-icon-slider.png', 7, 'Настройки системы', 0, '#', '2013-11-15 03:00:21', '2014-11-22 18:17:26', 1),
(6, 1, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Помощь', 'help', 'help-icon-slider.png', 6, 'Помощь администратору', 1, '#', '2013-11-15 03:01:26', '2015-04-20 16:39:41', 1),
(7, 1, 1, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Профиль', 'profile', 'fa-user-circle', 3, 'Личный кабинет администратора', 0, '#', '2013-11-15 03:03:08', '2013-11-15 15:55:43', 1),
(8, 1, 2, 'admin_menu', '[]', '[]', '[]', '[]', NULL, NULL, '{\"start\":\"landing\",\"landing\":0,\"view\":0,\"edit\":0,\"create\":0}', '[]', 0, 'Все пользователи', 'users-list', 'fa-user', 1, 'Список пользователей системой', 0, '#', '2013-11-15 03:04:34', '2013-11-15 16:06:43', 1),
(10, 1, 2, 'admin_menu', '[]', '[]', '[]', '[]', NULL, NULL, '{\"start\":\"landing\",\"landing\":0,\"view\":0,\"edit\":0,\"create\":0}', '[]', 0, 'Группы пользователей', 'users-levels', 'fa-users', 3, 'Уровни или типы пользователей системы', 0, '#', '2013-11-15 03:07:17', '2013-11-15 16:07:21', 1),
(11, 1, 2, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Добавить новую группу', 'add-user-level', '0', 4, 'Создание нового уровня для пользователей', 1, '#', '2013-11-15 03:09:35', '2013-11-15 16:07:46', 1),
(12, 1, 3, 'admin_menu', '[]', '[]', '[]', '[]', NULL, NULL, '{\"start\":\"landing\",\"landing\":0,\"view\":0,\"edit\":0,\"create\":0}', '[]', 0, 'Менеджер материалов', 'articles-manager', '0', 2, 'Управление материалами сайта', 1, '#', '2013-11-15 03:10:50', '2015-08-12 15:38:48', 1),
(13, 1, 3, 'admin_menu', '[]', '[]', '[]', '[]', NULL, NULL, '{\"start\":\"landing\",\"landing\":0,\"view\":0,\"edit\":0,\"create\":0}', '[]', 0, 'Категории материалов', 'articles-categories', '0', 1, 'Управление категориями материалов', 1, '#', '2013-11-15 03:11:43', '2015-08-12 15:38:52', 1),
(14, 1, 3, 'admin_menu', '[]', '[]', '[]', '[]', NULL, NULL, '{\"start\":\"landing\",\"landing\":0,\"view\":0,\"edit\":0,\"create\":0}', '[]', 0, 'Баннер на главной', 'banners-system', '0', 3, 'Управление баннерной системой на сайте', 1, '#', '2013-11-15 03:12:29', '2016-11-22 12:48:18', 1),
(15, 1, 3, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Контент блоки', 'content-blocks', '0', 4, 'Управление контент блоками на сайте', 1, '#', '2013-11-15 03:13:24', '2015-08-12 15:40:07', 1),
(16, 1, 3, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Вопрос-ответ', 'faq', '0', 5, 'Управление FAQ', 1, '#', '2013-11-15 03:14:49', '2016-10-21 23:47:54', 1),
(24, 1, 5, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Общие', 'global-settings', 'fa-cogs', 1, 'Глобальные настройки системы', 0, '#', '2013-11-15 03:30:00', '2016-11-25 18:00:00', 1),
(25, 1, 5, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Настройки магазина', 'shop-manage', '0', 4, 'Управление SEO параметрами', 1, '#', '2013-11-15 03:30:39', '2016-10-20 15:31:34', 1),
(26, 1, 6, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Задать вопрос', 'help-question', '0', 1, 'Задать вопрос супер администратору', 0, '#', '2013-11-15 03:31:18', '2013-11-15 03:31:18', 1),
(28, 1, 1, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Задания', 'profile-zadaniya', 'fa-tasks', 1, 'Входящие заказы с ИМ', 0, '#', '2013-11-15 15:56:25', '2014-12-21 16:13:07', 1),
(29, 1, 1, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Сообщения', 'profile-message', 'fa-envelope', 2, 'Личные сообщения пользователю от других админов', 0, '#', '2013-11-15 15:59:29', '2013-11-15 15:59:29', 1),
(30, 1, 3, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Менеджер меню', 'menu-manager', 'fa-bars', 0, 'Менеджер меню', 0, '#', '2013-11-15 16:01:48', '2015-08-12 15:38:40', 1),
(31, 1, 2, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Рассылка пользователям', 'users-sender', '0', 5, 'Почтовая рассылка пользователям', 1, '#', '2013-11-15 16:09:10', '2014-10-18 19:12:42', 1),
(38, 1, 1, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Входящие заказы', 'profile-in-orders', '0', 0, 'Новые заказы с ИМ', 1, '#', '2014-12-21 16:14:09', '2016-10-21 16:37:37', 1),
(40, 1, 3, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Галереи', 'galleries', '0', 8, 'Медиа галлереи', 1, '#', '2015-08-12 15:37:47', '2016-12-08 00:42:59', 1),
(43, 1, 3, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Отзывы', 'art-comments', '0', 15, 'Отзывы к статьям', 1, '#', '2015-09-18 10:11:28', '2016-10-21 23:48:05', 1),
(45, 1, 1, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Обратный звонок', 'income-questions', 'fa-phone', 0, '', 0, '#', '2016-10-21 16:37:00', '2016-10-21 16:37:18', 1),
(46, 1, 5, 'admin_menu', '[]', '[]', '[]', '[]', NULL, NULL, '{\"start\":\"landing\",\"landing\":0,\"view\":0,\"edit\":0,\"create\":0}', '[]', 0, 'Мультиязычность', 'languages', '0', 3, '', 1, '#', '2016-11-16 11:19:20', '2016-11-25 18:00:20', 1),
(47, 1, 5, 'admin_menu', '[]', '[]', '[]', '[]', NULL, NULL, '{\"start\":\"landing\",\"landing\":0,\"view\":0,\"edit\":0,\"create\":0}', '[]', 0, 'Категории формы обратной связи', 'contact-categories', '0', 2, '', 1, '#', '2016-11-21 11:24:28', '2016-11-25 18:00:15', 1),
(49, 1, 5, 'admin_menu', '[]', '[]', '[]', '[]', NULL, NULL, '{\"start\":\"landing\",\"landing\":0,\"view\":0,\"edit\":0,\"create\":0}', '[]', 0, 'Статичные переводы', 'translations', '0', 300, '', 1, '#', '2016-11-28 16:57:33', '2016-11-28 16:57:33', 1),
(51, 1, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Главная страница', 'homepage', '0', 2, '', 0, '#', '2017-05-02 14:50:30', '2017-05-02 14:50:30', 1),
(53, 1, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Все страницы', 'allpages', '0', 3, '', 0, '#', '2017-05-02 16:13:08', '2017-05-02 16:13:08', 0),
(54, 1, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Таунхаусы', 'townhouses', '0', 3, '', 0, '#', '2017-05-02 16:13:08', '2017-05-02 16:13:08', 0),
(55, 1, 54, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Управление страницей', 'th_page', '0', 0, '', 0, '#', '2017-05-02 16:13:08', '2017-05-02 16:13:08', 0),
(56, 1, 54, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Инфраструктура', 'th_infra', '0', 0, '', 0, '#', '2017-05-02 16:13:08', '2017-05-02 16:13:08', 0),
(57, 1, 54, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Блоки таунхаусов', 'th_blocks', '0', 0, '', 0, '#', '2017-05-02 16:13:08', '2017-05-02 16:13:08', 0),
(58, 1, 54, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Планировки таунхаусов', 'th_layouts', '0', 0, '', 0, '#', '2017-05-02 16:13:08', '2017-05-02 16:13:08', 0),
(59, 1, 3, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Акции', 'events', '0', 0, '', 0, '#', '2015-09-18 10:11:28', '2016-10-21 23:48:05', 1),
(60, 1, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Дома', 'houses_sect', '0', 2, '', 0, '#', '2017-05-02 16:13:08', '2017-05-02 16:13:08', 0),
(61, 1, 60, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Дома', 'houses', '0', 0, '', 0, '#', '2017-05-02 16:13:08', '2017-05-02 16:13:08', 0),
(62, 1, 60, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Категории комнат', 'rooms', '0', 0, '', 0, '#', '2017-05-02 16:13:08', '2017-05-02 16:13:08', 0),
(63, 1, 60, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Квартиры', 'flats', '0', 0, '', 0, '#', '2017-05-02 16:13:08', '2017-05-02 16:13:08', 0),
(64, 1, 1, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Заявки на просмотр', 'visits', 'fa-phone', 0, '', 0, '#', '2016-10-21 16:37:00', '2016-10-21 16:37:18', 1),
(65, 1, 1, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Форма обратной связи', 'contact_form', 'fa-phone', 0, '', 0, '#', '2016-10-21 16:37:00', '2016-10-21 16:37:18', 1),
(67, 1, 3, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Категории документов', 'docs-cats', '0', 0, '', 0, '#', '2015-09-18 10:11:28', '2016-10-21 23:48:05', 1),
(68, 1, 5, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Секция менеджер', 'manager', 'fa-user', 1, '', 0, '#', '2013-11-15 03:30:00', '2016-11-25 18:00:00', 1),
(69, 1, 53, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Страница \"О нас\"', 'about', '', 1, '', 0, '#', '2013-11-15 03:30:00', '2016-11-25 18:00:00', 1),
(70, 1, 3, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Проекты', 'projects', '', 1, '', 0, '#', '2013-11-15 03:30:00', '2016-11-25 18:00:00', 1),
(71, 1, 53, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Страница \"Контакты\"', 'contacts', '', 1, '', 0, '#', '2013-11-15 03:30:00', '2016-11-25 18:00:00', 1),
(72, 1, 51, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Баннер', 'home_ban', '', 1, '', 0, '#', '2013-11-15 03:30:00', '2016-11-25 18:00:00', 1),
(73, 1, 51, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Инфраструктура', 'home_infr', '', 1, '', 0, '#', '2013-11-15 03:30:00', '2016-11-25 18:00:00', 1),
(74, 1, 51, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Окружение', 'home_env', '', 1, '', 0, '#', '2013-11-15 03:30:00', '2016-11-25 18:00:00', 1),
(75, 1, 51, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Элементы окружения', 'home_env_items', '', 1, '', 0, '#', '2013-11-15 03:30:00', '2016-11-25 18:00:00', 1),
(76, 1, 51, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Галерея', 'home_gal', '', 1, '', 0, '#', '2013-11-15 03:30:00', '2016-11-25 18:00:00', 1),
(77, 1, 51, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Инфо о застройщике', 'home_dev', '', 1, '', 0, '#', '2013-11-15 03:30:00', '2016-11-25 18:00:00', 1),
(78, 1, 51, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Мета-теги', 'home_meta', '', 1, '', 0, '#', '2013-11-15 03:30:00', '2016-11-25 18:00:00', 1),
(79, 1, 53, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Рубрики новостей', 'news_cats', '', 1, '', 0, '#', '2013-11-15 03:30:00', '2016-11-25 18:00:00', 1),
(80, 1, 53, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Новости', 'news', '', 1, '', 0, '#', '2013-11-15 03:30:00', '2016-11-25 18:00:00', 1),
(81, 1, 1, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Подписки на новости', 'subscriptions', 'fa-envelope', 0, '', 0, '#', '2016-10-21 16:37:00', '2016-10-21 16:37:18', 1),
(82, 1, 1, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Подписки на ход стройки', 'bp_subscriptions', 'fa-envelope', 0, '', 0, '#', '2016-10-21 16:37:00', '2016-10-21 16:37:18', 1),
(83, 1, 1, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Вопросы о ходе стройки', 'bp_questions', 'fa-question', 0, '', 0, '#', '2016-10-21 16:37:00', '2016-10-21 16:37:18', 1),
(84, 1, 53, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Категории хода стройки', 'bp_cats', '', 1, '', 0, '#', '2013-11-15 03:30:00', '2016-11-25 18:00:00', 1),
(85, 1, 53, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Ход стройки', 'bp_items', '', 1, '', 0, '#', '2013-11-15 03:30:00', '2016-11-25 18:00:00', 1),
(86, 1, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Коттеджи', 'cottages', '0', 3, NULL, 0, '#', '2018-01-14 00:00:00', '2018-01-14 00:00:00', 0),
(87, 1, 86, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Баннер - коттеджи', 'ct_banner', 'fa-picture-o', 0, NULL, 0, '#', '2018-01-14 00:00:00', '2018-01-14 00:00:00', 0),
(88, 1, 86, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '5 причин - коттеджи', 'ct_reasons', 'fa-html5', 0, NULL, 0, '#', '2018-01-14 00:00:00', '2018-01-14 00:00:00', 0),
(89, 1, 86, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Комплектация коттеджей', 'ct_equip', 'fa-cubes', 0, NULL, 0, '#', '2018-01-14 00:00:00', '2018-01-14 00:00:00', 0),
(90, 1, 86, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Планировки коттеджей', 'cottages-layouts', 'fa-file-image-o', 0, NULL, 1, '#', '2018-01-14 00:00:00', '2018-01-14 00:00:00', 0),
(91, 1, 86, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Секция - генплан коттеджей', 'ct_genplan', 'fa-object-ungroup', 0, NULL, 0, '#', '2018-01-14 00:00:00', '2018-01-14 00:00:00', 0),
(92, 1, 86, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Мета-теги коттеджей', 'ct_meta_tags', 'fa-tags', 0, NULL, 0, '#', '2018-01-14 00:00:00', '2018-01-14 00:00:00', 0),
(93, 1, 86, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Готовые коттеджи', 'ct_gallery', 'fa-th-large', 0, NULL, 0, '#', '2018-01-14 00:00:00', '2018-01-14 00:00:00', 0);

-- --------------------------------------------------------

--
-- Структура таблиці `osc_articles`
--

CREATE TABLE `osc_articles` (
  `id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL DEFAULT '0',
  `is_video` int(1) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '0',
  `alias` varchar(255) NOT NULL DEFAULT '0',
  `preview` varchar(255) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `fl_name_preview` varchar(127) NOT NULL DEFAULT '0',
  `fl_name_banner` varchar(255) NOT NULL DEFAULT '',
  `fl_name_top_img` varchar(255) NOT NULL DEFAULT '',
  `fl_name_bot_img` varchar(255) NOT NULL DEFAULT '',
  `fl_name_modal` varchar(255) NOT NULL DEFAULT '',
  `order_id` int(7) NOT NULL DEFAULT '0',
  `block` int(1) NOT NULL DEFAULT '0',
  `target` int(1) NOT NULL DEFAULT '0',
  `gallery_id` int(7) NOT NULL DEFAULT '0',
  `script_name` varchar(63) CHARACTER SET utf16 NOT NULL DEFAULT '',
  `text_pos` int(7) NOT NULL DEFAULT '1',
  `gallery_pos` int(7) NOT NULL DEFAULT '2',
  `script_pos` int(7) NOT NULL DEFAULT '3',
  `popular` int(1) NOT NULL DEFAULT '0',
  `app_store` varchar(255) NOT NULL DEFAULT '',
  `google_play` varchar(255) NOT NULL DEFAULT '',
  `pc` varchar(255) NOT NULL DEFAULT '',
  `mac` varchar(255) NOT NULL DEFAULT '',
  `dateCreate` datetime NOT NULL,
  `dateModify` datetime NOT NULL,
  `adminMod` int(7) NOT NULL DEFAULT '0',
  `pos_id` int(7) NOT NULL DEFAULT '1',
  `gal_orient` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Список статей и материалов для сайта';

--
-- Дамп даних таблиці `osc_articles`
--

INSERT INTO `osc_articles` (`id`, `cat_id`, `is_video`, `name`, `alias`, `preview`, `content`, `fl_name_preview`, `fl_name_banner`, `fl_name_top_img`, `fl_name_bot_img`, `fl_name_modal`, `order_id`, `block`, `target`, `gallery_id`, `script_name`, `text_pos`, `gallery_pos`, `script_pos`, `popular`, `app_store`, `google_play`, `pc`, `mac`, `dateCreate`, `dateModify`, `adminMod`, `pos_id`, `gal_orient`) VALUES
(1, 0, 0, 'Test', 'test', '', '<p></p><p><br></p><br><p></p>\r\n', '0', 'kamlogo-cubinator.jpg', '', '', '', 0, 0, 0, 1, '', 1, 2, 3, 0, '', '', '', '', '2017-04-11 19:06:40', '2017-04-11 19:06:40', 0, 1, 0);

-- --------------------------------------------------------

--
-- Структура таблиці `osc_article_comments`
--

CREATE TABLE `osc_article_comments` (
  `id` int(11) NOT NULL,
  `art_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `name` varchar(255) NOT NULL,
  `caption` varchar(255) NOT NULL,
  `rating` int(5) NOT NULL DEFAULT '5',
  `block` int(1) NOT NULL DEFAULT '1',
  `dateCreate` datetime NOT NULL,
  `dateModify` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблиці `osc_article_images_alts`
--

CREATE TABLE `osc_article_images_alts` (
  `id` int(11) NOT NULL,
  `block` int(11) NOT NULL DEFAULT '0',
  `art_id` int(11) NOT NULL,
  `data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `osc_article_images_alts`
--

INSERT INTO `osc_article_images_alts` (`id`, `block`, `art_id`, `data`) VALUES
(1, 0, 1, '{\"alt_preview\":\"\",\"title_preview\":\"\",\"alt_banner\":\"Good\",\"title_banner\":\"Theme\",\"alt_top_img\":\"\",\"title_top_img\":\"\",\"alt_bot_img\":\"\",\"title_bot_img\":\"\",\"alt_modal\":\"\",\"title_modal\":\"\",\"meta_title\":\"\",\"meta_desc\":\"\",\"meta_keys\":\"\"}');

-- --------------------------------------------------------

--
-- Структура таблиці `osc_banners`
--

CREATE TABLE `osc_banners` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '1',
  `alias` varchar(255) NOT NULL DEFAULT '0',
  `data` text,
  `pos_id` int(7) NOT NULL DEFAULT '0',
  `block` int(1) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `file` varchar(255) NOT NULL DEFAULT '0',
  `alt` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `link` varchar(255) NOT NULL DEFAULT '#',
  `target` int(1) NOT NULL DEFAULT '1',
  `startPublish` datetime NOT NULL,
  `finishPublish` datetime NOT NULL,
  `meta_keys` varchar(255) NOT NULL DEFAULT 'zen',
  `index` int(1) NOT NULL DEFAULT '0',
  `dateCreate` datetime NOT NULL,
  `dateModify` datetime NOT NULL,
  `adminMod` int(7) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `osc_banners`
--

INSERT INTO `osc_banners` (`id`, `name`, `type`, `alias`, `data`, `pos_id`, `block`, `order_id`, `file`, `alt`, `title`, `link`, `target`, `startPublish`, `finishPublish`, `meta_keys`, `index`, `dateCreate`, `dateModify`, `adminMod`) VALUES
(1, 'Test banner', 1, 'test-banner', NULL, 0, 0, 1, 'KAM.jpg', 'cube', 'STUDIO', '#', 0, '2017-04-11 18:33:05', '2017-04-11 18:33:05', 'zen', 0, '2017-04-11 18:33:05', '2017-04-11 18:33:05', 0);

-- --------------------------------------------------------

--
-- Структура таблиці `osc_bp_questions`
--

CREATE TABLE `osc_bp_questions` (
  `id` int(11) NOT NULL,
  `cat` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `message` text,
  `contact` varchar(255) DEFAULT NULL,
  `seen` int(11) NOT NULL DEFAULT '0',
  `created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблиці `osc_bp_subscriptions`
--

CREATE TABLE `osc_bp_subscriptions` (
  `id` int(11) NOT NULL,
  `cats` text,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `seen` int(11) NOT NULL DEFAULT '0',
  `created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблиці `osc_categories`
--

CREATE TABLE `osc_categories` (
  `id` int(11) NOT NULL,
  `parent` int(5) NOT NULL DEFAULT '0',
  `name` varchar(127) NOT NULL DEFAULT '0',
  `alias` varchar(127) NOT NULL DEFAULT '0',
  `details` tinytext NOT NULL,
  `filename` varchar(127) NOT NULL DEFAULT '0',
  `order_id` int(7) NOT NULL DEFAULT '0',
  `block` int(1) NOT NULL DEFAULT '0',
  `dateCreate` datetime NOT NULL,
  `dateModify` datetime NOT NULL,
  `adminMod` int(7) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Список категорий для группирования материалов';

--
-- Дамп даних таблиці `osc_categories`
--

INSERT INTO `osc_categories` (`id`, `parent`, `name`, `alias`, `details`, `filename`, `order_id`, `block`, `dateCreate`, `dateModify`, `adminMod`) VALUES
(1, 0, 'Акции CityLake', 'akcii-citylake', '', '0', 0, 0, '2017-04-11 21:43:46', '2017-05-02 16:14:14', 0),
(2, 0, 'Новости CityLake', 'novosti-citylake', '', '0', 0, 0, '2017-04-11 21:45:27', '2017-04-11 21:45:27', 0),
(3, 0, 'Акции Center', 'akcii-center', '', '0', 0, 0, '2017-04-11 21:45:38', '2017-04-11 21:45:38', 0),
(4, 0, 'Новости Center', 'novosti-center', '', '0', 0, 0, '2017-04-11 21:45:48', '2017-04-11 21:45:48', 0),
(5, 0, 'Строительство CityLake', 'stroitelstvo-citylake', '', '0', 0, 0, '2017-04-11 21:48:32', '2017-04-11 21:48:32', 0),
(6, 0, 'Строительство Center', 'stroitelstvo-center', '', '0', 0, 0, '2017-04-11 21:48:41', '2017-04-11 21:48:41', 0);

-- --------------------------------------------------------

--
-- Структура таблиці `osc_config`
--

CREATE TABLE `osc_config` (
  `id` int(11) NOT NULL,
  `name` varchar(127) NOT NULL DEFAULT '0',
  `value` text NOT NULL,
  `details` text NOT NULL,
  `block` int(1) NOT NULL DEFAULT '0',
  `dateCreate` datetime NOT NULL,
  `dateModify` datetime NOT NULL,
  `adminMod` int(7) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Базовые настройки для сайта';

-- --------------------------------------------------------

--
-- Структура таблиці `osc_contacts_page`
--

CREATE TABLE `osc_contacts_page` (
  `id` int(11) NOT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `details` text,
  `work_from` float NOT NULL DEFAULT '0',
  `work_to` float NOT NULL DEFAULT '0',
  `holidays` varchar(255) DEFAULT NULL,
  `addr_desc` varchar(255) DEFAULT NULL,
  `phone1` varchar(255) DEFAULT NULL,
  `phone2` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_keys` varchar(255) DEFAULT NULL,
  `meta_desc` text,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `osc_contacts_page`
--

INSERT INTO `osc_contacts_page` (`id`, `caption`, `details`, `work_from`, `work_to`, `holidays`, `addr_desc`, `phone1`, `phone2`, `filename`, `meta_title`, `meta_keys`, `meta_desc`, `created`, `modified`) VALUES
(1, 'ЖК \"Новая Конча-Заспа\"', '<p></p><div><span style=\"font-size: 12px;\">Квартиры, таунхаусы и коттеджи в 7 км от Киева по Новообуховской трассе.</span><br></div>\r\n', 10, 19, 'без обеда и выходных', '(поворот к Мегамаркету и Мануфактуре)', '067 825-50-18', '044 394-88-19', 'cimg_20180110173236647.jpg', '', '', '', '2018-01-03 00:00:00', '2018-05-11 15:49:54');

-- --------------------------------------------------------

--
-- Структура таблиці `osc_copy_history`
--

CREATE TABLE `osc_copy_history` (
  `id` int(11) NOT NULL,
  `table` varchar(255) NOT NULL DEFAULT '0',
  `row_id` int(11) NOT NULL DEFAULT '0',
  `copy_quant` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблиці `osc_ct_banner`
--

CREATE TABLE `osc_ct_banner` (
  `id` int(11) NOT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `sub_caption` varchar(255) NOT NULL,
  `details` text,
  `filename` varchar(255) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_keys` varchar(255) DEFAULT NULL,
  `meta_desc` text,
  `is_index` int(1) DEFAULT '1',
  `block` int(11) NOT NULL DEFAULT '0',
  `dateCreate` datetime DEFAULT NULL,
  `dateModify` datetime DEFAULT NULL,
  `adminMod` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `osc_ct_banner`
--

INSERT INTO `osc_ct_banner` (`id`, `caption`, `sub_caption`, `details`, `filename`, `meta_title`, `meta_keys`, `meta_desc`, `is_index`, `block`, `dateCreate`, `dateModify`, `adminMod`) VALUES
(1, 'Коттеджи', 'в Новой Конча-Заспе', 'Наш коттеджный городок клубного типа предлагает инвесторам различные варианты планировок и метражей земельного участка. Покупатели  сами себе выбирают расположение будущего дома.\r\nВъезд на охраняемую территорию городка происходит исключительно по пропускам. А в целях благоустройства мы позаботились о наличии детских площадок и живописным озеленением территории.  ', 'ct_st_20170613155013188.jpg', NULL, NULL, NULL, 1, 0, '2017-06-05 21:25:20', '2017-06-05 21:25:20', NULL);

-- --------------------------------------------------------

--
-- Структура таблиці `osc_ct_equip`
--

CREATE TABLE `osc_ct_equip` (
  `id` int(11) NOT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `block` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `osc_ct_equip`
--

INSERT INTO `osc_ct_equip` (`id`, `caption`, `block`) VALUES
(1, 'Комплектация коттеджей', 0);

-- --------------------------------------------------------

--
-- Структура таблиці `osc_ct_equip_items`
--

CREATE TABLE `osc_ct_equip_items` (
  `id` int(11) NOT NULL,
  `file` varchar(255) DEFAULT NULL,
  `caption` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `osc_ct_equip_items`
--

INSERT INTO `osc_ct_equip_items` (`id`, `file`, `caption`) VALUES
(4, 'cteq_20170611192320747.jpg', 'Счетчики на газ, воду и свет'),
(5, 'cteq_20170613154351803.jpg', 'Крыша из металлочерепицы'),
(6, 'cteq_20170613154611753.jpg', 'Дома из кирпича или газоблока');

-- --------------------------------------------------------

--
-- Структура таблиці `osc_ct_gallery`
--

CREATE TABLE `osc_ct_gallery` (
  `id` int(11) NOT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `block` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `osc_ct_gallery`
--

INSERT INTO `osc_ct_gallery` (`id`, `caption`, `block`) VALUES
(1, 'Готовые коттеджи', 0);

-- --------------------------------------------------------

--
-- Структура таблиці `osc_ct_gallery_items`
--

CREATE TABLE `osc_ct_gallery_items` (
  `id` int(11) NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `file_desc` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `osc_ct_gallery_items`
--

INSERT INTO `osc_ct_gallery_items` (`id`, `filename`, `file_desc`) VALUES
(10, 'ctgal_20180601120408694.jpg', ''),
(11, 'ctgal_20180601120432505.jpg', ''),
(12, 'ctgal_20180601120440257.jpg', ''),
(13, 'ctgal_20170723103142237.jpg', ''),
(14, 'ctgal_20180601120459852.jpg', '');

-- --------------------------------------------------------

--
-- Структура таблиці `osc_ct_genplan`
--

CREATE TABLE `osc_ct_genplan` (
  `id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `ct_desc` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `osc_ct_genplan`
--

INSERT INTO `osc_ct_genplan` (`id`, `status`, `ct_desc`) VALUES
(1, 3, ''),
(2, 3, ''),
(3, 2, 'Дом построен. Площадь дома 80,0 кв.м. Стоимость дома с участком 3,5 сотки составляет $55.000.'),
(4, 3, 'Дом построен. Площадь дома 80,0 кв.м. Стоимость дома с участком 2,7 сотки составляет $50.000.'),
(5, 2, 'Дом построен. Площадь дома 125,0 кв.м. Стоимость дома с участком 2,2 сотки составляет $58.000.'),
(6, 1, 'Участок 3,2 сотки под застройку. Стоимость участка $15000'),
(7, 3, 'Дом построен. Площадь дома 55,2 кв.м. Стоимость дома с участком 3,5 сотки составляет $34.000.'),
(8, 3, ''),
(9, 1, 'Участок 2 сотки под застройку. Стоимость участка $10000.'),
(10, 3, ''),
(11, 3, ''),
(12, 3, ''),
(13, 3, 'Участок 2,3 сотки под застройку. Стоимость участка $12000'),
(14, 1, 'Участок 3,1 сотки под застройку. Стоимость участка $15000'),
(15, 3, 'Участок 2,9 сотки под застройку. Стоимость участка $11000'),
(16, 3, 'Участок 2,9 сотки под застройку. Стоимость участка $11000'),
(17, 1, 'Участок 2,9 сотки под застройку. Стоимость участка $14000'),
(18, 3, 'Участок 3,2 сотки под застройку. Стоимость участка $10000'),
(19, 3, 'Участок 2,8 сотки под застройку. Стоимость участка $10000'),
(20, 3, 'Участок 3,8 сотки под застройку. Стоимость участка $12100'),
(21, 3, 'Участок 4,1 сотки под застройку. Стоимость участка $13000'),
(22, 1, 'Участок 2,8 сотки под застройку. Стоимость участка $15000'),
(23, 3, ''),
(24, 3, ''),
(25, 3, ''),
(26, 2, 'Дом построен. Площадь дома 80,0 кв.м. Стоимость дома с участком 2,3 сотки составляет $53.000.'),
(27, 3, ''),
(28, 2, 'Дом построен. Площадь дома 200,3 кв.м. Стоимость дома с участком 4,3 сотки составляет $100.000'),
(29, 2, 'Дом построен. Площадь дома 200,3 кв.м. Стоимость дома с участком 4,1 сотки составляет $125.000'),
(30, 2, 'Дом построен. Площадь дома 200,3 кв.м. Стоимость дома с участком 5,1 сотки составляет $110.000'),
(31, 1, 'Участок под застройку, цена 20000 уе'),
(32, 3, 'Участок под застройку, цена 20000 уе'),
(33, 3, 'Участок под застройку, цена 18000 уе'),
(34, 2, 'В наличии. Дом построен. Площадь дома 125,0 кв.м. Стоимость дома с участком 1,9 сотки составляет $58.000.');

-- --------------------------------------------------------

--
-- Структура таблиці `osc_ct_genplan_statuses`
--

CREATE TABLE `osc_ct_genplan_statuses` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `osc_ct_genplan_statuses`
--

INSERT INTO `osc_ct_genplan_statuses` (`id`, `name`) VALUES
(1, 'участок под застройку'),
(2, 'в наличии'),
(3, 'продано');

-- --------------------------------------------------------

--
-- Структура таблиці `osc_ct_reasons`
--

CREATE TABLE `osc_ct_reasons` (
  `id` int(11) NOT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `details` text,
  `filename` varchar(255) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_keys` varchar(255) DEFAULT NULL,
  `meta_desc` text,
  `is_index` int(1) DEFAULT '1',
  `dateCreate` datetime DEFAULT NULL,
  `dateModify` datetime DEFAULT NULL,
  `adminMod` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `osc_ct_reasons`
--

INSERT INTO `osc_ct_reasons` (`id`, `caption`, `details`, `filename`, `meta_title`, `meta_keys`, `meta_desc`, `is_index`, `dateCreate`, `dateModify`, `adminMod`) VALUES
(1, 'Большой выбор планировок', 'Готовые коттеджи и дуплексы с документами.\r\nВаш комфорт – наша задача.', 'ctr_20171017111808994.jpg', NULL, NULL, NULL, 1, '2017-06-05 21:24:23', '2017-06-05 21:24:23', NULL),
(2, 'Земельный участок любого размера*', 'Большой выбор земельного участка\r\nВы можете выбрать себе участок любого размера и конфигурации за отдельную доплату.', 'ctr_20170611193510995.jpg', NULL, NULL, NULL, 1, '2017-06-05 21:24:23', '2017-06-05 21:24:23', NULL),
(3, 'Престижное место', 'Удачное расположение нашего городка позволяет наслаждаться его спокойствием, живописной местностью, желаемым уединением и тишиной. ', 'ctr_20170611193813853.jpg', NULL, NULL, NULL, 1, '2017-06-05 21:24:23', '2017-06-05 21:24:23', NULL),
(4, 'Готовые коттеджи', 'Дома различных метражей и конфигурации, со всеми необходимыми документами, уже готовы к заселению.', 'ctr_20170609191700865.jpg', NULL, NULL, NULL, 1, '2017-06-05 21:24:23', '2017-06-05 21:24:23', NULL),
(5, 'Рассрочка на ваших условиях', 'Индивидуальный и личностный подход к инвесторам позволяет обсудить оплату на условиях, более выгодных для вас. ', 'ctr_20170609191354187.jpg', NULL, NULL, NULL, 1, '2017-06-05 21:24:23', '2017-06-05 21:24:23', NULL);

-- --------------------------------------------------------

--
-- Структура таблиці `osc_db_structure`
--

CREATE TABLE `osc_db_structure` (
  `id` int(11) NOT NULL,
  `table` varchar(63) NOT NULL,
  `type` varchar(63) NOT NULL,
  `structure` text NOT NULL,
  `ref_table` varchar(63) NOT NULL,
  `ref_tables` varchar(127) NOT NULL,
  `date_create` datetime NOT NULL,
  `date_modify` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Отображает структуры всей БД. Type: object, extention, reference';

-- --------------------------------------------------------

--
-- Структура таблиці `osc_dialog_files_ref`
--

CREATE TABLE `osc_dialog_files_ref` (
  `id` int(11) NOT NULL,
  `ref_table` varchar(63) NOT NULL DEFAULT '0',
  `ref_id` int(11) NOT NULL DEFAULT '0',
  `file` varchar(255) NOT NULL DEFAULT '0',
  `crop` varchar(255) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT 'Фото',
  `is_link` int(1) NOT NULL DEFAULT '0',
  `href` varchar(255) DEFAULT NULL,
  `target` int(1) NOT NULL DEFAULT '1',
  `path` varchar(255) NOT NULL DEFAULT '/',
  `adminMod` int(7) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблиці `osc_docs_files`
--

CREATE TABLE `osc_docs_files` (
  `id` int(11) NOT NULL,
  `doc_name` varchar(255) DEFAULT NULL,
  `doc_desc` varchar(255) DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `house_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `osc_docs_files`
--

INSERT INTO `osc_docs_files` (`id`, `doc_name`, `doc_desc`, `file`, `house_id`) VALUES
(44, 'Документы на землю', '', 'doc_20170606123320623.jpg', 1),
(46, 'Декларация на начало строительства', '', 'doc_20170606123357557.gif', 2),
(47, 'Декларация о начале строительных работ', '', 'doc_20170606164541904.jpg', 1),
(48, 'Документация на подключение электричества', '', 'doc_20170607125150449.jpg', 1),
(49, 'Документация на канализацию', '', 'doc_20170607125310970.jpg', 2);

-- --------------------------------------------------------

--
-- Структура таблиці `osc_docs_ref`
--

CREATE TABLE `osc_docs_ref` (
  `id` int(11) NOT NULL,
  `ref_table` varchar(63) NOT NULL DEFAULT '0',
  `ref_id` int(11) NOT NULL DEFAULT '0',
  `file` varchar(255) NOT NULL DEFAULT '0',
  `crop` varchar(255) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT 'Фото',
  `is_link` int(1) NOT NULL DEFAULT '0',
  `href` varchar(255) DEFAULT NULL,
  `target` int(1) NOT NULL DEFAULT '1',
  `path` varchar(255) NOT NULL DEFAULT '/',
  `adminMod` int(7) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблиці `osc_email_logs`
--

CREATE TABLE `osc_email_logs` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL DEFAULT '0',
  `email` varchar(64) NOT NULL,
  `from` varchar(64) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `date` datetime NOT NULL,
  `ip` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Project Email Logs';

-- --------------------------------------------------------

--
-- Структура таблиці `osc_event_recall`
--

CREATE TABLE `osc_event_recall` (
  `id` int(11) NOT NULL,
  `layout_id` int(11) DEFAULT NULL,
  `type_event` varchar(255) DEFAULT NULL,
  `event_id` int(11) NOT NULL DEFAULT '0',
  `phone` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `viewed` int(1) NOT NULL DEFAULT '0',
  `dateCreate` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблиці `osc_faq`
--

CREATE TABLE `osc_faq` (
  `id` int(11) NOT NULL,
  `question` text,
  `answer` text NOT NULL,
  `block` int(11) NOT NULL DEFAULT '0',
  `order_id` int(7) NOT NULL DEFAULT '0',
  `dateCreate` datetime NOT NULL,
  `dateModify` datetime NOT NULL,
  `adminMod` int(7) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `osc_faq`
--

INSERT INTO `osc_faq` (`id`, `question`, `answer`, `block`, `order_id`, `dateCreate`, `dateModify`, `adminMod`) VALUES
(1, 'TEst', '<p>wefwegwg</p>', 0, 1, '2017-05-02 22:17:23', '2017-05-04 16:34:56', 0);

-- --------------------------------------------------------

--
-- Структура таблиці `osc_files_ref`
--

CREATE TABLE `osc_files_ref` (
  `id` int(11) NOT NULL,
  `ref_table` varchar(63) NOT NULL DEFAULT '0',
  `ref_id` int(11) NOT NULL DEFAULT '0',
  `file` varchar(255) NOT NULL DEFAULT '0',
  `crop` varchar(255) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT 'Фото',
  `is_link` int(1) NOT NULL DEFAULT '0',
  `href` varchar(255) DEFAULT NULL,
  `target` int(1) NOT NULL DEFAULT '1',
  `path` varchar(255) NOT NULL DEFAULT '/',
  `order_pos` int(11) NOT NULL DEFAULT '0',
  `adminMod` int(7) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `osc_files_ref`
--

INSERT INTO `osc_files_ref` (`id`, `ref_table`, `ref_id`, `file`, `crop`, `title`, `is_link`, `href`, `target`, `path`, `order_pos`, `adminMod`) VALUES
(5, 'shop_products', 4, 'prod_20170411204834894.jpg', '0', 'Фото', 0, NULL, 1, 'split/files/shop/products/', 0, 0),
(7, 'shop_products', 1, 'whitechocollate-one-room.jpg', '250x250_whitechocollate-one-room.jpg', 'one-room', 0, NULL, 1, 'split/files/shop/products/', 1, 0),
(9, 'galleries', 1, 'gall_20170505015758326.jpg', '0', 'Фото', 0, NULL, 1, 'split/files/content/', 1, 0),
(10, 'galleries', 1, 'gall_20170505015807773.jpg', '0', 'Фото', 0, NULL, 1, 'split/files/content/', 2, 0),
(11, 'galleries', 1, 'gall_20170505015814897.jpg', '0', 'Фото', 0, NULL, 1, 'split/files/content/', 3, 0),
(12, 'galleries', 1, 'gall_20170505015820106.jpg', '0', 'Фото', 0, NULL, 1, 'split/files/content/', 4, 0),
(13, 'galleries', 1, 'gall_20170505015827254.jpg', '0', 'Фото', 0, NULL, 1, 'split/files/content/', 5, 0),
(14, 'galleries', 1, 'gall_20170505015832611.jpg', '0', 'Фото', 0, NULL, 1, 'split/files/content/', 6, 0);

-- --------------------------------------------------------

--
-- Структура таблиці `osc_forgot_password_hash`
--

CREATE TABLE `osc_forgot_password_hash` (
  `id` int(11) NOT NULL,
  `dateCreate` datetime NOT NULL,
  `login` varchar(255) NOT NULL DEFAULT '0',
  `hash` varchar(32) NOT NULL DEFAULT '0',
  `session_id` varchar(255) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблиці `osc_galleries`
--

CREATE TABLE `osc_galleries` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '0',
  `caption` varchar(255) NOT NULL DEFAULT 'Gallery',
  `data` text NOT NULL,
  `block` int(1) NOT NULL DEFAULT '0',
  `dateCreate` datetime NOT NULL,
  `dateModify` datetime NOT NULL,
  `adminMod` int(7) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблиці `osc_home_ban`
--

CREATE TABLE `osc_home_ban` (
  `id` int(11) NOT NULL,
  `pan_caption` varchar(255) DEFAULT NULL,
  `pan_sub_caption` varchar(255) DEFAULT NULL,
  `panorama` text,
  `genplan` varchar(255) DEFAULT NULL,
  `block` int(11) NOT NULL DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `osc_home_ban`
--

INSERT INTO `osc_home_ban` (`id`, `pan_caption`, `pan_sub_caption`, `panorama`, `genplan`, `block`, `created`, `modified`) VALUES
(1, 'Престижный классический пригород', '', '', 'hmgp_20180114120819314.jpg', 0, '2018-01-10 00:00:00', '2018-03-05 16:02:02');

-- --------------------------------------------------------

--
-- Структура таблиці `osc_home_common`
--

CREATE TABLE `osc_home_common` (
  `id` int(11) NOT NULL,
  `transport_capt` varchar(255) DEFAULT NULL,
  `transport_text` varchar(255) DEFAULT NULL,
  `infr_capt` varchar(255) DEFAULT NULL,
  `env_capt` varchar(255) DEFAULT NULL,
  `bett_capt` varchar(255) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_keys` varchar(255) DEFAULT NULL,
  `meta_desc` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `osc_home_common`
--

INSERT INTO `osc_home_common` (`id`, `transport_capt`, `transport_text`, `infr_capt`, `env_capt`, `bett_capt`, `meta_title`, `meta_keys`, `meta_desc`) VALUES
(1, 'До Киева <span class=\'green\'>без пробок</span> по трассе европейского уровня', 'Ежедневно ходят маршрутки от метро Выдубичи до \"Новой Конча-Заспы\" каждые 20 мин с 6:00 до 23:00', 'Идеальное место для досуга и отдыха', 'Все рядом', 'Благоустройство комплекса', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблиці `osc_home_dev`
--

CREATE TABLE `osc_home_dev` (
  `id` int(11) NOT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `details` text,
  `stat` text,
  `block` int(11) NOT NULL DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `osc_home_dev`
--

INSERT INTO `osc_home_dev` (`id`, `caption`, `details`, `stat`, `block`, `created`, `modified`) VALUES
(1, 'Застройщик AVM DEVELOPMENT GROUP', '<p>Наша специализация — это проекты в пригороде Киева, в местах с хорошо развитой инфраструктурой и удобным месторасположением.</p>\r\n<p>Все проекты ориентированы на сочетание преимуществ активной городской жизни и преимуществ тихого и спокойного пригорода.</p>', '3 комплекса*строится;\r\n5 комплексов*введено в эксплуатацию;\r\n36 га*площадь застройки;\r\n520 квартир*на стадии строительства;\r\n40 000 м2*сдано в эксплуатацию;\r\n5 лет*на рынке;', 0, '2018-01-01 00:00:00', '2018-01-12 11:10:28');

-- --------------------------------------------------------

--
-- Структура таблиці `osc_home_env`
--

CREATE TABLE `osc_home_env` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `block` int(11) NOT NULL DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `osc_home_env`
--

INSERT INTO `osc_home_env` (`id`, `name`, `alias`, `icon`, `image`, `block`, `created`, `modified`) VALUES
(7, 'Школа', 'shkola', 'hteic_20180111192841329.svg', 'hteim_20180111192841443.svg', 0, '2018-01-11 19:28:41', '2018-01-19 17:39:02'),
(8, 'Детские сады', 'detskie-sadu', 'hteic_20180111192916329.svg', 'hteim_20180111192916567.svg', 0, '2018-01-11 19:29:16', '2018-01-11 19:29:16'),
(9, 'ТРЦ', 'trc', 'hteic_20180119173856908.svg', 'hteim_20180119173856400.svg', 0, '2018-01-19 16:47:04', '2018-01-19 17:38:56'),
(10, 'Спорт и отдых', 'sport-i-otduh', 'hteic_20180119173938846.svg', NULL, 0, '2018-01-19 16:47:16', '2018-01-19 17:39:38'),
(11, 'Развлечения', 'razvlecheniya', 'hteic_20180119173950817.svg', NULL, 0, '2018-01-19 16:47:24', '2018-01-19 17:39:50');

-- --------------------------------------------------------

--
-- Структура таблиці `osc_home_env_items`
--

CREATE TABLE `osc_home_env_items` (
  `id` int(11) NOT NULL,
  `ref` int(11) NOT NULL DEFAULT '0',
  `caption` varchar(255) DEFAULT NULL,
  `order_id` int(11) NOT NULL DEFAULT '0',
  `time_walk` int(11) DEFAULT '0',
  `time_car` varchar(255) DEFAULT NULL,
  `block` int(11) NOT NULL DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `osc_home_env_items`
--

INSERT INTO `osc_home_env_items` (`id`, `ref`, `caption`, `order_id`, `time_walk`, `time_car`, `block`, `created`, `modified`) VALUES
(5, 8, 'Детский сад «Світлиця» (в Мануфактуре)', 2, 10, '10 минут пешком', 0, '2018-01-11 19:36:16', '2018-01-17 11:56:41'),
(6, 8, 'Детский сад CLOUD (дом Грац)', 1, 5, '5 минут пешком', 0, '2018-01-11 19:36:34', '2018-01-17 11:56:59'),
(7, 8, 'Детский сад «Кирюша» (частный, в Ходосеевке)', 3, 15, '15 минут пешком ', 0, '2018-01-11 19:36:56', '2018-01-17 11:57:46'),
(8, 7, 'Ходосеевская общеобразовательная школа 1-3 уровня (с. Ходосеевка, ул. Ленина, 200)', 1, 0, '10 мин на машине', 0, '2018-01-11 19:37:32', '2018-01-12 12:25:20'),
(9, 7, 'Хотовская общеобразовательная школа 1-3 уровня (с. Хотов, пл. Паширова, 10)', 2, 0, '15 минут на машине', 0, '2018-01-11 19:37:54', '2018-01-12 12:24:51'),
(10, 7, 'Средняя школа №150 (ул.Пироговский путь, 148)', 3, 0, '10 минут на машине', 0, '2018-01-11 19:38:11', '2018-01-17 17:54:28'),
(11, 8, 'Детский сад-ясли «Водограй» (Ходосеевский сельсовет)', 4, 0, '10 минут на машине', 0, '2018-01-12 12:06:10', '2018-01-17 11:58:22'),
(12, 8, 'Янглоязычный детский сад PlayRoom (смт. Козин, ул. Киевская, 170)', 7, 0, '15 минут на машине', 0, '2018-01-12 12:12:04', '2018-01-17 18:08:05'),
(13, 8, 'Детский ясли-сад \"Ёлочка\" (смт.Козин)', 7, 0, '12 минут на машине', 0, '2018-01-12 12:13:28', '2018-01-17 18:13:43'),
(14, 7, 'Средняя школа №236 (ул.Заболотного, 144)', 4, 0, '15 минут на машине', 0, '2018-01-17 17:56:19', '2018-01-17 17:57:18'),
(15, 7, 'Средняя школа І-ІІІ ступеней №151 (р-н смт. Козин, ул. Лесничья, 3) ', 5, 0, '10 минут на машине', 0, '2018-01-17 18:00:19', '2018-01-17 18:00:39'),
(16, 9, 'ТРЦ Мегамаркет (Новообуховское шоссе 1)', 1, 5, '5 минут пешком', 0, '2018-01-19 16:50:46', '2018-01-22 10:34:58'),
(17, 9, 'ТРЦ АртМолл (улица Заболотного, 37, Киев)', 2, 5, '5 минут на машине', 0, '2018-01-19 16:52:24', '2018-01-22 10:43:51'),
(18, 9, 'ТРЦ Домосфера (Столичное шоссе, 101, Киев)', 3, 5, '5 минут на машине', 0, '2018-01-19 16:53:04', '2018-01-22 10:36:14'),
(19, 9, 'ТРЦ Магелан (проспект Академика Глушкова,13 б, Киев)', 4, 15, '15 минут на машине', 0, '2018-01-19 16:53:40', '2018-01-22 10:37:00'),
(20, 10, 'Тренировочная база \"Динамо Киев\" (Столичне шоссе, 45, Киев)', 1, 10, '10 минут на машине', 0, '2018-01-19 16:54:32', '2018-01-22 10:37:52'),
(21, 10, 'Гольф Клуб Козин (улица Березняковская, 29, Киев)', 2, 15, '15 минут на машине', 0, '2018-01-19 16:55:24', '2018-01-22 10:43:16'),
(22, 10, 'спортивно-оздоровительный комплекс «Olympic Village» (Новообуховское шоссе, 26 километр)', 3, 15, '15 минут на машине', 0, '2018-01-19 16:56:49', '2018-01-22 10:44:51'),
(23, 10, 'Sport Life Конча-Заспа (улица Обуховское шоссе, 55, Козин)', 4, 15, '15 минут на машине', 0, '2018-01-19 16:58:00', '2018-01-22 10:46:07'),
(24, 11, 'Мототрек Пирогово (улица Краснознаменная, 188, Киев)', 1, 10, '10 минут на машине', 0, '2018-01-19 16:59:05', '2018-01-22 10:47:25'),
(25, 11, 'Пейнтбольный клуб БОМБА (с.Лесное, улица Гагарина, 2а)', 2, 10, '10 минут на машине', 0, '2018-01-19 16:59:56', '2018-01-22 10:48:49'),
(26, 11, 'QUEEN COUNTRY CLUB (улица Обуховское шоссе, 55, Козин)', 3, 10, '10 минут на машине', 0, '2018-01-19 17:00:37', '2018-01-22 10:49:24');

-- --------------------------------------------------------

--
-- Структура таблиці `osc_home_gal`
--

CREATE TABLE `osc_home_gal` (
  `id` int(11) NOT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `features` text,
  `source` varchar(255) DEFAULT NULL,
  `order_id` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '1',
  `block` int(11) NOT NULL DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `osc_home_gal`
--

INSERT INTO `osc_home_gal` (`id`, `caption`, `features`, `source`, `order_id`, `type`, `block`, `created`, `modified`) VALUES
(10, 'Всегда праздничная атмосфера', '', 'hmgl_20180117223147919.jpg', 1, 1, 0, '2018-01-11 19:40:58', '2018-01-17 22:31:47'),
(11, 'Авторские детские площадки', 'разработаны для детей 3-9 лет;\r\nскандинавский стиль;\r\nтолько натуральные материалы;', 'hmgl_20180117223954899.jpg', 2, 1, 0, '2018-01-11 19:41:33', '2018-01-17 22:40:22'),
(12, 'Ландшафтный дизайн', '', 'hmgl_20180122212503910.jpg', 3, 1, 0, '2018-01-11 19:42:01', '2018-01-22 21:25:03'),
(13, 'Интерьерное решение подъездов', '', 'hmgl_20180122212158808.jpg', 4, 1, 0, '2018-01-11 19:42:49', '2018-01-22 21:23:17'),
(14, 'Чистые и функциональные холлы', '', 'hmgl_20180122212241810.jpg', 5, 1, 0, '2018-01-12 12:01:59', '2018-01-22 21:22:41');

-- --------------------------------------------------------

--
-- Структура таблиці `osc_home_infrasctucture`
--

CREATE TABLE `osc_home_infrasctucture` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `sub_caption` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `details` text,
  `block` int(11) NOT NULL DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `osc_home_infrasctucture`
--

INSERT INTO `osc_home_infrasctucture` (`id`, `name`, `alias`, `sub_caption`, `image`, `icon`, `details`, `block`, `created`, `modified`) VALUES
(1, 'ТРЦ \"Мегамаркет\"', 'trc-megamarket', '3 мин пешком', 'htiim_20180122211615847.jpg', 'htiic_20180114151358802.svg', '<div>В ТРЦ \"Мегамаркет\", помимо большого супермаркета, находятся все необходимые для комфортной жизни объекты инфраструктуры - химчистка, аптеки, отделение Приватбанка, магазин мобильной техники и прочее.</span><br></div><div>ТРЦ работает ежедневно, с 8-00 до 23-00 часов.</div>\r\n', 0, '2018-01-01 00:00:00', '2018-01-22 21:16:15'),
(7, 'Аутлет городок Мануфактура', 'autlet-gorodok-manufaktura', '2 мин пешком', 'htiim_20180116124724974.jpg', 'htiic_20180114150809596.svg', '<p>В пешей доступности с нашим городком расположен аутлет-городок Мануфактура. В нем представлены магазины ведущих мировых брендов, есть уютные кафе. Прекрасная атмосфера городка и высокий уровень благоустройства всячески располагают к неспешным семейным прогулкам.</p>\r\n', 0, '2018-01-11 19:39:07', '2018-01-16 12:47:24'),
(8, 'Фитнес-клуб \"Дельтаплан\"', 'fitnes-klub-deltaplan', '3 минуты пешком', 'htiim_20180116124735246.jpg', 'htiic_20180114151651256.svg', '<p>У наших жителей есть прекрасная возможность не тратить время на дорогу в фитнес-клубы, находящихся в городе, а получить полный пакет оздоровительных услуг непосредственно рядом с домом. В раках клуба есть огромная аквазона с полноценным плавательным бассейном, саунами и банями, тренажерные залы, включая оборудование для кардиотренировки.<br></p>\r\n', 0, '2018-01-14 15:16:50', '2018-01-17 17:52:30'),
(9, 'Голубое озеро в Подгорцах', 'goluboe-ozero-v-podgorcah', '5 минут на авто', 'htiim_20180122211845554.jpg', 'htiic_20180114151817514.svg', '<p>Прекрасное место для семейного пляжного отдыха находится в 3 км от нашего городка, в с.Подгорцы. Чистейшая вода, высокий уровень сервиса позволят вам весело провести время жаркими летними денечками.<br></p>', 0, '2018-01-14 15:17:47', '2018-01-22 21:18:45'),
(10, 'Конный клуб Equides', 'konnuy-klub-equides', '10 минут на авто', 'htiim_20180116124758566.jpg', 'htiic_20180114151859536.svg', '<p>Конный клуб Equides Club расположен на огромной территории в 16 га на живописных холмах и полях в с.Лесники. Здесь раздолье для аматорских прогулок верхом, а так же отличные условия для спортивных тренировок. В клубе созданы все условия комфорта для отдыха всей семьей. В клубе работает академия конного спорта.<br></p>\r\n', 0, '2018-01-14 15:18:59', '2018-01-17 17:11:07'),
(11, 'Кинотеатр \"Баттерфляй-Кантри\"', 'kinoteatr-batterflyay-kantri', '3 минуты пешком', 'htiim_20180116124811289.jpg', 'htiic_20180114151938627.svg', '<p>Современный кинотеатр сети \"Баттерфляй\". Есть 4 зала. Лучшие кинопремьеры каждую неделю.<br></p>', 0, '2018-01-14 15:19:38', '2018-01-16 12:48:11'),
(12, 'Детский клуб-сад «Cloud»', 'detskiy-klub-sad-cloud', '2 мин пешком', 'htiim_20180604155439718.jpg', 'htiic_20180604155520576.svg', '<p><p>В пешей доступности с нашим ЖК уже работает детский клуб-сад «Cloud».</p><p>Мы создали идеальный садик для своих детей, в котором и Ваш ребенок будет чувствовать себя уютно и комфортно, как дома.</p><p>Ждем Вас в мире доброты, уюта и любви!</p></p>', 0, '2018-06-04 15:54:39', '2018-06-04 15:55:38');

-- --------------------------------------------------------

--
-- Структура таблиці `osc_home_infrasctucture_items`
--

CREATE TABLE `osc_home_infrasctucture_items` (
  `id` int(11) NOT NULL,
  `item_name` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `block` int(11) NOT NULL DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `ref_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `osc_home_infrasctucture_items`
--

INSERT INTO `osc_home_infrasctucture_items` (`id`, `item_name`, `icon`, `block`, `created`, `modified`, `ref_id`) VALUES
(1, 'Супермаркет', 'Supermarket-1Foods.svg', 0, '2018-01-01 00:00:00', '2018-01-01 00:00:00', 1),
(2, 'Супермаркет', 'Supermarket-1Foods.svg', 0, '2018-01-01 00:00:00', '2018-01-01 00:00:00', 1),
(3, 'Супермаркет', 'Supermarket-1Foods.svg', 0, '2018-01-01 00:00:00', '2018-01-01 00:00:00', 2),
(4, 'Супермаркет', '', 0, '2018-01-01 00:00:00', '2018-01-01 00:00:00', 1),
(5, 'Супермаркет', '', 0, '2018-01-01 00:00:00', '2018-01-01 00:00:00', 1),
(6, 'Супермаркет2', 'Supermarket-1Foods.svg', 0, '2018-01-01 00:00:00', '2018-01-01 00:00:00', 1);

-- --------------------------------------------------------

--
-- Структура таблиці `osc_income_questions`
--

CREATE TABLE `osc_income_questions` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `category` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `viewed` int(1) NOT NULL DEFAULT '0',
  `dateCreate` datetime NOT NULL,
  `dateModify` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблиці `osc_languages`
--

CREATE TABLE `osc_languages` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `alias` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `used` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп даних таблиці `osc_languages`
--

INSERT INTO `osc_languages` (`id`, `name`, `alias`, `used`) VALUES
(1, 'English', 'en', 0),
(2, 'Afar', 'aa', 0),
(3, 'Abkhazian', 'ab', 0),
(4, 'Afrikaans', 'af', 0),
(5, 'Amharic', 'am', 0),
(6, 'Arabic', 'ar', 0),
(7, 'Assamese', 'as', 0),
(8, 'Aymara', 'ay', 0),
(9, 'Azerbaijani', 'az', 0),
(10, 'Bashkir', 'ba', 0),
(11, 'Belarusian', 'be', 0),
(12, 'Bulgarian', 'bg', 0),
(13, 'Bihari', 'bh', 0),
(14, 'Bislama', 'bi', 0),
(15, 'Bengali/Bangla', 'bn', 0),
(16, 'Tibetan', 'bo', 0),
(17, 'Breton', 'br', 0),
(18, 'Catalan', 'ca', 0),
(19, 'Corsican', 'co', 0),
(20, 'Czech', 'cs', 0),
(21, 'Welsh', 'cy', 0),
(22, 'Danish', 'da', 0),
(23, 'German', 'de', 0),
(24, 'Bhutani', 'dz', 0),
(25, 'Greek', 'el', 0),
(26, 'Esperanto', 'eo', 0),
(27, 'Spanish', 'es', 0),
(28, 'Estonian', 'et', 0),
(29, 'Basque', 'eu', 0),
(30, 'Persian', 'fa', 0),
(31, 'Finnish', 'fi', 0),
(32, 'Fiji', 'fj', 0),
(33, 'Faeroese', 'fo', 0),
(34, 'French', 'fr', 0),
(35, 'Frisian', 'fy', 0),
(36, 'Irish', 'ga', 0),
(37, 'Scots/Gaelic', 'gd', 0),
(38, 'Galician', 'gl', 0),
(39, 'Guarani', 'gn', 0),
(40, 'Gujarati', 'gu', 0),
(41, 'Hausa', 'ha', 0),
(42, 'Hindi', 'hi', 0),
(43, 'Croatian', 'hr', 0),
(44, 'Hungarian', 'hu', 0),
(45, 'Armenian', 'hy', 0),
(46, 'Interlingua', 'ia', 0),
(47, 'Interlingue', 'ie', 0),
(48, 'Inupiak', 'ik', 0),
(49, 'Indonesian', 'in', 0),
(50, 'Icelandic', 'is', 0),
(51, 'Italian', 'it', 0),
(52, 'Hebrew', 'iw', 0),
(53, 'Japanese', 'ja', 0),
(54, 'Yiddish', 'ji', 0),
(55, 'Javanese', 'jw', 0),
(56, 'Georgian', 'ka', 0),
(57, 'Kazakh', 'kk', 0),
(58, 'Greenlandic', 'kl', 0),
(59, 'Cambodian', 'km', 0),
(60, 'Kannada', 'kn', 0),
(61, 'Korean', 'ko', 0),
(62, 'Kashmiri', 'ks', 0),
(63, 'Kurdish', 'ku', 0),
(64, 'Kirghiz', 'ky', 0),
(65, 'Latin', 'la', 0),
(66, 'Lingala', 'ln', 0),
(67, 'Laothian', 'lo', 0),
(68, 'Lithuanian', 'lt', 0),
(69, 'Latvian/Lettish', 'lv', 0),
(70, 'Malagasy', 'mg', 0),
(71, 'Maori', 'mi', 0),
(72, 'Macedonian', 'mk', 0),
(73, 'Malayalam', 'ml', 0),
(74, 'Mongolian', 'mn', 0),
(75, 'Moldavian', 'mo', 0),
(76, 'Marathi', 'mr', 0),
(77, 'Malay', 'ms', 0),
(78, 'Maltese', 'mt', 0),
(79, 'Burmese', 'my', 0),
(80, 'Nauru', 'na', 0),
(81, 'Nepali', 'ne', 0),
(82, 'Dutch', 'nl', 0),
(83, 'Norwegian', 'no', 0),
(84, 'Occitan', 'oc', 0),
(85, '(Afan)/Oromoor/Oriya', 'om', 0),
(86, 'Punjabi', 'pa', 0),
(87, 'Polish', 'pl', 0),
(88, 'Pashto/Pushto', 'ps', 0),
(89, 'Portuguese', 'pt', 0),
(90, 'Quechua', 'qu', 0),
(91, 'Rhaeto-Romance', 'rm', 0),
(92, 'Kirundi', 'rn', 0),
(93, 'Romanian', 'ro', 0),
(94, 'Russian', 'ru', 0),
(95, 'Kinyarwanda', 'rw', 0),
(96, 'Sanskrit', 'sa', 0),
(97, 'Sindhi', 'sd', 0),
(98, 'Sangro', 'sg', 0),
(99, 'Serbo-Croatian', 'sh', 0),
(100, 'Singhalese', 'si', 0),
(101, 'Slovak', 'sk', 0),
(102, 'Slovenian', 'sl', 0),
(103, 'Samoan', 'sm', 0),
(104, 'Shona', 'sn', 0),
(105, 'Somali', 'so', 0),
(106, 'Albanian', 'sq', 0),
(107, 'Serbian', 'sr', 0),
(108, 'Siswati', 'ss', 0),
(109, 'Sesotho', 'st', 0),
(110, 'Sundanese', 'su', 0),
(111, 'Swedish', 'sv', 0),
(112, 'Swahili', 'sw', 0),
(113, 'Tamil', 'ta', 0),
(114, 'Telugu', 'te', 0),
(115, 'Tajik', 'tg', 0),
(116, 'Thai', 'th', 0),
(117, 'Tigrinya', 'ti', 0),
(118, 'Turkmen', 'tk', 0),
(119, 'Tagalog', 'tl', 0),
(120, 'Setswana', 'tn', 0),
(121, 'Tonga', 'to', 0),
(122, 'Turkish', 'tr', 0),
(123, 'Tsonga', 'ts', 0),
(124, 'Tatar', 'tt', 0),
(125, 'Twi', 'tw', 0),
(126, 'Ukrainian', 'uk', 0),
(127, 'Urdu', 'ur', 0),
(128, 'Uzbek', 'uz', 0),
(129, 'Vietnamese', 'vi', 0),
(130, 'Volapuk', 'vo', 0),
(131, 'Wolof', 'wo', 0),
(132, 'Xhosa', 'xh', 0),
(133, 'Yoruba', 'yo', 0),
(134, 'Chinese', 'zh', 0),
(135, 'Zulu', 'zu', 0);

-- --------------------------------------------------------

--
-- Структура таблиці `osc_logs`
--

CREATE TABLE `osc_logs` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `type` int(7) NOT NULL DEFAULT '0',
  `description` varchar(1024) NOT NULL,
  `userid` int(11) NOT NULL DEFAULT '0',
  `ip` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Project logs';

--
-- Дамп даних таблиці `osc_logs`
--

INSERT INTO `osc_logs` (`id`, `date`, `type`, `description`, `userid`, `ip`) VALUES
(1, '2017-04-30 23:39:04', 1, 'Admin login: Success login.', 3, '::1'),
(2, '2017-04-30 23:39:47', 1, 'Admin login: Success login.', 3, '::1'),
(3, '2017-04-30 23:40:07', 1, 'Admin login: Success login.', 3, '::1'),
(4, '2017-04-30 23:40:33', 1, 'Admin login: Success login.', 3, '::1'),
(5, '2017-04-30 23:41:34', 1, 'Admin login: Success login.', 3, '::1'),
(6, '2017-04-30 23:45:39', 1, 'Admin login: Success login.', 3, '::1'),
(7, '2017-04-30 23:53:01', 1, 'Admin login: Success login.', 3, '::1'),
(8, '2017-05-02 16:13:56', 1, 'Admin login: Success login.', 3, '::1'),
(9, '2017-05-02 16:51:21', 1, 'Admin login: Success login.', 3, '::1'),
(10, '2017-05-02 17:11:42', 1, 'Admin login: Success login.', 3, '::1'),
(11, '2017-05-02 23:02:02', 1, 'Admin login: Success login.', 3, '::1'),
(12, '2017-05-02 23:02:21', 1, 'Admin login: Success login.', 3, '::1'),
(13, '2017-05-02 23:04:17', 1, 'Admin login: Success login.', 8, '::1'),
(14, '2017-05-02 23:08:27', 1, 'Admin login: Success login.', 8, '::1'),
(15, '2017-05-04 18:23:58', 1, 'Admin login: Success login.', 8, '::1'),
(16, '2017-05-23 21:20:57', 1, 'Admin login: Success login.', 8, '::1'),
(17, '2017-05-23 22:31:26', 1, 'Admin login: Success login.', 8, '::1'),
(18, '2017-05-24 18:29:09', 1, 'Admin login: Success login.', 8, '::1'),
(19, '2017-05-25 01:00:30', 1, 'Admin login: Permission denied.', 0, '::1'),
(20, '2017-05-25 01:00:33', 1, 'Admin login: Permission denied.', 0, '::1'),
(21, '2017-05-25 01:00:43', 1, 'Admin login: Success login.', 8, '::1'),
(22, '2017-05-25 14:04:08', 1, 'Admin login: Success login.', 8, '::1'),
(23, '2017-05-25 16:32:07', 1, 'Admin login: Success login.', 8, '::1'),
(24, '2017-05-26 13:15:47', 1, 'Admin login: Success login.', 8, '::1'),
(25, '2017-05-26 18:02:06', 1, 'Admin login: Success login.', 1, '::1'),
(26, '2017-05-27 17:02:19', 1, 'Admin login: Success login.', 1, '::1'),
(27, '2017-05-27 21:12:42', 1, 'Admin login: Success login.', 1, '::1'),
(28, '2017-05-30 14:30:44', 1, 'Admin login: Success login.', 1, '::1'),
(29, '2017-05-31 13:28:53', 1, 'Admin login: Success login.', 1, '::1'),
(30, '2017-06-01 14:30:08', 1, 'Admin login: Success login.', 1, '::1'),
(31, '2017-06-05 17:50:43', 1, 'Admin login: Success login.', 1, '::1'),
(32, '2017-06-06 16:17:55', 1, 'Admin login: Success login.', 1, '::1'),
(33, '2017-06-07 12:39:17', 1, 'Admin login: Success login.', 1, '::1'),
(34, '2017-06-08 15:30:15', 1, 'Admin login: Success login.', 1, '::1'),
(35, '2017-06-09 16:12:46', 1, 'Admin login: Success login.', 1, '::1'),
(36, '2017-06-09 21:49:39', 1, 'Admin login: Success login.', 1, '62.216.59.235'),
(37, '2017-06-11 11:37:33', 1, 'Admin login: Success login.', 2, '31.43.126.8'),
(38, '2017-06-11 23:53:42', 1, 'Admin login: Success login.', 1, '95.158.43.192'),
(39, '2017-06-12 11:36:14', 1, 'Admin login: Success login.', 2, '213.159.247.232'),
(40, '2017-06-12 15:03:15', 1, 'Admin login: Success login.', 1, '62.216.59.235'),
(41, '2017-06-12 16:57:41', 1, 'Admin login: Success login.', 2, '213.159.242.223'),
(42, '2017-06-12 19:48:52', 1, 'Admin login: Success login.', 1, '62.216.59.235'),
(43, '2017-06-12 23:00:50', 1, 'Admin login: Success login.', 1, '62.216.59.235'),
(44, '2017-06-13 01:36:27', 1, 'Admin login: Success login.', 1, '95.158.43.192'),
(45, '2017-06-13 01:38:29', 1, 'Admin login: Success login.', 2, '95.158.43.192'),
(46, '2017-06-13 01:39:34', 1, 'Admin login: Success login.', 2, '95.158.43.192'),
(47, '2017-06-13 01:42:24', 1, 'Admin login: Success login.', 1, '95.158.43.192'),
(48, '2017-06-13 11:22:36', 1, 'Admin login: Success login.', 2, '213.159.242.223'),
(49, '2017-06-13 12:55:33', 1, 'Admin login: Success login.', 2, '213.159.242.223'),
(50, '2017-06-13 14:25:08', 1, 'Admin login: Success login.', 1, '62.216.59.235'),
(51, '2017-06-14 14:38:09', 1, 'Admin login: Success login.', 2, '213.159.242.223'),
(52, '2017-06-14 14:38:28', 1, 'Admin login: Success login.', 1, '62.216.60.152'),
(53, '2017-06-15 03:22:51', 1, 'Admin login: Success login.', 1, '95.158.43.192'),
(54, '2017-06-15 14:51:10', 1, 'Admin login: Success login.', 1, '62.216.60.60'),
(55, '2017-06-16 16:11:03', 1, 'Admin login: Success login.', 1, '62.216.60.60'),
(56, '2017-06-18 01:40:24', 1, 'Admin login: Success login.', 1, '95.158.43.192'),
(57, '2017-06-18 02:16:11', 1, 'Admin login: Success login.', 1, '::1'),
(58, '2017-06-19 01:04:54', 1, 'Admin login: Success login.', 1, '62.216.60.60'),
(59, '2017-06-19 11:55:47', 1, 'Admin login: Success login.', 2, '213.159.242.223'),
(60, '2017-06-19 16:08:03', 1, 'Admin login: Success login.', 1, '62.216.60.60'),
(61, '2017-06-20 14:34:40', 1, 'Admin login: Success login.', 2, '213.159.242.223'),
(62, '2017-06-20 22:01:07', 1, 'Admin login: Success login.', 1, '62.216.60.60'),
(63, '2017-06-21 09:40:36', 1, 'Admin login: Success login.', 2, '188.247.117.17'),
(64, '2017-06-21 16:38:28', 1, 'Admin login: Success login.', 2, '213.159.242.223'),
(65, '2017-06-22 11:46:21', 1, 'Admin login: Success login.', 2, '213.159.242.223'),
(66, '2017-06-22 21:20:50', 1, 'Admin login: Success login.', 1, '62.216.60.60'),
(67, '2017-06-23 12:20:37', 1, 'Admin login: Success login.', 2, '213.159.242.223'),
(68, '2017-06-26 10:45:26', 1, 'Admin login: Success login.', 2, '213.159.242.223'),
(69, '2017-06-26 17:07:48', 1, 'Admin login: Success login.', 2, '213.159.242.223'),
(70, '2017-06-26 18:41:49', 1, 'Admin login: Success login.', 1, '62.216.63.9'),
(71, '2017-06-27 11:41:13', 1, 'Admin login: Success login.', 2, '213.159.242.223'),
(72, '2017-06-28 18:37:06', 1, 'Admin login: Success login.', 1, '62.216.63.9'),
(73, '2017-07-04 22:08:20', 1, 'Admin login: Success login.', 1, '62.216.61.194'),
(74, '2017-07-05 17:15:55', 1, 'Admin login: Success login.', 2, '213.159.242.223'),
(75, '2017-07-05 19:02:04', 1, 'Admin login: Success login.', 1, '62.216.61.194'),
(76, '2017-07-06 15:59:41', 1, 'Admin login: Success login.', 1, '62.216.61.194'),
(77, '2017-07-07 16:17:50', 1, 'Admin login: Success login.', 1, '62.216.61.194'),
(78, '2017-07-07 17:14:18', 1, 'Admin login: Success login.', 2, '213.159.242.223'),
(79, '2017-07-07 23:44:11', 1, 'Admin login: Success login.', 1, '95.158.43.192'),
(80, '2017-07-08 18:26:01', 1, 'Admin login: Success login.', 1, '62.216.61.194'),
(81, '2017-07-10 15:43:37', 1, 'Admin login: Success login.', 1, '95.158.43.192'),
(82, '2017-07-11 10:37:49', 1, 'Admin login: Success login.', 2, '31.43.126.8'),
(83, '2017-07-11 15:13:08', 1, 'Admin login: Success login.', 2, '213.159.242.223'),
(84, '2017-07-11 15:27:16', 1, 'Admin login: Success login.', 1, '62.216.61.194'),
(85, '2017-07-12 10:11:37', 1, 'Admin login: Success login.', 2, '31.43.126.8'),
(86, '2017-07-12 14:27:21', 1, 'Admin login: Success login.', 1, '62.216.61.166'),
(87, '2017-07-12 19:05:20', 1, 'Admin login: Success login.', 1, '62.216.61.166'),
(88, '2017-07-13 15:52:31', 1, 'Admin login: Success login.', 1, '62.216.61.166'),
(89, '2017-07-14 12:55:31', 1, 'Admin login: Success login.', 2, '31.43.126.8'),
(90, '2017-07-15 22:21:19', 1, 'Admin login: Success login.', 1, '62.216.56.67'),
(91, '2017-07-16 13:44:30', 1, 'Admin login: Success login.', 2, '31.43.126.8'),
(92, '2017-07-16 21:09:50', 1, 'Admin login: Success login.', 1, '95.158.43.192'),
(93, '2017-07-17 21:13:17', 1, 'Admin login: Success login.', 1, '62.216.56.67'),
(94, '2017-07-18 14:10:50', 1, 'Admin login: Success login.', 2, '31.43.126.8'),
(95, '2017-07-18 16:00:15', 1, 'Admin login: Success login.', 2, '62.216.56.67'),
(96, '2017-07-18 16:04:29', 1, 'Admin login: Success login.', 1, '31.43.126.8'),
(97, '2017-07-18 19:24:08', 1, 'Admin login: Success login.', 1, '62.216.56.67'),
(98, '2017-07-20 14:42:54', 1, 'Admin login: Success login.', 1, '62.216.56.67'),
(99, '2017-07-21 22:02:50', 1, 'Admin login: Success login.', 1, '62.216.56.67'),
(100, '2017-07-23 10:28:00', 1, 'Admin login: Success login.', 2, '31.43.126.8'),
(101, '2017-07-25 12:23:59', 1, 'Admin login: Success login.', 1, '62.216.56.67'),
(102, '2017-07-27 19:53:33', 1, 'Admin login: Success login.', 1, '95.158.43.192'),
(103, '2017-07-29 14:38:25', 1, 'Admin login: Success login.', 2, '31.43.126.8'),
(104, '2017-08-02 11:04:55', 1, 'Admin login: Success login.', 2, '213.159.242.223'),
(105, '2017-08-02 12:16:08', 1, 'Admin login: Success login.', 1, '62.216.63.76'),
(106, '2017-08-03 12:05:41', 1, 'Admin login: Success login.', 2, '213.159.242.223'),
(107, '2017-08-04 14:54:40', 1, 'Admin login: Success login.', 2, '213.159.242.223'),
(108, '2017-08-08 22:17:37', 1, 'Admin login: Success login.', 1, '::1'),
(109, '2017-08-10 23:15:13', 1, 'Admin login: Success login.', 1, '::1'),
(110, '2017-08-11 23:57:09', 1, 'Admin login: Success login.', 1, '::1'),
(111, '2017-08-14 21:54:10', 1, 'Admin login: Success login.', 1, '::1'),
(112, '2017-08-14 22:16:54', 1, 'Admin login: Success login.', 1, '95.158.43.192'),
(113, '2017-08-15 12:07:26', 1, 'Admin login: Success login.', 2, '213.159.242.223'),
(114, '2017-08-15 12:54:21', 1, 'Admin login: Success login.', 1, '62.216.57.87'),
(115, '2017-08-15 20:58:26', 1, 'Admin login: Success login.', 1, '95.158.43.192'),
(116, '2017-08-16 10:58:20', 1, 'Admin login: Success login.', 2, '213.159.242.223'),
(117, '2017-08-17 13:18:08', 1, 'Admin login: Success login.', 2, '213.159.242.223'),
(118, '2017-08-21 12:23:37', 1, 'Admin login: Success login.', 2, '213.159.242.223'),
(119, '2017-08-22 10:31:19', 1, 'Admin login: Success login.', 2, '213.159.242.223'),
(120, '2017-08-28 11:45:23', 1, 'Admin login: Success login.', 2, '213.159.242.223'),
(121, '2017-08-28 11:46:32', 1, 'Admin login: Success login.', 2, '213.159.242.223'),
(122, '2017-08-29 10:50:08', 1, 'Admin login: Success login.', 2, '213.159.242.223'),
(123, '2017-08-30 11:16:07', 1, 'Admin login: Success login.', 2, '213.159.242.223'),
(124, '2017-08-31 12:48:34', 1, 'Admin login: Success login.', 2, '213.159.242.223'),
(125, '2017-09-01 16:57:36', 1, 'Admin login: Success login.', 2, '213.159.242.223'),
(126, '2017-09-05 11:57:13', 1, 'Admin login: Success login.', 2, '213.159.242.223'),
(127, '2017-09-06 15:45:08', 1, 'Admin login: Success login.', 2, '213.159.242.223'),
(128, '2017-09-06 17:31:18', 1, 'Admin login: Success login.', 1, '62.216.63.184'),
(129, '2017-09-11 14:40:33', 1, 'Admin login: Success login.', 1, '::1'),
(130, '2017-09-12 11:13:51', 1, 'Admin login: Success login.', 2, '213.159.242.223'),
(131, '2017-09-12 16:38:38', 1, 'Admin login: Success login.', 1, '62.216.63.184'),
(132, '2017-09-13 13:09:08', 1, 'Admin login: Success login.', 2, '213.159.242.223'),
(133, '2017-09-18 12:11:39', 1, 'Admin login: Success login.', 2, '213.159.242.223'),
(134, '2017-09-22 14:32:13', 1, 'Admin login: Success login.', 1, '::1'),
(135, '2017-09-23 15:41:49', 1, 'Admin login: Success login.', 1, '::1'),
(136, '2017-09-23 17:38:43', 1, 'Admin login: Success login.', 1, '62.216.63.184'),
(137, '2017-09-26 19:33:10', 1, 'Admin login: Success login.', 1, '95.158.43.202'),
(138, '2017-09-27 12:13:50', 1, 'Admin login: Success login.', 2, '213.159.242.223'),
(139, '2017-09-28 18:25:01', 1, 'Admin login: Success login.', 2, '213.159.242.223'),
(140, '2017-09-28 18:37:51', 1, 'Admin login: Success login.', 1, '95.158.43.202'),
(141, '2017-09-29 14:14:25', 1, 'Admin login: Success login.', 1, '62.216.63.184'),
(142, '2017-10-02 13:37:54', 1, 'Admin login: Success login.', 1, '62.216.63.184'),
(143, '2017-10-02 15:00:30', 1, 'Admin login: Success login.', 2, '213.159.247.232'),
(144, '2017-10-07 14:15:22', 1, 'Admin login: Success login.', 2, '31.43.126.8'),
(145, '2017-10-10 18:57:37', 1, 'Admin login: Success login.', 1, '62.216.56.122'),
(146, '2017-10-11 11:22:24', 1, 'Admin login: Success login.', 2, '213.159.242.223'),
(147, '2017-10-12 10:41:18', 1, 'Admin login: Success login.', 2, '213.159.242.223'),
(148, '2017-10-16 09:39:00', 1, 'Admin login: Success login.', 2, '31.43.126.8'),
(149, '2017-10-20 10:12:31', 1, 'Admin login: Success login.', 2, '213.159.242.223'),
(150, '2017-10-23 12:54:06', 1, 'Admin login: Success login.', 2, '213.159.242.223'),
(151, '2017-10-23 15:58:18', 1, 'Admin login: Success login.', 2, '213.159.242.223'),
(152, '2017-10-24 11:32:06', 1, 'Admin login: Success login.', 2, '213.159.242.223'),
(153, '2017-10-24 16:01:28', 1, 'Admin login: Success login.', 2, '213.159.242.223'),
(154, '2017-10-25 17:23:38', 1, 'Admin login: Success login.', 2, '213.159.242.223'),
(155, '2017-10-27 14:34:39', 1, 'Admin login: Success login.', 2, '213.159.242.223'),
(156, '2017-10-30 20:24:11', 1, 'Admin login: Success login.', 1, '62.216.62.47'),
(157, '2017-11-01 15:34:51', 1, 'Admin login: Success login.', 2, '213.159.242.223'),
(158, '2017-11-02 13:19:30', 1, 'Admin login: Success login.', 2, '213.159.242.223'),
(159, '2017-11-02 14:57:45', 1, 'Admin login: Success login.', 2, '213.159.242.223'),
(160, '2017-11-02 16:12:02', 1, 'Admin login: Success login.', 1, '62.216.62.47'),
(161, '2017-11-06 11:50:56', 1, 'Admin login: Success login.', 2, '213.159.242.223'),
(162, '2017-11-06 22:23:11', 1, 'Admin login: Success login.', 2, '31.43.126.8'),
(163, '2017-11-09 11:59:57', 1, 'Admin login: Success login.', 1, '95.158.43.202'),
(164, '2017-11-09 11:59:57', 1, 'Admin login: Success login.', 1, '95.158.43.202'),
(165, '2017-11-09 15:03:43', 1, 'Admin login: Success login.', 2, '213.159.242.223'),
(166, '2017-11-13 10:18:46', 1, 'Admin login: Success login.', 2, '213.159.247.232'),
(167, '2017-11-17 12:56:30', 1, 'Admin login: Success login.', 2, '213.159.242.223'),
(168, '2017-11-20 10:49:20', 1, 'Admin login: Success login.', 2, '213.159.242.223'),
(169, '2017-11-22 11:53:12', 1, 'Admin login: Success login.', 2, '213.159.242.223'),
(170, '2017-11-24 15:43:55', 1, 'Admin login: Success login.', 2, '213.159.242.223'),
(171, '2017-11-26 19:56:58', 1, 'Admin login: Success login.', 2, '31.43.126.8'),
(172, '2017-11-27 10:22:14', 1, 'Admin login: Success login.', 2, '213.159.242.223'),
(173, '2017-11-28 12:11:31', 1, 'Admin login: Success login.', 2, '213.159.242.223'),
(174, '2017-11-28 13:54:41', 1, 'Admin login: Success login.', 1, '::1'),
(175, '2018-01-05 15:57:29', 1, 'Admin login: Success login.', 1, '::1'),
(176, '2018-01-06 16:19:47', 1, 'Admin login: Success login.', 1, '::1'),
(177, '2018-01-07 14:04:17', 1, 'Admin login: Success login.', 1, '::1'),
(178, '2018-01-08 15:35:18', 1, 'Admin login: Success login.', 1, '::1'),
(179, '2018-01-08 19:52:22', 1, 'Admin login: Success login.', 1, '62.216.58.128'),
(180, '2018-01-09 10:20:13', 1, 'Admin login: Success login.', 2, '213.159.242.223'),
(181, '2018-01-09 13:05:53', 1, 'Admin login: Success login.', 1, '62.216.58.128'),
(182, '2018-01-09 23:38:29', 1, 'Admin login: Success login.', 1, '62.216.58.128'),
(183, '2018-01-10 00:55:44', 1, 'Admin login: Success login.', 1, '::1'),
(184, '2018-01-10 02:54:48', 1, 'Admin login: Success login.', 1, '95.158.43.223'),
(185, '2018-01-10 15:37:39', 1, 'Admin login: Success login.', 2, '213.159.247.232'),
(186, '2018-01-10 16:20:33', 1, 'Admin login: Success login.', 1, '62.216.58.128'),
(187, '2018-01-11 19:26:21', 1, 'Admin login: Success login.', 1, '95.158.43.223'),
(188, '2018-01-11 22:51:16', 1, 'Admin login: Success login.', 1, '95.158.43.223'),
(189, '2018-01-12 16:44:40', 1, 'Admin login: Success login.', 1, '62.216.63.165'),
(190, '2018-01-12 23:07:42', 1, 'Admin login: Success login.', 1, '62.216.63.165'),
(191, '2018-01-13 02:00:51', 1, 'Admin login: Success login.', 1, '95.158.43.223'),
(192, '2018-01-13 02:01:40', 1, 'Admin login: Success login.', 1, '95.158.43.223'),
(193, '2018-01-13 02:01:48', 1, 'Admin login: Success login.', 1, '95.158.43.223'),
(194, '2018-01-14 12:18:06', 1, 'Admin login: Success login.', 1, '95.158.43.223'),
(195, '2018-01-14 18:23:24', 1, 'Admin login: Success login.', 1, '62.216.63.165'),
(196, '2018-01-15 23:48:48', 1, 'Admin login: Success login.', 1, '62.216.63.165'),
(197, '2018-01-17 18:14:43', 1, 'Admin login: Success login.', 1, '62.216.63.165'),
(198, '2018-01-17 23:01:53', 1, 'Admin login: Success login.', 1, '62.216.63.165'),
(199, '2018-01-18 17:25:26', 1, 'Admin login: Success login.', 1, '62.216.63.165'),
(200, '2018-01-19 16:22:13', 1, 'Admin login: Success login.', 1, '62.216.63.165'),
(201, '2018-01-20 15:37:05', 1, 'Admin login: Success login.', 1, '95.158.43.223'),
(202, '2018-01-22 10:32:26', 1, 'Admin login: Success login.', 2, '37.52.204.10'),
(203, '2018-01-22 22:20:07', 1, 'Admin login: Success login.', 1, '62.216.63.165'),
(204, '2018-01-23 21:01:48', 1, 'Admin login: Success login.', 1, '62.216.63.165'),
(205, '2018-01-26 15:06:24', 1, 'Admin login: Success login.', 1, '62.216.63.165'),
(206, '2018-01-29 20:58:33', 1, 'Admin login: Success login.', 1, '95.158.43.223'),
(207, '2018-02-01 16:58:48', 1, 'Admin login: Success login.', 1, '95.158.43.223'),
(208, '2018-02-05 11:29:26', 1, 'Admin login: Success login.', 2, '213.159.242.223'),
(209, '2018-02-09 16:44:24', 1, 'Admin login: Success login.', 1, '62.216.59.239'),
(210, '2018-02-12 10:44:25', 1, 'Admin login: Success login.', 2, '213.159.242.223'),
(211, '2018-02-12 22:08:26', 1, 'Admin login: Success login.', 1, '62.216.59.239'),
(212, '2018-02-15 15:43:54', 1, 'Admin login: Success login.', 2, '213.159.242.223'),
(213, '2018-02-18 00:12:35', 1, 'Admin login: Success login.', 1, '62.216.59.239'),
(214, '2018-02-26 10:36:57', 1, 'Admin login: Success login.', 2, '213.159.242.223'),
(215, '2018-02-26 11:13:26', 1, 'Admin login: Success login.', 2, '213.159.242.223'),
(216, '2018-03-12 14:10:52', 1, 'Admin login: Success login.', 1, '62.216.62.194'),
(217, '2018-03-14 12:35:30', 1, 'Admin login: Success login.', 2, '213.159.242.223'),
(218, '2018-03-19 13:28:24', 1, 'Admin login: Success login.', 1, '95.158.43.222'),
(219, '2018-03-19 15:44:19', 1, 'Admin login: Success login.', 2, '213.159.242.223'),
(220, '2018-03-24 12:59:47', 1, 'Admin login: Success login.', 1, '95.158.43.222'),
(221, '2018-03-27 17:43:43', 1, 'Admin login: Success login.', 2, '213.159.242.223'),
(222, '2018-04-02 14:50:42', 1, 'Admin login: Success login.', 1, '62.216.56.58'),
(223, '2018-04-09 09:16:34', 1, 'Admin login: Success login.', 2, '94.207.31.52'),
(224, '2018-04-09 13:50:59', 1, 'Admin login: Success login.', 1, '62.216.56.58'),
(225, '2018-04-10 16:04:40', 1, 'Admin login: Success login.', 1, '62.216.56.58'),
(226, '2018-04-12 15:44:23', 1, 'Admin login: Success login.', 1, '62.216.56.58'),
(227, '2018-04-17 11:18:48', 1, 'Admin login: Success login.', 2, '213.159.242.223'),
(228, '2018-04-17 11:18:48', 1, 'Admin login: Success login.', 2, '213.159.242.223'),
(229, '2018-04-17 11:18:51', 1, 'Admin login: Success login.', 2, '213.159.242.223'),
(230, '2018-04-17 11:18:51', 1, 'Admin login: Success login.', 2, '213.159.242.223'),
(231, '2018-04-18 15:34:23', 1, 'Admin login: Success login.', 2, '213.159.242.223'),
(232, '2018-04-20 02:05:15', 1, 'Admin login: Success login.', 1, '62.216.57.60'),
(233, '2018-04-23 16:09:23', 1, 'Admin login: Success login.', 2, '213.159.242.223'),
(234, '2018-04-25 14:41:45', 1, 'Admin login: Success login.', 2, '213.159.242.223'),
(235, '2018-05-02 10:46:22', 1, 'Admin login: Success login.', 2, '213.159.242.223'),
(236, '2018-05-04 11:25:20', 1, 'Admin login: Success login.', 2, '213.159.242.223'),
(237, '2018-05-08 16:50:15', 1, 'Admin login: Success login.', 1, '62.216.56.27'),
(238, '2018-05-10 09:10:25', 1, 'Admin login: Success login.', 2, '93.73.175.146'),
(239, '2018-05-14 10:33:08', 1, 'Admin login: Success login.', 2, '213.159.242.223'),
(240, '2018-05-21 15:08:16', 1, 'Admin login: Success login.', 1, '62.216.56.27'),
(241, '2018-05-21 15:08:16', 1, 'Admin login: Success login.', 1, '62.216.56.27'),
(242, '2018-05-21 15:10:20', 1, 'Admin login: Success login.', 3, '62.216.56.27'),
(243, '2018-05-21 15:11:25', 1, 'Admin login: Incorrect user type, Permission denied.', 3, '62.216.56.27'),
(244, '2018-05-21 15:11:28', 1, 'Admin login: Incorrect user type, Permission denied.', 3, '62.216.56.27'),
(245, '2018-05-21 15:16:48', 1, 'Admin login: Incorrect user type, Permission denied.', 3, '62.216.56.27'),
(246, '2018-05-21 15:17:24', 1, 'Admin login: Success login.', 3, '62.216.56.27'),
(247, '2018-05-24 11:47:54', 1, 'Admin login: Success login.', 2, '213.159.242.223'),
(248, '2018-05-30 11:55:26', 1, 'Admin login: Success login.', 2, '213.159.242.223');

-- --------------------------------------------------------

--
-- Структура таблиці `osc_log_types`
--

CREATE TABLE `osc_log_types` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Project log types';

--
-- Дамп даних таблиці `osc_log_types`
--

INSERT INTO `osc_log_types` (`id`, `name`) VALUES
(1, 'Admin login'),
(2, 'Other user actions');

-- --------------------------------------------------------

--
-- Структура таблиці `osc_menu`
--

CREATE TABLE `osc_menu` (
  `id` int(11) NOT NULL,
  `type` int(6) NOT NULL DEFAULT '0',
  `parent_id` int(6) NOT NULL DEFAULT '0',
  `name` varchar(127) NOT NULL DEFAULT '0',
  `alias` varchar(255) NOT NULL DEFAULT '0',
  `order_id` int(5) NOT NULL DEFAULT '0',
  `is_right` int(1) DEFAULT '0' COMMENT 'Размещать в правой колонке?',
  `is_left` int(1) DEFAULT '0' COMMENT 'Размещать в левой колонке?',
  `is_bottom` int(1) DEFAULT '0' COMMENT 'Размещать в футере?',
  `is_top` int(1) DEFAULT '0' COMMENT 'Размещать в хедере?',
  `block` int(1) NOT NULL DEFAULT '0',
  `target` int(1) NOT NULL DEFAULT '0',
  `dateCreate` datetime NOT NULL,
  `dateModify` datetime NOT NULL,
  `adminMod` int(7) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `osc_menu`
--

INSERT INTO `osc_menu` (`id`, `type`, `parent_id`, `name`, `alias`, `order_id`, `is_right`, `is_left`, `is_bottom`, `is_top`, `block`, `target`, `dateCreate`, `dateModify`, `adminMod`) VALUES
(1, 1, 0, 'Квартиры', 'flats', 0, 0, 0, 0, 0, 0, 0, '2017-12-28 00:00:00', '2017-12-28 00:00:00', 0),
(2, 1, 0, 'Экохаусы', 'townhouses', 0, 0, 0, 0, 0, 0, 0, '2017-12-28 00:00:00', '2018-01-11 16:50:32', 0),
(3, 1, 0, 'Коттеджи', 'cottages', 0, 0, 0, 0, 0, 0, 0, '2017-12-28 00:00:00', '2017-12-28 00:00:00', 0),
(4, 0, 0, 'О застройщике', 'about', 0, 0, 1, 0, 0, 0, 0, '2017-12-28 00:00:00', '2017-12-28 00:00:00', 0),
(5, 0, 0, 'Сданные объекты', 'news/80', 2, 1, 0, 0, 0, 0, 0, '2017-12-28 00:00:00', '2018-02-09 16:44:34', 0),
(6, 0, 0, 'Документы', 'documents', 0, 0, 1, 0, 0, 1, 0, '2017-12-28 00:00:00', '2018-01-10 17:42:44', 0),
(7, 0, 0, 'Ход строительства', 'building-progress', 3, 0, 1, 0, 0, 0, 0, '2017-12-28 00:00:00', '2018-01-15 22:18:02', 0),
(8, 0, 0, 'Новости', 'news', 4, 1, 0, 0, 0, 0, 0, '2017-12-28 00:00:00', '2017-12-28 00:00:00', 0),
(9, 0, 0, 'Контакты', 'contacts', 5, 1, 0, 0, 0, 0, 0, '2017-12-28 00:00:00', '2017-12-28 00:00:00', 0),
(10, 0, 0, 'Инфраструктура', 'infrastructure', 1, 0, 1, 0, 0, 0, 0, '2017-12-28 00:00:00', '2017-12-28 00:00:00', 0);

-- --------------------------------------------------------

--
-- Структура таблиці `osc_menu_home`
--

CREATE TABLE `osc_menu_home` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `block` int(1) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `dateCreate` datetime DEFAULT NULL,
  `dateModify` datetime DEFAULT NULL,
  `adminMod` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Список секций на главной';

--
-- Дамп даних таблиці `osc_menu_home`
--

INSERT INTO `osc_menu_home` (`id`, `name`, `block`, `order_id`, `dateCreate`, `dateModify`, `adminMod`) VALUES
(1, 'Баннер', 0, 1, '2017-05-04 00:00:00', '2017-05-05 02:26:26', 1),
(2, 'Удобное хранение в три этапа', 0, 2, '2017-05-04 00:00:00', '2017-05-04 00:00:00', 1),
(3, 'Стоимость услуг', 0, 3, '2017-05-04 15:51:34', '2017-05-04 15:51:34', 0),
(4, 'Наш склад', 0, 4, '2017-05-04 16:13:02', '2017-05-04 16:13:02', 0),
(5, 'Нужно знать', 0, 5, '2017-05-04 19:02:44', '2017-05-04 19:02:44', 0),
(6, 'Почему мы', 0, 6, '2017-05-04 19:15:59', '2017-05-04 19:15:59', 0),
(7, 'Отзывы клиентов', 0, 7, '2017-05-04 19:30:45', '2017-05-04 19:30:45', 0),
(8, 'Контактная форма', 0, 8, '2017-05-04 20:06:36', '2017-05-05 02:26:04', 0);

-- --------------------------------------------------------

--
-- Структура таблиці `osc_menu_pages_ref`
--

CREATE TABLE `osc_menu_pages_ref` (
  `id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `table_name` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Связующая таблица меню и страниц';

--
-- Дамп даних таблиці `osc_menu_pages_ref`
--

INSERT INTO `osc_menu_pages_ref` (`id`, `menu_id`, `table_name`) VALUES
(17, 8, 'osc_page_cottages'),
(16, 7, 'osc_page_townhouses'),
(15, 6, 'osc_page_flats'),
(14, 5, 'osc_page_contacts'),
(13, 4, 'osc_page_news'),
(12, 3, 'osc_page_building'),
(11, 2, 'osc_page_docs'),
(10, 1, 'osc_page_about'),
(18, 9, 'osc_th_reasons'),
(19, 10, 'osc_th_banner');

-- --------------------------------------------------------

--
-- Структура таблиці `osc_message_statuses`
--

CREATE TABLE `osc_message_statuses` (
  `id` int(11) NOT NULL,
  `name` varchar(63) NOT NULL DEFAULT '0',
  `alias` varchar(63) NOT NULL DEFAULT '0',
  `details` tinytext NOT NULL,
  `dateCreate` datetime NOT NULL,
  `dateModify` datetime NOT NULL,
  `adminMod` int(7) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Список типов сообщений';

--
-- Дамп даних таблиці `osc_message_statuses`
--

INSERT INTO `osc_message_statuses` (`id`, `name`, `alias`, `details`, `dateCreate`, `dateModify`, `adminMod`) VALUES
(1, 'Не прочитано', 'new', 'Не прочитанные сообщения', '2013-11-15 00:00:00', '2013-11-15 00:00:00', 1),
(2, 'Прочитано', 'readble', 'Прочитанные сообщения', '2013-11-15 00:00:00', '2013-11-15 00:00:00', 1),
(3, 'Выполнено', 'done', 'Выполненное задание', '2013-11-15 11:24:01', '2013-11-15 11:24:01', 1);

-- --------------------------------------------------------

--
-- Структура таблиці `osc_message_types`
--

CREATE TABLE `osc_message_types` (
  `id` int(11) NOT NULL,
  `name` varchar(63) NOT NULL DEFAULT '0',
  `alias` varchar(63) NOT NULL DEFAULT '0',
  `details` tinytext NOT NULL,
  `dateCreate` datetime NOT NULL,
  `dateModify` datetime NOT NULL,
  `adminMod` int(7) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Список типов сообщений';

--
-- Дамп даних таблиці `osc_message_types`
--

INSERT INTO `osc_message_types` (`id`, `name`, `alias`, `details`, `dateCreate`, `dateModify`, `adminMod`) VALUES
(1, 'Сообщение', 'message', 'Обычное сообщение пользователю', '2013-11-15 11:04:04', '2013-11-15 11:04:04', 1),
(2, 'Задание', 'task', 'Задание с необходимостью выполнить и поставить статус выполнено', '2013-11-15 11:04:51', '2013-11-15 11:04:51', 1),
(3, 'Тикет', 'ticket', 'Используются к примеру для кладовщика от управляющих, информация по отгрузке товаров', '2013-11-15 11:06:02', '2013-11-15 11:06:02', 1);

-- --------------------------------------------------------

--
-- Структура таблиці `osc_meta_table`
--

CREATE TABLE `osc_meta_table` (
  `id` int(11) NOT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_keys` varchar(255) DEFAULT NULL,
  `meta_desc` text,
  `meta_title_l2` varchar(255) DEFAULT NULL,
  `meta_keys_l2` varchar(255) DEFAULT NULL,
  `meta_desc_l2` text,
  `meta_title_l3` varchar(255) DEFAULT NULL,
  `meta_keys_l3` varchar(255) DEFAULT NULL,
  `meta_desc_l3` text,
  `meta_title_l4` varchar(255) DEFAULT NULL,
  `meta_keys_l4` varchar(255) DEFAULT NULL,
  `meta_desc_l4` text,
  `meta_title_s1` varchar(255) DEFAULT NULL,
  `meta_keys_s1` varchar(255) DEFAULT NULL,
  `meta_desc_s1` text,
  `meta_title_s2` varchar(255) DEFAULT NULL,
  `meta_keys_s2` varchar(255) DEFAULT NULL,
  `meta_desc_s2` text,
  `meta_title_f1` varchar(255) DEFAULT NULL,
  `meta_keys_f1` varchar(255) DEFAULT NULL,
  `meta_desc_f1` text,
  `meta_title_f2` varchar(255) DEFAULT NULL,
  `meta_keys_f2` varchar(255) DEFAULT NULL,
  `meta_desc_f2` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `osc_meta_table`
--

INSERT INTO `osc_meta_table` (`id`, `alias`, `meta_title`, `meta_keys`, `meta_desc`, `meta_title_l2`, `meta_keys_l2`, `meta_desc_l2`, `meta_title_l3`, `meta_keys_l3`, `meta_desc_l3`, `meta_title_l4`, `meta_keys_l4`, `meta_desc_l4`, `meta_title_s1`, `meta_keys_s1`, `meta_desc_s1`, `meta_title_s2`, `meta_keys_s2`, `meta_desc_s2`, `meta_title_f1`, `meta_keys_f1`, `meta_desc_f1`, `meta_title_f2`, `meta_keys_f2`, `meta_desc_f2`) VALUES
(1, 'home', 'Жилой комплекс \"Новая Конча-Заспа\". Престижный классический пригород. ', 'Квартиры, таунхаусы, коттеджи от застройщика.', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'townhouses', 'Таунхаусы от застройщика // ЖК \"Новая Конча-Заспа\"', 'купить таунхаус, таунхаусы недорого, таунхаусы от застройщика', 'Прекрасные таунхаусы от застройщика в престижном месте - Новой Конча-Заспе. Это благополучное место для жизни всей семьи. Живите с комфортом, дышите свежим воздухом, просыпайтесь под пение птиц.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'cottages', 'Коттеджи от застройщика // ЖК \"Новая Конча-Заспа\"', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'car', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'flat', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 'flats-page', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(7, 'building-progress', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблиці `osc_page_cottages`
--

CREATE TABLE `osc_page_cottages` (
  `id` int(11) NOT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `details` text,
  `filename` varchar(255) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_keys` varchar(255) DEFAULT NULL,
  `meta_desc` text,
  `is_index` int(1) DEFAULT '1',
  `dateCreate` datetime DEFAULT NULL,
  `dateModify` datetime DEFAULT NULL,
  `adminMod` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `osc_page_cottages`
--

INSERT INTO `osc_page_cottages` (`id`, `caption`, `details`, `filename`, `meta_title`, `meta_keys`, `meta_desc`, `is_index`, `dateCreate`, `dateModify`, `adminMod`) VALUES
(1, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2017-05-24 18:43:20', '2017-05-24 18:43:20', NULL);

-- --------------------------------------------------------

--
-- Структура таблиці `osc_page_news`
--

CREATE TABLE `osc_page_news` (
  `id` int(11) NOT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `redactor_name` varchar(255) DEFAULT NULL,
  `redactor_photo` varchar(255) DEFAULT NULL,
  `subscr_desc` varchar(255) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_keys` varchar(255) DEFAULT NULL,
  `meta_desc` text,
  `is_index` int(1) DEFAULT '1',
  `dateCreate` datetime DEFAULT NULL,
  `dateModify` datetime DEFAULT NULL,
  `adminMod` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `osc_page_news`
--

INSERT INTO `osc_page_news` (`id`, `caption`, `redactor_name`, `redactor_photo`, `subscr_desc`, `meta_title`, `meta_keys`, `meta_desc`, `is_index`, `dateCreate`, `dateModify`, `adminMod`) VALUES
(1, NULL, 'Редактор блога Владислава Правдина', 'nrd_20180116172658418.jpg', 'Мы пишем об акциях, скидках и ходе строительства. Даем советы о дизайне квартир и рекомендации по благоустройству', '', '', '', 1, '2017-05-24 18:17:16', '2018-01-17 17:34:06', NULL);

-- --------------------------------------------------------

--
-- Структура таблиці `osc_page_news_cats`
--

CREATE TABLE `osc_page_news_cats` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `osc_page_news_cats`
--

INSERT INTO `osc_page_news_cats` (`id`, `name`, `alias`, `created`, `modified`) VALUES
(1, 'дом Лион', 'dom-lion', '2018-01-12 00:00:00', '2018-01-15 21:24:14'),
(2, 'ход строительства', 'hod-stroitelstva', '2018-01-12 23:10:06', '2018-01-15 21:23:31'),
(3, 'Акции', 'akcii', '2018-01-15 21:23:46', '2018-01-15 21:23:46'),
(4, 'дом Шатель', 'dom-shatel', '2018-01-15 21:24:06', '2018-01-15 21:24:06'),
(5, 'Экохаусы', 'ekohausu', '2018-01-15 21:24:24', '2018-01-15 21:24:24'),
(6, 'Аналитика рынка', 'analitika-runka', '2018-01-15 21:37:54', '2018-01-15 21:37:54');

-- --------------------------------------------------------

--
-- Структура таблиці `osc_page_news_files`
--

CREATE TABLE `osc_page_news_files` (
  `id` int(11) NOT NULL,
  `ref` int(11) DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `block` int(11) NOT NULL DEFAULT '0',
  `order_pos` int(11) NOT NULL DEFAULT '0',
  `alt` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `osc_page_news_files`
--

INSERT INTO `osc_page_news_files` (`id`, `ref`, `file`, `block`, `order_pos`, `alt`) VALUES
(1, 1, 'gall_20170602151434945.jpg', 0, 0, ''),
(2, 1, 'gall_20170602151434853.jpg', 0, 0, ''),
(3, 4, 'gall_20170607113107637.jpg', 0, 0, ''),
(4, 4, 'gall_20170607113107746.jpg', 0, 0, ''),
(5, 4, 'gall_20170607113107245.jpg', 0, 0, ''),
(6, 4, 'gall_20170607113107968.jpg', 0, 0, ''),
(7, 4, 'gall_20170607113107440.jpg', 0, 0, ''),
(8, 4, 'gall_20170607113107186.jpg', 0, 0, ''),
(9, 4, 'gall_20170607113107976.jpg', 0, 0, ''),
(10, 4, 'gall_20170607113107456.jpg', 0, 0, ''),
(11, 4, 'gall_20170607113107742.jpg', 0, 0, ''),
(12, 4, 'gall_20170607113107887.jpg', 0, 0, ''),
(13, 4, 'gall_20170607113107813.png', 0, 0, ''),
(14, 4, 'gall_20170607113107450.JPG', 0, 0, ''),
(15, 4, 'gall_20170607113107790.JPG', 0, 0, ''),
(16, 4, 'gall_20170607113107764.png', 0, 0, ''),
(17, 4, 'gall_20170607113107133.jpg', 0, 0, ''),
(18, 4, 'gall_20170607123738599.jpg', 0, 0, ''),
(19, 4, 'gall_20170607123738708.jpg', 0, 0, ''),
(20, 5, 'gall_20170607143006878.png', 0, 0, ''),
(21, 5, 'gall_20170607143006662.jpg', 0, 0, ''),
(22, 5, 'gall_20170607143006254.gif', 0, 0, ''),
(23, 5, 'gall_20170607143006141.jpg', 0, 0, ''),
(24, 5, 'gall_20170607143006860.jpg', 0, 0, ''),
(25, 5, 'gall_20170607143006480.jpg', 0, 0, ''),
(26, 5, 'gall_20170607143006779.jpg', 0, 0, ''),
(27, 5, 'gall_20170607143006186.jpg', 0, 0, ''),
(28, 5, 'gall_20170607143006501.jpg', 0, 0, ''),
(29, 5, 'gall_20170607143006706.jpg', 0, 0, ''),
(30, 5, 'gall_20170607143006299.jpg', 0, 0, ''),
(31, 5, 'gall_20170607143006780.jpg', 0, 0, ''),
(32, 5, 'gall_20170607143006640.jpg', 0, 0, ''),
(33, 5, 'gall_20170607143006758.jpg', 0, 0, ''),
(34, 7, 'gall_20170608110622370.jpg', 0, 0, ''),
(35, 7, 'gall_20170608110622643.jpg', 0, 0, ''),
(36, 7, 'gall_20170608110622150.jpg', 0, 0, ''),
(37, 7, 'gall_20170608110622425.jpg', 0, 0, ''),
(38, 7, 'gall_20170608110622265.jpg', 0, 0, ''),
(39, 10, 'gall_20170608121218989.JPG', 0, 0, ''),
(40, 10, 'gall_20170608121218975.JPG', 0, 0, ''),
(41, 10, 'gall_20170608121218497.JPG', 0, 0, ''),
(42, 10, 'gall_20170608121218314.JPG', 0, 0, ''),
(43, 10, 'gall_20170608121218918.JPG', 0, 0, ''),
(44, 10, 'gall_20170608121218884.JPG', 0, 0, ''),
(45, 11, 'gall_20170608121507326.jpg', 0, 0, ''),
(46, 11, 'gall_20170608121507853.jpg', 0, 0, ''),
(47, 11, 'gall_20170608121507539.jpg', 0, 0, ''),
(48, 11, 'gall_20170608121507376.jpg', 0, 0, ''),
(49, 11, 'gall_20170608121507414.jpg', 0, 0, ''),
(50, 11, 'gall_20170608121507564.jpg', 0, 0, ''),
(51, 11, 'gall_20170608121507618.jpg', 0, 0, ''),
(52, 11, 'gall_20170608121507735.jpg', 0, 0, ''),
(53, 12, 'gall_20170608121719470.jpg', 0, 0, ''),
(54, 12, 'gall_20170608121719751.jpg', 0, 0, ''),
(55, 12, 'gall_20170608121719791.jpg', 0, 0, ''),
(56, 12, 'gall_20170608121719331.jpg', 0, 0, ''),
(57, 12, 'gall_20170608121719526.jpg', 0, 0, ''),
(58, 12, 'gall_20170608121719606.jpg', 0, 0, ''),
(59, 12, 'gall_20170608121719748.jpg', 0, 0, ''),
(60, 12, 'gall_20170608121719759.jpg', 0, 0, ''),
(61, 12, 'gall_20170608121719691.jpg', 0, 0, ''),
(62, 13, 'gall_20170608121846677.jpg', 0, 0, ''),
(63, 13, 'gall_20170608121846985.jpg', 0, 0, ''),
(64, 13, 'gall_20170608121846166.jpg', 0, 0, ''),
(65, 13, 'gall_20170608121846558.jpg', 0, 0, ''),
(66, 13, 'gall_20170608121846145.jpg', 0, 0, ''),
(67, 13, 'gall_20170608121846368.jpg', 0, 0, ''),
(68, 13, 'gall_20170608121846490.jpg', 0, 0, ''),
(69, 13, 'gall_20170608121846450.jpg', 0, 0, ''),
(70, 13, 'gall_20170608121846899.jpg', 0, 0, ''),
(71, 13, 'gall_20170608121846874.jpg', 0, 0, ''),
(72, 16, 'gall_20170608122401205.jpg', 0, 0, ''),
(73, 16, 'gall_20170608122401580.jpg', 0, 0, ''),
(74, 16, 'gall_20170608122401548.jpg', 0, 0, ''),
(75, 16, 'gall_20170608122401854.jpg', 0, 0, ''),
(76, 16, 'gall_20170608122401338.jpg', 0, 0, ''),
(77, 16, 'gall_20170608122401239.jpg', 0, 0, ''),
(78, 16, 'gall_20170608122401952.jpg', 0, 0, ''),
(79, 16, 'gall_20170608122401402.jpg', 0, 0, ''),
(80, 16, 'gall_20170608122401917.jpg', 0, 0, ''),
(81, 16, 'gall_20170608122401796.jpg', 0, 0, ''),
(82, 16, 'gall_20170608122401898.jpg', 0, 0, ''),
(83, 16, 'gall_20170608122401910.jpg', 0, 0, ''),
(84, 16, 'gall_20170608122401492.jpg', 0, 0, ''),
(85, 17, 'gall_20170608122454797.jpg', 0, 0, ''),
(86, 17, 'gall_20170608122454327.jpg', 0, 0, ''),
(87, 17, 'gall_20170608122454804.jpg', 0, 0, ''),
(88, 17, 'gall_20170608122455865.jpg', 0, 0, ''),
(89, 17, 'gall_20170608122455822.jpg', 0, 0, ''),
(90, 17, 'gall_20170608122455988.jpg', 0, 0, ''),
(91, 17, 'gall_20170608122455731.jpg', 0, 0, ''),
(92, 17, 'gall_20170608122455183.jpg', 0, 0, ''),
(93, 17, 'gall_20170608122455947.jpg', 0, 0, ''),
(94, 17, 'gall_20170608122455540.jpg', 0, 0, ''),
(95, 17, 'gall_20170608122455818.jpg', 0, 0, ''),
(96, 17, 'gall_20170608122455466.jpg', 0, 0, ''),
(97, 17, 'gall_20170608122455783.jpg', 0, 0, ''),
(98, 17, 'gall_20170608122455426.jpg', 0, 0, ''),
(99, 17, 'gall_20170608122455507.jpg', 0, 0, ''),
(100, 19, 'gall_20170612165816909.JPG', 0, 0, NULL),
(101, 19, 'gall_20170612165816945.JPG', 0, 0, NULL),
(102, 19, 'gall_20170612165816817.JPG', 0, 0, NULL),
(103, 19, 'gall_20170612165816774.JPG', 0, 0, NULL),
(104, 19, 'gall_20170612165816159.JPG', 0, 0, NULL),
(105, 19, 'gall_20170612165816667.JPG', 0, 0, NULL),
(106, 19, 'gall_20170612165816648.JPG', 0, 0, NULL),
(107, 19, 'gall_20170612165816204.JPG', 0, 0, NULL),
(108, 19, 'gall_20170612165817572.JPG', 0, 0, NULL),
(109, 20, 'gall_20170613160755528.jpg', 0, 0, NULL),
(110, 20, 'gall_20170613160755148.jpg', 0, 0, NULL),
(111, 20, 'gall_20170613160755697.jpg', 0, 0, NULL),
(112, 20, 'gall_20170613160755335.jpg', 0, 0, NULL),
(113, 20, 'gall_20170613160755590.jpg', 0, 0, NULL),
(114, 20, 'gall_20170613160755710.jpg', 0, 0, NULL),
(115, 20, 'gall_20170613160755210.jpg', 0, 0, NULL),
(116, 22, 'gall_20170621122916257.jpg', 0, 0, NULL),
(117, 22, 'gall_20170621122916102.jpg', 0, 0, NULL),
(118, 22, 'gall_20170621122916999.gif', 0, 0, NULL),
(119, 22, 'gall_20170621122916414.jpg', 0, 0, NULL),
(120, 22, 'gall_20170621122916108.jpg', 0, 0, NULL),
(121, 22, 'gall_20170621122916382.jpg', 0, 0, NULL),
(122, 22, 'gall_20170621122916124.jpg', 0, 0, NULL),
(123, 29, 'gall_20170629163616106.jpg', 0, 0, NULL),
(124, 30, 'gall_20170630172420708.jpeg', 0, 0, NULL),
(125, 30, 'gall_20170630172420733.jpg', 0, 0, NULL),
(126, 30, 'gall_20170630172457517.jpeg', 0, 0, NULL),
(127, 32, 'gall_20170707110846954.jpg', 0, 0, NULL),
(128, 32, 'gall_20170707110847884.jpg', 0, 0, NULL),
(129, 32, 'gall_20170707110847200.jpg', 0, 0, NULL),
(130, 32, 'gall_20170707110847923.jpg', 0, 0, NULL),
(131, 32, 'gall_20170707110847705.jpg', 0, 0, NULL),
(132, 32, 'gall_20170707110847594.jpg', 0, 0, NULL),
(133, 32, 'gall_20170707110847250.jpg', 0, 0, NULL),
(134, 32, 'gall_20170707110847498.jpg', 0, 0, NULL),
(135, 34, 'gall_20170711151433487.JPG', 0, 0, NULL),
(136, 34, 'gall_20170711151433948.JPG', 0, 0, NULL),
(137, 34, 'gall_20170711151433461.JPG', 0, 0, NULL),
(138, 34, 'gall_20170711151433879.JPG', 0, 0, NULL),
(139, 34, 'gall_20170711151433998.JPG', 0, 0, NULL),
(140, 34, 'gall_20170711151433327.JPG', 0, 0, NULL),
(141, 34, 'gall_20170711151433419.JPG', 0, 0, NULL),
(142, 34, 'gall_20170711151433399.JPG', 0, 0, NULL),
(143, 37, 'gall_20170725141453588.jpg', 0, 0, NULL),
(144, 37, 'gall_20170725141453875.jpg', 0, 0, NULL),
(145, 37, 'gall_20170725141453911.jpg', 0, 0, NULL),
(146, 37, 'gall_20170725141453134.jpg', 0, 0, NULL),
(147, 37, 'gall_20170725141453418.jpg', 0, 0, NULL),
(148, 37, 'gall_20170725141453686.jpg', 0, 0, NULL),
(149, 37, 'gall_20170725141453653.jpg', 0, 0, NULL),
(150, 37, 'gall_20170725141453754.jpg', 0, 0, NULL),
(151, 39, 'gall_20170802143504530.jpg', 0, 0, NULL),
(152, 39, 'gall_20170802143504207.jpg', 0, 0, NULL),
(153, 39, 'gall_20170802143504667.jpg', 0, 0, NULL),
(154, 39, 'gall_20170802143504668.jpg', 0, 0, NULL),
(155, 42, 'gall_20170815154849276.jpg', 0, 0, NULL),
(156, 42, 'gall_20170815154849891.jpg', 0, 0, NULL),
(157, 43, 'gall_20170821123330382.jpg', 0, 0, NULL),
(158, 43, 'gall_20170821123421142.jpg', 0, 0, NULL),
(159, 44, 'gall_20170821125042676.jpg', 0, 0, NULL),
(160, 44, 'gall_20170821125042368.jpg', 0, 0, NULL),
(161, 46, 'gall_20170821145308423.jpg', 0, 0, NULL),
(162, 46, 'gall_20170821145308315.jpg', 0, 0, NULL),
(163, 46, 'gall_20170821145309517.jpg', 0, 0, NULL),
(164, 46, 'gall_20170821145309773.jpg', 0, 0, NULL),
(165, 46, 'gall_20170821145309253.jpg', 0, 0, NULL),
(166, 46, 'gall_20170821145309154.jpg', 0, 0, NULL),
(167, 46, 'gall_20170821145309735.jpg', 0, 0, NULL),
(168, 47, 'gall_20170831124153509.jpg', 0, 0, NULL),
(169, 47, 'gall_20170831124153460.jpg', 0, 0, NULL),
(170, 47, 'gall_20170831124153107.jpg', 0, 0, NULL),
(171, 47, 'gall_20170831124153219.jpg', 0, 0, NULL),
(172, 47, 'gall_20170831124153386.jpg', 0, 0, NULL),
(173, 47, 'gall_20170831124154617.jpg', 0, 0, NULL),
(174, 47, 'gall_20170831124154496.jpg', 0, 0, NULL),
(175, 48, 'gall_20170901111306415.jpg', 0, 0, NULL),
(176, 48, 'gall_20170901111306726.jpg', 0, 0, NULL),
(177, 48, 'gall_20170901111306146.jpg', 0, 0, NULL),
(178, 44, 'gall_20170907132612880.jpg', 0, 0, NULL),
(179, 47, 'gall_20170919174207275.jpg', 0, 0, NULL),
(180, 47, 'gall_20170919174207740.jpg', 0, 0, NULL),
(181, 52, 'gall_20170919174715132.jpg', 0, 0, NULL),
(182, 52, 'gall_20170919174715109.jpg', 0, 0, NULL),
(183, 52, 'gall_20170919174715261.jpg', 0, 0, NULL),
(184, 47, 'gall_20170919175438914.jpg', 0, 0, NULL),
(185, 55, 'gall_20171003164211815.jpg', 0, 0, NULL),
(186, 55, 'gall_20171003164211753.jpg', 0, 0, NULL),
(187, 59, 'gall_20171024153639414.jpg', 0, 0, NULL),
(188, 59, 'gall_20171024153639993.jpg', 0, 0, NULL),
(189, 59, 'gall_20171024153639149.jpg', 0, 0, NULL),
(190, 59, 'gall_20171024153718422.jpg', 0, 0, NULL),
(191, 59, 'gall_20171106222436296.jpg', 0, 0, NULL),
(192, 59, 'gall_20171106222436596.jpg', 0, 0, NULL),
(193, 59, 'gall_20171106222436788.jpg', 0, 0, NULL),
(194, 59, 'gall_20171106222436520.jpg', 0, 0, NULL),
(195, 59, 'gall_20171106222447510.jpg', 0, 0, NULL),
(196, 59, 'gall_20171106222453903.jpg', 0, 0, NULL),
(197, 61, 'gall_20171107125809266.jpg', 0, 0, NULL),
(198, 61, 'gall_20171107125809598.jpg', 0, 0, NULL),
(199, 61, 'gall_20171107125809891.jpg', 0, 0, NULL),
(200, 62, 'gall_20171116173434883.JPG', 0, 0, NULL),
(201, 66, 'gall_20171204152433567.jpg', 0, 0, NULL),
(202, 66, 'gall_20171204152458914.jpg', 0, 0, NULL),
(203, 66, 'gall_20171204152608523.jpg', 0, 0, NULL),
(204, 68, 'gall_20171206150610558.jpg', 0, 0, NULL),
(205, 68, 'gall_20171206150610952.jpg', 0, 0, NULL),
(206, 68, 'gall_20171206150610452.jpg', 0, 0, NULL),
(207, 68, 'gall_20171206150610435.jpg', 0, 0, NULL),
(208, 68, 'gall_20171206150610871.jpg', 0, 0, NULL),
(209, 68, 'gall_20171206150610980.jpg', 0, 0, NULL),
(210, 68, 'gall_20171206150610520.jpg', 0, 0, NULL),
(211, 72, 'gall_20171219130042791.jpg', 0, 0, NULL),
(212, 72, 'gall_20171219130042134.jpg', 0, 0, NULL),
(213, 72, 'gall_20171219130337413.jpg', 0, 0, NULL),
(214, 73, 'gall_20171219131236870.jpg', 0, 0, NULL),
(215, 74, 'gall_20171221115746682.jpg', 0, 0, NULL),
(216, 74, 'gall_20171221115746618.jpg', 0, 0, NULL),
(217, 74, 'gall_20171221115746444.jpg', 0, 0, NULL),
(218, 74, 'gall_20171221115746927.jpg', 0, 0, NULL),
(219, 74, 'gall_20171221115746970.jpg', 0, 0, NULL),
(220, 76, 'gall_20180116144412523.jpg', 0, 0, NULL),
(221, 76, 'gall_20180116144412622.jpg', 0, 0, NULL),
(222, 76, 'gall_20180116144412891.jpg', 0, 0, NULL),
(223, 76, 'gall_20180116144412433.jpg', 0, 0, NULL),
(224, 76, 'gall_20180116144412252.jpg', 0, 0, NULL),
(225, 96, 'gall_20180525120122397.jpg', 0, 0, NULL),
(226, 96, 'gall_20180525120122991.jpg', 0, 0, NULL),
(227, 96, 'gall_20180525120122180.jpg', 0, 0, NULL),
(228, 96, 'gall_20180525120122320.jpg', 0, 0, NULL),
(229, 96, 'gall_20180525120123721.jpg', 0, 0, NULL),
(230, 96, 'gall_20180525120123540.jpg', 0, 0, NULL),
(231, 96, 'gall_20180525120123470.jpg', 0, 0, NULL),
(232, 96, 'gall_20180525120123680.jpg', 0, 0, NULL),
(233, 96, 'gall_20180525120123698.jpg', 0, 0, NULL),
(234, 96, 'gall_20180525120123704.jpg', 0, 0, NULL),
(235, 96, 'gall_20180525120123203.jpg', 0, 0, NULL);

-- --------------------------------------------------------

--
-- Структура таблиці `osc_page_news_items`
--

CREATE TABLE `osc_page_news_items` (
  `id` int(11) NOT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `details` text,
  `template` int(11) NOT NULL DEFAULT '1',
  `preview` varchar(255) DEFAULT NULL,
  `cat` int(11) DEFAULT '0',
  `is_top` int(11) NOT NULL DEFAULT '0',
  `special_text` varchar(255) DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_keys` varchar(255) DEFAULT NULL,
  `meta_desc` text,
  `is_index` int(1) DEFAULT '1',
  `block` int(1) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `dateCreate` datetime DEFAULT NULL,
  `dateModify` datetime DEFAULT NULL,
  `adminMod` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `osc_page_news_items`
--

INSERT INTO `osc_page_news_items` (`id`, `caption`, `details`, `template`, `preview`, `cat`, `is_top`, `special_text`, `tags`, `meta_title`, `meta_keys`, `meta_desc`, `is_index`, `block`, `order_id`, `dateCreate`, `dateModify`, `adminMod`) VALUES
(2, 'Ход строительства домов и таунхаусов в нашем комплексе // 2 июня 2017г.', '<p></p><div><p><strong>Итоги строительства по дому \"Шатель\" (обе секции)</strong></p></div><div><ol></ol></div><div><li>Работы по утеплению фасада в 1-ой секции продолжаются.</li></div><div><li>Внешняя отделка фасада 1- ой секции продолжается.</li></div><div><li>В 1-ой секции продолжается монтаж водопроводных и канализационных стояков.</li></div><div><li>Заканчиваются работы по гидроизоляции подвала в 1, 2- ой секциях.</li></div><div><li>Заканчивается кладка стен 6-ого этажа во 2 -ой секции дома.</li></div><div><li>Продолжается кладка перегородок в секциях № 1, 2.</li></div><div></div><div><p><strong><br></strong></p><p><strong>Ход строительства по дому \"Лион\"</strong><br></p></div><div> <strong>1-ая секция:</strong><p></p></div><div><ol></ol></div><div><li>Кладка  наружных стен 7-ого этажа выполнена на 85 %.</li></div><div><li>Ведетса установка стеклопакетов с 1- ого по 5-ый этажи.</li></div><div></div><div><p><strong>2-я секция:</strong></p></div><div><ol></ol></div><div><li>Ведется монтаж стеклопакетов со 2-ого по 5-ый этажи.</li></div><div><li>Ведется кладка межкомнатных перегородок на 7, 8-ом этажах.</li></div><div></div><div><p><strong>3-я секция:</strong></p></div><div><ol></ol></div><div><li>Заканчивается кладка стен 5-ого этажа.</li></div><div><li>Ведется кладка межкомнатных перегородок на 3, 4-ом этажах.</li></div><div></div><div><p><strong>4-я секция:</strong></p></div><div><ol></ol></div><div><li>Выполнен монтаж плит перекрытия.</li></div><div><li>Ведутся подготовительные работы для кладки стен 1-ого этажа.</li></div><div></div><div><p><strong>5, 6-ая секции:</strong></p></div><div><ol></ol></div><div><li>Продолжаются работы по армированию фундамента.</li></div><div><li>Выполнены работы по бетонированию фундамента.</li></div><div></div><div><p><strong><br></strong></p><p><strong>Ход строительства проекта \"Перша Житлова\"</strong></p></div><div><div><strong>Дом № 1:</strong></div></div><div><ol></ol></div><div><li>Установлены окна на 3-ем этаже.</li></div><div><li>Заканчиваются работы по оштукатуриванию стен 3- его этажа.</li></div><div><li>В местах общего пользования ( коридоры и лестничная клетка ) проложен электрокабель.</li></div><div><li>Ведутся подготовительные работы по утеплению и отделке фасада.</li></div><div></div><div><p><strong><br></strong></p><p><strong>Благоустройство территории ЖК \"Новая Конча Заспа\"</strong></p></div><div><ol></ol></div><div><li style=\"list-style-type: none\"></li></div><div><ol></ol></div><div><li>Продолжается опрос инвесторов по поводу остекления балконов Вашей квартиры. ( см.<a href=\"https://goo.gl/forms/ipaXw4Ieukpom5HL2\">https://goo.gl/forms/ipaXw4Ieukpom5HL2</a> ).</li></div><div><li>В результате опроса появилось следующее предложение: см. <a href=\"https://m.facebook.com/story.php?story_fbid=781864075283882&id=582624481874510\">https://m.facebook.com/story.php?story_fbid=781864075283882&id=582624481874510</a> Подрядчик готовит ответ по поводу возможности реализовать этот вариант остекления.</li></div><div><li>Заканчивается подключение 9-ти этажного дома Лион к канализационной системе ЖК \"Новая Конча Заспа\".</li></div><p></p>\r\n', 1, 'artc_20170606125948496.JPG', 0, 0, 'Спецпредложение', '', '', '', '', 1, 1, 0, '2017-06-02 00:00:00', '2018-05-14 10:34:02', NULL),
(3, 'Ход строительства домов и таунхаусов в нашем комплексе // 26 мая 2017г.', '<p><div><p><strong>Итоги строительства по дому \"Шатель\" (обе секции)</strong></p></div><div><ol></div><div><li>Продолжаются работы по утеплению фасада в 1-ой секции.</li></div><div><li>Ведутся работы по внешней отделке фасада 1- ой секции.</li></div><div><li>Продолжается монтаж внутренних инженерных сетей ( водопровод, канализация, отопление ) в 1-ой секции.</li></div><div><li>Продолжаются работы по гидроизоляции подвала в 1, 2- ой секциях.</li></div><div><li>Ведется кладка стен 6-ого этажа во 2 -ой секции дома.</li></div><div><li>Продолжается кладка перегородок в секциях № 1, 2.</li></div><div></ol></div><div><p><strong>Ход строительства по дому \"Лион\"</strong><br /></div><div> <strong>1-ая секция:</strong></p></div><div><ol></div><div><li>Заканчивается кладка наружных стен 7-ого этажа.</li></div><div><li>Ведутся подготовительные работы для монтажа плит перекрытия 7-его этажа .</li></div><div></ol></div><div><p><strong>2-я секция:</strong></p></div><div><ol></div><div><li>Кладка стен 8-ого этажа выполнена.</li></div><div><li>Заканчивается монтаж плит перекрытия 8-ого этажа.</li></div><div></ol></div><div><p><strong>3-я секция:</strong></p></div><div><ol></div><div><li>Закончен монтаж плит перекрытия 4-ого этажа.</li></div><div><li>Продолжается выкладка стен 5-ого этажа.</li></div><div></ol></div><div><p><strong>4-я секция:</strong></p></div><div><ol></div><div><li>Выполнен монтаж плит перекрытия.</li></div><div><li>Ведутся подготовительные работы для кладки стен 1-ого этажа.</li></div><div></ol></div><div><p><strong>5, 6-ая секции:</strong></p></div><div><ol></div><div><li>Продолжаются работы по армированию фундамента.</li></div><div><li>Выполнены работы по бетонированию фундамента.</li></div><div></ol></div><div><p><strong>Ход строительства проекта \"Перша Житлова\"</strong></p></div><div><div><strong>Дом № 1:</strong></div></div><div><ol></div><div><li>Продолжаются работы по установке металло - пластиковых конструкций на 3, 4 - х этажах.</li></div><div><li>Продолжаются работы по оштукатуриванию стен 3- его этажа.</li></div><div><li>Ведутся подготовительные работы для установки внутренних инженерных сетей.</li></div><div><li>Ведутся подготовительные работы по утеплению и отделке фасада.</li></div><div></ol></div><div><p><strong>Благоустройство территории ЖК \"Новая Конча Заспа\"</strong></p></div><div><ol></div><div><li style=\"list-style-type: none\"></div><div><ol></div><div><li>Продолжается опрос инвесторов по поводу остекления балконов Вашей квартиры. ( см.<a href=\"https://goo.gl/forms/ipaXw4Ieukpom5HL2\">https://goo.gl/forms/ipaXw4Ieukpom5HL2</a> ).</li></div><div><li>В результате опроса появилось следующее предложение: см. <a href=\"https://m.facebook.com/story.php?story_fbid=781864075283882&id=582624481874510\">https://m.facebook.com/story.php?story_fbid=781864075283882&id=582624481874510</a> Подрядчик готовит ответ по поводу возможности реализовать этот вариант остекления.</li></div><div><li>Продолжаются подготовительные работы для монтажа помещения под очистительные сооружения ЖК \"Новая Конча Заспа\" ( проложена дорога, установлен забор по периметру строительства, доставлены материалы и техника).</li></div><div><li>Ведется подключение 9-ти этажного дома Лион к канализационной системе ЖК \"Новая Конча Заспа\".</li></div><div><li>ЖК \" Новая Конча Заспа\" : <a href=\"https://www.youtube.com/watch?feature=share&utm_source=Viber&utm_campaign=Private&v=rgDGq76IJoU&utm_medium=Chat&app=desktop\">https://www.youtube.com/watch?feature=share&utm_source=Viber&utm_campaign=Private&v=rgDGq76IJoU&utm_medium=Chat&app=desktop</a></li></div><div></ol></div><div></li></div><div></ol></div></p>', 1, 'artc_20170606130452108.JPG', 0, 0, '', '', '', '', '', 1, 1, 0, '2017-05-26 00:00:00', '2018-05-14 10:34:10', NULL),
(4, 'Почему Новая Конча-Заспа // 12 аргументов \"за\"', '<p></p><p>Жилой комплекс Новая Конча-Заспа &nbsp;предлагает своим будущим жителям большой выбор\r\nуютных квартир, просторных коттеджей и шикарных таунхаусов&nbsp; на любой вкус и бюджет. Все дома и квартиры комплекса&nbsp; спроектированы и строятся талантливыми\r\nархитекторами и профессиональными строителями, что гарантирует высочайшее\r\nкачество вашего нового жилья.</p>\r\n\r\n<p><b>Киев</b></p>\r\n\r\n<p>Столица предлагает неограниченные возможности для ведения\r\nбизнеса и разнообразного проведения досуга, всего в 15 минутах езды на автомобиле\r\nдо Метро Выдубичи. Трасса скоростная, едим без пробок!!</p><p></p><p><b>Голубое озеро</b></p>\r\n\r\n<p>Всего 10 минут на велосипеде от ЖК, и вы на золотистом&nbsp; побережье&nbsp;\r\nводоема – отдых, рыбалка обеспечены.</p>\r\n\r\n<p><b>Аэропорт</b></p>\r\n\r\n<p>До международного &nbsp;аэропорта\r\nБорисполь добираться 30 минут, без пробок по скоростным Новообуховской и\r\nБориспольской трассам.</p><p></p>\r\n\r\n<p><b>Спортивные и детские площадки</b></p>\r\n\r\n<p>Для тех, кто не мыслит своей жизни без занятий спортом,&nbsp; доступны самые разные спортивные площадки: </p>\r\n\r\n<p>- фитнес-центр \"Дельтаплан\" общей площадью 3500\r\nкв.м, с современной тренажерным залом, бассейном длиной 20 м, СПА-салоном,\r\nмассажным кабинетом, римской парной и джакузи</p><p></p>\r\n\r\n<p>- планерная гора – заточенное под параглайдингистов место, где\r\nуроки покорения небесной стихии чередуют с практикой медитации и занятиями\r\nйогой. Параглайдинг сам по себе очень захватывающий вид спорта, его можно практиковать\r\nвдвоем или в одиночку</p><p></p>\r\n\r\n<p>- &nbsp;пони-клуб «Домино»\r\nвходит в&nbsp; областную федерацию конного\r\nспорта киевщины. находится рядом с ЖК, в с. Ходосовка</p><p></p>\r\n\r\n<p>- во дворах каждого из домов нашего комплекса, находится&nbsp; детская площадка</p><p></p>\r\n\r\n<p><b>Объекты\r\nинфраструктуры</b></p>\r\n\r\n<p>В ЖК Новая Конча-Заспа предусмотрено все, что нужно для\r\nкомфортной и полноценной жизни. Комплекс находится рядом и является частью\r\nпервого аутлет-городока в Украине Мануфактура, на территории которого также\r\nнаходится Мегамаркет. Жители нашего комплекса в полной мере наслаждаются\r\nпроживанием в окружении природы и, при этом, имеют все удобства городской жизни.</p><p></p>\r\n\r\n<p><b>Нескучный шопинг</b></p>\r\n\r\n<p>Неоспоримым достоинством жизни в ЖК Новая Конча-Заспа &nbsp;является &nbsp;развитая инфраструктура рядом, &nbsp;с уютными магазинчиками в пешой &nbsp;доступности. Более 100 магазинов, известные\r\nбренды</p><p></p>\r\n\r\n<p><b>Транспортное\r\nсообщение</b></p>\r\n\r\n<p>ЖК Новая Конча-Заспа&nbsp; располагает\r\nисключительной транспортной доступностью- скоростная Новообуховская трасса,\r\nотсутствие пробок.</p>\r\n\r\n<p>Направление Ходосовки, на сегодняшний день является наиболее\r\nперспективным</p><p></p>\r\n\r\n<p><b>Генеральный план</b></p>\r\n\r\n<p>Формирование общего плана и архитектурного проекта нашего\r\nкомплекса начиналось с &nbsp;Голосеевского\r\nпарка, бескрайних зеленых полей, голубого озера, чистого воздуха</p>\r\n\r\n<p><b>Образование, медицина</b></p>\r\n\r\n<p>Рядом с ЖК находится современный детский садик «Світлиця», школа\r\n– в с Ходосовка, на территории аутлет-городока открылась&nbsp; современная «Клиники Мануфактура», в которой\r\nвсе жильцы нашего комплекса могут воспользоваться услугами с 10% скидкой.</p><p></p><p></p>\r\n\r\n<p><b>Строительные\r\nтехнологии</b></p>\r\n\r\n<p>Новейшие применяемые технологии позволяют повысить\r\nэнергоэффективность всех зданий жилого комплекса Новая Конча-Заспа&nbsp;</p><p></p>\r\n\r\n<p><b>Архитектурная среда</b></p>\r\n\r\n<p>Уникальное преимущество - это единая архитектурная среда с\r\nаутлет-городоком Мануфактура и Мегамаркетом</p>\r\n\r\n<p><b>Формула хорошей жизни</b></p>\r\n\r\n<p>Немаловажным преимуществом&nbsp;\r\nЖК Новая Конча-Заспа&nbsp; является\r\nуникальный стиль жизни, доступный каждому её жителю. Мы формируем сообщество\r\nмолодых, успешных людей</p>\r\n\r\n<p><b>Содержание и обслуживание\r\nтерритории</b></p>\r\n\r\n<p>Команда профессиональных сотрудников ежедневно заботится о\r\nподдержании территории ЖК в чистоте и порядке</p>\r\n\r\n<p><b>Безопасность</b></p>\r\n\r\n<p>Жизнь в нашем комплексе&nbsp;\r\n- это гарантия безопасности и спокойствия.</p>\r\n\r\n<b>ПРИСОЕДИНЯЙТЕСЬ!</b><br><p></p>\r\n', 2, 'artc_20170607112914908.jpg', 0, 0, NULL, NULL, '', '', '', 1, 0, 0, '2017-06-07 00:00:00', '2017-06-13 11:23:35', NULL),
(5, '10 июня День Открытых Дверей в ЖК Новая Конча-Заспа!', '<p></p><p></p><p><b>10 июня День Открытых\r\nДверей в ЖК Новая Конча-Заспа!</b></p>\r\n\r\n<p>Дамы и господа!</p>\r\n\r\n<p>с 10.00 до 20.00 приглашаем всех в наш отдел продаж! </p>\r\n<p>В день открытых дверей мы предлагаем следующую программу:</p>\r\n\r\n<p>Возле отдела продаж:</p>\r\n\r\n<p>Целый день для наших гостей и друзей </p>\r\n\r\n<p>- работает профессиональный \r\nDJ</p>\r\n\r\n<p>- кейтеринг от шеф- повара Alex</p>\r\n\r\n<p>- просмотры  на кроссовере\r\nToyotarav4</p>\r\n\r\n<p>- просмотры на электро-байке внедорожнике  FatBike</p>\r\n<p>В отделе продаж:</p>\r\n\r\n<p>Целый день </p>\r\n\r\n<p>- консультируют профессиональные менеджеры</p>\r\n\r\n<p>- беспроигрышная лотерея (электротовары)</p>\r\n\r\n<p>- розыгрыш крутого FatBike \r\nс редукторным двигателем на 350 Вт!!</p>\r\n<p>17.00 Концерт Сереги!!!</p>\r\n<p>ЖДЕМ ВСЕХ ГОСТЕЙ В СУББОТУ И КАЖДЫЙ ДЕНЬ!</p>\r\n\r\n<p>Наш адрес:</p>\r\n\r\n<p>Киевская область, Киево-Святошинский р-н, с. Ходосовка,\r\nНовообуховское шоссе, 1 (поворот к Мегамаркету и Мануфактуре) </p>\r\n<p>Более подробно узнать по телефону:</p>\r\n\r\n<p>(044)394-88-20</p>\r\n\r\n<p>(067)825-50-19</p><p></p>\r\n', 2, 'artc_20170607143006110.png', 0, 0, NULL, NULL, '', '', '', 1, 1, 3, '2017-06-07 00:00:00', '2017-06-22 12:48:09', NULL),
(6, 'НЕМНОГО ПРО ОКНА В НАШЕМ КОМПЛЕКСЕ', '<p></p><p>Уважаемые дамы и господа, наша компания для улучшения скорости и качества строительства своих объектов дополнительно открыло свое производство ПВХ изделий, позволяющее производить остекление своих объектов, которые в дальнейшей эксплуатации позволят вам, как хозяевам жилых и коммерческих помещений экономить на затратах&nbsp; обогрева помещений в зимний период и&nbsp; затраты на кондиционирование в летний период.</p><p>В наших окнах мы используем 5-ти камерный профиль OPENTECK (производства Украины, г. Каховка), фурнитуру ROTO (Германия), стеклопакеты двухкамерные, производства компании Glas Trösch Ukraine.</p><p>Дополнительно, для наших клиентов появилась возможность провести улучшение изделий в своих помещениях, а именно:</p><p>— добавление дополнительных вариантов открываний.</p><p>— замена установленного стеклопакета на улучшенный.</p><p>— выполнение внутренней ламинации изделий.</p><p>— закупки и установки подоконников класса ЛЮКС.</p><p>— заказ москитных сеток.</p><p>— остекление проемов в помещении собственника, которые не остекляются по проекту.</p><p>Все возможные изменения оговариваются с каждым собственником индивидуально, с учетом всех пожеланий.</p><p>В кратчайшие сроки в наших отделах продаж будут представлены образцы стеклопакетов, подоконников, возможность варианты окон в ламинации, стенды по с/п. и виды подоконников.</p><p>Более детальную информацию вы можете узнать у ответственно менеджера - (094) 954-95-28, Денис Викторович</p><p></p>\r\n', 1, 'artc_20170608105608388.png', 0, 0, NULL, NULL, '', '', '', 1, 0, 0, '2017-06-02 00:00:00', '2017-06-20 14:35:21', NULL),
(7, 'ГДЕ РЯДОМ С КИЕВОМ ЖИТЬ ХОРОШО', '<p><p>Одним из важных моментов, который необходимо учитывать при выборе первичного жилья за Киевом — это территориальное  расположение жилого комплекса, близость к Киеву и  к Метро.</p><p>Учитывая нынешнее состояние дорог, количество автотранспорта, категории «близость к Киеву» и, например,  «Сколько времени добираться до ближайшего Метро»  очень расходятся..</p><p><strong>Близость к Метро и реальное время, потраченное на дорогу</strong></p><table><tbody><tr><td><p><strong>Населенный пункт</strong></p></td><td><p><strong>Ближайшая станция метро и расстояние до нее</strong></p></td><td><p><strong>Где обычно пробки</strong></p></td><td><p><strong>За сколько доехать на транспорте до Метро в час-пик</strong></p></td><td><p><strong>За сколько  доехать до метро, когда нет пробок</strong></p></td></tr><tr><td><p>Ходосовка</p></td><td><p>Метро «Выдубичи»</p><p>17 км</p></td><td><p>Нет</p></td><td><p>20 мин</p></td><td><p>15 мин</p></td></tr><tr><td><p>Крюковщина</p></td><td><p>Метро «Теремки»</p><p>10 км</p></td><td><p>— Дорога по Софиевской Борщаговке</p><p>— Окружная дорога</p></td><td><p>20-30 мин</p></td><td><p>10 мин</p></td></tr><tr><td><p>Вишневое</p></td><td><p>Метро «Теремки»</p><p>8 км</p></td><td><p>— Дорога по Софиевской Борщаговке</p><p>— Окружная дорога</p></td><td><p>30 мин</p></td><td><p>15 мин</p></td></tr><tr><td><p>Святопетровское</p></td><td><p>Метро «Житомирская»</p><p>12 км</p></td><td><p>— Дорога по Софиевской Борщаговке</p><p>— Окружная</p></td><td><p>30-40 мин</p></td><td><p>10 мин</p></td></tr><tr><td><p>Белогородка </p></td><td><p>Метро «Житомирская»</p><p>16 км</p></td><td><p>— Дорога по Софиевской Борщаговке</p><p>— Окружная</p></td><td><p>40-50 мин</p></td><td><p>15 мин</p></td></tr><tr><td><p>Ирпень</p></td><td><p>Метро «Академгородок»</p><p>12 км</p></td><td><p>— Светофоры в Ирпене</p><p>— На КП</p></td><td><p>30 мин</p></td><td><p>15 мин</p></td></tr><tr><td><p>Буча</p></td><td><p>Метро «Академгородок»</p><p>19 км</p></td><td><p>— Светофоры в Ирпене,</p><p>— на КП</p></td><td><p>30-40 мин</p></td><td><p>20 мин</p></td></tr><tr><td><p>Вышгород</p></td><td><p>Метро «Минская»</p><p>12 км</p></td><td><p>На ул. Богатырской, возле метро</p></td><td><p>25-30 мин</p></td><td><p>20 мин</p></td></tr><tr><td><p>Новые Петровцы</p></td><td><p>Метро «Минская»</p><p>16 км</p></td><td><p>На ул. Богатырской, возле метро</p></td><td><p>30-40 мин</p></td><td><p>20 мин</p></td></tr></tbody></table><p>По количеству новостроек (плотности застройки) рядом с населенными пунктами, ситуация выглядит следующим образом:</p><p><p><b>Краткие выводы:</b></p><p>1)  Для киевлян и жителей пригорода все  актуальнее становится  вопрос : сколько времени  я в пути… в пути до метро, на работу, с работы.</p><p>2)  Укрупнение города  способствует росту пробок на  дорогах (их не будет меньше, как бы дороги не ремонтировали)</p><p>3)  Все более размыто становится  собственная близость к Метро в километрах, гораздо актуальнее: сколько ты туда добираешься</p><p>4)  Из  таблицы «Близость к Метро и реальное время, потраченное на дорогу» видно, что не смотря на то, что дорога от населенных пунктов Вишневое, Крюковщина, Ирпень, Святопетровское , Вышгород  находятся несколько ближе, реально доехать до ближайшего Метро гораздо дольше, чет от Ходосовки и Вышгорода. Только трасса до  Ходосовки , на сегодняшний, день абсолютно не загружена.</p><p>5)  Оценим густоту застроек по каждому из направлений:</p><p> Крюковщина, Вишневое, Святопетровское, Белогородка  — более 60 новостроек</p><p>Ирпень, Буча – более 90 новостроек</p><p>Вышгород, Новые Петровцы- более 20 новостроек</p><p>Ходосеевка – более 3 новостроек</p><p>Таким образом, с учетом густоты будущего населения всех строящихся объектов и наличием уже имеющихся пробок по центральным автомагистралям, наиболее перспективными являются:</p><p>Направление Ходосовки (Обуховская трасса)  и Вышгородское направление.</p><br></p><p><br></p></p>', 2, 'artc_20170613122524361.jpg', 0, 0, NULL, NULL, '', '', '', 1, 0, 0, '2017-05-25 00:00:00', '2017-06-13 12:25:24', NULL),
(8, 'СУПЕРЦЕНА 13 900 ГРН/М НА КВАРТИРЫ В ПОСТРОЕННОМ ДОМЕ «ШАТЕЛЬ»', '<p></p><p>Уважаемые клиенты. С радостью сообщаем, что в этом месяце на некоторые виды квартир в построенном доме «Шатель» действует акционная цена 13 900 грн/м.</p><p>Наш комплекс находится в 7-ми км от Киева в с.Ходосовка и включает 6-ти и 9-этажные жилые дома, таунхаусы (включая варианты дуплексов), а также отдельный коттеджный городок клубного типа.</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</p><p><img src=\"/myprotected/redactor/demo/scripts/uploads/7666c10e931b9f27b60ae198aa204091.jpg\"></p><br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Сдача дома запланирована на 4 квартал 2017г. Есть возможность рассрочки от застройщика.<p></p><h3>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<b>Генеральный план комплекса</b></h3><p></p><p><img src=\"/myprotected/redactor/demo/scripts/uploads/da616a2fe2ab4b8f56ee036a22c64244.jpg\" style=\"width: 948.509px; height: 349px;\"></p><br><p></p><br><p></p>\r\n', 1, 'artc_20170608115256123.jpg', 0, 0, NULL, NULL, '', '', '', 1, 0, 0, '2017-05-23 00:00:00', '2017-06-13 12:02:10', NULL),
(9, 'ВНИМАНИЕ! ПОРЯДОК ПРОВЕДЕНИЯ РЕМОНТНЫХ РАБОТ НА ТАУНХАУСАХ ЖК «НОВАЯ КОНЧА ЗАСПА»', '<p><p><strong>Для создания рабочих условий проведения ремонтных работ в ТаунХаусах ЖК «Новая Конча Заспа», соблюдения санитарных норм и правил сотрудничества следует придерживаться следующих правил:</strong></p><ol><li>Подключение ТаунХаусов к сети электроснабжения осуществляет УК «АВМ Житлосервис». с 22.05.2017 г, при наличии квитанции об оплате аванса в размере 1000 грн. за коммунальные услуги.</li><li>Подключение ТаунХаусов к сети водоснабжения осуществляет УК «АВМ Житлосервис, после 15.06.2017 г., при наличии квитанции об оплате аванса в размере 1000 грн. за коммунальные услуги.</li><li>Временная скважина для технических нужд расположена на территории 9-ти этажного дома Лион.</li><li>Предоставьте список Ваших строителей.</li><li>Получить ручки для окон и балконных дверей Вы можете в УК «АВМ Житлосервис».</li><li>Офис УК «АВМ Житлосервис». расположен по адресу: ул. Ф. Печерского 39, дом Линц, ЖК «Новая Конча Заспа».</li><li>098 538 92 26 — Инна Викторовна Святенко — директор УК «АВМ Житлосервис».</li><li>Режим работы: ежедневно с 9.00 до 18.00, выходной: суббота,, воскресенье.</li></ol><p><strong>Для обеспечения бесперебойного ведения строительных работ по благоустройству прилегающей территории необходимо:</strong></p><ol><li>Строительный мусор хранить в мешках во внутренних помещениях ТаунХауса или на крыльце, или на террасе.</li><li>Строительные материалы хранить во внутренних помещениях ТаунХауса или на крыльце, или на террасе.</li><li>Вывоз строительного мусора будет организован УК «АВМ Житлосервис» , по мере поступления заявок.</li><li>Ключ от таунхауса вы можете получить на посту охраны.</li></ol><br></p>', 1, 'artc_20170608120022121.jpg', 0, 0, NULL, NULL, '', '', '', 1, 0, 0, '2017-05-22 00:00:00', '2017-06-08 12:00:30', NULL),
(10, 'ХОД СТРОИТЕЛЬСТВА ДОМОВ И ТАУНХАУСОВ В НАШЕМ КОМПЛЕКСЕ // 18 МАЯ 2017Г.', '<p><p><strong>Итоги строительства по дому «Шатель» (обе секции)</strong></p><ol><li>Установлены оконные блоки на 1, 2- ом этажах дома в 1, 2- ой секциях.</li><li>Ведутся работы по утеплению фасада в 1-ой секции.</li><li>Начался монтаж внутренних инженерных сетей ( водопровод, канализация, отопление ) в 1-ой секции.</li><li>Ведутся работы по гидроизоляции подвала в 1, 2- ой секциях.</li><li>Ведется кладка стен 6-ого этажа во 2 -ой секции дома.</li><li>Продолжается кладка перегородок в секциях № 1, 2.</li></ol><p><strong>Ход строительства по дому «Лион»</strong><br><strong>1-ая секция:</strong></p><ol><li>Продолжается кладка наружных стен 7-ого этажа.</li><li>Ведутся подготовительные работы для монтажа плит перекрытия 7-его этажа .</li></ol><p><strong>2-я секция:</strong></p><ol><li>Кладка стен 8-ого этажа выполнена на 95 %.</li><li>Ведутся подготовительные работы для монтажа плит перекрытия 8-ого этажа.</li></ol><p><strong>3-я секция:</strong></p><ol><li>Ведется монтаж плит перекрытия 4-ого этажа.</li><li>Ведется выкладка стен 5-ого этажа.</li></ol><p><strong>4-я секция:</strong></p><ol><li>Стяжка пола цокольного этажа — выполнена.</li><li>Цокольный этаж гидроизолирован.</li><li>В цокольном этаже установлены водонакопительные емкости для системы очистки дома Лион.</li><li>Ведется монтаж плит перекрытия цокольного этажа.</li></ol><p><strong>5, 6-ая секции:</strong></p><ol><li>Ведутся работы по армированию фундамента.</li><li>Ведутся подготовительные работы для бетонирования фундамента.</li></ol><p><strong>Ход строительства проекта «Перша Житлова»</strong></p><div><strong>Дом № 1:</strong></div><ol><li>Кладка стен 4-ого этажа выполнена.</li><li>Выложен парапет на крыше дома.</li><li>Выведены вентиляционные каналы на крышу дома.</li><li>Кладка перегородок 3, 4 — ого этажей. продолжается.</li></ol><div><strong>Дом № 2</strong></div><ol><li>Ведутся работы работы фундаментного цикла.</li><li>Системы отвода грунтовых вод смонтирована.</li></ol><p><strong>Благоустройство территории ЖК «Новая Конча Заспа»</strong></p><ol><li>Ведутся подготовительные работы для монтажа помещения под очистительные сооружения ЖК «Новая Конча Заспа».</li><li>Высажена аллея из деревьев и кустарников по улице Ф. Печерского.</li><li>Установлены фонари наружного освещения между домами Линц и Грац.</li></ol></p>', 2, 'artc_20170608121218411.jpg', 0, 0, '', '', '', '', '', 1, 1, 0, '2017-05-18 00:00:00', '2018-05-14 10:34:21', NULL),
(11, 'КВАРТИРА С КУХНЕЙ-СТОЛОВОЙ ДЛЯ ЛЮДЕЙ, СТРЕМЯЩИХСЯ К ЭКСКЛЮЗИВНОСТИ', '<p></p><p>Ключевое преимущество апартаментов с кухней-столовой&nbsp; – &nbsp;рациональное использование пространства. В нашем комплексе есть большой выбор квартир с кухнями от 12-18 кв.м., которые могут служить полноценной гостиной, где можно принимать гостей, проводить дружеские посиделки за настольными играми и не мешать жилой среде хозяев.</p><p><p><img src=\"/myprotected/redactor/demo/scripts/uploads/3981f546297db46292496c14493f5235.jpg\"></p><br></p><p>Большой телевизор и барная стойка&nbsp;придадут особый комфорт для таких апартаментов.&nbsp;</p><p></p>\r\n', 2, 'artc_20170608121507576.jpg', 0, 0, NULL, NULL, '', '', '', 1, 0, 0, '2017-05-17 00:00:00', '2017-06-13 12:09:42', NULL),
(20, 'Малыши нашего жилищного комплекса cмогут посещать детский клуб-сад «Cloud»', '<p></p><h3>С радостью и нетерпением будем ждать деток в нашем садике, который наполнен комфортом и уютом!</h3><h3>Мы приложим все усилия, чтобы «Cloud» стал пространством любви, заботы и максимальных возможностей для наших малышей!</h3><p>Предоставляем Вам список наших преимуществ:<br>— Индивидуальный подход к каждому малышу, забота и бережное отношение; воспитание самодостаточности и уверенности в себе, раскрытие возможностей;<br>— Много музыки, творчества, общеобразовательных занятий;<br>— Сертифицированная и безопасная мебель из натуральных материалов с обучающим персональным декором;<br>— Полезная, натуральная и вкусная еда;<br>— Чистые помещения, использование сертифицированных безозоновых бактерицидных ламп,  регулярная дезинфекция игрушек, уборка и проветривание;<br>— Грамотные воспитатели, которые любят детей и готовы им предоставить качественное обучение в разных сферах;<br>— Разные форматы посещения;<br>— Отсутствие вступительных и годовых взносов;<br>— Охранная сигнализация в помещении, огороженная охраняемая территория двора с камерами;<br>— Возможность в любой момент родителям проконтролировать работу садика и убедиться в наших преимуществах!)<br>«Мы создали идеальный садик для своих детей, в котором и Ваш ребенок будет чувствовать себя уютно и комфортно, как дома.» С любовью, Ваш «Cloud» <br>Ждем Вас в мире доброты, уюта и любви!</p><br><p></p>\r\n', 2, 'artc_20170613150925492.jpg', 0, 0, NULL, NULL, '', '', '', 1, 0, 0, '2017-06-13 00:00:00', '2017-06-13 16:08:20', NULL),
(12, 'ЖИЗНЬ НА УРОВНЕ!', '<p></p><p>Сегодня каждый стремится выразить индивидуальность и исключительный вкус не только через манеру одеваться, но и через образ жизни, телефон, марку автомобиля и&nbsp; жилье! По-прежнему, актуальным на&nbsp;рынке недвижимости остается предложение двухуровневых апартаментов.</p><p><p><img src=\"/myprotected/redactor/demo/scripts/uploads/afdd20580a5f14c9d8cc6e94a4551457.jpg\"></p><br></p><p>Это просто современно!</p><ul><li>Огромный простор для творчества</li><li>Возможность выделить различные функциональные зоны</li><li>Можно обойтись минимумом мебели. Негласное правило: чем меньше, тем современнее выглядит интерьер</li><li>Много света и воздуха</li><li>Возможность дороже продать свою квартиру (при необходимости..)</li></ul><p>В нашем жилищном комплексе можно подобрать нестандартные варианты&nbsp; двухуровневых апартаментов с&nbsp;панорамными окнами, гардеробной, кухней-студио.</p><p>Мы тщательно продумали планировку каждой&nbsp;из представленных&nbsp;квартир, чтобы все помещения были максимально полезными для будущих хозяев. Рационально используя каждый квадратный метр дома, мы добились отсутствия неиспользуемых зон, что делает наше жилье особенно ценными.</p><h3>Внимание, акция! Только в этом месяце на все двухуровневые квартиры действует цена 9500 грн/м.</h3><p></p>\r\n', 2, 'artc_20170608121719245.jpg', 0, 0, NULL, NULL, '', '', '', 1, 0, 0, '2017-05-14 00:00:00', '2017-06-13 12:08:13', NULL),
(13, 'ИСТОРИЧЕСКИЙ ГОЛОСЕЕВСКИЙ ПАРК РЯДОМ С НАМИ', '<p></p><p>Голосеевский парк- удивительный лесной массив с пересекающимися тропинками, глубокими и крутыми оврагами, разнообразным по очертаниям рельефом и всего лишь в десяти минутах езды от центра Киева, и 19 минутах от ЖК Новая Конча- Заспа.</p><p><p><img src=\"/myprotected/redactor/demo/scripts/uploads/fa14b1f37bb67df3e21e54eb91739998.jpg\"></p><br></p><p><strong>История Голосеевского парка</strong></p><p>Самое &nbsp;популярное объяснение названия парка: Голосеево» связывают с легендой, будто-бы до конца IХ столетия здесь проживали лесные ведуны-волхвы, которые могли голосами совершать чудеса и влиять на природу. В других источниках название объясняется тем, что в XVIII столетии на голом месте был заложен лес, после этого местность стали называть Голосеево, или тем, что при нашествии монголо-татаров здесь безутешно голосили женщины за утраченными мужьями и детьми.</p><p>В северной части зелёной зоны располагается парк им. Максима Рыльского, заложенный в 1957. Общая площадь парка — 140 гектар, а Голосеевский лес расположился на 780 гектарах..</p><p>Но самое интересное здесь не парк, а малолюдный Голосеевский лес, с уникальной дикой природой и чистым воздухом, глубокими балками, ручьями, протекающими по его территории и образующими пруды.</p><p>На сегодняшний день зелёная зона самого большого лесопарка в Европе — Голосеевского, простирается от Голосеева до самой Конча-Заспы, территория Голосеевского леса с 2007 года стала Национальным природным парком.</p><p>В середине 16 столетия эти территории находились за чертой города и были во владении Киево-Печерской Лавры, благодаря этому земли и не были застроены. В густом лесу стоят три удалённые поселения и сокровенные обители для монахов, места молитв и уединения верующих —&nbsp;<strong>Голосеевский, Китаевский скиты</strong>&nbsp;и самое загадочное —&nbsp;<strong>Сергиево поселение</strong>, возле которых находятся природные водные источники, обладающие колоссальной восстанавливающей силой. На сегодняшний день полностью восстановлен&nbsp;<strong>Свято-Покровский храм</strong>, а также Голосеевский и Китаевский скиты, которые приезжие паломники по святости сравнивают с греческим Афоном.</p><p><strong>Тайны Голосеевского леса</strong></p><p>В густых чащах Голосеево имеется много святых купелей, которые появились с давних времён. Кристально-чистая вода в них круглый год не выше восьми градусов, делая источники не только чудодейными, а и желанными в летний зной. О волшебной силе воды этих источников сложено много преданий, а сами купели окутаны загадками и тайнами. В источнике, что возле Голосеевской обители, согласно монастырским правилам, желающие должны купаться нагишом. Возле купели обустроены лавочки, а в воде этой купели содержится глицерин, который оказывает благоприятное действие на кожу. Недалеко от Китаевской пустыни в лесной чаще можно отыскать купель Пресвятой Троицы. Китаева пустынь уникальна тем, что там в храме Двенадцати апостолов собраны мощи всех 12-ти апостолов, а также мощи святых праведных Иоакима и Анны, и праведных Захарии и Елизаветы и многих других великих святых.</p><p>&nbsp;Сюда в основном приходят религиозные паломники. В Феофании имеется самый прославленный источник, паломники сюда пребывают круглый год и при любой погоде, и считают, что воды этого источника имеют чудодейственные силы, и могут исцелить от любых заболеваний. Монахи Свято-Пантелеймоновского храма рекомендуют окунаться в купель три раза с головой.</p><p>Древний Голосеевский лес скрывает много интересных и мистических историй. И сегодня в чаще леса совершаются таинственные ритуальные действия. В лесу есть энергетические порталы, с помощью которых можно перемещаться в иные миры, так легенда о трёхстах древних Волхвах гласит как во времена распространения христианства и их гонения они переместились в другое измерение через один из порталов, и на этом месте теперь растут триста древних буков. Также считают, что озеро «Дидоровка» представляет собой энергетический портал, имеется информация, что в этих местах во время войны спецподразделения «СС» проводили секретные исследования. По слухам, местами здесь нет дна, а водолазы иногда под водой видели свет, слышали непонятные звуки и подозревают, что здесь имеется проход под водой. Некоторые жители заверяют, что видели русалок, живущих в Китаевских озёрах, а в лесу в районе села Мышеловки, возле Корчеватого, имеется подземный город, в котором будто и сейчас кто-то живёт. Местные старожилы поговаривают, что ночью можно увидеть существ маленького роста, которые владеют даром внушения.</p><p>Голосеевский парк – &nbsp;идеальное место силы, в котором каждый сможет подзарядиться энергией, чтобы опять почувствовать себя бодрым, гармоничным, здоровым, и отдохнувшим от житейских проблем.</p><p>Такие исторические&nbsp; места находятся рядом с нашим жилищным комплексом. Присоединяйтесь, становитесь соседями!</p><p></p>\r\n', 2, 'artc_20170608121846159.jpg', 0, 0, NULL, NULL, '', '', '', 1, 0, 0, '2017-05-10 00:00:00', '2017-06-13 12:07:37', NULL),
(14, 'ОБЩЕОБРАЗОВАТЕЛЬНЫЕ УЧЕБНЫЕ ЗАВЕДЕНИЯ РЯДОМ С НАШИМ КОМПЛЕКСОМ', '<p></p><p><strong>Вопрос образования детей в общеобразовательных заведениях уже решен в нашем ЖК.</strong></p><p>Предложенная подборка общеобразовательных школ, предлагает оценить удобство выбора: есть школы в Ходосовка и ближайшем окружении. Но самое главное – школы Киева рядом, и до них добираться очень быстро и удобно. По Новообуховской трассе пробок не бывает. Приезжайте, убедитесь сами!</p><p><strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;На карте можно увидеть общеобразовательные учебные заведения:</strong></p><p></p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<img src=\"/myprotected/redactor/demo/scripts/uploads/9c0b16ab9cd904c2662f747b61d8a302.jpg\" style=\"width: 786.86px; height: 437px;\"></p><p></p><p></p><br><p></p><p>1)&nbsp;<strong>Ходосеевская общеобразовательная школа 1-3 уровня</strong></p><ul><li>с. Ходосовка, ул. Ленина, 200</li><li>10 минут на автомобиле</li></ul><p>2)&nbsp;<strong>Хотовская общеобразовательная школа 1-3 уровня.</strong></p><ul><li>с. Хотов, пл. Паширова, 10</li><li>18 минут на автомобиле</li></ul><p>3)&nbsp;<strong>Средняя общеобразовательная школа № 205  </strong></p><ul><li>Киев, проспект Леся Курбаса, 10Д,</li><li>30 минут на автомобиле</li></ul><p>4)&nbsp;<strong>Средняя школа №62</strong></p><ul><li>Киев, ул. Княжий Затон, 17В</li><li>32 минуты на автомобиле</li></ul><p>5)&nbsp;<strong>№111 I-III уровня им.С.А.Ковпака</strong></p><ul><li>Киев, ул Здолбуновская, 7Б</li><li>22 минуты на автомобиле.</li></ul><p></p>\r\n', 1, 'artc_20170608122015153.jpg', 0, 0, NULL, NULL, '', '', '', 1, 0, 0, '2017-05-03 00:00:00', '2017-06-13 12:07:02', NULL),
(15, 'ДЕТСКИЕ УЧЕБНЫЕ ЗАВЕДЕНИЯ РЯДОМ С НАШИМ КОМПЛЕКСОМ', '<p><p>Большая часть жильцов комплекса «Новая Конча-Заспа» – молодые семьи, которые еще только планируют свою жизнь. Потому, выбирая место для нашего ЖК, мы внимательно изучали этот вопрос.</p><p>Для молодых семей наиболее острым остаются вопросы, связанные с удобством воспитания и обучения детей. Какое детское учреждение будет посещать ребенок, в какой школе он будет учиться, где искать компетентную медицинскую помощь — наиболее часто задаваемые вопросы при первом визите в отдел продаж.</p><p><strong>На карте можно увидеть ТОП-5 детских дошкольных заведений:</strong></p><p><img class=\"aligncenter size-full wp-image-2928\" src=\"https://n-k-z.com/wp-content/uploads/2017/04/cfl.png\" alt=\"\" width=\"750\" height=\"411\" srcset=\"https://n-k-z.com/wp-content/uploads/2017/04/cfl.png 750w, https://n-k-z.com/wp-content/uploads/2017/04/cfl-300x164.png 300w\" sizes=\"(max-width: 750px) 100vw, 750px\"></p><p>1) <strong>Детский сад «Світлиця»</strong></p><ul><li>Находится на территории аутлет-городка «МАНУФАКТУРА» </li><li>Ведем переговоры о специальной ценовой политике в рамках «Клубной карты» от ЖК «Новая Конча-Заспа»</li><li>5 минут пешком</li></ul><p>2) <strong>Детский сад «Кирюша» (частный)</strong></p><ul><li>Находится в с. Ходосеевка</li><li>5 минут на автомобиле</li></ul><p>3) <strong>Детский сад-ясли «Водограй»</strong></p><ul><li>От Ходосовского сельского совета. Находится в селе.</li><li>5 минут на автомобиле</li></ul><p>4) <strong>ДНЗ № 73</strong></p><ul><li>Киев, ул Генерала Матыкина, 5</li><li>17 минут на автомобиле</li></ul><p>5) <strong>Детский сад «ЭкоНяня»</strong>  </p><ul><li>с. Хотив</li><li>16 минут на автомобиле</li></ul><p>6) <strong>Детский сад №211</strong>  </p><ul><li>Киев, ул Сергея Колоса, 167</li><li>ст.м. «Олимпийская»</li><li>30 минут на автомобиле</li></ul><p>7) <strong>Детский сад №389</strong>  </p><ul><li>Киев, проспект Науки, 100</li><li>18 минут на автомобиле</li></ul><p>В связи с тем, что по Новообуховской трассе не бывает пробок (исключение- временный ремонт дороги), доезжаем быстро!</p><p>Можете проверить — к нам пробок не бывает!</p><br></p>', 1, 'artc_20170608122140795.jpg', 0, 0, NULL, NULL, '', '', '', 1, 0, 0, '2017-04-27 00:00:00', '2017-06-08 12:21:48', NULL),
(16, 'МАЛЫШИ НАШЕГО ЖИЛИЩНОГО КОМПЛЕКСА МОГУТ ПОСЕЩАТЬ ДЕТСКИЙ САДИК «СВІТЛИЦЯ»', '<p><p>Детский садик «Світлиця» — уникальный мир для ребенка в аутлет-городке «Мануфактура» , созданный профессиональным коллективом и творческими воспитателями.</p><p>«Мы видим особенность в каждом ребенке». Главная идея садика – дружное общение с детьми. Учебный процесс построен через развивающие игры, практической познавательной и исследовательской деятельности, которые очень интересны как малышам, так и старшим детям.</p><p>Основные ценности воспитания детей – любовь, добро, милосердие в полной гармонии с природой, социумом, миром.</p><p>Предусмотрена работа двух разновозрастных групп полного дня от 3-х лет и до школьного возраста. Максимальное количество детей в группе — 15. </p><p>На сегодняшний день, наша компания продолжает переговоры о скидке для жильцов, состоявших в закрытом сообществе «Клубной карты».</p><p>Как воспользоваться уникальным предложением и получить «Клубную карту», можно узнать по телефону: (093)708-85-66</p></p>', 2, 'artc_20170608122401942.jpg', 0, 0, NULL, NULL, '', '', '', 1, 0, 0, '2017-04-26 00:00:00', '2017-06-08 12:24:08', NULL),
(17, 'ОТКРЫТИЕ «КЛИНИКИ МАНУФАКТУРА» РЯДОМ С НАШИМ ЖК', '<p><p>Сегодня состоялось открытие «Клиники Мануфактура», в которой все жильцы нашего комплекса могут воспользоваться услугами с 10% скидкой.</p><p>Клиника специализируется на внедрении передовых методов диагностики и лечении в области спинальной хирургии и нейрохирургии, а также предоставляет медицинские услуги по следующим специальностям: хирургия, кардиология, терапия, гастроэнтерология, эндокринологии, неврология, ультразвуковая диагностика, эндоскопия, рентгенология, МРТ и КТ исследования, клиническая лабораторная диагностика, ортопедия и травматология, урология, анестезиология, отоларингология, офтальмология, проктология, акушерство и гинекология, а также эстетическая медицина.</p><p>Мы заботимся о жителях нашего комплекса и активно занимаемся наполнением и продвижением «Клубной карты» — эксклюзивного закрытого сообщества!</p></p>', 2, 'artc_20170608122454473.jpg', 0, 0, NULL, NULL, '', '', '', 1, 0, 0, '2017-04-25 00:00:00', '2017-06-08 12:25:01', NULL),
(18, 'Ход строительства домов и таунхаусов в нашем комплексе // 9 июня 2017г.', '<p></p><div><p><strong>Итоги строительства по дому \"Шатель\" (обе секции)</strong></p></div><div><ol></ol></div><div><li>Продолжается внешняя отделка фасада 1-ой секции.</li></div><div><li>Ведутся работы по монтажу внутренних инженерных сетей в 1-ой секции дома.</li></div><div><li>Ведутся подготовительные работы для монтажа стропильной системы крыши в 1-ой секции.</li></div><div><li>Заканчиваеться кладка стен 6-ого этажа 2-ой секции.</li></div><div><li>Ведутся подготовительные работы для монтажа плит перекрытия 6-ого этажа 2-ой секции.</li></div><div><li>Продолжается кладка межкомнатных и межквартирных перегородок во 2- ой секции.</li></div><div></div><div><p><strong>Ход строительства по дому \"Лион\"</strong><br></p></div><div> <strong>1-ая секция:</strong><p></p></div><div><ol></ol></div><div><li>Ведутся работы по устройству технологических отверстий для монтажа внутренних инженерных сетей.</li></div><div><li>Установка стеклопакетов с 1- ого по 5-ый этажи - продолжается.</li></div><div></div><div><p><strong>2-я секция:</strong></p></div><div><ol></ol></div><div><li>Монтаж стеклопакетов со 2-ого по 5-ый этажи - продолжается.</li></div><div><li>Ведутся подготовительные работы для монтажа внутренних инженерных сетей.</li></div><div></div><div><p><strong>3-я секция:</strong></p></div><div><ol></ol></div><div><li>Закончена кладка стен 5-ого этажа.</li></div><div><li>Заканчивается кладка межкомнатных перегородок на 3, 4-ом этажах.</li></div><div></div><div><p><strong>5, 6-ая секции:</strong></p></div><div><ol></ol></div><div><li>Работы по армированию фундамента выполнены.</li></div><div><li>Работы по бетонированию фундамента выполнены.</li></div><div></div><div><p><strong>Благоустройство территории ЖК \"Новая Конча Заспа\"</strong></p></div><div><ol></ol></div><div><li style=\"list-style-type: none;\"></li></div><div><ol></ol></div><div><li>9-ти этажный дом Лион подключен к канализационной системе ЖК \"Новая Конча Заспа\".</li></div><div><li>Ведутся строительные работы фундамеентного цикла на месте установки очистных сооружений ЖК \"Новая Конча Заспа\".</li></div><div><li>Продолжается благоустройство территории жилищного комплекса.</li></div><div></div><div><p><strong>Полезная информация:</strong></p></div><div><ol></ol></div><div><li style=\"list-style-type: none;\"></li></div><div><ol></ol></div><div><li>Компания “AVM Building Group” для повышения скорости строительства, улучшения энергоэффективности и расширения эксплуатационных свойств своих объектов открыло свое производство ПВХ изделий.</li></div><div><li>В производстве окон мы используем 5-ти камерный профиль “OPENTECK” ( Украина), фурнитуру “ROTO” ( Германия), двухкамерные стеклопакеты производства компании ООО \"Glas Trösch\", г. Киев.</li></div><div><li>Дополнительно для наших клиентов появилась возможность внести изменения в стандартную конструкцию Ваших окон на этапе строительства, а именно:</li></div><div></div><div><p>                      - добавление открываний.</p></div><div>                      - увеличение количества стеклопакетов..</div><div>                      - выполнение внутренней ламинации изделий.</div><div>                      - закупка и установка  подоконников класса “ Luxury”.</div><div>                      - заказ москитных сеток.</div><div>                      - дополнительное остекление проемов в помещениях.</div><div><span style=\"font-size: 12px;\">        Все возможные изменения оговариваются с каждым  инвестором индивидуально, с учетом всех пожеланий.</span></div><div><span style=\"font-size: 12px;\">        С образцами стеклопакетов, подоконников, с возможными вариантами окна в ламинации - Вы можете ознакомиться на производстве, в дальнейшем стенды с продукцией будут размещены в отделах продаж.</span></div><div> <br></div><div> <a href=\"https://n-k-z.com/nemnogo-pro-okna/\" target=\"_blank\" rel=\"noopener noreferrer\" data-saferedirecturl=\"https://www.google.com/url?hl=ru&q=https://n-k-z.com/nemnogo-pro-okna/&source=gmail&ust=1497295634838000&usg=AFQjCNG68iiLALtkEj1374BF8HEO6f5WtQ\">https://n-k-z.com/nemnogo-pro-<wbr>okna/</a></div><div><li style=\"list-style-type: none;\"></li></div><div><p>Посмотреть фотоотчеты <a href=\"http://sk-fall.com.ua/nkz/building-progress/\">о строительстве можно тут.</a></p></div><div></div><div></div><div></div><div></div><br><p></p>\r\n', 1, 'artc_20170611225442443.JPG', 0, 0, '', '', '', '', '', 1, 1, 0, '2017-06-09 00:00:00', '2018-05-14 10:39:22', NULL),
(19, 'Поздравляем наших  инвесторов с приобретением новых квартир!', '<p>Дамы и господа! Мы рады презентовать Вам фотоотчет с \"Дня открытых дверей\".<br>Большое спасибо всем гостям, которые побывали на празднике, мы были и будем рады видеть Вас у нас в гостях!<br></p>\r\n', 2, 'artc_20170612165816975.JPG', 0, 0, NULL, NULL, '', '', '', 1, 0, 0, '2017-06-12 00:00:00', '2017-06-13 11:22:59', NULL),
(21, 'Для удобства клиентов запущен бесплатный трансфер от метро Выдубичи', '<p>\r\n\r\n</p><p>Уважаемые дамы и господа, с сегодняшнего дня, 16 июня, мы запустили бесплатный трансфер от метро Выдубичи.<br></p><p>Ежедневно, с 9.30 до 19.30, комфортабельный Volvo XC90\r\nдомчит Вас к нашему жилому комплексу, всего за 10 минут!</p>\r\n\r\n<p>Водитель-консультант сможет рассказать&nbsp; о преимуществах месторасположения ЖК Новая\r\nКонча-Заспа, показать объекты инфраструктуры, &nbsp;Голубое озеро, пони-клуб «Домино», вы узнаете где находятся школы и\r\nсадики, поликлиники и&nbsp; спортивные\r\nспортклубы.</p>\r\n\r\n<p>Записаться &nbsp;на\r\nпросмотр – экскурсию можно &nbsp;по телефонам колл-центра или у операторов чата.<br></p><br><p></p>\r\n', 1, 'artc_20170615142827642.jpg', 0, 0, NULL, NULL, '', '', '', 1, 0, 0, '2017-06-15 00:00:00', '2017-06-16 18:22:47', NULL),
(22, '24  ИЮНЯ ДЕНЬ ОТКРЫТЫХ ДВЕРЕЙ В ЖК НОВАЯ КОНЧА-ЗАСПА', '<p><p>24 июня День Открытых Дверей в ЖК Новая Конча-Заспа!</p>\r\n<p>Дамы и господа!</p>\r\n<p>с 10.00 до 20.00 приглашаем всех в наш отдел продаж!</p>\r\n<p>В день открытых дверей мы предлагаем следующую программу:</p>\r\n<p>Возле отдела продаж:</p>\r\n<p>Целый день для наших гостей и друзей</p>\r\n<p><ul><li>- работает профессиональный \r\nDJ<br></li><li>- кейтеринг от шеф- повара Alex<br></li></ul></p>\r\n\r\n<p>В отделе продаж:</p>\r\n<p>Целый день</p>\r\n<p><ul><li>- консультируют профессиональные менеджеры<br></li><li>- беспроигрышная лотерея (электротовары)<br></li></ul></p>\r\n\r\n<p>ЖДЕМ ВСЕХ ГОСТЕЙ В СУББОТУ И КАЖДЫЙ ДЕНЬ!</p>\r\n<p>Наш адрес:</p>\r\n<p>Киевская область, Киево-Святошинский р-н, с. Ходосовка,\r\nНовообуховское шоссе, 1 (поворот к Мегамаркету и Мануфактуре)</p>\r\n<p>Более подробно узнать по телефону:</p>\r\n<p>(044)394-88-20</p>\r\n<p>(067)825-50-19</p><br></p>', 2, 'artc_20170621122916741.jpg', 0, 0, NULL, NULL, '', '', '', 1, 0, 0, '2017-06-21 00:00:00', '2017-06-21 12:30:12', NULL),
(24, 'Рекордно доступный первый взнос на квартиры в строящемся доме \"Лион\"', '<p></p><p>Уважаемые клиенты. С радостью сообщаем, что в этом месяце на некоторые виды квартир в строящемся доме «Лион» действует <b>акционная цена 12 500 грн/м</b> на квартиры в 3-4 секциях<b>.</b></p><p>Наш комплекс находится в 7-ми км от Киева в Ходосовке (Новообуховское шоссе, 1) и включает 6-ти и 9-этажные жилые дома, таунхаусы (включая варианты дуплексов), а также отдельный коттеджный городок клубного типа.</p><p><p><img src=\"/myprotected/redactor/demo/scripts/uploads/d493a36de426d4e580fd2d76582f2906.jpg\" style=\"\"></p><br></p><p></p><p></p><p></p><p></p><p></p>* - указан <b>первый взнос 30%</b> на квартиру 43 кв.м в доме \"Лион\" в 3-ей секции. Полная стоимость квартиры составляет 537 500 грн и пересчитана по курсу 26 грн/уе<div>** - указан <b>первый взнос 30%</b> на квартиру 65,9 кв.м в доме \"Лион\" в 4-ой секции. Полная стоимость квартиры составляет 823 750 грн и пересчитана по курсу 26 грн/уе</div><div><h2 style=\"text-align: center;\"><a href=\"https://n-k-z.com/flats/shatel/r1/\"></a><a href=\"https://n-k-z.com/flats/lion/r1/\">Посмотреть все планировки дома \"Лион\" можно тут >></a></h2><br></div><div><b>Сдача дома запланирована на 2 квартал 2018г. </b><p></p><h3>                                                                    <b>Генеральный план комплекса</b></h3><p></p><p><img src=\"/myprotected/redactor/demo/scripts/uploads/da616a2fe2ab4b8f56ee036a22c64244.jpg\" style=\"width: 948.509px; height: 349px;\"></p><br><p></p><br><p></p>\r\n</div>\r\n', 1, 'artc_20170705173552881.jpg', 0, 0, NULL, NULL, '', '', '', 1, 1, 0, '2017-06-22 00:00:00', '2017-09-05 11:45:33', NULL);
INSERT INTO `osc_page_news_items` (`id`, `caption`, `details`, `template`, `preview`, `cat`, `is_top`, `special_text`, `tags`, `meta_title`, `meta_keys`, `meta_desc`, `is_index`, `block`, `order_id`, `dateCreate`, `dateModify`, `adminMod`) VALUES
(36, 'Ход строительства домов и таунхаусов в нашем комплексе // 23 июля 2017г.', '<p><div><p><strong>Итоги строительства по дому \"Шатель\" (обе секции)</strong></p></div><div><li>Продолжается монтаж стропильой системы крыши в 1-ой секции.</li></div><div><li>Заканчивается монтаж внутренних инженерных сетей во 2 - ой секции. ( водопровод, канализация, отопление).</li></div><div><li>Продолжается.внешняя отделка фасада 1-ой секции.</li></div><div><li>Ведется монтаж електрического кабеля в коридорах и на лестнице в подъезде 1-ой секции.</li></div><div><p><strong>Ход строительства по дому \"Лион\"</strong></p></div><div><strong>1-ая секция:</strong></div><div><li>Заканчивается монтаж плит перекрытия 8-ого этажа.</li><li>Начинается кладка стен 9-ого этажа.</li><li>Ведутся работы по устройству технологических отверстий для прокладки канализационных стояков.</li><li>Ведется кладка стен межкомнатных перегородок на этажах.</li></div><div><p><strong>2-я секция:</strong></p></div><div><li>Продолжаются работы по монтажу монолитной плиты прекрытия 9-ого этажа.</li></div><div><li>Ведутся работы по монтажу внутренней водопроводной.и отопительной систем.</li></div><div><p><strong>3-я секция:</strong></p></div><div><li>Продолжается монтаж каркаса монолитного пояса усиления и опалубки.</li><li>Ведутся подготовительные работы для бетонирования монолитного пояса усиления.</li></div><div><p><strong>4-я секция:</strong></p></div><div><li>Заканчивается кладка стен 2- ого этажа.</li><li>Ведутся подготовительные работы для монтажа плит перекрытия 2- ого этажа.</li></div><div><p><strong>5-я секция:</strong></p><ul><div>Продолжается монтаж каркаса монолитного пояса усиления цокольного этажа.</div><div>Ведутся подготовительные работы для бетонирования монолитного пояса усиления цокольного этажа.</div></ul><b>6</b><strong>-я секция:</strong><div><ul><li>Продолжается монтаж цокольного этажа.</li><li>Ведется вязка и сварка каркаса монолитного пояса усиления цокольного этажа.</li></ul></div><div><p><strong>Ход строительства проекта \"Перша Житлова\"</strong></p></div><div><strong>Дом № 1:</strong></div><div><li>Внешнее утепление фасада - продолжаеться.</li><li>Ведется внешняя отделка фасада.</li><li>В коридорах и на лестнице подъезда проведены электромонтажные работы.</li><li>Смонтированы узлы учета электроэнергии.<br></li><li>Ведется монтаж узлов учета воды.<br></li><li>Смонтированы внутренние инженерные системы ( водопровод, канализация, отопление).<br></li></div><div><strong><strong><strong><strong>Дом № 2:</strong></strong></strong></strong><li>Продолжаются работы фундаментного цикла.</li><li>Ведутся работы по гидроизоляции фундаментной плиты.</li></div><div><b>Благоустройство территории ЖК \"Новая Конча Заспа\":</b></div><ul><ol><li></li><ol><li>Строительство очистных сооружений ЖК \"Новая Конча Заспа\" - продолжается.</li><li>Ведется строительство дороги по улице И. Франка ( перед домом Шатель)</li><li>Начались работы по планировке и благоустройству территории вокруг ТаунХаусов, по улице И. Франка.</li><li>ЖК \" Новая Конча Заспа\" : <a href=\"https://www.youtube.com/watch?feature=share&utm_source=Viber&utm_campaign=Private&v=rgDGq76IJoU&utm_medium=Chat&app=desktop\">https://www.youtube.com/watch?feature=share&utm_source=Viber&utm_campaign=Private&v=rgDGq76IJoU&utm_medium=Chat&app=desk</a></li></ol><li><a href=\"https://www.youtube.com/watch?feature=share&utm_source=Viber&utm_campaign=Private&v=rgDGq76IJoU&utm_medium=Chat&app=desktop\"></a></li></ol><li><a href=\"https://www.youtube.com/watch?feature=share&utm_source=Viber&utm_campaign=Private&v=rgDGq76IJoU&utm_medium=Chat&app=desktop\"></a></li></ul></div><br></p>', 1, 'artc_20170725092923982.jpg', 0, 0, '', '', '', '', '', 1, 1, 0, '2017-07-23 00:00:00', '2018-05-14 10:37:48', NULL),
(25, 'Ход строительства домов и таунхаусов в нашем комплексе // 16 июня 2017г.', '<p></p><div><p><strong>Итоги строительства по дому \"Шатель\" (обе секции)</strong></p></div><div><li>Работы по утеплению фасада в 1-ой секции продолжаются.</li></div><div><li>Внешняя отделка фасада 1- ой секции продолжается.</li></div><div><li>В 1-ой секции продолжается монтаж водопроводных и канализационных стояков.</li></div><div><li>Заканчиваются работы по гидроизоляции подвала в 1, 2- ой секциях.</li></div><div><li>Заканчивается кладка стен 6-ого этажа во 2 -ой секции дома.</li></div><div><li>Продолжается кладка перегородок в секциях № 1, 2.</li></div><div><p><strong>Ход строительства по дому \"Лион\"</strong></p></div><div> <strong>1-ая секция:</strong></div><div><li>Продолжаются работы по устройству технологических отверстий для монтажа внутренних инженерных сетей.</li><li>Ведутся работы по устройству внутренних инженерных сетей.( водопровод, канализации ).<br></li><li>Заканчивается кладка стен 7-ого этажа.</li><li>Ведутся подготовительные работы для монтажа плит перекрытия 7-ого этажа.<br><br></li></div><div><p><strong>2-я секция:</strong></p></div><div><li>Ведется кладка стен 9- ого этажа.<br></li></div><div><li>Продолжаются работы по устройству технологических отверстий для монтажа внутренних инженерных сетей.<br></li><li>Ведется монтаж внутренних инженерных сетей (водопровод, канализация).</li><li>Ведется кладка межкомнатных перегородок на 7, 8 - ом этажах.<br><br></li></div><div><p><strong>3-я секция:</strong></p></div><div><li>Выполнен монтаж плит перекрытия 5-ого этажа.<br></li></div><div><li>Ведется кладка стен 6-ого этажа.<br></li></div><div><p><strong><br></strong></p><p><strong>4-я секция:</strong></p></div><div><li>Ведутся подготовительные работы для кладки стен 1-ого этажа.</li></div><div><p><strong>5, 6-ая секции:</strong></p></div><div><li>Продолжаются подготовительные работы для устройства фундаментной плиты.</li><li>Ведутся подготовительные работы для гидроизоляции фундаментной плиты.<br></li></div><div><span style=\"font-size: 12px;\">.</span><br></div><div><p><strong>Ход строительства проекта \"Перша Житлова\"</strong></p></div><div><strong>Дом № 1:</strong></div><div><li>Закончен монтаж окон.</li><li>Продолжаются работы по устройству технологических отверстий для монтажа внутренних инженерных сетей.</li><li>Ведутся подготовительные работы по утеплению и отделке фасада.<br></li><li>Ведется монтаж внутренних инженерных сетей.</li></div><div><p><strong><strong>Дом № 2:</strong><br></strong></p><p></p><span style=\"font-size: 12px;\"><ul><li>Ведутся работы по устройству свайного поля.<br></li><li>Ведутся подготовительные работы фундаментного цикла.<br></li></ul></span><p></p><p><strong>Благоустройство территории ЖК \"Новая Конча Заспа\"</strong></p><p></p><ul><li>Проводятся работы по устройству гидроизоляции на строительстве очистных сооружений.</li><li>Продолжается строительство дороги по улице Ф. Печерского.</li><li>Установлена система водоподготовки в домах \"Линц\" и \"Грац\".</li></ul><p></p></div><br><p></p>\r\n', 1, 'artc_20170626110818870.JPG', 0, 0, '', '', '', '', '', 1, 1, 0, '2017-06-16 00:00:00', '2018-05-14 10:39:04', NULL),
(26, 'Ход строительства домов и таунхаусов в нашем комплексе // 23 июня 2017г.', '<p></p><div><p><strong>Итоги строительства по дому \"Шатель\" (обе секции)</strong></p></div><div><li>Внешняя отделка фасада 1-ой секции продолжается.</li></div><div><li>Закончен монтаж внутренних инженерных сетей в 1-ой секции дома.</li></div><div><li>Заканчиваеться кладка фронтонов 2-ой секции.</li></div><div><li>Ведется монтаж внутренних инженерных сетей во 2 - ой секции. ( водопровод, канализация).</li></div><div><li>Продолжается кладка межкомнатных и межквартирных перегородок во 2- ой секции.</li></div><div><li>Разработан проект остекления фасада дома Шатель и места установки кондиционеров на фасаде дома.</li></div><div><p><strong>Ход строительства по дому \"Лион\"</strong></p></div><div> <strong>1-ая секция:</strong></div><div><li>Заканчивается монтаж плит перекрытия 7- ого этажа.</li></div><div><li>Ведется кладка стен 8 - ого этажа.<br></li><li>Продолжается монтаж внутренних инженерных сетей.<br></li><li>Работы по устройству технологических отверстий для монтажа внутренних инженерных сетей продолжаются.<br><br></li></div><div><p><strong>2-я секция:</strong></p></div><div><li>Ведется кладка стен 9- ого этажа.</li></div><div><li>Работы по устройству технологических отверстий для монтажа внутренних инженерных сетей продолжаются.</li><li>Продолжается монтаж внутренних инженерных сетей (водопровод, канализация).<br></li><li>Ведется кладка межкомнатных перегородок на 7, 8 - ом этажах.<br><br></li></div><div><p><strong>3-я секция:</strong></p></div><div><li>Продолжается кладка стен 6-ого этажа.</li></div><div><li>Ведутся подготовительные работы для устройства монолитного пояса усиления.<br></li></div><div><p><strong>4-я секция:</strong></p></div><div><li>Ведется кладка стен 1- ого этажа.</li></div><div><li>Графики строительства 3, 4 - ой секции будут опубликованы до 1.07.2017 г.<br></li></div><div><p><strong>5, 6-ая секции:</strong></p></div><div><li>Продолжаюся работы по устройству каркаса фундаментной плиты.</li></div><div><p><strong>Ход строительства проекта \"Перша Житлова\"</strong></p></div><div><strong>Дом № 1:</strong></div><div><li>Ведутся работы по внешнему утеплению и отделке фасада.</li></div><div><li>Продолжаются работы по монтажу внутренних инженерных сетей ( водопровод, канализация, отопление.).</li></div><div><p><strong><strong>Дом № 2:</strong><br></strong></p><p></p><ul><li>Устройство свайного поля завершено.<br></li><li></li><li>Ведутся подготовительные работы для строительства фундаментной плиты.<br></li><br></ul><p></p><p><strong>Благоустройство территории ЖК \"Новая Конча Заспа\"</strong></p></div><div><li>Продолжаются строительные работы фундаментного цикла на месте установки очистных сооружений ЖК \"Новая Конча Заспа\".</li></div><div><li>Продолжается строительство дороги по ул. Ф. Печерского.</li></div><div><li>ЖК \" Новая Конча Заспа\" : <a href=\"https://www.youtube.com/watch?feature=share&utm_source=Viber&utm_campaign=Private&v=rgDGq76IJoU&utm_medium=Chat&app=desktop\" style=\"font-size: 12px;\">https://www.youtube.com/watch?feature=share&utm_source=Viber&utm_campaign=Private&v=rgDGq76IJoU&utm_medium=Chat&app=desk</a><br></li></div><br><p></p>\r\n', 1, 'artc_20170626122837993.JPG', 0, 0, '', '', '', '', '', 1, 1, 0, '2017-06-23 00:00:00', '2018-05-14 10:38:51', NULL),
(29, 'ЖК Новая Конча-Заспа - жемчужина пригорода', '<p>Лучшее расположение. правильно организованная инфраструктура, формат жилья -  на любой вкус.6-ти и 9-ти этажные дома, комфортные таунхаусы и коттеджи.<br></p><p><br></p>\r\n<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/VB2N9wS6_Yw\" frameborder=\"0\" allowfullscreen></iframe>', 2, 'artc_20170629163649943.jpg', 0, 0, NULL, NULL, '', '', '', 1, 0, 0, '2017-06-29 00:00:00', '2017-06-29 16:37:16', NULL),
(30, 'Подарочные электровелосипеды уже ждут своих владельцев', '<p>Инвестора купившие Таунхаусы с документами по акции \"Электровелосипед в подарок\".</p><p>Уже могут получить свой подарок в нашем отделе продаж.</p><p><p>Наш адрес:</p><p>Киевская область, Киево-Святошинский р-н, с. Ходосовка, Новообуховское шоссе, 1 (поворот к Мегамаркету и Мануфактуре)</p><p>Более подробно узнать по телефону:</p><p>(044)394-88-20</p><p>(067)825-50-19</p><br></p>\r\n', 2, 'artc_20170630172420432.jpeg', 0, 0, NULL, NULL, '', '', '', 1, 0, 0, '2017-06-30 00:00:00', '2017-06-30 17:26:48', NULL),
(31, 'Ход строительства домов и таунхаусов в нашем комплексе // 30 июня 2017г.', '<p></p><div><p><strong>Итоги строительства по дому \"Шатель\" (обе секции)</strong></p></div><div><li>Внешняя отделка фасада 1-ой секции продолжается.</li></div><div><li>Ведется монтаж внутренних инженерных сетей во 2 - ой секции. ( водопровод, канализация, отопление).</li></div><div><li>Закончена кладка фронтонов 2-ой секции.</li></div><div><li>Продолжается кладка межкомнатных и межквартирных перегородок во 2- ой секции.</li></div><div><li> Ведется кладка ограждений на балконах 2- ой секции.</li></div><div><li>Разработан проект остекления фасада дома Шатель и места установки кондиционеров на фасаде дома.</li></div><div><p><strong>Ход строительства по дому \"Лион\"</strong></p></div><div><strong>1-ая секция:</strong></div><div><li>Ведется кладка стен 8 - ого этажа.</li><li>Ведется кладка межкомнатных перегородок на 6, 7 - ом этажах.</li></div><div><p><strong>2-я секция:</strong></p></div><div><li>Заканчиваетсятся кладка стен 9- ого этажа.</li></div><div><li>Работы по устройству технологических отверстий для монтажа внутренних инженерных сетей продолжаются.</li><li>Продолжается монтаж внутренних инженерных сетей (водопровод, канализация).</li><li>Ведутся подготовительные работы для устройства монолитной плиты перекрытия 9-ого этажа.</li></div><div><p><strong>3-я секция:</strong></p></div><div><li>Продолжается кладка стен 6-ого этажа.</li><li>Ведется кладка межкомнатных перегородок на 4, 5 -ом этажах.</li></div><div><p><strong>4-я секция:</strong></p></div><div><li>Ведется кладка стен 1- ого этажа.</li></div><div><li>Графики строительства 3, 4 - ой секции, по техническим причинам будут опубликованы до 7.07.2017 г.</li></div><div><p><strong>5, 6-ая секции:</strong></p><p></p><ul><li>Ведется монтаж цокольного этажа на 5-ой секции.</li><li>Продолжаюся работы по устройству каркаса фундаментной плиты на 6- ой секции.</li></ul><p></p></div><p></p><p></p><div><p><strong>Ход строительства проекта \"Перша Житлова\"</strong></p></div><div><strong>Дом № 1:</strong></div><div><li>Ведутся работы по внешнему утеплению и отделке фасада.</li></div><div><li>Продолжаются работы по монтажу внутренних инженерных сетей ( водопровод, канализация, отопление.).</li><strong style=\"font-size: 12px;\"><strong><div><strong style=\"font-size: 12px;\"><strong><strong>Дом № 2:</strong></strong></strong><br></div></strong></strong><li>Ведутся подготовительные работы для строительства фундаментной плиты.</li></div><div><ul><li><strong></strong></li></ul></div><div><b>Благоустройство территории ЖК \"Новая Конча Заспа\":</b></div><ul><li>Продолжаются строительные работы фундаментного цикла на месте установки очистных сооружений ЖК \"Новая Конча Заспа\".( фото № 8).</li><li>Продолжается строительство дороги по ул. Ф. Печерского.( фото № 7).</li><li>Ведется строительство \"лаунж-зоны\" между жомами Линц и Грац ( фото № 6 )</li><li>Продолжаются работы по озеленению территории жилищного комплекса.( фото № 5).</li><li>ЖК \" Новая Конча Заспа\" : <a href=\"https://www.youtube.com/watch?feature=share&utm_source=Viber&utm_campaign=Private&v=rgDGq76IJoU&utm_medium=Chat&app=desktop\"></a><a href=\"https://www.youtube.com/watch?feature=share&utm_source=Viber&utm_campaign=Private&v=rgDGq76IJoU&utm_medium=Chat&app=desktop\">https://www.youtube.com/watch?feature=share&utm_source=Viber&utm_campaign=Private&v=rgDGq76IJoU&utm_medium=Chat&app=desk</a></li></ul><p><br></p>\r\n', 2, 'artc_20170702123218248.jpg', 0, 0, '', '', '', '', '', 1, 1, 0, '2017-06-30 00:00:00', '2018-05-14 10:38:36', NULL),
(32, '8 ИЮЛЯ  ДЕНЬ ОТКРЫТЫХ ДВЕРЕЙ В ЖК НОВАЯ КОНЧА-ЗАСПА', '<p><p>Дамы и господа!</p>\r\n<p>с 10.00 до 20.00 приглашаем всех в наш отдел продаж!</p>\r\n<p>В день открытых дверей мы предлагаем следующую программу:</p>\r\n<p>Возле отдела продаж:</p>\r\n<p>Целый день для наших гостей и друзей</p>\r\n\r\n<p>- работает профессиональный \r\nDJ</p>\r\n\r\n<p>- кейтеринг в отделе продаж \r\nот шеф- повара Alex</p>\r\n\r\n<p>- взрослых и детей будет удивлять выступление  прекрасно-космических  ростовых фигур </p>\r\n<p>В отделе продаж:</p>\r\n<p>Целый день</p>\r\n\r\n<p>- консультируют профессиональные менеджеры</p>\r\n\r\n<p>- беспроигрышная лотерея (электротовары)</p>\r\n\r\n<p>- всех, кто \r\nкупит  Таунхаус, ждет\r\nультра-модный  электровелосипед в подарок</p>\r\n<p>ЖДЕМ ВСЕХ ГОСТЕЙ В СУББОТУ И КАЖДЫЙ ДЕНЬ!</p>\r\n<p>Наш адрес:</p>\r\n<p>Киевская область, Киево-Святошинский р-н, с. Ходосовка,\r\nНовообуховское шоссе, 1 (поворот к Мегамаркету и Мануфактуре)</p>\r\n<p>Более подробно узнать по телефону:</p>\r\n<p>(044)394-88-20</p>\r\n<p>(067)825-50-19</p><br></p>', 2, 'artc_20170707110846183.JPG', 0, 0, NULL, NULL, '', '', '', 1, 1, 0, '2017-07-07 00:00:00', '2017-07-25 14:11:59', NULL),
(33, 'Ход строительства домов и таунхаусов в нашем комплексе // 8 июля 2017г.', '<p><div><p><strong>Итоги строительства по дому \"Шатель\" (обе секции)</strong></p></div><div><li>Заканчивается кладка балконных ограждений в секциях 1, 2.</li></div><div><li>Продолжается монтаж внутренних инженерных сетей во 2 - ой секции. ( водопровод, канализация, отопление).</li></div><div><li>Заканчивается кладка межкомнатных и межквартирных перегородок во 2- ой секции.</li></div><div><li>Продолжается.внешняя отделка фасада 1-ой секции. </li></div><div><p><strong>Ход строительства по дому \"Лион\"</strong></p></div><div><strong>1-ая секция:</strong></div><div><li>Продолждается кладка стен 8 - ого этажа.</li><li>Ведется монтаж внутренних инженерных сетей.</li></div><div><p><strong>2-я секция:</strong></p></div><div><li>Закончена кладка стен 9- ого этажа.</li></div><div><li>Ведутся работы для вязки и сварки каркаса монолитной плиты прекрытия 9-ого этажа.</li></div><div><p><strong>3-я секция:</strong></p></div><div><li>Заканчивается кладка стен 6-ого этажа.</li><li>Ведутся подготовительные работы для строительсва ионолитного пояса 6-ого этажа.</li></div><div><p><strong>4-я секция:</strong></p></div><div><li>Продолжается кладка стен 1- ого этажа.</li></div><div><p><strong>5-я секция:</strong></p><ul><li></li><div>Закнчивается монтаж стен цокольного этажа.</div><div>Ведутся подготовительные работы для строительства монолитного пояса усиления цокольного этажа.</div><li></li></ul><b style=\"font-size: 12px;\">6</b><strong style=\"font-size: 12px;\">-я секция:</strong><br></div><div><ul><li>Фундаментная плита забетонирована.<br></li><li>Ведутся подготовительные работы для строительства стен цокольного этажа.<br></li></ul></div><div><p><strong>Ход строительства проекта \"Перша Житлова\"</strong></p></div><div><strong>Дом № 1:</strong></div><div><li>Продолжаются работы по внешнему утеплению и отделке фасада.</li><li>Продолжаются работы по монтажу внутренних инженерных сетей ( водопровод, канализация, отопление.).</li></div><div><strong style=\"font-weight: bold;\"><strong><strong><strong>Дом № 2:</strong></strong></strong></strong><li>Проведены работы по сварке и вязке каркаса дундамента.</li><li>Проведено бетонирование фундаментной плиты.</li></div><div><ul></ul></div><div><b>Благоустройство территории ЖК \"Новая Конча Заспа\":</b></div><ul><li></li><ol><li>Продолжаются строительные работы фундаментного цикла на месте установки очистных сооружений ЖК \"Новая Конча Заспа\".( фото № 6? 7).</li><li>Строительство дороги по улице Феодосия Печерского, И.Франка - продолжается. ( фото № 4, 5 ).</li><li>Продолжаются работы по озеленению территории жилищного комплекса.</li><li>ЖК \" Новая Конча Заспа\" : <a href=\"https://www.youtube.com/watch?feature=share&utm_source=Viber&utm_campaign=Private&v=rgDGq76IJoU&utm_medium=Chat&app=desktop\">https://www.youtube.com/watch?feature=share&utm_source=Viber&utm_campaign=Private&v=rgDGq76IJoU&utm_medium=Chat&app=desk</a></li></ol><li><a href=\"https://www.youtube.com/watch?feature=share&utm_source=Viber&utm_campaign=Private&v=rgDGq76IJoU&utm_medium=Chat&app=desktop\"></a></li></ul><br></p>', 1, 'artc_20170710120527474.jpg', 0, 0, '', '', '', '', '', 1, 1, 0, '2017-07-08 00:00:00', '2018-05-14 10:38:22', NULL),
(34, '8 июля, в нашем отделе продаж было весело!', '<p></p><div>Всех гостей встречали ходулисты, можно было подкрепиться свежими ягодами и фруктами.</div><div>Среди гостей, которые стали нашими инвесторами, мы разыгрывали электротовары.</div><div>По-прежнему идет розыгрыш электробайка!!!</div><div>Присоединяйтесь к нашей дружной семье!!!</div><p></p>\r\n', 2, 'artc_20170711151433303.JPG', 0, 0, NULL, NULL, '', '', '', 1, 0, 0, '2017-07-11 00:00:00', '2017-07-11 17:03:06', NULL),
(35, 'Ход строительства домов и таунхаусов в нашем комплексе // 16 июля 2017г.', '<p><div><p><strong>Итоги строительства по дому \"Шатель\" (обе секции)</strong></p></div><div><li>Ведется монтаж стропильой системы крыши в 1-ой секции.</li></div><div><li>Заканчивается монтаж внутренних инженерных сетей во 2 - ой секции. ( водопровод, канализация, отопление).</li></div><div><li>Продолжается.внешняя отделка фасада 1-ой секции.</li></div><div><li>Ведутся подготовительные работы для монтажа електрического кабеля в местах общего пользования ( в коридорах и на лестничных площадках) в подъезде 1- ой секции.</li></div><div><p><strong>Ход строительства по дому \"Лион\"</strong></p></div><div><strong>1-ая секция:</strong></div><div><li>Заканчивается кладка стен 8 - ого этажа.</li><li>Ведется монтаж плит перекрытия 8-ого этажа.</li><li>Ведутся подготовительные работы для кладки стен 9-ого этажа.<br></li><li>Продолжается монтаж внутренних инженерных сетей.<br></li></div><div><p><strong>2-я секция:</strong></p></div><div><li>Закончена кладка стен 9- ого этажа.</li></div><div><li>Продолжаются работы по монтажу монолитной плиты прекрытия 9-ого этажа.</li></div><div><p><strong>3-я секция:</strong></p></div><div><li>Закончена кладка стен 6-ого этажа.</li><li>Ведется монтаж монолитного пояса усиления.</li></div><div><p><strong>4-я секция:</strong></p></div><div><li>Закончена кладка стен 1- ого этажа.</li><li>Заканчивается монтаж плит перекрытия 1- ого этажа.<br></li><li>Ведется кладка стен 2- ого этажа.<br></li><li>Ведется кладка межкомнатных перегородок на 1-ом этаже.<br></li></div><div><p><strong>5-я секция:</strong></p><ul><div>Закончен монтаж стен цокольного этажа.</div><div><div>Ведется монтаж монолитного пояса усиления цокольного этажа.</div></div></ul><b>6</b><strong>-я секция:</strong><div><ul><li>Ведется монтаж цокольного этажа.</li><li>Ведутся подготовительные работы для вязки и сварки каркаса монолитного пояса усиления цокольного этажа.</li></ul></div><div><p><strong>Ход строительства проекта \"Перша Житлова\"</strong></p></div><div><strong>Дом № 1:</strong></div><div><li>Продолжаются работы по внешнему утеплению и отделке фасада.</li><li>Ведется внешнее оштукатуривание фасада.</li><li>Монтаж внутренних инженерных сетей - продолжается. ( водопровод, канализация, отопление).</li></div><div><strong><strong><strong><strong>Дом № 2:</strong></strong></strong></strong><li>Продолжаются работы фундаментного цикла.</li><li>Ведутся подготовительные работы для монтажа цокольного этажа.</li></div><div><b>Благоустройство территории ЖК \"Новая Конча Заспа\":</b></div><ul><ol><li>Строительство очистных сооружений ЖК \"Новая Конча Заспа\" - продолжается.</li><li>Ведется строительство дороги по улице И. Франка ( перед домом Шатель).</li><li>ЖК \" Новая Конча Заспа\" : <a href=\"https://www.youtube.com/watch?feature=share&utm_source=Viber&utm_campaign=Private&v=rgDGq76IJoU&utm_medium=Chat&app=desktop\">https://www.youtube.com/watch?feature=share&utm_source=Viber&utm_campaign=Private&v=rgDGq76IJoU&utm_medium=Chat&app=desk</a></li></ol><li><a href=\"https://www.youtube.com/watch?feature=share&utm_source=Viber&utm_campaign=Private&v=rgDGq76IJoU&utm_medium=Chat&app=desktop\"></a></li></ul></div><br></p>', 2, 'artc_20170718185249786.jpg', 0, 0, '', '', '', '', '', 1, 1, 0, '2017-07-16 00:00:00', '2018-05-14 10:38:00', NULL),
(37, 'Ждем всех 29 июля  на дне открытых дверей!', '<p><p>29  июля ждем всех  желающих в нашем жилищном комплексе клубного\r\nтипа.</p>\r\n<p>Вы сможете увидеть, как много сделано за последние пол года:\r\nзавершаем  монтаж  крыш,  внутренних\r\nинженерных сетей, ведется  строительство\r\nдороги по улице И. Франка,  начались\r\nработы по планировке и благоустройству территории вокруг ТаунХаусов,  готовятся к  установке детские площадки и зоны отдыха.</p>\r\n<p>В этот  день, рядом с\r\nотделом продаж,  вас будут встречать  очень активные  ходулисты! Будем угощать мороженным,\r\nразыгрывать призы, пить кофе.</p>\r\n<p>По предварительной записи через наш коллцентр (тел. 098\r\n9343434), для вас проведут показ любой интересующей вас квартиры.  Крайне   рекомендуем обратить внимание на тренд этого сезона\r\n— квартиры- «Однодвушки» с \r\nпросторной  кухней-гостинной и\r\nуютной спальней.</p>\r\n\r\n<p>Ждем всех! И самых маленьких!</p><br></p>', 2, 'artc_20170725141453731.jpg', 0, 0, NULL, NULL, '', '', '', 1, 1, 0, '2017-07-25 00:00:00', '2017-08-21 10:46:45', NULL),
(38, 'Ход строительства домов и таунхаусов в нашем комплексе // 30 июля 2017г', '<p></p><div><p><strong>Итоги строительства по дому \"Шатель\" (обе секции)</strong></p></div><div><li>Монтаж стропильой системы крыши в 1-ой секции - продолжается.</li></div><div><li>Внешняя отделка фасада 1, 2 -ой секций -. продолжается.</li></div><div><li>Заканчивается монтаж електрического кабеля в коридорах и на лестнице в подъезде 1-ой секции.</li></div><div><li>Ведуся подготовительные работы для проведения электромонтажных работ во 2- ой секции.</li></div><div><p><strong>Ход строительства по дому \"Лион\"</strong></p></div><div><strong>1-ая секция:</strong></div><div><li>Ведется кладка стен 9-ого этажа.</li><li>Продолжаются работы по устройству технологических отверстий для прокладки канализационных стояков.</li><li>Ведется кладка стен межкомнатных перегородок на 7, 8-ом этажах.</li><li>Ведутся работы по монтажу внутренних инженерных сетей.</li></div><div><p><strong>2-я секция:</strong></p></div><div><li>Продолжаются работы по монтажу монолитной плиты прекрытия 9-ого этажа.</li></div><div><li>Продолжаются работы по монтажу внутренних инженерных сетей.</li></div><div><p><strong>3-я секция:</strong></p></div><div><li>Заканчивается монтаж каркаса монолитного пояса усиления и устройство опалубки.</li><li>Ведутся подготовительные работы для бетонирования монолитного пояса усиления.</li></div><div><p><strong>4-я секция:</strong></p></div><div><li>Заканчивается кладка стен 2- ого этажа.</li><li>Ведется монтаж плит перекрытия 2- ого этажа.</li><li>Началась кладка стен 3- его этажа.<br></li><li>Ведется кладка межкомнатных перегородок на 1 - ом этаже.<br></li></div><div><p><strong>5-я секция:</strong></p><ul><div>Заканчивается монтаж каркаса монолитного пояса усиления цокольного этажа.</div><div>Ведутся подготовительные работы для бетонирования монолитного пояса усиления цокольного этажа.</div></ul><b>6</b><strong>-я секция:</strong><div><ul><li>Продолжается монтаж цокольного этажа.</li><li>Продолжается вязка и сварка каркаса монолитного пояса усиления цокольного этажа.</li></ul></div><div><p><strong>Ход строительства проекта \"Перша Житлова\"</strong></p></div><div><strong>Дом № 1:</strong></div><div><li>Утепление и внешняя отделка фасада продолжается.</li><li>Заканчиваются внутренние электромонтажные работы.</li><li>Ведутся подготовительные работы для установки входных дверей.</li><li>Смонтированы внутренние инженерные системы ( водопровод, канализация, отопление).</li></div><div><strong><strong><strong><strong>Дом № 2:</strong></strong></strong></strong><li>Фундаментная плита гидроизолирована.</li><li>Ведется монтаж цокольного этажа.</li></div><div><b>Благоустройство территории ЖК \"Новая Конча Заспа\":</b></div><div><span style=\"font-size: 12px;\">1. Строительство очистных сооружений ЖК \"Новая Конча Заспа\" - продолжается.</span></div><div><span style=\"font-size: 12px;\">2. Продолжаеются работы по планировке и благоустройству территории вокруг ТаунХаусов, по улице И. Франка.</span></div><div><span style=\"font-size: 12px;\">3. ЖК \" Новая Конча Заспа\" : </span><a href=\"https://www.youtube.com/watch?feature=share&utm_source=Viber&utm_campaign=Private&v=rgDGq76IJoU&utm_medium=Chat&app=desktop\" style=\"font-size: 12px;\">https://www.youtube.com/watch?feature=share&utm_source=Viber&utm_campaign=Private&v=rgDGq76IJoU&utm_medium=Chat&app=desk</a></div></div><p></p>\r\n', 1, 'artc_20170731110846138.jpg', 0, 0, '', '', '', '', '', 1, 1, 0, '2017-07-30 00:00:00', '2018-05-14 10:37:38', NULL),
(49, 'КВАРТИРА УЖЕ ВЕСНОЙ! Новые уникальные форматы только в доме \"Лион\"', '<p></p><p></p><p><img src=\"/myprotected/redactor/demo/scripts/uploads/658d3e8d09f723590e7f132f42910e1b.jpg\" style=\"width: 946.969px; height: 117px;\"></p><p></p><p>Уважаемые дамы и господа!</p><p>Предлагаем вашему вниманию новые форматы квартир - специально оптимизированных для вашего комфортного проживания - евродвушки в доме \"Лион\".</p><p><b>Евродвушка</b> - это квартира, в которой кухня несет функцию двойного назначения - вы можете в ней принимать гостей и проводить время, но ваша спальня всегда остается вашим личным пространством. Планировки наших квартир отличаются рациональным использованием площади, комнаты и кухни правильной формы. </p><p><b>Живите в комфортной среде, уважайте себя и свое пространство!</b></p><p><b>Купить квартиру просто, первый взнос всего 6400$.</b></p><p></p><p></p><p></p><p></p><p></p><p><img src=\"/myprotected/redactor/demo/scripts/uploads/536f5d6bce7c227e3ac7c26c5de06815.jpg\" style=\"\"></p><br><p></p><p></p><p></p><p></p><p></p><p></p><br><div><h2 style=\"text-align: center;\"><a href=\"https://n-k-z.com/flats/shatel/r1/\"></a><a href=\"https://n-k-z.com/flats/lion/r1/\">Посмотреть все планировки дома \"Лион\" можно тут >></a></h2><br></div><div><b>Сдача дома запланирована на 2 квартал 2018г. </b><p></p><h3>                                                                    <b>Генеральный план комплекса</b></h3><p></p><p><img src=\"/myprotected/redactor/demo/scripts/uploads/da616a2fe2ab4b8f56ee036a22c64244.jpg\" style=\"width: 948.509px; height: 349px;\"></p><br><p></p><b>Рекомендуем, также, при выборе квартиры, оценить перспективы направления, где вы присматриваете жилье. Как ваша семья будет добираться к метро, в каких пробках на дорогах уже приходиться стоять и какая перспектива пробок уже через год-два - <a href=\"https://n-k-z.com/news/63/\" target=\"_blank\">смотреть заметку.</a></b><br><p></p>\r\n</div>\r\n', 1, 'artc_20170905114244641.jpg', 0, 0, '', '', '', '', '', 1, 1, 0, '2018-01-09 00:00:00', '2018-06-04 10:57:18', NULL),
(60, 'Ход строительства домов и таунхаусов в нашем комплексе // 15 октября 2017г.', '<p><div><p><strong>Итоги строительства по дому \"Шатель\" (обе секции)</strong></p><ul><li>Заканчивается внешняя отделка фасада по улице И. Франка.</li><li>Заканчиваются работы по оштукатуриванию внутренних стен в 1- ой секции.</li><li>Ведутся работы по устройству примыканий, в местах вывода вентиляционных труб.</li><li>Продолжается монтаж дыиоходов  для  установки газовых котлов.</li><li>Продолжаются работы по устройству стяжки пола в подвале дома \"Шатель\".</li></ul></div><div><p><strong>Ход строительства по дому \"Лион\"</strong></p></div><div> <strong>1-ая секция:</strong></div><div><li>Продолжается вязка и сварка каркаса монолитного силового пояса.</li><li>Ведутся работы по устройству силового пояса.</li><li>Ведутся подготовительные работы для бетонирования силового пояса.</li><li>Продолжается установка оконных блоков на 5 - 8 этажах. </li><li>Продолжается монтаж инженерных внутренних сетей.<br></li><li>Ведется монтаж межкомнатных перегородок на 9- ом этаже.<br></li></div><div><p><strong>2-я секция:</strong></p></div><div><li>Ведется монтаж плит перекрытия 9- ого этажа.</li><li>Ведутся подготовительные работы для кладки стен технического монтажа.</li></div><div><p><strong>3-я секция:</strong></p></div><div><li>Продолжается кладка стен 9-ого этажа.</li><li>Ведется кладка межкомнатных перегородок.</li></div><div><p><strong><strong>4-я секция:</strong></strong></p><div><ul><li>Смонтированы плиты перекрытия 3-ого этажа.</li><li>Ведется кладка стен 4- ого этажа.</li></ul></div><p><strong>5-я секция:</strong></p></div><div><li>Силовой пояс 3- его этажа - забетонирован.</li><li>Ведутся подготовительные работы для монтажа плит перекрытия 3-его этажа.</li></div><div><p><strong><strong>6-я секция:</strong></strong></p><ul><li>Продолжается кладка стен 1- ого этажа.</li><li>Ведутся подготовительные работы для монтажа плит перекрытия 1- ого этажа.</li></ul><p><strong><strong>Ход строительства проекта \"Vlasna\"</strong></strong></p></div><div><strong><strong>Дом № 1:</strong></strong></div><div><li>Продолжается внешняя отделка стен фасада и установка балконных ограждений.</li><li>Ведутся подготовительные работы для установки входных дверей в квартиры.</li><li>Ведутся подготовительные работы для отделки внутренних помещений подъезда и лестницы.</li><li>Ведутся подготовительные работы для подключения дома к к водопроводной системе и канализационной системы.<br></li></div><div><p><strong><strong><strong><strong><strong><strong><strong>Дом № 2:</strong></strong></strong></strong></strong></strong></strong></p><ul><li>Заканчивается кладка стен 2-ого этажа.</li><li>Ведутся подготовительные работы для монтажа плит перекрытия 2- ого этажа.</li></ul><p><strong><strong><strong>Благоустройство территории ЖК \"Новая Конча Заспа\"</strong></strong></strong></p><ol><li>Продолжается строительстве очистных сооружений ЖК \"Новая Конча Заспа\".( фото № 8).</li><li>Продолжается монтаж и строительство детской площадки между домами Линц и Грац.( фото № 7).</li><li>Ведется благоустройство дороги по улице И. Франка от дома Щатель к дому \"1-а Житлова\". (фото № 5).</li><li>ЖК \" Новая Конча Заспа\" : <a href=\"https://www.youtube.com/watch?feature=share&utm_source=Viber&utm_campaign=Private&v=rgDGq76IJoU&utm_medium=Chat&app=desktop\">https://www.youtube.com/watch?feature=share&utm_source=Viber&utm_campaign=Private&v=rgDGq76IJoU&utm_medium=Chat&app=desk</a></li><li><a href=\"https://www.youtube.com/watch?feature=share&utm_source=Viber&utm_campaign=Private&v=rgDGq76IJoU&utm_medium=Chat&app=desktop\"></a></li><li><a href=\"https://www.youtube.com/watch?feature=share&utm_source=Viber&utm_campaign=Private&v=rgDGq76IJoU&utm_medium=Chat&app=desktop\"></a></li></ol></div><div><b>Правила посещения строительного объекта:</b></div><div><ol><li>Запрещено посещение объекта в активные рабочие дни: понедельник - суббота.</li><li>Посещать объект следует  в субботу , согласно календаря,  с 16.00 до 19.00.</li><li>В воскресенье с 10.00 до 19.00.</li><li>Инвесторы должны быть обеспечены строительными касками ( каски следует получить в отделе продаж).</li><li>Допуск детей на строительный объект строго запрещен.</li><li>Посещение объекта должно происходить в сопровождении сотрудника отдела продаж.</li></ol></div><div><b>\"Ваша безопасность в соблюдении простых правил\". Спасибо.</b></div><br></p>', 1, 'artc_20171030131834645.jpg', 0, 0, '', '', '', '', '', 1, 1, 0, '2017-10-15 00:00:00', '2018-05-14 10:35:14', NULL),
(59, 'Открыты продажи в новом доме клубного формата «Живадом»', '<p></p><p>&nbsp;Это жилой кирпичный дом с собственным бассейном и зоной барбекю. В доме всего 8\r\nквартир, каждая общей площадью 115м<sup>2</sup>. Благодаря\r\nфункциональному зонированию, квартиры разделены на две части: первая - гостевая\r\nзона с уютной кухней, большим санузлом, просторной гостиной с камином и широкой\r\nлоджией, и вторая – личное пространство для детей и родителей - детская и\r\nспальня с вместительной гардеробной и санузлом. </p>\r\n<p>В комплектацию квартиры входит: металлические\r\nвходные двери и межкомнатные двери, подвесной потолок, полы с подогревом в\r\nкухне, коридоре, ванных комнатах, два санузла с сантехникой и отделкой дорогой\r\nкерамической плиткой, итальянский двухконтурный котел для отопления и горячей\r\nводы, ламинат в комнатах и напольная плитка в коридоре, кухне и балконе.</p>\r\n<p>Мы\r\nгарантируем высокое качество строительных и отделочных материалов – толщина\r\nстен 50 см – они сохранят прохладу летом и тепло зимой, керамическая черепица,\r\nкрасный кирпич, минвата на базальтовой основе - все отделочные материалы только\r\nэкологически чистые.</p>\r\n<p>Сдача\r\nдома в эксплуатацию – декабрь 2017 года. Стоимость до конца месяца – 550\r\nуе/кв.м.</p>\r\n<p>По\r\nдополнительным вопросам и записи на просмотр квартиры звоните по телефонам\r\nнашего коллцентра или оператору чата.</p><p></p>\r\n', 1, 'artc_20171024153639498.jpg', 0, 0, NULL, NULL, '', '', '', 1, 1, 0, '2017-10-24 00:00:00', '2017-11-07 12:58:47', NULL),
(39, 'ЖК Новая Конча-Заспа  продолжает знакомить со звездными соседями', '<p><p>ЖК Новая Конча-Заспа&nbsp;\r\nпродолжает знакомить со звездными соседями.</p>\r\n\r\n<p>30 июля. в «День открытых дверей», у нас появился новый\r\nжитель - Евгений Хмара!- &nbsp;украинский\r\nкомпозитор, пианист - виртуоз, обладатель Голливудской премии импровизаторов. </p>\r\n\r\n<p>Творчество Евгения &nbsp;привлекает не только меломанов, но и звезд, и\r\nвсех тонко ощущающих мир личностей. В 2004 году он работает с Олегом Скрипкой,\r\nКонстантином Меладзе, Sonique (France) и Barbara Tucker (USA). Телевизионное\r\nшоу «Україна має талант» знакомит нас с магией композиций «Сказка», «Волшебные\r\nчасы» и «Глубина», а Евгения после него узнает вся страна.</p>\r\n\r\n<p>Мы рады знакомству и новому жильцу.</p>\r\n\r\n<p>Присоединяйтесь!</p>\r\n<p>Слушаем волшебное исполнение и наслаждаемся</p><iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/1rSj4U9RqtQ\" frameborder=\"0\" allowfullscreen=\"\"></iframe><br></p>', 2, 'artc_20170802143504963.jpg', 0, 0, NULL, NULL, '', '', '', 1, 0, 0, '2017-08-02 14:35:04', '2017-08-02 14:35:04', NULL),
(40, 'Ход строительства домов и таунхаусов в нашем комплексе // 6 августа 2017г.', '<p></p><div><p><strong>Итоги строительства по дому \"Шатель\" (обе секции)</strong></p></div><div><li>Продолжается монтаж стропильой системы крыши в 1-ой секции.</li><li>Внешняя отделка фасада 1, 2 -ой секций -. продолжается.</li><li>Ведутся электромонтажные работы во 2-ой секции.</li></div><div><p><strong>Ход строительства по дому \"Лион\"</strong></p></div><div> <strong>1-ая секция:</strong></div><div><li>Продолжается кладка стен 9-ого этажа.</li></div><div><li>Продолжается монтаж внутренних инженерных систем ( водопровод, канализация, отопление).</li></div><div><p><strong>2-я секция:</strong></p></div><div><li>Работы по монтажу монолитной плиты перекрытия 9-ого этажа - продолжается.</li></div><div><li>Ведется монтаж систем отопления, водопровода и канализации.</li></div><div><p><strong>3-я секция:</strong></p></div><div><li>Устройство монолитного пояса усиления 6-ого заканчивается.</li></div><div><li>Ведутся подготовительные работы для монтажа плит перекрытия 6- ого этажа.</li></div><div><p><strong>4-я секция:</strong></p></div><div><li>Ведется кладка стен 3- его этажа.</li></div><div><li>Ведутся подготовительные работы для вязки и сварки каркаса монолитного пояса усиления 3- его этажа.</li></div><div><p><strong>5-я секция:</strong></p></div><div><li>Заканчивается устройство монолитного пояса усиления цокольного этажа.</li></div><div><li>Ведутся подготовительные работы для монтажа плит перекрытия цокольного этажа.</li></div><div><p><strong><strong>6-я секция:</strong><br></strong></p><p></p><ul><li>Заканчивается монтаж монолитного пояса усиления цокольного этажа.<br></li><li>Ведутся подготовительные работы для вязки и сварки каркаса монолитного пояса усиления цокольного этажа.<br></li></ul><p></p><p><strong>Ход строительства проекта \"Перша Житлова\"</strong></p></div><div><strong>Дом № 1:</strong></div><div><li>Утепление и внешняя отделка фасада продолжается.</li><li>Ведутся подготовительные работы для подключения дома к внешним коммунальным сетям ( водопровод, канализация, электричество, газ).</li></div><div><p><strong><strong>Дом № 2:</strong><br></strong></p><p></p><ul><li>Продолжается монтаж цокольного этажа.</li><li>Ведутся подготовительные работы для вязки каркаса монолитного пояса усиления.</li><li><br></li></ul><p></p><p><strong>Благоустройство территории ЖК \"Новая Конча Заспа\"</strong></p><p></p><ul><li><ol><li>Строительство очистных сооружений ЖК \"Новая Конча Заспа\" - продолжается - ведется вязка каркаса стен.</li><li>Ведется реконструкция и ремонт пешеходной дорожки вдоль дома \"Шатель\" ( фото № 6).</li><li>Продолжается строительство объездных путей вокруг таунхаусов ( установка бордюров, устройство подушки).</li><li>ЖК \" Новая Конча Заспа\" : <a href=\"https://www.youtube.com/watch?feature=share&utm_source=Viber&utm_campaign=Private&v=rgDGq76IJoU&utm_medium=Chat&app=desktop\" style=\"font-size: 12px;\">https://www.youtube.com/watch?feature=share&utm_source=Viber&utm_campaign=Private&v=rgDGq76IJoU&utm_medium=Chat&app=desk</a></li></ol></li></ul></div>\r\n', 2, 'artc_20170807150819750.jpg', 0, 0, '', '', '', '', '', 1, 1, 0, '2017-08-07 00:00:00', '2018-05-14 10:37:07', NULL),
(41, 'Ход строительства домов и таунхаусов в нашем комплексе // 13 августа 2017г.', '<p></p><div><p><strong>Итоги строительства по дому \"Шатель\" (обе секции)</strong></p><p></p><ul><li>Заканчивается монтаж стропильной системы крыши в 1-ой секции.<br></li><li>Ведутся подготовительные работы для устройства гидроизоляции, пароизоляции и утепления крыши в 1-ой секции.  <br></li><li>Продолжается внешняя отделка фасада 1, 2 -ой секций.<br></li></ul><p></p></div><div><p><strong>Ход строительства по дому \"Лион\"</strong></p></div><div> <strong>1-ая секция:</strong></div><div><li>Ведется кладка стен 9-ого этажа.</li><li>Ведется монтаж внутренних инженерных систем ( водопровод, канализация, отопление).<br></li></div><div><p><strong>2-я секция:</strong></p></div><div><li>Ведутся работы по монтажу монолитной плиты перекрытия 9- ого этажа.</li></div><div><li>Ведется монтаж систем отопления, водопровода и канализации.</li></div><div><p><strong>3-я секция:</strong></p></div><div><li>Монолитный пояс усиления 6-ого этажа забетонирован.</li></div><div><li>Проведены подготовительные работы для монтажа плит перекрытия 6- ого этажа.</li></div><div><p><strong>4-я секция:</strong></p></div><div><li>Заканчивается кладка стен 3- его этажа.</li></div><div><li>Ведутся подготовительные работы для вязки и сварки каркаса монолитного пояса усиления 3- его этажа.</li></div><div><p><strong>5-я секция:</strong></p></div><div><li>Выполнен монолитный пояс усиления цокольного этажа.</li></div><div><li>Ведутся подготовительные работы для кладки стен 1- ого этажа.</li></div><div><p><strong><strong>6-я секция:</strong></strong></p><ul><li>Заканчивается монтаж цокольного этажа.</li><li>Продолжаются подготовительные работы для вязки и сварки каркаса монолитного пояса усиления цокольного этажа.</li></ul><p><strong><strong>Ход строительства проекта \"Перша Житлова\"</strong></strong></p></div><div><strong><strong>Дом № 1:</strong></strong></div><div><li>Утепление и внешняя отделка фасада продолжается.</li><li>Ведутся подготовительные работы для подключения дома к внешним коммунальным сетям ( водопровод, канализация, электричество, газ).</li></div><div><p><strong><strong><strong>Дом № 2:</strong></strong></strong></p><ul><li>Продолжается монтаж цокольного этажа.</li><li>Ведутся подготовительные работы для вязки каркаса монолитного пояса усиления.</li></ul><p><strong><strong><strong>Благоустройство территории ЖК \"Новая Конча Заспа\"</strong></strong></strong></p><ul><li><ol><li>Строительство очистных сооружений ЖК \"Новая Конча Заспа\" - продолжается - ведется вязка каркаса стен.</li><li>Ведется реконструкция и ремонт пешеходной дорожки вдоль дома \"Шатель\" ( фото № 6).</li><li>Продолжается строительство объездных путей вокруг таунхаусов ( установка бордюров, устройство подушки).</li><li>ЖК \" Новая Конча Заспа\" :<strong style=\"font-weight: bold;\"> <a href=\"https://www.youtube.com/watch?feature=share&utm_source=Viber&utm_campaign=Private&v=rgDGq76IJoU&utm_medium=Chat&app=desktop\">https://www.youtube.com/watch?feature=share&utm_source=Viber&utm_campaign=Private&v=rgDGq76IJoU&utm_medium=Chat&app=desk</a></strong></li></ol></li></ul></div><p></p>\r\n', 2, 'artc_20170815124428808.jpg', 0, 0, '', '', '', '', '', 1, 1, 0, '2017-08-13 00:00:00', '2018-05-14 10:37:18', NULL),
(45, 'Ход строительства домов и таунхаусов в нашем комплексе // 20 августа 2017г.', '<p></p><div><p><strong>Итоги строительства по дому \"Шатель\" (обе секции)</strong></p><ul><li>Ведется монтаж стропильной системы крыши в 1-ой секции.</li><li>Продолжаются работы для устройства гидроизоляции, пароизоляции и утепления крыши в 1-ой секции.  </li><li>Продолжается внешняя отделка фасада 1, 2 -ой секций.</li></ul></div><div><p><strong>Ход строительства по дому \"Лион\"</strong></p></div><div> <strong>1-ая секция:</strong></div><div><li>Заканчивается кладка стен 9-ого этажа.</li><li>Продолжается монтаж внутренних инженерных систем ( водопровод, канализация, отопление).</li></div><div><p><strong>2-я секция:</strong></p></div><div><li>Ведутся подготовительные работы по монтажу монолитной плиты перекрытия 9- ого этажа.</li></div><div><li>Продолжается монтаж систем отопления, водопровода и канализации.</li></div><div><p><strong>3-я секция:</strong></p></div><div><li>Смонтированы плиты перекрытия 6- ого этажа.</li></div><div><li>Ведется выкладка стен 7- ого тажа.</li></div><div><p><strong>4-я секция:</strong></p></div><div><li>Закончена кладка стен 3- его этажа.</li></div><div><li>Ведется монтаж каркаса силового пояса усиления 3- его этажа.</li></div><div><p><strong>5-я секция:</strong></p></div><div><li>Выполнен монтаж плит перекрытия плит цокольного этажа.</li></div><div><li>Ведется кладка стен 1- ого этажа.</li></div><div><p><strong><strong>6-я секция:</strong></strong></p><ul><li>Заканчивается монтаж цокольного этажа.</li><li>Продолжаются подготовительные работы для вязки и сварки каркаса монолитного пояса усиления цокольного этажа.</li></ul><p><strong><strong>Ход строительства проекта \"Перша Житлова\"</strong></strong></p></div><div><strong><strong>Дом № 1:</strong></strong></div><div><li>Ведется утепление и отделка внешнего фасада.</li><li>Ведется монтаж электроавтоматов в узлах электрического учета.</li><li>Ведется монтаж водомеров в узлах водяного учета.</li><li>Ведется монтаж радиаторов.</li></div><div><p><strong><strong><strong><strong><strong>Ход строительства проекта \"Власна\"</strong></strong></strong></strong></strong></p><p><strong><strong><strong><strong><strong><strong><strong>Дом № 1:</strong></strong><br></strong></strong></strong></strong></strong></p><ol><li>Монтаж цокольного этажа - выполнен.</li><li>Заканчиваются работы по гидроизоляции и утеплению цокольного этажа.</li><li>Смонтирован силовой пояс усиления цокольного этажа.</li><li>Ведутся подготовительные работы для монтажа плит перекрытия цокольного этажа.</li></ol><p><strong><strong><strong>Благоустройство территории ЖК \"Новая Конча Заспа\"</strong></strong></strong></p><p></p><ol><li>Продолжается вязка каркаса стен на строительстве очистных сооружений ЖК \"Новая Конча Заспа\"<br></li><li>Заканчивается реконструкция и ремонт пешеходной дорожки вдоль дома \"Шатель\" ( фото № 7).<br></li><li>Ведется строительство дороги по улице И. Франка от дома Щатель к дому \"1-а Житлова\". (фото № 6).<br></li><li>ЖК \" Новая Конча Заспа\" : <a href=\"https://www.youtube.com/watch?feature=share&utm_source=Viber&utm_campaign=Private&v=rgDGq76IJoU&utm_medium=Chat&app=desktop\" style=\"font-size: 12px;\">https://www.youtube.com/watch?feature=share&utm_source=Viber&utm_campaign=Private&v=rgDGq76IJoU&utm_medium=Chat&app=desk</a></li></ol></div><div><b>Правила посещения строительного объекта:</b></div><div><ol><li>Запрещено посещение объекта в активные рабочие дни: понедельник - суббота.<br></li><li>Посещать объект следует  в субботу , согласно календаря,  с 16.00 до 19.00.<br></li><li>В воскресенье с 10.00 до 19.00.<br></li><li>Инвесторы должны быть обеспечены строительными касками ( каски следует получить в отделе продаж).<br></li><li>Допуск детей на строительный объект строго запрещен.<br></li><li>Посещение объекта должно происходить в сопровождении сотрудника отдела продаж.<br></li></ol></div><div><div><b>\"Ваша безопасность в соблюдении простых правил\". Спасибо.</b></div><p></p>\r\n</div>\r\n', 2, 'artc_20170821143326975.jpg', 0, 0, '', '', '', '', '', 1, 1, 0, '2017-08-20 00:00:00', '2018-05-14 10:36:55', NULL);
INSERT INTO `osc_page_news_items` (`id`, `caption`, `details`, `template`, `preview`, `cat`, `is_top`, `special_text`, `tags`, `meta_title`, `meta_keys`, `meta_desc`, `is_index`, `block`, `order_id`, `dateCreate`, `dateModify`, `adminMod`) VALUES
(44, 'ДОБРО ПОЖАЛОВАТЬ В КЛУБНУЮ ПРОГРАММУ ЖИЛЬЦОВ «НОВАЯ КОНЧА – ЗАСПА»', '<p></p><div>\r\n\r\n<p><b>КАК ЭТО РАБОТАЕТ</b><br></p><p><b>Шаг 1.</b></p>\r\n\r\n<p>Стань жильцом комплекса «Новая\r\nКонча-Заспа»</p>\r\n<hr>\r\n<p><b>Шаг 2.</b></p>\r\n\r\n<p>Обратиться в клиентский отдел по телефону горячей линии </p>\r\n\r\n<p></p>(093) 708 8566<p></p>\r\n<hr>\r\n<p><b>Шаг 3.</b></p>\r\n\r\n<p>Получить &nbsp;«Клубную карту»</p>\r\n<hr>\r\n<p><b>Шаг 4.</b></p>\r\n\r\n<p>Следить за всеми привилегиями,\r\nкоторые &nbsp;дает закрытое сообщество на сайте&nbsp; &nbsp; </p>\r\n\r\n<p>Или&nbsp;\r\nузнавать по телефону&nbsp;\r\n(093) 708 8566</p>\r\n<hr>\r\n<p><b>Наши клубные партнеры:</b></p><p></p><p><img src=\"/myprotected/redactor/demo/scripts/uploads/42b4dae03a760e42fce595014c097a02.jpg\" style=\"width: 282.855px; height: 83px;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</p><p>Клиника Мануфактура - 10% скидка<br></p><hr><p>&nbsp;&nbsp;&nbsp;<img src=\"https://n-k-z.com/myprotected/redactor/demo/scripts/uploads/b00fd829bfd246dc77cc2ef98a460861.jpg\" style=\"font-size: 12px; width: 215.358px; height: 89px;\"></p><div>Дельта план фитнес клуб - 5%&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<span style=\"font-size: 12px;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span></div><div><div>бассейн- 5%&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<span style=\"font-size: 12px;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span></div></div><div>тренажерный зал - 5%&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</div>\r\n<hr>\r\n<div><p><img src=\"/myprotected/redactor/demo/scripts/uploads/d5259a118cc9f62878c8adb36ba28f74.jpg\" style=\"width: 289.968px; height: 140px;\"></p>Товарищ &amp; Маузер тир - 5%<br></div>\r\n<hr>\r\n<div><p><img src=\"/myprotected/redactor/demo/scripts/uploads/108812cbc867524a270a218b61a6679b.jpg\" style=\"width: 312px; height: 208px;\"></p><p>Баттерфляй кинотеатр - 5%</p></div><p>\r\n</p><hr><p><img src=\"/myprotected/redactor/demo/scripts/uploads/afc3f7d73455f33c7897b77e07d9d1b2.jpg\" style=\"width: 277.574px; height: 233px;\"></p>Кафе \"Дельтаплан\" - 5%<br></div><div><hr><p><img src=\"/myprotected/redactor/demo/scripts/uploads/8df1c5936c0cafcdb4b35abb7367e8ca.jpg\" style=\"width: 271.458px; height: 94px;\"></p><p>Ресторан \"Траттория\" - 5%<br></p><hr><p></p><p><img src=\"/myprotected/redactor/demo/scripts/uploads/162f5e26039b5a764ddf1a3ea37af6e9.jpg\" style=\"width: 260.944px; height: 61px;\"></p><p></p><p></p><div>Интернет-магазин климатического оборудования \"Климат Ленд\" - 10%<span style=\"font-size: 12px;\">&nbsp;</span></div><div><hr><p><img src=\"/myprotected/redactor/demo/scripts/uploads/0610e25d580d7b2782d2abc16e755312.jpg\" style=\"width: 295.087px; height: 172px;\"></p><p>Мед. центр \"Ренесанс\" (Стоматология) - от 10% до 25%</p><hr><p><img src=\"/myprotected/redactor/demo/scripts/uploads/8b915ad5ec482a9df0e570fb9ebda291.jpg\" style=\"width: 305.006px; height: 153px;\"></p><p>Эпицентр&nbsp; — сеть строительно-хозяйственных гипермаркетов - 10%<br></p></div><p></p></div><div><b>Присоединяйтесь!!!</b></div><p></p>\r\n', 1, 'artc_20170907132350900.jpg', 0, 0, '', '', '', '', '', 1, 0, 0, '2018-03-09 00:00:00', '2018-03-21 12:58:21', NULL),
(85, 'Живи в исторически успешном направлении. Вся элита здесь.', '<p></p><p>Не пытайтесь найти Конча-Заспу\r\nна карте. Конча-Заспа — не административная единица, а понятие. Она давно стала\r\nсимволом роскоши, богатства и высокого положения в обществе. </p>\r\n\r\n<p>Многие известные исторические фигуры и духовные лидеры,\r\nочень серьезно относились к месту своего обитания. Их выбор в пользу Конча-Заспы\r\nбыл сделан неспроста, ведь климатические, географические и высокоэнергетические\r\nпоказатели этого региона выгодно отличали его от остальных земель. </p>\r\n\r\n<p>Все последующие поколения людей «власть имущих» включали\r\nв список предпочтений именно это неуловимое, но ощутимое преимущество энергетического\r\nблагополучия при поиске места для своих резиденций. </p>\r\n\r\n<p>С. Ходосеевка, по преданию, основана преподобным Феодосием\r\n– православным святым, основоположником монашества на Руси. Во время Великого поста\r\nФеодосий Печерский уединялся в этих местах для молитвы, здесь же и был построен\r\nпещерный храм в его честь. Эта земля имела славу места с Божьим покровительством.</p>\r\n\r\n<p><b>Жилой комплекс &nbsp;«Новая Конча-Заспа» собрал все лучшие качества:\r\nрасположился в историческом месте, соседи -&nbsp;\r\nстоличная элита, удобная локация – правительственная трасса без пробок,\r\nметро – в 15 минутах езды.</b></p>\r\n\r\n<p><b>Предпочтения покупателей\r\nпервичного жилья&nbsp; все больше смещаются в сторону\r\nклассического престижного пригорода. Историческая ценность направления, &nbsp;аутентичность домов &nbsp;в совокупности &nbsp;с &nbsp;продуманной\r\nорганизацией пространства и готовой насыщенной инфраструктурой&nbsp; становятся&nbsp;\r\nконкурентным преимуществом, которое&nbsp;\r\nопределяет успех проекта </b></p>\r\n\r\n<p></p>\r\n\r\n<p></p>\r\n\r\n<p><b>Оцените наши преимущества:</b></p>\r\n\r\n<p>Месторасположение – какие просторы и все рядом! </p><p></p><p><img src=\"/myprotected/redactor/demo/scripts/uploads/dc1d76b5f2b336b3379ba5dbf187ee01.jpg\" style=\"\"></p><p></p>\r\n\r\n<p>\r\n\r\n</p><p>Историческое место - Храм Феодосия Печерского и монастырь\r\n(второй по значимости монастырь, после Киево-Печерской Лавры)</p><p></p><p><img src=\"/myprotected/redactor/demo/scripts/uploads/0d2b2ede87c29894bac90ee9f317f4d5.jpg\" style=\"width: 639.721px; height: 414px;\"></p><p></p>\r\n\r\n<p>\r\n</p><p>До Печерска – 15 минут (<a href=\"https://n-k-z.com/news/82/\"><span>https://n-k-z.com/news/82/</span></a> )</p><p></p><p><img src=\"/myprotected/redactor/demo/scripts/uploads/f8a560d3cd009f811cca76c301464aa7.jpg\" style=\"\"></p><p></p>\r\n\r\n<p>\r\n\r\n</p><p>Архитектура </p><p></p><p><img src=\"/myprotected/redactor/demo/scripts/uploads/ad90e893a433e8b008ccfde2fa9443ac.jpg\" style=\"width: 639.11px; height: 311px;\"></p><p></p>\r\n\r\n<p>\r\n</p><p>Наличие &nbsp;многообразной,\r\nдавно сложившейся инфраструктуры</p><p></p><p><img src=\"/myprotected/redactor/demo/scripts/uploads/1877a5a4bdec675fc93fe08803e09bc8.jpg\" style=\"\"></p><p></p><p><img src=\"/myprotected/redactor/demo/scripts/uploads/2b573acab8ea7db7248a2068a8dcbd2e.jpg\" style=\"width: 635.774px; height: 365px;\"></p><p></p><p></p>\r\n\r\n<p>\r\n\r\n</p><p>\r\n</p><p>Так что, называя своим\r\nадресом ЖК «Новая Конча-Заспа», вы даете координаты престижного классического пригорода&nbsp; &nbsp;и программируете\r\nсвою судьбу на благоприятное развитие.</p>\r\n\r\n<p>Присоединяйтесь!</p><p></p>\r\n', 1, 'artc_20180313144920721.jpg', 6, 0, '', '', '', '', '', 1, 0, 0, '2018-03-13 00:00:00', '2018-03-17 14:29:45', NULL),
(46, 'ЖК \"Новая Конча-Заспа\"  приглашает на «Яблочный Weekend» 24, 25, 26 и 27 августа', '<p><p><b>Дамы и господа!</b></p>\r\n\r\n<p>с 10.00 до 20.00 приглашаем всех в наш отдел продаж! </p>\r\n<p>Каждый день, для наших гостей и друзей:</p>\r\n\r\n<p>Возле отдела продаж:</p>\r\n\r\n<p>- работает профессиональный&nbsp;\r\nDJ</p>\r\n\r\n<p>- угощаем медом и яблоками</p>\r\n\r\n<p>- всем&nbsp; прохладные\r\nнапитки и мороженое</p>\r\n<p>В отделе продаж:</p>\r\n\r\n<p>- консультируют профессиональные менеджеры</p>\r\n\r\n<p>- беспроигрышная лотерея (электротовары)</p>\r\n<p>На территории Аутлет- городка Мануфактура:</p>\r\n\r\n<p>Ежедневные развлечения для детей:</p>\r\n\r\n<p>глиттер и флеш тату</p>\r\n\r\n<p>шоу мыльных пузырей</p>\r\n\r\n<p>надувные горки с бассейнами</p>\r\n\r\n<p>весёлые конкурсы с интересными призами</p>\r\n\r\nНа протяжении всего праздника Вас ожидает вкуснейшее\r\nугощение напитками и разнообразными блюдами из яблок.<br></p>', 1, 'artc_20170821145308332.jpg', 0, 0, NULL, NULL, '', '', '', 1, 0, 0, '2017-08-21 14:53:08', '2017-08-21 14:53:08', NULL),
(47, 'Предлагаем хиты продаж - квартиры с двориком!', '<p>С радостью сообщаем нашим будущим клиентам о запуске в продажу квартир с двориками.&nbsp;</p><p>Эти квартиры будут располагаться на 1-ых этажах в домах нового проекта жилого комплекса \"Власна\".&nbsp;</p><p>На выбор предлагаются 1-к, 2-к и 3-к квартиры с собственным двориком.&nbsp;</p><p>Только в сентябре действует акционная цена 13500 грн/м. Спешите, кол-во квартир с двориками ограничено!<br></p><p>С планировками квартир вы можете ознакомится ниже.&nbsp;<br></p><p><b>1-к квартира с двориком, общий метраж 40 кв.м., стоимость 512 000грн.</b></p><p><img src=\"/myprotected/redactor/demo/scripts/uploads/ead311d291ff52778abc6fb3cb188c26.jpg\" style=\"width: 277.669px; height: 426px;\"></p><p></p><p><b>2-к квартира с двориком, общий метраж 70 кв.м., стоимость 896 000грн.</b></p><p></p><p><img src=\"/myprotected/redactor/demo/scripts/uploads/aa7e70b1328c9ddb31a41016f37c65e3.jpg\" style=\"width: 470.632px; height: 272px;\"></p><p><b>3-к квартира с двориком,общий метраж 84 кв.м., стоимость 1 075 200грн.</b></p><p style=\"display: inline !important;\"><img src=\"/myprotected/redactor/demo/scripts/uploads/7acce868a6231c6309c0cefeef6c242e.jpg\" style=\"width: 482.233px; height: 279px;\"></p><p></p><p><b><br></b></p><p><br></p><br><p></p><p><br></p><p><br></p>\r\n', 1, 'artc_20170919175503198.jpg', 0, 0, NULL, NULL, '', '', '', 1, 0, 0, '2017-08-31 00:00:00', '2017-09-20 10:08:32', NULL),
(48, 'Новинка! Двухуровневые квартиры с террасами и панорамным видом!', '<p></p><p>С радостью сообщаем нашим будущим клиентам о запуске в продажу двухуровневых квартир с террасами. </p><p>Эти квартиры будут располагаться на 6-ых и 7-ых этажах в домах нового проекта жилого комплекса \"Власна\". </p><p>На выбор предлагаются 3-к и 4-к двухуровневые квартиры с собственными террасами. </p><p>Только до конца этого месяца действует акционная цена 12800 грн/м. Спешите, кол-во двухуровневых квартир с террасами ограничено!</p><p>С планировками квартир вы можете ознакомится ниже.</p><p><b>3-к двухуровневая квартира с террасой, общий метраж 124 кв.м. </b></p><p><b>Стоимость: 1 587 200грн.</b><br></p><p><b></b></p><p><b><img src=\"/myprotected/redactor/demo/scripts/uploads/11267862c5e045d9a56dbc4add2a5475.jpg\" style=\"width: 477.317px; height: 194px;\"></b></p><p><b><b>4-к двухуровневая квартира с террасой, общий метраж 115 кв.м. </b></b></p><p><b><b>Стоимость: 1 472 000грн.</b><br></b></p><p><b><b></b></b></p><p><b><b><img src=\"/myprotected/redactor/demo/scripts/uploads/ce35d981ac84e69af354f6629e3d6fa6.jpg\" style=\"width: 473.653px; height: 214px;\"></b></b></p><p><b><b><b></b></b></b></p><p><b><b><b><b>4-к двухуровневая квартира с террасой, общий метраж 124 кв.м. </b></b></b></b></p><p><b><b><b><b>Стоимость: <b>1 587 200грн.</b></b></b></b></b></p><p><b><b><b></b></b></b></p><p><b><b><b><img src=\"/myprotected/redactor/demo/scripts/uploads/f036e65ad3421142a35a8c51befe5f6f.jpg\" style=\"width: 467.813px; height: 165px;\"></b></b></b></p><p></p><p></p><p></p><p></p><p></p>\r\n', 1, 'artc_20170901111306612.jpg', 0, 0, NULL, NULL, '', '', '', 1, 0, 0, '2017-09-01 00:00:00', '2017-09-05 12:59:09', NULL),
(50, 'Ход строительства домов и таунхаусов в нашем комплексе // 2 сентября 2017г.', '<p><div><p><strong>Итоги строительства по дому \"Шатель\" (обе секции)</strong></p><ul><li>Продолжается монтаж пароизоляции, гидроизоляции и утепление крыши в 1-ой секции.</li><li>Заканчивается утепление внешнего фасада дома. </li><li>Продолжается оштукатуривание и окраска  внешнего фасада 1, 2 -ой секций</li></ul></div><div><p><strong>Ход строительства по дому \"Лион\"</strong></p></div><div> <strong>1-ая секция:</strong></div><div><li>Закончена кладка стен 9-ого этажа.</li><li>Ведется вязка и сварка каркаса силового пояса усиления.</li><li>Ведутся подготовительные работы для монтажа плит перекрытия 9- ого этажа.<br></li><li>Продолжается монтаж внутренних инженерных сетей.<br></li></div><div><p><strong>2-я секция:</strong></p></div><div><li>Ведется вязка и сварка каркаса силового пояса усиления.</li></div><div><li>Продолжается монтаж внутренних инженерных сетей.<br></li></div><div><p><strong>3-я секция:</strong></p></div><div><li>Продолжается кладка стен 7- ого этажа.</li><strong style=\"font-size: 12px;\">4-я секция:</strong><br></div><div><li>Ведется вязка и сварка каркаса силового пояса усиления.3- его этажа.</li></div><div><li>Ведутся подготовительные работы для монтажа плит перекрытия 3- ого этажа.</li></div><div><p><strong>5-я секция:</strong></p></div><div><li>Выполнен монтаж плит перекрытия плит 1- ого этажа.</li></div><div><li>Ведется кладка стен 2- ого этажа.</li></div><div><p><strong><strong>6-я секция:</strong></strong></p><ul><li>Ведется вязка и сварка каркаса силового пояса усиления.цокольного этажа.</li><li>Ведутся подготовительные работы для монтажа плит перекрытия цокольного этажа.</li></ul><p><strong><strong>Ход строительства проекта \"Перша Житлова\"</strong></strong></p></div><div><strong><strong>Дом № 1:</strong></strong></div><div><li>Продолжается утепление, оштукатуривание и окраска внешнего фасада.</li><li>Ведется установка балконных ограждений.</li><li>Ведется монтаж внутренней назовой разводки.</li><li>Заканчивается монтаж радиаторов.</li></div><div><p><strong><strong><strong><strong><strong>Ход строительства проекта \"Vlasna\"</strong></strong></strong></strong></strong></p><p><strong><strong><strong><strong><strong><strong><strong>Дом № 1:</strong></strong></strong></strong></strong></strong></strong></p><p><ul><li>Монтаж цокольного этажа - выполнен.</li><li>Работы по гидроизоляции и утеплению цокольного этажа - выполнены.</li><li>Выполнено устройство \"гидравлического замка\" по периметру дома.</li><li>Ведутся подготовительные работы для монтажа плит перекрытия цокольного этажа.</li></ul></p><p><strong><strong><strong>Благоустройство территории ЖК \"Новая Конча Заспа\"</strong></strong></strong></p><ol><li></li><ol><li>Строительстве очистных сооружений ЖК \"Новая Конча Заспа\" - продолжается.</li><li>Ведется монтаж и строительство детской площадки между домами Линц и Грац.( фото № 5).</li><li>Продолжается благоустройство дороги по улице И. Франка от дома Щатель к дому \"1-а Житлова\". (фото № 6).</li><li>ЖК \" Новая Конча Заспа\" : <a href=\"https://www.youtube.com/watch?feature=share&utm_source=Viber&utm_campaign=Private&v=rgDGq76IJoU&utm_medium=Chat&app=desktop\">https://www.youtube.com/watch?feature=share&utm_source=Viber&utm_campaign=Private&v=rgDGq76IJoU&utm_medium=Chat&app=desk</a></li></ol><li><a href=\"https://www.youtube.com/watch?feature=share&utm_source=Viber&utm_campaign=Private&v=rgDGq76IJoU&utm_medium=Chat&app=desktop\"></a></li></ol></div><div><b>Правила посещения строительного объекта:</b></div><div><ol><li>Запрещено посещение объекта в активные рабочие дни: понедельник - суббота.</li><li>Посещать объект следует  в субботу , согласно календаря,  с 16.00 до 19.00.</li><li>В воскресенье с 10.00 до 19.00.</li><li>Инвесторы должны быть обеспечены строительными касками ( каски следует получить в отделе продаж).</li><li>Допуск детей на строительный объект строго запрещен.</li><li>Посещение объекта должно происходить в сопровождении сотрудника отдела продаж.</li></ol></div><div><b>\"Ваша безопасность в соблюдении простых правил\". Спасибо.</b></div><br></p>', 1, 'artc_20170912123334153.jpg', 0, 0, '', '', '', '', '', 1, 1, 0, '2017-09-02 00:00:00', '2018-05-14 10:36:42', NULL),
(51, 'Ход строительства домов и таунхаусов в нашем комплексе // 10 сентября 2017г.', '<p><div><p><strong>Итоги строительства по дому \"Шатель\" (обе секции)</strong></p><ul><li>Строительство  крыши в 1-ой секции - продолжается.</li><li>Ведется оштукатуривание и окраска  внешнего фасада 1, 2 -ой секций. </li><li>Ведутся работы по оштукатуриванию стен в 1- ой секции.</li><li>Ведутся подготовительные работы для монтажа оконных и балконных стеклопакетов в 1, 2 - ой секциях.<br></li></ul></div><div><p><strong>Ход строительства по дому \"Лион\"</strong></p></div><div> <strong>1-ая секция:</strong></div><div><li>Заканчивается монтаж плит перекрытия 9- ого этажа. </li><li>Ведется кладка стен технического этажа.</li></div><div><p><strong>2-я секция:</strong></p></div><div><li>Ведутся подготовительные работы для монтажа плит перекрытия 9- ого этажа.</li></div><div><li>Ведутся подготовительные работы для кладки стен технического монтажа.</li></div><div><p><strong>3-я секция:</strong></p></div><div><li>Заканчивается кладка стен 7- ого этажа.</li><li>Ведутся подготовительные работы для монтажа плит перекрытия 7-ого этажа.<br></li><strong>4-я секция:</strong><div><li>Ведется вязка и сварка каркаса силового пояса усиления.3- его этажа.</li></div><div><li>Ведутся подготовительные работы для монтажа плит перекрытия 3- ого этажа.</li></div><div><p><strong>5-я секция:</strong></p></div><div><li>Продолжается кладка стен 2- ого этажа.</li></div><div><li>Ведутся подготовительные работы для монтажа плит перекрытия 2- ого этажа.</li></div><div><p><strong><strong>6-я секция:</strong></strong></p><ul><li>Заканчивается вязка и сварка каркаса силового пояса усиления.цокольного этажа.</li><li>Ведутся подготовительные работы для монтажа плит перекрытия цокольного этажа.</li></ul><p><strong><strong>Ход строительства проекта \"Перша Житлова\"</strong></strong></p></div><div><strong><strong>Дом № 1:</strong></strong></div><div><li>Заканчивается утепление фасада.</li><li>Продолжается оштукатуривание и окраска внешнего фасада.</li><li>Продолжается установка балконных ограждений.</li><li>Продолжается монтаж внутренней газовой разводки.</li></div><div><p><strong><strong><strong><strong><strong>Ход строительства проекта \"Vlasna\"</strong></strong></strong></strong></strong></p><p><strong><strong><strong><strong><strong><strong><strong>Дом № 1:</strong></strong></strong></strong></strong></strong></strong></p><ul><li>Ведется монтаж плит перекрытия цокольного этажа.</li><li>Ведутся подготовительные работы для кладки стен 1- ого этажа.</li></ul><p><strong><strong><strong>Благоустройство территории ЖК \"Новая Конча Заспа\"</strong></strong></strong></p><ol><li></li><ol><li>Продолжается строительстве очистных сооружений ЖК \"Новая Конча Заспа\".( фото № 8).</li><li>Продолжается монтаж и строительство детской площадки между домами Линц и Грац.( фото № 7).</li><li>Ведется благоустройство дороги по улице И. Франка от дома Щатель к дому \"1-а Житлова\". (фото № 5).</li><li>ЖК \" Новая Конча Заспа\" : <a href=\"https://www.youtube.com/watch?feature=share&utm_source=Viber&utm_campaign=Private&v=rgDGq76IJoU&utm_medium=Chat&app=desktop\">https://www.youtube.com/watch?feature=share&utm_source=Viber&utm_campaign=Private&v=rgDGq76IJoU&utm_medium=Chat&app=desk</a></li></ol><li><a href=\"https://www.youtube.com/watch?feature=share&utm_source=Viber&utm_campaign=Private&v=rgDGq76IJoU&utm_medium=Chat&app=desktop\"></a></li><li><a href=\"https://www.youtube.com/watch?feature=share&utm_source=Viber&utm_campaign=Private&v=rgDGq76IJoU&utm_medium=Chat&app=desktop\"></a></li></ol></div><div><b>Правила посещения строительного объекта:</b></div><div><ol><li>Запрещено посещение объекта в активные рабочие дни: понедельник - суббота.</li><li>Посещать объект следует  в субботу , согласно календаря,  с 16.00 до 19.00.</li><li>В воскресенье с 10.00 до 19.00.</li><li>Инвесторы должны быть обеспечены строительными касками ( каски следует получить в отделе продаж).</li><li>Допуск детей на строительный объект строго запрещен.</li><li>Посещение объекта должно происходить в сопровождении сотрудника отдела продаж.</li></ol></div><div><b>\"Ваша безопасность в соблюдении простых правил\". Спасибо.</b></div></div><br></p>', 1, 'artc_201709121248001000.jpg', 0, 0, '', '', '', '', '', 1, 1, 0, '2017-09-10 00:00:00', '2018-05-14 10:36:14', NULL),
(52, 'Предлагаем хиты продаж - квартиры с двориком!', '<p></p><p>С радостью сообщаем нашим будущим клиентам о запуске в продажу квартир с двориками. </p><p>Эти квартиры будут располагаться на 1-ых этажах в домах нового проекта жилого комплекса \"Власна\". </p><p>На выбор предлагаются 1-к, 2-к и 3-к квартиры с собственным двориком. </p><p>Только в сентябре действует акционная цена 13500 грн/м. Спешите, кол-во квартир с двориками ограничено!</p><p>С планировками квартир вы можете ознакомится ниже. </p><p><b>1-к квартира с двориком, общий метраж 40 кв.м., стоимость 512 000грн.</b></p><p><img src=\"https://n-k-z.com/myprotected/redactor/demo/scripts/uploads/ead311d291ff52778abc6fb3cb188c26.jpg\" style=\"width: 278.485px; height: 428px;\"></p><p><b>2-к квартира с двориком, общий метраж 70 кв.м., стоимость 896 000грн.</b></p><p><img src=\"https://n-k-z.com/myprotected/redactor/demo/scripts/uploads/aa7e70b1328c9ddb31a41016f37c65e3.jpg\" style=\"width: 470.077px; height: 272px;\"></p><p><b>3-к квартира с двориком,общий метраж 84 кв.м., стоимость 1 075 200грн.</b></p><p><img src=\"https://n-k-z.com/myprotected/redactor/demo/scripts/uploads/7acce868a6231c6309c0cefeef6c242e.jpg\" style=\"width: 481.909px; height: 279px;\"></p><br><br><p></p>\r\n', 1, 'artc_20170919174715819.jpg', 0, 0, NULL, NULL, '', '', '', 1, 1, 0, '2017-09-19 00:00:00', '2017-09-19 17:55:43', NULL),
(53, 'Ход строительства домов и таунхаусов в нашем комплексе // 17 сентября 2017г.', '<p><div><p><strong>Итоги строительства по дому \"Шатель\" (обе секции)</strong></p><ul><li>Ведутся подготовительные работы для монтажа стропильной системы во 2- ой секции.</li><li>Продолжается оштукатуривание и окраска  внешнего фасада 1, 2 -ой секций.</li><li>Продолжаются работы по внутренней штукатурке стен в 1- ой секции.</li><li>Ведется монтаж оконных и балконных стеклопакетов в 1, 2 - ой секциях.</li></ul></div><div><p><strong>Ход строительства по дому \"Лион\"</strong></p></div><div> <strong>1-ая секция:</strong></div><div><li>Закончен монтаж плит перекрытия 9- ого этажа.</li><li>Продолжается кладка стен технического этажа.</li></div><div><p><strong>2-я секция:</strong></p></div><div><li>Продолжаются подготовительные работы для монтажа плит перекрытия 9- ого этажа.</li><li>Продолжаются подготовительные работы для кладки стен технического монтажа.<br></li></div><div><p><strong>3-я секция:</strong></p></div><div><li>Закончена кладка стен 7- ого этажа.</li><li>Ведется монтаж плит перекрытия 7-ого этажа.</li></div><div><p><strong><strong>4-я секция:</strong></strong></p><p><div><div><ul><li>Продолжается вязка и сварка каркаса силового пояса усиления.3- его этажа.<br></li><li>Продолжаются подготовительные работы для монтажа плит перекрытия 3- ого этажа.<br></li></ul></div></div></p><p><strong>5-я секция:</strong></p></div><div><li>Заканчивается кладка стен 2- ого этажа.</li></div><div><li>Ведется монтаж плит перекрытия 2- ого этажа.</li></div><div><p><strong><strong>6-я секция:</strong></strong></p><ul><li>Продолжается вязка и сварка каркаса силового пояса усиления.цокольного этажа.</li><li>Продолжаются подготовительные работы для монтажа плит перекрытия цокольного этажа.</li></ul><p><strong><strong>Ход строительства проекта \"Vlasna\"</strong></strong></p></div><div><strong><strong>Дом № 1:</strong></strong></div><div><li>Внешняя отделка фасада - продолжается.</li><li>Установка балконных ограждений - продолжается.</li><li>Монтаж внутренней газовой разводки - продолжается.</li><li>Установлены лестничные ограждения в подъезде.</li></div><div><p><strong><strong><strong><strong><strong><strong><strong>Дом № 2:</strong></strong></strong></strong></strong></strong></strong></p><ul><li>Ведется кладка стен 1- ого этажа.</li><li>Ведутся подготовительные работы для монтажа плит перекрытия 1- ого этажа.</li></ul><p><strong><strong><strong>Благоустройство территории ЖК \"Новая Конча Заспа\"</strong></strong></strong></p><ol><li>Продолжается строительстве очистных сооружений ЖК \"Новая Конча Заспа\".( фото № 8).</li><li>Продолжается монтаж и строительство детской площадки между домами Линц и Грац.( фото № 7).</li><li>Ведется благоустройство дороги по улице И. Франка от дома Щатель к дому \"1-а Житлова\". (фото № 5).</li><li>ЖК \" Новая Конча Заспа\" : <a href=\"https://www.youtube.com/watch?feature=share&utm_source=Viber&utm_campaign=Private&v=rgDGq76IJoU&utm_medium=Chat&app=desktop\">https://www.youtube.com/watch?feature=share&utm_source=Viber&utm_campaign=Private&v=rgDGq76IJoU&utm_medium=Chat&app=desk</a></li><li><a href=\"https://www.youtube.com/watch?feature=share&utm_source=Viber&utm_campaign=Private&v=rgDGq76IJoU&utm_medium=Chat&app=desktop\"></a></li><li><a href=\"https://www.youtube.com/watch?feature=share&utm_source=Viber&utm_campaign=Private&v=rgDGq76IJoU&utm_medium=Chat&app=desktop\"></a></li></ol></div><div><b>Правила посещения строительного объекта:</b></div><div><ol><li>Запрещено посещение объекта в активные рабочие дни: понедельник - суббота.</li><li>Посещать объект следует  в субботу , согласно календаря,  с 16.00 до 19.00.</li><li>В воскресенье с 10.00 до 19.00.</li><li>Инвесторы должны быть обеспечены строительными касками ( каски следует получить в отделе продаж).</li><li>Допуск детей на строительный объект строго запрещен.</li><li>Посещение объекта должно происходить в сопровождении сотрудника отдела продаж.</li></ol></div><div><b>\"Ваша безопасность в соблюдении простых правил\". Спасибо.</b></div><br></p>', 1, 'artc_20170921160520770.jpg', 0, 0, '', '', '', '', '', 1, 1, 0, '2017-09-17 00:00:00', '2018-05-14 10:36:02', NULL),
(54, 'Ход строительства домов и таунхаусов в нашем комплексе // 24 сентября 2017г.', '<p></p><div><p><strong>Итоги строительства по дому \"Шатель\" (обе секции)</strong></p><ul><li>Оштукатуривание и окраска  внешнего фасада 1, 2 -ой секций - продолжается.</li><li>Ведутся работы по оштукатуриванию внутренних стен в 1- ой секции.</li><li>Заканчивается монтаж оконных и балконных стеклопакетов в 1, 2 - ой секциях.</li><li>Ведется монтаж металлочерепицы на крыше 1- ой секции.</li></ul></div><div><p><strong>Ход строительства по дому \"Лион\"</strong></p></div><div> <strong>1-ая секция:</strong></div><div><li>Заканчивается кладка стен технического этажа.</li><li>Ведется установка оконных блоков на 5 - 8 этажах.</li></div><div><p><strong>2-я секция:</strong></p></div><div><li>Продолжаются подготовительные работы для монтажа плит перекрытия 9- ого этажа.</li><li>Продолжаются подготовительные работы для кладки стен технического монтажа.</li></div><div><p><strong>3-я секция:</strong></p></div><div><li>Закончен монтаж плит перекрытия 7-ого этажа.</li><li>Ведется кладка стен 8-ого этажа.</li></div><div><p><strong><strong>4-я секция:</strong></strong></p><div><ul><li>Ведется устройство опалубки для бетонирования силового пояса 3- его этажа.</li><li>Ведутся подготовительные работы для монтажа плит перекрытия 3- ого этажа.</li></ul></div><p><strong>5-я секция:</strong></p></div><div><li>Закончена кладка стен 2- ого этажа.</li><li>Заканчиваеься монтаж плит перекрытия 2- ого этажа.</li><li>Началась кладка стен 3- его этажа.<br></li></div><div><p><strong><strong>6-я секция:</strong></strong></p><ul><li>Ведутся подготовительные работы для бетонирования силового пояса цокольного этажа.</li><li>Продолжаются подготовительные работы для монтажа плит перекрытия цокольного этажа.</li></ul><p><strong><strong>Ход строительства проекта \"Vlasna\"</strong></strong></p></div><div><strong><strong>Дом № 1:</strong></strong></div><div><li>Продолжается внешняя отделка стен фасада и установка балконных ограждений.</li><li>Ведутся подготовительные работы для отделки внктренних помещений подъезда и лестницы.</li><li>Заканчивается монтаж внутренней газовой разводки.</li><li>Ведется монтаж электросчетчиков.</li></div><div><p><strong><strong><strong><strong><strong><strong><strong>Дом № 2:</strong></strong></strong></strong></strong></strong></strong></p><ul><li>Заканчивается кладка стен 1- ого этажа.</li><li>Ведутся подготовительные работы для монтажа плит перекрытия 1- ого этажа.</li></ul><p><strong><strong><strong>Благоустройство территории ЖК \"Новая Конча Заспа\"</strong></strong></strong></p><ol><li>Продолжается строительстве очистных сооружений ЖК \"Новая Конча Заспа\".( фото № 8).</li><li>Продолжается монтаж и строительство детской площадки между домами Линц и Грац.( фото № 7).</li><li>Ведется благоустройство дороги по улице И. Франка от дома Щатель к дому \"1-а Житлова\". (фото № 5).</li><li>ЖК \" Новая Конча Заспа\" : <a href=\"https://www.youtube.com/watch?feature=share&utm_source=Viber&utm_campaign=Private&v=rgDGq76IJoU&utm_medium=Chat&app=desktop\">https://www.youtube.com/watch?feature=share&utm_source=Viber&utm_campaign=Private&v=rgDGq76IJoU&utm_medium=Chat&app=desk</a></li><li><a href=\"https://www.youtube.com/watch?feature=share&utm_source=Viber&utm_campaign=Private&v=rgDGq76IJoU&utm_medium=Chat&app=desktop\"></a></li><li><a href=\"https://www.youtube.com/watch?feature=share&utm_source=Viber&utm_campaign=Private&v=rgDGq76IJoU&utm_medium=Chat&app=desktop\"></a></li></ol></div><div><b>Правила посещения строительного объекта:</b></div><div><ol><li>Запрещено посещение объекта в активные рабочие дни: понедельник - суббота.</li><li>Посещать объект следует  в субботу , согласно календаря,  с 16.00 до 19.00.</li><li>В воскресенье с 10.00 до 19.00.</li><li>Инвесторы должны быть обеспечены строительными касками ( каски следует получить в отделе продаж).</li><li>Допуск детей на строительный объект строго запрещен.</li><li>Посещение объекта должно происходить в сопровождении сотрудника отдела продаж.</li></ol></div><div><b>\"Ваша безопасность в соблюдении простых правил\". Спасибо.</b></div><br><p></p>', 1, 'artc_20170926161603961.jpg', 0, 0, '', '', '', '', '', 1, 1, 0, '2017-09-24 00:00:00', '2018-05-14 10:35:50', NULL),
(55, 'Проект детской площадки жилого комплекса Новая Конча-Заспа', '<p></p><h3>Представляем вашему вниманию проект детской площадки между домами Линц и Грац.</h3><h3>С радостью и нетерпением будем ждать деток и их родителей на нашей игровой площадке, которая наполнена комфортом и уютом!</h3><p></p>\r\n', 1, 'artc_20171003164211814.jpg', 0, 0, NULL, NULL, '', '', '', 1, 0, 0, '2017-10-03 00:00:00', '2017-10-03 16:44:17', NULL),
(56, 'Ход строительства домов и таунхаусов в нашем комплексе // 1 октября 2017г.', '<p></p><div><p><strong>Итоги строительства по дому \"Шатель\" (обе секции)</strong></p><ul><li>Ведется внешняя отделка фасада.</li><li>Продолжаются работы по оштукатуриванию внутренних стен в 1- ой секции.</li><li>Продолжается монтаж металлочерепицы на крыше 1- ой секции.</li><li>Ведется монтаж стропильной системы крыши во 2-ой секции.</li></ul></div><div><p><strong>Ход строительства по дому \"Лион\"</strong></p></div><div> <strong>1-ая секция:</strong></div><div><li>Ведутся подготовительные работы для устройства монолитного силового пояса.</li><li>Продолдается установка оконных блоков на 5 - 8 этажах.</li><li>Ведется монтаж инженерных внутренних сетей.<br></li></div><div><p><strong>2-я секция:</strong></p></div><div><li>Продолжаются подготовительные работы для монтажа плит перекрытия 9- ого этажа.</li><li>Продолжаются подготовительные работы для кладки стен технического монтажа.</li></div><div><p><strong>3-я секция:</strong></p></div><div><li>Продолжается кладка стен 8-ого этажа.</li><li>Ведется кладка межкомнатных перегородок.</li></div><div><p><strong><strong>4-я секция:</strong></strong></p><div><ul><li>Пояс усиления 3- его этажа забетонирован.</li><li>Ведутся подготовительные работы для монтажа плит перекрытия 3- ого этажа.</li></ul></div><p><strong>5-я секция:</strong></p></div><div><li>Заканчивается кладка стен 3- его этажа.</li><li>Ведутся подготовительные работы для монтажа монолитного пояса усиления.</li></div><div><p><strong><strong>6-я секция:</strong></strong></p><ul><li>Закончен монтаж плит перекрытия цокольного этажа.</li><li>Ведется кладка стен 1- ого этажа.</li></ul><p><strong><strong>Ход строительства проекта \"Vlasna\"</strong></strong></p></div><div><strong><strong>Дом № 1:</strong></strong></div><div><li>Внешняя отделка стен фасада и установка балконных ограждений - продолжается.</li><li>Ведутся подготовительные работы для отделки внутренних помещений подъезда и лестницы.</li><li>Смонтированы узлы учета электроэнергии и воды.</li><li>Заканчивается монтаж внутренней газовой разводки.</li></div><div><p><strong><strong><strong><strong><strong><strong><strong>Дом № 2:</strong></strong></strong></strong></strong></strong></strong></p><ul><li>Смонтированы плиты перекрытия 1 - ого этажа.</li><li>Ведется кладка стен 2-ого этажа.</li></ul><p><strong><strong><strong>Благоустройство территории ЖК \"Новая Конча Заспа\"</strong></strong></strong></p><ol><li>Продолжается строительстве очистных сооружений ЖК \"Новая Конча Заспа\".( фото № 8).</li><li>Продолжается монтаж и строительство детской площадки между домами Линц и Грац.( фото № 7).</li><li>Ведется благоустройство дороги по улице И. Франка от дома Щатель к дому \"1-а Житлова\". (фото № 5).</li><li>ЖК \" Новая Конча Заспа\" : <a href=\"https://www.youtube.com/watch?feature=share&utm_source=Viber&utm_campaign=Private&v=rgDGq76IJoU&utm_medium=Chat&app=desktop\">https://www.youtube.com/watch?feature=share&utm_source=Viber&utm_campaign=Private&v=rgDGq76IJoU&utm_medium=Chat&app=desk</a></li><li><a href=\"https://www.youtube.com/watch?feature=share&utm_source=Viber&utm_campaign=Private&v=rgDGq76IJoU&utm_medium=Chat&app=desktop\"></a></li><li><a href=\"https://www.youtube.com/watch?feature=share&utm_source=Viber&utm_campaign=Private&v=rgDGq76IJoU&utm_medium=Chat&app=desktop\"></a></li></ol></div><div><b>Правила посещения строительного объекта:</b></div><div><ol><li>Запрещено посещение объекта в активные рабочие дни: понедельник - суббота.</li><li>Посещать объект следует  в субботу , согласно календаря,  с 16.00 до 19.00.</li><li>В воскресенье с 10.00 до 19.00.</li><li>Инвесторы должны быть обеспечены строительными касками ( каски следует получить в отделе продаж).</li><li>Допуск детей на строительный объект строго запрещен.</li><li>Посещение объекта должно происходить в сопровождении сотрудника отдела продаж.</li></ol></div><div><b>\"Ваша безопасность в соблюдении простых правил\". Спасибо.</b></div><p></p>', 1, 'artc_20171004125926738.jpg', 0, 0, '', '', '', '', '', 1, 1, 0, '2017-10-01 00:00:00', '2018-05-14 10:35:37', NULL),
(57, 'Ход строительства домов и таунхаусов в нашем комплексе // 8 октября 2017г.', '<p><div><p><strong>Итоги строительства по дому \"Шатель\" (обе секции)</strong></p><ul><li>Продолжается внешняя отделка фасада.</li><li>Ведутся работы по оштукатуриванию внутренних стен в 1- ой секции.</li><li>Монтаж металлочерепицы на крыше 1- ой секции выполнен на 90 %.</li><li>Продолжаются работы по устройству примыканий, в местах вывода вентиляционных труб.</li><li>Ведется монтаж дымоходов  для  установки газовых котлов.</li><li>Ведутся работы по устройству стяжки пола в подвале дома \"Шатель\".<br></li><li><br></li></ul></div><div><p><strong>Ход строительства по дому \"Лион\"</strong></p></div><div> <strong>1-ая секция:</strong></div><div><li>Ведется вязка и сварка каркаса монолитного силового пояса.</li><li>Ведется установка оконных блоков на 5 - 8 этажах.</li><li>Продолжается монтаж инженерных внутренних сетей.</li><li>Ведется монтаж межкомнатных перегородок на 9- ом этаже.<br></li></div><div><p><strong>2-я секция:</strong></p></div><div><li>Ведутся подготовительные работы для монтажа плит перекрытия 9- ого этажа.</li><li>Ведутся подготовительные работы для кладки стен технического монтажа.</li></div><div><p><strong>3-я секция:</strong></p></div><div><li>Закончена кладка стен 8- ого этажа.</li><li>Заканчивается монтаж плит перекрытия 8- ого этажа.</li><li>Ведется кладка стен 9-ого этажа.<br></li><li>Продолжается кладка межкомнатных перегородок.<br></li></div><div><p><strong><strong>4-я секция:</strong></strong></p><div><ul><li>Демонтирована опалубка с силового пояса усиления 3- его этажа.</li><li>Ведется монтажа плит перекрытия 3- ого этажа.</li></ul></div><p><strong>5-я секция:</strong></p></div><div><li>Закончена кладка стен 3- его этажа.</li><li>Силовой пояс 3- его этажа подготовлен к бетонированию.</li></div><div><p><strong><strong>6-я секция:</strong></strong></p><ul><li>Продолжается кладка стен 1- ого этажа.</li><li>Ведутся подготовительные работы для монтажа плит перекрытия 1- ого этажа.</li></ul><p><strong><strong>Ход строительства проекта \"Vlasna\"</strong></strong></p></div><div><strong><strong>Дом № 1:</strong></strong></div><div><li>Ведется нешняя отделка стен фасада и установка балконных ограждений.</li><li>Ведутся подготовительные работы для установки входных дверей в квартиры.</li><li>Закончен монтаж внутренней газовой разводки.</li><li>Ведутся подготовительные работы для отделки внутренних помещений подъезда и лестницы.</li></div><div><p><strong><strong><strong><strong><strong><strong><strong>Дом № 2:</strong></strong></strong></strong></strong></strong></strong></p><ul><li>Продолжается кладка стен 2-ого этажа.</li><li>Ведутся подготовительные работы для монтажа плит перекрытия 2- ого этажа.</li></ul><p><strong><strong><strong>Благоустройство территории ЖК \"Новая Конча Заспа\"</strong></strong></strong></p><ol><li>Продолжается строительстве очистных сооружений ЖК \"Новая Конча Заспа\".( фото № 8).</li><li>Продолжается монтаж и строительство детской площадки между домами Линц и Грац.( фото № 7).</li><li>Ведется благоустройство дороги по улице И. Франка от дома Щатель к дому \"1-а Житлова\". (фото № 5).</li><li>ЖК \" Новая Конча Заспа\" : <a href=\"https://www.youtube.com/watch?feature=share&utm_source=Viber&utm_campaign=Private&v=rgDGq76IJoU&utm_medium=Chat&app=desktop\">https://www.youtube.com/watch?feature=share&utm_source=Viber&utm_campaign=Private&v=rgDGq76IJoU&utm_medium=Chat&app=desk</a></li><li><a href=\"https://www.youtube.com/watch?feature=share&utm_source=Viber&utm_campaign=Private&v=rgDGq76IJoU&utm_medium=Chat&app=desktop\"></a></li><li><a href=\"https://www.youtube.com/watch?feature=share&utm_source=Viber&utm_campaign=Private&v=rgDGq76IJoU&utm_medium=Chat&app=desktop\"></a></li></ol></div><div><b>Правила посещения строительного объекта:</b></div><div><ol><li>Запрещено посещение объекта в активные рабочие дни: понедельник - суббота.</li><li>Посещать объект следует  в субботу , согласно календаря,  с 16.00 до 19.00.</li><li>В воскресенье с 10.00 до 19.00.</li><li>Инвесторы должны быть обеспечены строительными касками ( каски следует получить в отделе продаж).</li><li>Допуск детей на строительный объект строго запрещен.</li><li>Посещение объекта должно происходить в сопровождении сотрудника отдела продаж.</li></ol></div><div><b>\"Ваша безопасность в соблюдении простых правил\". Спасибо.</b></div><br></p>', 1, 'artc_20171009154902170.jpg', 0, 0, '', '', '', '', '', 1, 1, 0, '2017-10-08 00:00:00', '2018-05-14 10:35:23', NULL),
(58, 'ЖК Новая Конча-Заспа заканчивает строительство очистных сооружений', '<p><iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/Da6Ly4TFzUQ\" frameborder=\"0\" allowfullscreen=\"\"></iframe><br></p>', 1, 'artc_20171011163302789.jpg', 0, 0, NULL, NULL, '', '', '', 1, 0, 0, '2017-10-11 00:00:00', '2017-10-11 16:33:42', NULL),
(66, 'Последние квартиры в доме \"Шатель\". Ваша квартира уже весной!', '<p></p><p>Уважаемые клиенты. Предлагаем вашему вниманию дом клубного формата \"Шатель\". Это шестиэтажный дом из красного керамического кирпича, с дополнительным утеплением фасада и панорамным остеклением.&nbsp;</p><p>В квартирах панорамное остекление, виды на Планерную гору и холмы Ходосеевки. Через дорогу расположен Голосеевский заповедник с густым хвойным лесом и целебным воздухом.</p><p><b>Готовность дома на весну 2018 года - 97%.&nbsp;</b></p><p><span style=\"font-size: 12px;\">Наш комплекс находится в 7-ми км от Киева в Ходосеевке (Новообуховское шоссе, 1) и включает 6-ти и 9-этажные жилые дома, экохаусы, а также отдельный коттеджный городок клубного типа.</span><br></p><p></p><p></p><p></p><p></p><p><img src=\"/myprotected/redactor/demo/scripts/uploads/826a3aa217f72769bb4d92ccdf01e92f.jpg\" style=\"\"></p>Базовая стоимость квадратного метра в доме Шатель составляет 16000 грн за кв.м. и пересчитана по курсу 28 грн/уе<br><p></p><p></p><p></p><p></p><p></p><p></p><br><div><h2 style=\"text-align: center;\"><a href=\"https://n-k-z.com/flats/shatel/r1/\"></a><a href=\"https://n-k-z.com/flats/shatel/r1/\">Посмотреть все планировки дома \"Шатель\" можно тут &gt;&gt;</a></h2><br></div><div><b>&nbsp;</b><p></p><h3>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<b>Генеральный план комплекса</b></h3><p></p><p><img src=\"/myprotected/redactor/demo/scripts/uploads/da616a2fe2ab4b8f56ee036a22c64244.jpg\" style=\"width: 948.509px; height: 349px;\"></p><br><p></p><br><p></p>\r\n</div>\r\n', 2, 'artc_20171126201339498.jpg', 4, 0, '', '', '', '', '', 1, 0, 0, '2018-03-09 00:00:00', '2018-03-09 12:21:28', NULL),
(61, 'Открыты продажи в новом доме клубного формата «Живадом»', '<p><p> Это жилой кирпичный дом с собственным бассейном и зоной барбекю. В доме всего 8 квартир, каждая общей площадью 115м2. Благодаря функциональному зонированию, квартиры разделены на две части: первая - гостевая зона с уютной кухней, большим санузлом, просторной гостиной с камином и широкой лоджией, и вторая – личное пространство для детей и родителей - детская и спальня с вместительной гардеробной и санузлом. </p><p>В комплектацию квартиры входит: металлические входные двери и межкомнатные двери, подвесной потолок, полы с подогревом в кухне, коридоре, ванных комнатах, два санузла с сантехникой и отделкой дорогой керамической плиткой, итальянский двухконтурный котел для отопления и горячей воды, ламинат в комнатах и напольная плитка в коридоре, кухне и балконе.</p><p>Мы гарантируем высокое качество строительных и отделочных материалов – толщина стен 50 см – они сохранят прохладу летом и тепло зимой, керамическая черепица, красный кирпич, минвата на базальтовой основе - все отделочные материалы только экологически чистые.</p><p>Сдача дома в эксплуатацию – декабрь 2017 года. Стоимость до конца месяца – 550 уе/кв.м.</p><p>По дополнительным вопросам и записи на просмотр квартиры звоните по телефонам нашего коллцентра или оператору чата.</p></p>', 1, 'artc_20171107125809356.jpg', 0, 0, '', '', '', '', '', 1, 1, 0, '2017-10-24 00:00:00', '2018-06-04 10:56:19', NULL),
(62, 'Принимай участие в гарантированной акции \"Велосипед в подарок\"', '<p></p><div>Уже стало доброй традицией в качестве новогодних подарков дарить нашим инвесторам велосипеды.&nbsp; Приглашаем всех принять участие.</div><div>Условия акции «Велосипед в подарок»:</div><div>1. При бронировании и покупке квартиры в период с 17.11.2017 по 17.01.2018 вы получаете&nbsp;подарочный сертификат на покупку велосипеда.</div><div>2. Сертификат действителен до 01.02.2018 г. - вам надо обменять сертификат на велосипед до этой даты.</div><div>3. Один сертификат-один велосипед</div><div>4. Если при выборе велосипеда, стоимость велосипеда меньше чем сумма сертификата, разница в&nbsp;деньгах не возвращается.</div><div>5. Если стоимость выбранного велосипеда больше суммы сертификата, клиент может&nbsp;добавить недостающую сумму и приобрести выбранную модель велосипеда</div><div>6. Сертификат действует только в фирменном магазине «ARDIS» адрес которого указан на&nbsp;подарочном сертификате.</div><p></p>\r\n', 1, 'artc_20171116170658313.JPG', 0, 0, NULL, NULL, '', '', '', 1, 0, 0, '2017-11-16 00:00:00', '2017-11-17 12:57:25', NULL),
(63, 'Эксперты назвали самое перспективное направление пригородной застройки', '<p></p><p><b>Где и для кого мы строим</b></p>\r\n<p>Немного\r\nаналитики, которая позволит оценить, как застраивается правый берег пригорода\r\nнашей столицы</p>\r\n\r\n<p><b>По итогам  октября, к продаже были предложены квартиры в 376\r\nЖилых Комплексах (ЖК) </b>. В это\r\nчисло входят как объекты незавершенного строительства, так и нереализованные\r\nквартиры в домах, сданных в эксплуатацию.</p><p></p><p></p><p><br></p><p><img src=\"/myprotected/redactor/demo/scripts/uploads/455f7bd18d2ae626b91954a0799dbc53.jpg\" style=\"width: 817.061px; height: 589px;\"></p><br><p></p><p></p><p>Самая\r\nвысокая концентрация ЖК в направлении Ирпень, Буча, Гостомель, Ворзель- 163.</p>\r\n\r\n<p>Тесно  в Вишневом и Крюковщине – 127.</p>\r\n\r\n<p>Также много\r\nпредложений в направлении Борщаговка, Боярка, Бологородка -58.</p>\r\n\r\n<p>Перспективными\r\nвыглядит направление Вышгорода – 22.</p>\r\n\r\n<p>Гатное,\r\nНовоселки, Чабаны – 14.</p>\r\n<p>Что\r\nозначает высокая концентрация Жилых Комплексов для будущих  жильцов? – это означает  перспектива \r\nсерьезных пробок  на выездах  к \r\nцентральным магистралям, особенно через год-два.</p>\r\n\r\n<p>Направление\r\n(район)  становится одним из главных\r\nфакторов, при выборе квартиры в пригороде Киева.  Также, уходит на второй план понятие\r\n«близость к Метро», т.к. территориально быть рядом и потратить более 40 минут,\r\nчтобы добраться к Метро – это та реальность, с которой мы сталкиваемся каждый\r\nдень. </p>\r\n\r\n<p><b>Таким образом</b>, <b>наиболее\r\nперспективным, с точки зрения выбора нового жилья, остается  направление \r\nХодосовки и Подгорцев – всего 5 Жилых Комплексов!</b></p>\r\n<p>Оценим ЖК\r\n«Новая Конча –Заспа»:</p>\r\n\r\n<p>1)<span> \r\n</span>Ты просто\r\nуезжаешь за город .  Новообуховская  шоссе – скоростное, пробок нет никогда!  До М Выдубичи – всего 15 мин!</p><p><img src=\"/myprotected/redactor/demo/scripts/uploads/bc832eceaa802a0829ecf789f33ad726.jpg\" style=\"width: 814.603px; height: 470px;\"></p><p></p><p>1)<span> \r\n</span>Для кого мы\r\nстроим.  </p>\r\n\r\n<p>По-сути,\r\nкомплекс включает три строительные площадки: ЖК «Новая Конча-Заспа», ЖК «Vlasnsа» и  комплекс \r\n«Экохаусы»</p><p><img><img><b>ЖК «Новая Конча-Заспа» - Демократичное\r\nжилье</b></p><p><b></b></p><p><b><img src=\"/myprotected/redactor/demo/scripts/uploads/e73cf9a0201f08b74c1d60c9a51446ce.jpg\" style=\"width: 813.985px; height: 258px;\"></b></p><p></p><p><b><img><img><img><img><b>ЖК «</b><b>Vlasns</b><b>а» и «Экохаусы» -\r\nпрестижное  предложение </b></b></p><p><b><b></b></b></p><p><b><b><img src=\"/myprotected/redactor/demo/scripts/uploads/5ca816f2b4989396a1e9f6d40d22398c.jpg\" style=\"width: 819px; height: 234px;\"></b></b></p><p></p><p><b><b>Все дома с внутренней\r\nинфраструктурой расположены таким образом, чтобы предоставить жильцам\r\nмаксимальный комфорт и уединение, одновременно обеспечивая великолепный вид из\r\nокна  и жилое пространство, наполненное\r\nдневным светом.</b></b></p><b><b>\r\n\r\n<p></p>\r\n\r\n<p><b>Мы создали  целый мир, и теперь он ваш!</b></p>\r\n\r\n<p><b>Каждый может найти жилье  на свой \r\nвкус и собственные требования.</b></p>\r\n\r\n<p>1)<span> \r\n</span>Готовая инфраструктура\r\nза городом, рядом с ЖК- это очевидный плюс и уже обязательное требование!</p>\r\n\r\n<p><img><img><img>У нас все\r\nпродумано до мелочей, все  рядом,  в пешей доступности ! При  таком выгодном расположении комплексов,  тишина как внутри, так и снаружи зданий,  дает возможность жить спокойной загородной\r\nжизнью всего в 15  минутах  езды от Киева</p><p><img src=\"/myprotected/redactor/demo/scripts/uploads/9ac14558cb117d2c5ccc4f76e0da7afb.jpg\" style=\"width: 634.671px; height: 214px;\"></p><p></p><p>        Мануфактура\r\n– 5 мин пешком         Детский сад – 5 мин\r\nпешком</p><p></p><p><img src=\"/myprotected/redactor/demo/scripts/uploads/f670295c6bef382902cdbbfa706ee0eb.jpg\" style=\"width: 641.234px; height: 213px;\"></p><p></p><p>           Клиника – 5\r\nмин пешком                   Спорт, SPA – 5 мин пешком</p><p></p><p><img src=\"/myprotected/redactor/demo/scripts/uploads/55a22baa7315c18cf7bfa6ba79b315e6.jpg\" style=\"width: 338.154px; height: 205px;\"></p><p>            Школа – 15\r\nмин пешком        </p><p></p><p></p><p></p><p></p><p></p><p></p></b><p></p><p></p></b><p></p><p></p><p></p><p></p><p></p>\r\n', 1, 'artc_20171117151144270.jpg', 0, 0, NULL, NULL, '', '', '', 1, 0, 0, '2017-11-17 00:00:00', '2017-12-01 11:35:28', NULL);
INSERT INTO `osc_page_news_items` (`id`, `caption`, `details`, `template`, `preview`, `cat`, `is_top`, `special_text`, `tags`, `meta_title`, `meta_keys`, `meta_desc`, `is_index`, `block`, `order_id`, `dateCreate`, `dateModify`, `adminMod`) VALUES
(64, 'Ход строительства домов и таунхаусов в нашем комплексе // 20 ноября 2017г.', '<p></p><div><p><strong>Итоги строительства по дому \"Шатель\" (обе секции)</strong></p><ul><li>Закакнчивается оштукатуривание и окрашивание внешнего фасада 1- ой секции по ул. И. Франка.</li><li>Продолжаются работы по оштукатуриванию стен во 2- ой секции.</li><li>Заканчиваются работы по устройству стяжки пола в 1- ой секции дома Шатель.</li><li>Ведутся подготовительные работы для внутренней отделки коридоров и лестничных маршей в 1- ом подъезде. ( шпаклевка, устройство плиточного пола, декоративная штукатурка.)</li><li>Ведется монтаж коллективного дымохода в 1- ой секции дома Шатель.</li><li>Ведется монтаж стропильной системы крыши во 2- ой секции дома Шатель.<br></li></ul></div><div><p><strong>Ход строительства по дому \"Лион\"</strong></p></div><div> <strong>1-ая секция:</strong></div><div><li>Заканчивается монтаж плит перекрытия технического этажа во 2- ом подъезде.</li><li>Заканчивается монтаж парапета крыши 2- ого подъезда.</li><li>Каркас силового пояса и опалубки для бетонирования в 1-ом подъезде смонтирован.</li><li>Ведутся подготовительные работы для бетонирования силового пояса технического этажа.</li><li>Монтаж оконных блоков на фасаде дома по ул. Ф. Печерского - продолжается.</li><li>Ведутся подготовительные работы для утепления фасада.</li></div><div><p><strong>2-я секция:</strong></p></div><div><li>Заканчивается кладка стен технического этажа.</li><li>Ведутся работы по вязке и сварке каркаса силового пояса технического этажа.</li><li>Ведутся подготовительные работы для монтажа каркаса силового пояса и опалубки.<br></li><li>Ведется монтаж межкомнатных перегородок на 9- ом этаже.<br></li></div><div><p><strong>3-я секция:</strong></p></div><div><li>Закончен монтаж плит перекрытия 9- ого этажа.</li><li>Ведется кладка стен технического этажа.</li></div><div><p><strong><strong>4-я секция:</strong></strong></p><div><ul><li>Заканчивается кладка стен 5- ого этажа.</li><li>Ведутся подготовительные работы для монтажа плит перекрытия 5- ого этажа.</li></ul></div><p><strong>5-я секция:</strong></p></div><div><li>Заканчивается кладка стен 5-ого этажа.</li><li>Ведутся подготовительные работы для монтажа плит перекрытия 5- ого этажа.</li></div><div><p><strong><strong>6-я секция:</strong></strong></p><ul><li>Кладка стен 2-ого этажа - закончена.</li><li>Ведутся подготовительные работы для монтажа плит перекрытия 2- ого этажа.</li></ul><p><strong><strong>Ход строительства проекта \"Vlasna\"</strong></strong></p></div><div><strong><strong>Дом № 1:</strong></strong></div><div><li>Заканчивается внешняя отделка стен фасада и установка балконных ограждений.</li><li>Продолжается отделка внутренних помещений подъезда и лестницы.</li><li>Ведутся работы для устройства плиточного пола коридоров подъезда.</li></div><div><p><strong><strong><strong><strong><strong><strong><strong>Дом № 2:</strong></strong></strong></strong></strong></strong></strong></p><ul><li>Заканчивается кладка стен 3- его этажа.</li><li>Продолжается монтаж межкомнатных перегородок на 1-2 - ом этажах.<br></li><li>Ведутся подготовительные работы ддля монтажа плит перекрытия 3- его этажа.<br></li><li>Ведутся подготовительные работы для кладки стен 4- его этажа.</li></ul><p><strong><strong><strong>Благоустройство территории ЖК \"Новая Конча Заспа\"</strong></strong></strong></p><ol><li>Продолжается строительстве очистных сооружений ЖК \"Новая Конча Заспа\".( фото № 8).</li><li>Продолжается монтаж и строительство детской площадки между домами Линц и Грац.( фото № 7).</li><li>Ведется благоустройство дороги по улице И. Франка от дома Щатель к дому \"1-а Житлова\". (фото № 5).</li><li>ЖК \" Новая Конча Заспа\" : <a href=\"https://www.youtube.com/watch?feature=share&utm_source=Viber&utm_campaign=Private&v=rgDGq76IJoU&utm_medium=Chat&app=desktop\">https://www.youtube.com/watch?feature=share&utm_source=Viber&utm_campaign=Private&v=rgDGq76IJoU&utm_medium=Chat&app=desk</a></li><li><a href=\"https://www.youtube.com/watch?feature=share&utm_source=Viber&utm_campaign=Private&v=rgDGq76IJoU&utm_medium=Chat&app=desktop\"></a></li><li><a href=\"https://www.youtube.com/watch?feature=share&utm_source=Viber&utm_campaign=Private&v=rgDGq76IJoU&utm_medium=Chat&app=desktop\"></a></li></ol></div><div><b>Правила посещения строительного объекта:</b></div><div><ol><li>Запрещено посещение объекта в активные рабочие дни: понедельник - суббота.</li><li>Посещать объект следует  в субботу , согласно календаря,  с 16.00 до 19.00.</li><li>В воскресенье с 10.00 до 19.00.</li><li>Инвесторы должны быть обеспечены строительными касками ( каски следует получить в отделе продаж).</li><li>Допуск детей на строительный объект строго запрещен.</li><li>Посещение объекта должно происходить в сопровождении сотрудника отдела продаж.</li></ol></div><div><b>\"Ваша безопасность в соблюдении простых правил\". Спасибо.</b></div><p></p>', 1, 'artc_20171121141825702.jpg', 2, 0, '', '', '', '', '', 1, 1, 0, '2017-11-20 00:00:00', '2018-05-14 10:35:00', NULL),
(65, 'Как проводят время жители нашего комплекса', '<p></p><p>Чем\r\nзанять себя и семью, если ты живешь за городом - один из важных вопросов,\r\nкоторые задают себе будущие инвесторы, при выборе квартиры.&nbsp;В ЖК «Новая Конча-Заспа» каждый найдет себе отдых по душе.</p>\r\n<p>Чем\r\nже занимаются жильцы нашего комплекса?</p>\r\n\r\n<p>Например,\r\nв 5 минутах от жилых домов находится фитнес клуб, с тренажерным залом,\r\nбассейном, SPA-салоном, массажными кабинетами, финской сауной, римской парной и\r\nджакузи.&nbsp;</p><p><img src=\"/myprotected/redactor/demo/scripts/uploads/e96b2f8ed852c1886863ebe252b02d5e.jpg\" style=\"width: 777.229px; height: 496px;\"></p><p>А ещё в 800 метрах&nbsp;\r\nрасположен &nbsp;пони-клуб\r\n«Домино», который &nbsp;входит в&nbsp;\r\nобластную федерацию конного спорта киевской области. Как тут не выработать\r\nаристократическую привычку по выходным прогуливаться верхом по живописным\r\nокрестностям комплекса.<br></p><p></p><p><img src=\"/myprotected/redactor/demo/scripts/uploads/1ac7189d367eb4507607adf437835771.jpg\" style=\"width: 774.288px; height: 249px;\"></p><p>Великолепное место для экстрима - планерная гора,\r\nзаточена под параглайдингистов, где уроки покорения небесной стихии чередуют с\r\nпрактикой медитации и занятиями йогой. Параглайдинг сам по себе очень\r\nзахватывающий вид спорта, его можно практиковать вдвоем или в одиночку.<br></p><p></p><p><img src=\"/myprotected/redactor/demo/scripts/uploads/98ef4360c5c4560ef284ba4e8628a30d.jpg\" style=\"width: 773.913px; height: 242px;\"></p><p>Отличные условия для прогулок на велосипеде, недалеко от комплекса расположен Голосеевский заповедник.</p><p><p><img src=\"/myprotected/redactor/demo/scripts/uploads/e87398542e33d9651f875876acc3ef60.jpg\" style=\"width: 789.926px; height: 270px;\"></p><p>В нескольких километрах от комплекса находится красивое голубое озеро и пешой доступности мануфактура аутлет городок.</p><p><p><img src=\"/myprotected/redactor/demo/scripts/uploads/795728c9212ef27f2ce5464e163630cf.jpg\" style=\"width: 795.777px; height: 272px;\"></p>Так же в мегамаркете вы сможете отдохнуть с друзьями и семьей за игрой в боулинг или за просмотром последних кинопремьер.&nbsp;</p><p><p><img src=\"/myprotected/redactor/demo/scripts/uploads/c8c341932eee781ddc029018d52cc571.jpg\" style=\"width: 783.925px; height: 268px;\"></p></p></p><p></p><p>Все\r\nрядом, все в пешей доступности! При&nbsp;\r\nтаком выгодном расположении ЖК,&nbsp;\r\nтишина как внутри, так и снаружи зданий &nbsp;дает возможность жить спокойной загородной\r\nжизнью всего в 15&nbsp; минутах&nbsp; езды от Киева</p>\r\n\r\n<p>Приезжайте\r\nк нам на экскурсию, увидите&nbsp; сами!</p><p></p><p></p><p></p>\r\n', 1, 'artc_20171204162519817.jpg', 0, 0, NULL, NULL, '', '', '', 1, 0, 0, '2017-11-21 00:00:00', '2017-12-05 10:40:53', NULL),
(67, 'Ход строительства домов и таунхаусов в нашем комплексе // 3 декабря 2017г.', '<p></p><div><p><strong>Итоги строительства по дому \"Шатель\" (обе секции)</strong></p><ul><li>Продолжается внешняя отделка фасада дома Шатель со стороны внутреннего двора.</li><li>Заканчиваются работы по оштукатуриванию внутренних стен во 2- ой секции.</li><li>Ведутся работы  работы по устройству стяжки пола во 2- ой секции дома Шатель.</li><li>Ведутся подготовительные работы для внутренней отделки коридоров и лестничных маршей в 1- ом подъезде. ( шпаклевка, устройство плиточного пола, декоративная штукатурка.)</li><li>Продолжается монтаж коллективных дымоходов в доме Шатель.</li><li>Стропильная системыа крыши во 2- ой секции дома \"Шатель\" - монтируется, ведутся подготовительные работы для утепления крыши и устройство паро и гидро барьеров.</li></ul></div><div><p><strong>Ход строительства по дому \"Лион\"</strong></p></div><div> <strong>1-ая секция:</strong></div><div><li>Ведтся монтаж плит перекрытия технического этажа.</li><li>Ведется кладка перапета крыши.</li><li>Ведется утепление фасада.</li><li>Ведется кладка межкоинатных перегородок на 9- ом этаже.</li></div><div><p><strong>2-я секция:</strong></p></div><div><li>Продолжаются работы по вязке и сварке каркаса силового пояса технического этажа.</li><li>Ведутся подготовительные работы для монтажа каркакаса силового пояса и опалубки для бетонирования.</li></div><div><p><strong>3-я секция:</strong></p></div><div><li>Заканчивается кладка стен технического этажа.</li><li>Ведутся подготовительные работы для монтажа плит перекрытия технического этажа.</li></div><div><p><strong><strong>4-я секция:</strong></strong></p><div><ul><li>Плиты перекрытия 5- ого этажа - смонтированы.</li><li>Ведется кладка стен 6- ого этажа.</li></ul></div><p><strong>5-я секция:</strong></p></div><div><li>Заканчивается монтаж плит перекрытия 5- ого этажа.</li><li>Ведется кладка стен 6- ого этажа.</li></div><div><p><strong><strong>6-я секция:</strong></strong></p><ul><li>Закончен монтаж плит перекрытия 2- ого этажа.</li><li>Ведется кладка стен 3- его этажа.</li></ul><p><strong><strong>Ход строительства проекта \"Vlasna\"</strong></strong></p></div><div><strong><strong>Дом № 1:</strong></strong></div><div><li>Внешняя отделка фасада выполнена на 95 %.</li><li>Ведутся отделочные работы в местах общего пользования ( коридоры и лестничные марши подъезда).</li><li>Ведутся подготовительные работы для установки входных дверей в квартиры.</li></div><div><p><strong><strong><strong><strong><strong><strong><strong>Дом № 2:</strong></strong></strong></strong></strong></strong></strong></p><ul><li>Закончена кладка стен 3- его этажа.</li><li>Смонтированы плиты перекрытия 3- его этажа.</li><li>Ведется кладка стен 4- ого этажа.</li><li>Ведется монтаж межкомнатных перегородок на 2, 3 - ем этажах.<br></li></ul><p><strong><strong><strong>Благоустройство территории ЖК \"Новая Конча Заспа\"</strong></strong></strong></p><ol><li>Продолжается строительстве очистных сооружений ЖК \"Новая Конча Заспа\".( фото № 8).</li><li>Продолжается монтаж и строительство детской площадки между домами Линц и Грац.( фото № 7).</li><li>Ведется благоустройство дороги по улице И. Франка от дома Щатель к дому \"1-а Житлова\". (фото № 5).</li><li>ЖК \" Новая Конча Заспа\" : <a href=\"https://www.youtube.com/watch?feature=share&utm_source=Viber&utm_campaign=Private&v=rgDGq76IJoU&utm_medium=Chat&app=desktop\">https://www.youtube.com/watch?feature=share&utm_source=Viber&utm_campaign=Private&v=rgDGq76IJoU&utm_medium=Chat&app=desk</a></li><li><a href=\"https://www.youtube.com/watch?feature=share&utm_source=Viber&utm_campaign=Private&v=rgDGq76IJoU&utm_medium=Chat&app=desktop\"></a></li><li><a href=\"https://www.youtube.com/watch?feature=share&utm_source=Viber&utm_campaign=Private&v=rgDGq76IJoU&utm_medium=Chat&app=desktop\"></a></li></ol></div><div><b>Правила посещения строительного объекта:</b></div><div><ol><li>Запрещено посещение объекта в активные рабочие дни: понедельник - суббота.</li><li>Посещать объект следует  в субботу , согласно календаря,  с 16.00 до 19.00.</li><li>В воскресенье с 10.00 до 19.00.</li><li>Инвесторы должны быть обеспечены строительными касками ( каски следует получить в отделе продаж).</li><li>Допуск детей на строительный объект строго запрещен.</li><li>Посещение объекта должно происходить в сопровождении сотрудника отдела продаж.</li></ol></div><div><b>\"Ваша безопасность в соблюдении простых правил\". Спасибо.</b></div><br><p></p>', 1, 'artc_20171205114709870.jpg', 2, 0, '', '', '', '', '', 1, 1, 0, '2017-12-03 00:00:00', '2018-05-14 10:34:47', NULL),
(68, 'Сделаем первый шаг к привычке жить в большой и светлой квартире!', '<p></p><div></div><p><span style=\"font-size: 12px;\"><b>Когда нужна комната для ребенка…</b></span><br></p>\r\n\r\n<p>Минимальный возраст перевода в отдельную комнату – три года:\r\nнекоторые дети уже в этот период стремятся к отделению от взрослых. В\r\nбольшинстве случаев период, когда ребенку необходимо личное пространство\r\nнаступает в пять-семь лет. Особенно важно иметь свое пространство в\r\nподростковом возрасте, с 12 лет изолированное помещение для ребенка является\r\nжизненной необходимостью. </p>\r\n\r\n<p><b>Предлагаем\r\nрассмотреть квартиру, 71 м2.&nbsp;</b><b style=\"font-size: 12px;\">Окна выходят в\r\nблагоустроенный тихий двор, Ваш малыш всегда будет на виду и мама будет\r\nспокойна.</b></p><div></div><div>Также Вы можете посмотреть наши Экохаусы с личными двориками, где Вашим малышам&nbsp;<span style=\"font-size: 12px;\">будет вдвойне удобно и защищенно- </span><a href=\"https://n-k-\" style=\"font-size: 12px;\"></a><a href=\"https://n-k-z.com/townhouse/\" style=\"font-size: 12px;\">https://n-k-z.com/townhouses/</a></div><div><br></div><div><p><img src=\"/myprotected/redactor/demo/scripts/uploads/3a35ada624440a4a4110d33836ecf952.jpg\" style=\"\"><img src=\"/myprotected/redactor/demo/scripts/uploads/75a694848f8fce21637187faf9715da2.jpg\" style=\"font-size: 12px; cursor: nw-resize;\"></p><p>Рекомендуем, также, при выборе квартиры, оценить перспективы направления, где присматриваете жилье..&nbsp;</p><p>Как семья будет добираться к Метро, в каких пробках на дорогах уже приходиться стоять и какая перспектива пробок уже через год-два&nbsp;</p><p><a href=\"https://n-k-z.com/news/63/\">https://n-k-z.com/news/63/</a><br></p><br></div><p></p>\r\n', 2, 'artc_20171206150610509.jpg', 1, 0, '', '', '', '', '', 1, 1, 0, '2017-12-06 00:00:00', '2018-01-26 14:43:21', NULL),
(69, 'Праздники продолжаются - в подарок Samsung SMART TV при покупке квартиры', '<p></p><p><span style=\"font-size: 12px;\">Предлагаем рассмотреть светлую просторную квартиру, 72 м2, их осталось всего две на высоких этажах с прекрасными видами на Ходосеевку.</span><br></p>\r\n\r\n<p>Многофункциональная кухня – от 14 м2, панорамное остекление, практичная гардеробная. Отличный выбор для всей семьи.</p><p>Посмотреть планировку квартиры и варианты меблировки <a href=\"https://n-k-z.com/flats/lion/r2/\">можно здесь.</a></p><p>В подарок телевизор Smart-TV.</p><p></p><p><img src=\"/myprotected/redactor/demo/scripts/uploads/603b62a1945ec557d0be95ad0dbea212.jpg\" style=\"width: 542.114px; height: 378px;\"></p><br><p></p>Читайте также - <a href=\"https://n-k-z.com/news/63/\">\"Эксперты назвали перспективные направления для покупки жилья\"</a><p></p>\r\n', 1, 'artc_20171214124241391.jpg', 3, 0, '', '', '', '', '', 1, 1, 0, '2018-01-11 00:00:00', '2018-02-12 17:48:14', NULL),
(70, 'Государственный банк “ПриватБанк“ и застройщик “AVM Development Group“ начинают сотрудничество!', '<p></p><p></p><p><img src=\"/myprotected/redactor/demo/scripts/uploads/540195aec9d03a9b6c0d4651fc0055c1.jpg\" style=\"width: 819.805px; height: 322px;\"></p><br><p></p><p>Банк “ПриватБанк“ начал выдачу кредитов в рамках Программы\r\nцелевого розничного кредитования “Жилье в кредит“ (первичный рынок) для\r\nфизических лиц по условиям сотрудничества с компанией <strong>“</strong><strong>AVM</strong><strong>Development</strong><strong>Group</strong><strong>“.</strong></p><p>\r\n<span>Одним из первых заемщиков стал владельцем замечательной\r\nквартиры в <strong>жилом комплексе “Новая\r\nКонча-Заспа“</strong>, который строит “AVM Development Group“ и аккредитован в Банке “ПриватБанк“.</span></p><p>\r\n<span>Благодаря партнерству с <span>“</span>AVM Development Group“ Банк “ПриватБанк“\r\nпредлагает кредиты на новые современные квартиры от застройщика.</span></p><p><span>\r\nС деталями кредитования по Программе целевого розничного\r\nкредитования “Жилье в кредит“ (первичный рынок) для физических лиц по условиям\r\nсотрудничества с компанией “AVM Development Group“ можно ознакомится на сайте финансового учреждения.<br><br></span></p><p></p>\r\n', 1, 'artc_20171215154252709.jpg', 1, 0, '', '', '', '', '', 1, 1, 0, '2017-12-15 00:00:00', '2018-03-28 15:33:14', NULL),
(71, 'Эксперты определили, что скрывают застройщики за низкой ценой жилья в пригороде  и зачем это делают', '<p></p><p>Проведем\r\nценовой анализ строящеся недвижимости в пригороде\r\nКиева.</p>\r\n\r\n<p>1)<span>&nbsp;\r\n</span>В диапазоне\r\n&nbsp;9 000-11 500 грн /м2 , в киевской\r\nобласти&nbsp; представлены&nbsp; 73 ЖК</p>\r\n\r\n<p>Главным\r\nобразом это жилые комплексы&nbsp;<span style=\"font-size: 12px;\">Бучи, Белогородки,\r\nИрпеня, Гостомеля, Ворзеля, &nbsp;Святопетровского</span></p>\r\n\r\n<p>Т.е. это &nbsp;все направления с&nbsp; самой высокой концентрацией строительства, именно\r\nони демонстрируют рынку низкие цены.&nbsp;<span style=\"font-size: 12px;\">Чем\r\nобусловлено такое поведение &nbsp;застройщиков?</span></p>\r\n\r\n<p><ul><li>- концентрация\r\nЖК в направлении Ирпень, Буча, Гостомель, Ворзель - 163&nbsp;\r\nновостройки<br></li><li>- направление&nbsp;\r\nСвятопетровское,&nbsp; Белогородка -\r\n58 строящихся объектов<br></li></ul></p><p></p><p></p><p><img src=\"/myprotected/redactor/demo/scripts/uploads/786083a3a0d17ed1f843d08da344ff68.jpg\" style=\"width: 289.318px; height: 380px;\"></p><p><b>Основной вывод:&nbsp; </b></p>\r\n\r\n<p>Что &nbsp;знают застройщики и о чем не говорят&nbsp; будущим&nbsp;\r\nинвесторам? – про&nbsp; перспективы\r\nсерьезных пробок&nbsp; на выездах&nbsp; к&nbsp;\r\nцентральным магистралям, особенно через год-два. Вышеперечисленные\r\nнаправления являются проблемными уже сейчас, а через год строительства и заселения, это будет большая проблема.</p>\r\n\r\n<p>Что же делать в подобной ситуации? –\r\nдемпинговать, пока рынок еще не оценил будущего коллапса.</p>\r\n\r\n<p></p>\r\n\r\n<p>2)<span>&nbsp; </span>В диапазоне\r\n12 000-14 000 грн /м2 , в киевской области&nbsp;\r\nпредставлены&nbsp; 89 ЖК</p>\r\n\r\n<p>Такие цены &nbsp;показывают ЖК, расположенные ближе к\r\nцентральным магистралям&nbsp;<span style=\"font-size: 12px;\">Вишнёвое,\r\nБорщаговка, Гатное</span></p>\r\n\r\n<p>На сколько\r\nгусто застраиваются эти направления:</p>\r\n\r\n<p><ul><li>- Борщаговка\r\n– 14 новых строящихся объекта<br></li><li>- Вишневое,\r\nКрюковщина – 37 ЖК<br></li><li>- Вышгород-\r\n7 новостроек<br></li><li>- Ходосеевка\r\n– 4 новых объекта<br></li></ul></p>\r\n\r\n\r\n\r\n\r\n\r\n<p><img src=\"/myprotected/redactor/demo/scripts/uploads/65e1e75e9f8bf1288a7090e23677d36d.jpg\" style=\"width: 308.074px; height: 327px;\"></p><p>Основной вывод:</p>\r\n\r\n<p>Близость &nbsp;к трассам Одесской, Обуховской, &nbsp;Окружной, снижают риски «стоять в пробке»… Это\r\nсразу отражается на цене, она выше.</p>\r\n\r\n<p>Какое же из направлений, &nbsp;в пригороде Киева, является наиболее\r\nперспективным?</p>\r\n\r\n<p>1.<span>&nbsp; </span>Ходосеевка&nbsp; (Новобуховская трасса).</p>\r\n\r\n<p>2.<span>&nbsp; </span>Вышгород.</p>\r\n\r\n<p>Главными аргументами, которые позволяют\r\nнаправление назвать «перспективным», являются: количество новых строящихся\r\nобъектов (не более 7) и время на стояние в пробке – в этих направлениях пробок\r\nдо метро НЕТ. Из Ходосеевки, в час-пик, поехать можно за 15 минут, из Вышгорода\r\nчуть дольше, пробки Оболони никуда не исчезнут – едим минут 30-35.</p>\r\n\r\n<p>Но!</p>\r\n\r\n<p>Что же\r\nпроисходит с покупателем, который выбрал пригород в сегменте 12-14&nbsp;000 грн/м2?\r\nВключается сравнительный анализ с аналогичным&nbsp;\r\nпредложением в Киеве.</p>\r\n<p>1)<span>&nbsp; </span>Проанализируем&nbsp; сегмент жилых комплексов в Киеве, в разрезе\r\nцен&nbsp; 10 000 -14&nbsp;000 грн/м2 &nbsp;:</p>\r\n\r\n<p>Представлено 22 новостройки, половина из\r\nкоторых – это проблемные комплексы Войцеховского, а вторая половина –\r\nмонолитные высотки!</p>\r\n\r\n<p>Таким\r\nобразом, будущий инвестор каждый день стоит перед выбором «У кого покупать?»,\r\n«Чем я рискую?» «Что ждет меня и мою в этой новостройке через год?»</p>\r\n\r\n<p></p>\r\n\r\n<p>Выводы:</p>\r\n\r\n<p>- Покупка квартиры в «дешевом» &nbsp;пригороде &nbsp;Киева - это пробки, пробки, пробки.</p>\r\n\r\n<p>- Можем позволить &nbsp;пригород «подороже» , сразу включается&nbsp; сравнительный анализ&nbsp; с «дешевым» Киевом .</p>\r\n\r\n<p>- «Дешевый» &nbsp;Киев&nbsp; -\r\nэто недострой, монолит,\r\nвысотки.</p>\r\n\r\n<p>Выбирайте сами!&nbsp; </p>\r\n\r\n<p>Классический &nbsp;пригород, если это еще и &nbsp;малоэтажное жилье из красного кирпича – лучшая\r\nкапитализация! </p>\r\n\r\n<p></p>\r\n\r\n<p>Оценим один из ЖК, в перспективном\r\nнаправлении Новообуховской трассы, с. Ходосеевка:</p>\r\n\r\n<img>ЖК Новая Конча – Заспа - это малоэтажное жилье,&nbsp; классический пригород.<br><p></p><p></p><p><img src=\"/myprotected/redactor/demo/scripts/uploads/7f5d0f679c22a6a0598409e7c531e8bc.jpg\" style=\"width: 879.231px; height: 254px;\"></p><p><img src=\"/myprotected/redactor/demo/scripts/uploads/f8a06e3bc1067b5d1733461c57017fa6.jpg\" style=\"width: 879.349px; height: 276px;\"></p>Это исторически успешное направление. Вся элита\r\nздесь. Рядом Печерск, правительственный квартал, столичное шоссе,&nbsp; спортивная база «Динамо» - в этом направление\r\nсамое модное и продвинутое ВСЕ и все самое дорогое.<br><p></p><p>Потребности каждого будут удовлетворены УЖЕ! –\r\nполиклиника, рестораны, школа, детский сад, мегамаркет, кинотеатры, шоппинг,\r\nзанятие спортом, библиотеки, конный спорт.<br></p><p></p><p><img src=\"/myprotected/redactor/demo/scripts/uploads/8de5f5e55f3b8980a79e4ac02d718026.jpg\" style=\"width: 886.364px; height: 500px;\"></p>Безопасность УЖЕ гарантирована социальным&nbsp; окружением. Главное – понимать: жизнь среди\r\nуспешных, благополучных людей способствует тому, что мы и сами становимся более\r\nцелеустремленными и активными. Покупатели &nbsp;- успешный класс ТОП-менеджеров.<br><p></p><p></p><p></p><p><img src=\"/myprotected/redactor/demo/scripts/uploads/30d7f27c68b2246c96934a5e76c62c92.jpg\" style=\"width: 886.545px; height: 551px;\"></p><p><img>Трасса, ведущая к метро- без пробок!\r\nПерспектива \"Без пробок\" сохранится (всего 4 ЖК в этом направлении,\r\nскоростная \"правительственная\" трасса).</p><p><img src=\"/myprotected/redactor/demo/scripts/uploads/cf8bc57f157cf2caf89fc28d5e88cb08.jpg\" style=\"width: 889.313px; height: 233px;\"></p><p><img>Заповедно-санаторная&nbsp; зона (климат полезен для здоровья)&nbsp; - рядом \"Голосеевский национальный\r\nприродный парк», лесопарковая зона \"Конча-Заспа\", лечебное&nbsp; Голубое озеро. Исторически в этом направлении\r\nлучшие санатории, &nbsp;целебно-оздоровительные и спортивные комплексы.</p><p><img src=\"/myprotected/redactor/demo/scripts/uploads/34f51a0232fed1f9f213861a6452d561.jpg\" style=\"width: 886.151px; height: 303px;\"></p><br><p></p><p></p>\r\n', 1, 'artc_20171218164455400.jpg', 6, 0, '', '', '', '', '', 1, 0, 0, '2017-12-18 00:00:00', '2018-01-25 10:23:25', NULL),
(74, 'Лоджия в подарок! Ваша квартира уже осенью с первым взносом 7300 уе!', '<p>Акционное предложение на просторную 1-к квартиру в 5-й секции дома \"Лион\". Это самая классная секция - на этаже всего 4 квартиры, лифт, подъезд с колясочными и комнатой вахтера.</p><p>С целью эффективного использования пространства лоджии в однокомнатной квартире, наши инвесторы ее максимально интегрируют в жилое пространство. </p><p><b>Только в этом месяце мы дарим лоджию всем покупателям однокомнатных квартир 45,3 кв.м. Такая квартира находится в 5-й секции девятиэтажного дома \"Лион\".  Количество квартир ограничено.<br></b></p><p><b></b></p><p><b><img src=\"/myprotected/redactor/demo/scripts/uploads/78e5904dfff83032434f026cdce6d0c3.jpg\" style=\"\"></b></p><p></p><p>Современной тенденцией в оформлении квартиры является объединение комнаты и лоджии, которое позволяет заметно увеличить полезный метраж и сделать помещение светлее. </p><p>В конечном итоге такой дизайн преображает комнату и делает её еще комфортней.</p><p><p><b>В зависимости от целей, на лоджии можно сделать:</b></p><ul><li>- небольшой рабочий кабинет, </li><li>- поставить пуфики и сделать зону для чтения или медитации, </li><li>- просто поставить кушетку и любоваться холмами через панорамные окна.</li></ul></p>\r\n', 1, 'artc_20171221115746976.jpg', 1, 0, 'Спецпредложение', '', '', '', '', 1, 0, 0, '2018-05-04 00:00:00', '2018-05-05 09:53:10', NULL),
(73, 'Экологическое жилье европейского образца!', '<p></p><p>По итогам 2017 года, ЖК «VLASNA», получил звание «Экологического жилья европейского образца» (по данным аналитического центра премии «Украинский национальный олимп»)<br>Поздравляем всех сотрудников компании с хорошей работой!</p><p><img src=\"https://n-k-z.com/myprotected/redactor/demo/scripts/uploads/c1f096543c123894e70244de3c20c022.jpg\" style=\"width: 316.215px; height: 430px;\"></p><p><b>Мы гордимся своей компанией — застройщиком. </b><b>НОВЫЙ УРОВЕНЬ ЖИЗНИ – это </b><b>AVM</b><b>!</b></p><p></p>\r\n', 1, 'artc_20171219131236530.jpg', 0, 0, '', '', '', '', '', 1, 0, 0, '2017-12-19 00:00:00', '2018-01-15 21:36:04', NULL),
(75, 'Компания AVM Development Group поздравляет с Новым годом и Рождеством', '<p>Дорогие партнеры, инвесторы и клиенты! </p>Компания AVM Development Group поздравляет вас с Новым годом и от души хотим пожелать, чтобы наше сотрудничество привело нас всех к достатку и высоким результатам. <br><p></p><p>Чтобы новый год внёс в нашу деятельность замечательные идеи и задумки. Пусть будут в жизни процветание, любовь и счастье, а в работе — креатив, удача и успех. </p><p>Желаем нам дальнейшего благополучного партнерства, а всем вам — мира и добра! Пусть в Новом году сбываются мечты и обязательно появляются новые.</p><p>С Новым 2018 годом и Рождеством!</p><p><br></p>\r\n', 1, 'artc_20171231181532607.jpg', 2, 0, '', '', '', '', '', 1, 1, 0, '2017-12-29 00:00:00', '2018-01-15 21:33:02', NULL),
(76, 'Экохаусы - чуть больше, чем эко-жилье.. Это - экомир!', '<p></p><p><b>Что же хочет купить семья, когда начинает думать\r\nпро собственный дом?</b></p>\r\n\r\n<p>Как показывает опрос\r\nнаших клиентов, при решении купить\r\nдом, первое, на что обращает внимание каждый человек – это внешний вид дома и его индивидуальность.  Дом подчеркивает собственный статус владельца.</p>\r\n\r\n<p><b>Почему выбирают наши Экохаусы?   </b></p>\r\n\r\n<p><b>Во-первых</b>, это статусное жилье, это - экомир!  Ценность  не только в архитектуре,  сколько в социальной  значимости объекта. Безопасность, успех и благополучие УЖЕ гарантированы  социальным \r\nокружением. «Чужих»  тут нет, рядом только свои!</p>\r\n\r\n<p><b>Во-вторых, \r\nэто ликвидные объекты недвижимости. </b> Ожидаемая\r\nдоходность экохаусов  - 34% годовых в\r\nвалюте, при растущем спросе на жилье по Новообуховской трассе  (<a href=\"https://n-k-z.com/news/63/\"><b><span>https://n-k-z.com/news/63/</span></b></a><b> ) </b></p>\r\n<p><b>Какие дополнительные преимущества в покупке наших\r\nЭкохаусов</b><br></p>\r\n\r\n<p><b>В  этом\r\nместе нужно жить </b>– это исторически успешное направление. Вся\r\nэлита здесь. Рядом Печерск, правительственный квартал, столичное шоссе.. в этом\r\nнаправление самое модное и продвинутое ВСЕ и все самое дорогое.  Заповедно-санаторная  зона (климат полезен для здоровья!)  - рядом \"Голосеевский национальный\r\nприродный парк\" , лесопарковая зона \"Конча-Заспа\",  лечебное Голубое озеро.  </p>\r\n\r\n<p><b>Потребности каждого члена семьи  будут удовлетворены УЖЕ</b>!  Рядом\r\nрасположен комплекс услуг, развлечений,  досуга:  поликлиника, рестораны, школа, детский сад,\r\nмегамаркет, кинотеатры, шоппинг, занятие спортом, библиотеки, параглайдинг, конный спорт.</p>\r\n\r\n<p><b>Также,  очень важная  выгода – это время!</b> Каждый день вы пользуетесь трассой - без пробок!\r\nПерспектива \"Без пробок\" сохранится \r\nнавсегда, т.к.  это -  скоростная \"правительственная\"\r\nтрасса</p>\r\n\r\n<p><b>Дополнительный бонус к статусу – в домах </b> <b>предусмотрена современная  комплектация \r\nсистемы «умный дом».</b>  10\r\nбазовых устройств контролируют: системы отопления и освещения,\r\nвидеонаблюдения,  розетки, теплый пол,\r\nсчетчики, управление шторами и проч., а также подключение  до 16 датчиков.  </p>\r\n\r\n<p><b>ДОСТОЙНОЕ  предложениe , чтобы изменить собственную жизнь\r\nи жизнь своей семьи!</b></p><br><p></p>\r\n', 1, 'artc_20180116144412668.jpg', 5, 0, '', 'экохаусы;\r\nаналитика рынка;', '', '', '', 1, 0, 1, '2018-01-16 00:00:00', '2018-01-16 17:23:10', NULL),
(77, 'Престижный классический  пригород. Эксперты назвали основные критерии', '<p><b>Престижный классический &nbsp;пригород. Эксперты назвали основные критерии</b></p>\r\n\r\n<p>Просторный, светлый дом с вечнозеленым\r\nгазоном перед ним, деревья, чистый, по - сравнению с городским, воздух, никакой\r\nсуеты мегаполиса, &nbsp;дети растут вдали от пыли &nbsp;большого\r\nгорода… - идиллическая сюжетная линия от многих застройщиков столичного\r\nпригорода. Счастливая и достойная семейная жизнь в собственном доме – один из\r\nцентральных лейтмотивов общего комплекса представлений о доме-мечте. </p>\r\n\r\n<p>Желание уберечь свое счастье от\r\nнегативных внешних факторов современного мира и приводит &nbsp;средний класс и выше &nbsp;к жизни в пригородах, а застройщиков – к\r\nудовлетворению такой потребности</p>\r\n\r\n<p><b>Что предлагает Киев и пригород современному\r\nпокупателю?&nbsp; - Широкий выбор: </b></p>\r\n\r\n<p><b>-в Киеве – 356 строительных площадок, со следующим &nbsp;ценовым предложением</b></p>\r\n\r\n<p></p><p><img src=\"/myprotected/redactor/demo/scripts/uploads/be0184b2186cfd5c469592571e7fd2d9.jpg\" style=\"width: 781.495px; height: 351px;\"></p>\r\n\r\n<p></p><p><b>-в пригороде Киева – 317 новостроек с ценой от 9500 до\r\n14-15000 грн/м2</b></p>\r\n\r\n<p></p><p><img src=\"/myprotected/redactor/demo/scripts/uploads/fa93ac5df43411046f6c204eabc1b656.jpg\" style=\"width: 780.201px; height: 552px;\"></p>\r\n\r\n<p></p><p><b><iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/HbP331GG9o8?rel=0\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen=\"\" style=\"background-color: rgb(255, 255, 255); font-size: 12px;\"></iframe><br></b></p><p><b>Разберемся с престижным классическим пригородом. </b></p>\r\n\r\n<p>Какие основные критерии и что клиент\r\nдолжен получать в том случае, когда ему продают&nbsp;\r\nпроект в пригороде</p>\r\n\r\n<p><b>1)</b><span>&nbsp;\r\n</span><b>Это - малоэтажное жилье, этажность &nbsp;6 &nbsp;+ 1\r\nмансарда, использование кирпича, желательно красного</b>, <b>низкая плотность\r\nзастройки, множество зелени, парков, зоны спокойного отдыха и активного\r\nвремяпрепровождения.</b></p>\r\n\r\n<p>В киевской области понятие\r\n«классический пригород» искривлено в строну социальных &nbsp;монолитных&nbsp;\r\nвысоток, плотной застройки.</p>\r\n\r\n<p>Сегодня подавляющее\r\nбольшинство столичных новостроек представляет собой многоэтажные, а часто еще и\r\nмногосекционные жилые дома с типовой унылой архитектурой, крошечными дворами,\r\nсудьба которых после заселения – быть плотно заставленными машинами.</p>\r\n\r\n<p>Исключения в виде комплексной\r\nмалоэтажной застройки в черте города единичны, среди которых хочется отметить\r\nЖК «Дания», ЖК «Барселона», ЖК «Квартал Буча», ЖК «Европейка», &nbsp;ЖК «Новая\r\nКонча-Заспа»</p>\r\n<p><b>2)<span>&nbsp;\r\n</span></b><b>Это - трасса, ведущая к метро, &nbsp;а если быть более точным – это время!, которое\r\nнеобходимо, чтобы доехать к метро.</b></p>\r\n\r\n<p>Заявления застройщиков «5\r\nминут до метро» - это не значит доехать за такое время.</p>\r\n\r\n<p>Густо застроенные\r\nнаправления Бучи, &nbsp;Ирпеня (163\r\nстроительные площадки), Вишневого и Крюковщины&nbsp;\r\n(127 стройки), Борщаговки, Святопетровского (58&nbsp; новостроек) не позволяют в час-пик добраться\r\nк ближайшему метро даже за 40 минут!&nbsp; Строительство\r\nв этих направлениях ведется очень активно и «время в пути» будет только\r\nувеличиваться.</p>\r\n\r\n<p>Наиболее перспективными в этом смысле\r\nявляются жилые комплексы&nbsp; Вышгорода и\r\nплощадки по Новообуховской трассе.&nbsp;\r\nПерспективно выглядят &nbsp;ЖК «Новая\r\nКонча-Заспа» и ЖК «VLASNA»</p>\r\n<p><b>3)<span>&nbsp;\r\n</span></b><b>Это – готовая инфраструктура. </b></p>\r\n\r\n<p>Городская социальная\r\nинфраструктура по-прежнему остается на несколько порядков выше, чем &nbsp;в пригороде. </p>\r\n\r\n<p>Даже если застройщик\r\nвозводит в пригороде не отдельно взятый дом, а полноценный жилой комплекс, ему\r\nне под силу обеспечить всех жильцов полным набором необходимых инфраструктурных\r\nобъектов: от супермаркетов и больниц до детских учреждений и заведений сферы\r\nбыта.</p>\r\n\r\n<p>Более того, обещанный\r\nкомфорт и удобства – это, как правило, долгосрочная перспектива и риски, а\r\nсразу купить жилье и получить ВСЕ для всей семьи – это серьезная задача для\r\nстроительных компаний, т.к. готовая инфраструктура – это &nbsp;дополнительная стоимость к затратам на покупку\r\nземли. На такие затраты идут лишь те застройщики, кто уверен в собственных\r\nсилах и намерениях.</p>\r\n\r\n<p>Примером может послужить жилой комплекс\r\nна территории аутлет- городка Мануфактура. Даже&nbsp;\r\nна этапе старта продаж у инвесторов площадки «Новая Конча-Заспа» &nbsp;было&nbsp;\r\nуже ВСЕ!!!&nbsp; Потребности каждого члена\r\nсемьи тут &nbsp;удовлетворены в полном объеме –\r\nполиклиника, рестораны, школа, детский сад, Мегамаркет, кинотеатры, шоппинг,\r\nзанятие спортом, библиотеки, конный спорт, параглайдинг…</p>\r\n\r\n<p></p>\r\n\r\n<p></p>\r\n\r\n<p><b>4)<span>&nbsp;\r\n</span></b><b>Это – безопасность. </b></p>\r\n\r\n<p>Как правило, под\r\nбезопасностью подразумевают: закрытую территорию, &nbsp;охрану, видеонаблюдение.</p>\r\n\r\n<p>Безопасность необходимо\r\nрассматривать чуть шире – как место, как среду, где&nbsp; &nbsp;рядом\r\nс тобой живут такие же как ты, потому и гарантирована безопасность… </p>\r\n\r\n<p>Когда социальный пласт\r\nжителей комплекса сформирован&nbsp; ценой&nbsp; (застройщик продает на объеме и демонстрирует\r\nнизкую, доступную стоимость м2), в результате покупателями становится\r\nопределенная категория. </p>\r\n\r\n<p>&nbsp;Но, когда застройщик демонстрирует понятную\r\nвысокую стоимость, таким образом он еще и формирует сообщество будущих жильцов\r\n.. «Успех к успеху! Деньги к деньгам!» </p>\r\n\r\n<p></p>\r\n\r\n<p><b>5)<span>&nbsp;\r\n</span></b><b>Это качество жизни, которое получаешь вместе с новой\r\nквартирой.</b></p>\r\n\r\n<p>Каждая строительная\r\nплощадка вкладывает свой смысл в такое понятное определение. &nbsp;Качество жизни предполагает: </p>\r\n\r\n<p>- чистую окружающую среду;\r\nличную и национальную безопасность; политические и экономические свободы….</p>\r\n\r\n<p>В пригороде Киева\r\nэкологически - чистыми, заповедно-санаторными являются направления Ворзеля и\r\nКончи-Заспы. Исторически в этих &nbsp;направлениях &nbsp;лучшие санатории, целебно-оздоровительные и\r\nспортивные&nbsp; комплексы</p>\r\n\r\n<p>Наиболее интересные предложения в этих\r\nнаправлениях: &nbsp;ЖК «Ворзель Парк» и ЖК\r\n«Новая Конча-Заспа».</p>\r\n<p>Основные выводы:</p>\r\n\r\n<p>При выборе квартиры в классическом пригороде,\r\nследует обратить внимание, &nbsp;насколько жилой\r\nкомплекс соответствует критерию «престижный классический».</p>\r\n\r\n<p><b>1)<span>&nbsp;\r\n</span></b><b>Дома должны строить из кирпича (красного кирпича!),\r\nэтажность 6+1 мансарда,&nbsp; низкая плотность застройки, множество зелени,\r\nпарков, зоны спокойного отдыха и активного времяпрепровождения</b></p>\r\n\r\n<p><b>2)</b><span>&nbsp;\r\n</span><b>К метро добираться - не в пробке стоять… Заявленные\r\n5-10-15 минут – это и есть время, за которое можно доехать…</b> Особое внимание обращать на интенсивность застройки\r\nнаправления…В Направлениях&nbsp; &nbsp;Бучи,&nbsp;\r\nИрпеня, Вишневого, &nbsp;Крюковщины,\r\nБорщаговки, Святопетровского ситуация будет только усугубляться..</p>\r\n\r\n<p><b>3)<span>&nbsp;\r\n</span>«Готовая инфраструктура» - это не долгосрочная\r\nперспектива, собственные риски и ответственность застройщика, а УЖЕ ГОТОВАЯ &nbsp;инфраструктура!</b>&nbsp; Строительная\r\nплощадка, которая&nbsp; дает такое решение -\r\nэто уже &nbsp;заведомо ответственно, т.к.\r\nзастройщик&nbsp; платит больше за землю, а\r\nзначит намерения застройщика более чем серьезные. </p>\r\n\r\n<p><b>4)</b><span>&nbsp;\r\n</span><b>Безопасность в правильном классическом пригороде – это\r\nсреда и социальное окружение,</b> которое формирует\r\nзастройщик.&nbsp; Чем выше цена м2, при равных\r\nусловиях, тем понятнее почему рядом живут успешные, почему дети учатся в\r\nпродвинутых школах, почему рядом все двигаются вперед.</p>\r\n\r\n<p><b>5)<span>&nbsp;\r\n</span></b><b>Направление &nbsp;должно\r\nсоответствовать понятием «заповедный», экологически-чистый», «полезно для\r\nздоровья»</b></p>\r\n\r\n<p></p>\r\n\r\n<p>И только теперь &nbsp;можно сказать: я живу в просторном, светлом &nbsp;доме, у меня все рядом, все потребности семьи\r\nрешены уже, я спокоен за своих детей и близких- у меня правильное социальное\r\nокружение,&nbsp; я живу в\r\nсанаторно-курортной&nbsp; зоне, моему здоровью\r\nздесь все полезно!</p>\r\n<p>Выбирайте внимательно, живите в престижном\r\nклассическом пригороде!</p>\r\n<p>·<span>&nbsp;\r\n</span>В ЖК\r\nVLASNA&nbsp; &nbsp;все большую популярность приобретают квартиры\r\nс просторной террасой <span><a href=\"http://vlasna.com.ua/\">http://vlasna.com.ua/</a>&nbsp;</span></p>\r\n\r\n<p>·<span>&nbsp;\r\n</span>Хит\r\nпродаж в ЖК Новая Конча-Заспа&nbsp; -\r\nдвухуровневые многофункциональные квартиры для самых нестандартных решений- <span><a href=\"https://n-k-z.com/flats/shatel/rn/\">https://n-k-z.com/flats/shatel/rn/</a></span></p><p></p><p><img src=\"/myprotected/redactor/demo/scripts/uploads/868c67255b3a46cf91cc45eee5b7d2aa.jpg\" style=\"width: 755.204px; height: 754px;\"></p><br><p></p><p></p>\r\n', 1, NULL, 6, 0, '', '', '', '', '', 1, 0, 0, '2018-01-26 00:00:00', '2018-02-09 15:41:30', NULL),
(78, 'Живите  в престижном классическом пригороде!', '<p></p><p>При выборе квартиры в классическом пригороде,\r\nследует обратить внимание на следующие факторы:</p>\r\n<p>1)<span> \r\n</span>Дома должны строить из\r\nкирпича (красного кирпича!), этажность 6+1 мансарда, низкая плотность\r\nзастройки, множество зелени, парков, зоны спокойного отдыха и активного\r\nвремяпрепровождения</p>\r\n\r\n<p>2)<span> \r\n</span>К метро добираться - не в\r\nпробке стоять… Заявленные 5-10-15 минут – это и есть время, за которое можно\r\nдоехать… </p>\r\n\r\n<p>3)<span> \r\n</span>«Готовая инфраструктура» -\r\nэто не долгосрочная перспектива, собственные риски и ответственность\r\nзастройщика, а УЖЕ ГОТОВАЯ \r\nинфраструктура!  </p>\r\n\r\n<p>4)<span> \r\n</span>Безопасность в правильном\r\nклассическом пригороде – это среда и социальное окружение.</p>\r\n\r\n<p>5)<span> \r\n</span>Направление  должно соответствовать понятием «заповедный»,\r\nэкологически-чистый», «полезно для здоровья»</p><p><iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/HbP331GG9o8?rel=0\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen=\"\"></iframe><br></p>\r\n<p>Жители нашего комплекса могут сказать: </p>\r\n\r\n<p>«Я живу в просторном, светлом  доме, у меня все рядом - все потребности\r\nсемьи решены уже, я спокоен за своих детей и близких - у меня правильное\r\nсоциальное окружение,  я живу в заповедной  зоне - моему здоровью здесь все полезно!»</p>\r\n<p><b>Присоединяйтесь!</b></p>\r\n<p>·<span> \r\n</span>В ЖК\r\nVLASNA все большую популярность приобретают квартиры\r\nс просторной террасой <a href=\"http://vlasna.com.ua/\"><span>http://vlasna.com.ua/</span></a></p>\r\n\r\n<p><span>·<span> \r\n</span></span>Хит\r\nпродаж в ЖК \"Новая Конча-Заспа\"  -\r\nдвухуровневые многофункциональные квартиры для самых нестандартных решений- <a href=\"https://n-k-z.com/flats/shatel/rn/\"><span>https://n-k-z.com/flats/shatel/rn/</span></a></p><p><img src=\"/myprotected/redactor/demo/scripts/uploads/8e95c25c4718401afd239e8d5c14bba4.jpg\" style=\"width: 671.102px; height: 670px;\"></p><br><p></p>\r\n', 1, 'artc_20180208144922454.jpg', 6, 0, '', '', '', '', '', 1, 0, 0, '2018-02-05 00:00:00', '2018-02-08 14:49:22', NULL),
(80, 'Построенные объекты', '<p>В рамках ЖК \"Новая Конча-Заспа\" первым построенным объектом стал 6-ти этажный дом \"Клубный\" на 60 квартир, строительство которого было завершено в 2014 г. Это был первый многоквартирный дом в Ходосеевке, и высокий спрос показал необходимость строительства следующих домов.</p><p></p><p></p><p><img src=\"/myprotected/redactor/demo/scripts/uploads/aa77f0a3c821a72a64e697fc9ba7a283.jpg\" style=\"width: 405.826px; height: 231px;\"></p><p>Поэтому в 2014 году было начато строительство двух 6-ти этажных домов, которые были названы в честь австрийских городков - “Линц”\r\nи “Грац”. Эти два дома были сданы в эксплуатацию в конце 2015 г.</p><p><img src=\"/myprotected/redactor/demo/scripts/uploads/c29ac5a0a7b9e0c0c40f2dafe7f8cd4e.jpg\" style=\"width: 405.375px; height: 282px;\">&nbsp;&nbsp;<img src=\"/myprotected/redactor/demo/scripts/uploads/5b496bec39e81e304612932784427fb3.jpg\" style=\"font-size: 12px; width: 422.456px; height: 281px;\"></p> \r\n\r\n<p></p><p>Общаясь с клиентами, мы часто слышали запросы на классические пригородные форматы жилья, поэтому было решено начать строительство нескольких линий таунхаусов (сблокированных двухэтажных домов с небольшим участком для каждого хозяина). Такой формат был выбран неслучайно - таунхаусы имеют все преимущества частного дома при несравнимо более низких эксплуатационных расходах на содержание дома и отопление.</p><p>Всего за период 2014-2016 г. было построено около 50 домиков таунхаусов с различными вариантами планировок и метражей.</p><p><img src=\"/myprotected/redactor/demo/scripts/uploads/4b0eebe8a199701f25be71690a7c1e4b.jpg\" style=\"width: 403.985px; height: 280px;\">&nbsp;&nbsp;<img src=\"https://n-k-z.com/myprotected/redactor/demo/scripts/uploads/3a41127dec796ef574a69ed8b2db8918.jpg\" style=\"width: 436.6px; height: 280px;\"></p>\r\n<p></p><p>В период 2015-2017 года жилой комплекс “Новая Конча-Заспа”, начал уверено расти к\r\nтаким масштабам, которые мы можем увидеть сейчас.</p><p><img src=\"https://n-k-z.com/myprotected/redactor/demo/scripts/uploads/ead2c38c06e3dc95bd53232aa8bf55e4.jpg\" style=\"width: 848.754px; height: 477px;\"><br></p>\r\n\r\n<p>\r\n\r\n</p><p>В глубине Ходосеевки, на холмах, построен коттеджный городок закрытого\r\nтипа на 30 коттеджей.</p><p></p><p><img src=\"/myprotected/redactor/demo/scripts/uploads/39c7f0fe802a341044e7a0af3511ea9f.jpg\" style=\"width: 423.5px; height: 287px; float: left; margin: 0px 10px 10px 0px;\" alt=\"\"></p><p><img src=\"/myprotected/redactor/demo/scripts/uploads/2ce30b2cc952a71b97faa5de4c8f3f98.jpg\" style=\"width: 424.35px; height: 287px;\"></p><p></p><p>Ориентировка на\r\nблагополучные с точки зрения инфраструктуры места застройки, всегда соблюдаемые\r\nсроки сдачи и отлаженные бизнес-процессы, позволяют нашим комплексам регулярно получать награды в различных номинациях.</p><p><img src=\"/myprotected/redactor/demo/scripts/uploads/44510d6320f1dbdf1576ce5d68f949e4.jpg\" style=\"width: 287.866px; height: 356px; float: left; margin: 0px 10px 10px 0px;\" alt=\"\"></p><p></p><p><img src=\"/myprotected/redactor/demo/scripts/uploads/2c472802df5120c188158aba1b462ab0.jpg\" style=\"width: 262.527px; height: 357px;\"></p><br><p></p><br><p></p>\r\n', 1, NULL, 0, 0, '', '', '', '', '', 1, 0, 0, '2017-02-09 00:00:00', '2018-03-15 10:31:18', NULL),
(79, 'Ход строительства домов и таунхаусов в нашем комплексе // 3 февраля 2017г.', '<p><div><p><strong>Итоги строительства по дому \"Шатель\" (обе секции)</strong></p><ul><li>Продолжаются  работы по устройству плиточного пола в коридорах подъезда 1- ой секции.</li><li>Заканчивается монтаж подвесного потолка \"amstrong\" в подъезде 1- ой секции.</li><li>Установлены отливы по фасаду.</li><li>Ведутся подготовительные работы по комплектации узлов учета воды и электричества.</li></ul></div><div><p><strong>Ход строительства по дому \"Лион\"</strong></p></div><div> <strong>1-ая секция:</strong></div><div><li>Продолжается монтаж стеклопакетов.</li><li>Ведется утепление и армирование  фасада.</li><li>Продолжается монтаж инженерных систем на 9-10 ом этажах.</li></div><div><p><strong>2-я секция:</strong></p></div><div><li>Продолжается установка стеклопакетов.</li><li>Продолжается монтаж инженерных систем на 9-10 ом этажах.</li><li>Заканчивается монтаж межкомнатных перегородок на 9-10 этажах.<br></li><li>Ведется утепление и армирование  фасада.<br></li></div><div><p><strong>3-я секция:</strong></p></div><div><li>Ведется утепление и армирование  фасада.</li><li>Ведется кладка межкомнатных перегородок.</li><li>Ведется монтаж стеклопакетов.<br></li></div><div><p><strong><strong>4-я секция:</strong></strong></p><div><ul><li></li><div>Продолжается кладка стен 7-ого этажа.</div><div><span style=\"font-size: 12px;\">Ведутся подготовительные работы для монтажа плит перекрытия 7-ого этажа.</span></div><li></li></ul></div><p><strong>5-я секция:</strong></p></div><div><li>Закончена кладка стен 7-ого этажа.</li><li>Заканчивается монтаж плит перекрытия 7-ого этажа.</li></div><div><p><strong><strong>6-я секция:</strong></strong></p><ul><li>Заканчивается кладка стен 4-ого этажа.</li><li>Ведется монтаж плит перекрытия 4-ого этажа.</li></ul><p><strong><strong>Ход строительства проекта \"Vlasna\"</strong></strong></p></div><div><p><strong><strong><strong><strong><strong><strong><strong>Дом № 2:</strong></strong></strong></strong></strong></strong></strong></p><ul><li>Выставлен горизонт для бетонирования плиты перекрытия 5-ого этажа.</li><li>Ведется монтаж каркаса монолитной плиты перекрытия 5- ого этажа.</li><li>Ведутся подготовительные работы для монтажа межкомнатных перегородок.</li><li>Ведутся подготовительные работы для кладки стен 6- ого этажа.</li></ul><p><strong><strong><strong>Благоустройство территории ЖК \"Новая Конча Заспа\"</strong></strong></strong></p><ol><li>Продолжается строительстве очистных сооружений ЖК \"Новая Конча Заспа\".( фото № 8).</li><li>Продолжается монтаж и строительство детской площадки между домами Линц и Грац.( фото № 7).</li><li>Ведется благоустройство дороги по улице И. Франка от дома Щатель к дому \"1-а Житлова\". (фото № 5).</li><li>ЖК \" Новая Конча Заспа\" : <a href=\"https://www.youtube.com/watch?feature=share&utm_source=Viber&utm_campaign=Private&v=rgDGq76IJoU&utm_medium=Chat&app=desktop\">https://www.youtube.com/watch?feature=share&utm_source=Viber&utm_campaign=Private&v=rgDGq76IJoU&utm_medium=Chat&app=desk</a></li><li><a href=\"https://www.youtube.com/watch?feature=share&utm_source=Viber&utm_campaign=Private&v=rgDGq76IJoU&utm_medium=Chat&app=desktop\"></a></li><li><a href=\"https://www.youtube.com/watch?feature=share&utm_source=Viber&utm_campaign=Private&v=rgDGq76IJoU&utm_medium=Chat&app=desktop\"></a></li></ol></div><div><b>Правила посещения строительного объекта:</b></div><div><ol><li>Запрещено посещение объекта в активные рабочие дни: понедельник - суббота.</li><li>Посещать объект следует  в субботу , согласно календаря,  с 16.00 до 19.00.</li><li>В воскресенье с 10.00 до 19.00.</li><li>Инвесторы должны быть обеспечены строительными касками ( каски следует получить в отделе продаж).</li><li>Допуск детей на строительный объект строго запрещен.</li><li>Посещение объекта должно происходить в сопровождении сотрудника отдела продаж.</li></ol></div><div><b>\"Ваша безопасность в соблюдении простых правил\". Спасибо.</b></div><br></p>', 1, 'artc_20180206151032274.jpg', 2, 0, '', '', '', '', '', 1, 1, 0, '2018-02-01 00:00:00', '2018-05-14 10:33:33', NULL),
(81, 'Всех влюбленных в нашем отделе продаж ждет Samsung SMART TV, при покупке квартиры!', '<p></p><p>Предлагаем рассмотреть светлую\r\nпросторную квартиру, 72 м2, панорамные 7 – 8  этажи с прекрасными видами на холмы Ходосеевки. Квартира расположена в строящемся доме \"Лион\".</p>\r\n\r\n<p>Многофункциональная кухня – от\r\n14 м2, окна в пол,\r\nпрактичная гардеробная. Отличный выбор для всей семьи.</p>\r\n\r\n<p>Посмотреть\r\nпланировку квартиры и варианты меблировки <a href=\"https://n-k-z.com/flats/lion/r2/\"><span>можно здесь.</span></a></p>\r\n\r\n<p>В подарок  каждому покупателю Smart-TV.</p>\r\n\r\n<p>Предложение\r\nбудет актуально до конца февраля.</p>\r\n\r\nЖдем\r\nвсех в отделе продаж!<br><p></p>\r\n', 1, 'artc_20180213131132421.jpg', 3, 0, '', '', '', '', '', 1, 1, 0, '2018-02-12 00:00:00', '2018-05-23 13:14:11', NULL),
(82, 'От Новой Конча-Заспы до Печерска за 15 минут? Проверяем на себе! (Видео)', '<p><iframe width=\"355\" height=\"200\" src=\"https://www.youtube.com/embed/_4m05rSDI2A\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen=\"\"></iframe><br></p>\r\n', 1, 'artc_20180219125802352.jpeg', 0, 0, '', '', '', '', '', 1, 0, 0, '2018-02-19 00:00:00', '2018-02-28 14:31:30', NULL);
INSERT INTO `osc_page_news_items` (`id`, `caption`, `details`, `template`, `preview`, `cat`, `is_top`, `special_text`, `tags`, `meta_title`, `meta_keys`, `meta_desc`, `is_index`, `block`, `order_id`, `dateCreate`, `dateModify`, `adminMod`) VALUES
(83, 'Твой Экохаус - твой экомир! (Видео)', '<p><iframe width=\"355\" height=\"200\" src=\"https://www.youtube.com/embed/y1-RuF0NY2U\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen=\"\"></iframe><br></p>\r\n', 1, 'artc_20180226132528330.jpg', 5, 0, '', '', '', '', '', 1, 0, 0, '2018-02-26 00:00:00', '2018-02-28 14:31:47', NULL),
(84, 'Свой Экохаус в ближайшем к Печерску  пригороде', '<p></p><p><b>Предлагаем статусное жилье для 25 семей  - Экохаусы.</b></p>\r\n\r\n<p>Ценность этого\r\nпроекта  не только в архитектуре,  сколько в социальной  значимости. \r\nБезопасность, успех и благополучие  УЖЕ гарантированы  социальным \r\nокружением.   «Чужих» \r\nтут нет, рядом только свои!</p>\r\n\r\n<p>Каждая из трех линий\r\nиндивидуальны, дома<b>  </b>подчеркивают  собственный статус владельца.</p>\r\n\r\n<p>Ожидаемая доходность\r\nэкохаусов  - 34% годовых в валюте, при\r\nрастущем спросе на жилье по \r\nНовообуховской трассе  (<a href=\"https://n-k-z.com/news/63/\"><b><span>https://n-k-z.com/news/63/</span></b></a><b> ) .</b></p>\r\n\r\n<p><b>Меняйте собственную жизнь к лучшему! Живите в\r\nкомфорте, живите в престижном классическом пригороде!</b></p>\r\n<p><b>Также, предлагаем Вашему вниманию   светлую просторную квартиру, 72 м2, панорамные\r\n7 – 8  этажи с прекрасными видами на\r\nхолмы Ходосеевки. Квартира расположена в строящемся доме \"Лион\".  </b><a href=\"https://n-k-z.com/flats/lion/r2/\"><b><span>https://n-k-z.com/flats/lion/r2/</span></b></a></p><p><img src=\"/myprotected/redactor/demo/scripts/uploads/2c2a3038b36bba5ac1a07d1427e97d98.jpg\" style=\"width: 477.396px; height: 264px;\"> <img src=\"/myprotected/redactor/demo/scripts/uploads/c2491b77f6579a8ec9a26bbe47f7cc89.jpg\" style=\"font-size: 12px; width: 478.376px; height: 264px;\"></p><p></p><p><img src=\"/myprotected/redactor/demo/scripts/uploads/75ea5d84269996923c24c601e1635f58.jpg\" style=\"width: 477px; height: 264px;\"> <img src=\"/myprotected/redactor/demo/scripts/uploads/3805a8d8e582e5e08a4cba00b724f1e1.jpg\" style=\"font-size: 12px; width: 477.791px; height: 264px;\"></p><p></p><p>   <img src=\"/myprotected/redactor/demo/scripts/uploads/447407333cb10fef1ae892a3a6093328.jpg\" style=\"width: 958.409px; height: 530px; cursor: nw-resize;\"></p><p></p><p></p><p></p>\r\n', 1, 'artc_20180301153951609.jpg', 5, 0, '', '', '', '', '', 1, 1, 0, '2018-02-28 00:00:00', '2018-03-05 15:14:39', NULL),
(86, 'Приятные подарки от компании-партнера  «Климат Ленд»', '<p></p><p>С  19 марта по 8 апреля, всем первым 30\r\nпокупателям  Экохаусов  и квартир  в ЖК «Vlasna» \r\n вручаем \r\n</p>\r\n\r\n<p>подарочный\r\nсертификат  на  5000 грн.</p>\r\n\r\n<p>Условия\r\nдействия сертификата распространяются на покупку  техники для кондиционирования, водонагрева,\r\nвентиляции и отопления помещений.</p>\r\n<p><br></p><p>Наши Экохаусы  - <a href=\"https://n-k-z.com/townhouses/\">https://n-k-z.com/townhouses/</a> </p><p>Квартиры в ЖК \"Vlasna\" - <a href=\"https://vlasna.n-k-z.com/\">https://vlasna.n-k-z.com/</a></p><p></p><p><img src=\"/myprotected/redactor/demo/scripts/uploads/1de3ccf41ce046b5d68696087461a884.jpg\" style=\"width: 442.946px; height: 205px; cursor: nw-resize;\"><img src=\"/myprotected/redactor/demo/scripts/uploads/f45677059f88ab4c7e421e214be9c668.jpg\" style=\"font-size: 12px; width: 208px; height: 180px;\"></p><p></p><p><img src=\"/myprotected/redactor/demo/scripts/uploads/abe457ed452621e8d59762b16c859368.jpg\" style=\"\"><img src=\"/myprotected/redactor/demo/scripts/uploads/83efaa3174ae5242accdcd669cf96a1a.jpg\" style=\"font-size: 12px; width: 386.618px; height: 301px;\"></p>(сертификат вручается  после подписания договора, менеджером по работе с инвесторами)<br><p></p><br><p></p><p></p>\r\n', 1, 'artc_20180317123158256.jpg', 3, 0, '', '', '', '', '', 1, 1, 0, '2018-03-17 00:00:00', '2018-05-23 13:14:29', NULL),
(87, 'Новые  возможности, которые  у вас появляются', '<p></p><p></p><p><br></p><p><b></b></p><p><b>                         <img src=\"/myprotected/redactor/demo/scripts/uploads/48b69c48eeda3fd0de8798b2d2517b8d.jpg\" style=\"width: 685.726px; height: 277px;\"></b></p><b><br></b><p></p><p></p><p><span style=\"font-size: 12px;\"></span></p><p><img src=\"/myprotected/redactor/demo/scripts/uploads/774e6fe4df299dd25425fc73569c43e8.jpg\" style=\"width: 911px; height: 1291px;\"></p>И это только базовый\r\nсписок возможностей!!!<br>\r\n\r\nПрисоединяйтесь к нашей дружной семье                     <p></p><p></p>\r\n', 1, 'artc_20180326145025883.jpg', 0, 0, '', '', '', '', '', 1, 1, 0, '2018-05-16 00:00:00', '2018-05-17 16:19:54', NULL),
(92, 'Предлагаем вашему вниманию коммерческую недвижимость', '<p></p><p></p><p><b>Коммерческая недвижимость в построенном доме \"Шатель\".&nbsp;</b></p><p><img src=\"/myprotected/redactor/demo/scripts/uploads/ee70f1c565765737782a6ace203eab2e.jpg\" style=\"width: 296.262px; height: 262px; float: left; margin: 0px 10px 10px 0px;\" alt=\"\"><b><br></b></p><p><b><br></b></p><p><br></p><p><b>Офис - 32 м2 .&nbsp;</b></p><p><b><b><b><br></b></b></b></p><p><b style=\"font-size: 12px;\"><b><b>Возможна аренда помещения, ставка 20 уе/кв.м или продажа - 20000 грн/кв.м. Отдельный вход, свободная планировка. Высокий цокольный этаж.</b></b>&nbsp;&nbsp;</b><br></p><p><br></p><p></p><p><img src=\"/myprotected/redactor/demo/scripts/uploads/133e4b792508d9f85b3dde4fde8a6851.jpg\" style=\"width: 277.249px; height: 276px;\"><b>Офис - 50,8 м2</b></p><p><b>Возможна аренда помещения, ставка 20 уе/кв.м. Отдельный фасадный вход, свободная планировка. Высокий цокольный этаж. Состояние - после строителей. Есть окна 1х0,6м. Высота потолка - 2,6 м.<br></b></p><p><img src=\"/myprotected/redactor/demo/scripts/uploads/9e3b88ecb651d3ee9e16b80f7bc3514b.jpg\" style=\"width: 284.828px; height: 535px;\"><b>Офис - 75 м2</b></p><p><b>Возможна продажа помещения, 20000 грн/кв.м. Отдельный фасадный вход, свободная планировка. Высокий цокольный этаж. Состояние - после строителей. Есть окна 1х0,6м. Высота потолка - 2,6 м.<br></b></p><p><img src=\"/myprotected/redactor/demo/scripts/uploads/d546af94a5d81fcb5f02eec6eb2c260a.jpg\" style=\"width: 261.563px; height: 361px;\"><b>Офис - 109,2 м2</b></p><p><b>Возможна аренда помещения, ставка 20 уе/кв.м. Отдельный фасадный вход, свободная планировка. Высокий цокольный этаж. Состояние - после строителей. Есть окна 1х0,6м. Высота потолка - 2,6 м.<br></b></p><br><p></p><br><p></p><p></p>\r\n', 1, 'artc_20180522125955771.png', 0, 0, '', '', '', '', '', 1, 1, 0, '2018-05-22 00:00:00', '2018-05-23 12:55:35', NULL),
(93, 'Все на субботник!', '<p></p><p>Проводить субботник на\r\nтерритории нашего &nbsp;ЖК – стало уже\r\nтрадицией.</p>\r\n\r\n<p>19 мая сотрудники\r\nкомплекса&nbsp; вместе с жильцами&nbsp; занимались озеленением территории. </p>\r\n\r\n<p>Время пролетело\r\nбыстро,&nbsp; и все остались довольны.</p>\r\n\r\n<p>Приезжайте,&nbsp;\r\nпосмотрим на Вашу квартиру с холмов Ходосеевки, прогуляемся вдоль озера,\r\nоценим вид из окна Вашего будущего жилья!</p><p><iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/kRUHjQgWt_Q\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen=\"\"></iframe><br></p>\r\n\r\n<p><b>Звоните и записывайтесь на встречу:&nbsp; </b><a href=\"tel:0443949127\"><b><span>044 394-91-27</span></b></a><b>,&nbsp; </b><b><span><a href=\"tel:0678251490\">067 825-14-90</a></span></b></p><p><b></b></p><p style=\"display: inline !important;\"></p><p style=\"display: inline !important;\"></p><p><b><b style=\"font-size: 12px;\"></b></b></p><p></p><p></p><p style=\"display: inline !important;\"><b><img src=\"/myprotected/redactor/demo/scripts/uploads/4afa00fef08a6b5cdb20c860b2b0d621.jpg\" style=\"width: 259.5px; height: 173px;\"></b></p><img src=\"/myprotected/redactor/demo/scripts/uploads/a382581cdc2bad82d757a5a398e93d7b.jpg\" style=\"font-size: 12px; width: 259.5px; height: 173px;\"><img src=\"/myprotected/redactor/demo/scripts/uploads/2408c46e7daae1bed0531e3da30adc49.jpg\" style=\"font-size: 12px; width: 259.5px; height: 173px;\"><p></p><p></p><p><img src=\"/myprotected/redactor/demo/scripts/uploads/9dd98f5eedc6b501a2a2da830ba0ffc4.jpg\" style=\"width: 260.671px; height: 172px;\"><img src=\"/myprotected/redactor/demo/scripts/uploads/1b4ffbfee550219aa26a5093f03dc5e1.jpg\" style=\"font-size: 12px; width: 258.534px; height: 172px;\"><img src=\"/myprotected/redactor/demo/scripts/uploads/7459fa692dd9940a5163ff2767c3c0f8.jpg\" style=\"font-size: 12px; width: 258.534px; height: 172px;\"></p><p></p><p><img src=\"/myprotected/redactor/demo/scripts/uploads/2844211398de54835f7da333f5be5227.jpg\" style=\"width: 261.018px; height: 173px;\"><img src=\"/myprotected/redactor/demo/scripts/uploads/e4d969035e2b2964c16a3355b0db60b3.jpg\" style=\"font-size: 12px; width: 260.006px; height: 173px;\"><img src=\"/myprotected/redactor/demo/scripts/uploads/a2fc5e0691f09549a16f41fda6cb876a.jpg\" style=\"font-size: 12px; width: 261.018px; height: 173px;\"></p><br><p></p><br><p></p><p></p>\r\n', 1, 'artc_20180523122213440.jpg', 0, 0, '', '', '', '', '', 1, 0, 0, '2018-05-23 00:00:00', '2018-06-04 14:35:34', NULL),
(94, 'Предлагаем вашему вниманию коммерческую недвижимость', '<p><b>Коммерческая недвижимость в построенном доме \"Шатель\".&nbsp;</b><br><table id=\"table55644\"><tbody><tr><td><p><p><img src=\"/myprotected/redactor/demo/scripts/uploads/11e9713d49cd64574b8cc75f6e06fa57.jpg\" style=\"width: 377.097px; height: 334px;\"></p><br></p></td><td><p><b>Офис - 32 м2 .&nbsp;</b></p><p><b></b></p><p><b><b><b>Возможна аренда помещения, ставка 20 уе/кв.м или продажа - 20000 грн/кв.м.&nbsp;</b></b></b></p><p><b><b><b>Отдельный вход, свободная планировка.&nbsp;</b></b></b></p><p><b><b><b>Высокий цокольный этаж.</b></b></b></p></td></tr><tr><td><p><img src=\"/myprotected/redactor/demo/scripts/uploads/7d0a3a218522ed42986c4d7f4760f3cc.jpg\" style=\"width: 355.377px; height: 353px;\"></p><br></td><td><p><b>Офис - 50,8 м2</b></p><p><b>Возможна аренда помещения, ставка 20 уе/кв.м.&nbsp;</b></p><p><b>Отдельный фасадный вход, свободная планировка.&nbsp;</b></p><p><b>Высокий цокольный этаж.</b></p><p><b>Состояние - после строителей. Есть окна 1х0,6м. Высота потолка - 2,6 м.</b></p><br></td></tr><tr><td><p><img src=\"/myprotected/redactor/demo/scripts/uploads/44324ba5def17d438c5f8390daefcab9.jpg\" style=\"width: 365.098px; height: 686px;\"></p><br></td><td><p><b>Офис - 75 м2</b></p><p><b>Возможна продажа помещения, 20000 грн/кв.м.&nbsp;</b></p><p><b>Отдельный фасадный вход, свободная планировка.&nbsp;</b></p><p><b>Высокий цокольный этаж.&nbsp;</b></p><p><b>Состояние - после строителей. Есть окна 1х0,6м. Высота потолка - 2,6 м.</b></p><br></td></tr><tr><td><p><img src=\"/myprotected/redactor/demo/scripts/uploads/4565a20575acb7c3a458afd5b9224f79.jpg\" style=\"width: 337.333px; height: 465px;\"></p><br></td><td><p><b>Офис - 109,2 м2</b></p><p><b>Возможна аренда помещения, ставка 20 уе/кв.м.&nbsp;</b></p><p><b>Отдельный фасадный вход, свободная планировка.&nbsp;</b></p><p><b>Высокий цокольный этаж.&nbsp;</b></p><p><b>Состояние - после строителей. Есть окна 1х0,6м. Высота потолка - 2,6 м.</b></p><br></td></tr></tbody></table><p></p><br><p></p><br></p>', 1, 'artc_20180523125505671.png', 0, 0, '', '', '', '', '', 1, 0, 0, '2018-05-23 12:55:05', '2018-05-23 12:55:05', NULL),
(88, 'Возможности, которые  у вас появляются, став жителем Новой Конча-Заспы', '<p></p><p></p><p></p><p></p><ul><li><b style=\"font-size: 12px;\">                                                              Памятка</b><br></li><li><b style=\"font-size: 12px;\">                       Новые\r\n возможности, которые  у вас появляются,</b><br></li><li><b style=\"font-size: 12px;\">              в\r\nпешей доступности (ну или совсем рядом, в 5-10 минутах езды),</b><br></li><li>                  <b style=\"font-size: 12px;\">став\r\nжильцом  ЖК «Новая Конча-Заспа»,</b></li></ul><p></p>\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n<p></p><p><img src=\"/myprotected/redactor/demo/scripts/uploads/e95ac693c4c2861f0cd4825b75d1bf34.jpg\" style=\"width: 508.173px; height: 1375px;\"></p><p>И это только базовый\r\nсписок возможностей!!!</p>\r\n\r\nПрисоединяйтесь к нашей дружной семье.<br><p></p><p></p>\r\n', 1, 'artc_20180326151259762.jpg', 0, 0, '', '', '', '', '', 1, 0, 0, '2018-03-26 00:00:00', '2018-03-26 15:15:55', NULL),
(89, 'Живите в престижном классическом пригороде!', '<p></p><p></p><p>Мы предлагаем Вам жить\r\nвдали от&nbsp; городского шума,&nbsp; в 15 минутах от Печерска! </p>\r\n\r\n<p>·<span>&nbsp;\r\n</span>Жить среди\r\nзелени полей, холмов, в&nbsp; окружении&nbsp; озер&nbsp; и\r\nпарков! </p>\r\n\r\n<p>·<span>&nbsp;\r\n</span>Жить среди успешных,\r\nблагополучных людей,&nbsp; в социальном\r\nокружении&nbsp; только своих!</p>\r\n\r\n<p>·<span>&nbsp;\r\n</span>Жить в\r\nэлитном направлении с богатой&nbsp; историей!<span style=\"font-size: 12px;\">&nbsp;</span></p><p><img src=\"/myprotected/redactor/demo/scripts/uploads/73752cdb06208beb0ccd9986f21cbde8.jpg\" style=\"width: 333.939px; height: 217px;\"><img src=\"/myprotected/redactor/demo/scripts/uploads/c3408634654a35c8a1999fff35a0c01d.jpg\" style=\"font-size: 12px; width: 253.167px; height: 217px;\"></p>\r\n \r\n<p></p>\r\n\r\n<p><span style=\"background-color: rgb(255, 255, 255);\"><span style=\"color: #548dd4;\"></span></span></p><p>Посмотреть\r\nпанировки Экохаусов - <a href=\"https://n-k-z.com/townhouses/\"><span><span style=\"color: #548dd4;\">https://n-k-z.com/townhouses/</span></span></a></p>\r\n\r\n<p>Посмотреть\r\nквартиры с терассой &nbsp;(ограниченное\r\nпредложение) - <a href=\"https://n-k-z.com/flats/proekt-vlasna/rn/\"><span><span style=\"color: #548dd4;\">https://n-k-z.com/flats/proekt-vlasna/rn/</span></span></a></p>\r\n<p>Мы предлагаем новые\r\nвозможности времяпровождения для всей семьи, все радом:</p>\r\n\r\n<p>·<span>&nbsp;\r\n</span>Постигайте&nbsp; все тонкости высшей школы верховой езды</p>\r\n\r\n<p>·<span>&nbsp;\r\n</span>Позволяйте &nbsp;себе летать!</p>\r\n\r\n<p>·<span>&nbsp;\r\n</span>Устраивайте&nbsp; романтические&nbsp;\r\nвстречи</p>\r\n\r\n<p>·<span>&nbsp;\r\n</span>Поддерживайте&nbsp; дух и тело&nbsp;\r\nв&nbsp; форме</p><p></p>\r\n<p><img src=\"/myprotected/redactor/demo/scripts/uploads/89441db874649d0522a951c485145607.jpg\" style=\"width: 260.93px; height: 187px;\"><img src=\"/myprotected/redactor/demo/scripts/uploads/bc31d539832f7b10dc238f83847bf071.jpg\" style=\"font-size: 12px; width: 260.704px; height: 187px;\"></p><p></p><p><p><img src=\"/myprotected/redactor/demo/scripts/uploads/ddcb754a8f99ef1722831da32c867b1c.jpg\" style=\"width: 261.426px; height: 184px;\"><img src=\"/myprotected/redactor/demo/scripts/uploads/a8ced7b42416101ef4fd626c3ebff52f.jpg\" style=\"font-size: 12px; width: 292.965px; height: 184px;\"></p><br></p><br><p></p><br><p></p>\r\n', 1, 'artc_20180420124840656.jpg', 0, 0, '', '', '', '', '', 1, 0, 0, '2018-04-20 00:00:00', '2018-04-20 13:10:55', NULL),
(90, 'Что и для кого строят в пригороде Киева?', '<p></p><p>На рынке жилой недвижимости\r\nпродолжает расти предложение. Однако спрос ограничен, и весомых факторов для\r\nего увеличения в краткосрочном периоде нет. Это формирует избыточное\r\nпредложение, которое постепенно накапливается. </p>\r\n\r\n<p>Как застройщики\r\nпригорода столицы реагируют на сложившуюся ситуацию, что предлагают и для какой\r\nцелевой аудитории.</p>\r\n\r\n<p><b>Оценим количество строительных площадок и\r\nнаправления, в которых сосредоточено предложение, &nbsp;в разных ценовых сегментах:</b></p><p></p><p><img src=\"/myprotected/redactor/demo/scripts/uploads/4df14034a5c683677913c9b922b10056.jpg\" style=\"\"></p><p></p><p><img src=\"/myprotected/redactor/demo/scripts/uploads/cb1f4132af9e746bd64c44c8e7ae7334.jpg\" style=\"\"></p><p><b>Таким образом:</b></p>\r\n\r\n<p><img src=\"/myprotected/redactor/demo/scripts/uploads/c5bae73143b74654c2d47a7321a16730.jpg\" style=\"\"></p><p></p><p><img src=\"/myprotected/redactor/demo/scripts/uploads/0efc90eac2f999077df69ac0c99e63fb.jpg\" style=\"\"></p><p></p><p><img src=\"/myprotected/redactor/demo/scripts/uploads/9451f0c8dd0c047f29ad82b66a4a3fc5.jpg\" style=\"\"></p>\r\n\r\n<p><b><u></u></b></p>\r\n\r\n<p><b><u>Выводы:</u></b></p>\r\n\r\n<p>1)<span>&nbsp;\r\n</span>Больше\r\nвсего строительных площадок в направлении Ирпеня и Бучи. Что это значит для\r\nпотенциальных покупателей? – это значит пробки и заторы на дорогах, которые уже\r\nзагружены транспортом.</p>\r\n\r\n<p>Следующее\r\nнаправление по загруженности&nbsp; жилыми\r\nкомплексами – Борщаговка, Святопетровское, Вишневое и Крюковщина. Что бы не\r\nстроили в этих районах, в результате покупатель жилья приобретает проблему –\r\nпробки&nbsp; на дорогах. </p>\r\n\r\n<p><b>Таким образом, любые строительные площадки &nbsp;в &nbsp;направлениях Ирпень, Буча, Борщаговка,\r\nСвятопетровское, Вишневое, Крюковщина <u>не могут быть рассмотрены как\r\nпрестижное жилье, т.к. скрывают в себе серьезную проблему пробок по трассе.</u>\r\nПеренасыщенность строительными площадками <u>ведет к перспективе &nbsp;падения цен&nbsp;\r\nна квартиры в этих районах &nbsp;</u></b></p>\r\n\r\n<p>2)<span>&nbsp;\r\n</span>Спрос на\r\nжилье формируется следующими целевыми аудиториями: </p>\r\n\r\n<p>-Эконом-жилье,\r\nв сегменте средний минус (7 000-&nbsp; 12 000\r\nгрн/м2): &nbsp;для покупателей в этом сегменте\r\nважна цена, скидки, рассрочка</p>\r\n\r\n<p>-\r\nЖилье в среднем ценовом сегменте (12 000 – 14 000 грн/м2):&nbsp; решающим&nbsp;\r\nфактором при выборе квартиры является не столько цена, сколько\r\nбезопасность, готовая инфраструктура, наличие садика, школы, поликлиники, также\r\nважна близость к метро</p>\r\n\r\n<p>-\r\nЖилье в ценовом сегменте средний плюс (14 000 – 16 000 грн/м2): для этих\r\nпокупателей важны совершенно другие ценности– это социальное окружение, &nbsp;близость к природе, рядом новые возможности\r\nдля жизни такие как: конный спорт, параглайдинг, гольф… и, одновременно,&nbsp; удобная полная инфраструктура.</p>\r\n\r\n<p><b>Таким образом,&nbsp; можем разделить покупателей жилья на средний\r\nминус, средний и средний плюс. А где же деньги???? &nbsp;Длинные\r\nи проблемные &nbsp;деньги хранятся &nbsp;в сегменте Эконом-жилья. &nbsp;</b></p>\r\n\r\n<p><b>Средний сегмент покупателей практически\r\nотсутствует на нашем рынке. Это узкий сегмент, в котором немногочисленные\r\nпродажи.</b></p>\r\n\r\n<p><b>Перспективным выглядит сегмент средний плюс-\r\nТОП-менеджеры с доходом от 2000 уе на взрослого члена семьи. Но! Кто из\r\nзастройщиков удовлетворяет запрос на ценности в этом ценовом сегменте.</b></p>\r\n\r\n<p></p>\r\n\r\n<p><b>Более предметно оценим ЖК в&nbsp; сегменте &nbsp;14 000 – 16&nbsp;000 грн/м2:</b></p>\r\n\r\n<p>1)<span>&nbsp;\r\n</span>Самое\r\nмногочисленное предложение – 20 ЖК в &nbsp;Ирпене, Буче (это пробки! Можно не тратить\r\nтакие деньги за будущие неудобства)</p>\r\n\r\n<p>2)<span>&nbsp;\r\n</span>Вишневое,\r\nБорщаговка, Святопетровское, Крюковщина – пробки, пробки</p>\r\n\r\n<p>3)<span>&nbsp;\r\n</span>Бровары –\r\nвысотки, монолит</p><p><img src=\"/myprotected/redactor/demo/scripts/uploads/3d62ac77a51ab39e74446de77f644923.jpg\" style=\"width: 531.095px; height: 218px;\"></p><p></p><p>4)&nbsp; Вышгород –\r\nвысотки, монолит</p><p></p><p><img src=\"/myprotected/redactor/demo/scripts/uploads/e0cd6f3db9d308c57577005b1b6eb98a.jpg\" style=\"width: 529.931px; height: 178px;\"></p><p>5)&nbsp; Ходосеевка - малоэтажное жилье, красный кирпич&nbsp;<br><span style=\"font-size: 12px;\"></span></p><p></p><p></p><p></p><p><img src=\"/myprotected/redactor/demo/scripts/uploads/e77e4768c2e394742de02e5280794701.jpg\" style=\"\"></p><br><p></p><br><p></p><p><b><u>Выводы:</u></b></p>\r\n\r\n<p>1)<span>&nbsp;\r\n</span>Самым\r\nперспективным, на сегодняшний день, является направление Новообуховской трассы\r\n– правительственная трасса, пробок нет никогда!</p>\r\n\r\n<p>2)<span>&nbsp;\r\n</span>Пересечение\r\nтребований: красный кирпич, малоэтажная застройка, современная\r\nправительственная трасса, богатая нетронутая природа, обширные поля, чистый\r\nвоздух, готовая&nbsp; развитая инфраструктура,\r\nпрестижный отдых для всей семьи, успешный социум – именно таким требованиям\r\nотвечают жилые комплексы&nbsp; &nbsp;«Новая Конча-Заспа» и &nbsp;«Vlasna» в Ходосеевке.</p><p></p><br><p></p><p></p>\r\n', 1, 'artc_20180423163114539.jpg', 6, 0, '', '', '', '', '', 1, 0, 0, '2018-04-23 00:00:00', '2018-04-24 12:10:23', NULL),
(91, 'Предлагаем Вашему вниманию видовые квартиры с панорамными окнами', '<p>\r\n\r\n</p><p><b>Предлагаем Вашему вниманию светлую панорамную\r\nквартиру!</b></p>\r\n\r\n<p>Рациональный выбор\r\nквартиры  это:</p>\r\n\r\n<p>1) \r\nВыбор  района, направления, где дом строится. Быстро\r\nи без пробок добраться к метро – сейчас этот вопрос все более актуален</p>\r\n\r\n<p>2) \r\nВыбор социального\r\nокружения. Кто твои соседи и с кем общаются твои дети…</p>\r\n\r\n<p>3) \r\nВыбор  материала, из которого построен дом. Красный\r\nкирпич по-прежнему олицетворяет престиж, удобство, надежность и безопасность. </p>\r\n\r\n<p>4) \r\nВыбор\r\nпланировки.  Квартиры без «лишних, неудобных\r\nм2», конечно очень востребованы</p>\r\n\r\n<p>5) \r\nВыбор стороны\r\nсвета, вида из окна. Видовые квартиры с окнами в пол – ХИТ ПРОДАЖ уже многие\r\nгоды на рынке недвижимости</p>\r\n<p><b>Предлагаем Вашему вниманию видовые квартиры с\r\nпанорамными окнами на 5/6 этажах. Сдача дома – декабрь 2018 года.</b></p>\r\n\r\n<p>В отделе продаж наши\r\nменеджеры подберут метраж, проведут на просмотр. Вы сами сможете убедиться: вид\r\nиз окна с панорамным остеклением имеет значение.</p>\r\n<p>\r\n \r\n \r\n  \r\n  \r\n  \r\n  \r\n  \r\n  \r\n  \r\n  \r\n  \r\n  \r\n  \r\n  \r\n \r\n \r\n \r\n\r\n \r\n </p><p><img src=\"/myprotected/redactor/demo/scripts/uploads/45a9fe3b3dc0c11aa761561d0d801ba8.jpg\" style=\"width: 383.646px; height: 298px;\"><img src=\"/myprotected/redactor/demo/scripts/uploads/dd1adecc328c5611137029ff5053f78c.jpg\" style=\"font-size: 12px; width: 463.425px; height: 298px;\"></p><p><img src=\"/myprotected/redactor/demo/scripts/uploads/b016a27f0a0934059e743e623a1ff7dc.jpg\" style=\"width: 427.873px; height: 311px;\"><img src=\"/myprotected/redactor/demo/scripts/uploads/b8f300689592b91bd6e8a3d92603b422.jpg\" style=\"font-size: 12px; width: 416.604px; height: 311px;\"></p>\r\n<p><b>Также, предлагаем ознакомиться с другими хитами\r\nпродаж:</b></p>\r\n\r\n<p><b>Посмотреть панировки Экохаусов - </b><a href=\"https://n-k-z.com/townhouses/\"><b><span>https://n-k-z.com/townhouses/</span></b></a><b>  </b></p>\r\n\r\n<p><b>Посмотреть квартиры с террасой  (ограниченное предложение) - </b><a href=\"https://n-k-z.com/flats/proekt-vlasna/rn/\"><b><span>https://n-k-z.com/flats/proekt-vlasna/rn/</span></b></a></p><br><p></p>\r\n', 1, 'artc_20180508122844391.jpg', 0, 0, '', '', '', '', '', 1, 0, 0, '2018-05-08 00:00:00', '2018-05-08 12:28:44', NULL),
(95, 'Получи в подарок Макбук или Айфон 8! Акция на праздник Троицы!', '<p>Внимание, внимание! </p><p>Только на праздник Троицы, с 26 по 28 мая, всем кто даст задаток в нашем отделе продаж, мы дарим в подарок новенький Макбук Эйр или Айфон 8 на выбор! </p>\r\n\r\n<p>Такого еще не было, только три дня! </p>\r\n<p>Узнай подробные условия акции по телефонам коллцентра, позвони прямо сейчас!<br></p><p></p><p></p><p><p><img src=\"/myprotected/redactor/demo/scripts/uploads/ebdfa7f6e01f3d510019b7ae922aab2a.jpg\"></p><br></p><p></p><br><p></p>\r\n', 1, 'artc_20180524140505713.jpg', 3, 0, '', '', '', '', '', 1, 1, 0, '2018-05-23 00:00:00', '2018-05-29 11:03:38', NULL),
(96, 'Социальное окружение – формула хорошей жизни!', '<p></p><p>ЖК Новая Конча-Заспа&nbsp; является&nbsp; родным домом и любимым местом отдыха для людей из разных городов Украины.&nbsp;Под гостеприимным небом нашего комплекса&nbsp;обосновалось\r\nмножество семей &nbsp;Из Львова, Одессы,\r\nДнепра и других городов, а также киевляне.</p>\r\n\r\n<p>Топ - менеджеры &nbsp;выбирают ЖК Новая Конча-Заспа &nbsp; в\r\nкачестве места жительства по многим причинам. Одних прельщает удобное\r\nрасположение и близость к столице, других –именно социальное окружение и\r\nбезопасность, которая обеспечена этим, третьих - возможность отдохнуть от крупного\r\nмегаполиса, наслаждаясь чистым воздухом и спокойной размеренной жизнью.</p>\r\n\r\n<p>Большой популярностью\r\nжилой комплекс Новая Конча-Заспа&nbsp;пользуется у молодых семей с детьми, для\r\nкоторых здесь созданы все условия. Дети &nbsp;посещают современный детские садики,&nbsp; учатся в местных и киевских школах, &nbsp;в то время, как их родители так же не скучают\r\n-&nbsp; &nbsp;каждому члену семьи уже созданы условия для\r\nотдыха, поддержки собственного здоровья и яркого досуга, при этом, наслаждаясь\r\nспокойной и комфортной европейской жизнью.</p>\r\n\r\n<p>Благодаря особому\r\nмикроклимату, атмосфере дружелюбия и взаимопонимания, ЖК &nbsp;Новая Конча-Заспа&nbsp; притягивает к себе,\r\nсловно магнитом, все новых и новых успешных, интересных людей, что\r\nделает жизнь здесь яркой, насыщенной и разнообразной.</p><p></p>\r\n', 1, 'artc_20180525120122419.jpg', 0, 0, '', '', '', '', '', 1, 0, 0, '2018-05-25 00:00:00', '2018-05-29 14:35:26', NULL),
(97, 'Начинаем продажи в новом доме «Вилар». Акционная цена 12800 грн/м на 10 квартир*! ', '<p>ЖК \"Новая Конча-Заспа\" объявляет о старте продаж квартир в новом 9-ти этажном доме “Вилар”.</p>\r\n\r\n<p>Для дома “Вилар” компания АВМ Девелопмент Групп, вместе с собственным архитектурным бюро, разработали много разнообразных планировок квартир, чтобы любой покупатель мог выбрать жилье на свой вкус и образ жизни.</p>\r\n\r\n<p>Только сейчас на некоторые квартиры* в доме «Вилар» действует акционная цена 12800 грн/м.</p>\r\n\r\n<p><a href=\"https://n-k-z.com/flats/dom-vilar/r1/\">Ознакомится с планировками квартир дома «Вилар» можно тут.</a>\r\n\r\n</p><p></p><p><img src=\"/myprotected/redactor/demo/scripts/uploads/989952e22ae33f1a2bc68542420bd970.jpg\" style=\"width: 849.722px; height: 280px;\"></p><p><br></p><p>* - стоимость 12800 грн/м действует на квартиры в 9 секции дома, на варианты - 2-к - 53,9 кв.м., 1-к - 42,8 кв.м., 2-к - 68,5 кв.м., 3-к - 86,2 кв.м.;</p>\r\n', 1, 'artc_20180601153934205.jpg', 0, 1, '', '', '', '', '', 1, 0, 0, '2018-06-01 00:00:00', '2018-06-11 11:43:30', NULL),
(98, 'Ваши новые возможности! Выбирайте наслаждаться жизнью вместе с ЖК Новая Конча-Заспа!', '<p></p><div>Жизнь в&nbsp; Новой Конче-Заспе открывает полный&nbsp; спектр&nbsp; новых возможностей&nbsp; &nbsp;для всех членов семьи.&nbsp; В 10 минутах езды от нас&nbsp; находится&nbsp; престижный&nbsp; конный&nbsp; &nbsp;клуб семейного типа «Equides Club».</div><div><br></div><div>Здесь&nbsp; &nbsp; вы сможете заказать уроки верховой езды.&nbsp; Занятия проводят&nbsp; тренеры национального уровня&nbsp; не только из Украины, но и из Германии, Франции, Австралии.</div><div><br></div><div>К вашим услугам роскошный бассейн с видом на сказочное озеро, сауна, хамам, а также тренажерные залы ,&nbsp; ультрамодная&nbsp; гольф – зона, рестораны,&nbsp; отель.</div><div><span style=\"font-size: 12px;\"><br></span></div><div>Все рядом!&nbsp; Удобно и комфортно! Верните&nbsp; чистоту и ясность мыслей, найдите правильный жизненный ритм, восстановите энергию и найдите умиротворение и баланс, подарите телу и мыслям релакс, позаботьтесь о красоте Вашего тела.</div><div><br></div><div>Выбирайте наслаждаться жизнью вместе с ЖК Новая Конча-Заспа!</div><div><br></div><iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/3WgmyU4DIZg\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen=\"\"></iframe><br>', 1, 'artc_20180604142833996.jpg', 0, 0, '', '', '', '', '', 1, 0, 0, '2018-06-04 00:00:00', '2018-06-04 14:34:43', NULL);

-- --------------------------------------------------------

--
-- Структура таблиці `osc_page_program`
--

CREATE TABLE `osc_page_program` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `content` text,
  `filename` varchar(255) DEFAULT NULL,
  `block` int(11) NOT NULL DEFAULT '0',
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_keys` varchar(255) DEFAULT NULL,
  `meta_desc` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `osc_page_program`
--

INSERT INTO `osc_page_program` (`id`, `name`, `caption`, `content`, `filename`, `block`, `meta_title`, `meta_keys`, `meta_desc`) VALUES
(1, 'Программы покупки жилья', 'Программы покупки жилья', '', 'prog_20170922153029478.jpg', 0, 'Программы покупки жилья', '', '');

-- --------------------------------------------------------

--
-- Структура таблиці `osc_page_program_items`
--

CREATE TABLE `osc_page_program_items` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `content` text,
  `sub_title` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `preview` varchar(255) DEFAULT NULL,
  `block` int(11) NOT NULL DEFAULT '0',
  `target` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `layouts` varchar(255) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_keys` varchar(255) DEFAULT NULL,
  `meta_desc` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `osc_page_program_items`
--

INSERT INTO `osc_page_program_items` (`id`, `name`, `alias`, `caption`, `content`, `sub_title`, `filename`, `preview`, `block`, `target`, `order_id`, `layouts`, `meta_title`, `meta_keys`, `meta_desc`) VALUES
(11, 'Квартира для студента', 'kvartira-dlya-studenta', 'Студенческая программа', 'AVM Development Group\r\nпредлагает учащимся в ВУЗах выгодные условия покупки собственного жилья.  <div><span style=\"font-size: 12px;\"><br></span></div><div><span style=\"font-size: 12px;\">Стадия строительства – это один из самых выгодных вариантов приобретения квартиры в новостройке. Это беспроигрышная инвестиция в будущее молодого специалиста. Звоните в наш коллцентр или пишите в чат оператору, чтоб узнать больше об акции.В программе принимают участие квартиры в строящихся домах \"Лион\" и \"Шатель\". </span><br></div><div><div><br></div><div><p></p><p><img src=\"/myprotected/redactor/demo/scripts/uploads/08d7f4e5d04afe244b60c94d00e2f8bc.jpg\"></p><br></div><div><br></div><div><b>Весомые аргументы для выбора нашего комплекса:</b></div><div>1. Удачное расположение комплекса дает возможность быстро добираться до ближайшего транспортного узла Выдубичи, где расположена станция метрополитена, железнодорожная станция с остановкой городской электрички и автобусная станция;<br><br></div><div>2. Наличие рядом МегаМаркета и различных развлекательных локаций таких как кинотеатр, каток, фитнес-клуб даст возможность полноценного проведения досуга и активного отдыха после учёбы;<br><br></div><div>3. Продуманные планировки и небольшие коммунальные расходы отлично подойдут студентам или специалистам которые только начинают строить свою карьеру Достаточно заплатить первый взнос 30%\r\nот стоимости квартиры и квартира ваша.</div><div>Ознакомится с планировками квартир <a href=\"https://n-k-z.com/flats/lion/r1/\" target=\"_blank\">можно по ссылке >></a></div>\r\n</div>\r\n', 'Специальные условия покупки жилья для студентов и их родителей', 'prog_20170929142920472.jpg', 'prog_20170929175008623.jpg', 0, 0, 0, ',,,,7,,,,,', '', '', ''),
(12, 'Забота о родителях', 'zabota-o-roditelyah', 'Программа \"Забота о родителях\"', '<p></p><p></p><p>Дети взрослеют и заводят\r\nсемью.&nbsp;</p><p>И настаёт время предложить родителям новое более комфортное место для жизни.&nbsp;</p><p>Хотите продать старую квартиру в центре и купить\r\nновую в пригороде, либо сделать размен – застройщик AVM Development Group найдёт для Вас подходящие варианты в жилищном комплексе «Новая Конча-Заспа» в перспективном пригороде Киева.&nbsp;</p><p><img src=\"/myprotected/redactor/demo/scripts/uploads/c8b00b2a1ebfc92ff5ff95d0d3dfdf0e.jpg\" style=\"font-size: 12px;\"><br></p><br><p></p><p><b style=\"font-size: 12px;\">Аргументы для покупки квартиры вашим родителям в нашем жилом комплексе:</b><br></p><ol><li>Хорошая экология и тихий спокойный жилой комплекс отлично подойдут людям, уставшим от постоянного быстрого ритма столицы</li><li>Рядом с комплексом расположен большой медицинский центр, поэтому при необходимости всегда можно получить оперативную медицинскую помощь. Нет необходимости зависеть от столичных поликлиник.</li><li>При необходимости, застройщик может помочь продать вашу старую квартиру подобрал взамен неё альтернативный вариант в нашем комплексе.</li></ol><div><p></p><br></div><br><p></p>\r\n', 'Пусть ваши родители живут рядом с вами', 'prog_20170929145109967.jpg', 'prog_20170929145109936.jpg', 0, 0, 0, ',,,7,,,,', '', '', ''),
(13, 'Молодая семья', 'molodaya-semya', 'Программа для молодых семей', '<p></p><div><p></p><p>Мы заботимся о социальном комфорте нашего ЖК, поэтому в первую очередь большое внимание уделяем удобству жизни молодых семей с детьми.&nbsp;</p><p><b>Аргументы для программы:</b></p><ol><li>Благодаря удачному расположению комплекса, ваши дети могут учиться в детских садиках и школах Печерска - самого престижного района столицы.</li><li>Равное социальное окружение позволит комфортно себя чувствовать молодым мамам, заводить новые знакомства, и вместе растить и воспитывать детей.</li><li>Ассортимент планировок двухкомнатных квартир даст возможность выбрать оптимальный вариант именно для вашей семьи. Также для вашего комфорта в подъездах предусмотрено колясочные и есть возможность дополнительно приобрести кладовки для сезонного хранения вещей.</li></ol></div><br><p></p>\r\n', 'Выбирайте подходящую 2-к квартиру для вашей молодой семьи', 'prog_20170929174757222.jpg', 'prog_20170929174757986.jpg', 0, 0, 0, ',,,,,', '', '', ''),
(14, 'Инвестиционная программа', 'investicionnaya-programma', 'Инвестиционная программа', '', 'Недвижимость традиционно считается самым надёжным способом сбережения', NULL, 'prog_20171030202707737.jpg', 0, 0, 0, NULL, '', '', '');

-- --------------------------------------------------------

--
-- Структура таблиці `osc_recall`
--

CREATE TABLE `osc_recall` (
  `id` int(11) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `seen` int(11) NOT NULL DEFAULT '0',
  `created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблиці `osc_site_languages`
--

CREATE TABLE `osc_site_languages` (
  `id` int(11) NOT NULL,
  `lang_id` int(11) NOT NULL,
  `block` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблиці `osc_site_positions`
--

CREATE TABLE `osc_site_positions` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '0',
  `alias` varchar(255) NOT NULL DEFAULT '0',
  `block` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `osc_site_positions`
--

INSERT INTO `osc_site_positions` (`id`, `name`, `alias`, `block`) VALUES
(1, 'Шапка', 'top', 0),
(2, 'Левая колонка', 'left-column', 0),
(3, 'Правая колонка', 'right-column', 0),
(4, 'Футер', 'footer', 0);

-- --------------------------------------------------------

--
-- Структура таблиці `osc_static_translations`
--

CREATE TABLE `osc_static_translations` (
  `id` int(11) NOT NULL,
  `page` varchar(255) NOT NULL,
  `text` varchar(255) NOT NULL,
  `en_text` varchar(255) DEFAULT NULL,
  `ru_text` varchar(255) DEFAULT NULL,
  `fr_text` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `osc_static_translations`
--

INSERT INTO `osc_static_translations` (`id`, `page`, `text`, `en_text`, `ru_text`, `fr_text`) VALUES
(1, 'all', 'Контактная форма', 'Contact form EN', 'Контактная форма RU', 'Contact form FR'),
(2, 'all', 'Регистрация', 'Register', 'Регистрация', 'Register'),
(3, 'all', 'Авторизация', 'Login', 'Авторизация', 'Login'),
(4, 'all', 'укажите корректное имя.', 'please Enter correct name. ', 'укажите корректное имя.', 'please Enter correct name. ');

-- --------------------------------------------------------

--
-- Структура таблиці `osc_subscriptions`
--

CREATE TABLE `osc_subscriptions` (
  `id` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `seen` int(11) NOT NULL DEFAULT '0',
  `created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблиці `osc_sys_appointments`
--

CREATE TABLE `osc_sys_appointments` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `seen` int(11) NOT NULL DEFAULT '0',
  `created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `osc_sys_appointments`
--

INSERT INTO `osc_sys_appointments` (`id`, `name`, `contact`, `seen`, `created`) VALUES
(1, 'Tina', '0973388791', 0, '2018-06-08 21:25:13');

-- --------------------------------------------------------

--
-- Структура таблиці `osc_sys_bp_cats`
--

CREATE TABLE `osc_sys_bp_cats` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `price_from` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `block` int(11) NOT NULL DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `osc_sys_bp_cats`
--

INSERT INTO `osc_sys_bp_cats` (`id`, `name`, `alias`, `price_from`, `link`, `block`, `created`, `modified`) VALUES
(1, 'Дом Лион', 'lion', 'Квартиры от 580 500 грн', 'https://n-k-z.com/flats/lion/r1/', 0, '2018-01-13 00:00:00', '2018-01-15 22:23:05'),
(2, 'Дом Шатель', 'shatel', 'Квартиры от 560 000 грн', 'https://n-k-z.com/flats/shatel/r1/', 0, '2018-01-13 00:00:00', '2018-01-15 22:24:08'),
(3, 'ЖК Vlasna', 'zhk-vlasna', 'Квартиры от 524 400 грн', 'https://n-k-z.com/flats/dom-vlasna/r1/', 0, '2018-01-15 21:29:46', '2018-01-15 22:26:39');

-- --------------------------------------------------------

--
-- Структура таблиці `osc_sys_bp_entries`
--

CREATE TABLE `osc_sys_bp_entries` (
  `id` int(11) NOT NULL,
  `cat` int(11) NOT NULL DEFAULT '0',
  `caption` varchar(255) DEFAULT NULL,
  `description` text,
  `block` int(11) NOT NULL DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `osc_sys_bp_entries`
--

INSERT INTO `osc_sys_bp_entries` (`id`, `cat`, `caption`, `description`, `block`, `created`, `modified`) VALUES
(1, 2, 'Монтируется стропильная система крыши во 2-ой секции дома', '<p><br></p>', 0, '2017-12-28 00:00:00', '2018-01-15 22:14:36'),
(2, 2, 'Закончены фасадные работы по дому Шатель', '<p><br></p>', 0, '2017-12-28 00:00:00', '2018-01-15 22:14:27'),
(3, 1, 'Продолжаются работы по остеклению 1-2 секций дома Лион', '<p><br></p>', 0, '2017-12-28 00:00:00', '2018-01-15 22:15:11'),
(4, 1, 'Продолжаются строительные работы 2-3 секций дома Лион', '<p><br></p>', 0, '2017-12-28 00:00:00', '2018-01-15 22:15:55'),
(5, 1, 'Кладочные работы в 5-6 секциях дома Лион', '', 0, '2017-12-28 00:00:00', '2018-01-15 22:16:32'),
(6, 3, 'Идут кладочные работы на 5-ом этаже 2 дома проекта Власна', '', 0, '2017-12-28 00:00:00', '2018-03-22 17:39:21'),
(7, 3, 'В доме №1 идут внутренние работы', '', 0, '2017-12-28 00:00:00', '2018-01-26 12:30:46'),
(8, 3, 'В доме №1 идут внутренние работы', '', 0, '2018-01-21 00:00:00', '2018-01-26 12:39:01'),
(9, 3, 'В доме №2 ведутся организационные работы для продолжения строительства дома', '', 0, '2018-01-21 00:00:00', '2018-01-26 12:40:53'),
(10, 3, 'Дом №1 и Дом №2', '', 0, '2018-01-21 00:00:00', '2018-01-26 12:45:42'),
(12, 1, 'Ведется кладка стен 4-ого этажа в 6 секции дома Лион', '', 0, '2018-01-21 00:00:00', '2018-01-26 12:50:17'),
(13, 1, 'Ведется утепление и армирование фасада в 1, 2 и 3 секциях дома Лион', '', 0, '2018-01-21 00:00:00', '2018-01-26 12:53:25'),
(14, 1, 'Ведется кладка стен 7-ого этажа в 4-секции дома Лион', '', 0, '2018-01-21 00:00:00', '2018-01-26 12:55:36'),
(15, 2, 'Ведется монтаж подвесного потолка \"amstrong\" в подъезде 1- ой секции дома Шатель', '', 0, '2018-01-21 00:00:00', '2018-01-26 12:57:47'),
(16, 2, 'Заканчивается монтаж металлочерипицы на крыше 2- ой секции дома Шатель', '', 0, '2018-01-21 00:00:00', '2018-01-26 12:58:45'),
(17, 2, 'Установлены отливы по фасаду', '', 0, '2018-02-01 00:00:00', '2018-02-06 12:20:51'),
(18, 1, 'Продолжается монтаж стеклопакетов в 1-3 секциях', '', 0, '2018-02-01 00:00:00', '2018-02-06 12:25:16'),
(19, 0, 'Продолжается кладка стен 7-ого этажа в 4 и 5 секции ', '', 0, '2018-02-01 00:00:00', '2018-02-06 12:26:42'),
(20, 1, ' Заканчивается кладка стен 4-ого этажа в 6 секции', '', 0, '2018-02-01 00:00:00', '2018-02-06 12:27:43'),
(21, 3, 'Ведется монтаж каркаса монолитной плиты перекрытия 5- ого этажа', '', 0, '2018-02-01 00:00:00', '2018-02-06 12:36:46'),
(22, 2, 'Ведутся подготовительные работы для благоустройства территории вокруг дома \"Шатель\"', '', 0, '2018-02-23 00:00:00', '2018-03-05 12:21:16'),
(23, 1, 'Продолжается установка оконных блоков на фасаде 1,2 и 3й секции со двора', '', 0, '2018-02-23 00:00:00', '2018-03-05 12:25:26'),
(24, 1, 'Ведется кладка стен 8- ого этажа в 4й секции', '', 0, '2018-02-23 00:00:00', '2018-03-05 12:55:02'),
(25, 3, 'Дом №2: ведутся подготовительные работы для монтажа оконных блоков', '', 0, '2018-02-23 00:00:00', '2018-03-05 12:33:30'),
(26, 3, 'Дом №2: продолжается кладка стен 6- ого этажа', '', 0, '2018-02-23 00:00:00', '2018-03-05 12:34:19'),
(27, 3, 'Дом №2: выполнены работы по бетонированию плиты перекрытия 5-ого этажа', '', 0, '2018-02-23 00:00:00', '2018-03-05 12:35:21'),
(28, 3, 'Выполнена кладка стен 6 - ого этажа дома №2 проекта Власна', '', 0, '2018-03-15 00:00:00', '2018-03-22 17:39:00'),
(29, 3, 'Выполнены работы по  бетонированию плиты перекрытия 6-ого этажа', '', 0, '2018-03-15 00:00:00', '2018-03-22 17:39:50'),
(30, 3, 'Ведется кладка межкомнатных перегородок', '', 0, '2018-03-15 00:00:00', '2018-03-22 17:40:13'),
(31, 3, 'Ведутся подготовительные работы для монтажа стен 7- ого этажа', '', 0, '2018-03-22 17:40:33', '2018-03-22 17:40:33'),
(32, 2, 'Заканчивается внутренняя отделка подъезда и лестниц в 1- ой секции', '', 0, '2018-03-15 00:00:00', '2018-03-22 17:44:00'),
(33, 2, 'Ведется монтаж подвесного потолка \"amstrong\" в подъезде 2- ой секции', '', 0, '2018-03-15 00:00:00', '2018-03-22 17:44:30'),
(34, 2, 'Выполнен проект благоустройства территории вокруг дома \"Шатель\"', '', 0, '2018-03-15 00:00:00', '2018-03-22 17:45:03'),
(35, 2, 'Ведется монтаж обводной газовой трубы вокруг дома \"Шатель\"', '', 0, '2018-03-15 00:00:00', '2018-03-22 17:45:30'),
(36, 1, 'Заканчивается установка оконных блоков на фасаде 1-й секции со двора', '', 0, '2018-03-15 00:00:00', '2018-03-22 17:47:00'),
(37, 1, 'Продолжается утепление и армирование  фасада', '', 0, '2018-03-15 00:00:00', '2018-03-22 17:47:37'),
(38, 1, 'Продолжается кладка стен 8- ого этажа в 4-й секции', '', 0, '2018-03-15 00:00:00', '2018-03-22 17:48:43'),
(39, 1, 'Закончена кладка стен 9-ого этажа в 5-й секции', '', 0, '2018-03-15 00:00:00', '2018-03-22 17:49:18'),
(40, 2, 'Ведется установка входных дверей в квартиры 1- ой секции', '', 0, '2018-03-25 00:00:00', '2018-03-27 17:53:29'),
(41, 2, 'Заканчивается монтаж  внутренней газовой разводки во 2 - ой секции', '', 0, '2018-03-25 00:00:00', '2018-03-27 17:54:00'),
(42, 2, 'Продолжается монтаж подвесного потолка \"amstrong\" в подъезде 2- ой секции', '', 0, '2018-03-25 00:00:00', '2018-03-27 17:54:27'),
(43, 3, 'Ведется монтаж стен 2- ого этажа  двухуровневых квартир 6- ого этажа', '', 0, '2018-03-25 00:00:00', '2018-03-27 17:55:06'),
(44, 3, 'Ведутся подготовительные работы для монтажа металло-пластикова оконного конструктива', '', 0, '2018-03-25 00:00:00', '2018-03-27 17:55:28'),
(45, 1, 'Ведется утепление и армирование  фасада в 1-2 секциях', '', 0, '2018-03-25 00:00:00', '2018-03-27 17:56:43'),
(46, 1, 'Заканчивается частичное  бетонирование монолитных участков на крыше в 1, 2 и 3 секциях', '', 0, '2018-03-27 17:58:12', '2018-03-27 17:58:12'),
(47, 1, 'Закончена кладка стен 6 - ого этажа в 6 секции', '', 0, '2018-03-25 00:00:00', '2018-03-27 17:58:55'),
(48, 3, 'Закончен монтаж стен 2- ого этажа  двухуровневых квартир 6- ого этажа, дома №2', '', 0, '2018-04-11 17:29:15', '2018-04-11 17:29:15'),
(49, 3, 'Ведутся подготовительные работы для монтажа крыши двухуровневых квартир, дома №2', '', 0, '2018-04-11 17:29:54', '2018-04-11 17:29:54'),
(50, 1, 'Установлены газовые счетчики', '', 0, '2018-04-11 17:30:43', '2018-04-11 17:30:43'),
(51, 2, 'Для дома \"Шатель\" установлен ШРП ( шкафной газорегуляторный пункт)', '', 0, '2018-04-11 17:32:02', '2018-04-11 17:32:02'),
(52, 2, 'Заканчиваются внутренние отделочные работы в \"колясочной\" 2- ой секции дома Шатель', '', 0, '2018-04-11 17:32:48', '2018-04-11 17:32:48'),
(53, 2, 'Ведется установка входных дверей в квартиры 1- ой секции дома Шатель', '', 0, '2018-04-11 17:33:23', '2018-04-11 17:33:23'),
(54, 1, 'Продолжается утепление и армирование  фасада в 1-3 секциях', '', 0, '2018-04-11 17:34:32', '2018-04-11 17:34:32'),
(55, 1, 'Продолжается  монтаж  металло-пластикового оконного конструктива в 4-ой секции', '', 0, '2018-04-11 17:35:54', '2018-04-11 17:35:54'),
(56, 1, 'Пояс усиления 6-ого этажа - забетонирован в 6-ой секции', '', 0, '2018-04-11 17:36:43', '2018-04-11 17:36:43'),
(57, 1, 'Ведутся работы по монтажу инженерных сетей в 1-3 секциях', '', 0, '2018-04-11 17:38:02', '2018-04-11 17:38:02'),
(58, 1, 'Продолжаются работы по оштукатуриванию фасада в 1-3 секциях', '', 0, '2018-05-08 00:00:00', '2018-05-08 12:11:59'),
(59, 1, 'Выполнен монтаж плит перекрытия технического этажа в 5-й секции', '', 0, '2018-05-08 12:12:21', '2018-05-08 12:12:21'),
(60, 2, 'Продолжаются отделочные работы мест общего пользования в подъездах дома ( декоративная штукатурка)', '', 0, '2018-05-08 12:13:15', '2018-05-08 12:13:15'),
(61, 2, 'Ведутся работы для благоустройства территории вокруг дома', '', 0, '2018-05-08 12:13:39', '2018-05-08 12:13:39'),
(62, 3, 'Выполнен монтаж перекрытия  двухуровневых  квартир 6-ого этажа, дома №2', '', 0, '2018-05-08 12:15:00', '2018-05-08 12:15:00'),
(63, 3, 'Ведется установка газовых котлов в доме №1', '', 0, '2018-05-08 12:16:14', '2018-05-08 12:16:14'),
(64, 2, 'Ведется внешняя отделка цоколя декоративным камнем', '', 0, '2018-06-04 12:10:50', '2018-06-04 12:10:50'),
(65, 2, 'Заканчивается внутренняя отделка стен подъезда 1- ой секции', '', 0, '2018-06-04 12:11:25', '2018-06-04 12:11:25'),
(66, 2, 'Продолжается внутренняя отделка подъезда во 2- ой секции', '', 0, '2018-06-04 12:11:48', '2018-06-04 12:11:48'),
(67, 1, 'Внешняя отделка фасада в 1-3 секциях - продолжается ( армирование, декоративная штукатурка).', '', 0, '2018-06-04 12:13:05', '2018-06-04 12:13:05'),
(68, 1, 'Ведется монтаж стен 8-ого этажа в 6-й секции', '', 0, '2018-06-04 00:00:00', '2018-06-04 12:14:12'),
(69, 1, 'Выполнено утепление крыши в 3-й секции', '', 0, '2018-06-04 12:15:23', '2018-06-04 12:15:23'),
(70, 1, 'Продолжается монтаж коллективных дымоходов в 1-2 секциях', '', 0, '2018-06-04 12:23:39', '2018-06-04 12:23:39'),
(71, 3, 'Ведутся подготовительные работы для монтажа металлопластиковых оконных конструкций в доме №2', '', 0, '2018-06-04 12:24:44', '2018-06-04 12:24:44'),
(72, 3, 'Ведутся подготовительные работы для утепления  и гидроизоляции крыши в доме №2', '', 0, '2018-06-04 12:25:36', '2018-06-04 12:25:36');

-- --------------------------------------------------------

--
-- Структура таблиці `osc_sys_bp_photos`
--

CREATE TABLE `osc_sys_bp_photos` (
  `id` int(11) NOT NULL,
  `entry_id` int(11) NOT NULL DEFAULT '0',
  `source` text,
  `type` int(11) NOT NULL DEFAULT '1',
  `caption` varchar(255) DEFAULT NULL,
  `block` int(11) NOT NULL DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `osc_sys_bp_photos`
--

INSERT INTO `osc_sys_bp_photos` (`id`, `entry_id`, `source`, `type`, `caption`, `block`, `created`, `modified`) VALUES
(5, 1, 'bpf_20180115221340322.jpg', 1, NULL, 0, '2018-01-15 22:13:40', '2018-01-15 22:13:40'),
(6, 2, 'bpf_20180115221427878.jpg', 1, NULL, 0, '2018-01-15 22:14:27', '2018-01-15 22:14:27'),
(7, 3, 'bpf_20180115221511225.jpg', 1, NULL, 0, '2018-01-15 22:15:11', '2018-01-15 22:15:11'),
(8, 4, 'bpf_20180115221555559.jpg', 1, NULL, 0, '2018-01-15 22:15:55', '2018-01-15 22:15:55'),
(9, 5, 'bpf_20180115221632837.jpg', 1, NULL, 0, '2018-01-15 22:16:32', '2018-01-15 22:16:32'),
(10, 6, 'bpf_20180115221718139.jpg', 1, NULL, 0, '2018-01-15 22:17:18', '2018-01-15 22:17:18'),
(11, 7, 'bpf_20180115221749951.jpg', 1, NULL, 0, '2018-01-15 22:17:49', '2018-01-15 22:17:49'),
(13, 8, 'bpf_20180126123901735.jpg', 1, NULL, 0, '2018-01-26 12:39:01', '2018-01-26 12:39:01'),
(14, 9, 'bpf_20180126124053104.jpg', 1, NULL, 0, '2018-01-26 12:40:53', '2018-01-26 12:40:53'),
(16, 10, 'bpf_20180126124542524.jpg', 1, NULL, 0, '2018-01-26 12:45:42', '2018-01-26 12:45:42'),
(17, 11, 'bpf_20180126125014459.jpg', 1, NULL, 0, '2018-01-26 12:50:14', '2018-01-26 12:50:14'),
(18, 12, 'bpf_20180126125017718.jpg', 1, NULL, 0, '2018-01-26 12:50:17', '2018-01-26 12:50:17'),
(19, 13, 'bpf_20180126125158683.jpg', 1, NULL, 0, '2018-01-26 12:51:58', '2018-01-26 12:51:58'),
(20, 14, 'bpf_20180126125536511.jpg', 1, NULL, 0, '2018-01-26 12:55:36', '2018-01-26 12:55:36'),
(21, 15, 'bpf_20180126125747779.jpg', 1, NULL, 0, '2018-01-26 12:57:47', '2018-01-26 12:57:47'),
(22, 16, 'bpf_20180126125845466.jpg', 1, NULL, 0, '2018-01-26 12:58:45', '2018-01-26 12:58:45'),
(23, 17, 'bpf_20180206122051347.jpg', 1, NULL, 0, '2018-02-06 12:20:51', '2018-02-06 12:20:51'),
(24, 17, 'bpf_20180206122051374.jpg', 1, NULL, 0, '2018-02-06 12:20:51', '2018-02-06 12:20:51'),
(25, 18, 'bpf_20180206122358754.jpg', 1, NULL, 0, '2018-02-06 12:23:58', '2018-02-06 12:23:58'),
(26, 19, 'bpf_20180206122642328.jpg', 1, NULL, 0, '2018-02-06 12:26:42', '2018-02-06 12:26:42'),
(27, 20, 'bpf_20180206122743844.jpg', 1, NULL, 0, '2018-02-06 12:27:43', '2018-02-06 12:27:43'),
(28, 21, 'bpf_20180206123646523.jpg', 1, NULL, 0, '2018-02-06 12:36:46', '2018-02-06 12:36:46'),
(29, 22, 'bpf_20180305122116375.jpg', 1, NULL, 0, '2018-03-05 12:21:16', '2018-03-05 12:21:16'),
(30, 22, 'bpf_20180305122116332.jpg', 1, NULL, 0, '2018-03-05 12:21:16', '2018-03-05 12:21:16'),
(31, 23, 'bpf_20180305122526678.jpg', 1, NULL, 0, '2018-03-05 12:25:27', '2018-03-05 12:25:27'),
(32, 23, 'bpf_20180305122527724.jpg', 1, NULL, 0, '2018-03-05 12:25:27', '2018-03-05 12:25:27'),
(33, 24, 'bpf_20180305123126404.jpg', 1, NULL, 0, '2018-03-05 12:31:26', '2018-03-05 12:31:26'),
(34, 25, 'bpf_20180305123330588.JPG', 1, NULL, 0, '2018-03-05 12:33:31', '2018-03-05 12:33:31'),
(35, 26, 'bpf_20180305123419997.jpg', 1, NULL, 0, '2018-03-05 12:34:19', '2018-03-05 12:34:19'),
(36, 27, 'bpf_20180305123521145.jpg', 1, NULL, 0, '2018-03-05 12:35:22', '2018-03-05 12:35:22'),
(37, 28, 'bpf_20180322173848436.jpg', 1, NULL, 0, '2018-03-22 17:38:49', '2018-03-22 17:38:49'),
(38, 29, 'bpf_20180322173950891.jpg', 1, NULL, 0, '2018-03-22 17:39:51', '2018-03-22 17:39:51'),
(39, 30, 'bpf_20180322174013797.jpg', 1, NULL, 0, '2018-03-22 17:40:14', '2018-03-22 17:40:14'),
(40, 31, 'bpf_20180322174033537.jpg', 1, NULL, 0, '2018-03-22 17:40:33', '2018-03-22 17:40:33'),
(41, 32, 'bpf_20180322174400163.jpg', 1, NULL, 0, '2018-03-22 17:44:00', '2018-03-22 17:44:00'),
(42, 33, 'bpf_20180322174430727.jpg', 1, NULL, 0, '2018-03-22 17:44:30', '2018-03-22 17:44:30'),
(43, 34, 'bpf_20180322174503479.jpg', 1, NULL, 0, '2018-03-22 17:45:03', '2018-03-22 17:45:03'),
(44, 35, 'bpf_20180322174530491.jpg', 1, NULL, 0, '2018-03-22 17:45:30', '2018-03-22 17:45:30'),
(45, 36, 'bpf_20180322174700130.jpg', 1, NULL, 0, '2018-03-22 17:47:00', '2018-03-22 17:47:00'),
(46, 37, 'bpf_20180322174737356.jpg', 1, NULL, 0, '2018-03-22 17:47:37', '2018-03-22 17:47:37'),
(47, 38, 'bpf_20180322174843414.jpg', 1, NULL, 0, '2018-03-22 17:48:43', '2018-03-22 17:48:43'),
(48, 39, 'bpf_20180322174918464.jpg', 1, NULL, 0, '2018-03-22 17:49:18', '2018-03-22 17:49:18'),
(49, 40, 'bpf_20180327175329142.jpg', 1, NULL, 0, '2018-03-27 17:53:29', '2018-03-27 17:53:29'),
(50, 41, 'bpf_20180327175400865.jpg', 1, NULL, 0, '2018-03-27 17:54:00', '2018-03-27 17:54:00'),
(51, 42, 'bpf_20180327175427327.jpg', 1, NULL, 0, '2018-03-27 17:54:27', '2018-03-27 17:54:27'),
(52, 43, 'bpf_20180327175506809.jpg', 1, NULL, 0, '2018-03-27 17:55:06', '2018-03-27 17:55:06'),
(53, 44, 'bpf_20180327175528219.jpg', 1, NULL, 0, '2018-03-27 17:55:28', '2018-03-27 17:55:28'),
(54, 45, 'bpf_20180327175643450.jpg', 1, NULL, 0, '2018-03-27 17:56:43', '2018-03-27 17:56:43'),
(55, 46, 'bpf_20180327175812828.jpg', 1, NULL, 0, '2018-03-27 17:58:12', '2018-03-27 17:58:12'),
(56, 47, 'bpf_20180327175855740.jpg', 1, NULL, 0, '2018-03-27 17:58:55', '2018-03-27 17:58:55'),
(57, 48, 'bpf_20180411172915158.jpg', 1, NULL, 0, '2018-04-11 17:29:15', '2018-04-11 17:29:15'),
(58, 49, 'bpf_20180411172954391.jpg', 1, NULL, 0, '2018-04-11 17:29:54', '2018-04-11 17:29:54'),
(59, 50, 'bpf_20180411173043368.jpg', 1, NULL, 0, '2018-04-11 17:30:43', '2018-04-11 17:30:43'),
(60, 51, 'bpf_20180411173202565.jpg', 1, NULL, 0, '2018-04-11 17:32:02', '2018-04-11 17:32:02'),
(61, 52, 'bpf_20180411173248823.jpg', 1, NULL, 0, '2018-04-11 17:32:48', '2018-04-11 17:32:48'),
(62, 53, 'bpf_20180411173323243.jpg', 1, NULL, 0, '2018-04-11 17:33:23', '2018-04-11 17:33:23'),
(63, 54, 'bpf_20180411173432162.jpg', 1, NULL, 0, '2018-04-11 17:34:32', '2018-04-11 17:34:32'),
(64, 55, 'bpf_20180411173554692.jpg', 1, NULL, 0, '2018-04-11 17:35:55', '2018-04-11 17:35:55'),
(65, 56, 'bpf_20180411173643996.jpg', 1, NULL, 0, '2018-04-11 17:36:43', '2018-04-11 17:36:43'),
(66, 57, 'bpf_20180411173802950.jpg', 1, NULL, 0, '2018-04-11 17:38:02', '2018-04-11 17:38:02'),
(67, 58, 'bpf_20180508121045207.jpg', 1, NULL, 0, '2018-05-08 12:10:45', '2018-05-08 12:10:45'),
(68, 58, 'bpf_20180508121045371.jpg', 1, NULL, 0, '2018-05-08 12:10:45', '2018-05-08 12:10:45'),
(69, 59, 'bpf_20180508121221590.jpg', 1, NULL, 0, '2018-05-08 12:12:21', '2018-05-08 12:12:21'),
(70, 60, 'bpf_20180508121315769.jpg', 1, NULL, 0, '2018-05-08 12:13:15', '2018-05-08 12:13:15'),
(71, 61, 'bpf_20180508121339609.jpg', 1, NULL, 0, '2018-05-08 12:13:39', '2018-05-08 12:13:39'),
(72, 62, 'bpf_20180508121500432.jpg', 1, NULL, 0, '2018-05-08 12:15:00', '2018-05-08 12:15:00'),
(73, 63, 'bpf_20180508121614547.jpg', 1, NULL, 0, '2018-05-08 12:16:14', '2018-05-08 12:16:14'),
(74, 64, 'bpf_20180604121050176.jpg', 1, NULL, 0, '2018-06-04 12:10:50', '2018-06-04 12:10:50'),
(75, 65, 'bpf_20180604121125727.jpg', 1, NULL, 0, '2018-06-04 12:11:25', '2018-06-04 12:11:25'),
(76, 66, 'bpf_20180604121148976.jpg', 1, NULL, 0, '2018-06-04 12:11:48', '2018-06-04 12:11:48'),
(77, 67, 'bpf_20180604121305771.jpg', 1, NULL, 0, '2018-06-04 12:13:05', '2018-06-04 12:13:05'),
(78, 67, 'bpf_20180604121305452.jpg', 1, NULL, 0, '2018-06-04 12:13:05', '2018-06-04 12:13:05'),
(79, 68, 'bpf_20180604121406443.jpg', 1, NULL, 0, '2018-06-04 12:14:06', '2018-06-04 12:14:06'),
(80, 69, 'bpf_20180604121523559.jpg', 1, NULL, 0, '2018-06-04 12:15:23', '2018-06-04 12:15:23'),
(81, 70, 'bpf_20180604122339999.jpg', 1, NULL, 0, '2018-06-04 12:23:39', '2018-06-04 12:23:39'),
(82, 71, 'bpf_20180604122444361.jpg', 1, NULL, 0, '2018-06-04 12:24:44', '2018-06-04 12:24:44'),
(83, 72, 'bpf_20180604122536603.jpg', 1, NULL, 0, '2018-06-04 12:25:36', '2018-06-04 12:25:36');

-- --------------------------------------------------------

--
-- Структура таблиці `osc_sys_contact_form`
--

CREATE TABLE `osc_sys_contact_form` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `message` text,
  `seen` int(11) NOT NULL DEFAULT '0',
  `created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблиці `osc_sys_docs`
--

CREATE TABLE `osc_sys_docs` (
  `id` int(11) NOT NULL,
  `cat` int(11) NOT NULL DEFAULT '0',
  `source` varchar(255) DEFAULT NULL,
  `block` int(11) NOT NULL DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `osc_sys_docs`
--

INSERT INTO `osc_sys_docs` (`id`, `cat`, `source`, `block`, `created`, `modified`) VALUES
(21, 13, 'doc_20180112112347744.jpg', 0, '2018-01-12 11:23:48', '2018-01-12 11:23:48'),
(23, 14, 'doc_20180112112422892.jpg', 0, '2018-01-12 11:24:22', '2018-01-12 11:24:22'),
(24, 15, 'doc_20180112112450207.jpg', 0, '2018-01-12 11:24:50', '2018-01-12 11:24:50');

-- --------------------------------------------------------

--
-- Структура таблиці `osc_sys_doc_cats`
--

CREATE TABLE `osc_sys_doc_cats` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `icon_active` varchar(255) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `block` int(11) NOT NULL DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `osc_sys_doc_cats`
--

INSERT INTO `osc_sys_doc_cats` (`id`, `name`, `icon`, `icon_active`, `alias`, `block`, `created`, `modified`) VALUES
(13, 'Документы на землю', 'dic_20180110013945808.png', NULL, 'dokumentu-na-zemlyu', 1, NULL, '2018-01-12 11:25:18'),
(14, 'Декларация на строительство', NULL, NULL, 'deklaraciya-na-stroitelstvo', 0, NULL, '2018-01-12 11:24:22'),
(15, 'Подключение э/энергии', NULL, NULL, 'podklyuchenie-e-energii', 0, NULL, '2018-01-12 11:24:50');

-- --------------------------------------------------------

--
-- Структура таблиці `osc_sys_env_coords`
--

CREATE TABLE `osc_sys_env_coords` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT '1',
  `ref` int(11) NOT NULL DEFAULT '0',
  `lat` varchar(255) DEFAULT NULL,
  `lng` varchar(255) DEFAULT NULL,
  `block` int(11) NOT NULL DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `osc_sys_env_coords`
--

INSERT INTO `osc_sys_env_coords` (`id`, `name`, `alias`, `type`, `ref`, `lat`, `lng`, `block`, `created`, `modified`) VALUES
(1, 'Детский сад', 'children_garden', 1, 1, '50', '30', 0, '2017-12-31 00:00:00', '2017-12-31 00:00:00'),
(2, 'Школы', 'schools', 1, 1, '50', '30', 0, '2017-12-31 00:00:00', '2017-12-31 00:00:00'),
(3, 'Здоровье', 'health', 1, 1, '50', '30', 0, '2017-12-31 00:00:00', '2017-12-31 00:00:00'),
(4, 'Товары и услуги', 'goods_and_services', 1, 1, '50', '30', 0, '2017-12-31 00:00:00', '2017-12-31 00:00:00'),
(5, 'Рестораны и клубы отдыха', 'restoraunts', 1, 1, '50', '30', 0, '2017-12-31 00:00:00', '2017-12-31 00:00:00');

-- --------------------------------------------------------

--
-- Структура таблиці `osc_sys_events`
--

CREATE TABLE `osc_sys_events` (
  `id` int(11) NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `ref_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `block` int(11) DEFAULT '0',
  `start` datetime DEFAULT NULL,
  `finish` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблиці `osc_sys_flats`
--

CREATE TABLE `osc_sys_flats` (
  `id` int(11) NOT NULL,
  `layout_name` varchar(255) DEFAULT NULL,
  `house_id` int(11) NOT NULL DEFAULT '0',
  `room_id` int(11) NOT NULL DEFAULT '0',
  `caption` varchar(255) DEFAULT NULL,
  `flat_desc` text,
  `properties` text,
  `features` text,
  `block` int(11) NOT NULL DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `osc_sys_flats`
--

INSERT INTO `osc_sys_flats` (`id`, `layout_name`, `house_id`, `room_id`, `caption`, `flat_desc`, `properties`, `features`, `block`, `created`, `modified`) VALUES
(7, 'Лион 1-комнатная 27,3м', 8, 7, NULL, 'Последняя квартира-студия во 2-ой секции дома.  Секция построена, идут фасадные работы. Квартира на 3 этаже, стоимость 17500 грн/м.', 'Помещение* Площадь;\r\nОБЩАЯ ПЛОЩАДЬ*27,3 кв.м.;\r\nКОМНАТА-СТУДИЯ* 20,7 кв.м.;\r\nПРИХОЖАЯ* 3,5 кв.м.;\r\nСАНУЗЕЛ* 3,1 кв.м.;', '', 1, '2018-01-08 21:28:33', '2018-05-29 13:09:53'),
(8, 'Лион 1-комнатная 43м', 8, 7, NULL, 'Общая площадь: 43 кв.м.\r\nНовый формат \"евродвушка\" - просторная кухня может быть гостиной или столовой, а комната будет вашей личной спальней.\r\nТакие квартиры есть в 5-ой секции дома. Еще есть выбор этажей.', 'Помещение* Площадь;\r\nОБЩАЯ ПЛОЩАДЬ* 43 кв.м.;\r\nКУХНЯ*	17,1 кв.м.;\r\nКОМНАТА* 17,1 кв.м.;\r\nПРИХОЖАЯ* 3,7 кв.м.;\r\nСАНУЗЕЛ* 3,1 кв.м.;\r\nБАЛКОН* 3,7 кв.м.;', '', 0, '2018-01-14 22:09:28', '2018-04-17 18:22:24'),
(9, 'Лион 1-комнатная 34,3м', 8, 7, NULL, 'Такие квартиры есть в построенной 1-ой секции дома. Остались только на 6, 7, 8 этажах. Цена - 15 500 грн за кв.м.', 'Помещение* Площадь;\r\nОБЩАЯ ПЛОЩАДЬ* 34 кв.м.;\r\nКУХНЯ* 11,5 кв.м.;\r\nКОМНАТА* 15,9 кв.м.;\r\nПРИХОЖАЯ* 3,8 кв.м.;\r\nСАНУЗЕЛ* 3,1 кв.м.;', '', 0, '2018-01-14 22:15:55', '2018-04-17 18:24:11'),
(10, 'Лион 1-комнатная 45,6м', 8, 7, NULL, 'Общая площадь: 45,6 кв.м.\r\nКвартира в 5-й секции дома \"Лион\". Просторная и комфортная.', 'Помещение* Площадь;\r\nКУХНЯ* 19 кв.м.;\r\nКОМНАТА* 16 кв.м.;\r\nСАНУЗЕЛ* 3,9 И 1,4 кв.м.;\r\nПРИХОЖАЯ* 5,3 кв.м.;', 'входная металлическая дверь;\r\nмашинная штукатурка стен под чистовую отделку;\r\nлазерная стяжка пола; \r\nсчётчики на газ/воду/свет;\r\nдвухкамерный стеклопакет и подоконники;\r\nсантехническая разводка с точками входа;\r\nнастенные радиаторы отопления;\r\nгазовый итальянский котел (за доплату);', 1, '2018-01-14 22:39:41', '2018-04-17 18:19:13'),
(11, 'Лион 1-комнатная 49,4м', 8, 7, NULL, 'Общая площадь: 49,4 кв.м.\r\nПрактически 2-к квартира. Используйте просторную кухню как гостиную, отдыхайте в спальне.', 'Помещение* Площадь;\r\nОБЩАЯ ПЛОЩАДЬ *49,4 кв.м.;\r\nКУХНЯ* 19,6 кв.м.;\r\nКОМНАТА* 19,5 кв.м.;\r\nПРИХОЖАЯ* 5,4 кв.м.;\r\nСАНУЗЕЛ* 3,2 и 1,6 кв.м.;', '', 0, '2018-01-14 22:42:19', '2018-04-17 18:24:59'),
(12, 'Лион 2-комнатная 66,4м', 8, 8, NULL, 'Общая площадь: 66,4 кв.м.\r\nПросторная и светлая квартира. Приятная изюминка - гардеробная-кладовая.', 'Помещение* Площадь;\r\nКУХНЯ* 18,3 кв.м.;\r\nГОСТИНАЯ* 12,9 кв.м.;\r\nСПАЛЬНЯ* 13,9 кв.м.;\r\nПРИХОЖАЯ* 9,3 кв.м.;\r\nСАНУЗЛЫ* 2,5 и 2,8 кв.м.;\r\nЛОДЖИЯ* 3,7 кв.м.;\r\nГАРДЕРОБНАЯ* 4,8 кв.м.;', '', 1, '2018-01-14 23:05:06', '2018-01-30 17:25:22'),
(13, 'Лион 2-комнатная 68,6м', 8, 8, NULL, 'Двухсторонняя 2-к квартира. Осталась только на 1 и 6 этажах. Расположена в построенной 2-ой секции дома. Цена 15 000 грн за кв.м.', 'Помещение* Площадь;\r\nОБЩАЯ ПЛОЩАДЬ* 68,6 кв.м.;\r\nКУХНЯ* 17,9 кв.м.;\r\nСПАЛЬНАЯ*	18,2 кв.м.;\r\nГОСТИНАЯ*	20,2 кв.м.;\r\nПРИХОЖАЯ* 5,8 кв.м.;', '', 0, '2018-01-14 23:20:36', '2018-04-17 18:33:14'),
(14, 'Лион 2-комнатная 72м', 8, 8, NULL, 'Общая площадь 72 кв.м.\r\nМаксимальный вариант 2-к квартиры с широкими возможностями по перепланировке. Для семьи до 5-6 человек.', 'Помещение* Площадь;\r\nКУХНЯ* 14,2 кв.м.;\r\nСПАЛЬНАЯ* 17,3 кв.м.;\r\nГОСТИНАЯ* 15,3 кв.м.;\r\nПРИХОЖАЯ* 4,5 кв.м.;\r\nГАРДЕРОБНАЯ* 4,9 кв.м.;\r\nСАНУЗЛЫ* 3,1 и 1,4 кв.м.;\r\nЛОДЖИЯ* 3,9 кв.м.;', '', 0, '2018-01-14 23:26:44', '2018-01-14 23:26:53'),
(15, 'Лион двухуровневая 70м', 8, 9, NULL, 'Трехкомнатная двухуровневая квартира общей площадью 70 кв.м. Планировка без балкона/лоджии. Санузлы на каждом уровне.', 'Помещение* Площадь;\r\nОБЩАЯ ПЛОЩАДЬ* 70 кв.м.;\r\nКУХНЯ* 11 кв.м.;\r\nКОМНАТА 1* 9,5 кв.м.;\r\nКОМНАТА 2* 9,5 кв.м.;\r\nКОМНАТА 3* 11 кв.м.;\r\nПРИХОЖАЯ* 11,1 кв.м.;', '', 0, '2018-01-15 00:23:20', '2018-01-15 10:52:49'),
(16, 'Лион двухуровневая 77м', 8, 9, NULL, 'Трехкомнатная двухуровневая квартира общей площадью 77 кв.м. Есть лоджии на каждом уровне. ', 'Помещение* Площадь;\r\nОБЩАЯ ПЛОЩАДЬ* 77 кв.м.;\r\nКУХНЯ* 14,2 кв.м.;\r\nКОМНАТА 1* 14,2 кв.м.;\r\nКОМНАТА 2* 15 кв.м.;\r\nКОМНАТА 3* 17,6 кв.м.;\r\nПРИХОЖАЯ* 6,2 кв.м.;', '', 0, '2018-01-15 00:27:00', '2018-01-15 10:55:12'),
(17, 'Лион двухуровневая 83,8м', 8, 9, NULL, 'Двухуровневая трехкомнатная квартира общей площадью 84 кв.м.', 'Помещение* Площадь;\r\nОБЩАЯ ПЛОЩАДЬ* 84 кв.м.;\r\nКУХНЯ* 12,1 кв.м.;\r\nКОМНАТА 1* 12,1 кв.м.;\r\nКОМНАТА 2* 18,9 кв.м.;\r\nКОМНАТА 3* 22,8 кв.м.;\r\nПРИХОЖАЯ* 7,8 кв.м.;', '', 0, '2018-01-15 00:29:39', '2018-01-15 10:56:24'),
(18, 'Лион двухуровневая 91,9м', 8, 9, NULL, 'Двухуровневая трехкомнатная квартира с планировкой типа \"распашонка\" - окна выходят во двор и на фасад дома. Общая площадь квартиры 92 кв.м.', 'Помещение* Площадь;\r\nОБЩАЯ ПЛОЩАДЬ* 92 кв.м.;\r\nКУХНЯ* 20,4 кв.м.;\r\nКОМНАТА 1* 11,7 кв.м.;\r\nКОМНАТА 2* 15,2 кв.м.;\r\nКОМНАТА 3* 20,4 кв.м.;\r\nПРИХОЖАЯ* 9,2 кв.м.;', '', 0, '2018-01-15 00:31:59', '2018-01-15 10:58:07'),
(19, 'Лион двухуровневая 96,2м', 8, 9, NULL, 'Двухуровневая трехкомнатная квартира с планировкой типа \"распашонка\" - окна выходят во двор и на фасад дома. Общая площадь квартиры 96 кв.м.', 'Помещение* Площадь;\r\nОБЩАЯ ПЛОЩАДЬ* 96 кв.м.;\r\nКУХНЯ* 20,2 кв.м.;\r\nКОМНАТА 1* 15,2 кв.м.;\r\nКОМНАТА 2* 18,5 кв.м.;\r\nКОМНАТА 3* 20,2 кв.м.;\r\nПРИХОЖАЯ* 8,3 кв.м.;', '', 0, '2018-01-15 00:33:48', '2018-01-15 11:00:41'),
(20, 'Лион двухуровневая 147,4м', 8, 9, NULL, 'Двухуровневая 5-ти комнатная квартира в 3-й секции дома Лион на 9-10 этаже. Уникальная квартира, единственная в наличии.', 'Помещение* Площадь;\r\nОБЩАЯ ПЛОЩАДЬ* 147,4 кв.м.;\r\nКУХНЯ* 14,2 кв.м.;\r\nКОМНАТА 1* 14,2 кв.м.;\r\nКОМНАТА 2* 15,3 кв.м.;\r\nКОМНАТА 3* 15,3 кв.м.;\r\nКОМНАТА 4* 19,1 кв.м.;\r\nКОМНАТА 5* 27,4 кв.м.;\r\nПРИХОЖАЯ* 4,5 кв.м.;', '', 0, '2018-01-15 00:36:17', '2018-01-15 11:16:08'),
(21, 'Шатель 1-комнатная 35м', 11, 10, NULL, 'Классическая планировка 1-к квартиры. Оптимальный метраж и грамотное использование пространства.', 'Помещение* Площадь;\r\nОБЩАЯ ПЛОЩАДЬ* 35,5 кв.м.;\r\nКОМНАТА* 14,9 кв.м.;\r\nКУХНЯ* 11,6 кв.м.;\r\nСАНУЗЕЛ* 3,7 кв.м.;\r\nПРИХОЖАЯ* 3,2 кв.м.;\r\nЛОДЖИЯ* 4,2 кв.м.;', 'входная металлическая дверь;\r\nмашинная штукатурка стен под чистовую отделку;\r\nлазерная стяжка пола; \r\nсчётчики на газ/воду/свет;\r\nдвухкамерный стеклопакет и подоконники;\r\nсантехническая разводка с точками входа;\r\nнастенные радиаторы отопления;\r\nгазовый итальянский котел (за доплату);', 0, '2018-01-15 11:03:15', '2018-03-16 15:57:18'),
(22, 'Шатель 1-комнатная 39м', 11, 10, NULL, 'Просторная квартира для 1-2 человек. Настоящий хит продаж!', 'Помещение* Площадь;\r\nОБЩАЯ ПЛОЩАДЬ* 39,2 кв.м.;\r\nКОМНАТА* 17 кв.м.;\r\nКУХНЯ* 13,2 кв.м.;\r\nСАНУЗЕЛ* 3,7 кв.м.;\r\nПРИХОЖАЯ* 3,2 кв.м.;\r\nЛОДЖИЯ* 4,2 кв.м.;', 'входная металлическая дверь;\r\nмашинная штукатурка стен под чистовую отделку;\r\nлазерная стяжка пола; \r\nсчётчики на газ/воду/свет;\r\nдвухкамерный стеклопакет и подоконники;\r\nсантехническая разводка с точками входа;\r\nнастенные радиаторы отопления;\r\nгазовый итальянский котел (за доплату);', 0, '2018-01-15 11:05:46', '2018-03-16 15:57:30'),
(23, 'Шатель 2-комнатная 57м', 11, 11, NULL, 'Отличная двухсторонняя 2-к квартира. Большая кухня-столовая и просторная гостиная.', 'Помещение* Площадь;\r\nОБЩАЯ ПЛОЩАДЬ* 57,1 кв.м.;\r\nКОМНАТЫ* 16,7 и 12,7 кв.м.;\r\nКУХНЯ* 15,1 кв.м.;\r\nСАНУЗЕЛ* 2,8 и 1,6 кв.м.;\r\nПРИХОЖАЯ* 6,1 кв.м.;\r\nЛОДЖИЯ* 4,2 кв.м.;', 'входная металлическая дверь;\r\nмашинная штукатурка стен под чистовую отделку;\r\nлазерная стяжка пола; \r\nсчётчики на газ/воду/свет;\r\nдвухкамерный стеклопакет и подоконники;\r\nсантехническая разводка с точками входа;\r\nнастенные радиаторы отопления;\r\nгазовый итальянский котел (за доплату);', 1, '2018-01-15 11:07:49', '2018-04-17 18:34:57'),
(24, 'Шатель 2-комнатная 63м', 11, 11, NULL, 'Классическая планировка 2-к квартиры. Собственный большой балкон и традиционная кухня-столовая.', 'Помещение* Площадь;\r\nОБЩАЯ ПЛОЩАДЬ* 63 кв.м.;\r\nКОМНАТЫ* 17,7 и 11 кв.м.;\r\nКУХНЯ* 15 кв.м.;\r\nСАНУЗЕЛ:* 3,5 и 1,6 кв.м.;\r\nПРИХОЖАЯ* 10,6 кв.м.;\r\nБАЛКОН* 5,6 кв.м.;\r\nЛОДЖИЯ* 4,2 кв.м.;', 'входная металлическая дверь;\r\nмашинная штукатурка стен под чистовую отделку;\r\nлазерная стяжка пола; \r\nсчётчики на газ/воду/свет;\r\nдвухкамерный стеклопакет и подоконники;\r\nсантехническая разводка с точками входа;\r\nнастенные радиаторы отопления;\r\nгазовый итальянский котел (за доплату);', 0, '2018-01-15 11:12:17', '2018-03-16 15:57:50'),
(25, 'Шатель 2-комнатная 65м', 11, 11, NULL, 'Максимальный вариант 2-к квартиры. .Отлично подходит для семьи до 4 человек.', 'Помещение* Площадь;\r\nОБЩАЯ ПЛОЩАДЬ* 65,6 кв.м.;\r\nКОМНАТЫ* 19 и 16,2 кв.м.;\r\nКУХНЯ* 13,2 кв.м.;\r\nСАНУЗЕЛ* 3,4 и 2 кв.м.;\r\nПРИХОЖАЯ* 9,7 кв.м.;\r\nЛОДЖИЯ* 4,2 кв.м.;', 'входная металлическая дверь;\r\nмашинная штукатурка стен под чистовую отделку;\r\nлазерная стяжка пола; \r\nсчётчики на газ/воду/свет;\r\nдвухкамерный стеклопакет и подоконники;\r\nсантехническая разводка с точками входа;\r\nнастенные радиаторы отопления;\r\nгазовый итальянский котел (за доплату);', 0, '2018-01-15 11:14:30', '2018-03-16 15:57:58'),
(26, 'Шатель двухуровневая 71м', 11, 12, NULL, 'Двухуровневая трехкомнатная квартира. На верхнем уровне - свободная планировка, высокий потолок, есть точки под санузел. ', 'Помещение* Площадь;\r\nОБЩАЯ ПЛОЩАДЬ* 71 кв.м.;\r\nКУХНЯ* 11,6 кв.м.;\r\nКОМНАТА 1* 11,6 кв.м.;\r\nКОМНАТА 2* 11,7 кв.м.;\r\nКОМНАТА 3* 15,3 кв.м.;\r\nПРИХОЖАЯ* 6,7 кв.м.;', '', 0, '2018-01-15 11:21:56', '2018-01-26 11:30:20'),
(27, 'Шатель двухуровневая 76м', 11, 12, NULL, 'Двухуровневая трехкомнатная квартира. На верхнем уровне - свободная планировка, высокий потолок, есть точки под санузел. ', 'Помещение* Площадь;\r\nОБЩАЯ ПЛОЩАДЬ* 76 кв.м.;\r\nКУХНЯ* 11,4 кв.м.;\r\nКОМНАТА 1* 11,4 кв.м.;\r\nКОМНАТА 2* 12,4 кв.м.;\r\nКОМНАТА 3* 15,8 кв.м.;\r\nПРИХОЖАЯ* 8,7 кв.м.;', '', 0, '2018-01-15 11:23:47', '2018-01-26 11:30:58'),
(28, 'Шатель двухуровневая 77м', 11, 12, NULL, '', 'Помещение* Площадь;\r\nОБЩАЯ ПЛОЩАДЬ* 77 кв.м.;\r\nКУХНЯ* 13,2 кв.м.;\r\nКОМНАТА 1* 13,2 кв.м.;\r\nКОМНАТА 2* 13,2 кв.м.;\r\nКОМНАТА 3* 17,0 кв.м.;\r\nПРИХОЖАЯ* 6,8 кв.м.;', '', 1, '2018-01-15 11:25:12', '2018-01-24 12:04:28'),
(29, 'Шатель двухуровневая 79м', 11, 12, NULL, '', 'Помещение* Площадь;\r\nОБЩАЯ ПЛОЩАДЬ* 79 кв.м.;\r\nКУХНЯ* 14 кв.м.;\r\nКОМНАТА 1* 11,7 кв.м.;\r\nКОМНАТА 2* 14 кв.м.;\r\nКОМНАТА 3* 15,7 кв.м.;\r\nПРИХОЖАЯ* 8,7 кв.м.;', '', 1, '2018-01-15 11:26:34', '2018-01-24 12:04:36'),
(30, 'Шатель двухуровневая 113м', 11, 12, NULL, 'Двухуровневая пятикомнатная квартира. Окна выходят на две стороны. Настоящий пентхаус для успешных и креативных людей. На верхнем уровне - свободная планировка, высокий потолок, есть точки под санузел. ', 'Помещение* Площадь;\r\nОБЩАЯ ПЛОЩАДЬ* 113 кв.м.;\r\nКУХНЯ* 14,8 кв.м.;\r\n1 УРОВЕНЬ, КОМНАТЫ* 12,4 и 12,7 кв.м.;\r\n2 УРОВЕНЬ, КОМНАТЫ* 12,7 и 14,8 и 16,7 кв.м.;\r\nПРИХОЖАЯ* 10,3 кв.м.;\r\nЛОДЖИИ* 3,6 и 3,6 кв.м.;\r\nХОЛЛ* 6,3 кв.м.;', '', 0, '2018-01-15 11:44:09', '2018-01-26 11:35:04'),
(31, 'Шатель двухуровневая 125м', 11, 12, NULL, 'Двухуровневая пятикомнатная квартира. Окна выходят на две стороны. Настоящий пентхаус для успешных и креативных людей. На верхнем уровне - свободная планировка, высокий потолок, есть точки под санузел. ', 'Помещение* Площадь;\r\nОБЩАЯ ПЛОЩАДЬ* 125 кв.м.;\r\nКУХНЯ* 14,7 кв.м.;\r\n1 УРОВЕНЬ, КОМНАТЫ* 11 и 13,8 кв.м.;\r\n2 УРОВЕНЬ, КОМНАТЫ* 11 и 14,7 и 17,7 кв.м.;\r\nПРИХОЖАЯ* 14,5 кв.м.;\r\nЛОДЖИИ* 3,6 и 3,6 кв.м.;\r\nБАЛКОНЫ* 4,9 и 4,9 кв.м.;\r\nХОЛЛ* 10,7 кв.м.;', '', 0, '2018-01-15 11:46:15', '2018-01-26 11:39:26'),
(32, 'Шатель двухуровневая 130м', 11, 12, NULL, 'Двухуровневая пятикомнатная квартира. Настоящий пентхаус для успешных и креативных людей. На верхнем уровне - свободная планировка, высокий потолок, есть точки под санузел. ', 'Помещение* Площадь;\r\nОБЩАЯ ПЛОЩАДЬ* 130 кв.м.;\r\nКУХНЯ* 12,8 кв.м.;\r\n1 УРОВЕНЬ, КОМНАТЫ* 12,1 И 19 кв.м.;\r\n2 УРОВЕНЬ, КОМНАТЫ* 12,8 И 16,2 И 19 кв.м.;\r\nПРИХОЖАЯ* 13,6 кв.м.;\r\nЛОДЖИИ* 3,6 И 3,6 кв.м.;\r\nХОЛЛ* 9,8 кв.м.;', '', 0, '2018-01-15 11:47:46', '2018-05-21 18:11:32'),
(33, 'Дом Жива 2-комнатная 115м', 13, 13, NULL, 'Благодаря функциональному зонированию, квартира разделены на две части: первая - гостевая зона с уютной кухней, большим санузлом, просторной гостиной с камином и широкой лоджией, и вторая – личное пространство для детей и родителей - детская и спальня с вместительной гардеробной и санузлом. ', 'Помещение* Площадь;\r\nОБЩАЯ ПЛОЩАДЬ* 115 кв.м.;\r\nКУХНЯ* 12,8 кв.м.;\r\nСПАЛЬНИ* 19,7 и 12,6 кв.м.;\r\nГОСТИНАЯ* 27,6 кв.м.;\r\nПРИХОЖАЯ* 17,7 кв.м.;\r\nГАРДЕРОБНАЯ* 4,5 кв.м.;\r\nКЛАДОВАЯ* 2 кв.м.;\r\nСАНУЗЛЫ* 6,9 и 3,9 кв.м.;\r\nБАЛКОНЫ* 3,9 кв.м.;', 'металлические входные двери; \r\nмежкомнатные двери; \r\nподвесные потолки; \r\nполы с подогревом в кухне, коридоре, ванных комнатах; \r\nдва санузла с сантехникой и отделкой керамической плиткой;\r\nитальянский двухконтурный котел для отопления и горячей воды; \r\nламинат в жилых комнатах;\r\nнапольная плитка в коридоре, кухне и балконе;', 0, '2018-01-15 12:22:36', '2018-03-16 14:48:20'),
(34, 'Дом Жива двухуровневая 219м', 13, 14, NULL, 'Территория клубного дома «Жива» гармонично сочетает в себе зону отдыха с удобными беседками, зоной барбекю, басейном и детской площадкой, а вечнозеленые деревья и ландшафтный дизайн будет Вас радовать жителей дома в любое время года. Небольшой паркинг у дома, позволит жителям и гостям спокойно оставить машину, как днем, так и ночью.\r\n', 'Помещение* Площадь;\r\nОБЩАЯ ПЛОЩАДЬ* 219 кв.м.;\r\nКУХНЯ* 12,8 кв.м.;\r\n1 УРОВЕНЬ, КОМНАТЫ* 13 и 25 и 27 кв.м.;\r\n2 УРОВЕНЬ, КОМНАТЫ* 20,3 и 27,6 и 29,5 кв.м.;\r\nСАНУЗЛЫ* 3,8 и 6,9 и 12,8 кв.м.;\r\nПРИХОЖАЯ* 12,4 кв.м.;\r\nБАЛКОНЫ* 3,7 и 3,5 кв.м.;\r\nХОЛЛ* 12,4 кв.м.;', 'металлические входные двери; \r\nмежкомнатные двери; \r\nподвесные потолки; \r\nполы с подогревом в кухне, коридоре, ванных комнатах; \r\nдва санузла с сантехникой и отделкой керамической плиткой;\r\nитальянский двухконтурный котел для отопления и горячей воды; \r\nламинат в жилых комнатах;\r\nнапольная плитка в коридоре, кухне и балконе;', 0, '2018-01-15 12:31:57', '2018-03-16 15:01:00'),
(35, 'Власна 1-комнатная 38м', 12, 15, NULL, 'Стандартная планировка 1-к квартиры. Просторная кухня-готиная 16,5 кв.м. имеет выход на лоджию.', 'Помещение* Площадь;\r\nОбщая площадь* 38 кв.м.;\r\nКухня* 16 кв.м.;\r\nСпальня* 13 кв.м.;\r\nВанная* 3 кв.м.;\r\nПрихожая* 3 кв.м.;\r\nЛоджия* 1 кв.м.;', 'входная металлическая дверь;\r\nмашинная штукатурка стен под чистовую отделку;\r\nлазерная стяжка пола; \r\nсчётчики на газ/воду/свет;\r\nдвухкамерный стеклопакет и подоконники;\r\nсантехническая разводка с точками входа;\r\nнастенные радиаторы отопления;\r\nгазовый итальянский котел (за доплату);', 0, '2018-01-15 15:30:28', '2018-03-16 15:53:38'),
(36, 'Власна 1-комнатная 41м с двориком', 12, 15, NULL, 'Квартира - хит-продаж! Просторная кухня-столовая 21 кв.м., с выходом в ваш собственный дворик. Ставьте мангал, шезлонг, высаживайте цветы.', 'Помещение* Площадь;\r\nОбщая площадь* 41 кв.м.;\r\nКухня* 20 кв.м.;\r\nСпальня* 13 кв.м.;\r\nВанная* 3 кв.м.;\r\nПрихожая* 3 кв.м.;\r\nДворик* 18 кв.м.;', 'входная металлическая дверь;\r\nмашинная штукатурка стен под чистовую отделку;\r\nлазерная стяжка пола; \r\nсчётчики на газ/воду/свет;\r\nдвухкамерный стеклопакет и подоконники;\r\nсантехническая разводка с точками входа;\r\nнастенные радиаторы отопления;\r\nгазовый итальянский котел (за доплату);', 0, '2018-01-15 15:34:03', '2018-03-16 15:53:53'),
(37, 'Власна 2-комнатная 53м', 12, 16, NULL, 'Самая доступная 2-к квартира. Оптимальный метраж 54 кв.м, окна выходят на две стороны. Большая гостиная 17 кв.м. с выходом на балкон, уютная тихая спальня 10 кв.м. с двумя окнами.', 'Помещение* Площадь;\r\nОбщая площадь* 53 кв.м.;\r\nКухня* 11 кв.м.;\r\nСпальня* 10 кв.м.;\r\nГостиная* 17 кв.м.;\r\nВанная* 3 кв.м.;\r\nСанузел* 1 кв.м.;\r\nПрихожая* 9 кв.м.;\r\nБалкон* 1 кв.м.;', 'входная металлическая дверь;\r\nмашинная штукатурка стен под чистовую отделку;\r\nлазерная стяжка пола; \r\nсчётчики на газ/воду/свет;\r\nдвухкамерный стеклопакет и подоконники;\r\nсантехническая разводка с точками входа;\r\nнастенные радиаторы отопления;\r\nгазовый итальянский котел (за доплату);', 0, '2018-01-15 15:39:14', '2018-03-16 15:52:52'),
(38, 'Власна 2-комнатная 63м', 12, 16, NULL, 'Самый просторный вариант 2-к квартиры. Уютная спальня с выходом на балкон, просторная гостиная 19 кв.м., раздельный санузел. Оптимальный вариант для семьи.', 'Помещение* Площадь;\r\nОбщая площадь* 63 кв.м.;\r\nКухня* 11 кв.м.;\r\nСпальня* 15 кв.м.;\r\nГостиная* 18 кв.м.;\r\nВанная* 3 кв.м.;\r\nСанузел* 1 кв.м.;\r\nПрихожая* 11 кв.м.;\r\nБалкон* 1 кв.м.;', 'входная металлическая дверь;\r\nмашинная штукатурка стен под чистовую отделку;\r\nлазерная стяжка пола; \r\nсчётчики на газ/воду/свет;\r\nдвухкамерный стеклопакет и подоконники;\r\nсантехническая разводка с точками входа;\r\nнастенные радиаторы отопления;\r\nгазовый итальянский котел (за доплату);', 0, '2018-01-15 15:40:45', '2018-03-16 15:52:42'),
(39, 'Власна 2-комнатная 70м', 12, 16, NULL, 'Большая 2-к квартира с собственным двориком. Выходит на две стороны. ', 'Помещение* Площадь;\r\nОбщая площадь* 70 кв.м.;\r\nКухня*12 кв.м.;\r\nСпальня*21 кв.м.;\r\nГостиная*20 кв.м.;\r\nПрихожая*11 кв.м.;\r\nСанузел*1 кв.м.;\r\nВанная*3 кв.м.;\r\nДворик*30 кв.м.;', 'входная металлическая дверь;\r\nмашинная штукатурка стен под чистовую отделку;\r\nлазерная стяжка пола; \r\nсчётчики на газ/воду/свет;\r\nдвухкамерный стеклопакет и подоконники;\r\nсантехническая разводка с точками входа;\r\nнастенные радиаторы отопления;\r\nгазовый итальянский котел (за доплату);', 0, '2018-01-17 10:52:09', '2018-03-16 15:52:07'),
(40, 'Власна 2-комнатная 58м', 12, 16, NULL, 'Альтернативный вариант 2-к квартиры с двориком, но поменьше метражом. Квартира очень светлая, двухсторонняя. ', 'Помещение* Площадь;\r\nОбщая площадь* 70 кв.м.;\r\nКухня* 11 кв.м.;\r\nСпальня* 12 кв.м.;\r\nГостиная* 21 кв.м.;\r\nПрихожая* 8 кв.м.;\r\nВанна* 4 кв.м.;\r\nДворик* 40 кв.м.;', 'входная металлическая дверь;\r\nмашинная штукатурка стен под чистовую отделку;\r\nлазерная стяжка пола; \r\nсчётчики на газ/воду/свет;\r\nдвухкамерный стеклопакет и подоконники;\r\nсантехническая разводка с точками входа;\r\nнастенные радиаторы отопления;\r\nгазовый итальянский котел (за доплату);', 0, '2018-01-17 10:55:25', '2018-03-16 15:47:43'),
(41, 'Власна 2-комнатная 59м', 12, 16, NULL, 'Собственный кусочек земли прямо у вашей квартиры. Безмерное наслаждение летними вечерами. Ставьте мангал, шезлонг, высаживайте цветы.', 'Помещение* Площадь;\r\nОбщая площадь* 59 кв.м.;\r\nКухня* 12 кв.м.;\r\nСпальня* 11 кв.м.;\r\nГостиная* 22 кв.м.; \r\nВанна* 3 кв.м.;\r\nСанузел* 1 кв.м.;\r\nПрихожая* 9 кв.м.;\r\nДворик* 35 кв.м.;', '', 1, '2018-01-17 10:57:06', '2018-03-16 15:41:39'),
(42, 'Власна 3-комнатная 77м', 12, 18, NULL, 'Для больших семей мы готовы предложить вариант просторной 3-к квартиры. Живите с комфортом, мы про это уже позаботились.', 'Помещение* Площадь;\r\nОбщая площадь* 77 кв.м.;\r\nКухня* 12 кв.м.;\r\nСпальная* 16 кв.м.;\r\nСпальная* 10 кв.м.;\r\nПрихожая* 10 кв.м.; \r\nБалкон* 1 кв.м.;\r\nСанузел* 1 кв.м.;\r\nВанная* 3 кв.м.;\r\nГостинная* 21 кв.м.;', 'входная металлическая дверь;\r\nмашинная штукатурка стен под чистовую отделку;\r\nлазерная стяжка пола; \r\nсчётчики на газ/воду/свет;\r\nдвухкамерный стеклопакет и подоконники;\r\nсантехническая разводка с точками входа;\r\nнастенные радиаторы отопления;\r\nгазовый итальянский котел (за доплату);', 0, '2018-01-17 11:01:16', '2018-03-16 15:49:58'),
(43, 'Власна 2-х уровневая 117м', 12, 17, NULL, 'Двухуровневая квартира с террасой.Общая площадь 117 кв.м. Расположена на 6-7 этаже дома.', 'Помещение* Площадь;\r\nОбщая площадь* 117 кв.м.;\r\nКухня* 10 кв.м.;\r\nГостиная* 18 кв.м.;\r\nПрихожая* 8 кв.м.;\r\nСанузел* 3 кв.м.;\r\nБалкон* 1 кв.м.;\r\nСпальная* 22 кв.м.;\r\nСпальная* 14 кв.м.;\r\nСанузел* 6 кв.м.;\r\nКоридор* 10 кв.м.;\r\nКабинет* 13 кв.м.;\r\nТерасса* 20 кв.м.;', '', 0, '2018-01-17 11:24:19', '2018-01-17 12:44:57'),
(44, 'Власна 2-х уровневая 123м', 12, 17, NULL, 'Двухуровневая квартира с террасой.Общая площадь 123 кв.м. Расположена на 6-7 этаже дома.', 'Помещение* Площадь;\r\nОбщая площадь* 123 кв.м.;\r\nКухня* 13 кв.м.; \r\nКладовая* 3 кв.м.;\r\nСанузел* 4 кв.м.;\r\nГостиная* 41 кв.м.;\r\nКабинет* 11 кв.м.;\r\nБалкон* 1 кв.м.;\r\nСпальная* 13 кв.м.;\r\nСпальная* 17 кв.м.; \r\nВанная* 5 кв.м.;\r\nКоридор* 9 кв.м.;\r\nТерраса* 20 кв.м.;', '', 0, '2018-01-17 11:30:14', '2018-01-17 12:44:17'),
(45, 'Власна 2-х уровневая 115м', 12, 17, NULL, 'Двухуровневая квартира с террасой.Общая площадь 115 кв.м. Расположена на 6-7 этаже дома.', 'Помещение* Площадь;\r\nОбщая площадь* 115 кв.м.;\r\nКухня* 6 кв.м.;\r\nСпальная* 13 кв.м.;\r\nГостиная* 15 кв.м.;\r\nСтоловая* 7 кв.м.; \r\nХолл* 8 кв.м.;\r\nСанузел* 4 кв.м.;\r\nПрихожая* 9 кв.м.; \r\nБалкон* 1 кв.м.;\r\nСпальная* 15 кв.м.;\r\nСпальная* 13 кв.м.;\r\nКоридор* 10 кв.м.; \r\nВанная* 5 кв.м.;\r\nТерраса* 20 кв.м.;', '', 0, '2018-01-17 11:35:26', '2018-01-17 12:43:52'),
(46, 'Власна 2-х уровневая 124м', 12, 17, NULL, 'Двухуровневая квартира с террасой.Общая площадь 124 кв.м. Расположена на 6-7 этаже дома.', 'Помещение* Площадь;\r\nОбщая площадь* 124 кв.м.;\r\nКухня* 7 кв.м.;\r\nГостиная* 16 кв.м.;\r\nСпальная* 13 кв.м.; \r\nХолл* 11 кв.м.;\r\nПрихожая* 7 кв.м.;\r\nСанузел* 3 кв.м.;\r\nБалкон* 1 кв.м.;\r\nКладовая* 2 кв.м.;\r\nСпальная* 16 кв.м.;\r\nСпальная* 13 кв.м.; \r\nВанная* 5 кв.м.;\r\nКоридор* 11 кв.м.;\r\nТерраса* 20 кв.м.;', '', 0, '2018-01-17 11:41:43', '2018-01-17 12:43:21'),
(47, 'Лион 1-комнатная 34,7м', 8, 7, NULL, 'Общая площадь: 34,7 кв.м.', 'Помещение* Площадь;\r\nКУХНЯ*	11,4 кв.м.;\r\nКОМНАТА* 16,5 кв.м.;\r\nПРИХОЖАЯ* 3,7 кв.м.;\r\nСАНУЗЕЛ* 3,1 кв.м.;', 'входная металлическая дверь;\r\nмашинная штукатурка стен под чистовую отделку;\r\nлазерная стяжка пола; \r\nсчётчики на газ/воду/свет;\r\nдвухкамерный стеклопакет и подоконники;\r\nсантехническая разводка с точками входа;\r\nнастенные радиаторы отопления;\r\nгазовый итальянский котел (за доплату);', 1, '2018-04-17 16:43:03', '2018-04-17 18:25:47'),
(48, 'Лион 1-комнатная 39,5м', 8, 7, NULL, 'Общая площадь: 39,5 кв.м.', 'Помещение* Площадь;\r\nКУХНЯ*	14,5 кв.м.;\r\nКОМНАТА* 17,1 кв.м.;\r\nПРИХОЖАЯ* 3,7 кв.м.;\r\nСАНУЗЕЛ* 4,1 кв.м.;', 'входная металлическая дверь;\r\nмашинная штукатурка стен под чистовую отделку;\r\nлазерная стяжка пола; \r\nсчётчики на газ/воду/свет;\r\nдвухкамерный стеклопакет и подоконники;\r\nсантехническая разводка с точками входа;\r\nнастенные радиаторы отопления;\r\nгазовый итальянский котел (за доплату);', 1, '2018-04-17 16:44:51', '2018-04-17 18:26:31'),
(49, 'Лион 1-комнатная 41м', 8, 7, NULL, 'Такие квартиры остались во 2-ой секции дома. Секция построена, идут фасадные работы. Стоимость квартиры 15 000 грн за кв.м.', 'Помещение* Площадь;\r\nОБЩАЯ ПЛОЩАДЬ* 41 кв.м.;\r\nКУХНЯ*	13,9 кв.м.;\r\nКОМНАТА* 18,9 кв.м.;\r\nПРИХОЖАЯ* 4,1 кв.м.;\r\nСАНУЗЕЛ* 4,1 кв.м.;', '', 0, '2018-04-17 16:46:23', '2018-04-17 18:31:04'),
(50, 'Лион 1-комнатная 43,6м', 8, 7, NULL, 'Квартира в построенной 3-ей секции дома. Остались только 6, 7, 8 этажи. Стоимость квартиры 15000 грн за кв.м. ', 'Помещение* Площадь;\r\nОБЩАЯ ПЛОЩАДЬ* 43,6 кв.м.\r\nКУХНЯ*	17,2 кв.м.;\r\nКОМНАТА* 17,6 кв.м.;\r\nПРИХОЖАЯ* 3,8 кв.м.;\r\nСАНУЗЕЛ* 3,1 кв.м.;\r\nБАЛКОН* 3,7 кв.м.;', '', 0, '2018-04-17 17:00:12', '2018-04-17 18:28:45'),
(51, 'Шатель - офис 50,8м', 11, 19, NULL, 'Возможна аренда помещения, ставка 20 уе/кв.м. Отдельный фасадный вход, свободная планировка. Высокий цокольный этаж. Состояние - после строителей. Есть окна 1х0,6м. Высота потолка - 2,6 м.', 'Помещение* Площадь;\r\nОБЩАЯ ПЛОЩАДЬ*50,8 кв.м.;', '', 0, '2018-05-22 11:52:13', '2018-05-22 12:51:59'),
(52, 'Шатель - офис 109,2м', 11, 19, NULL, 'Возможна аренда помещения, ставка 20 уе/кв.м. Отдельный фасадный вход, свободная планировка. Высокий цокольный этаж. Состояние - после строителей. Есть окна 1х0,6м. Высота потолка - 2,6 м.', 'Помещение* Площадь;\r\nОБЩАЯ ПЛОЩАДЬ*109,2 кв.м.;', '', 0, '2018-05-22 11:53:17', '2018-05-22 12:51:50'),
(53, 'Шатель - офис 75м', 11, 19, NULL, 'Возможна продажа помещения, 20000 грн/кв.м. Отдельный фасадный вход, свободная планировка. Высокий цокольный этаж. Состояние - после строителей. Есть окна 1х0,6м. Высота потолка - 2,6 м.', 'Помещение* Площадь;\r\nОБЩАЯ ПЛОЩАДЬ*75 кв.м.;', '', 0, '2018-05-22 11:54:13', '2018-05-22 12:51:41'),
(54, 'Шатель - офис 32м', 11, 19, NULL, 'Возможна аренда помещения, ставка 20 уе/кв.м или продажа - 20000 грн/кв.м. Отдельный вход, свободная планировка. Высокий цокольный этаж. Состояние - после строителей. Есть окна 1х0,6м. Высота потолка - 2,6 м.', 'Помещение* Площадь;\r\nОБЩАЯ ПЛОЩАДЬ*32 кв.м.;', '', 0, '2018-05-22 11:54:55', '2018-05-22 12:51:27'),
(55, 'Вилар 1-комнатная 35м', 14, 20, NULL, 'Самая доступная 1-к квартира классической планировки. Из кухни выход на застекленный балкон.', 'Помещение* Площадь;\r\nОБЩАЯ ПЛОЩАДЬ* 35 кв.м.;\r\nКУХНЯ*	9,8 кв.м.;\r\nКОМНАТА* 16,1 кв.м.;\r\nПРИХОЖАЯ* 4,5 кв.м.;\r\nСАНУЗЕЛ* 3,8 кв.м.;\r\nБАЛКОН* 4,7 кв.м.;', '', 0, '2018-05-31 12:43:10', '2018-06-02 10:12:44'),
(56, 'Вилар 1-комнатная 39м', 14, 20, NULL, 'Общая площадь: 39 кв.м.', 'Помещение* Площадь;\r\nОБЩАЯ ПЛОЩАДЬ* 39 кв.м.;\r\nКУХНЯ*	11,6 кв.м.;\r\nКОМНАТА* 18,3 кв.м.;\r\nПРИХОЖАЯ* 4,9 кв.м.;\r\nСАНУЗЕЛ* 3,8 кв.м.;\r\nБАЛКОН* 4,4 кв.м.;', '', 0, '2018-05-31 12:45:17', '2018-05-31 12:45:17'),
(57, 'Вилар 1-комнатная 43м', 14, 20, NULL, 'Общая площадь: 43 кв.м.', 'Помещение* Площадь;\r\nОБЩАЯ ПЛОЩАДЬ* 43 кв.м.;\r\nКУХНЯ*	14,2 кв.м.;\r\nКОМНАТА* 18,6 кв.м.;\r\nПРИХОЖАЯ* 4,4 кв.м.;\r\nСАНУЗЕЛ* 4,3 кв.м.;\r\nБАЛКОН* 4,7 кв.м.;', '', 0, '2018-05-31 12:47:03', '2018-05-31 12:47:03'),
(58, 'Вилар 1-комнатная 45м', 14, 20, NULL, 'Просторная 1-к квартира с выделенной спальной зоной. Все преимущества 2-к квартиры по цене 1-к. Кол-во квартир ограниченно. В спальне панорамное остекление с видом на холмы Ходосеевки.', 'Помещение* Площадь;\r\nОБЩАЯ ПЛОЩАДЬ* 45 кв.м.;\r\nКУХНЯ*	10,6 кв.м.;\r\nКОМНАТА* 21,9 кв.м.;\r\nПРИХОЖАЯ* 3,7 кв.м.;\r\nСАНУЗЕЛ* 3,9 кв.м.;\r\nБАЛКОН* 4,4 кв.м.;\r\nГАРДЕРОБ* 3,2 кв.м.;', '', 0, '2018-05-31 12:48:56', '2018-06-02 10:14:53'),
(59, 'Вилар 1-комнатная 49м', 14, 20, NULL, 'Просторная 1-к квартира с выделенной спальной зоной. Все преимущества 2-к квартиры по цене 1-к. Кол-во квартир ограниченно. В спальне панорамное остекление с видом на холмы Ходосеевки.', 'Помещение* Площадь;\r\nОБЩАЯ ПЛОЩАДЬ* 49 кв.м.;\r\nКУХНЯ*	11,3 кв.м.;\r\nКОМНАТА* 28 кв.м.;\r\nПРИХОЖАЯ* 4,4 кв.м.;\r\nСАНУЗЕЛ* 4 кв.м.;\r\nБАЛКОН* 4,3 кв.м.;', '', 0, '2018-05-31 12:50:49', '2018-06-02 10:14:16'),
(60, 'Вилар 2-комнатная 54м', 14, 21, NULL, 'Комфортная 2-к квартира самой популярной планировки с просторной спальней и уютной гостиной. ', 'Помещение* Площадь;\r\nОБЩАЯ ПЛОЩАДЬ* 54 кв.м.;\r\nКУХНЯ* 9,4 кв.м.;\r\nСПАЛЬНАЯ* 18,1 кв.м.;\r\nГОСТИНАЯ* 12,4 кв.м.;\r\nПРИХОЖАЯ* 7,6 кв.м.;\r\nСАНУЗЛЫ* 3,3 и 1,6 кв.м.;\r\nБАЛКОН* 4,4 кв.м.;', '', 0, '2018-05-31 12:55:08', '2018-06-02 10:50:44'),
(61, 'Вилар 2-комнатная 55м', 14, 21, NULL, 'Общая площадь: 55 кв.м.', 'Помещение* Площадь;\r\nОБЩАЯ ПЛОЩАДЬ* 55 кв.м.;\r\nКУХНЯ* 9 кв.м.;\r\nСПАЛЬНАЯ* 17,8 кв.м.;\r\nГОСТИНАЯ* 11,2 кв.м.;\r\nПРИХОЖАЯ* 7,6 кв.м.;\r\nСАНУЗЛЫ* 3 и 1,6 кв.м.;\r\nБАЛКОНЫ* 4,3 и 3,4 кв.м.;', '', 0, '2018-05-31 12:58:14', '2018-05-31 12:58:14'),
(62, 'Вилар 3-комнатная 89м', 14, 22, NULL, 'Просторная 3-к квартира общей площадью 89 кв.м. Окна выходят на две стороны, квартиры с улучшенным проветриванием. Есть балкон и лоджия. Два санузла - это очень удобно для семьи. Всего 9 квартир в доме. ', 'Помещение* Площадь;\r\nОБЩАЯ ПЛОЩАДЬ* 89 кв.м.;\r\nКУХНЯ* 12,6 кв.м.;\r\nСПАЛЬНИ* 19,5 и 19,5 кв.м.;\r\nГОСТИНАЯ* 12,4 кв.м.;\r\nПРИХОЖАЯ* 9,9 кв.м.;\r\nСАНУЗЛЫ* 2,6 и 3,5 кв.м.;\r\nБАЛКОНЫ* 4,3 и 4,4 кв.м.;\r\nГАРДЕРОБ* 5,6 кв.м.;', '', 0, '2018-05-31 13:02:48', '2018-06-02 10:54:01'),
(63, 'Вилар 1-комнатная 46м', 14, 20, NULL, 'Двухсторонняя 1-к квартира с улучшенным проветриванием за счет выхода окон на две стороны и повышенной инсоляцией (освещенностью). Рекомендуем для покупки молодым семьям.', 'Помещение* Площадь;\r\nОБЩАЯ ПЛОЩАДЬ* 46 кв.м.;\r\nКУХНЯ*	19,3 кв.м.;\r\nКОМНАТА* 18,1 кв.м.;\r\nПРИХОЖАЯ* 4 кв.м.;\r\nСАНУЗЕЛ* 3,8 кв.м.;\r\nБАЛКОН* 4,4 кв.м.;', '', 0, '2018-05-31 13:12:48', '2018-06-02 10:16:30');

-- --------------------------------------------------------

--
-- Структура таблиці `osc_sys_flats_layouts`
--

CREATE TABLE `osc_sys_flats_layouts` (
  `id` int(11) NOT NULL,
  `flat_id` int(11) NOT NULL DEFAULT '0',
  `filename` varchar(255) DEFAULT NULL,
  `block` int(11) NOT NULL DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `osc_sys_flats_layouts`
--

INSERT INTO `osc_sys_flats_layouts` (`id`, `flat_id`, `filename`, `block`, `created`, `modified`) VALUES
(14, 7, 'flyts_20180114153624813.jpg', 0, '2018-01-14 15:36:24', '2018-01-14 15:36:24'),
(16, 8, 'flyts_20180114220940538.png', 0, '2018-01-14 22:09:40', '2018-01-14 22:09:40'),
(17, 8, 'flyts_20180114221010377.jpg', 0, '2018-01-14 22:10:10', '2018-01-14 22:10:10'),
(18, 9, 'flyts_20180114221555619.jpg', 0, '2018-01-14 22:15:55', '2018-01-14 22:15:55'),
(19, 9, 'flyts_20180114221603279.jpg', 0, '2018-01-14 22:16:03', '2018-01-14 22:16:03'),
(20, 10, 'flyts_20180114223941316.jpg', 0, '2018-01-14 22:39:41', '2018-01-14 22:39:41'),
(21, 11, 'flyts_20180114224219546.png', 0, '2018-01-14 22:42:19', '2018-01-14 22:42:19'),
(22, 11, 'flyts_20180114224226416.jpg', 0, '2018-01-14 22:42:26', '2018-01-14 22:42:26'),
(23, 12, 'flyts_20180114230506359.png', 0, '2018-01-14 23:05:06', '2018-01-14 23:05:06'),
(24, 12, 'flyts_20180114230514351.jpg', 0, '2018-01-14 23:05:14', '2018-01-14 23:05:14'),
(25, 13, 'flyts_20180114232036429.png', 0, '2018-01-14 23:20:36', '2018-01-14 23:20:36'),
(26, 13, 'flyts_20180114232043499.jpg', 0, '2018-01-14 23:20:43', '2018-01-14 23:20:43'),
(27, 14, 'flyts_20180114232644343.png', 0, '2018-01-14 23:26:45', '2018-01-14 23:26:45'),
(28, 14, 'flyts_20180114232653584.jpg', 0, '2018-01-14 23:26:53', '2018-01-14 23:26:53'),
(29, 15, 'flyts_20180115002320141.jpg', 0, '2018-01-15 00:23:20', '2018-01-15 00:23:20'),
(30, 15, 'flyts_20180115002329223.jpg', 0, '2018-01-15 00:23:29', '2018-01-15 00:23:29'),
(31, 16, 'flyts_20180115002700452.jpg', 0, '2018-01-15 00:27:00', '2018-01-15 00:27:00'),
(32, 16, 'flyts_20180115002717397.jpg', 0, '2018-01-15 00:27:18', '2018-01-15 00:27:18'),
(33, 17, 'flyts_20180115002939547.jpg', 0, '2018-01-15 00:29:39', '2018-01-15 00:29:39'),
(34, 17, 'flyts_20180115002945211.jpg', 0, '2018-01-15 00:29:45', '2018-01-15 00:29:45'),
(35, 18, 'flyts_20180115003159613.jpg', 0, '2018-01-15 00:31:59', '2018-01-15 00:31:59'),
(36, 18, 'flyts_20180115003213691.jpg', 0, '2018-01-15 00:32:13', '2018-01-15 00:32:13'),
(37, 19, 'flyts_20180115003348754.jpg', 0, '2018-01-15 00:33:48', '2018-01-15 00:33:48'),
(38, 20, 'flyts_20180115003617355.jpg', 0, '2018-01-15 00:36:17', '2018-01-15 00:36:17'),
(39, 20, 'flyts_20180115003628543.jpg', 0, '2018-01-15 00:36:28', '2018-01-15 00:36:28'),
(40, 21, 'flyts_20180115110315539.jpg', 0, '2018-01-15 11:03:15', '2018-01-15 11:03:15'),
(41, 21, 'flyts_20180115110322766.jpg', 0, '2018-01-15 11:03:23', '2018-01-15 11:03:23'),
(42, 22, 'flyts_20180115110546330.jpg', 0, '2018-01-15 11:05:46', '2018-01-15 11:05:46'),
(43, 22, 'flyts_20180115110552892.jpg', 0, '2018-01-15 11:05:52', '2018-01-15 11:05:52'),
(44, 23, 'flyts_20180115110749226.jpg', 0, '2018-01-15 11:07:49', '2018-01-15 11:07:49'),
(45, 23, 'flyts_20180115110804583.jpg', 0, '2018-01-15 11:08:04', '2018-01-15 11:08:04'),
(46, 24, 'flyts_20180115111217388.jpg', 0, '2018-01-15 11:12:18', '2018-01-15 11:12:18'),
(47, 24, 'flyts_20180115111224176.jpg', 0, '2018-01-15 11:12:24', '2018-01-15 11:12:24'),
(48, 25, 'flyts_20180115111430574.jpg', 0, '2018-01-15 11:14:30', '2018-01-15 11:14:30'),
(49, 25, 'flyts_20180115111436717.jpg', 0, '2018-01-15 11:14:36', '2018-01-15 11:14:36'),
(50, 26, 'flyts_20180115112156764.jpg', 0, '2018-01-15 11:21:56', '2018-01-15 11:21:56'),
(51, 27, 'flyts_20180115112347312.jpg', 0, '2018-01-15 11:23:47', '2018-01-15 11:23:47'),
(52, 28, 'flyts_20180115112512115.jpg', 0, '2018-01-15 11:25:12', '2018-01-15 11:25:12'),
(53, 29, 'flyts_20180115112634164.jpg', 0, '2018-01-15 11:26:35', '2018-01-15 11:26:35'),
(54, 30, 'flyts_20180115114409796.jpg', 0, '2018-01-15 11:44:09', '2018-01-15 11:44:09'),
(55, 31, 'flyts_20180115114615403.jpg', 0, '2018-01-15 11:46:16', '2018-01-15 11:46:16'),
(56, 32, 'flyts_20180115114746306.jpg', 0, '2018-01-15 11:47:47', '2018-01-15 11:47:47'),
(57, 33, 'flyts_20180115122236946.jpg', 0, '2018-01-15 12:22:36', '2018-01-15 12:22:36'),
(58, 34, 'flyts_20180115123157105.jpg', 0, '2018-01-15 12:31:57', '2018-01-15 12:31:57'),
(59, 35, 'flyts_20180115153028472.jpg', 0, '2018-01-15 15:30:28', '2018-01-15 15:30:28'),
(60, 36, 'flyts_20180115153403913.jpg', 0, '2018-01-15 15:34:03', '2018-01-15 15:34:03'),
(61, 37, 'flyts_20180115153914961.jpg', 0, '2018-01-15 15:39:15', '2018-01-15 15:39:15'),
(62, 38, 'flyts_20180115154045304.jpg', 0, '2018-01-15 15:40:45', '2018-01-15 15:40:45'),
(63, 39, 'flyts_20180117105209542.jpg', 0, '2018-01-17 10:52:09', '2018-01-17 10:52:09'),
(64, 40, 'flyts_20180117105525703.jpg', 0, '2018-01-17 10:55:25', '2018-01-17 10:55:25'),
(65, 41, 'flyts_20180117105706332.jpg', 0, '2018-01-17 10:57:07', '2018-01-17 10:57:07'),
(66, 42, 'flyts_20180117110116215.jpg', 0, '2018-01-17 11:01:16', '2018-01-17 11:01:16'),
(67, 43, 'flyts_20180117112419463.jpg', 0, '2018-01-17 11:24:19', '2018-01-17 11:24:19'),
(68, 44, 'flyts_20180117113014512.jpg', 0, '2018-01-17 11:30:15', '2018-01-17 11:30:15'),
(69, 45, 'flyts_20180117113526920.jpg', 0, '2018-01-17 11:35:27', '2018-01-17 11:35:27'),
(70, 46, 'flyts_20180117114143929.jpg', 0, '2018-01-17 11:41:43', '2018-01-17 11:41:43'),
(71, 47, 'flyts_20180417164303483.jpg', 0, '2018-04-17 16:43:03', '2018-04-17 16:43:03'),
(72, 48, 'flyts_20180417164451702.jpg', 0, '2018-04-17 16:44:51', '2018-04-17 16:44:51'),
(73, 49, 'flyts_20180417164623183.jpg', 0, '2018-04-17 16:46:23', '2018-04-17 16:46:23'),
(74, 50, 'flyts_20180417170012530.jpg', 0, '2018-04-17 17:00:12', '2018-04-17 17:00:12'),
(75, 51, 'flyts_20180522115213937.jpg', 0, '2018-05-22 11:52:13', '2018-05-22 11:52:13'),
(76, 52, 'flyts_20180522115317286.jpg', 0, '2018-05-22 11:53:17', '2018-05-22 11:53:17'),
(77, 53, 'flyts_20180522115413869.jpg', 0, '2018-05-22 11:54:13', '2018-05-22 11:54:13'),
(78, 54, 'flyts_20180522115455402.jpg', 0, '2018-05-22 11:54:55', '2018-05-22 11:54:55'),
(79, 55, 'flyts_20180531124310331.jpg', 0, '2018-05-31 12:43:10', '2018-05-31 12:43:10'),
(80, 56, 'flyts_20180531124517156.jpg', 0, '2018-05-31 12:45:18', '2018-05-31 12:45:18'),
(81, 57, 'flyts_20180531124703702.jpg', 0, '2018-05-31 12:47:03', '2018-05-31 12:47:03'),
(82, 58, 'flyts_20180531124856512.jpg', 0, '2018-05-31 12:48:56', '2018-05-31 12:48:56'),
(83, 59, 'flyts_20180531125049845.jpg', 0, '2018-05-31 12:50:49', '2018-05-31 12:50:49'),
(84, 60, 'flyts_20180531125508246.jpg', 0, '2018-05-31 12:55:08', '2018-05-31 12:55:08'),
(85, 61, 'flyts_20180531125814924.jpg', 0, '2018-05-31 12:58:14', '2018-05-31 12:58:14'),
(86, 62, 'flyts_20180531130248478.jpg', 0, '2018-05-31 13:02:48', '2018-05-31 13:02:48'),
(87, 63, 'flyts_20180531131248532.jpg', 0, '2018-05-31 13:12:48', '2018-05-31 13:12:48');

-- --------------------------------------------------------

--
-- Структура таблиці `osc_sys_houses`
--

CREATE TABLE `osc_sys_houses` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `sub_name` varchar(255) DEFAULT NULL,
  `short_desc` varchar(255) DEFAULT NULL,
  `properties` text,
  `house_flat_col_caption` varchar(255) DEFAULT NULL,
  `house_flat_info` text,
  `progress` int(11) NOT NULL DEFAULT '0',
  `finish` datetime DEFAULT NULL,
  `mid_flats_area` varchar(255) DEFAULT NULL,
  `mid_flats_price` varchar(255) DEFAULT NULL,
  `block` int(11) DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_keys` varchar(255) DEFAULT NULL,
  `meta_desc` text,
  `modified` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `osc_sys_houses`
--

INSERT INTO `osc_sys_houses` (`id`, `name`, `alias`, `sub_name`, `short_desc`, `properties`, `house_flat_col_caption`, `house_flat_info`, `progress`, `finish`, `mid_flats_area`, `mid_flats_price`, `block`, `order_id`, `meta_title`, `meta_keys`, `meta_desc`, `modified`, `created`) VALUES
(8, 'Дом Лион', 'lion', 'Дом «Лион» - самый масштабный объект комплекса.', '9-ти этажный дом из 6-ти секций; сдача дома - 1, 2, 3 секции - 3 квартал 2018; 4, 5, 6 секции - 4 квартал 2018 г.', '9-ти этажный дом из 6-ти секций;\r\nблагоустроенный закрытый двор;\r\nквартиры с панорамным остеклением;\r\nохрана и видеонаблюдение 24/7;', 'Информация о доме', '<p><div>Дом девятиэтажный и состоит из шести секций, в каждой из которых будет лифт. </div><div>Особое внимание заслуживает двор дома - это уютное и живописное место со спортивными площадками, благоустройством и комфортабельными зонами отдыха для всех жителей дома.</div></p>\r\n', 70, '2018-11-14 00:00:00', '27-147', '', 0, 3, '', '', '', '2018-05-24 22:29:27', '2018-01-08 21:25:54'),
(11, 'Дом Шатель', 'shatel', 'Дом «Шатель» относится к домам клубного формата и состоит из двух секций.', 'Клубный 6-ти этажный дом; сдача дома - май 2018 года. ', '6-ти этажный дом клубного формата;\r\nавторские решения в благоустройстве зон отдыха; \r\nпредусмотрены колясочные и кладовки для жильцов;', 'Информация о доме', '<p></p><p>Дом шестиэтажный, с панорамным остеклением балконов и дополнительным утеплением фасада.</p><p>Для комфортного проживания в доме предусмотрены колясочные и комната вахтера. Во дворе дома будет закрытая территория для детей и занятий спортом.</p><p></p>\r\n', 98, '2018-05-15 00:00:00', '35-130', '', 1, 1, '', '', '', '2018-05-29 11:04:22', '2018-01-09 17:28:52'),
(12, 'Проект Vlasna', 'proekt-vlasna', 'Уникальная архитектура классического пригорода.', 'квартир с двориками и террасами; сдача 2 дома - 3 квартал 2018; 3, 4, 5 дом - 2 квартал 2019г.', '6-ти этажные дома;\r\nквартиры с двориками и террасами;\r\nсобственная набережная;\r\nзакрытый двор от автомобилей;\r\nозеленение по технике \"цветение круглый год\";', 'Информация о комплексе', '11 зданий <p></p><p>6 этажей с лифтом </p><p>Высота потолков в квартирах — 3 м </p><p><span Автономное=\"\" отопление=\"\" в=\"\" каждой=\"\" квартире <=\"\" span=\"\"></span></p><p><span Красный=\"\" кирпич <=\"\" span=\"\"></span></p><p>Детские игровые площадки </p><p>Зоны для тренировок и велодорожки </p><p><span Закрытая=\"\" территория <=\"\" span=\"\"></span></p><p>Собственная набережная </p><p>Зона барбекю для жителей</p><p>Отдельная парковка для всех жильцов</p><p><br></p>\r\n', 50, '2018-10-15 00:00:00', '38-124', '', 0, 2, '', '', '', '2018-05-24 22:24:55', '2018-01-12 14:10:20'),
(13, 'Дом Жива', 'dom-zhiva', 'Дом клубного формата \"Жива\"', '8 квартир, 4 этажа; квартиры по 115 кв.м.;', 'клубный дом на 8 квартир;\r\nпо 2 квартиры на этаже;\r\nквартиры с ремонтом и кухней;\r\nсобственная беседка с зоной барбекю для каждой квартиры;', '', '<p>Это жилой кирпичный дом с собственным бассейном и зоной барбекю. В доме всего 8 квартир, по 2 квартиры на этаже, каждая общей площадью 115м2. Благодаря функциональному зонированию, квартиры разделены на две части: первая - гостевая зона с уютной кухней, большим санузлом, просторной гостиной с камином и широкой лоджией, и вторая – личное пространство для детей и родителей - детская и спальня с вместительной гардеробной и санузлом. <br></p>\r\n', 98, '2018-05-22 00:00:00', '115', '', 0, 4, '', '', '', '2018-05-11 17:24:30', '2018-01-12 15:32:29'),
(14, 'Дом Вилар', 'dom-vilar', 'Дом «Вилар» - дом повышенной комфортности', '9-ти этажный дом из 4-х секций; сдача дома - 4 квартал 2019 г.', '9-ти этажный дом из 4-х секций;\r\nблагоустроенный закрытый двор;\r\nквартиры с панорамным остеклением;\r\nохрана и видеонаблюдение 24/7;', 'Информация о доме', '<p><div>Дом девятиэтажный и состоит из четырех секций, в каждой из которых будет лифт. </div><div>Особое внимание заслуживает двор дома - это уютное и живописное место со спортивными площадками, благоустройством и комфортабельными зонами отдыха для всех жителей дома.</div></p>', 5, '2019-12-31 00:00:00', '35-89', '12800', 0, 1, '', '', '', '2018-06-02 10:10:52', '2018-05-31 11:52:24');

-- --------------------------------------------------------

--
-- Структура таблиці `osc_sys_house_gal`
--

CREATE TABLE `osc_sys_house_gal` (
  `id` int(11) NOT NULL,
  `house_id` int(11) NOT NULL DEFAULT '0',
  `source` text,
  `type` int(11) NOT NULL DEFAULT '1',
  `orientation` int(11) NOT NULL DEFAULT '0',
  `block` int(11) NOT NULL DEFAULT '0',
  `caption` varchar(255) DEFAULT NULL,
  `sub_caption` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `osc_sys_house_gal`
--

INSERT INTO `osc_sys_house_gal` (`id`, `house_id`, `source`, `type`, `orientation`, `block`, `caption`, `sub_caption`, `created`, `modified`) VALUES
(6, 1, 'hgal_20180107192219349.jpg', 1, 0, 0, 'lorem', 'ipsum', '2018-01-07 19:22:19', '2018-01-07 19:22:19'),
(14, 5, 'hgal_20180107232946369.jpg', 1, 0, 0, NULL, NULL, '2018-01-07 23:29:47', '2018-01-07 23:29:47'),
(15, 5, 'hgal_20180107232946694.jpg', 1, 0, 0, NULL, NULL, '2018-01-07 23:29:47', '2018-01-07 23:29:47'),
(16, 5, 'hgal_20180107232947197.jpg', 1, 0, 0, 'Sobaka', 'zlaya', '2018-01-07 23:29:47', '2018-01-07 23:29:47'),
(17, 6, 'hgal_20180107233623865.jpg', 1, 0, 0, NULL, NULL, '2018-01-07 23:36:24', '2018-01-07 23:36:24'),
(18, 6, 'hgal_20180107233623174.jpg', 1, 0, 0, NULL, NULL, '2018-01-07 23:36:24', '2018-01-07 23:36:24'),
(19, 6, 'hgal_20180107233624761.jpg', 1, 0, 0, NULL, NULL, '2018-01-07 23:36:24', '2018-01-07 23:36:24'),
(20, 6, 'hgal_20180107233624367.jpg', 1, 0, 0, NULL, NULL, '2018-01-07 23:36:24', '2018-01-07 23:36:24'),
(31, 10, 'hgal_20180109164754100.jpg', 1, 0, 0, NULL, NULL, '2018-01-09 16:47:56', '2018-01-09 16:47:56'),
(32, 10, 'hgal_20180109164754323.jpg', 1, 0, 0, NULL, NULL, '2018-01-09 16:47:56', '2018-01-09 16:47:56'),
(33, 10, 'hgal_20180109164754764.jpg', 1, 0, 0, NULL, NULL, '2018-01-09 16:47:56', '2018-01-09 16:47:56'),
(34, 10, 'hgal_20180109164755473.jpg', 1, 0, 0, NULL, NULL, '2018-01-09 16:47:56', '2018-01-09 16:47:56'),
(35, 10, 'hgal_20180109164755631.jpg', 1, 0, 0, NULL, NULL, '2018-01-09 16:47:56', '2018-01-09 16:47:56'),
(36, 10, 'hgal_20180109164755988.jpg', 1, 0, 0, NULL, NULL, '2018-01-09 16:47:56', '2018-01-09 16:47:56'),
(38, 11, 'hgal_20180109172853741.jpg', 1, 0, 0, 'Уникальная архитектура', NULL, '2018-01-09 17:28:53', '2018-01-09 17:28:53'),
(44, 12, 'hgal_20180112141021325.jpg', 1, 0, 0, 'Квартиры с двориками', NULL, '2018-01-12 14:10:21', '2018-01-12 14:10:21'),
(47, 13, 'hgal_20180112153230729.jpg', 1, 0, 0, 'Зона отдыха для жильцов', NULL, '2018-01-12 15:32:30', '2018-01-12 15:32:30'),
(48, 13, 'hgal_20180112153230278.jpg', 1, 0, 0, 'Свой паркинг', NULL, '2018-01-12 15:32:30', '2018-01-12 15:32:30'),
(49, 13, 'hgal_20180112153230140.jpg', 1, 0, 0, 'В доме всего 8 квартир', NULL, '2018-01-12 15:32:30', '2018-01-12 15:32:30'),
(50, 13, 'hgal_20180112153230947.jpg', 1, 0, 0, 'Классический фасад и архитектура', NULL, '2018-01-12 15:32:30', '2018-01-12 15:32:30'),
(52, 11, 'hgal_20180114113418886.jpg', 1, 0, 0, 'Детские площадки', NULL, '2018-01-14 11:34:19', '2018-01-14 11:34:19'),
(53, 11, 'hgal_20180114113624336.jpg', 1, 0, 0, 'Озеленение по технике \"цветение круглый год\"', NULL, '2018-01-14 11:36:24', '2018-01-14 11:36:24'),
(54, 11, 'hgal_20180114113747153.jpg', 1, 0, 0, 'Панорамное остекление квартир', NULL, '2018-01-14 11:37:47', '2018-01-14 11:37:47'),
(55, 12, 'hgal_20180114114037684.jpg', 1, 0, 0, 'Своя набережная', NULL, '2018-01-14 11:40:37', '2018-01-14 11:40:37'),
(56, 12, 'hgal_20180117175033904.jpg', 1, 0, 0, 'Двор комплекса', NULL, '2018-01-17 17:50:33', '2018-01-17 17:50:33'),
(57, 12, 'hgal_20180117175051869.jpg', 1, 0, 0, 'Вид на ЖК с высоты', NULL, '2018-01-17 17:50:51', '2018-01-17 17:50:51'),
(58, 11, 'hgal_20180122212910194.jpg', 1, 0, 0, 'Подъезды и лестницы', NULL, '2018-01-22 21:29:10', '2018-01-22 21:29:10'),
(59, 12, 'hgal_20180122213317576.jpg', 1, 0, 0, 'Лестницы и коридоры', NULL, '2018-01-22 21:33:17', '2018-01-22 21:33:17'),
(68, 8, 'hgal_20180125151713387.jpg', 1, 0, 0, 'Ландшафтный дизайн', NULL, '2018-01-25 15:17:13', '2018-01-25 15:17:13'),
(69, 8, 'hgal_20180125151731111.jpg', 1, 0, 0, 'Озеленение двора', NULL, '2018-01-25 15:17:31', '2018-01-25 15:17:31'),
(72, 8, 'hgal_20180126114138844.jpg', 1, 0, 0, 'Спортивные площадки', NULL, '2018-01-26 11:41:38', '2018-01-26 11:41:38'),
(73, 8, 'hgal_20180126114159527.jpg', 1, 0, 0, 'Благоустроенные дворы', NULL, '2018-01-26 11:42:00', '2018-01-26 11:42:00');

-- --------------------------------------------------------

--
-- Структура таблиці `osc_sys_house_slides`
--

CREATE TABLE `osc_sys_house_slides` (
  `id` int(11) NOT NULL,
  `house_id` int(11) NOT NULL DEFAULT '0',
  `source` text,
  `type` int(11) NOT NULL DEFAULT '1',
  `block` int(11) NOT NULL DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `osc_sys_house_slides`
--

INSERT INTO `osc_sys_house_slides` (`id`, `house_id`, `source`, `type`, `block`, `created`, `modified`) VALUES
(3, 1, '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/FBnAZnfNB6U\" frameborder=\"0\" gesture=\"media\" allow=\"encrypted-media\" allowfullscreen></iframe>', 2, 0, '2017-12-30 00:00:00', '2017-12-30 00:00:00'),
(5, 2, '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/FBnAZnfNB6U\" frameborder=\"0\" gesture=\"media\" allow=\"encrypted-media\" allowfullscreen></iframe>', 2, 0, '2018-01-07 19:15:23', '2018-01-07 19:15:23'),
(6, 2, '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/FBnAZnfNB6U\" frameborder=\"0\" gesture=\"media\" allow=\"encrypted-media\" allowfullscreen></iframe>', 3, 0, '2018-01-07 19:16:10', '2018-01-07 19:16:10'),
(7, 1, 'hsld_20180107192228215.jpg', 1, 0, '2018-01-07 19:22:28', '2018-01-07 19:22:28'),
(20, 5, 'hsld_20180107232933880.jpg', 1, 0, '2018-01-07 23:29:33', '2018-01-07 23:29:33'),
(21, 5, 'hsld_20180107232933973.jpg', 1, 0, '2018-01-07 23:29:33', '2018-01-07 23:29:33'),
(22, 6, 'hsld_20180107233623727.jpg', 1, 0, '2018-01-07 23:36:23', '2018-01-07 23:36:23'),
(23, 6, 'hsld_20180107233623910.jpg', 1, 0, '2018-01-07 23:36:23', '2018-01-07 23:36:23'),
(24, 6, '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/dt1yv7csB5o\" frameborder=\"0\" gesture=\"media\" allow=\"encrypted-media\" allowfullscreen></iframe>', 2, 0, '2018-01-07 23:36:24', '2018-01-07 23:36:24'),
(25, 6, '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/dt1yv7csB5o\" frameborder=\"0\" gesture=\"media\" allow=\"encrypted-media\" allowfullscreen></iframe>', 3, 0, '2018-01-07 23:36:24', '2018-01-07 23:36:24'),
(26, 2, 'hsld_20180108183232298.jpg', 1, 0, '2018-01-08 18:32:32', '2018-01-08 18:32:32'),
(27, 2, 'hsld_20180108183232756.jpg', 1, 0, '2018-01-08 18:32:32', '2018-01-08 18:32:32'),
(45, 10, 'hsld_20180109164754895.jpg', 1, 0, '2018-01-09 16:47:54', '2018-01-09 16:47:54'),
(52, 11, 'hsld_20180112144630541.jpg', 1, 0, '2018-01-12 14:46:30', '2018-01-12 14:46:30'),
(53, 13, 'hsld_20180112153229767.jpg', 1, 0, '2018-01-12 15:32:30', '2018-01-12 15:32:30'),
(54, 13, 'hsld_20180112153229201.jpg', 1, 0, '2018-01-12 15:32:30', '2018-01-12 15:32:30'),
(55, 13, 'hsld_20180112153229660.jpg', 1, 0, '2018-01-12 15:32:30', '2018-01-12 15:32:30'),
(57, 12, 'hsld_20180114111239453.jpg', 1, 0, '2018-01-14 11:12:39', '2018-01-14 11:12:39'),
(59, 11, 'hsld_20180114121354339.jpg', 1, 0, '2018-01-14 12:13:54', '2018-01-14 12:13:54'),
(61, 11, 'hsld_20180116124606367.jpg', 1, 0, '2018-01-16 12:46:06', '2018-01-16 12:46:06'),
(62, 12, 'hsld_20180117175012496.jpg', 1, 0, '2018-01-17 17:50:12', '2018-01-17 17:50:12'),
(63, 12, 'hsld_20180117175023599.jpg', 1, 0, '2018-01-17 17:50:24', '2018-01-17 17:50:24'),
(64, 12, 'hsld_20180117175042272.jpg', 1, 0, '2018-01-17 17:50:42', '2018-01-17 17:50:42'),
(66, 11, 'hsld_20180122212910741.jpg', 1, 0, '2018-01-22 21:29:10', '2018-01-22 21:29:10'),
(67, 12, 'hsld_20180122213317629.jpg', 1, 0, '2018-01-22 21:33:17', '2018-01-22 21:33:17'),
(74, 8, 'hsld_20180125142843108.jpg', 1, 0, '2018-01-25 14:28:43', '2018-01-25 14:28:43'),
(78, 8, 'hsld_20180524222728134.jpg', 1, 0, '2018-05-24 22:27:28', '2018-05-24 22:27:28'),
(80, 8, 'hsld_20180524222807115.jpg', 1, 0, '2018-05-24 22:28:07', '2018-05-24 22:28:07'),
(82, 14, 'hsld_20180531115224402.jpg', 1, 0, '2018-05-31 11:52:24', '2018-05-31 11:52:24'),
(83, 14, 'hsld_20180531115224820.jpg', 1, 0, '2018-05-31 11:52:24', '2018-05-31 11:52:24');

-- --------------------------------------------------------

--
-- Структура таблиці `osc_sys_manager`
--

CREATE TABLE `osc_sys_manager` (
  `id` int(11) NOT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `details` text,
  `photo` varchar(255) DEFAULT NULL,
  `block` int(11) NOT NULL DEFAULT '0',
  `viber` int(11) NOT NULL DEFAULT '1',
  `telegram` int(11) NOT NULL DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `osc_sys_manager`
--

INSERT INTO `osc_sys_manager` (`id`, `caption`, `phone`, `details`, `photo`, `block`, `viber`, `telegram`, `created`, `modified`) VALUES
(1, 'Ваш менеджер Ольга Поляченко', '(067)825-50-18', 'Проведу экскурсию, покажу квартиры. Отвечу на вопросы и вы убедитесь в том, что здесь все так, как написано.', 'mng_20180110023329979.png', 0, 0, 0, '2018-01-01 00:00:00', '2018-01-16 13:24:01');

-- --------------------------------------------------------

--
-- Структура таблиці `osc_sys_manager_menu`
--

CREATE TABLE `osc_sys_manager_menu` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `block` int(11) NOT NULL DEFAULT '0',
  `target` int(11) NOT NULL DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `osc_sys_manager_menu`
--

INSERT INTO `osc_sys_manager_menu` (`id`, `name`, `link`, `block`, `target`, `created`, `modified`) VALUES
(1, 'Клубные карты', '3123', 1, 0, '2018-01-01 00:00:00', '2018-01-14 11:52:11'),
(2, 'О застройщике', 'http://localhost/nkz_new/about/', 1, 0, '2018-01-01 00:00:00', '2018-01-14 11:52:18'),
(3, 'Рассрочка', 'http://localhost/nkz_new/flats/lion/r1/', 1, 0, '2018-01-01 00:00:00', '2018-05-10 09:11:56'),
(4, 'Инфраструктура', 'http://localhost/nkz_new/flats/lion/r1/', 1, 0, '2018-01-01 00:00:00', '2018-01-14 11:52:29');

-- --------------------------------------------------------

--
-- Структура таблиці `osc_sys_projects`
--

CREATE TABLE `osc_sys_projects` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `features` text,
  `link` varchar(255) DEFAULT NULL,
  `order_id` int(11) NOT NULL DEFAULT '0',
  `target` int(11) NOT NULL DEFAULT '0',
  `block` int(11) NOT NULL DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `osc_sys_projects`
--

INSERT INTO `osc_sys_projects` (`id`, `name`, `alias`, `location`, `logo`, `source`, `features`, `link`, `order_id`, `target`, `block`, `created`, `modified`) VALUES
(1, 'Гнатовский', 'gnatovsky', 'Киевская обл., c. Гнатовка, ул. Старожитомирская, 68', 'prgl_20180114125006928.jpg', 'prgi_20180111155431899.jpeg', 'Начало строительства: 4-й кв. 2012 года;\r\n15 мин. автомобилем от Окружной дороги;\r\nИнфраструктура: детская площадка, зона семейного отдыха и барбекю, спортивная площадка для активного отдыха;\r\nсупермаркет\r\n', '', 6, 0, 0, '2018-01-02 00:00:00', '2018-01-14 12:50:06'),
(2, 'Спутник-Белогородка', 'sputnik-belogorodka', 'Киевская область, с.Белогородка, ул.Зоряная, 27-29', '2.jpg', 'prgi_20180111155938805.jpg', 'ЖК «Спутник-Белогородка» отличается оптимальными и удобными планировочными решениями. Поэтому, благодаря разумной цене, покупка квартир может быть доступна и для молодых покупателей, приобретающих свою первую квартиру, и для людей старшего возраста.', '', 5, 0, 0, '2018-01-02 00:00:00', '2018-01-14 12:27:55'),
(3, 'Перша житлова', 'persha-zhitlova', 'Киевская обл., с. Гатное, с.Ходосовка', '3.jpg', 'prgi_20180111160208369.jpg', 'Начало строительства: 4-й кв. 2016 года;\r\nПроект реализуется в двух направлениях пригорода – Обуховском и Одесском;\r\nСмарт-квартиры – специально разработанные планировки для максимально эффективного использования площади;\r\nПозиционирование: первое доступное жилье для молодых людей до 27 лет;', '', 3, 0, 1, '2018-01-02 00:00:00', '2018-01-17 17:24:25'),
(4, 'Vlasna', 'vlasna', 'Киевская обл., с. Ходосеевка', '4.jpg', 'prgi_20180111160419536.jpg', 'уникальные форматы квартир с двориками и террасами;\r\nзакрытая территория и въезд по пропускам;', 'https://vlasna.n-k-z.com/', 2, 0, 0, '2018-01-02 00:00:00', '2018-03-15 12:57:47'),
(5, 'Санленд', 'sanlend', 'Киевская обл., с.Софиевская Борщаговка, ул. Звездная, 13', '5.jpg', 'prgi_20180111160718642.jpeg', 'Начало строительства: 2015 года;\r\nПроект включает в себя двухэтажный дом клубного типа на 10 двухуровневых квартир и таунхаусы;\r\nВсе объекты находятся в экологически чистых локациях пригорода с удобными транспортными развязками и всей необходимой инфраструктурой;', '', 4, 0, 1, '2018-01-02 00:00:00', '2018-01-17 17:24:15'),
(6, 'Теремки', 'teremky', 'Киевская обл., с. Гатное, ул.Институтская, 45', '6.jpg', 'prgi_20180111160959245.jpg', 'Начало строительства: 3-й кв. 2013 года;\r\n400 м от Киева;\r\nрядом фитнес-клуб Sportlife;\r\n4-х и 6-ти этажные дома;', '', 1, 0, 1, '2018-01-02 00:00:00', '2018-01-17 17:25:14');

-- --------------------------------------------------------

--
-- Структура таблиці `osc_sys_rooms`
--

CREATE TABLE `osc_sys_rooms` (
  `id` int(11) NOT NULL,
  `house_id` int(11) DEFAULT NULL,
  `order_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `short_name` varchar(255) DEFAULT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `alias` varchar(255) NOT NULL,
  `block` int(11) NOT NULL DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `osc_sys_rooms`
--

INSERT INTO `osc_sys_rooms` (`id`, `house_id`, `order_id`, `name`, `short_name`, `caption`, `alias`, `block`, `created`, `modified`) VALUES
(7, 8, 1, 'Лион - 1к', '1', '1 - комнатные квартиры', 'r1', 0, '2018-01-08 21:27:16', '2018-01-08 21:27:16'),
(8, 8, 2, 'Лион - 2к', '2', '2 - комнатные квартиры', 'r2', 0, '2018-01-14 15:28:19', '2018-01-14 15:28:19'),
(9, 8, 3, 'Лион - Двухуровневые', '2-х уровневые', '2-х уровневые', 'rn', 0, '2018-01-14 15:29:01', '2018-01-15 11:28:53'),
(10, 11, 1, 'Шатель - 1к', '1', '1 - комнатные квартиры', 'r1', 0, '2018-01-15 10:56:57', '2018-01-15 10:56:57'),
(11, 11, 2, 'Шатель - 2к', '2', '2 - комнатные квартиры', 'r2', 0, '2018-01-15 10:57:33', '2018-01-15 10:57:33'),
(12, 11, 3, 'Шатель - Двухуровневые', '2-х уровневые', '2-х уровневые', 'rn', 0, '2018-01-15 10:58:03', '2018-01-15 14:08:17'),
(13, 13, 1, 'Дом Жива - 3к', '3', '3 - комнатные квартиры', 'r3', 0, '2018-01-15 12:03:13', '2018-03-15 10:23:34'),
(14, 13, 2, 'Дом Жива - Двухуровневая', '2-х уровневые', '2-х уровневая', 'rn', 0, '2018-01-15 12:08:17', '2018-01-17 14:47:53'),
(15, 12, 1, 'Власна - 1к', '1', '1 - комнатные квартиры', 'r1', 0, '2018-01-15 15:17:11', '2018-01-15 15:17:11'),
(16, 12, 2, 'Власна - 2к', '2', '2 - комнатные квартиры', 'r2', 0, '2018-01-15 15:17:48', '2018-01-15 15:17:48'),
(17, 12, 5, 'Власна - Двухуровневые', '2-х уровневые', '2-х уровневые', 'rn', 0, '2018-01-15 15:19:16', '2018-01-15 15:42:34'),
(18, 12, 3, 'Власна - 3к', '3', '3 - комнатные квартиры', 'r3', 0, '2018-01-15 15:20:06', '2018-01-15 15:42:48'),
(19, 11, 4, 'Шатель - Коммерческая недвижимость', 'Коммерческая недвижимость', 'Коммерческая недвижимость', 'com', 0, '2018-05-21 18:08:52', '2018-05-22 11:50:14'),
(20, 14, 1, 'Вилар - 1к', '1', '1 - комнатные квартиры', 'r1', 0, '2018-05-31 11:55:47', '2018-05-31 11:55:47'),
(21, 14, 2, 'Вилар - 2к', '2', '2 - комнатные квартиры', 'r2', 0, '2018-05-31 11:56:22', '2018-05-31 11:56:22'),
(22, 14, 3, 'Вилар - 3к', '3', '3 - комнатные квартиры', 'r3', 0, '2018-05-31 11:56:47', '2018-05-31 11:56:47');

-- --------------------------------------------------------

--
-- Структура таблиці `osc_tables_info`
--

CREATE TABLE `osc_tables_info` (
  `id` int(11) NOT NULL,
  `table_name` varchar(255) NOT NULL DEFAULT '0',
  `details` text NOT NULL,
  `fields` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `osc_tables_info`
--

INSERT INTO `osc_tables_info` (`id`, `table_name`, `details`, `fields`) VALUES
(1, 'a_test', 'Тест.', ''),
(2, 'next_admin_menu_app_ref', 'Связи пунктов меню и приложений в админке.\nСвязные таблицы: admin_menu <-> admin_applications.', ''),
(3, 'next_tables_info', 'Описания всех таблиц.', ''),
(4, 'next_admin_head_sections', 'Секции в шапке админки, которые хранят наборы событий для отдельных страниц управления контентом.', ''),
(5, 'next_admin_action_js_ref', 'Связи js функций и событий - иконок в секциях шапки админки.\nСвязные таблицы: admin_js_functions <-> admin_head_section_items.', ''),
(6, 'next_admin_app_hs_item_ref', 'Связи приложений с иконками из секций событий в шапке админки.\nСвязные таблицы: admin_applications <-> admin_head_section_items.', ''),
(7, 'next_admin_applications', 'Приложения в админке.', ''),
(8, 'next_admin_applications_groups', 'Группы приложений в админке.', ''),
(9, 'next_admin_head_section_items', 'Иконки событий, с указанием секции в шапке админки.', ''),
(10, 'next_admin_js_functions', 'JS Функции с описанием самой функции для админки.', ''),
(11, 'next_admin_menu', 'Главное меню в админке.', ''),
(12, 'next_admin_tmp', 'Буфер для временной записи результатов работы ajax страниц в админке.', ''),
(14, 'next_app_access', 'Уровни доступа для администраторов системы, хранятся в поле apps_list в виде массива serialize.', ''),
(15, 'next_applications', 'Приложения для сайта.', ''),
(16, 'next_applications_groups', 'Группы приложений для сайта.', ''),
(17, 'next_art_cat_ref', 'Связи статей и категорий на сайте. \nСвязные таблицы: categoties <-> articles.', ''),
(18, 'next_art_menu_ref', 'Связи статей и пунктов меню на сайте. \nСвязные таблицы: articles <-> menu.', ''),
(19, 'next_articles', 'Статьи на сайте.', ''),
(20, 'next_categories', 'Категории статей на сайте.', ''),
(21, 'next_config', 'Настройки сайта.', ''),
(22, 'next_copy_history', 'Буфер. История копирования строчек в таблицах администратором для понимания системой - какой номер указать следующей копии с одинаковым названием.', ''),
(23, 'next_db_structure', 'Структура Базы Данных.', ''),
(24, 'next_menu', 'Главное меню на сайте.', ''),
(25, 'next_menu_assignes', 'Назначения пунктов меню на сайте.', ''),
(26, 'next_menu_types', 'Типы меню на сайте. К примеру основное, в футере, горизонтальное, вертикальное и т.д.', ''),
(27, 'next_message_statuses', 'Статусы сообщений в админке. К примеру: прочитано, не прочитано, выполнено.', ''),
(28, 'next_message_types', 'Типы сообщений в админке. К примеру: задание, уведомление, тикет.', ''),
(29, 'next_product_photos', 'ИМ. Фото файлы к продукции.', ''),
(30, 'next_shop_cat_prod_ref', 'ИМ. Связи категорий и продукции. \nСвязные таблицы: shop_catalog <-> shop_products.', ''),
(31, 'next_shop_catalog', 'ИМ. Каталог продукции.', ''),
(32, 'next_shop_orders', 'ИМ. Заказы.', ''),
(33, 'next_shop_prod_group_ref', 'ИМ. Связи продукции и групп товаров. К примеру: акционные, новинки. \nСвязные таблицы: shop_products <-> shop_products_groups.', ''),
(34, 'next_shop_products', 'ИМ. Продукция.', ''),
(35, 'next_shop_products_groups', 'ИМ. Группы товаров. К примеру: акционные, новинки.', ''),
(36, 'next_shop_products_shelf_ref', 'ИМ. Связи продукции и ячеек на складе. \nСвязные таблицы: shop_products <-> stock_fields.', ''),
(40, 'next_stock_fields', 'Склад. Складские ячейки.', ''),
(41, 'next_stock_order_products', 'Склад. Продукция из заявки. \nСвязные таблицы: stock_orders.', ''),
(42, 'next_stock_orders', 'Склад. Заявки на поступление продукции.', ''),
(43, 'next_stocks', 'Склады.', ''),
(44, 'next_total_config', 'Глобальные настройки в админке.', ''),
(46, 'next_user_ef_ref', 'Связи пользователей и дополнительных полей. \nСвязные таблицы: shop_users <-> users_extra_fields.', ''),
(47, 'next_user_extra_fields', 'Дополнительные поля для пользователей.', ''),
(48, 'next_users', 'Пользователи системы.', ''),
(49, 'next_users_chat', 'Переписка между пользователями системы.', ''),
(50, 'next_users_ef_group_ref', 'Связи дополнительных полей пользователей и групп. К примеру: группа Паспортные данные. \nСвязные таблицы: users_extra_fields_groups <-> users_extra_fields.', ''),
(51, 'next_users_extra_fields_groups', 'Группы дополнительных полей пользователей. К примеру: Домашний адрес.', ''),
(52, 'next_users_types', 'Типы пользователей. Например: Презентант.', ''),
(53, 'next_users_types_extra_field_ref', 'Связи групп дополнительных полей пользователей и групп пользователей. К примеру: группа Паспортные данные - Салон. \nСвязные таблицы: users_types <-> users_extra_fields_groups.', ''),
(54, 'next_shop_chars_groups', 'Без описания.', ''),
(55, 'next_shop_chars', 'Без описания.', ''),
(56, 'next_shop_cat_chars_group_ref', 'Без описания.', ''),
(57, 'next_shop_product_chars_ref', 'Без описания.', ''),
(58, 'next_content_blocks', 'Контент блоки на сайте.', ''),
(59, 'next_banners', 'Без описания.', ''),
(61, 'next_site_positions', 'Без описания.', ''),
(62, 'next_files_ref', 'Без описания.', ''),
(63, 'next_template_pages', 'Без описания.', ''),
(64, 'next_template_blocks', 'Без описания.', ''),
(65, 'next_template_page_block_ref', 'Без описания.', ''),
(66, 'next_user_type_access', 'Без описания.', ''),
(67, 'next_users_dialogs', 'Без описания.', ''),
(68, 'next_dialog_files_ref', 'Без описания.', ''),
(69, 'next_faq', 'Без описания.', ''),
(70, 'next_tasks', 'Без описания.', ''),
(71, 'next_task_admin_ref', 'Без описания.', ''),
(72, 'next_shop_char_types', 'Без описания.', ''),
(73, 'page_types', 'Без описания.', ''),
(74, 'next_page_types', 'Без описания.', ''),
(75, 'shop_chars_prod_ref', 'Без описания.', ''),
(76, 'next_shop_chars_prod_ref', 'Без описания.', ''),
(77, 'next_shop_cart', 'Без описания.', ''),
(78, 'next_shop_payment_methods', 'Без описания.', ''),
(79, 'next_shop_delivery_methods', 'Без описания.', ''),
(80, 'next_shop_order_statuses', 'Без описания.', ''),
(81, 'next_shop_settings', 'Без описания.', ''),
(82, 'next_forgot_password_hash', 'Без описания.', ''),
(83, 'liqpay_log', 'Без описания.', ''),
(84, 'faq', 'Без описания.', ''),
(85, 'next_docs_ref', 'Содержит связи между таблицами объектов и документами', ''),
(86, 'next_shop_product_comments', 'Без описания.', ''),
(87, 'banners', 'Без описания.', ''),
(88, 'banners_code', 'Без описания.', ''),
(89, 'banners_pict', 'Без описания.', ''),
(90, 'categories', 'Без описания.', ''),
(91, 'clients', 'Без описания.', ''),
(92, 'content_images', 'Без описания.', ''),
(93, 'actions', 'Без описания.', ''),
(94, 'doc_groups', 'Без описания.', ''),
(95, 'documents', 'Без описания.', ''),
(96, 'osc_admin_action_js_ref', 'Без описания.', ''),
(97, 'osc_admin_app_hs_item_ref', 'Без описания.', ''),
(98, 'osc_admin_applications', 'Без описания.', ''),
(99, 'osc_admin_applications_groups', 'Без описания.', ''),
(100, 'osc_admin_head_section_items', 'Без описания.', ''),
(101, 'osc_admin_head_sections', 'Без описания.', ''),
(102, 'osc_admin_js_functions', 'Без описания.', ''),
(103, 'osc_admin_menu', 'Без описания.', ''),
(104, 'osc_admin_menu_app_ref', 'Без описания.', ''),
(105, 'osc_admin_tmp', 'Без описания.', ''),
(106, 'osc_app_access', 'Без описания.', ''),
(107, 'osc_applications', 'Без описания.', ''),
(108, 'osc_art_cat_ref', 'Без описания.', ''),
(109, 'osc_applications_groups', 'Без описания.', ''),
(110, 'osc_art_menu_ref', 'Без описания.', ''),
(111, 'osc_article_comments', 'Без описания.', ''),
(112, 'osc_articles', 'Без описания.', ''),
(113, 'osc_banners', 'Без описания.', ''),
(114, 'osc_categories', 'Без описания.', ''),
(115, 'osc_config', 'Без описания.', ''),
(116, 'osc_content_blocks', 'Без описания.', ''),
(117, 'osc_copy_history', 'Без описания.', ''),
(118, 'osc_db_structure', 'Без описания.', ''),
(119, 'osc_dialog_files_ref', 'Без описания.', ''),
(120, 'osc_docs_ref', 'Без описания.', ''),
(121, 'osc_faq', 'Без описания.', ''),
(122, 'osc_files_ref', 'Без описания.', ''),
(123, 'osc_forgot_password_hash', 'Без описания.', ''),
(124, 'osc_galleries', 'Без описания.', ''),
(125, 'osc_income_questions', 'Без описания.', ''),
(126, 'osc_languages', 'Без описания.', ''),
(127, 'osc_menu', 'Без описания.', ''),
(128, 'osc_menu_assignes', 'Без описания.', ''),
(129, 'osc_menu_formats', 'Без описания.', ''),
(130, 'osc_menu_types', 'Без описания.', ''),
(131, 'osc_message_statuses', 'Без описания.', ''),
(132, 'osc_message_types', 'Без описания.', ''),
(133, 'osc_page_types', 'Без описания.', ''),
(134, 'osc_product_photos', 'Без описания.', ''),
(135, 'osc_site_languages', 'Без описания.', ''),
(136, 'osc_site_positions', 'Без описания.', ''),
(137, 'osc_stock_fields', 'Без описания.', ''),
(138, 'osc_stock_order_products', 'Без описания.', ''),
(139, 'osc_stock_orders', 'Без описания.', ''),
(140, 'osc_stocks', 'Без описания.', ''),
(141, 'osc_tables_info', 'Без описания.', ''),
(142, 'osc_task_admin_ref', 'Без описания.', ''),
(143, 'osc_tasks', 'Без описания.', ''),
(144, 'osc_template_blocks', 'Без описания.', ''),
(145, 'osc_template_page_block_ref', 'Без описания.', ''),
(146, 'osc_template_pages', 'Без описания.', ''),
(147, 'osc_total_config', 'Без описания.', ''),
(148, 'osc_translate', 'Без описания.', ''),
(149, 'osc_user_ef_ref', 'Без описания.', ''),
(150, 'osc_user_extra_fields', 'Без описания.', ''),
(151, 'osc_user_type_access', 'Без описания.', ''),
(152, 'osc_users', 'Без описания.', ''),
(153, 'osc_users_chat', 'Без описания.', ''),
(154, 'osc_users_dialogs', 'Без описания.', ''),
(155, 'osc_users_ef_group_ref', 'Без описания.', ''),
(156, 'osc_users_extra_fields_groups', 'Без описания.', ''),
(157, 'osc_users_types', 'Без описания.', ''),
(158, 'osc_users_types_extra_field_ref', 'Без описания.', ''),
(159, 'projects', 'Без описания.', '');

-- --------------------------------------------------------

--
-- Структура таблиці `osc_tasks`
--

CREATE TABLE `osc_tasks` (
  `id` int(11) NOT NULL,
  `type` int(2) NOT NULL DEFAULT '1',
  `stock_order_id` int(11) NOT NULL DEFAULT '0',
  `status` int(1) NOT NULL DEFAULT '0',
  `subject` varchar(255) NOT NULL DEFAULT ' No subject',
  `comment` text NOT NULL,
  `date_finish` datetime NOT NULL,
  `dateCreate` datetime NOT NULL,
  `dateModify` datetime NOT NULL,
  `adminMod` int(7) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблиці `osc_task_admin_ref`
--

CREATE TABLE `osc_task_admin_ref` (
  `id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL DEFAULT '0',
  `admin_id` int(11) NOT NULL DEFAULT '0',
  `responsible_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблиці `osc_th_blocks`
--

CREATE TABLE `osc_th_blocks` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `features` varchar(255) DEFAULT NULL,
  `stats` varchar(255) DEFAULT NULL,
  `block` int(11) NOT NULL DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `osc_th_blocks`
--

INSERT INTO `osc_th_blocks` (`id`, `name`, `alias`, `features`, `stats`, `block`, `created`, `modified`) VALUES
(1, 'Экохаусы \"Прага\"', 'line-praha', 'фасады в стиле домов старой Праги;\r\n2 этажа, мансарда и цоколь;\r\nуникальное озеленение и благоустройство;', 'Площадь дома*140 м2 + 40 м2 цоколь;\r\nУчасток*от 45 м2;\r\nСтоимость*от 122 000 у.е.;', 0, '2018-01-04 00:00:00', '2018-01-04 00:00:00'),
(2, 'Экохаусы \"Амстердам\"', 'line-amsterdam', 'фасады в стиле домов Амстердама;\r\nшпили и ажурные окна;\r\nвсего 8 соседей в линии;\r\n2 этажа, мансарда и цоколь;', 'Площадь дома*160 м2+49 м2 цоколь;\r\nУчасток*от 45 м2;\r\nСтоимость*от 141 000 у.е.;', 0, '2018-01-04 00:00:00', '2018-01-04 00:00:00'),
(3, 'Экохаусы \"Будапешт\"', 'line-budapesht', 'уникальные фасады домов;\r\n2 этажа, мансарда и цоколь;\r\nвозможность устройства камина;', 'Площадь дома с мансардой*132 м2 + 38 м2 цоколь;\r\nУчасток*от 40 м2;\r\nСтоимость*от 118 000 у.е.;', 0, '2018-01-04 00:00:00', '2018-01-04 00:00:00'),
(4, 'Дом \"Будапешт\"', 'house-budapesht', 'уникальные фасады домов;\r\n2 этажа, мансарда и цоколь;\r\nвозможность устройства камина;', 'Площадь дома с мансардой*165 м2 + 44 м2 цоколь;\r\nУчасток*от 40 м2;\r\nСтоимость*от 150 000 у.е.;', 0, '2018-01-04 00:00:00', '2018-01-04 00:00:00'),
(5, 'Дом \"Амстердам\"', 'house-amsterdam', 'фасады в стиле домов Амстердама;\r\nшпили и ажурные окна;\r\nвсего 8 соседей в линии;\r\n2 этажа, мансарда и цоколь;', 'Площадь дома*206 м2 + 65 м2 цоколь;\r\nУчасток*от 45 м2;\r\nСтоимость*от 186 000 у.е.;', 0, '2018-01-04 00:00:00', '2018-01-04 00:00:00'),
(6, 'Дом \"Прага\"', 'house-praha', 'фасады в стиле домов старой Праги;\r\n2 этажа, мансарда и цоколь;\r\nуникальное озеленение и благоустройство;', 'Площадь дома*140 м2;\r\nУчасток*от 45 м2;\r\nСтоимость*от 103 000 у.е.;', 1, '2018-01-04 00:00:00', '2018-01-04 00:00:00');

-- --------------------------------------------------------

--
-- Структура таблиці `osc_th_blocks_items`
--

CREATE TABLE `osc_th_blocks_items` (
  `id` int(11) NOT NULL,
  `source` varchar(255) DEFAULT NULL,
  `block` int(11) NOT NULL DEFAULT '0',
  `ref` int(11) NOT NULL DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `osc_th_blocks_items`
--

INSERT INTO `osc_th_blocks_items` (`id`, `source`, `block`, `ref`, `created`, `modified`) VALUES
(9, 'thbg_20180109103244400.jpg', 0, 2, '2018-01-09 10:32:44', '2018-01-09 10:32:44'),
(11, 'thbg_20180321131849544.jpg', 0, 1, '2018-03-21 13:18:49', '2018-03-21 13:18:49'),
(12, 'thbg_20180321131913724.jpg', 0, 6, '2018-03-21 13:19:13', '2018-03-21 13:19:13'),
(13, 'thbg_20180321155525329.jpg', 0, 5, '2018-03-21 15:55:25', '2018-03-21 15:55:25'),
(14, 'thbg_20180321160934152.jpg', 0, 4, '2018-03-21 16:09:34', '2018-03-21 16:09:34'),
(15, 'thbg_20180321161028344.jpg', 0, 3, '2018-03-21 16:10:28', '2018-03-21 16:10:28');

-- --------------------------------------------------------

--
-- Структура таблиці `osc_th_floors`
--

CREATE TABLE `osc_th_floors` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `parent` int(11) NOT NULL DEFAULT '0',
  `block` int(11) NOT NULL DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `osc_th_floors`
--

INSERT INTO `osc_th_floors` (`id`, `name`, `alias`, `parent`, `block`, `created`, `modified`) VALUES
(1, 'Первый этаж', 'first', 0, 0, '2018-01-04 00:00:00', '2018-01-04 00:00:00'),
(2, 'Второй этаж', 'second', 0, 0, '2018-01-04 00:00:00', '2018-01-04 00:00:00'),
(3, 'Третий этаж', 'third', 0, 0, '2018-01-04 00:00:00', '2018-01-04 00:00:00');

-- --------------------------------------------------------

--
-- Структура таблиці `osc_th_gal`
--

CREATE TABLE `osc_th_gal` (
  `id` int(11) NOT NULL,
  `source` varchar(255) DEFAULT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `sub_caption` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `block` int(11) NOT NULL DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `gal_num` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `osc_th_gal`
--

INSERT INTO `osc_th_gal` (`id`, `source`, `caption`, `sub_caption`, `icon`, `block`, `created`, `modified`, `gal_num`) VALUES
(18, 'thg_20180109121425724.jpg', 'Благоустроенный внутренний двор городка', NULL, NULL, 0, '2018-01-09 12:14:26', '2018-01-09 12:14:26', 1),
(19, 'thg_20180109121426154.jpg', 'Детские и спортивные площадки, озеленение', NULL, NULL, 0, '2018-01-09 12:14:26', '2018-01-09 12:14:26', 1),
(20, 'thg_20180109121426399.jpg', 'Парковки вынесены за пределы городка. Все для людей', NULL, NULL, 0, '2018-01-09 12:14:26', '2018-01-09 12:14:26', 1),
(32, 'thg_20180109125005609.jpg', 'Просторная гостиная', NULL, NULL, 0, '2018-01-09 12:50:06', '2018-01-09 12:50:06', 2),
(33, 'thg_20180109125005720.jpg', 'Уют для всей семьи', NULL, NULL, 0, '2018-01-09 12:50:06', '2018-01-09 12:50:06', 2),
(34, 'thg_20180109125005796.jpg', 'Можно сделать камин', NULL, NULL, 0, '2018-01-09 12:50:06', '2018-01-09 12:50:06', 2),
(35, 'thg_20180109125005234.jpg', 'Кухня со встроенной техникой', NULL, NULL, 0, '2018-01-09 12:50:06', '2018-01-09 12:50:06', 2),
(38, 'thg_20180109125141699.jpg', NULL, NULL, NULL, 0, '2018-01-09 12:51:43', '2018-01-09 12:51:43', 2),
(45, 'thg_20180117224756883.jpg', 'Архитектура в стиле старой Европы', NULL, NULL, 0, '2018-01-17 22:47:56', '2018-01-17 22:47:56', 1),
(46, 'thg_20180117224819428.jpg', 'Центральный въезд в городок', NULL, NULL, 0, '2018-01-17 22:48:19', '2018-01-17 22:48:19', 1),
(47, 'thg_20180117225437308.jpg', 'Уникальный закрытый двор для прогулок', NULL, NULL, 0, '2018-01-17 22:54:37', '2018-01-17 22:54:37', 1);

-- --------------------------------------------------------

--
-- Структура таблиці `osc_th_layouts`
--

CREATE TABLE `osc_th_layouts` (
  `id` int(11) NOT NULL,
  `layout_name` varchar(255) DEFAULT NULL,
  `th_id` int(11) NOT NULL DEFAULT '0',
  `floor_id` int(11) NOT NULL DEFAULT '0',
  `stats` text,
  `block` int(11) NOT NULL DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `osc_th_layouts`
--

INSERT INTO `osc_th_layouts` (`id`, `layout_name`, `th_id`, `floor_id`, `stats`, `block`, `created`, `modified`) VALUES
(7, 'Таунхаус \"Прага\" - 1 этаж - 52,5 м2', 1, 1, 'Площадь*52,5 м2;\r\nГостиная*32,8 м2;\r\nКухня*8,1 м2;\r\nПрихожая*7,9 м2;\r\nСанузел*3,7 м2;', 0, '2018-01-08 20:47:37', '2018-01-08 20:47:37'),
(9, 'Таунхаус \"Прага\" - 2 этаж - 47,5 м2', 1, 2, 'Площадь*47,5 м2;\r\nCпальни:*12, 11 и 11 м2;\r\nСанузел*4,6 м2;\r\nБалкон*1 м2;', 0, '2018-01-09 11:28:52', '2018-01-09 11:28:52'),
(10, 'Таунхаус \"Прага\" - Мансарда - 40,3 м2', 1, 3, 'Площадь мансарды*40,3 м2;', 0, '2018-01-09 11:31:39', '2018-01-09 11:31:39'),
(11, 'Таунхаус \"Амстердам\" - 1 этаж - 57,1 м2', 2, 1, 'Площадь*57,1 м2;\r\nГостиная*27,2 м2;\r\nКухня*7,6 м2;\r\nПрихожая*7,6 м2;\r\nГардеробная*6,5 м2;\r\nСанузел*4,2 м2;', 0, '2018-01-09 11:57:51', '2018-01-09 11:57:51'),
(12, 'Таунхаус \"Амстердам\" - 2 этаж - 54,1 м2', 2, 2, 'Площадь*54,1 м2;\r\nCпальни:*15, 15 и 10 м2;\r\nСанузел*5,2 м2;\r\nБалконы:*2 и 2 м2;', 0, '2018-01-09 12:01:13', '2018-01-09 12:01:13'),
(13, 'Таунхаус \"Амстердам\" - Мансарда - 50 м2', 2, 3, 'Площадь мансарды*50 м2;', 0, '2018-01-09 12:02:55', '2018-01-09 12:02:55'),
(14, 'Таунхаус \"Будапешт\" - 1 этаж - 49,6 м2', 3, 1, 'Площадь*49,6 м2;\r\nГостиная*26,7 м2;\r\nКухня*9 м2;\r\nПрихожая*10,3 м2;\r\nСанузел*3,5 м2;', 0, '2018-01-09 12:05:04', '2018-01-09 12:05:04'),
(15, 'Таунхаус \"Будапешт\" - 2 этаж - 44,4 м2', 3, 2, 'Площадь*44,4 м2;\r\nCпальни:*14,3 и 13,4 м2;\r\nГардеробная*8,6 м2;\r\nСанузел*4,7 м2;', 0, '2018-01-09 12:08:07', '2018-01-09 12:08:07'),
(16, 'Таунхаус \"Будапешт\" - Мансарда - 38,6 м2', 3, 3, 'Площадь мансарды*38,6 м2;', 0, '2018-01-09 12:10:10', '2018-01-09 12:10:10'),
(18, 'Дом \"Амстердам\" - 1 этаж - 69,4 м2', 5, 1, 'Площадь*69,4 м2;\r\nГостиная*33,9 м2;\r\nКухня*11,9 м2;\r\nПрихожая*3,3 м2;\r\nГардеробная*4,3 м2;\r\nСанузел*3 м2;', 0, '2018-03-21 16:30:10', '2018-03-21 16:30:10'),
(19, 'Дом \"Амстердам\" - 2 этаж - 67,6 м2', 5, 2, 'Площадь*67,6 м2;\r\nCпальни:*21, 18 и 14 м2;\r\nСанузел*6,5 м2;', 0, '2018-03-21 16:31:53', '2018-03-21 16:31:53'),
(20, 'Дом \"Амстердам\" - Мансарда - 69,2 м2', 5, 3, 'Площадь мансарды*69,2 м2;', 0, '2018-03-21 16:32:42', '2018-03-21 16:32:42'),
(21, 'Дом \"Будапешт\" - 1 этаж - 63,2 м2', 4, 1, 'Площадь*63,2 м2;\r\nГостиная*36 м2;\r\nКухня*10,5 м2;\r\nПрихожая*4 м2;\r\nСанузел*2,3 м2;', 0, '2018-03-21 16:34:43', '2018-03-21 16:34:43'),
(22, 'Дом \"Будапешт\" - 2 этаж - 56,2 м2', 4, 2, 'Площадь*56,2 м2;\r\nCпальни:*16,9, 16,7 и 9,2 м2;\r\nСанузел*5,4 м2;', 0, '2018-03-21 16:36:20', '2018-03-21 16:36:20'),
(23, 'Дом \"Будапешт\" - Мансарда - 44,6 м2', 4, 3, 'Площадь мансарды*44,6 м2;', 0, '2018-03-21 16:37:07', '2018-03-21 16:37:07');

-- --------------------------------------------------------

--
-- Структура таблиці `osc_th_layouts_items`
--

CREATE TABLE `osc_th_layouts_items` (
  `id` int(11) NOT NULL,
  `ref_id` int(11) NOT NULL DEFAULT '0',
  `block` int(11) NOT NULL DEFAULT '0',
  `source` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `osc_th_layouts_items`
--

INSERT INTO `osc_th_layouts_items` (`id`, `ref_id`, `block`, `source`, `created`, `modified`) VALUES
(19, 7, 0, 'thl_20180109104722451.jpg', '2018-01-09 10:47:22', '2018-01-09 10:47:22'),
(20, 9, 0, 'thl_20180109112852622.jpg', '2018-01-09 11:28:52', '2018-01-09 11:28:52'),
(21, 10, 0, 'thl_20180109113139275.jpg', '2018-01-09 11:31:40', '2018-01-09 11:31:40'),
(22, 11, 0, 'thl_20180109115751619.jpg', '2018-01-09 11:57:51', '2018-01-09 11:57:51'),
(23, 12, 0, 'thl_20180109120113233.jpg', '2018-01-09 12:01:13', '2018-01-09 12:01:13'),
(24, 13, 0, 'thl_20180109120255298.jpg', '2018-01-09 12:02:55', '2018-01-09 12:02:55'),
(25, 14, 0, 'thl_20180109120504332.jpg', '2018-01-09 12:05:04', '2018-01-09 12:05:04'),
(26, 15, 0, 'thl_20180109120807117.jpg', '2018-01-09 12:08:07', '2018-01-09 12:08:07'),
(27, 16, 0, 'thl_20180109121010658.jpg', '2018-01-09 12:10:10', '2018-01-09 12:10:10'),
(28, 14, 0, 'thl_20180109173306524.jpg', '2018-01-09 17:33:08', '2018-01-09 17:33:08'),
(30, 14, 0, 'thl_20180109173306791.jpg', '2018-01-09 17:33:08', '2018-01-09 17:33:08'),
(32, 14, 0, 'thl_20180109173307106.jpg', '2018-01-09 17:33:08', '2018-01-09 17:33:08'),
(37, 15, 0, 'thl_20180109173523254.jpg', '2018-01-09 17:35:24', '2018-01-09 17:35:24'),
(38, 15, 0, 'thl_20180109173523516.jpg', '2018-01-09 17:35:24', '2018-01-09 17:35:24'),
(39, 15, 0, 'thl_20180109173523368.jpg', '2018-01-09 17:35:24', '2018-01-09 17:35:24'),
(40, 15, 0, 'thl_20180109173523349.jpg', '2018-01-09 17:35:24', '2018-01-09 17:35:24'),
(41, 16, 0, 'thl_20180109173600136.jpg', '2018-01-09 17:36:01', '2018-01-09 17:36:01'),
(42, 16, 0, 'thl_20180109173600649.jpg', '2018-01-09 17:36:01', '2018-01-09 17:36:01'),
(43, 16, 0, 'thl_20180109173601591.jpg', '2018-01-09 17:36:01', '2018-01-09 17:36:01'),
(45, 18, 0, 'thl_20180321163010165.jpg', '2018-03-21 16:30:10', '2018-03-21 16:30:10'),
(46, 19, 0, 'thl_20180321163153330.jpg', '2018-03-21 16:31:53', '2018-03-21 16:31:53'),
(47, 20, 0, 'thl_20180321163242197.jpg', '2018-03-21 16:32:42', '2018-03-21 16:32:42'),
(48, 21, 0, 'thl_20180321163443673.jpg', '2018-03-21 16:34:44', '2018-03-21 16:34:44'),
(49, 22, 0, 'thl_20180321163620451.jpg', '2018-03-21 16:36:20', '2018-03-21 16:36:20'),
(50, 23, 0, 'thl_20180321163707540.jpg', '2018-03-21 16:37:07', '2018-03-21 16:37:07');

-- --------------------------------------------------------

--
-- Структура таблиці `osc_th_page`
--

CREATE TABLE `osc_th_page` (
  `id` int(11) NOT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `banner_caption` varchar(255) DEFAULT NULL,
  `panorama` text,
  `points_image` varchar(255) DEFAULT NULL,
  `point1` varchar(255) DEFAULT NULL,
  `point2` varchar(255) DEFAULT NULL,
  `point3` varchar(255) DEFAULT NULL,
  `point4` varchar(255) DEFAULT NULL,
  `smart_caption` varchar(255) DEFAULT NULL,
  `smart_image` varchar(255) DEFAULT NULL,
  `smart1` varchar(255) DEFAULT NULL,
  `smart2` varchar(255) DEFAULT NULL,
  `smart3` varchar(255) DEFAULT NULL,
  `infra_capt` varchar(255) DEFAULT NULL,
  `eq1` varchar(255) DEFAULT NULL,
  `eq2` varchar(255) DEFAULT NULL,
  `eq3` varchar(255) DEFAULT NULL,
  `capt1` varchar(255) DEFAULT NULL,
  `text1` text,
  `capt2` varchar(255) DEFAULT NULL,
  `text2` text,
  `th_stat` text,
  `benefits` varchar(255) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_keys` varchar(255) DEFAULT NULL,
  `meta_desc` text,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `osc_th_page`
--

INSERT INTO `osc_th_page` (`id`, `banner`, `banner_caption`, `panorama`, `points_image`, `point1`, `point2`, `point3`, `point4`, `smart_caption`, `smart_image`, `smart1`, `smart2`, `smart3`, `infra_capt`, `eq1`, `eq2`, `eq3`, `capt1`, `text1`, `capt2`, `text2`, `th_stat`, `benefits`, `meta_title`, `meta_keys`, `meta_desc`, `created`, `modified`) VALUES
(1, 'th_bn_20180307122457695.jpg', '', '', 'th_pi_20180315130122225.jpg', '', '', '', '', 'Ваш умный дом', 'th_sm_20180108195653630.jpg', 'Все экохаусы будут оборудованы системой \"умный дом\" немецкого производителя  Larnitec, Благодаря ей, вы сможете контролировать:\r\n', 'Теплые полы и отопление;\r\nОсвещение снаружи и внутри дома;\r\nВентиляция и климат-контроль;\r\nРаскрытие дверей и окон;\r\nКонтроль протечки воды;\r\nСистема безопасности;', 'ТВ;\r\nМузыка;\r\nИнтернет;', 'Уютное место для досуга и отдыха', 'Система \"Умный дом\";\r\n4 уровня - цоколь, мансарда, 2 жилых этажа;\r\nУтепление минеральной ватой;\r\nАвтономное отопление;', 'Большие кухни-гостиные;\r\nПредусмотрено размещение камина;\r\n', 'Въезд по пропускам;\r\nМеста для досуга и отдыха;\r\nОхрана и видеонаблюдение;', '', '', 'О застройщике', 'AVM Development Group реализует комплексные строительные проекты «под ключ» от концепции до сдачи в эксплуатацию', '3*комплекса строится;\r\n5*комплексов введено в эксплуатацию;\r\n36 га*площадь застройки;\r\n40 тыс. м2*сдано в эксплуатацию;\r\n520*квартир на стадии строительства;\r\n6*лет на рынке;', 'Собственное архитектурное бюро;\r\nГенподрядная организация;\r\nСлужба обслуживания недвижимости;', '', '', '', '2018-01-03 00:00:00', '2018-01-03 00:00:00');

-- --------------------------------------------------------

--
-- Структура таблиці `osc_th_tabs`
--

CREATE TABLE `osc_th_tabs` (
  `id` int(11) NOT NULL,
  `tab_caption` varchar(255) DEFAULT NULL,
  `tab_sub_caption` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `details` text,
  `lat` float DEFAULT NULL,
  `lng` float DEFAULT NULL,
  `block` int(11) NOT NULL DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `osc_th_tabs`
--

INSERT INTO `osc_th_tabs` (`id`, `tab_caption`, `tab_sub_caption`, `icon`, `image`, `caption`, `details`, `lat`, `lng`, `block`, `created`, `modified`) VALUES
(1, 'ТРЦ \"Мегамаркет\"', 'Городская инфраструктура в пешей доступности', 'th_t_ic_20180109123949196.svg', 'th_t_im_201801091223401000.jpg', 'ТРЦ \"Мегамаркет\"', '<p></p>В ТРЦ \"Мегамаркет\", помимо большого супермаркета, находятся все необходимые для комфортной жизни объекты инфраструктуры - химчистка, аптеки, отделение Приватбанка, магазин мобильной техники и прочее.<p></p>\r\n', 50.2692, 30.5327, 0, '2018-01-04 00:00:00', '2018-01-04 00:00:00'),
(2, 'Аутлет городок \"Мануфактура\"', 'Шопинг без границ', 'th_t_ic_20180109124003475.svg', 'th_t_im_20180109122202114.jpg', 'Аутлет городок \"Мануфактура\"', '<p></p>В пешей доступности с нашим городком расположен аутлет-городок Мануфактура. В нем представлены магазины ведущих мировых брендов, есть уютные кафе. Прекрасная атмосфера городка и высокий уровень благоустройства всячески располагают к неспешным семейным прогулкам.<p></p>\r\n', 50.271, 30.535, 0, '2018-01-04 00:00:00', '2018-01-04 00:00:00'),
(6, 'Фитнес-клуб \"Дельтаплан\"', 'Будьте всегда в отличной форме', 'th_t_ic_20180109123933576.svg', 'th_t_im_20180109123933756.jpg', 'Фитнес-клуб \"Дельтаплан\"', '<p>У наших жителей есть прекрасная возможность не тратить время на дорогу в фитнес-клубы, находящихся в городе, а получить полный пакет оздоровительных услуг непосредственно рядом с домом. <br></p>', 50.271, 30.535, 0, NULL, NULL),
(7, 'Голубое озеро в Подгорцах', 'Элитный пляжный отдых в для всей семьи', 'th_t_ic_20180109124539348.svg', 'th_t_im_20180109122848525.jpg', 'Голубое озеро в Подгорцах', '<p>Прекрасное место для семейного пляжного отдыха находится в 3 км от нашего городка, в с.Подгорцы. Чистейшая вода, высокий уровень сервиса позволят вам весело провести время жаркими летними денечками.<br></p>', 50.2486, 30.5592, 0, NULL, NULL),
(8, 'Кинотеатр \"Баттерфляй-Кантри\"', 'Вечерние посиделки в кино с друзьями', 'th_t_ic_20180109124124562.svg', 'th_t_im_20180109124124131.jpg', 'Кинотеатр \"Баттерфляй-Кантри\"', '<p>Современный кинотеатр сети \"Баттерфляй\". Есть 4 зала. Лучшие кинопремьеры каждую неделю.<br></p>', 50.2699, 30.5299, 0, NULL, NULL),
(9, 'Конно-Спортивный клуб', 'Воспитывайте в своих детях хороший вкус', 'th_t_ic_20180109124228718.svg', 'th_t_im_20180109124228120.jpg', 'Конно-Спортивный клуб', '<p>Конный клуб Equides Club расположен на огромной территории в 16 га на живописных холмах и полях в с.Лесники. Здесь раздолье для аматорских прогулок верхом, а так же отличные условия для спортивных тренировок. В клубе созданы все условия комфорта для отдыха всей семьей. В клубе работает академия конного спорта.<br></p>', 50.3129, 30.5165, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблиці `osc_total_config`
--

CREATE TABLE `osc_total_config` (
  `id` int(11) NOT NULL,
  `sitename` varchar(255) NOT NULL DEFAULT '0',
  `support_email` varchar(255) NOT NULL DEFAULT 'support@',
  `phone_number` varchar(255) NOT NULL DEFAULT '044-000-00-00',
  `phone_number2` varchar(255) NOT NULL DEFAULT '044-000-00-00',
  `address` varchar(255) DEFAULT NULL,
  `office_address` varchar(255) DEFAULT NULL,
  `fb_link` varchar(255) NOT NULL,
  `tw_link` varchar(255) CHARACTER SET utf8 COLLATE utf8_estonian_ci NOT NULL,
  `yt_link` varchar(255) NOT NULL,
  `linked_link` varchar(255) NOT NULL,
  `work_time` varchar(255) DEFAULT NULL,
  `active` int(1) NOT NULL DEFAULT '1',
  `editor` int(1) NOT NULL DEFAULT '0',
  `index` int(1) NOT NULL DEFAULT '0',
  `meta_title` varchar(255) NOT NULL DEFAULT 'ZEN',
  `meta_keys` varchar(255) NOT NULL DEFAULT 'ZEN',
  `meta_desc` text NOT NULL,
  `copyright` varchar(255) NOT NULL,
  `partnership_phone` varchar(255) NOT NULL,
  `hotline_phone` varchar(255) NOT NULL,
  `afterHead` longtext NOT NULL,
  `afterBody` longtext NOT NULL,
  `dateModify` datetime NOT NULL,
  `adminMod` int(7) NOT NULL DEFAULT '0',
  `projects_pag` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `osc_total_config`
--

INSERT INTO `osc_total_config` (`id`, `sitename`, `support_email`, `phone_number`, `phone_number2`, `address`, `office_address`, `fb_link`, `tw_link`, `yt_link`, `linked_link`, `work_time`, `active`, `editor`, `index`, `meta_title`, `meta_keys`, `meta_desc`, `copyright`, `partnership_phone`, `hotline_phone`, `afterHead`, `afterBody`, `dateModify`, `adminMod`, `projects_pag`) VALUES
(1, 'ЖК \"Новая Конча-Заспа\"', 'avmbud@gmail.com', '044 394-88-19', '067 825-50-18', 'с. Ходосеевка, Новообуховское шоссе, 1', 'Киев, просп. Академика Палладина, 44, офис №101', 'https://www.facebook.com/nkz.ukraine/', '', '', '', 'пн-вс 10:00 - 19:00', 1, 0, 1, 'ЖК \"Нова Конча-Заспа\"', 'жк, нова конча-заспа', 'Житловий комплекс  \"Нова Конча-Заспа\"', 'ЖК \"Новая Конча-Заспа\".  Все права защищены.', '(068) 412-98-85', '(093) 708-85-66', '<script id=\"dev_socproof_script\" async type=\"text/javascript\" src=\"https://app.socproofy.ru/js/socproof_script.min.js\" hash=\"16124d45fb9f6a089347716f5875a0a7\" ></script>\r\n\r\n\r\n<!-- Facebook Pixel Code -->\r\n<script>\r\n  !function(f,b,e,v,n,t,s)\r\n  {if(f.fbq)return;n=f.fbq=function(){n.callMethod?\r\n  n.callMethod.apply(n,arguments):n.queue.push(arguments)};\r\n  if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version=\'2.0\';\r\n  n.queue=[];t=b.createElement(e);t.async=!0;\r\n  t.src=v;s=b.getElementsByTagName(e)[0];\r\n  s.parentNode.insertBefore(t,s)}(window, document,\'script\',\r\n  \'https://connect.facebook.net/en_US/fbevents.js\');\r\n  fbq(\'init\', \'1372077772852273\');\r\n  fbq(\'track\', \'PageView\');\r\n</script>\r\n<noscript><img height=\"1\" width=\"1\" style=\"display:none\"\r\n  src=\"https://www.facebook.com/tr?id=1372077772852273&ev=PageView&noscript=1\"\r\n/></noscript>\r\n<!-- End Facebook Pixel Code -->', '<script type=\"text/javascript\">;(function(){if(window.wit_inited)return; window.wit_inited=true; var b=(typeof this.href!=\"undefined\")?this.href:document.location; b=b.toString().toLowerCase(); var c=(window.WitgetData)?\"&userdata=\"+JSON.stringify(window.WitgetData):\'\'; var a=document.createElement(\"script\"); a.type=\"text/javascript\"; a.async=true;a.src=\"//loader.witget.com/v2.4/2ff72778da6c35c1109d159a55f18c20?ref=\"+document.referrer+\"&url=\"+b+\"&nc=\"+Math.random()+c; var s=document.getElementsByTagName(\"script\")[0]; s.parentNode.insertBefore(a,s)})(); </script> \r\n\r\n2ff72778da6c35c1109d159a55f18c20', '2018-05-23 17:26:34', 1, 9);

-- --------------------------------------------------------

--
-- Структура таблиці `osc_transfer`
--

CREATE TABLE `osc_transfer` (
  `id` int(11) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `viewed` int(1) NOT NULL DEFAULT '0',
  `dateCreate` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблиці `osc_translate`
--

CREATE TABLE `osc_translate` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `en` text NOT NULL,
  `de` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Translations ref table';

-- --------------------------------------------------------

--
-- Структура таблиці `osc_users`
--

CREATE TABLE `osc_users` (
  `id` int(11) NOT NULL,
  `type` int(4) NOT NULL DEFAULT '9',
  `login` varchar(128) NOT NULL DEFAULT '0',
  `email` varchar(123) DEFAULT NULL,
  `pass` varchar(64) NOT NULL DEFAULT '0',
  `phone` varchar(64) NOT NULL DEFAULT '0',
  `birthday` datetime DEFAULT NULL,
  `wb_id` int(11) NOT NULL DEFAULT '0',
  `comm_сount` int(11) NOT NULL DEFAULT '0',
  `sale_card_id` int(11) NOT NULL DEFAULT '0',
  `sale_barcode` varchar(63) NOT NULL DEFAULT '0',
  `sale_percent` float NOT NULL DEFAULT '3',
  `delivery_address` varchar(255) NOT NULL DEFAULT 'Ukraine',
  `name` varchar(64) NOT NULL DEFAULT '0',
  `fname` varchar(64) NOT NULL DEFAULT '0',
  `lname` varchar(64) NOT NULL DEFAULT '0',
  `male` varchar(1) NOT NULL DEFAULT 'М',
  `avatar` varchar(63) NOT NULL DEFAULT '0',
  `data` text,
  `reg_ip` varchar(63) DEFAULT NULL,
  `last_login_ip` varchar(63) DEFAULT NULL,
  `last_visit` datetime DEFAULT NULL,
  `dateCreate` datetime NOT NULL,
  `dateModify` datetime NOT NULL,
  `adminMod` int(7) NOT NULL DEFAULT '0',
  `block` int(1) NOT NULL DEFAULT '0',
  `active` int(1) NOT NULL DEFAULT '0',
  `order_id` int(5) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='System Administrators';

--
-- Дамп даних таблиці `osc_users`
--

INSERT INTO `osc_users` (`id`, `type`, `login`, `email`, `pass`, `phone`, `birthday`, `wb_id`, `comm_сount`, `sale_card_id`, `sale_barcode`, `sale_percent`, `delivery_address`, `name`, `fname`, `lname`, `male`, `avatar`, `data`, `reg_ip`, `last_login_ip`, `last_visit`, `dateCreate`, `dateModify`, `adminMod`, `block`, `active`, `order_id`) VALUES
(1, 1, 'sk-fall@yandex.ru', 'sk-fall@yandex.ru', '0b2115aae461d2a797bf7f68bd30c9c4', '(098)100-32-28', '1990-03-06 00:00:00', 0, 0, 0, '0', 3, 'Ukraine', 'Sergey', 'Dev', 'Dev', 'М', 'zen_20180113031135392.PNG', '', NULL, '::1', '2017-05-02 17:23:06', '1000-01-01 00:00:00', '2018-01-13 03:11:35', 1, 0, 1, 0),
(2, 1, 'nkz@demo.de', NULL, '3fc0a7acf087f549ac2b266baf94b8b1', '(111)111-11-11', '1970-01-01 03:00:00', 0, 0, 0, '0', 3, 'Ukraine', 'NKZ', 'admin', '0', 'М', 'zen_20180113031223798.png', '', NULL, NULL, NULL, '2017-06-09 18:35:49', '2018-01-13 03:12:23', 0, 0, 1, 0),
(3, 1, 'info@kam-studio.com.ua', 'info@kam-studio.com.ua', '48bb6e862e54f2a795ffc4e541caed4d', '(096)094-01-49', '2000-05-01 00:00:00', 0, 0, 0, '0', 3, 'Ukraine', 'KAM', 'STUDIO', 'Website developer', 'М', 'zen_20180521151029503.jpg', '', NULL, NULL, NULL, '2018-05-21 15:09:50', '2018-05-21 15:10:29', 1, 0, 1, 0);

-- --------------------------------------------------------

--
-- Структура таблиці `osc_users_chat`
--

CREATE TABLE `osc_users_chat` (
  `id` int(11) NOT NULL,
  `type` varchar(63) NOT NULL DEFAULT 'message',
  `status` int(1) NOT NULL DEFAULT '0',
  `from_id` int(7) NOT NULL DEFAULT '0',
  `to_id` int(7) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '0',
  `message` tinytext NOT NULL,
  `file` varchar(63) NOT NULL DEFAULT '0',
  `important` int(2) NOT NULL DEFAULT '0',
  `dateCreate` datetime NOT NULL,
  `dateModify` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Чат между пользователями';

-- --------------------------------------------------------

--
-- Структура таблиці `osc_users_dialogs`
--

CREATE TABLE `osc_users_dialogs` (
  `id` int(11) NOT NULL,
  `last` int(1) NOT NULL DEFAULT '1',
  `message` text NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  `from_id` int(11) NOT NULL DEFAULT '0',
  `to_id` int(11) NOT NULL DEFAULT '0',
  `dateCreate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблиці `osc_users_types`
--

CREATE TABLE `osc_users_types` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '0',
  `alias` varchar(255) NOT NULL DEFAULT '0',
  `block` int(1) NOT NULL DEFAULT '0',
  `admin_enter` int(1) NOT NULL DEFAULT '1',
  `change_login` int(1) NOT NULL DEFAULT '1',
  `dateCreate` datetime NOT NULL,
  `dateModify` datetime NOT NULL,
  `adminMod` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Уровни пользователей';

--
-- Дамп даних таблиці `osc_users_types`
--

INSERT INTO `osc_users_types` (`id`, `name`, `alias`, `block`, `admin_enter`, `change_login`, `dateCreate`, `dateModify`, `adminMod`) VALUES
(1, 'SuperAdministrator', 'superadministrator', 0, 1, 1, '2013-11-14 00:00:00', '2018-01-14 14:49:35', 0),
(2, 'ContentManager', 'contentmanager', 0, 1, 1, '2013-11-14 00:00:00', '2016-02-04 15:35:23', 0),
(6, 'QualityManager', 'qualitymanager', 0, 1, 1, '2013-11-15 10:47:01', '2015-09-19 01:40:14', 0),
(9, 'Зарегистрированный', 'siteuser', 0, 0, 0, '2013-12-23 15:52:55', '2017-04-11 18:37:04', 0);

-- --------------------------------------------------------

--
-- Структура таблиці `osc_user_type_access`
--

CREATE TABLE `osc_user_type_access` (
  `id` int(11) NOT NULL,
  `access` int(1) NOT NULL DEFAULT '1',
  `type_id` int(11) NOT NULL DEFAULT '0',
  `menu_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `osc_user_type_access`
--

INSERT INTO `osc_user_type_access` (`id`, `access`, `type_id`, `menu_id`) VALUES
(1, 0, 9, 28),
(2, 0, 9, 29),
(3, 0, 9, 7),
(4, 0, 9, 12),
(5, 0, 9, 13),
(6, 0, 9, 14),
(7, 0, 9, 15),
(8, 0, 9, 16),
(9, 0, 9, 30),
(10, 0, 9, 8),
(11, 0, 9, 10),
(12, 0, 9, 11),
(13, 0, 9, 31),
(14, 0, 9, 18),
(15, 0, 9, 17),
(16, 0, 9, 19),
(17, 0, 9, 34),
(18, 0, 9, 32),
(19, 0, 9, 33),
(20, 0, 9, 35),
(21, 0, 9, 20),
(22, 0, 9, 36),
(23, 0, 9, 22),
(24, 0, 9, 23),
(25, 0, 9, 24),
(26, 0, 9, 25),
(27, 1, 9, 26),
(28, 1, 9, 27),
(29, 0, 10, 28),
(30, 0, 10, 29),
(31, 0, 10, 7),
(32, 0, 10, 12),
(33, 0, 10, 13),
(34, 0, 10, 14),
(35, 0, 10, 15),
(36, 0, 10, 16),
(37, 0, 10, 30),
(38, 0, 10, 8),
(39, 0, 10, 10),
(40, 0, 10, 11),
(41, 0, 10, 31),
(42, 0, 10, 18),
(43, 0, 10, 17),
(44, 0, 10, 19),
(45, 0, 10, 34),
(46, 0, 10, 32),
(47, 0, 10, 33),
(48, 0, 10, 35),
(49, 0, 10, 20),
(50, 0, 10, 36),
(51, 0, 10, 22),
(52, 0, 10, 23),
(53, 0, 10, 24),
(54, 0, 10, 25),
(55, 1, 10, 26),
(56, 1, 10, 27),
(57, 1, 1, 28),
(58, 1, 1, 29),
(59, 1, 1, 7),
(60, 1, 1, 12),
(61, 1, 1, 13),
(62, 1, 1, 14),
(63, 1, 1, 15),
(64, 1, 1, 16),
(65, 1, 1, 30),
(66, 1, 1, 8),
(67, 1, 1, 10),
(68, 1, 1, 11),
(69, 1, 1, 31),
(70, 1, 1, 18),
(71, 1, 1, 17),
(72, 1, 1, 19),
(73, 1, 1, 34),
(74, 1, 1, 32),
(75, 1, 1, 33),
(76, 1, 1, 35),
(77, 1, 1, 20),
(78, 1, 1, 36),
(79, 1, 1, 22),
(80, 1, 1, 23),
(81, 1, 1, 24),
(82, 1, 1, 25),
(83, 1, 1, 26),
(84, 1, 1, 27),
(85, 1, 2, 28),
(86, 1, 2, 29),
(87, 1, 2, 7),
(88, 1, 2, 12),
(89, 0, 2, 13),
(90, 0, 2, 14),
(91, 0, 2, 15),
(92, 1, 2, 16),
(93, 0, 2, 30),
(94, 0, 2, 8),
(95, 0, 2, 10),
(96, 0, 2, 11),
(97, 0, 2, 31),
(98, 1, 2, 18),
(99, 1, 2, 17),
(100, 1, 2, 19),
(101, 1, 2, 34),
(102, 1, 2, 32),
(103, 1, 2, 33),
(104, 1, 2, 35),
(105, 1, 2, 20),
(106, 0, 2, 36),
(107, 0, 2, 22),
(108, 0, 2, 23),
(109, 1, 2, 24),
(110, 1, 2, 25),
(111, 1, 2, 26),
(112, 1, 2, 27),
(113, 1, 3, 28),
(114, 1, 3, 29),
(115, 1, 3, 7),
(116, 1, 3, 12),
(117, 1, 3, 13),
(118, 1, 3, 14),
(119, 1, 3, 15),
(120, 1, 3, 16),
(121, 1, 3, 30),
(122, 1, 3, 8),
(123, 1, 3, 10),
(124, 1, 3, 11),
(125, 1, 3, 31),
(126, 1, 3, 18),
(127, 1, 3, 17),
(128, 1, 3, 19),
(129, 1, 3, 34),
(130, 1, 3, 32),
(131, 1, 3, 33),
(132, 1, 3, 35),
(133, 1, 3, 20),
(134, 1, 3, 36),
(135, 1, 3, 22),
(136, 1, 3, 23),
(137, 1, 3, 24),
(138, 1, 3, 25),
(139, 1, 3, 26),
(140, 1, 3, 27),
(141, 1, 4, 28),
(142, 1, 4, 29),
(143, 1, 4, 7),
(144, 1, 4, 12),
(145, 1, 4, 13),
(146, 1, 4, 14),
(147, 1, 4, 15),
(148, 1, 4, 16),
(149, 1, 4, 30),
(150, 1, 4, 8),
(151, 1, 4, 10),
(152, 1, 4, 11),
(153, 1, 4, 31),
(154, 1, 4, 18),
(155, 1, 4, 17),
(156, 1, 4, 19),
(157, 1, 4, 34),
(158, 1, 4, 32),
(159, 1, 4, 33),
(160, 1, 4, 35),
(161, 1, 4, 20),
(162, 1, 4, 36),
(163, 1, 4, 22),
(164, 1, 4, 23),
(165, 1, 4, 24),
(166, 1, 4, 25),
(167, 1, 4, 26),
(168, 1, 4, 27),
(169, 1, 5, 28),
(170, 1, 5, 29),
(171, 1, 5, 7),
(172, 1, 5, 12),
(173, 1, 5, 13),
(174, 1, 5, 14),
(175, 1, 5, 15),
(176, 1, 5, 16),
(177, 1, 5, 30),
(178, 1, 5, 8),
(179, 1, 5, 10),
(180, 1, 5, 11),
(181, 1, 5, 31),
(182, 1, 5, 18),
(183, 1, 5, 17),
(184, 1, 5, 19),
(185, 1, 5, 34),
(186, 1, 5, 32),
(187, 1, 5, 33),
(188, 1, 5, 35),
(189, 1, 5, 20),
(190, 1, 5, 36),
(191, 1, 5, 22),
(192, 1, 5, 23),
(193, 1, 5, 24),
(194, 1, 5, 25),
(195, 1, 5, 26),
(196, 1, 5, 27),
(197, 1, 6, 28),
(198, 1, 6, 29),
(199, 1, 6, 7),
(200, 1, 6, 12),
(201, 1, 6, 13),
(202, 1, 6, 14),
(203, 1, 6, 15),
(204, 1, 6, 16),
(205, 1, 6, 30),
(206, 0, 6, 8),
(207, 0, 6, 10),
(208, 0, 6, 11),
(209, 1, 6, 31),
(210, 1, 6, 18),
(211, 1, 6, 17),
(212, 1, 6, 19),
(213, 1, 6, 34),
(214, 1, 6, 32),
(215, 1, 6, 33),
(216, 1, 6, 35),
(217, 1, 6, 20),
(218, 1, 6, 36),
(219, 1, 6, 22),
(220, 1, 6, 23),
(221, 1, 6, 24),
(222, 1, 6, 25),
(223, 1, 6, 26),
(224, 1, 6, 27),
(225, 1, 7, 28),
(226, 1, 7, 29),
(227, 1, 7, 7),
(228, 1, 7, 12),
(229, 1, 7, 13),
(230, 1, 7, 14),
(231, 1, 7, 15),
(232, 1, 7, 16),
(233, 1, 7, 30),
(234, 1, 7, 8),
(235, 1, 7, 10),
(236, 1, 7, 11),
(237, 1, 7, 31),
(238, 1, 7, 18),
(239, 1, 7, 17),
(240, 1, 7, 19),
(241, 1, 7, 34),
(242, 1, 7, 32),
(243, 1, 7, 33),
(244, 1, 7, 35),
(245, 1, 7, 20),
(246, 1, 7, 36),
(247, 1, 7, 22),
(248, 1, 7, 23),
(249, 1, 7, 24),
(250, 1, 7, 25),
(251, 1, 7, 26),
(252, 1, 7, 27),
(253, 1, 8, 28),
(254, 1, 8, 29),
(255, 1, 8, 7),
(256, 1, 8, 12),
(257, 1, 8, 13),
(258, 1, 8, 14),
(259, 1, 8, 15),
(260, 1, 8, 16),
(261, 1, 8, 30),
(262, 1, 8, 8),
(263, 1, 8, 10),
(264, 1, 8, 11),
(265, 1, 8, 31),
(266, 1, 8, 18),
(267, 1, 8, 17),
(268, 1, 8, 19),
(269, 1, 8, 34),
(270, 1, 8, 32),
(271, 1, 8, 33),
(272, 1, 8, 35),
(273, 1, 8, 20),
(274, 1, 8, 36),
(275, 1, 8, 22),
(276, 1, 8, 23),
(277, 1, 8, 24),
(278, 1, 8, 25),
(279, 1, 8, 26),
(280, 1, 8, 27),
(281, 1, 1, 37),
(282, 1, 6, 37),
(283, 1, 10, 28),
(284, 1, 10, 29),
(285, 1, 10, 7),
(286, 1, 10, 12),
(287, 1, 10, 13),
(288, 1, 10, 14),
(289, 1, 10, 15),
(290, 1, 10, 16),
(291, 1, 10, 30),
(292, 1, 10, 8),
(293, 1, 10, 10),
(294, 1, 10, 11),
(295, 1, 10, 31),
(296, 1, 10, 18),
(297, 1, 10, 17),
(298, 1, 10, 19),
(299, 1, 10, 34),
(300, 1, 10, 32),
(301, 1, 10, 33),
(302, 1, 10, 35),
(303, 1, 10, 20),
(304, 1, 10, 36),
(305, 0, 10, 37),
(306, 1, 10, 22),
(307, 1, 10, 23),
(308, 1, 10, 24),
(309, 1, 10, 25),
(310, 1, 10, 26),
(311, 0, 8, 37),
(312, 1, 10, 7),
(313, 1, 10, 28),
(314, 1, 10, 29),
(315, 0, 10, 8),
(316, 0, 10, 10),
(317, 0, 10, 11),
(318, 0, 10, 31),
(319, 1, 10, 12),
(320, 1, 10, 13),
(321, 1, 10, 14),
(322, 1, 10, 15),
(323, 1, 10, 16),
(324, 1, 10, 30),
(325, 0, 10, 17),
(326, 0, 10, 18),
(327, 0, 10, 19),
(328, 0, 10, 20),
(329, 0, 10, 32),
(330, 0, 10, 33),
(331, 0, 10, 34),
(332, 0, 10, 35),
(333, 0, 10, 36),
(334, 0, 10, 37),
(335, 1, 10, 22),
(336, 1, 10, 23),
(337, 1, 10, 24),
(338, 1, 10, 25),
(339, 1, 10, 26),
(340, 0, 9, 37),
(341, 0, 2, 37),
(342, 1, 1, 38),
(343, 0, 11, 7),
(344, 0, 11, 28),
(345, 0, 11, 29),
(346, 0, 11, 38),
(347, 0, 11, 8),
(348, 0, 11, 10),
(349, 0, 11, 11),
(350, 0, 11, 31),
(351, 0, 11, 12),
(352, 0, 11, 13),
(353, 0, 11, 14),
(354, 0, 11, 15),
(355, 0, 11, 16),
(356, 0, 11, 30),
(357, 0, 11, 17),
(358, 0, 11, 18),
(359, 0, 11, 19),
(360, 0, 11, 20),
(361, 0, 11, 32),
(362, 0, 11, 33),
(363, 0, 11, 34),
(364, 0, 11, 35),
(365, 0, 11, 36),
(366, 0, 11, 37),
(367, 0, 11, 22),
(368, 0, 11, 23),
(369, 0, 11, 24),
(370, 0, 11, 25),
(371, 0, 11, 26),
(372, 1, 12, 7),
(373, 1, 12, 28),
(374, 1, 12, 29),
(375, 1, 12, 38),
(376, 1, 12, 8),
(377, 1, 12, 10),
(378, 1, 12, 11),
(379, 1, 12, 31),
(380, 1, 12, 12),
(381, 1, 12, 13),
(382, 1, 12, 14),
(383, 1, 12, 15),
(384, 1, 12, 16),
(385, 1, 12, 30),
(386, 1, 12, 17),
(387, 1, 12, 18),
(388, 0, 12, 19),
(389, 0, 12, 20),
(390, 0, 12, 32),
(391, 0, 12, 33),
(392, 0, 12, 34),
(393, 0, 12, 35),
(394, 0, 12, 36),
(395, 0, 12, 37),
(396, 1, 12, 22),
(397, 1, 12, 23),
(398, 1, 12, 24),
(399, 1, 12, 25),
(400, 1, 12, 26),
(401, 1, 2, 38),
(402, 1, 1, 39),
(403, 1, 2, 39),
(404, 0, 9, 38),
(405, 0, 9, 39),
(406, 1, 1, 40),
(407, 1, 1, 41),
(408, 1, 1, 42),
(409, 1, 1, 43),
(410, 1, 6, 38),
(411, 1, 6, 40),
(412, 1, 6, 43),
(413, 1, 6, 41),
(414, 1, 6, 39),
(415, 1, 6, 42),
(416, 1, 2, 40),
(417, 1, 2, 43),
(418, 1, 2, 41),
(419, 1, 2, 42),
(420, 1, 1, 44),
(421, 1, 1, 45),
(422, 1, 1, 46),
(423, 1, 1, 47),
(424, 1, 1, 48),
(425, 1, 1, 49),
(426, 1, 1, 50),
(427, 0, 13, 7),
(428, 1, 13, 28),
(429, 0, 13, 29),
(430, 0, 13, 38),
(431, 0, 13, 45),
(432, 0, 13, 8),
(433, 0, 13, 10),
(434, 0, 13, 11),
(435, 0, 13, 31),
(436, 0, 13, 50),
(437, 0, 13, 12),
(438, 0, 13, 13),
(439, 0, 13, 14),
(440, 0, 13, 15),
(441, 0, 13, 16),
(442, 0, 13, 30),
(443, 0, 13, 40),
(444, 0, 13, 43),
(445, 0, 13, 48),
(446, 0, 13, 17),
(447, 0, 13, 18),
(448, 0, 13, 19),
(449, 0, 13, 20),
(450, 0, 13, 32),
(451, 0, 13, 33),
(452, 0, 13, 34),
(453, 0, 13, 35),
(454, 0, 13, 36),
(455, 0, 13, 41),
(456, 0, 13, 39),
(457, 0, 13, 42),
(458, 0, 13, 44),
(459, 0, 13, 22),
(460, 0, 13, 23),
(461, 0, 13, 24),
(462, 0, 13, 25),
(463, 0, 13, 46),
(464, 0, 13, 47),
(465, 0, 13, 49),
(466, 0, 13, 26),
(467, 0, 9, 45),
(468, 0, 9, 50),
(469, 0, 9, 40),
(470, 0, 9, 43),
(471, 0, 9, 48),
(472, 0, 9, 46),
(473, 0, 9, 47),
(474, 0, 9, 49),
(475, 1, 1, 52),
(476, 1, 1, 54),
(477, 1, 1, 56),
(478, 1, 1, 57),
(479, 1, 1, 58),
(480, 1, 1, 59),
(481, 1, 1, 60),
(482, 1, 1, 61),
(483, 1, 1, 62),
(484, 1, 1, 63),
(485, 1, 1, 64),
(486, 1, 1, 65),
(487, 1, 1, 66),
(488, 1, 1, 67),
(489, 1, 1, 68),
(490, 1, 1, 69),
(491, 1, 1, 70),
(492, 1, 1, 71),
(493, 1, 1, 72),
(494, 1, 1, 73),
(495, 1, 1, 74),
(496, 1, 1, 75),
(497, 1, 1, 76),
(498, 1, 1, 77),
(499, 1, 1, 78),
(500, 1, 1, 81),
(501, 1, 1, 84),
(502, 1, 1, 83),
(503, 1, 1, 85),
(504, 1, 1, 87),
(505, 1, 1, 88),
(506, 1, 1, 89),
(507, 1, 1, 90),
(508, 1, 1, 91),
(509, 1, 1, 93),
(510, 1, 1, 94),
(511, 1, 1, 95),
(512, 1, 1, 96),
(513, 1, 1, 97),
(514, 1, 1, 98),
(515, 1, 1, 99),
(516, 1, 1, 100),
(517, 1, 1, 101),
(518, 1, 1, 102),
(519, 1, 1, 103),
(520, 1, 1, 104),
(521, 1, 1, 105),
(522, 1, 1, 106),
(523, 1, 1, 107),
(524, 1, 1, 55),
(525, 1, 1, 79),
(526, 1, 1, 80),
(527, 1, 1, 82);

--
-- Індекси збережених таблиць
--

--
-- Індекси таблиці `osc_about_page`
--
ALTER TABLE `osc_about_page`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `osc_admin_menu`
--
ALTER TABLE `osc_admin_menu`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `osc_articles`
--
ALTER TABLE `osc_articles`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `osc_article_comments`
--
ALTER TABLE `osc_article_comments`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `osc_article_images_alts`
--
ALTER TABLE `osc_article_images_alts`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `osc_banners`
--
ALTER TABLE `osc_banners`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `osc_bp_questions`
--
ALTER TABLE `osc_bp_questions`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `osc_bp_subscriptions`
--
ALTER TABLE `osc_bp_subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `osc_categories`
--
ALTER TABLE `osc_categories`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `osc_config`
--
ALTER TABLE `osc_config`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `osc_contacts_page`
--
ALTER TABLE `osc_contacts_page`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `osc_copy_history`
--
ALTER TABLE `osc_copy_history`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `osc_ct_banner`
--
ALTER TABLE `osc_ct_banner`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `osc_ct_equip`
--
ALTER TABLE `osc_ct_equip`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `osc_ct_equip_items`
--
ALTER TABLE `osc_ct_equip_items`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `osc_ct_gallery`
--
ALTER TABLE `osc_ct_gallery`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `osc_ct_gallery_items`
--
ALTER TABLE `osc_ct_gallery_items`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `osc_ct_genplan`
--
ALTER TABLE `osc_ct_genplan`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `osc_ct_genplan_statuses`
--
ALTER TABLE `osc_ct_genplan_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `osc_ct_reasons`
--
ALTER TABLE `osc_ct_reasons`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `osc_db_structure`
--
ALTER TABLE `osc_db_structure`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `osc_dialog_files_ref`
--
ALTER TABLE `osc_dialog_files_ref`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `osc_docs_files`
--
ALTER TABLE `osc_docs_files`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `osc_docs_ref`
--
ALTER TABLE `osc_docs_ref`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `osc_email_logs`
--
ALTER TABLE `osc_email_logs`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `osc_event_recall`
--
ALTER TABLE `osc_event_recall`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `osc_faq`
--
ALTER TABLE `osc_faq`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `osc_files_ref`
--
ALTER TABLE `osc_files_ref`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `osc_forgot_password_hash`
--
ALTER TABLE `osc_forgot_password_hash`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `osc_galleries`
--
ALTER TABLE `osc_galleries`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `osc_home_ban`
--
ALTER TABLE `osc_home_ban`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `osc_home_common`
--
ALTER TABLE `osc_home_common`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `osc_home_dev`
--
ALTER TABLE `osc_home_dev`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `osc_home_env`
--
ALTER TABLE `osc_home_env`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `osc_home_env_items`
--
ALTER TABLE `osc_home_env_items`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `osc_home_gal`
--
ALTER TABLE `osc_home_gal`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `osc_home_infrasctucture`
--
ALTER TABLE `osc_home_infrasctucture`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `osc_home_infrasctucture_items`
--
ALTER TABLE `osc_home_infrasctucture_items`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `osc_income_questions`
--
ALTER TABLE `osc_income_questions`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `osc_languages`
--
ALTER TABLE `osc_languages`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `osc_logs`
--
ALTER TABLE `osc_logs`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `osc_log_types`
--
ALTER TABLE `osc_log_types`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `osc_menu`
--
ALTER TABLE `osc_menu`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `osc_menu_home`
--
ALTER TABLE `osc_menu_home`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `osc_menu_pages_ref`
--
ALTER TABLE `osc_menu_pages_ref`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `osc_message_statuses`
--
ALTER TABLE `osc_message_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `osc_message_types`
--
ALTER TABLE `osc_message_types`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `osc_meta_table`
--
ALTER TABLE `osc_meta_table`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `osc_page_cottages`
--
ALTER TABLE `osc_page_cottages`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `osc_page_news`
--
ALTER TABLE `osc_page_news`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `osc_page_news_cats`
--
ALTER TABLE `osc_page_news_cats`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `osc_page_news_files`
--
ALTER TABLE `osc_page_news_files`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `osc_page_news_items`
--
ALTER TABLE `osc_page_news_items`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `osc_page_program`
--
ALTER TABLE `osc_page_program`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `osc_page_program_items`
--
ALTER TABLE `osc_page_program_items`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `osc_recall`
--
ALTER TABLE `osc_recall`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `osc_site_languages`
--
ALTER TABLE `osc_site_languages`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `osc_site_positions`
--
ALTER TABLE `osc_site_positions`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `osc_static_translations`
--
ALTER TABLE `osc_static_translations`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `osc_subscriptions`
--
ALTER TABLE `osc_subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `osc_sys_appointments`
--
ALTER TABLE `osc_sys_appointments`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `osc_sys_bp_cats`
--
ALTER TABLE `osc_sys_bp_cats`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `osc_sys_bp_entries`
--
ALTER TABLE `osc_sys_bp_entries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `house_id` (`cat`);

--
-- Індекси таблиці `osc_sys_bp_photos`
--
ALTER TABLE `osc_sys_bp_photos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entry_id` (`entry_id`);

--
-- Індекси таблиці `osc_sys_contact_form`
--
ALTER TABLE `osc_sys_contact_form`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `osc_sys_docs`
--
ALTER TABLE `osc_sys_docs`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `osc_sys_doc_cats`
--
ALTER TABLE `osc_sys_doc_cats`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `osc_sys_env_coords`
--
ALTER TABLE `osc_sys_env_coords`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `osc_sys_events`
--
ALTER TABLE `osc_sys_events`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `osc_sys_flats`
--
ALTER TABLE `osc_sys_flats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `osc_sys_flats_layouts_ibfk_1` (`house_id`),
  ADD KEY `room_id` (`room_id`);

--
-- Індекси таблиці `osc_sys_flats_layouts`
--
ALTER TABLE `osc_sys_flats_layouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `flat_id` (`flat_id`);

--
-- Індекси таблиці `osc_sys_houses`
--
ALTER TABLE `osc_sys_houses`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `osc_sys_house_gal`
--
ALTER TABLE `osc_sys_house_gal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `house_id` (`house_id`);

--
-- Індекси таблиці `osc_sys_house_slides`
--
ALTER TABLE `osc_sys_house_slides`
  ADD PRIMARY KEY (`id`),
  ADD KEY `house_id` (`house_id`);

--
-- Індекси таблиці `osc_sys_manager`
--
ALTER TABLE `osc_sys_manager`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `osc_sys_manager_menu`
--
ALTER TABLE `osc_sys_manager_menu`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `osc_sys_projects`
--
ALTER TABLE `osc_sys_projects`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `osc_sys_rooms`
--
ALTER TABLE `osc_sys_rooms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `osc_sys_rooms_ibfk_1` (`house_id`);

--
-- Індекси таблиці `osc_tables_info`
--
ALTER TABLE `osc_tables_info`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `osc_tasks`
--
ALTER TABLE `osc_tasks`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `osc_task_admin_ref`
--
ALTER TABLE `osc_task_admin_ref`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `osc_th_blocks`
--
ALTER TABLE `osc_th_blocks`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `osc_th_blocks_items`
--
ALTER TABLE `osc_th_blocks_items`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `osc_th_floors`
--
ALTER TABLE `osc_th_floors`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `osc_th_gal`
--
ALTER TABLE `osc_th_gal`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `osc_th_layouts`
--
ALTER TABLE `osc_th_layouts`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `osc_th_layouts_items`
--
ALTER TABLE `osc_th_layouts_items`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `osc_th_page`
--
ALTER TABLE `osc_th_page`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `osc_th_tabs`
--
ALTER TABLE `osc_th_tabs`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `osc_total_config`
--
ALTER TABLE `osc_total_config`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `osc_transfer`
--
ALTER TABLE `osc_transfer`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `osc_translate`
--
ALTER TABLE `osc_translate`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `osc_users`
--
ALTER TABLE `osc_users`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `osc_users_chat`
--
ALTER TABLE `osc_users_chat`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `osc_users_dialogs`
--
ALTER TABLE `osc_users_dialogs`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `osc_users_types`
--
ALTER TABLE `osc_users_types`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `osc_user_type_access`
--
ALTER TABLE `osc_user_type_access`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для збережених таблиць
--

--
-- AUTO_INCREMENT для таблиці `osc_about_page`
--
ALTER TABLE `osc_about_page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблиці `osc_admin_menu`
--
ALTER TABLE `osc_admin_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT для таблиці `osc_articles`
--
ALTER TABLE `osc_articles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблиці `osc_article_comments`
--
ALTER TABLE `osc_article_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблиці `osc_article_images_alts`
--
ALTER TABLE `osc_article_images_alts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблиці `osc_banners`
--
ALTER TABLE `osc_banners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблиці `osc_bp_questions`
--
ALTER TABLE `osc_bp_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблиці `osc_bp_subscriptions`
--
ALTER TABLE `osc_bp_subscriptions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT для таблиці `osc_categories`
--
ALTER TABLE `osc_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблиці `osc_config`
--
ALTER TABLE `osc_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблиці `osc_contacts_page`
--
ALTER TABLE `osc_contacts_page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблиці `osc_copy_history`
--
ALTER TABLE `osc_copy_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблиці `osc_ct_banner`
--
ALTER TABLE `osc_ct_banner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблиці `osc_ct_equip`
--
ALTER TABLE `osc_ct_equip`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблиці `osc_ct_equip_items`
--
ALTER TABLE `osc_ct_equip_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблиці `osc_ct_gallery`
--
ALTER TABLE `osc_ct_gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблиці `osc_ct_gallery_items`
--
ALTER TABLE `osc_ct_gallery_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблиці `osc_ct_genplan`
--
ALTER TABLE `osc_ct_genplan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT для таблиці `osc_ct_genplan_statuses`
--
ALTER TABLE `osc_ct_genplan_statuses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблиці `osc_ct_reasons`
--
ALTER TABLE `osc_ct_reasons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблиці `osc_db_structure`
--
ALTER TABLE `osc_db_structure`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблиці `osc_dialog_files_ref`
--
ALTER TABLE `osc_dialog_files_ref`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблиці `osc_docs_files`
--
ALTER TABLE `osc_docs_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT для таблиці `osc_docs_ref`
--
ALTER TABLE `osc_docs_ref`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблиці `osc_email_logs`
--
ALTER TABLE `osc_email_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблиці `osc_event_recall`
--
ALTER TABLE `osc_event_recall`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT для таблиці `osc_faq`
--
ALTER TABLE `osc_faq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблиці `osc_files_ref`
--
ALTER TABLE `osc_files_ref`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблиці `osc_forgot_password_hash`
--
ALTER TABLE `osc_forgot_password_hash`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблиці `osc_galleries`
--
ALTER TABLE `osc_galleries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблиці `osc_home_ban`
--
ALTER TABLE `osc_home_ban`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблиці `osc_home_common`
--
ALTER TABLE `osc_home_common`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблиці `osc_home_dev`
--
ALTER TABLE `osc_home_dev`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблиці `osc_home_env`
--
ALTER TABLE `osc_home_env`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблиці `osc_home_env_items`
--
ALTER TABLE `osc_home_env_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT для таблиці `osc_home_gal`
--
ALTER TABLE `osc_home_gal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблиці `osc_home_infrasctucture`
--
ALTER TABLE `osc_home_infrasctucture`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблиці `osc_home_infrasctucture_items`
--
ALTER TABLE `osc_home_infrasctucture_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблиці `osc_income_questions`
--
ALTER TABLE `osc_income_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблиці `osc_languages`
--
ALTER TABLE `osc_languages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=136;

--
-- AUTO_INCREMENT для таблиці `osc_logs`
--
ALTER TABLE `osc_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=249;

--
-- AUTO_INCREMENT для таблиці `osc_log_types`
--
ALTER TABLE `osc_log_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблиці `osc_menu`
--
ALTER TABLE `osc_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблиці `osc_menu_home`
--
ALTER TABLE `osc_menu_home`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблиці `osc_menu_pages_ref`
--
ALTER TABLE `osc_menu_pages_ref`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT для таблиці `osc_message_statuses`
--
ALTER TABLE `osc_message_statuses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблиці `osc_message_types`
--
ALTER TABLE `osc_message_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблиці `osc_meta_table`
--
ALTER TABLE `osc_meta_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблиці `osc_page_cottages`
--
ALTER TABLE `osc_page_cottages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблиці `osc_page_news`
--
ALTER TABLE `osc_page_news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблиці `osc_page_news_cats`
--
ALTER TABLE `osc_page_news_cats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблиці `osc_page_news_files`
--
ALTER TABLE `osc_page_news_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=236;

--
-- AUTO_INCREMENT для таблиці `osc_page_news_items`
--
ALTER TABLE `osc_page_news_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT для таблиці `osc_page_program`
--
ALTER TABLE `osc_page_program`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблиці `osc_page_program_items`
--
ALTER TABLE `osc_page_program_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблиці `osc_recall`
--
ALTER TABLE `osc_recall`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблиці `osc_site_languages`
--
ALTER TABLE `osc_site_languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблиці `osc_site_positions`
--
ALTER TABLE `osc_site_positions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблиці `osc_static_translations`
--
ALTER TABLE `osc_static_translations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблиці `osc_subscriptions`
--
ALTER TABLE `osc_subscriptions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблиці `osc_sys_appointments`
--
ALTER TABLE `osc_sys_appointments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблиці `osc_sys_bp_cats`
--
ALTER TABLE `osc_sys_bp_cats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблиці `osc_sys_bp_entries`
--
ALTER TABLE `osc_sys_bp_entries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT для таблиці `osc_sys_bp_photos`
--
ALTER TABLE `osc_sys_bp_photos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT для таблиці `osc_sys_contact_form`
--
ALTER TABLE `osc_sys_contact_form`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблиці `osc_sys_docs`
--
ALTER TABLE `osc_sys_docs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT для таблиці `osc_sys_doc_cats`
--
ALTER TABLE `osc_sys_doc_cats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT для таблиці `osc_sys_env_coords`
--
ALTER TABLE `osc_sys_env_coords`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблиці `osc_sys_events`
--
ALTER TABLE `osc_sys_events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблиці `osc_sys_flats`
--
ALTER TABLE `osc_sys_flats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT для таблиці `osc_sys_flats_layouts`
--
ALTER TABLE `osc_sys_flats_layouts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT для таблиці `osc_sys_houses`
--
ALTER TABLE `osc_sys_houses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблиці `osc_sys_house_gal`
--
ALTER TABLE `osc_sys_house_gal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT для таблиці `osc_sys_house_slides`
--
ALTER TABLE `osc_sys_house_slides`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT для таблиці `osc_sys_manager`
--
ALTER TABLE `osc_sys_manager`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблиці `osc_sys_manager_menu`
--
ALTER TABLE `osc_sys_manager_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблиці `osc_sys_projects`
--
ALTER TABLE `osc_sys_projects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблиці `osc_sys_rooms`
--
ALTER TABLE `osc_sys_rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT для таблиці `osc_tables_info`
--
ALTER TABLE `osc_tables_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=160;

--
-- AUTO_INCREMENT для таблиці `osc_tasks`
--
ALTER TABLE `osc_tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблиці `osc_task_admin_ref`
--
ALTER TABLE `osc_task_admin_ref`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблиці `osc_th_blocks`
--
ALTER TABLE `osc_th_blocks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблиці `osc_th_blocks_items`
--
ALTER TABLE `osc_th_blocks_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT для таблиці `osc_th_floors`
--
ALTER TABLE `osc_th_floors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблиці `osc_th_gal`
--
ALTER TABLE `osc_th_gal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT для таблиці `osc_th_layouts`
--
ALTER TABLE `osc_th_layouts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT для таблиці `osc_th_layouts_items`
--
ALTER TABLE `osc_th_layouts_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT для таблиці `osc_th_page`
--
ALTER TABLE `osc_th_page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблиці `osc_th_tabs`
--
ALTER TABLE `osc_th_tabs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблиці `osc_total_config`
--
ALTER TABLE `osc_total_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблиці `osc_transfer`
--
ALTER TABLE `osc_transfer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблиці `osc_translate`
--
ALTER TABLE `osc_translate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблиці `osc_users`
--
ALTER TABLE `osc_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблиці `osc_users_chat`
--
ALTER TABLE `osc_users_chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблиці `osc_users_dialogs`
--
ALTER TABLE `osc_users_dialogs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблиці `osc_users_types`
--
ALTER TABLE `osc_users_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблиці `osc_user_type_access`
--
ALTER TABLE `osc_user_type_access`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=528;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
