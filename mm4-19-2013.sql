/*
SQLyog Ultimate v8.55 
MySQL - 5.5.27 : Database - test_mon
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`test_mon` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `test_mon`;

/*Table structure for table `exp_accessories` */

DROP TABLE IF EXISTS `exp_accessories`;

CREATE TABLE `exp_accessories` (
  `accessory_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(75) NOT NULL DEFAULT '',
  `member_groups` varchar(50) NOT NULL DEFAULT 'all',
  `controllers` text,
  `accessory_version` varchar(12) NOT NULL,
  PRIMARY KEY (`accessory_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `exp_accessories` */

insert  into `exp_accessories`(`accessory_id`,`class`,`member_groups`,`controllers`,`accessory_version`) values (1,'Expressionengine_info_acc','1|5','addons|addons_accessories|addons_extensions|addons_fieldtypes|addons_modules|addons_plugins|admin_content|admin_system|content|content_edit|content_files|content_files_modal|content_publish|design|homepage|members|myaccount|tools|tools_communicate|tools_data|tools_logs|tools_utilities','1.0');

/*Table structure for table `exp_actions` */

DROP TABLE IF EXISTS `exp_actions`;

CREATE TABLE `exp_actions` (
  `action_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(50) NOT NULL,
  `method` varchar(50) NOT NULL,
  PRIMARY KEY (`action_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

/*Data for the table `exp_actions` */

insert  into `exp_actions`(`action_id`,`class`,`method`) values (1,'Comment','insert_new_comment'),(2,'Comment_mcp','delete_comment_notification'),(3,'Comment','comment_subscribe'),(4,'Comment','edit_comment'),(5,'Email','send_email'),(6,'Safecracker','submit_entry'),(7,'Safecracker','combo_loader'),(8,'Search','do_search'),(9,'Simple_commerce','incoming_ipn'),(10,'Channel','insert_new_entry'),(11,'Channel','filemanager_endpoint'),(12,'Channel','smiley_pop'),(13,'Member','registration_form'),(14,'Member','register_member'),(15,'Member','activate_member'),(16,'Member','member_login'),(17,'Member','member_logout'),(18,'Member','retrieve_password'),(19,'Member','reset_password'),(20,'Member','send_member_email'),(21,'Member','update_un_pw'),(22,'Member','member_search'),(23,'Member','member_delete'),(24,'Rte','get_js');

/*Table structure for table `exp_blacklisted` */

DROP TABLE IF EXISTS `exp_blacklisted`;

CREATE TABLE `exp_blacklisted` (
  `blacklisted_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `blacklisted_type` varchar(20) DEFAULT NULL,
  `blacklisted_value` longtext,
  PRIMARY KEY (`blacklisted_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `exp_blacklisted` */

/*Table structure for table `exp_captcha` */

DROP TABLE IF EXISTS `exp_captcha`;

CREATE TABLE `exp_captcha` (
  `captcha_id` bigint(13) unsigned NOT NULL AUTO_INCREMENT,
  `date` int(10) unsigned NOT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `word` varchar(20) NOT NULL,
  PRIMARY KEY (`captcha_id`),
  KEY `word` (`word`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `exp_captcha` */

/*Table structure for table `exp_categories` */

DROP TABLE IF EXISTS `exp_categories`;

CREATE TABLE `exp_categories` (
  `cat_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(6) unsigned NOT NULL,
  `parent_id` int(4) unsigned NOT NULL,
  `cat_name` varchar(100) NOT NULL,
  `cat_url_title` varchar(75) NOT NULL,
  `cat_description` text,
  `cat_image` varchar(120) DEFAULT NULL,
  `cat_order` int(4) unsigned NOT NULL,
  PRIMARY KEY (`cat_id`),
  KEY `group_id` (`group_id`),
  KEY `cat_name` (`cat_name`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `exp_categories` */

/*Table structure for table `exp_category_field_data` */

DROP TABLE IF EXISTS `exp_category_field_data`;

CREATE TABLE `exp_category_field_data` (
  `cat_id` int(4) unsigned NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(4) unsigned NOT NULL,
  PRIMARY KEY (`cat_id`),
  KEY `site_id` (`site_id`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `exp_category_field_data` */

/*Table structure for table `exp_category_fields` */

DROP TABLE IF EXISTS `exp_category_fields`;

CREATE TABLE `exp_category_fields` (
  `field_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(4) unsigned NOT NULL,
  `field_name` varchar(32) NOT NULL DEFAULT '',
  `field_label` varchar(50) NOT NULL DEFAULT '',
  `field_type` varchar(12) NOT NULL DEFAULT 'text',
  `field_list_items` text NOT NULL,
  `field_maxl` smallint(3) NOT NULL DEFAULT '128',
  `field_ta_rows` tinyint(2) NOT NULL DEFAULT '8',
  `field_default_fmt` varchar(40) NOT NULL DEFAULT 'none',
  `field_show_fmt` char(1) NOT NULL DEFAULT 'y',
  `field_text_direction` char(3) NOT NULL DEFAULT 'ltr',
  `field_required` char(1) NOT NULL DEFAULT 'n',
  `field_order` int(3) unsigned NOT NULL,
  PRIMARY KEY (`field_id`),
  KEY `site_id` (`site_id`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `exp_category_fields` */

/*Table structure for table `exp_category_groups` */

DROP TABLE IF EXISTS `exp_category_groups`;

CREATE TABLE `exp_category_groups` (
  `group_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_name` varchar(50) NOT NULL,
  `sort_order` char(1) NOT NULL DEFAULT 'a',
  `exclude_group` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_html_formatting` char(4) NOT NULL DEFAULT 'all',
  `can_edit_categories` text,
  `can_delete_categories` text,
  PRIMARY KEY (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `exp_category_groups` */

/*Table structure for table `exp_category_posts` */

DROP TABLE IF EXISTS `exp_category_posts`;

CREATE TABLE `exp_category_posts` (
  `entry_id` int(10) unsigned NOT NULL,
  `cat_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`entry_id`,`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `exp_category_posts` */

/*Table structure for table `exp_channel_data` */

DROP TABLE IF EXISTS `exp_channel_data`;

CREATE TABLE `exp_channel_data` (
  `entry_id` int(10) unsigned NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `channel_id` int(4) unsigned NOT NULL,
  `field_id_1` text,
  `field_ft_1` tinytext,
  `field_id_2` text,
  `field_ft_2` tinytext,
  `field_id_3` text,
  `field_ft_3` tinytext,
  `field_id_4` text,
  `field_ft_4` tinytext,
  `field_id_5` text,
  `field_ft_5` tinytext,
  `field_id_6` text,
  `field_ft_6` tinytext,
  `field_id_7` text,
  `field_ft_7` tinytext,
  `field_id_8` text,
  `field_ft_8` tinytext,
  `field_id_9` text,
  `field_ft_9` tinytext,
  `field_id_10` text,
  `field_ft_10` tinytext,
  `field_id_11` text,
  `field_ft_11` tinytext,
  PRIMARY KEY (`entry_id`),
  KEY `channel_id` (`channel_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `exp_channel_data` */

insert  into `exp_channel_data`(`entry_id`,`site_id`,`channel_id`,`field_id_1`,`field_ft_1`,`field_id_2`,`field_ft_2`,`field_id_3`,`field_ft_3`,`field_id_4`,`field_ft_4`,`field_id_5`,`field_ft_5`,`field_id_6`,`field_ft_6`,`field_id_7`,`field_ft_7`,`field_id_8`,`field_ft_8`,`field_id_9`,`field_ft_9`,`field_id_10`,`field_ft_10`,`field_id_11`,`field_ft_11`) values (1,1,1,'Barnes and Noble','none','Fort Worth, TX','none','May 16th, 2013','none','','none','','none','','none','','none','','none','','none','','none','','none'),(2,1,1,'Herron School of Art and Design','none','Indianapolis, In','none','May 16th, 2013','none','','none','','none','','none','','none','','none','','none','','none','','none'),(3,1,1,'Saginaw Valley State University','none','Saginaw, Michigan','none','May 16th, 2013','none','','none','','none','','none','','none','','none','','none','','none','','none'),(4,1,2,'',NULL,'',NULL,'',NULL,'Saving Italy','none','Brilliantly researched and vividly written, Saving Italy brings readers from Milan and the near destruction of The Last Supper to the inner sanctum of the Vatican and behind closed doors with the preeminent Allied and Axis leaders: Roosevelt, Eisenhower, and Churchill; Hitler, Göring, and Himmler.\n','none','<p>When Hitler’s armies occupied Italy in 1943, they also seized control of mankind’s greatest cultural treasures. As they had done throughout Europe, the Nazis could now plunder the masterpieces of the Renaissance, the treasures of the Vatican, and the antiquities of the Roman Empire.</p>\n\n<p>On the eve of the Allied invasion, General Dwight Eisenhower empowered a new kind of soldier to protect these historic riches. In May 1944 two unlikely American heroes—artist Deane Keller and scholar Fred Hartt—embarked from Naples on the treasure hunt of a lifetime, tracking billions of dollars of missing art, including works by Michelangelo, Donatello, Titian, Caravaggio, and Botticelli.</p>\n\n','none','<h3>Publishers Weekly</h3>\n<p>In this thrilling new history, Edsel (The Monuments Men) describes the valiant Allied efforts to safeguard the great cultural treasures of an Italy knee-deep in the violence of WWII. The story focuses on three groups: the British and American scholars who form the Allies’ Monuments, Fine Art and Archive (MFAA) team tasked with finding and protecting priceless stolen artworks; the Vatican clergy and museum directors responsible for the safety of their own collections; and the Nazi leaders who coveted Italy’s Titians, da Vincis, and Botticellis. The cast of colorful characters includes an “introverted, sensitive” Yale art professor, a conflicted former archaeologist turned SS officer, and a Tuscan “Superintendent of Monuments and Galleries” whose job it was to get the great artworks out of Florence (where they risked being destroyed by Allied bombings) and into the countryside. Edsel has compiled an astonishing amount of primary research from European and American sources to tell this fascinating, fast-paced story, and military and art historians, as well as fans of adventurous nonfiction, will appreciate this well-written and informative reminder that war threatens not only the generations who fight it, but also the artistic triumphs of those who came before. 60 illus. & maps. Agent: Michelle Weiner, Creative Artists Agency. (May)</p>\n\n','none','<h3>Tom Brokaw</h3>\n<p>“Saving Italy is an astonishing account of a little known American effort to save Italy’s vast store of priceless monuments and art during World War II. While American warriors were fighting the length of the country, other Americans were courageously working alongside to preserve the irreplaceable best of Italy’s culture. Read it and be proud of those who were on their own front lines of a cruel war.”</p>\n\n<h3>Carlo D\'Este</h3>\n<p>“An amazing story, superbly told. The narrative and research are exceptionally well done. Edsel has done a great service not only to tell the story of the Monuments Men and the work they did in Italy but also to remind mankind what the Germans did. I believe that Saving Italy is a major contribution to the history of World War II.”</p>\n\n<h3>Gordon H. \"Nick\" Mueller</h3>\n<p>“Robert Edsel weaves a suspenseful tale worthy of an Indiana Jones plot. He pulls you into a dangerous web of intrigue in which the Vatican, top German SS generals, American OSS operatives and Italian officials are entwined in top-secret negotiations to end the war. A must read for any WWII history enthusiast.”</p>','none','{filedir_2}saveitaly.png','none','<p>With the German army retreating up the Italian peninsula, orders came from the highest levels of the Nazi government to transport truckloads of art north across the border into the Reich. Standing in the way was General Karl Wolff, a top-level Nazi officer. As German forces blew up the magnificent bridges of Florence, General Wolff commandeered the great collections of the Uffizi Gallery and Pitti Palace, later risking his life to negotiate a secret Nazi surrender with American spymaster Allen Dulles.</p>','none','{filedir_2}savingitalyheadline.png','none');

/*Table structure for table `exp_channel_entries_autosave` */

DROP TABLE IF EXISTS `exp_channel_entries_autosave`;

CREATE TABLE `exp_channel_entries_autosave` (
  `entry_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `original_entry_id` int(10) unsigned NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `channel_id` int(4) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `pentry_id` int(10) NOT NULL DEFAULT '0',
  `forum_topic_id` int(10) unsigned DEFAULT NULL,
  `ip_address` varchar(45) NOT NULL,
  `title` varchar(100) NOT NULL,
  `url_title` varchar(75) NOT NULL,
  `status` varchar(50) NOT NULL,
  `versioning_enabled` char(1) NOT NULL DEFAULT 'n',
  `view_count_one` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_two` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_three` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_four` int(10) unsigned NOT NULL DEFAULT '0',
  `allow_comments` varchar(1) NOT NULL DEFAULT 'y',
  `sticky` varchar(1) NOT NULL DEFAULT 'n',
  `entry_date` int(10) NOT NULL,
  `dst_enabled` varchar(1) NOT NULL DEFAULT 'n',
  `year` char(4) NOT NULL,
  `month` char(2) NOT NULL,
  `day` char(3) NOT NULL,
  `expiration_date` int(10) NOT NULL DEFAULT '0',
  `comment_expiration_date` int(10) NOT NULL DEFAULT '0',
  `edit_date` bigint(14) DEFAULT NULL,
  `recent_comment_date` int(10) DEFAULT NULL,
  `comment_total` int(4) unsigned NOT NULL DEFAULT '0',
  `entry_data` text,
  PRIMARY KEY (`entry_id`),
  KEY `channel_id` (`channel_id`),
  KEY `author_id` (`author_id`),
  KEY `url_title` (`url_title`),
  KEY `status` (`status`),
  KEY `entry_date` (`entry_date`),
  KEY `expiration_date` (`expiration_date`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `exp_channel_entries_autosave` */

/*Table structure for table `exp_channel_fields` */

DROP TABLE IF EXISTS `exp_channel_fields`;

CREATE TABLE `exp_channel_fields` (
  `field_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(4) unsigned NOT NULL,
  `field_name` varchar(32) NOT NULL,
  `field_label` varchar(50) NOT NULL,
  `field_instructions` text,
  `field_type` varchar(50) NOT NULL DEFAULT 'text',
  `field_list_items` text NOT NULL,
  `field_pre_populate` char(1) NOT NULL DEFAULT 'n',
  `field_pre_channel_id` int(6) unsigned DEFAULT NULL,
  `field_pre_field_id` int(6) unsigned DEFAULT NULL,
  `field_related_to` varchar(12) NOT NULL DEFAULT 'channel',
  `field_related_id` int(6) unsigned NOT NULL DEFAULT '0',
  `field_related_orderby` varchar(12) NOT NULL DEFAULT 'date',
  `field_related_sort` varchar(4) NOT NULL DEFAULT 'desc',
  `field_related_max` smallint(4) NOT NULL DEFAULT '0',
  `field_ta_rows` tinyint(2) DEFAULT '8',
  `field_maxl` smallint(3) DEFAULT NULL,
  `field_required` char(1) NOT NULL DEFAULT 'n',
  `field_text_direction` char(3) NOT NULL DEFAULT 'ltr',
  `field_search` char(1) NOT NULL DEFAULT 'n',
  `field_is_hidden` char(1) NOT NULL DEFAULT 'n',
  `field_fmt` varchar(40) NOT NULL DEFAULT 'xhtml',
  `field_show_fmt` char(1) NOT NULL DEFAULT 'y',
  `field_order` int(3) unsigned NOT NULL,
  `field_content_type` varchar(20) NOT NULL DEFAULT 'any',
  `field_settings` text,
  PRIMARY KEY (`field_id`),
  KEY `group_id` (`group_id`),
  KEY `field_type` (`field_type`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `exp_channel_fields` */

insert  into `exp_channel_fields`(`field_id`,`site_id`,`group_id`,`field_name`,`field_label`,`field_instructions`,`field_type`,`field_list_items`,`field_pre_populate`,`field_pre_channel_id`,`field_pre_field_id`,`field_related_to`,`field_related_id`,`field_related_orderby`,`field_related_sort`,`field_related_max`,`field_ta_rows`,`field_maxl`,`field_required`,`field_text_direction`,`field_search`,`field_is_hidden`,`field_fmt`,`field_show_fmt`,`field_order`,`field_content_type`,`field_settings`) values (1,1,1,'event_title','Event Title','','text','','0',0,0,'channel',1,'title','desc',0,6,128,'y','ltr','y','n','none','n',1,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(2,1,1,'event_location','Event location','','text','','0',0,0,'channel',1,'title','desc',0,6,128,'y','ltr','n','n','none','n',2,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(3,1,1,'event_date','Event Date','','text','','0',0,0,'channel',1,'title','desc',0,6,128,'y','ltr','n','n','none','n',3,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(4,1,2,'main_title','main title','','text','','0',0,0,'channel',1,'title','desc',0,6,128,'y','ltr','n','n','none','n',1,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(5,1,2,'teaser','teaser','this is the teaser paragraph to the book/movie','textarea','','0',0,0,'channel',1,'title','desc',0,6,128,'n','ltr','n','n','none','n',2,'any','YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(6,1,2,'main_content','main content','the full description of the book/movie','textarea','','0',0,0,'channel',1,'title','desc',0,6,128,'n','ltr','n','n','none','n',3,'any','YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(7,1,2,'reviews','reviews','the reviews of the book/movie','textarea','','0',0,0,'channel',1,'title','desc',0,6,128,'n','ltr','n','n','none','n',4,'any','YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToieSI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(8,1,2,'reviews_two','reviews two','second column of reviews of the book/movie','textarea','','0',0,0,'channel',2,'title','desc',0,6,128,'n','ltr','n','n','none','n',5,'any','YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(9,1,2,'cover_image','Cover Image','cover photo of the book/movie','file','','0',0,0,'channel',2,'title','desc',0,6,128,'n','ltr','n','n','none','n',6,'any','YTo4OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6NToiaW1hZ2UiO3M6MTk6ImFsbG93ZWRfZGlyZWN0b3JpZXMiO3M6MToiMiI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MTk6ImZpZWxkX3Nob3dfZ2xvc3NhcnkiO3M6MToibiI7czoyMToiZmllbGRfc2hvd19zcGVsbGNoZWNrIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7czoxOiJuIjtzOjIwOiJmaWVsZF9zaG93X3dyaXRlbW9kZSI7czoxOiJuIjt9'),(10,1,2,'main_content_two','main content two','the second half of main content','textarea','','0',0,0,'channel',2,'title','desc',0,6,128,'n','ltr','n','n','none','n',3,'any','YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(11,1,2,'main_title_image','Main title image','this is the graphic for the main title','file','','0',0,0,'channel',2,'title','desc',0,6,128,'y','ltr','n','n','none','n',7,'any','YTo4OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6NToiaW1hZ2UiO3M6MTk6ImFsbG93ZWRfZGlyZWN0b3JpZXMiO3M6MToiMiI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MTk6ImZpZWxkX3Nob3dfZ2xvc3NhcnkiO3M6MToibiI7czoyMToiZmllbGRfc2hvd19zcGVsbGNoZWNrIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7czoxOiJuIjtzOjIwOiJmaWVsZF9zaG93X3dyaXRlbW9kZSI7czoxOiJuIjt9');

/*Table structure for table `exp_channel_member_groups` */

DROP TABLE IF EXISTS `exp_channel_member_groups`;

CREATE TABLE `exp_channel_member_groups` (
  `group_id` smallint(4) unsigned NOT NULL,
  `channel_id` int(6) unsigned NOT NULL,
  PRIMARY KEY (`group_id`,`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `exp_channel_member_groups` */

/*Table structure for table `exp_channel_titles` */

DROP TABLE IF EXISTS `exp_channel_titles`;

CREATE TABLE `exp_channel_titles` (
  `entry_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `channel_id` int(4) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `pentry_id` int(10) NOT NULL DEFAULT '0',
  `forum_topic_id` int(10) unsigned DEFAULT NULL,
  `ip_address` varchar(45) NOT NULL,
  `title` varchar(100) NOT NULL,
  `url_title` varchar(75) NOT NULL,
  `status` varchar(50) NOT NULL,
  `versioning_enabled` char(1) NOT NULL DEFAULT 'n',
  `view_count_one` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_two` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_three` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_four` int(10) unsigned NOT NULL DEFAULT '0',
  `allow_comments` varchar(1) NOT NULL DEFAULT 'y',
  `sticky` varchar(1) NOT NULL DEFAULT 'n',
  `entry_date` int(10) NOT NULL,
  `dst_enabled` varchar(1) NOT NULL DEFAULT 'n',
  `year` char(4) NOT NULL,
  `month` char(2) NOT NULL,
  `day` char(3) NOT NULL,
  `expiration_date` int(10) NOT NULL DEFAULT '0',
  `comment_expiration_date` int(10) NOT NULL DEFAULT '0',
  `edit_date` bigint(14) DEFAULT NULL,
  `recent_comment_date` int(10) DEFAULT NULL,
  `comment_total` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry_id`),
  KEY `channel_id` (`channel_id`),
  KEY `author_id` (`author_id`),
  KEY `url_title` (`url_title`),
  KEY `status` (`status`),
  KEY `entry_date` (`entry_date`),
  KEY `expiration_date` (`expiration_date`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `exp_channel_titles` */

insert  into `exp_channel_titles`(`entry_id`,`site_id`,`channel_id`,`author_id`,`pentry_id`,`forum_topic_id`,`ip_address`,`title`,`url_title`,`status`,`versioning_enabled`,`view_count_one`,`view_count_two`,`view_count_three`,`view_count_four`,`allow_comments`,`sticky`,`entry_date`,`dst_enabled`,`year`,`month`,`day`,`expiration_date`,`comment_expiration_date`,`edit_date`,`recent_comment_date`,`comment_total`) values (1,1,1,1,0,NULL,'::1','Barnes and Noble','barnes-and-noble','open','y',0,0,0,0,'n','n',1366315922,'n','2013','04','18',1368994442,0,20130418203303,0,0),(2,1,1,1,0,NULL,'::1','Herron School of Art and Design','herron-school-of-art-and-design','open','y',0,0,0,0,'n','n',1366316965,'n','2013','04','18',1368822565,0,20130418203226,0,0),(3,1,1,1,0,NULL,'::1','Saginaw Valley State University','saginaw-valley-state-university','open','y',0,0,0,0,'n','n',1366317233,'n','2013','04','18',1368822833,0,20130418153353,0,0),(4,1,2,1,0,NULL,'::1','Saving Italy','saving-italy','open','y',0,0,0,0,'y','n',1366318098,'n','2013','04','18',0,0,20130419174019,0,0);

/*Table structure for table `exp_channels` */

DROP TABLE IF EXISTS `exp_channels`;

CREATE TABLE `exp_channels` (
  `channel_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `channel_name` varchar(40) NOT NULL,
  `channel_title` varchar(100) NOT NULL,
  `channel_url` varchar(100) NOT NULL,
  `channel_description` varchar(225) DEFAULT NULL,
  `channel_lang` varchar(12) NOT NULL,
  `total_entries` mediumint(8) NOT NULL DEFAULT '0',
  `total_comments` mediumint(8) NOT NULL DEFAULT '0',
  `last_entry_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_comment_date` int(10) unsigned NOT NULL DEFAULT '0',
  `cat_group` varchar(255) DEFAULT NULL,
  `status_group` int(4) unsigned DEFAULT NULL,
  `deft_status` varchar(50) NOT NULL DEFAULT 'open',
  `field_group` int(4) unsigned DEFAULT NULL,
  `search_excerpt` int(4) unsigned DEFAULT NULL,
  `deft_category` varchar(60) DEFAULT NULL,
  `deft_comments` char(1) NOT NULL DEFAULT 'y',
  `channel_require_membership` char(1) NOT NULL DEFAULT 'y',
  `channel_max_chars` int(5) unsigned DEFAULT NULL,
  `channel_html_formatting` char(4) NOT NULL DEFAULT 'all',
  `channel_allow_img_urls` char(1) NOT NULL DEFAULT 'y',
  `channel_auto_link_urls` char(1) NOT NULL DEFAULT 'n',
  `channel_notify` char(1) NOT NULL DEFAULT 'n',
  `channel_notify_emails` varchar(255) DEFAULT NULL,
  `comment_url` varchar(80) DEFAULT NULL,
  `comment_system_enabled` char(1) NOT NULL DEFAULT 'y',
  `comment_require_membership` char(1) NOT NULL DEFAULT 'n',
  `comment_use_captcha` char(1) NOT NULL DEFAULT 'n',
  `comment_moderate` char(1) NOT NULL DEFAULT 'n',
  `comment_max_chars` int(5) unsigned DEFAULT '5000',
  `comment_timelock` int(5) unsigned NOT NULL DEFAULT '0',
  `comment_require_email` char(1) NOT NULL DEFAULT 'y',
  `comment_text_formatting` char(5) NOT NULL DEFAULT 'xhtml',
  `comment_html_formatting` char(4) NOT NULL DEFAULT 'safe',
  `comment_allow_img_urls` char(1) NOT NULL DEFAULT 'n',
  `comment_auto_link_urls` char(1) NOT NULL DEFAULT 'y',
  `comment_notify` char(1) NOT NULL DEFAULT 'n',
  `comment_notify_authors` char(1) NOT NULL DEFAULT 'n',
  `comment_notify_emails` varchar(255) DEFAULT NULL,
  `comment_expiration` int(4) unsigned NOT NULL DEFAULT '0',
  `search_results_url` varchar(80) DEFAULT NULL,
  `ping_return_url` varchar(80) DEFAULT NULL,
  `show_button_cluster` char(1) NOT NULL DEFAULT 'y',
  `rss_url` varchar(80) DEFAULT NULL,
  `enable_versioning` char(1) NOT NULL DEFAULT 'n',
  `max_revisions` smallint(4) unsigned NOT NULL DEFAULT '10',
  `default_entry_title` varchar(100) DEFAULT NULL,
  `url_title_prefix` varchar(80) DEFAULT NULL,
  `live_look_template` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`channel_id`),
  KEY `cat_group` (`cat_group`),
  KEY `status_group` (`status_group`),
  KEY `field_group` (`field_group`),
  KEY `channel_name` (`channel_name`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `exp_channels` */

insert  into `exp_channels`(`channel_id`,`site_id`,`channel_name`,`channel_title`,`channel_url`,`channel_description`,`channel_lang`,`total_entries`,`total_comments`,`last_entry_date`,`last_comment_date`,`cat_group`,`status_group`,`deft_status`,`field_group`,`search_excerpt`,`deft_category`,`deft_comments`,`channel_require_membership`,`channel_max_chars`,`channel_html_formatting`,`channel_allow_img_urls`,`channel_auto_link_urls`,`channel_notify`,`channel_notify_emails`,`comment_url`,`comment_system_enabled`,`comment_require_membership`,`comment_use_captcha`,`comment_moderate`,`comment_max_chars`,`comment_timelock`,`comment_require_email`,`comment_text_formatting`,`comment_html_formatting`,`comment_allow_img_urls`,`comment_auto_link_urls`,`comment_notify`,`comment_notify_authors`,`comment_notify_emails`,`comment_expiration`,`search_results_url`,`ping_return_url`,`show_button_cluster`,`rss_url`,`enable_versioning`,`max_revisions`,`default_entry_title`,`url_title_prefix`,`live_look_template`) values (1,1,'upcoming_events','Upcoming Events','http://localhost/monmen/index.php','','en',3,0,1366317233,0,'',NULL,'open',1,NULL,'','y','y',NULL,'all','y','n','n','','','n','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n','',0,'','','y','','n',10,'','',0),(2,1,'books_movies','books-movies','http://localhost/monmen/index.php','','en',1,0,1366318098,0,'',NULL,'open',2,4,'','y','y',NULL,'all','y','n','n','','','y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n','',0,'','','y','','n',10,'','',0);

/*Table structure for table `exp_comment_subscriptions` */

DROP TABLE IF EXISTS `exp_comment_subscriptions`;

CREATE TABLE `exp_comment_subscriptions` (
  `subscription_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(10) unsigned DEFAULT NULL,
  `member_id` int(10) DEFAULT '0',
  `email` varchar(50) DEFAULT NULL,
  `subscription_date` varchar(10) DEFAULT NULL,
  `notification_sent` char(1) DEFAULT 'n',
  `hash` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`subscription_id`),
  KEY `entry_id` (`entry_id`),
  KEY `member_id` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `exp_comment_subscriptions` */

/*Table structure for table `exp_comments` */

DROP TABLE IF EXISTS `exp_comments`;

CREATE TABLE `exp_comments` (
  `comment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) DEFAULT '1',
  `entry_id` int(10) unsigned DEFAULT '0',
  `channel_id` int(4) unsigned DEFAULT '1',
  `author_id` int(10) unsigned DEFAULT '0',
  `status` char(1) DEFAULT '0',
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `url` varchar(75) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `comment_date` int(10) DEFAULT NULL,
  `edit_date` int(10) DEFAULT NULL,
  `comment` text,
  PRIMARY KEY (`comment_id`),
  KEY `entry_id` (`entry_id`),
  KEY `channel_id` (`channel_id`),
  KEY `author_id` (`author_id`),
  KEY `status` (`status`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `exp_comments` */

/*Table structure for table `exp_cp_log` */

DROP TABLE IF EXISTS `exp_cp_log`;

CREATE TABLE `exp_cp_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_id` int(10) unsigned NOT NULL,
  `username` varchar(32) NOT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `act_date` int(10) NOT NULL,
  `action` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `exp_cp_log` */

insert  into `exp_cp_log`(`id`,`site_id`,`member_id`,`username`,`ip_address`,`act_date`,`action`) values (1,1,1,'admin','::1',1366121978,'Logged in'),(2,1,1,'admin','::1',1366136222,'Logged in'),(3,1,1,'admin','::1',1366162638,'Logged in'),(4,1,1,'admin','::1',1366208688,'Logged in'),(5,1,1,'admin','::1',1366233809,'Channel Created:&nbsp;&nbsp;Upcoming Events'),(6,1,1,'admin','::1',1366294530,'Logged in'),(7,1,1,'admin','::1',1366315711,'Field Group Created:&nbsp;upcomingevents'),(8,1,1,'admin','::1',1366317798,'Field Group Created:&nbsp;books-movies'),(9,1,1,'admin','::1',1366318092,'Channel Created:&nbsp;&nbsp;Books-movies'),(10,1,1,'admin','::1',1366338003,'Logged in'),(11,1,1,'admin','::1',1366379102,'Logged in');

/*Table structure for table `exp_cp_search_index` */

DROP TABLE IF EXISTS `exp_cp_search_index`;

CREATE TABLE `exp_cp_search_index` (
  `search_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `controller` varchar(20) DEFAULT NULL,
  `method` varchar(50) DEFAULT NULL,
  `language` varchar(20) DEFAULT NULL,
  `access` varchar(50) DEFAULT NULL,
  `keywords` text,
  PRIMARY KEY (`search_id`),
  FULLTEXT KEY `keywords` (`keywords`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `exp_cp_search_index` */

/*Table structure for table `exp_developer_log` */

DROP TABLE IF EXISTS `exp_developer_log`;

CREATE TABLE `exp_developer_log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` int(10) unsigned NOT NULL,
  `viewed` char(1) NOT NULL DEFAULT 'n',
  `description` text,
  `function` varchar(100) DEFAULT NULL,
  `line` int(10) unsigned DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `deprecated_since` varchar(10) DEFAULT NULL,
  `use_instead` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `exp_developer_log` */

/*Table structure for table `exp_email_cache` */

DROP TABLE IF EXISTS `exp_email_cache`;

CREATE TABLE `exp_email_cache` (
  `cache_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `cache_date` int(10) unsigned NOT NULL DEFAULT '0',
  `total_sent` int(6) unsigned NOT NULL,
  `from_name` varchar(70) NOT NULL,
  `from_email` varchar(70) NOT NULL,
  `recipient` text NOT NULL,
  `cc` text NOT NULL,
  `bcc` text NOT NULL,
  `recipient_array` mediumtext NOT NULL,
  `subject` varchar(120) NOT NULL,
  `message` mediumtext NOT NULL,
  `plaintext_alt` mediumtext NOT NULL,
  `mailinglist` char(1) NOT NULL DEFAULT 'n',
  `mailtype` varchar(6) NOT NULL,
  `text_fmt` varchar(40) NOT NULL,
  `wordwrap` char(1) NOT NULL DEFAULT 'y',
  `priority` char(1) NOT NULL DEFAULT '3',
  PRIMARY KEY (`cache_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `exp_email_cache` */

/*Table structure for table `exp_email_cache_mg` */

DROP TABLE IF EXISTS `exp_email_cache_mg`;

CREATE TABLE `exp_email_cache_mg` (
  `cache_id` int(6) unsigned NOT NULL,
  `group_id` smallint(4) NOT NULL,
  PRIMARY KEY (`cache_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `exp_email_cache_mg` */

/*Table structure for table `exp_email_cache_ml` */

DROP TABLE IF EXISTS `exp_email_cache_ml`;

CREATE TABLE `exp_email_cache_ml` (
  `cache_id` int(6) unsigned NOT NULL,
  `list_id` smallint(4) NOT NULL,
  PRIMARY KEY (`cache_id`,`list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `exp_email_cache_ml` */

/*Table structure for table `exp_email_console_cache` */

DROP TABLE IF EXISTS `exp_email_console_cache`;

CREATE TABLE `exp_email_console_cache` (
  `cache_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `cache_date` int(10) unsigned NOT NULL DEFAULT '0',
  `member_id` int(10) unsigned NOT NULL,
  `member_name` varchar(50) NOT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `recipient` varchar(70) NOT NULL,
  `recipient_name` varchar(50) NOT NULL,
  `subject` varchar(120) NOT NULL,
  `message` mediumtext NOT NULL,
  PRIMARY KEY (`cache_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `exp_email_console_cache` */

/*Table structure for table `exp_email_tracker` */

DROP TABLE IF EXISTS `exp_email_tracker`;

CREATE TABLE `exp_email_tracker` (
  `email_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email_date` int(10) unsigned NOT NULL DEFAULT '0',
  `sender_ip` varchar(16) NOT NULL,
  `sender_email` varchar(75) NOT NULL,
  `sender_username` varchar(50) NOT NULL,
  `number_recipients` int(4) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`email_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `exp_email_tracker` */

/*Table structure for table `exp_entry_ping_status` */

DROP TABLE IF EXISTS `exp_entry_ping_status`;

CREATE TABLE `exp_entry_ping_status` (
  `entry_id` int(10) unsigned NOT NULL,
  `ping_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`entry_id`,`ping_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `exp_entry_ping_status` */

/*Table structure for table `exp_entry_versioning` */

DROP TABLE IF EXISTS `exp_entry_versioning`;

CREATE TABLE `exp_entry_versioning` (
  `version_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(10) unsigned NOT NULL,
  `channel_id` int(4) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL,
  `version_date` int(10) NOT NULL,
  `version_data` mediumtext NOT NULL,
  PRIMARY KEY (`version_id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `exp_entry_versioning` */

/*Table structure for table `exp_extensions` */

DROP TABLE IF EXISTS `exp_extensions`;

CREATE TABLE `exp_extensions` (
  `extension_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(50) NOT NULL DEFAULT '',
  `method` varchar(50) NOT NULL DEFAULT '',
  `hook` varchar(50) NOT NULL DEFAULT '',
  `settings` text NOT NULL,
  `priority` int(2) NOT NULL DEFAULT '10',
  `version` varchar(10) NOT NULL DEFAULT '',
  `enabled` char(1) NOT NULL DEFAULT 'y',
  PRIMARY KEY (`extension_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `exp_extensions` */

insert  into `exp_extensions`(`extension_id`,`class`,`method`,`hook`,`settings`,`priority`,`version`,`enabled`) values (1,'Safecracker_ext','form_declaration_modify_data','form_declaration_modify_data','',10,'2.1','y'),(2,'Rte_ext','myaccount_nav_setup','myaccount_nav_setup','',10,'1.0','y'),(3,'Rte_ext','cp_menu_array','cp_menu_array','',10,'1.0','y'),(4,'Rte_ext','publish_form_entry_data','publish_form_entry_data','',10,'1.0','y');

/*Table structure for table `exp_field_formatting` */

DROP TABLE IF EXISTS `exp_field_formatting`;

CREATE TABLE `exp_field_formatting` (
  `formatting_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(10) unsigned NOT NULL,
  `field_fmt` varchar(40) NOT NULL,
  PRIMARY KEY (`formatting_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

/*Data for the table `exp_field_formatting` */

insert  into `exp_field_formatting`(`formatting_id`,`field_id`,`field_fmt`) values (1,1,'none'),(2,1,'br'),(3,1,'xhtml'),(4,2,'none'),(5,2,'br'),(6,2,'xhtml'),(7,3,'none'),(8,3,'br'),(9,3,'xhtml'),(10,4,'none'),(11,4,'br'),(12,4,'xhtml'),(13,5,'none'),(14,5,'br'),(15,5,'xhtml'),(16,6,'none'),(17,6,'br'),(18,6,'xhtml'),(19,7,'none'),(20,7,'br'),(21,7,'xhtml'),(22,8,'none'),(23,8,'br'),(24,8,'xhtml'),(25,9,'none'),(26,9,'br'),(27,9,'xhtml'),(28,10,'none'),(29,10,'br'),(30,10,'xhtml'),(31,11,'none'),(32,11,'br'),(33,11,'xhtml');

/*Table structure for table `exp_field_groups` */

DROP TABLE IF EXISTS `exp_field_groups`;

CREATE TABLE `exp_field_groups` (
  `group_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_name` varchar(50) NOT NULL,
  PRIMARY KEY (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `exp_field_groups` */

insert  into `exp_field_groups`(`group_id`,`site_id`,`group_name`) values (1,1,'upcomingevents'),(2,1,'books-movies');

/*Table structure for table `exp_fieldtypes` */

DROP TABLE IF EXISTS `exp_fieldtypes`;

CREATE TABLE `exp_fieldtypes` (
  `fieldtype_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `version` varchar(12) NOT NULL,
  `settings` text,
  `has_global_settings` char(1) DEFAULT 'n',
  PRIMARY KEY (`fieldtype_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `exp_fieldtypes` */

insert  into `exp_fieldtypes`(`fieldtype_id`,`name`,`version`,`settings`,`has_global_settings`) values (1,'select','1.0','YTowOnt9','n'),(2,'text','1.0','YTowOnt9','n'),(3,'textarea','1.0','YTowOnt9','n'),(4,'date','1.0','YTowOnt9','n'),(5,'file','1.0','YTowOnt9','n'),(6,'multi_select','1.0','YTowOnt9','n'),(7,'checkboxes','1.0','YTowOnt9','n'),(8,'radio','1.0','YTowOnt9','n'),(9,'rel','1.0','YTowOnt9','n'),(10,'rte','1.0','YTowOnt9','n');

/*Table structure for table `exp_file_categories` */

DROP TABLE IF EXISTS `exp_file_categories`;

CREATE TABLE `exp_file_categories` (
  `file_id` int(10) unsigned DEFAULT NULL,
  `cat_id` int(10) unsigned DEFAULT NULL,
  `sort` int(10) unsigned DEFAULT '0',
  `is_cover` char(1) DEFAULT 'n',
  KEY `file_id` (`file_id`),
  KEY `cat_id` (`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `exp_file_categories` */

/*Table structure for table `exp_file_dimensions` */

DROP TABLE IF EXISTS `exp_file_dimensions`;

CREATE TABLE `exp_file_dimensions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned DEFAULT '1',
  `upload_location_id` int(4) unsigned DEFAULT NULL,
  `title` varchar(255) DEFAULT '',
  `short_name` varchar(255) DEFAULT '',
  `resize_type` varchar(50) DEFAULT '',
  `width` int(10) DEFAULT '0',
  `height` int(10) DEFAULT '0',
  `watermark_id` int(4) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `upload_location_id` (`upload_location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `exp_file_dimensions` */

/*Table structure for table `exp_file_watermarks` */

DROP TABLE IF EXISTS `exp_file_watermarks`;

CREATE TABLE `exp_file_watermarks` (
  `wm_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `wm_name` varchar(80) DEFAULT NULL,
  `wm_type` varchar(10) DEFAULT 'text',
  `wm_image_path` varchar(100) DEFAULT NULL,
  `wm_test_image_path` varchar(100) DEFAULT NULL,
  `wm_use_font` char(1) DEFAULT 'y',
  `wm_font` varchar(30) DEFAULT NULL,
  `wm_font_size` int(3) unsigned DEFAULT NULL,
  `wm_text` varchar(100) DEFAULT NULL,
  `wm_vrt_alignment` varchar(10) DEFAULT 'top',
  `wm_hor_alignment` varchar(10) DEFAULT 'left',
  `wm_padding` int(3) unsigned DEFAULT NULL,
  `wm_opacity` int(3) unsigned DEFAULT NULL,
  `wm_hor_offset` int(4) unsigned DEFAULT NULL,
  `wm_vrt_offset` int(4) unsigned DEFAULT NULL,
  `wm_x_transp` int(4) DEFAULT NULL,
  `wm_y_transp` int(4) DEFAULT NULL,
  `wm_font_color` varchar(7) DEFAULT NULL,
  `wm_use_drop_shadow` char(1) DEFAULT 'y',
  `wm_shadow_distance` int(3) unsigned DEFAULT NULL,
  `wm_shadow_color` varchar(7) DEFAULT NULL,
  PRIMARY KEY (`wm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `exp_file_watermarks` */

/*Table structure for table `exp_files` */

DROP TABLE IF EXISTS `exp_files`;

CREATE TABLE `exp_files` (
  `file_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned DEFAULT '1',
  `title` varchar(255) DEFAULT NULL,
  `upload_location_id` int(4) unsigned DEFAULT '0',
  `rel_path` varchar(255) DEFAULT NULL,
  `mime_type` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_size` int(10) DEFAULT '0',
  `description` text,
  `credit` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `uploaded_by_member_id` int(10) unsigned DEFAULT '0',
  `upload_date` int(10) DEFAULT NULL,
  `modified_by_member_id` int(10) unsigned DEFAULT '0',
  `modified_date` int(10) DEFAULT NULL,
  `file_hw_original` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`file_id`),
  KEY `upload_location_id` (`upload_location_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

/*Data for the table `exp_files` */

insert  into `exp_files`(`file_id`,`site_id`,`title`,`upload_location_id`,`rel_path`,`mime_type`,`file_name`,`file_size`,`description`,`credit`,`location`,`uploaded_by_member_id`,`upload_date`,`modified_by_member_id`,`modified_date`,`file_hw_original`) values (3,1,'home-cell-bg.jpg',1,'C:/xampp/htdocs/monmen/images/home/home-cell-bg.jpg','image/jpeg','home-cell-bg.jpg',36444,NULL,NULL,NULL,1,1366126383,1,1366126383,'604 1200'),(4,1,'mm-1.png',1,'C:/xampp/htdocs/monmen/images/home/mm-1.png','image/png','mm-1.png',143391,NULL,NULL,NULL,1,1366131709,1,1366131709,'332 498'),(8,1,'logo.png',1,'C:/xampp/htdocs/monmen/images/home/logo.png','image/png','logo.png',4956,NULL,NULL,NULL,1,1366142556,1,1366142556,'40 207'),(17,1,'slidenav0-a.png',1,'C:/xampp/htdocs/monmen/images/home/slidenav0-a.png','image/png','slidenav0-a.png',35953,NULL,NULL,NULL,1,1366218494,1,1366218494,'205 261'),(19,1,'slidenav1-a.png',1,'C:/xampp/htdocs/monmen/images/home/slidenav1-a.png','image/png','slidenav1-a.png',29430,NULL,NULL,NULL,1,1366218514,1,1366218514,'205 261'),(21,1,'slidenav2-a.png',1,'C:/xampp/htdocs/monmen/images/home/slidenav2-a.png','image/png','slidenav2-a.png',30474,NULL,NULL,NULL,1,1366218535,1,1366218535,'205 261'),(23,1,'slidenav3-a.png',1,'C:/xampp/htdocs/monmen/images/home/slidenav3-a.png','image/png','slidenav3-a.png',31119,NULL,NULL,NULL,1,1366218556,1,1366218556,'205 261'),(25,1,'slidenav1.png',1,'C:/xampp/htdocs/monmen/images/home/slidenav1.png','image/png','slidenav1.png',28785,NULL,NULL,NULL,1,1366221646,1,1366221646,'205 261'),(26,1,'slidenav2.png',1,'C:/xampp/htdocs/monmen/images/home/slidenav2.png','image/png','slidenav2.png',29829,NULL,NULL,NULL,1,1366221656,1,1366221656,'205 261'),(27,1,'slidenav3.png',1,'C:/xampp/htdocs/monmen/images/home/slidenav3.png','image/png','slidenav3.png',30802,NULL,NULL,NULL,1,1366221666,1,1366221666,'205 261'),(28,1,'slidenav0.png',1,'C:/xampp/htdocs/monmen/images/home/slidenav0.png','image/png','slidenav0.png',35338,NULL,NULL,NULL,1,1366221834,1,1366221834,'205 261'),(29,1,'navrule.gif',1,'C:/xampp/htdocs/monmen/images/home/navrule.gif','image/gif','navrule.gif',1096,NULL,NULL,NULL,1,1366235014,1,1366235014,'2 1'),(30,1,'heroimage1.png',1,'C:/xampp/htdocs/monmen/images/home/heroimage1.png','image/png','heroimage1.png',194499,NULL,NULL,NULL,1,1366310917,1,1366310917,'554 1200'),(31,1,'heroimage0.png',1,'C:/xampp/htdocs/monmen/images/home/heroimage0.png','image/png','heroimage0.png',543611,NULL,NULL,NULL,1,1366311045,1,1366311045,'554 1200'),(33,1,'saveitaly.png',2,'C:/xampp/htdocs/monmen/images/books-movies/saveitaly.png','image/png','saveitaly.png',160512,NULL,NULL,NULL,1,1366387704,1,1366387704,'385 367'),(34,1,'savingitalyheadline.png',2,'C:/xampp/htdocs/monmen/images/books-movies/savingitalyheadline.png','image/png','savingitalyheadline.png',4874,NULL,NULL,NULL,1,1366392822,1,1366392822,'72 385'),(35,1,'orderbook.png',2,'C:/xampp/htdocs/monmen/images/books-movies/orderbook.png','image/png','orderbook.png',4864,NULL,NULL,NULL,1,1366397669,1,1366397669,'78 236'),(36,1,'overlay.png',2,'C:/xampp/htdocs/monmen/images/books-movies/overlay.png','image/png','overlay.png',1014,NULL,NULL,NULL,1,1366398713,1,1366398713,'66 72'),(37,1,'x.png',2,'C:/xampp/htdocs/monmen/images/books-movies/x.png','image/png','x.png',1147,NULL,NULL,NULL,1,1366402236,1,1366402236,'25 23'),(38,1,'amazon.jpg',2,'C:/xampp/htdocs/monmen/images/books-movies/amazon.jpg','image/jpeg','amazon.jpg',3584,NULL,NULL,NULL,1,1366403875,1,1366403875,'50 185'),(39,1,'barnes.jpg',2,'C:/xampp/htdocs/monmen/images/books-movies/barnes.jpg','image/jpeg','barnes.jpg',4332,NULL,NULL,NULL,1,1366403887,1,1366403887,'50 191'),(40,1,'indie.jpg',2,'C:/xampp/htdocs/monmen/images/books-movies/indie.jpg','image/jpeg','indie.jpg',4506,NULL,NULL,NULL,1,1366403897,1,1366403897,'64 177'),(41,1,'powells.jpg',2,'C:/xampp/htdocs/monmen/images/books-movies/powells.jpg','image/jpeg','powells.jpg',3471,NULL,NULL,NULL,1,1366403913,1,1366403913,'64 148'),(42,1,'google.jpg',2,'C:/xampp/htdocs/monmen/images/books-movies/google.jpg','image/jpeg','google.jpg',3082,NULL,NULL,NULL,1,1366403923,1,1366403923,'42 166'),(43,1,'kobo.jpg',2,'C:/xampp/htdocs/monmen/images/books-movies/kobo.jpg','image/jpeg','kobo.jpg',2847,NULL,NULL,NULL,1,1366403933,1,1366403933,'50 104'),(44,1,'ibooks.jpg',2,'C:/xampp/htdocs/monmen/images/books-movies/ibooks.jpg','image/jpeg','ibooks.jpg',3809,NULL,NULL,NULL,1,1366403961,1,1366403961,'42 158');

/*Table structure for table `exp_global_variables` */

DROP TABLE IF EXISTS `exp_global_variables`;

CREATE TABLE `exp_global_variables` (
  `variable_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `variable_name` varchar(50) NOT NULL,
  `variable_data` text NOT NULL,
  PRIMARY KEY (`variable_id`),
  KEY `variable_name` (`variable_name`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `exp_global_variables` */

insert  into `exp_global_variables`(`variable_id`,`site_id`,`variable_name`,`variable_data`) values (1,1,'html-head','<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\n<head>'),(2,1,'html-head-end','<script src=\"//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js\"></script>\n <script src=\"index.php/global-embeds/jquery.slides.min\"></script>\n <script src=\"index.php/global-embeds/hoverintent\"></script>\n <script src=\"index.php/global-embeds/jquery.dropdown\"></script>\n</head>'),(3,1,'html-close','</body>\n</html>');

/*Table structure for table `exp_html_buttons` */

DROP TABLE IF EXISTS `exp_html_buttons`;

CREATE TABLE `exp_html_buttons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_id` int(10) NOT NULL DEFAULT '0',
  `tag_name` varchar(32) NOT NULL,
  `tag_open` varchar(120) NOT NULL,
  `tag_close` varchar(120) NOT NULL,
  `accesskey` varchar(32) NOT NULL,
  `tag_order` int(3) unsigned NOT NULL,
  `tag_row` char(1) NOT NULL DEFAULT '1',
  `classname` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `exp_html_buttons` */

insert  into `exp_html_buttons`(`id`,`site_id`,`member_id`,`tag_name`,`tag_open`,`tag_close`,`accesskey`,`tag_order`,`tag_row`,`classname`) values (1,1,0,'b','<strong>','</strong>','b',1,'1','btn_b'),(2,1,0,'i','<em>','</em>','i',2,'1','btn_i'),(3,1,0,'blockquote','<blockquote>','</blockquote>','q',3,'1','btn_blockquote'),(4,1,0,'a','<a href=\"[![Link:!:http://]!]\"(!( title=\"[![Title]!]\")!)>','</a>','a',4,'1','btn_a'),(5,1,0,'img','<img src=\"[![Link:!:http://]!]\" alt=\"[![Alternative text]!]\" />','','',5,'1','btn_img');

/*Table structure for table `exp_layout_publish` */

DROP TABLE IF EXISTS `exp_layout_publish`;

CREATE TABLE `exp_layout_publish` (
  `layout_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_group` int(4) unsigned NOT NULL DEFAULT '0',
  `channel_id` int(4) unsigned NOT NULL DEFAULT '0',
  `field_layout` text,
  PRIMARY KEY (`layout_id`),
  KEY `site_id` (`site_id`),
  KEY `member_group` (`member_group`),
  KEY `channel_id` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `exp_layout_publish` */

/*Table structure for table `exp_member_bulletin_board` */

DROP TABLE IF EXISTS `exp_member_bulletin_board`;

CREATE TABLE `exp_member_bulletin_board` (
  `bulletin_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` int(10) unsigned NOT NULL,
  `bulletin_group` int(8) unsigned NOT NULL,
  `bulletin_date` int(10) unsigned NOT NULL,
  `hash` varchar(10) NOT NULL DEFAULT '',
  `bulletin_expires` int(10) unsigned NOT NULL DEFAULT '0',
  `bulletin_message` text NOT NULL,
  PRIMARY KEY (`bulletin_id`),
  KEY `sender_id` (`sender_id`),
  KEY `hash` (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `exp_member_bulletin_board` */

/*Table structure for table `exp_member_data` */

DROP TABLE IF EXISTS `exp_member_data`;

CREATE TABLE `exp_member_data` (
  `member_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `exp_member_data` */

insert  into `exp_member_data`(`member_id`) values (1);

/*Table structure for table `exp_member_fields` */

DROP TABLE IF EXISTS `exp_member_fields`;

CREATE TABLE `exp_member_fields` (
  `m_field_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `m_field_name` varchar(32) NOT NULL,
  `m_field_label` varchar(50) NOT NULL,
  `m_field_description` text NOT NULL,
  `m_field_type` varchar(12) NOT NULL DEFAULT 'text',
  `m_field_list_items` text NOT NULL,
  `m_field_ta_rows` tinyint(2) DEFAULT '8',
  `m_field_maxl` smallint(3) NOT NULL,
  `m_field_width` varchar(6) NOT NULL,
  `m_field_search` char(1) NOT NULL DEFAULT 'y',
  `m_field_required` char(1) NOT NULL DEFAULT 'n',
  `m_field_public` char(1) NOT NULL DEFAULT 'y',
  `m_field_reg` char(1) NOT NULL DEFAULT 'n',
  `m_field_cp_reg` char(1) NOT NULL DEFAULT 'n',
  `m_field_fmt` char(5) NOT NULL DEFAULT 'none',
  `m_field_order` int(3) unsigned NOT NULL,
  PRIMARY KEY (`m_field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `exp_member_fields` */

/*Table structure for table `exp_member_groups` */

DROP TABLE IF EXISTS `exp_member_groups`;

CREATE TABLE `exp_member_groups` (
  `group_id` smallint(4) unsigned NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_title` varchar(100) NOT NULL,
  `group_description` text NOT NULL,
  `is_locked` char(1) NOT NULL DEFAULT 'y',
  `can_view_offline_system` char(1) NOT NULL DEFAULT 'n',
  `can_view_online_system` char(1) NOT NULL DEFAULT 'y',
  `can_access_cp` char(1) NOT NULL DEFAULT 'y',
  `can_access_content` char(1) NOT NULL DEFAULT 'n',
  `can_access_publish` char(1) NOT NULL DEFAULT 'n',
  `can_access_edit` char(1) NOT NULL DEFAULT 'n',
  `can_access_files` char(1) NOT NULL DEFAULT 'n',
  `can_access_fieldtypes` char(1) NOT NULL DEFAULT 'n',
  `can_access_design` char(1) NOT NULL DEFAULT 'n',
  `can_access_addons` char(1) NOT NULL DEFAULT 'n',
  `can_access_modules` char(1) NOT NULL DEFAULT 'n',
  `can_access_extensions` char(1) NOT NULL DEFAULT 'n',
  `can_access_accessories` char(1) NOT NULL DEFAULT 'n',
  `can_access_plugins` char(1) NOT NULL DEFAULT 'n',
  `can_access_members` char(1) NOT NULL DEFAULT 'n',
  `can_access_admin` char(1) NOT NULL DEFAULT 'n',
  `can_access_sys_prefs` char(1) NOT NULL DEFAULT 'n',
  `can_access_content_prefs` char(1) NOT NULL DEFAULT 'n',
  `can_access_tools` char(1) NOT NULL DEFAULT 'n',
  `can_access_comm` char(1) NOT NULL DEFAULT 'n',
  `can_access_utilities` char(1) NOT NULL DEFAULT 'n',
  `can_access_data` char(1) NOT NULL DEFAULT 'n',
  `can_access_logs` char(1) NOT NULL DEFAULT 'n',
  `can_admin_channels` char(1) NOT NULL DEFAULT 'n',
  `can_admin_upload_prefs` char(1) NOT NULL DEFAULT 'n',
  `can_admin_design` char(1) NOT NULL DEFAULT 'n',
  `can_admin_members` char(1) NOT NULL DEFAULT 'n',
  `can_delete_members` char(1) NOT NULL DEFAULT 'n',
  `can_admin_mbr_groups` char(1) NOT NULL DEFAULT 'n',
  `can_admin_mbr_templates` char(1) NOT NULL DEFAULT 'n',
  `can_ban_users` char(1) NOT NULL DEFAULT 'n',
  `can_admin_modules` char(1) NOT NULL DEFAULT 'n',
  `can_admin_templates` char(1) NOT NULL DEFAULT 'n',
  `can_admin_accessories` char(1) NOT NULL DEFAULT 'n',
  `can_edit_categories` char(1) NOT NULL DEFAULT 'n',
  `can_delete_categories` char(1) NOT NULL DEFAULT 'n',
  `can_view_other_entries` char(1) NOT NULL DEFAULT 'n',
  `can_edit_other_entries` char(1) NOT NULL DEFAULT 'n',
  `can_assign_post_authors` char(1) NOT NULL DEFAULT 'n',
  `can_delete_self_entries` char(1) NOT NULL DEFAULT 'n',
  `can_delete_all_entries` char(1) NOT NULL DEFAULT 'n',
  `can_view_other_comments` char(1) NOT NULL DEFAULT 'n',
  `can_edit_own_comments` char(1) NOT NULL DEFAULT 'n',
  `can_delete_own_comments` char(1) NOT NULL DEFAULT 'n',
  `can_edit_all_comments` char(1) NOT NULL DEFAULT 'n',
  `can_delete_all_comments` char(1) NOT NULL DEFAULT 'n',
  `can_moderate_comments` char(1) NOT NULL DEFAULT 'n',
  `can_send_email` char(1) NOT NULL DEFAULT 'n',
  `can_send_cached_email` char(1) NOT NULL DEFAULT 'n',
  `can_email_member_groups` char(1) NOT NULL DEFAULT 'n',
  `can_email_mailinglist` char(1) NOT NULL DEFAULT 'n',
  `can_email_from_profile` char(1) NOT NULL DEFAULT 'n',
  `can_view_profiles` char(1) NOT NULL DEFAULT 'n',
  `can_edit_html_buttons` char(1) NOT NULL DEFAULT 'n',
  `can_delete_self` char(1) NOT NULL DEFAULT 'n',
  `mbr_delete_notify_emails` varchar(255) DEFAULT NULL,
  `can_post_comments` char(1) NOT NULL DEFAULT 'n',
  `exclude_from_moderation` char(1) NOT NULL DEFAULT 'n',
  `can_search` char(1) NOT NULL DEFAULT 'n',
  `search_flood_control` mediumint(5) unsigned NOT NULL,
  `can_send_private_messages` char(1) NOT NULL DEFAULT 'n',
  `prv_msg_send_limit` smallint(5) unsigned NOT NULL DEFAULT '20',
  `prv_msg_storage_limit` smallint(5) unsigned NOT NULL DEFAULT '60',
  `can_attach_in_private_messages` char(1) NOT NULL DEFAULT 'n',
  `can_send_bulletins` char(1) NOT NULL DEFAULT 'n',
  `include_in_authorlist` char(1) NOT NULL DEFAULT 'n',
  `include_in_memberlist` char(1) NOT NULL DEFAULT 'y',
  `include_in_mailinglists` char(1) NOT NULL DEFAULT 'y',
  PRIMARY KEY (`group_id`,`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `exp_member_groups` */

insert  into `exp_member_groups`(`group_id`,`site_id`,`group_title`,`group_description`,`is_locked`,`can_view_offline_system`,`can_view_online_system`,`can_access_cp`,`can_access_content`,`can_access_publish`,`can_access_edit`,`can_access_files`,`can_access_fieldtypes`,`can_access_design`,`can_access_addons`,`can_access_modules`,`can_access_extensions`,`can_access_accessories`,`can_access_plugins`,`can_access_members`,`can_access_admin`,`can_access_sys_prefs`,`can_access_content_prefs`,`can_access_tools`,`can_access_comm`,`can_access_utilities`,`can_access_data`,`can_access_logs`,`can_admin_channels`,`can_admin_upload_prefs`,`can_admin_design`,`can_admin_members`,`can_delete_members`,`can_admin_mbr_groups`,`can_admin_mbr_templates`,`can_ban_users`,`can_admin_modules`,`can_admin_templates`,`can_admin_accessories`,`can_edit_categories`,`can_delete_categories`,`can_view_other_entries`,`can_edit_other_entries`,`can_assign_post_authors`,`can_delete_self_entries`,`can_delete_all_entries`,`can_view_other_comments`,`can_edit_own_comments`,`can_delete_own_comments`,`can_edit_all_comments`,`can_delete_all_comments`,`can_moderate_comments`,`can_send_email`,`can_send_cached_email`,`can_email_member_groups`,`can_email_mailinglist`,`can_email_from_profile`,`can_view_profiles`,`can_edit_html_buttons`,`can_delete_self`,`mbr_delete_notify_emails`,`can_post_comments`,`exclude_from_moderation`,`can_search`,`search_flood_control`,`can_send_private_messages`,`prv_msg_send_limit`,`prv_msg_storage_limit`,`can_attach_in_private_messages`,`can_send_bulletins`,`include_in_authorlist`,`include_in_memberlist`,`include_in_mailinglists`) values (1,1,'Super Admins','','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','','y','y','y',0,'y',20,60,'y','y','y','y','y'),(2,1,'Banned','','y','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','','n','n','n',60,'n',20,60,'n','n','n','n','n'),(3,1,'Guests','','y','n','y','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','y','n','n','n','n','','y','n','y',15,'n',20,60,'n','n','n','n','n'),(4,1,'Pending','','y','n','y','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','y','n','n','n','n','','y','n','y',15,'n',20,60,'n','n','n','n','n'),(5,1,'Members','','y','n','y','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','y','y','y','n','','y','n','y',10,'y',20,60,'y','n','n','y','y');

/*Table structure for table `exp_member_homepage` */

DROP TABLE IF EXISTS `exp_member_homepage`;

CREATE TABLE `exp_member_homepage` (
  `member_id` int(10) unsigned NOT NULL,
  `recent_entries` char(1) NOT NULL DEFAULT 'l',
  `recent_entries_order` int(3) unsigned NOT NULL DEFAULT '0',
  `recent_comments` char(1) NOT NULL DEFAULT 'l',
  `recent_comments_order` int(3) unsigned NOT NULL DEFAULT '0',
  `recent_members` char(1) NOT NULL DEFAULT 'n',
  `recent_members_order` int(3) unsigned NOT NULL DEFAULT '0',
  `site_statistics` char(1) NOT NULL DEFAULT 'r',
  `site_statistics_order` int(3) unsigned NOT NULL DEFAULT '0',
  `member_search_form` char(1) NOT NULL DEFAULT 'n',
  `member_search_form_order` int(3) unsigned NOT NULL DEFAULT '0',
  `notepad` char(1) NOT NULL DEFAULT 'r',
  `notepad_order` int(3) unsigned NOT NULL DEFAULT '0',
  `bulletin_board` char(1) NOT NULL DEFAULT 'r',
  `bulletin_board_order` int(3) unsigned NOT NULL DEFAULT '0',
  `pmachine_news_feed` char(1) NOT NULL DEFAULT 'n',
  `pmachine_news_feed_order` int(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `exp_member_homepage` */

insert  into `exp_member_homepage`(`member_id`,`recent_entries`,`recent_entries_order`,`recent_comments`,`recent_comments_order`,`recent_members`,`recent_members_order`,`site_statistics`,`site_statistics_order`,`member_search_form`,`member_search_form_order`,`notepad`,`notepad_order`,`bulletin_board`,`bulletin_board_order`,`pmachine_news_feed`,`pmachine_news_feed_order`) values (1,'l',1,'l',2,'n',0,'r',1,'n',0,'r',2,'r',0,'l',0);

/*Table structure for table `exp_member_search` */

DROP TABLE IF EXISTS `exp_member_search`;

CREATE TABLE `exp_member_search` (
  `search_id` varchar(32) NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `search_date` int(10) unsigned NOT NULL,
  `keywords` varchar(200) NOT NULL,
  `fields` varchar(200) NOT NULL,
  `member_id` int(10) unsigned NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `total_results` int(8) unsigned NOT NULL,
  `query` text NOT NULL,
  PRIMARY KEY (`search_id`),
  KEY `member_id` (`member_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `exp_member_search` */

/*Table structure for table `exp_members` */

DROP TABLE IF EXISTS `exp_members`;

CREATE TABLE `exp_members` (
  `member_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` smallint(4) NOT NULL DEFAULT '0',
  `username` varchar(50) NOT NULL,
  `screen_name` varchar(50) NOT NULL,
  `password` varchar(128) NOT NULL,
  `salt` varchar(128) NOT NULL DEFAULT '',
  `unique_id` varchar(40) NOT NULL,
  `crypt_key` varchar(40) DEFAULT NULL,
  `authcode` varchar(10) DEFAULT NULL,
  `email` varchar(72) NOT NULL,
  `url` varchar(150) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `occupation` varchar(80) DEFAULT NULL,
  `interests` varchar(120) DEFAULT NULL,
  `bday_d` int(2) DEFAULT NULL,
  `bday_m` int(2) DEFAULT NULL,
  `bday_y` int(4) DEFAULT NULL,
  `aol_im` varchar(50) DEFAULT NULL,
  `yahoo_im` varchar(50) DEFAULT NULL,
  `msn_im` varchar(50) DEFAULT NULL,
  `icq` varchar(50) DEFAULT NULL,
  `bio` text,
  `signature` text,
  `avatar_filename` varchar(120) DEFAULT NULL,
  `avatar_width` int(4) unsigned DEFAULT NULL,
  `avatar_height` int(4) unsigned DEFAULT NULL,
  `photo_filename` varchar(120) DEFAULT NULL,
  `photo_width` int(4) unsigned DEFAULT NULL,
  `photo_height` int(4) unsigned DEFAULT NULL,
  `sig_img_filename` varchar(120) DEFAULT NULL,
  `sig_img_width` int(4) unsigned DEFAULT NULL,
  `sig_img_height` int(4) unsigned DEFAULT NULL,
  `ignore_list` text,
  `private_messages` int(4) unsigned NOT NULL DEFAULT '0',
  `accept_messages` char(1) NOT NULL DEFAULT 'y',
  `last_view_bulletins` int(10) NOT NULL DEFAULT '0',
  `last_bulletin_date` int(10) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `join_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_visit` int(10) unsigned NOT NULL DEFAULT '0',
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `total_entries` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `total_comments` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `total_forum_topics` mediumint(8) NOT NULL DEFAULT '0',
  `total_forum_posts` mediumint(8) NOT NULL DEFAULT '0',
  `last_entry_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_comment_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_forum_post_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_email_date` int(10) unsigned NOT NULL DEFAULT '0',
  `in_authorlist` char(1) NOT NULL DEFAULT 'n',
  `accept_admin_email` char(1) NOT NULL DEFAULT 'y',
  `accept_user_email` char(1) NOT NULL DEFAULT 'y',
  `notify_by_default` char(1) NOT NULL DEFAULT 'y',
  `notify_of_pm` char(1) NOT NULL DEFAULT 'y',
  `display_avatars` char(1) NOT NULL DEFAULT 'y',
  `display_signatures` char(1) NOT NULL DEFAULT 'y',
  `parse_smileys` char(1) NOT NULL DEFAULT 'y',
  `smart_notifications` char(1) NOT NULL DEFAULT 'y',
  `language` varchar(50) NOT NULL,
  `timezone` varchar(8) NOT NULL,
  `daylight_savings` char(1) NOT NULL DEFAULT 'n',
  `localization_is_site_default` char(1) NOT NULL DEFAULT 'n',
  `time_format` char(2) NOT NULL DEFAULT 'us',
  `cp_theme` varchar(32) DEFAULT NULL,
  `profile_theme` varchar(32) DEFAULT NULL,
  `forum_theme` varchar(32) DEFAULT NULL,
  `tracker` text,
  `template_size` varchar(2) NOT NULL DEFAULT '20',
  `notepad` text,
  `notepad_size` varchar(2) NOT NULL DEFAULT '18',
  `quick_links` text,
  `quick_tabs` text,
  `show_sidebar` char(1) NOT NULL DEFAULT 'n',
  `pmember_id` int(10) NOT NULL DEFAULT '0',
  `rte_enabled` char(1) NOT NULL DEFAULT 'y',
  `rte_toolset_id` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`member_id`),
  KEY `group_id` (`group_id`),
  KEY `unique_id` (`unique_id`),
  KEY `password` (`password`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `exp_members` */

insert  into `exp_members`(`member_id`,`group_id`,`username`,`screen_name`,`password`,`salt`,`unique_id`,`crypt_key`,`authcode`,`email`,`url`,`location`,`occupation`,`interests`,`bday_d`,`bday_m`,`bday_y`,`aol_im`,`yahoo_im`,`msn_im`,`icq`,`bio`,`signature`,`avatar_filename`,`avatar_width`,`avatar_height`,`photo_filename`,`photo_width`,`photo_height`,`sig_img_filename`,`sig_img_width`,`sig_img_height`,`ignore_list`,`private_messages`,`accept_messages`,`last_view_bulletins`,`last_bulletin_date`,`ip_address`,`join_date`,`last_visit`,`last_activity`,`total_entries`,`total_comments`,`total_forum_topics`,`total_forum_posts`,`last_entry_date`,`last_comment_date`,`last_forum_post_date`,`last_email_date`,`in_authorlist`,`accept_admin_email`,`accept_user_email`,`notify_by_default`,`notify_of_pm`,`display_avatars`,`display_signatures`,`parse_smileys`,`smart_notifications`,`language`,`timezone`,`daylight_savings`,`localization_is_site_default`,`time_format`,`cp_theme`,`profile_theme`,`forum_theme`,`tracker`,`template_size`,`notepad`,`notepad_size`,`quick_links`,`quick_tabs`,`show_sidebar`,`pmember_id`,`rte_enabled`,`rte_toolset_id`) values (1,1,'admin','Frank','eb818e73aaa4dfdee9fd64014a5dac4ebc1014eaa0eb26b922da6d89abdd92a7cd101f128d5983d0b78816d1b3873d74fc49249393dcdb12e046634b7535dd23','3#b:e`)pbp{):Ja/e(@gPG@\\&H[h+O(wD[svBM2&&|*l$.Qml0`&o&}(dB+*P$!3xyx!Wm.ce[5|2r3b/P<^m.GfK\';Bk/!At:vT?N^!mzn~n14}K{<G|DSUab5emK7s','bd37a2655d26e0156904fb9734dd03a2ed44dd26','ba801db4a8ece26db2b19959fcd0bb9a5ed91f74',NULL,'frank@milne.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'::1',1366121946,1366339670,1366407252,4,0,0,0,1366318339,0,0,0,'n','y','y','y','y','y','y','y','y','english','UM6','y','n','us',NULL,NULL,NULL,NULL,'20',NULL,'18','',NULL,'n',0,'y',0);

/*Table structure for table `exp_message_attachments` */

DROP TABLE IF EXISTS `exp_message_attachments`;

CREATE TABLE `exp_message_attachments` (
  `attachment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` int(10) unsigned NOT NULL DEFAULT '0',
  `message_id` int(10) unsigned NOT NULL DEFAULT '0',
  `attachment_name` varchar(50) NOT NULL DEFAULT '',
  `attachment_hash` varchar(40) NOT NULL DEFAULT '',
  `attachment_extension` varchar(20) NOT NULL DEFAULT '',
  `attachment_location` varchar(150) NOT NULL DEFAULT '',
  `attachment_date` int(10) unsigned NOT NULL DEFAULT '0',
  `attachment_size` int(10) unsigned NOT NULL DEFAULT '0',
  `is_temp` char(1) NOT NULL DEFAULT 'y',
  PRIMARY KEY (`attachment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `exp_message_attachments` */

/*Table structure for table `exp_message_copies` */

DROP TABLE IF EXISTS `exp_message_copies`;

CREATE TABLE `exp_message_copies` (
  `copy_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `message_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sender_id` int(10) unsigned NOT NULL DEFAULT '0',
  `recipient_id` int(10) unsigned NOT NULL DEFAULT '0',
  `message_received` char(1) NOT NULL DEFAULT 'n',
  `message_read` char(1) NOT NULL DEFAULT 'n',
  `message_time_read` int(10) unsigned NOT NULL DEFAULT '0',
  `attachment_downloaded` char(1) NOT NULL DEFAULT 'n',
  `message_folder` int(10) unsigned NOT NULL DEFAULT '1',
  `message_authcode` varchar(10) NOT NULL DEFAULT '',
  `message_deleted` char(1) NOT NULL DEFAULT 'n',
  `message_status` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`copy_id`),
  KEY `message_id` (`message_id`),
  KEY `recipient_id` (`recipient_id`),
  KEY `sender_id` (`sender_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `exp_message_copies` */

/*Table structure for table `exp_message_data` */

DROP TABLE IF EXISTS `exp_message_data`;

CREATE TABLE `exp_message_data` (
  `message_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` int(10) unsigned NOT NULL DEFAULT '0',
  `message_date` int(10) unsigned NOT NULL DEFAULT '0',
  `message_subject` varchar(255) NOT NULL DEFAULT '',
  `message_body` text NOT NULL,
  `message_tracking` char(1) NOT NULL DEFAULT 'y',
  `message_attachments` char(1) NOT NULL DEFAULT 'n',
  `message_recipients` varchar(200) NOT NULL DEFAULT '',
  `message_cc` varchar(200) NOT NULL DEFAULT '',
  `message_hide_cc` char(1) NOT NULL DEFAULT 'n',
  `message_sent_copy` char(1) NOT NULL DEFAULT 'n',
  `total_recipients` int(5) unsigned NOT NULL DEFAULT '0',
  `message_status` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`message_id`),
  KEY `sender_id` (`sender_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `exp_message_data` */

/*Table structure for table `exp_message_folders` */

DROP TABLE IF EXISTS `exp_message_folders`;

CREATE TABLE `exp_message_folders` (
  `member_id` int(10) unsigned NOT NULL DEFAULT '0',
  `folder1_name` varchar(50) NOT NULL DEFAULT 'InBox',
  `folder2_name` varchar(50) NOT NULL DEFAULT 'Sent',
  `folder3_name` varchar(50) NOT NULL DEFAULT '',
  `folder4_name` varchar(50) NOT NULL DEFAULT '',
  `folder5_name` varchar(50) NOT NULL DEFAULT '',
  `folder6_name` varchar(50) NOT NULL DEFAULT '',
  `folder7_name` varchar(50) NOT NULL DEFAULT '',
  `folder8_name` varchar(50) NOT NULL DEFAULT '',
  `folder9_name` varchar(50) NOT NULL DEFAULT '',
  `folder10_name` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `exp_message_folders` */

insert  into `exp_message_folders`(`member_id`,`folder1_name`,`folder2_name`,`folder3_name`,`folder4_name`,`folder5_name`,`folder6_name`,`folder7_name`,`folder8_name`,`folder9_name`,`folder10_name`) values (1,'InBox','Sent','','','','','','','','');

/*Table structure for table `exp_message_listed` */

DROP TABLE IF EXISTS `exp_message_listed`;

CREATE TABLE `exp_message_listed` (
  `listed_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(10) unsigned NOT NULL DEFAULT '0',
  `listed_member` int(10) unsigned NOT NULL DEFAULT '0',
  `listed_description` varchar(100) NOT NULL DEFAULT '',
  `listed_type` varchar(10) NOT NULL DEFAULT 'blocked',
  PRIMARY KEY (`listed_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `exp_message_listed` */

/*Table structure for table `exp_module_member_groups` */

DROP TABLE IF EXISTS `exp_module_member_groups`;

CREATE TABLE `exp_module_member_groups` (
  `group_id` smallint(4) unsigned NOT NULL,
  `module_id` mediumint(5) unsigned NOT NULL,
  PRIMARY KEY (`group_id`,`module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `exp_module_member_groups` */

/*Table structure for table `exp_modules` */

DROP TABLE IF EXISTS `exp_modules`;

CREATE TABLE `exp_modules` (
  `module_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `module_name` varchar(50) NOT NULL,
  `module_version` varchar(12) NOT NULL,
  `has_cp_backend` char(1) NOT NULL DEFAULT 'n',
  `has_publish_fields` char(1) NOT NULL DEFAULT 'n',
  PRIMARY KEY (`module_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `exp_modules` */

insert  into `exp_modules`(`module_id`,`module_name`,`module_version`,`has_cp_backend`,`has_publish_fields`) values (1,'Blacklist','3.0.1','y','n'),(2,'Comment','2.3','y','n'),(3,'Email','2.0','n','n'),(4,'Emoticon','2.0','n','n'),(5,'File','1.0.0','n','n'),(6,'Jquery','1.0','n','n'),(7,'Pages','2.2','y','y'),(8,'Query','2.0','n','n'),(9,'Rss','2.0','n','n'),(10,'Safecracker','2.1','y','n'),(11,'Search','2.2','n','n'),(12,'Simple_commerce','2.0','y','n'),(13,'Channel','2.0.1','n','n'),(14,'Member','2.1','n','n'),(15,'Stats','2.0','n','n'),(16,'Rte','1.0','y','n');

/*Table structure for table `exp_online_users` */

DROP TABLE IF EXISTS `exp_online_users`;

CREATE TABLE `exp_online_users` (
  `online_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_id` int(10) NOT NULL DEFAULT '0',
  `in_forum` char(1) NOT NULL DEFAULT 'n',
  `name` varchar(50) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `date` int(10) unsigned NOT NULL DEFAULT '0',
  `anon` char(1) NOT NULL,
  PRIMARY KEY (`online_id`),
  KEY `date` (`date`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

/*Data for the table `exp_online_users` */

insert  into `exp_online_users`(`online_id`,`site_id`,`member_id`,`in_forum`,`name`,`ip_address`,`date`,`anon`) values (43,1,0,'n','','::1',1366407490,''),(45,1,0,'n','','::1',1366407490,''),(46,1,0,'n','','::1',1366407490,'');

/*Table structure for table `exp_pages_configuration` */

DROP TABLE IF EXISTS `exp_pages_configuration`;

CREATE TABLE `exp_pages_configuration` (
  `configuration_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(8) unsigned NOT NULL DEFAULT '1',
  `configuration_name` varchar(60) NOT NULL,
  `configuration_value` varchar(100) NOT NULL,
  PRIMARY KEY (`configuration_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `exp_pages_configuration` */

/*Table structure for table `exp_password_lockout` */

DROP TABLE IF EXISTS `exp_password_lockout`;

CREATE TABLE `exp_password_lockout` (
  `lockout_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `login_date` int(10) unsigned NOT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `username` varchar(50) NOT NULL,
  PRIMARY KEY (`lockout_id`),
  KEY `login_date` (`login_date`),
  KEY `ip_address` (`ip_address`),
  KEY `user_agent` (`user_agent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `exp_password_lockout` */

/*Table structure for table `exp_ping_servers` */

DROP TABLE IF EXISTS `exp_ping_servers`;

CREATE TABLE `exp_ping_servers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_id` int(10) NOT NULL DEFAULT '0',
  `server_name` varchar(32) NOT NULL,
  `server_url` varchar(150) NOT NULL,
  `port` varchar(4) NOT NULL DEFAULT '80',
  `ping_protocol` varchar(12) NOT NULL DEFAULT 'xmlrpc',
  `is_default` char(1) NOT NULL DEFAULT 'y',
  `server_order` int(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `exp_ping_servers` */

/*Table structure for table `exp_relationships` */

DROP TABLE IF EXISTS `exp_relationships`;

CREATE TABLE `exp_relationships` (
  `rel_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `rel_parent_id` int(10) NOT NULL DEFAULT '0',
  `rel_child_id` int(10) NOT NULL DEFAULT '0',
  `rel_type` varchar(12) NOT NULL,
  `rel_data` mediumtext NOT NULL,
  `reverse_rel_data` mediumtext NOT NULL,
  PRIMARY KEY (`rel_id`),
  KEY `rel_parent_id` (`rel_parent_id`),
  KEY `rel_child_id` (`rel_child_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `exp_relationships` */

/*Table structure for table `exp_remember_me` */

DROP TABLE IF EXISTS `exp_remember_me`;

CREATE TABLE `exp_remember_me` (
  `remember_me_id` varchar(40) NOT NULL DEFAULT '0',
  `member_id` int(10) DEFAULT '0',
  `ip_address` varchar(45) DEFAULT '0',
  `user_agent` varchar(120) DEFAULT '',
  `admin_sess` tinyint(1) DEFAULT '0',
  `site_id` int(4) DEFAULT '1',
  `expiration` int(10) DEFAULT '0',
  `last_refresh` int(10) DEFAULT '0',
  PRIMARY KEY (`remember_me_id`),
  KEY `member_id` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `exp_remember_me` */

/*Table structure for table `exp_reset_password` */

DROP TABLE IF EXISTS `exp_reset_password`;

CREATE TABLE `exp_reset_password` (
  `reset_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(10) unsigned NOT NULL,
  `resetcode` varchar(12) NOT NULL,
  `date` int(10) NOT NULL,
  PRIMARY KEY (`reset_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `exp_reset_password` */

/*Table structure for table `exp_revision_tracker` */

DROP TABLE IF EXISTS `exp_revision_tracker`;

CREATE TABLE `exp_revision_tracker` (
  `tracker_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(10) unsigned NOT NULL,
  `item_table` varchar(20) NOT NULL,
  `item_field` varchar(20) NOT NULL,
  `item_date` int(10) NOT NULL,
  `item_author_id` int(10) unsigned NOT NULL,
  `item_data` mediumtext NOT NULL,
  PRIMARY KEY (`tracker_id`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=369 DEFAULT CHARSET=utf8;

/*Data for the table `exp_revision_tracker` */

insert  into `exp_revision_tracker`(`tracker_id`,`item_id`,`item_table`,`item_field`,`item_date`,`item_author_id`,`item_data`) values (44,4,'exp_templates','template_data',1366130853,1,'<div id=\"footer\">\n		<div id=\"foot-home\">\n			<a href=\"\"><h2>Home</h2></a>\n			<ul>\n				<li><a href=\"\"><h2>Books + Movies</h2></a></li>\n				<li><a href=\"\">Saving Italy</a></li>\n				<li><a href=\"\">The Monuments Men</a></li>\n				<li><a href=\"\">Rescung Davinci</a></li>\n				<li><a href=\"\">Rape of Europa Collectors Edition</a></li>\n				<li><a href=\"\">The Monuments Men Feature Film</a></li>\n				<li><a href=\"\">Beyond the Dreams of Avarice</a></li>\n			\n			</ul>\n		</div>\n		<div id=\"foot-edu\">\n			<ul>\n				<li><a href=\"\"><h2>For Educators</h2></a></li>\n				<li><a href=\"\">Free Lesson Plans</a></li>\n				<li><a href=\"\">Glossary</a></li>\n				<li><a href=\"\">Writing Team</a></li>\n				<li><a href=\"\">Advisory Board</a></li>\n				<li><a href=\"\">Supporters</a></li>\n			</ul>\n		</div>\n		<div id=\"foot-heroes\">\n			<ul>\n				<li><a href=\"\"><h2>The Heroes</h2></a></li>\n				<li><a href=\"\">Monuments Men</a></li>\n				<li><a href=\"\">Roberts Commission</a></li>\n				<li><a href=\"\">The American Committy of Learned Societies</a></li>\n				<li><a href=\"\">The Harvard Group</a></li>\n			</ul>\n		</div>\n		<div id=\"foot-speaking\">\n			<ul>\n				<li><a href=\"\"><h2>Speaking Engagements</h2></a></li>\n				<li><a href=\"\">Events</a></li>\n			</ul>\n			<ul>\n				<li><a href=\"\"><h2>Store</h2></a></li>\n				<li><a href=\"\">Products</a></li>\n				<li><a href=\"\">Cart/Checkout</a></li>\n			</ul>\n		</div>\n		<div id=\"foot-about\">\n			<ul>\n				<li><a href=\"\"><h2>About Robert Edsel</h2></a></li>\n				<li><a href=\"\">News</a></li>\n				<li><a href=\"\">Blog</a></li>\n				<li><a href=\"\">Press Inquiries</a></li>\n				<li><a href=\"\">Contact Us</a></li>\n			</ul>\n		</div>\n	</div>'),(96,6,'exp_templates','template_data',1366145687,1,'/*\n  SlidesJS 3.0.3 http://slidesjs.com\n  (c) 2013 by Nathan Searles http://nathansearles.com\n  Updated: March 15th, 2013\n  Apache License: http://www.apache.org/licenses/LICENSE-2.0\n*/\n(function(){(function(a,b,c){var d,e,f;return f=\"slidesjs\",e={width:940,height:528,start:1,navigation:{active:!0,effect:\"slide\"},pagination:{active:!0,effect:\"slide\"},play:{active:!1,effect:\"slide\",interval:5e3,auto:!1,swap:!0,pauseOnHover:!1,restartDelay:2500},effect:{slide:{speed:500},fade:{speed:300,crossfade:!0}},callback:{loaded:function(){},start:function(){},complete:function(){}}},d=function(){function b(b,c){this.element=b,this.options=a.extend(!0,{},e,c),this._defaults=e,this._name=f,this.init()}return b}(),d.prototype.init=function(){var c,d,e,f,g,h,i=this;return c=a(this.element),this.data=a.data(this),a.data(this,\"animating\",!1),a.data(this,\"total\",c.children().not(\".slidesjs-navigation\",c).length),a.data(this,\"current\",this.options.start-1),a.data(this,\"vendorPrefix\",this._getVendorPrefix()),\"undefined\"!=typeof TouchEvent&&(a.data(this,\"touch\",!0),this.options.effect.slide.speed=this.options.effect.slide.speed/2),c.css({overflow:\"hidden\"}),c.slidesContainer=c.children().not(\".slidesjs-navigation\",c).wrapAll(\"<div class=\'slidesjs-container\'>\",c).parent().css({overflow:\"hidden\",position:\"relative\"}),a(\".slidesjs-container\",c).wrapInner(\"<div class=\'slidesjs-control\'>\",c).children(),a(\".slidesjs-control\",c).css({position:\"relative\",left:0}),a(\".slidesjs-control\",c).children().addClass(\"slidesjs-slide\").css({position:\"absolute\",top:0,left:0,width:\"100%\",zIndex:0,display:\"none\",webkitBackfaceVisibility:\"hidden\"}),a.each(a(\".slidesjs-control\",c).children(),function(b){var c;return c=a(this),c.attr(\"slidesjs-index\",b)}),this.data.touch&&(a(\".slidesjs-control\",c).on(\"touchstart\",function(a){return i._touchstart(a)}),a(\".slidesjs-control\",c).on(\"touchmove\",function(a){return i._touchmove(a)}),a(\".slidesjs-control\",c).on(\"touchend\",function(a){return i._touchend(a)})),c.fadeIn(0),this.update(),this.data.touch&&this._setuptouch(),a(\".slidesjs-control\",c).children(\":eq(\"+this.data.current+\")\").eq(0).fadeIn(0,function(){return a(this).css({zIndex:10})}),this.options.navigation.active&&(g=a(\"<a>\",{\"class\":\"slidesjs-previous slidesjs-navigation\",href:\"#\",title:\"Previous\",text:\"Previous\"}).appendTo(c),d=a(\"<a>\",{\"class\":\"slidesjs-next slidesjs-navigation\",href:\"#\",title:\"Next\",text:\"Next\"}).appendTo(c)),a(\".slidesjs-next\",c).click(function(a){return a.preventDefault(),i.stop(!0),i.next(i.options.navigation.effect)}),a(\".slidesjs-previous\",c).click(function(a){return a.preventDefault(),i.stop(!0),i.previous(i.options.navigation.effect)}),this.options.play.active&&(f=a(\"<a>\",{\"class\":\"slidesjs-play slidesjs-navigation\",href:\"#\",title:\"Play\",text:\"Play\"}).appendTo(c),h=a(\"<a>\",{\"class\":\"slidesjs-stop slidesjs-navigation\",href:\"#\",title:\"Stop\",text:\"Stop\"}).appendTo(c),f.click(function(a){return a.preventDefault(),i.play(!0)}),h.click(function(a){return a.preventDefault(),i.stop(!0)}),this.options.play.swap&&h.css({display:\"none\"})),this.options.pagination.active&&(e=a(\"<ul>\",{\"class\":\"slidesjs-pagination\"}).appendTo(c),a.each(Array(this.data.total),function(b){var c,d;return c=a(\"<li>\",{\"class\":\"slidesjs-pagination-item\"}).appendTo(e),d=a(\"<a>\",{href:\"#\",\"data-slidesjs-item\":b,html:b+1}).appendTo(c),d.click(function(b){return b.preventDefault(),i.stop(!0),i.goto(1*a(b.currentTarget).attr(\"data-slidesjs-item\")+1)})})),a(b).bind(\"resize\",function(){return i.update()}),this._setActive(),this.options.play.auto&&this.play(),this.options.callback.loaded(this.options.start)},d.prototype._setActive=function(b){var c,d;return c=a(this.element),this.data=a.data(this),d=b>-1?b:this.data.current,a(\".active\",c).removeClass(\"active\"),a(\"li:eq(\"+d+\") a\",c).addClass(\"active\")},d.prototype.update=function(){var b,c,d;return b=a(this.element),this.data=a.data(this),a(\".slidesjs-control\",b).children(\":not(:eq(\"+this.data.current+\"))\").css({display:\"none\",left:0,zIndex:0}),d=b.width(),c=this.options.height/this.options.width*d,this.options.width=d,this.options.height=c,a(\".slidesjs-control, .slidesjs-container\",b).css({width:d,height:c})},d.prototype.next=function(b){var c;return c=a(this.element),this.data=a.data(this),a.data(this,\"direction\",\"next\"),void 0===b&&(b=this.options.navigation.effect),\"fade\"===b?this._fade():this._slide()},d.prototype.previous=function(b){var c;return c=a(this.element),this.data=a.data(this),a.data(this,\"direction\",\"previous\"),void 0===b&&(b=this.options.navigation.effect),\"fade\"===b?this._fade():this._slide()},d.prototype.goto=function(b){var c,d;if(c=a(this.element),this.data=a.data(this),void 0===d&&(d=this.options.pagination.effect),b>this.data.total?b=this.data.total:1>b&&(b=1),\"number\"==typeof b)return\"fade\"===d?this._fade(b):this._slide(b);if(\"string\"==typeof b){if(\"first\"===b)return\"fade\"===d?this._fade(0):this._slide(0);if(\"last\"===b)return\"fade\"===d?this._fade(this.data.total):this._slide(this.data.total)}},d.prototype._setuptouch=function(){var b,c,d,e;return b=a(this.element),this.data=a.data(this),e=a(\".slidesjs-control\",b),c=this.data.current+1,d=this.data.current-1,0>d&&(d=this.data.total-1),c>this.data.total-1&&(c=0),e.children(\":eq(\"+c+\")\").css({display:\"block\",left:this.options.width}),e.children(\":eq(\"+d+\")\").css({display:\"block\",left:-this.options.width})},d.prototype._touchstart=function(b){var c,d;return c=a(this.element),this.data=a.data(this),d=b.originalEvent.touches[0],this._setuptouch(),a.data(this,\"touchtimer\",Number(new Date)),a.data(this,\"touchstartx\",d.pageX),a.data(this,\"touchstarty\",d.pageY),b.stopPropagation()},d.prototype._touchend=function(b){var c,d,e,f,g,h,i,j=this;return c=a(this.element),this.data=a.data(this),h=b.originalEvent.touches[0],f=a(\".slidesjs-control\",c),f.position().left>.5*this.options.width||f.position().left>.1*this.options.width&&250>Number(new Date)-this.data.touchtimer?(a.data(this,\"direction\",\"previous\"),this._slide()):f.position().left<-(.5*this.options.width)||f.position().left<-(.1*this.options.width)&&250>Number(new Date)-this.data.touchtimer?(a.data(this,\"direction\",\"next\"),this._slide()):(e=this.data.vendorPrefix,i=e+\"Transform\",d=e+\"TransitionDuration\",g=e+\"TransitionTimingFunction\",f[0].style[i]=\"translateX(0px)\",f[0].style[d]=.85*this.options.effect.slide.speed+\"ms\"),f.on(\"transitionend webkitTransitionEnd oTransitionEnd otransitionend MSTransitionEnd\",function(){return e=j.data.vendorPrefix,i=e+\"Transform\",d=e+\"TransitionDuration\",g=e+\"TransitionTimingFunction\",f[0].style[i]=\"\",f[0].style[d]=\"\",f[0].style[g]=\"\"}),b.stopPropagation()},d.prototype._touchmove=function(b){var c,d,e,f,g;return c=a(this.element),this.data=a.data(this),f=b.originalEvent.touches[0],d=this.data.vendorPrefix,e=a(\".slidesjs-control\",c),g=d+\"Transform\",a.data(this,\"scrolling\",Math.abs(f.pageX-this.data.touchstartx)<Math.abs(f.pageY-this.data.touchstarty)),this.data.animating||this.data.scrolling||(b.preventDefault(),this._setuptouch(),e[0].style[g]=\"translateX(\"+(f.pageX-this.data.touchstartx)+\"px)\"),b.stopPropagation()},d.prototype.play=function(b){var c,d,e,f=this;return c=a(this.element),this.data=a.data(this),!this.data.playInterval&&(b&&(d=this.data.current,this.data.direction=\"next\",\"fade\"===this.options.play.effect?this._fade():this._slide()),a.data(this,\"playInterval\",setInterval(function(){return d=f.data.current,f.data.direction=\"next\",\"fade\"===f.options.play.effect?f._fade():f._slide()},this.options.play.interval)),e=a(\".slidesjs-container\",c),this.options.play.pauseOnHover&&(e.unbind(),e.bind(\"mouseenter\",function(){return f.stop()}),e.bind(\"mouseleave\",function(){return f.options.play.restartDelay?a.data(f,\"restartDelay\",setTimeout(function(){return f.play(!0)},f.options.play.restartDelay)):f.play()})),a.data(this,\"playing\",!0),a(\".slidesjs-play\",c).addClass(\"slidesjs-playing\"),this.options.play.swap)?(a(\".slidesjs-play\",c).hide(),a(\".slidesjs-stop\",c).show()):void 0},d.prototype.stop=function(b){var c;return c=a(this.element),this.data=a.data(this),clearInterval(this.data.playInterval),this.options.play.pauseOnHover&&b&&a(\".slidesjs-container\",c).unbind(),a.data(this,\"playInterval\",null),a.data(this,\"playing\",!1),a(\".slidesjs-play\",c).removeClass(\"slidesjs-playing\"),this.options.play.swap?(a(\".slidesjs-stop\",c).hide(),a(\".slidesjs-play\",c).show()):void 0},d.prototype._slide=function(b){var c,d,e,f,g,h,i,j,k,l,m=this;return c=a(this.element),this.data=a.data(this),this.data.animating||b===this.data.current+1?void 0:(a.data(this,\"animating\",!0),d=this.data.current,b>-1?(b-=1,l=b>d?1:-1,e=b>d?-this.options.width:this.options.width,g=b):(l=\"next\"===this.data.direction?1:-1,e=\"next\"===this.data.direction?-this.options.width:this.options.width,g=d+l),-1===g&&(g=this.data.total-1),g===this.data.total&&(g=0),this._setActive(g),i=a(\".slidesjs-control\",c),b>-1&&i.children(\":not(:eq(\"+d+\"))\").css({display:\"none\",left:0,zIndex:0}),i.children(\":eq(\"+g+\")\").css({display:\"block\",left:l*this.options.width,zIndex:10}),this.options.callback.start(d+1),this.data.vendorPrefix?(h=this.data.vendorPrefix,k=h+\"Transform\",f=h+\"TransitionDuration\",j=h+\"TransitionTimingFunction\",i[0].style[k]=\"translateX(\"+e+\"px)\",i[0].style[f]=this.options.effect.slide.speed+\"ms\",i.on(\"transitionend webkitTransitionEnd oTransitionEnd otransitionend MSTransitionEnd\",function(){return i[0].style[k]=\"\",i[0].style[f]=\"\",i.children(\":eq(\"+g+\")\").css({left:0}),i.children(\":eq(\"+d+\")\").css({display:\"none\",left:0,zIndex:0}),a.data(m,\"current\",g),a.data(m,\"animating\",!1),i.unbind(\"transitionend webkitTransitionEnd oTransitionEnd otransitionend MSTransitionEnd\"),i.children(\":not(:eq(\"+g+\"))\").css({display:\"none\",left:0,zIndex:0}),m.data.touch&&m._setuptouch(),m.options.callback.complete(g+1)})):i.stop().animate({left:e},this.options.effect.slide.speed,function(){return i.css({left:0}),i.children(\":eq(\"+g+\")\").css({left:0}),i.children(\":eq(\"+d+\")\").css({display:\"none\",left:0,zIndex:0},a.data(m,\"current\",g),a.data(m,\"animating\",!1),m.options.callback.complete(g+1))}))},d.prototype._fade=function(b){var c,d,e,f,g,h=this;return c=a(this.element),this.data=a.data(this),this.data.animating||b===this.data.current+1?void 0:(a.data(this,\"animating\",!0),d=this.data.current,b?(b-=1,g=b>d?1:-1,e=b):(g=\"next\"===this.data.direction?1:-1,e=d+g),-1===e&&(e=this.data.total-1),e===this.data.total&&(e=0),this._setActive(e),f=a(\".slidesjs-control\",c),f.children(\":eq(\"+e+\")\").css({display:\"none\",left:0,zIndex:10}),this.options.callback.start(d+1),this.options.effect.fade.crossfade?(f.children(\":eq(\"+this.data.current+\")\").stop().fadeOut(this.options.effect.fade.speed),f.children(\":eq(\"+e+\")\").stop().fadeIn(this.options.effect.fade.speed,function(){return f.children(\":eq(\"+e+\")\").css({zIndex:0}),a.data(h,\"animating\",!1),a.data(h,\"current\",e),h.options.callback.complete(e+1)})):f.children(\":eq(\"+d+\")\").stop().fadeOut(this.options.effect.fade.speed,function(){return f.children(\":eq(\"+e+\")\").stop().fadeIn(h.options.effect.fade.speed,function(){return f.children(\":eq(\"+e+\")\").css({zIndex:10})}),a.data(h,\"animating\",!1),a.data(h,\"current\",e),h.options.callback.complete(e+1)}))},d.prototype._getVendorPrefix=function(){var a,b,d,e,f;for(a=c.body||c.documentElement,d=a.style,e=\"transition\",f=[\"Moz\",\"Webkit\",\"Khtml\",\"O\",\"ms\"],e=e.charAt(0).toUpperCase()+e.substr(1),b=0;f.length>b;){if(\"string\"==typeof d[f[b]+e])return f[b];b++}return!1},a.fn[f]=function(b){return this.each(function(){return a.data(this,\"plugin_\"+f)?void 0:a.data(this,\"plugin_\"+f,new d(this,b))})}})(jQuery,window,document)}).call(this);\n'),(200,4,'exp_templates','template_data',1366234347,1,'<div id=\"footcontain\">\n<div id=\"footer\">\n		<div id=\"foot-home\">\n			<a href=\"\"><h2>Home</h2></a>\n			<ul>\n				<li><a href=\"\"><h2>Books + Movies</h2></a></li>\n				<li><a href=\"\">Saving Italy</a></li>\n				<li><a href=\"\">The Monuments Men</a></li>\n				<li><a href=\"\">Rescung Davinci</a></li>\n				<li><a href=\"\">Rape of Europa Collectors Edition</a></li>\n				<li><a href=\"\">The Monuments Men Feature Film</a></li>\n				<li><a href=\"\">Beyond the Dreams of Avarice</a></li>\n			\n			</ul>\n		</div>\n		<div id=\"foot-edu\">\n			<ul>\n				<li><a href=\"\"><h2>For Educators</h2></a></li>\n				<li><a href=\"\">Free Lesson Plans</a></li>\n				<li><a href=\"\">Glossary</a></li>\n				<li><a href=\"\">Writing Team</a></li>\n				<li><a href=\"\">Advisory Board</a></li>\n				<li><a href=\"\">Supporters</a></li>\n			</ul>\n		</div>\n		<div id=\"foot-heroes\">\n			<ul>\n				<li><a href=\"\"><h2>The Heroes</h2></a></li>\n				<li><a href=\"\">Monuments Men</a></li>\n				<li><a href=\"\">Roberts Commission</a></li>\n				<li><a href=\"\">The American Committy of Learned Societies</a></li>\n				<li><a href=\"\">The Harvard Group</a></li>\n			</ul>\n		</div>\n		<div id=\"foot-speaking\">\n			<ul>\n				<li><a href=\"\"><h2>Speaking Engagements</h2></a></li>\n				<li><a href=\"\">Events</a></li>\n			</ul>\n			<ul>\n				<li><a href=\"\"><h2>Store</h2></a></li>\n				<li><a href=\"\">Products</a></li>\n				<li><a href=\"\">Cart/Checkout</a></li>\n			</ul>\n		</div>\n		<div id=\"foot-about\">\n			<ul>\n				<li><a href=\"\"><h2>About Robert Edsel</h2></a></li>\n				<li><a href=\"\">News</a></li>\n				<li><a href=\"\">Blog</a></li>\n				<li><a href=\"\">Press Inquiries</a></li>\n				<li><a href=\"\">Contact Us</a></li>\n			</ul>\n		</div>\n	</div>\n</div>'),(214,7,'exp_templates','template_data',1366299043,1,'$(function(){\n\n    $(\"ul.dropdown li\").hover(function(){\n    \n        $(this).addClass(\"hover\");\n        $(\'ul:first\',this).css(\'visibility\', \'visible\');\n    \n    }, function(){\n    \n        $(this).removeClass(\"hover\");\n        $(\'ul:first\',this).css(\'visibility\', \'hidden\');\n    \n    });\n    \n    $(\"ul.dropdown li ul li:has(ul)\").find(\"a:first\").append(\" &raquo; \");\n\n});'),(225,8,'exp_templates','template_data',1366303242,1,'$(function(){\n\n    var config = {    \n         sensitivity: 3, // number = sensitivity threshold (must be 1 or higher)    \n         interval: 200,  // number = milliseconds for onMouseOver polling interval    \n         over: doOpen,   // function = onMouseOver callback (REQUIRED)    \n         timeout: 200,   // number = milliseconds delay before onMouseOut    \n         out: doClose    // function = onMouseOut callback (REQUIRED)    \n    };\n    \n    function doOpen() {\n        $(this).addClass(\"hover\");\n        $(\'ul:first\',this).css(\'visibility\', \'visible\');\n    }\n \n    function doClose() {\n        $(this).removeClass(\"hover\");\n        $(\'ul:first\',this).css(\'visibility\', \'hidden\');\n    }\n\n    $(\"ul.dropdown li\").hoverIntent(config);\n    \n    $(\"ul.dropdown li ul li:has(ul)\").find(\"a:first\").append(\" &raquo; \");\n\n});'),(226,9,'exp_templates','template_data',1366303294,1,'(function($){\n	/* hoverIntent by Brian Cherne */\n	$.fn.hoverIntent = function(f,g) {\n		// default configuration options\n		var cfg = {\n			sensitivity: 7,\n			interval: 100,\n			timeout: 0\n		};\n		// override configuration options with user supplied object\n		cfg = $.extend(cfg, g ? { over: f, out: g } : f );\n\n		// instantiate variables\n		// cX, cY = current X and Y position of mouse, updated by mousemove event\n		// pX, pY = previous X and Y position of mouse, set by mouseover and polling interval\n		var cX, cY, pX, pY;\n\n		// A private function for getting mouse position\n		var track = function(ev) {\n			cX = ev.pageX;\n			cY = ev.pageY;\n		};\n\n		// A private function for comparing current and previous mouse position\n		var compare = function(ev,ob) {\n			ob.hoverIntent_t = clearTimeout(ob.hoverIntent_t);\n			// compare mouse positions to see if they\'ve crossed the threshold\n			if ( ( Math.abs(pX-cX) + Math.abs(pY-cY) ) < cfg.sensitivity ) {\n				$(ob).unbind(\"mousemove\",track);\n				// set hoverIntent state to true (so mouseOut can be called)\n				ob.hoverIntent_s = 1;\n				return cfg.over.apply(ob,[ev]);\n			} else {\n				// set previous coordinates for next time\n				pX = cX; pY = cY;\n				// use self-calling timeout, guarantees intervals are spaced out properly (avoids JavaScript timer bugs)\n				ob.hoverIntent_t = setTimeout( function(){compare(ev, ob);} , cfg.interval );\n			}\n		};\n\n		// A private function for delaying the mouseOut function\n		var delay = function(ev,ob) {\n			ob.hoverIntent_t = clearTimeout(ob.hoverIntent_t);\n			ob.hoverIntent_s = 0;\n			return cfg.out.apply(ob,[ev]);\n		};\n\n		// A private function for handling mouse \'hovering\'\n		var handleHover = function(e) {\n			// next three lines copied from jQuery.hover, ignore children onMouseOver/onMouseOut\n			var p = (e.type == \"mouseover\" ? e.fromElement : e.toElement) || e.relatedTarget;\n			while ( p && p != this ) { try { p = p.parentNode; } catch(e) { p = this; } }\n			if ( p == this ) { return false; }\n\n			// copy objects to be passed into t (required for event object to be passed in IE)\n			var ev = jQuery.extend({},e);\n			var ob = this;\n\n			// cancel hoverIntent timer if it exists\n			if (ob.hoverIntent_t) { ob.hoverIntent_t = clearTimeout(ob.hoverIntent_t); }\n\n			// else e.type == \"onmouseover\"\n			if (e.type == \"mouseover\") {\n				// set \"previous\" X and Y position based on initial entry point\n				pX = ev.pageX; pY = ev.pageY;\n				// update \"current\" X and Y position based on mousemove\n				$(ob).bind(\"mousemove\",track);\n				// start polling interval (self-calling timeout) to compare mouse coordinates over time\n				if (ob.hoverIntent_s != 1) { ob.hoverIntent_t = setTimeout( function(){compare(ev,ob);} , cfg.interval );}\n\n			// else e.type == \"onmouseout\"\n			} else {\n				// unbind expensive mousemove event\n				$(ob).unbind(\"mousemove\",track);\n				// if hoverIntent state is true, then call the mouseOut function after the specified delay\n				if (ob.hoverIntent_s == 1) { ob.hoverIntent_t = setTimeout( function(){delay(ev,ob);} , cfg.timeout );}\n			}\n		};\n\n		// bind the function to the two event listeners\n		return this.mouseover(handleHover).mouseout(handleHover);\n	};\n	\n})(jQuery);'),(230,8,'exp_templates','template_data',1366304143,1,'$(function(){\n\n    var config = {    \n         sensitivity: 3, // number = sensitivity threshold (must be 1 or higher)    \n         interval: 200,  // number = milliseconds for onMouseOver polling interval    \n         over: doOpen,   // function = onMouseOver callback (REQUIRED)    \n         timeout: 200,   // number = milliseconds delay before onMouseOut    \n         out: doClose    // function = onMouseOut callback (REQUIRED)    \n    };\n    \n    function doOpen() {\n        $(this).addClass(\"hover\");\n        $(\'ul:first\',this).css(\'visibility\', \'visible\');\n    }\n \n    function doClose() {\n        $(this).removeClass(\"hover\");\n        $(\'ul:first\',this).css(\'visibility\', \'hidden\');\n    }\n\n    $(\"ul.dropdown li\").hoverIntent(config);\n    \n  //  $(\"ul.dropdown li ul li:has(ul)\").find(\"a:first\").append(\" &raquo; \");\n\n});'),(249,5,'exp_templates','template_data',1366310193,1,'<div id=\"navcontain\">\n	<div id=\"nav\">\n		\n			<a href=\"\"><img src=\"{main_site_root}/images/home/logo.png\" class=\"logo\"></a>\n			<ul class=\"dropdown\">\n				<li><a href=\"#\">Books &amp; Movies</a>\n					<ul class=\"sub_menu\">\n						 <li>\n							<a href=\"#\">Saving Italy<hr  class=\"navrule\"></a>\n							\n							<ul>\n								<li><a href=\"#\">Excerpt<hr  class=\"navrule\"></a></li>\n								<li><a href=\"#\">Docs &amp; Photos<hr  class=\"navrule\"></a></li>\n							</ul>\n						</li>\n						<li>\n							<a href=\"#\">The Monuments Men<hr  class=\"navrule\"></a>\n							<ul>\n								<li><a href=\"#\">Excerpt<hr  class=\"navrule\"></a></li>\n								<li><a href=\"#\">Docs &amp; Photos<hr  class=\"navrule\"></a></li>\n							</ul>\n						</li>\n						<li>\n							<a href=\"#\">Rescuing Davinci<hr  class=\"navrule\"></a>\n							<ul>\n								<li><a href=\"#\">Excerpt<hr  class=\"navrule\"></a></li>\n								<li><a href=\"#\">Docs &amp; Photos<hr  class=\"navrule\"></a></li>\n							</ul>\n						 </li>\n						 <li><a href=\"#\">Rape of Europa Collector\'s Edition<hr  class=\"navrule\"></a></li>\n						 <li><a href=\"#\">The Monuments Men Feature Film<hr  class=\"navrule\"></a></li>\n						 <li><a href=\"#\">Beyond the Dreams of Avarice</a></li>\n					</ul>\n				</li>\n			</ul>\n			<ul class=\"dropdown\">\n				<li><a href=\"#\">The Heroes</a>\n					<ul class=\"sub_menu\">\n						 <li>\n							<a href=\"#\">Monuments Men<hr  class=\"navrule\"></a>\n							\n						</li>\n						<li>\n							<a href=\"#\">Roberts Commision<hr  class=\"navrule\"></a>\n							\n						</li>\n						<li>\n							<a href=\"#\">The American Committee of Learned Societies<hr  class=\"navrule\"></a>\n							\n						 </li>\n						 <li><a href=\"#\">The Harvard Group</a></li>\n						 \n					</ul>\n				</li>\n			</ul>\n			<ul class=\"dropdown\">\n				<li><a href=\"#\">Speaking Engagements</a>\n					<ul class=\"sub_menu\">\n						 <li>\n							<a href=\"#\">Events<hr  class=\"navrule\"></a>\n						</li>\n					</ul>\n				</li>\n			</ul>\n			<ul class=\"dropdown\">\n				<li><a href=\"#\">About Robert Edsel</a>\n					<ul class=\"sub_menu\">\n						 <li>\n							<a href=\"#\">Blog<hr  class=\"navrule\"></a>\n							\n						</li>\n						<li>\n							<a href=\"#\">News<hr  class=\"navrule\"></a>\n							\n						</li>\n						<li>\n							<a href=\"#\">Press Inquiries<hr  class=\"navrule\"></a>\n							\n						 </li>\n						 <li><a href=\"#\">Contact Us</a></li>\n						 \n					</ul>\n				</li>\n			</ul>\n	</div>\n</div>'),(252,1,'exp_templates','template_data',1366312954,1,'{html-head}\n{global-css}\n <!-- SlidesJS Required: These styles are required if you\'d like a responsive slideshow -->\n  <style>\n    #slides {\n      display: none\n    }\n\n    .container {\n      margin: 0 auto\n	  width: 1045px\n    }\n	.slidesjs-navigation{\n	display:none !important;\n	}\n  \n  </style>\n  <!-- SlidesJS Required: -->\n{html-head-end}\n\n<body>\n\n	{embed=\'global-embeds/main-nav\'}\n<div id=\"wrapper\">\n	<br clear=\"both\">\n	<div id=\"homecell\">\n		<div id=\"hero1\">\n			<div class=\"container\">\n    <div id=\"slides\">\n      <img src=\"{main_site_root}images/home/heroimage0.png\" class=\"homeslide\" usemap=\"#heroimage0\">\n      <img src=\"{main_site_root}images/home/heroimage1.png\" class=\"homeslide\" usemap=\"#heroimage1\">\n      <img src=\"{main_site_root}images/home/heroimage1.png\" class=\"homeslide\" usemap=\"#heroimage1\">\n      <img src=\"{main_site_root}images/home/heroimage1.png\" class=\"homeslide\" usemap=\"#heroimage1\">\n	</div>\n	<map name=\"heroimage0\">\n		  <area shape=\"rect\" alt=\"desc\" title=\"\" coords=\"22,46,1159,395\" href=\"\" target=\"\" />\n		  <area shape=\"rect\" coords=\"766,435,1057,474\" alt=\"order the book\" href=\"\">\n		  <area shape=\"rect\" coords=\"890,482,916,504\" alt=\"facebook\" href=\"\">\n		  <area shape=\"rect\" coords=\"919,493,935,508\" alt=\"twitter\" href=\"\">\n		  <area shape=\"rect\" coords=\"940,492,955,508\" alt=\"google+\" href=\"\">\n		  <area shape=\"rect\" coords=\"959,492,975,508\" alt=\"youtube\" href=\"\">\n		</map>\n		<map name=\"heroimage1\">\n		  <area shape=\"rect\" alt=\"desc\" title=\"\" coords=\"22,46,1159,395\" href=\"\" target=\"\" />\n		  <area shape=\"rect\" coords=\"766,435,1057,474\" alt=\"order the book\" href=\"\">\n		  <area shape=\"rect\" coords=\"890,482,916,504\" alt=\"facebook\" href=\"\">\n		  <area shape=\"rect\" coords=\"919,493,935,508\" alt=\"twitter\" href=\"\">\n		  <area shape=\"rect\" coords=\"940,492,955,508\" alt=\"google+\" href=\"\">\n		  <area shape=\"rect\" coords=\"959,492,975,508\" alt=\"youtube\" href=\"\">\n		</map>\n  </div>\n		</div>\n	</div>\n	<div id=\"homedyn\">\n		<div id=\"homeblogpreviews\">\n			<h1>Latest news, press &amp; blog posts</h1>\n			<?PHP\n \n	/******************************************************************************************************************\n	   RSS PARSING FUNCTION\n	******************************************************************************************************************/\n \n	//FUNCTION TO PARSE RSS IN PHP 4 OR PHP 4\n	function parseRSS($url) { \n \n	//PARSE RSS FEED\n        $feedeed = implode(\'\', file($url));\n        $parser = xml_parser_create();\n        xml_parse_into_struct($parser, $feedeed, $valueals, $index);\n        xml_parser_free($parser);\n \n	//CONSTRUCT ARRAY\n        foreach($valueals as $keyey => $valueal){\n            if($valueal[\'type\'] != \'cdata\') {\n                $item[$keyey] = $valueal;\n			}\n        }\n \n        $i = 0;\n\n        foreach($item as $key => $value){\n\n            if($value[\'type\'] == \'open\') {\n \n                $i++;\n                $itemame[$i] = $value[\'tag\'];\n \n            } elseif($value[\'type\'] == \'close\') {\n \n                $feed = $values[$i];\n                $item = $itemame[$i];\n                $i--;\n \n                if(count($values[$i])>1){\n                    $values[$i][$item][] = $feed;\n                } else {\n                    $values[$i][$item] = $feed;\n                }\n \n            } else {\n                $values[$i][$value[\'tag\']] = $value[\'value\'];  \n            }\n        }\n \n	//RETURN ARRAY VALUES\n        return $values[0];\n		//print_R($values);\n	} \n \n	\n	\n \n	//PARSE THE RSS FEED INTO ARRAY\n	$xml = parseRSS(\"http://www.monumentsmen.com/blog/feed/\");\n	$content = ($xml[\'RSS\'][\'CHANNEL\'][\'ITEM\'][0][\'CONTENT:ENCODED\']);\n	preg_match_all(\'/<img[^>]+>/i\',$content, $result); \n	echo \"<div id=\'homeblog1\' class=\'homeblogs\'><div class=\'homeblogimg\'>\";\n	echo $result[0][0] . \"</div><br clear=\'both\'>\";\n	echo \"<h3>\" . ($xml[\'RSS\'][\'CHANNEL\'][\'ITEM\'][0][\'TITLE\']) . \"</h3>\";\n	echo \"<p>\" . ($xml[\'RSS\'][\'CHANNEL\'][\'ITEM\'][0][\'PUBDATE\']) . \"</p>\";\n	echo \"<a href=\'\" . ($xml[\'RSS\'][\'CHANNEL\'][\'ITEM\'][0][\'LINK\']) .  \"\'>Read Blog Post</a>\";\n	echo \"</div>\";\n	echo \"<div id=\'homeblog2\' class=\'homeblogs\'><div class=\'homeblogimg\'>\";\n	$content = ($xml[\'RSS\'][\'CHANNEL\'][\'ITEM\'][1][\'CONTENT:ENCODED\']);\n	preg_match_all(\'/<img[^>]+>/i\',$content, $result); \n	echo $result[0][0] . \"</div><br clear=\'both\'>\";\n	echo \"<h3>\" . ($xml[\'RSS\'][\'CHANNEL\'][\'ITEM\'][1][\'TITLE\']) . \"</h3>\";\n	echo \"<p>\" . ($xml[\'RSS\'][\'CHANNEL\'][\'ITEM\'][1][\'PUBDATE\']) . \"</p>\";\n	echo \"<a href=\'\" . ($xml[\'RSS\'][\'CHANNEL\'][\'ITEM\'][1][\'LINK\']) .  \"\'>Read Blog Post</a>\";\n	echo \"</div>\";\n	\n\n	\n \n?>\n			\n			\n		</div>\n		<div id=\"homeevents\">\n			<h1>Upcoming Events</h1>\n			<ul>\n				<li>\n				<h3>Barnes and noble</h3>\n				<p>Fort Worth, Tx</p>\n				<p>May 18th, 2013</p>\n				</li>\n			</ul>\n			\n		</div>\n	</div>\n	<br clear=\"both\">\n	<div id=\"homecontent\">\n	  <div id=\"home-static-image\">\n	  </div>\n	  <div id=home-static-text>\n	  <h2>Who Were the Monuments Men?</h2>\n	  <p>\n	  The Monuments Men were a group of men and women from thirteen nations, most of whom volunteered had expertise as museum directors, curators, art scholars and educators, artists, architects, and archivists. The Monuments Men job description was simple: to save as much of the culture of Europe as they could during combat.</p>\n	  <p>\nThese men not only had the vision to understand the grave threat to the greatest cultural and artistic achievements of civilization, but then joined the front lines to do something about it. Learn More</p>\n	  </div>\n	</div>\n	<br clear=\"both\">\n</div>\n	{embed=\'global-embeds/site-footer\'}\n\n<!-- SlidesJS Required: Initialize SlidesJS with a jQuery doc ready -->\n  <script>\n    $(function() {\n      $(\'#slides\').slidesjs({\n        width: 940,\n        height: 528,\n        play: {\n          active: true,\n          auto: true,\n          interval: 5000,\n          swap: true\n        }\n      });\n    });\n  </script>\n  <!-- End SlidesJS Required -->\n{html-close}'),(253,5,'exp_templates','template_data',1366313248,1,'<div id=\"navcontain\">\n	<div id=\"nav\">\n		\n			<a href=\"\"><img src=\"{main_site_root}/images/home/logo.png\" class=\"logo\"></a>\n			<ul class=\"dropdown\">\n				<li><a href=\"#\">Books &amp; Movies</a>\n					<ul class=\"sub_menu\">\n						 <li>\n							<a href=\"#\">Saving Italy<hr  class=\"navrule\"></a>\n							\n							<ul>\n								<li><a href=\"#\">Excerpt<hr  class=\"navrule\"></a></li>\n								<li><a href=\"#\">Docs &amp; Photos<hr  class=\"navrule\"></a></li>\n							</ul>\n						</li>\n						<li>\n							<a href=\"#\">The Monuments Men<hr  class=\"navrule\"></a>\n							<ul>\n								<li><a href=\"#\">Excerpt<hr  class=\"navrule\"></a></li>\n								<li><a href=\"#\">Docs &amp; Photos<hr  class=\"navrule\"></a></li>\n							</ul>\n						</li>\n						<li>\n							<a href=\"#\">Rescuing Davinci<hr  class=\"navrule\"></a>\n							<ul>\n								<li><a href=\"#\">Excerpt<hr  class=\"navrule\"></a></li>\n								<li><a href=\"#\">Docs &amp; Photos<hr  class=\"navrule\"></a></li>\n							</ul>\n						 </li>\n						 <li><a href=\"#\">Rape of Europa Collector\'s Edition<hr  class=\"navrule\"></a></li>\n						 <li><a href=\"#\">The Monuments Men Feature Film<hr  class=\"navrule\"></a></li>\n						 <li><a href=\"#\">Beyond the Dreams of Avarice</a></li>\n					</ul>\n				</li>\n			</ul>\n			<ul class=\"dropdown\">\n				<li><a href=\"#\">The Heroes</a>\n					<ul class=\"sub_menu\">\n						 <li>\n							<a href=\"#\">Monuments Men<hr  class=\"navrule\"></a>\n							\n						</li>\n						<li>\n							<a href=\"#\">Roberts Commision<hr  class=\"navrule\"></a>\n							\n						</li>\n						<li>\n							<a href=\"#\">The American Committee of Learned Societies<hr  class=\"navrule\"></a>\n							\n						 </li>\n						 <li><a href=\"#\">The Harvard Group</a></li>\n						 \n					</ul>\n				</li>\n			</ul>\n			<ul class=\"dropdown\">\n				<li><a href=\"#\">Speaking Engagements</a>\n					<ul class=\"sub_menu\">\n						 <li>\n							<a href=\"#\">Events</a>\n						</li>\n					</ul>\n				</li>\n			</ul>\n			<ul class=\"dropdown\">\n				<li><a href=\"#\">About Robert Edsel</a>\n					<ul class=\"sub_menu\">\n						 <li>\n							<a href=\"#\">Blog<hr  class=\"navrule\"></a>\n							\n						</li>\n						<li>\n							<a href=\"#\">News<hr  class=\"navrule\"></a>\n							\n						</li>\n						<li>\n							<a href=\"#\">Press Inquiries<hr  class=\"navrule\"></a>\n							\n						 </li>\n						 <li><a href=\"#\">Contact Us</a></li>\n						 \n					</ul>\n				</li>\n			</ul>\n	</div>\n</div>'),(256,1,'exp_templates','template_data',1366316402,1,'{html-head}\n{global-css}\n <!-- SlidesJS Required: These styles are required if you\'d like a responsive slideshow -->\n  <style>\n    #slides {\n      display: none\n    }\n\n    .container {\n      margin: 0 auto\n	  width: 1045px\n    }\n	.slidesjs-navigation{\n	display:none !important;\n	}\n  \n  </style>\n  <!-- SlidesJS Required: -->\n{html-head-end}\n\n<body>\n\n	{embed=\'global-embeds/main-nav\'}\n<div id=\"wrapper\">\n	<br clear=\"both\">\n	<div id=\"homecell\">\n		<div id=\"hero1\">\n			<div class=\"container\">\n    <div id=\"slides\">\n      <img src=\"{main_site_root}images/home/heroimage0.png\" class=\"homeslide\" usemap=\"#heroimage0\">\n      <img src=\"{main_site_root}images/home/heroimage1.png\" class=\"homeslide\" usemap=\"#heroimage1\">\n      <img src=\"{main_site_root}images/home/heroimage1.png\" class=\"homeslide\" usemap=\"#heroimage1\">\n      <img src=\"{main_site_root}images/home/heroimage1.png\" class=\"homeslide\" usemap=\"#heroimage1\">\n	</div>\n	<map name=\"heroimage0\">\n		  <area shape=\"rect\" alt=\"desc\" title=\"\" coords=\"22,46,1159,395\" href=\"\" target=\"\" />\n		  <area shape=\"rect\" coords=\"766,435,1057,474\" alt=\"order the book\" href=\"\">\n		  <area shape=\"rect\" coords=\"890,482,916,504\" alt=\"facebook\" href=\"\">\n		  <area shape=\"rect\" coords=\"919,493,935,508\" alt=\"twitter\" href=\"\">\n		  <area shape=\"rect\" coords=\"940,492,955,508\" alt=\"google+\" href=\"\">\n		  <area shape=\"rect\" coords=\"959,492,975,508\" alt=\"youtube\" href=\"\">\n		</map>\n		<map name=\"heroimage1\">\n		  <area shape=\"rect\" alt=\"desc\" title=\"\" coords=\"22,46,1159,395\" href=\"\" target=\"\" />\n		  <area shape=\"rect\" coords=\"766,435,1057,474\" alt=\"order the book\" href=\"\">\n		  <area shape=\"rect\" coords=\"890,482,916,504\" alt=\"facebook\" href=\"\">\n		  <area shape=\"rect\" coords=\"919,493,935,508\" alt=\"twitter\" href=\"\">\n		  <area shape=\"rect\" coords=\"940,492,955,508\" alt=\"google+\" href=\"\">\n		  <area shape=\"rect\" coords=\"959,492,975,508\" alt=\"youtube\" href=\"\">\n		</map>\n  </div>\n		</div>\n	</div>\n	<div id=\"homedyn\">\n		<div id=\"homeblogpreviews\">\n			<h1>Latest news, press &amp; blog posts</h1>\n			<?PHP\n \n	/******************************************************************************************************************\n	   RSS PARSING FUNCTION\n	******************************************************************************************************************/\n \n	//FUNCTION TO PARSE RSS IN PHP 4 OR PHP 4\n	function parseRSS($url) { \n \n	//PARSE RSS FEED\n        $feedeed = implode(\'\', file($url));\n        $parser = xml_parser_create();\n        xml_parse_into_struct($parser, $feedeed, $valueals, $index);\n        xml_parser_free($parser);\n \n	//CONSTRUCT ARRAY\n        foreach($valueals as $keyey => $valueal){\n            if($valueal[\'type\'] != \'cdata\') {\n                $item[$keyey] = $valueal;\n			}\n        }\n \n        $i = 0;\n\n        foreach($item as $key => $value){\n\n            if($value[\'type\'] == \'open\') {\n \n                $i++;\n                $itemame[$i] = $value[\'tag\'];\n \n            } elseif($value[\'type\'] == \'close\') {\n \n                $feed = $values[$i];\n                $item = $itemame[$i];\n                $i--;\n \n                if(count($values[$i])>1){\n                    $values[$i][$item][] = $feed;\n                } else {\n                    $values[$i][$item] = $feed;\n                }\n \n            } else {\n                $values[$i][$value[\'tag\']] = $value[\'value\'];  \n            }\n        }\n \n	//RETURN ARRAY VALUES\n        return $values[0];\n		//print_R($values);\n	} \n \n	\n	\n \n	//PARSE THE RSS FEED INTO ARRAY\n	$xml = parseRSS(\"http://www.monumentsmen.com/blog/feed/\");\n	$content = ($xml[\'RSS\'][\'CHANNEL\'][\'ITEM\'][0][\'CONTENT:ENCODED\']);\n	preg_match_all(\'/<img[^>]+>/i\',$content, $result); \n	echo \"<div id=\'homeblog1\' class=\'homeblogs\'><div class=\'homeblogimg\'>\";\n	echo $result[0][0] . \"</div><br clear=\'both\'>\";\n	echo \"<h3>\" . ($xml[\'RSS\'][\'CHANNEL\'][\'ITEM\'][0][\'TITLE\']) . \"</h3>\";\n	echo \"<p>\" . ($xml[\'RSS\'][\'CHANNEL\'][\'ITEM\'][0][\'PUBDATE\']) . \"</p>\";\n	echo \"<a href=\'\" . ($xml[\'RSS\'][\'CHANNEL\'][\'ITEM\'][0][\'LINK\']) .  \"\'>Read Blog Post</a>\";\n	echo \"</div>\";\n	echo \"<div id=\'homeblog2\' class=\'homeblogs\'><div class=\'homeblogimg\'>\";\n	$content = ($xml[\'RSS\'][\'CHANNEL\'][\'ITEM\'][1][\'CONTENT:ENCODED\']);\n	preg_match_all(\'/<img[^>]+>/i\',$content, $result); \n	echo $result[0][0] . \"</div><br clear=\'both\'>\";\n	echo \"<h3>\" . ($xml[\'RSS\'][\'CHANNEL\'][\'ITEM\'][1][\'TITLE\']) . \"</h3>\";\n	echo \"<p>\" . ($xml[\'RSS\'][\'CHANNEL\'][\'ITEM\'][1][\'PUBDATE\']) . \"</p>\";\n	echo \"<a href=\'\" . ($xml[\'RSS\'][\'CHANNEL\'][\'ITEM\'][1][\'LINK\']) .  \"\'>Read Blog Post</a>\";\n	echo \"</div>\";\n	\n\n	\n \n?>\n			\n			\n		</div>\n		<div id=\"homeevents\">\n			<h1>Upcoming Events</h1>\n			<ul>\n			{exp:channel:upcomingevents channel=\"news\" limit=\"4\"}\n				<li>\n					<h3>{event-title}</h3>\n					<p>{event-location}</p>\n					<p>{event-date}</p>\n				</li>\n			{/exp:channel:upcomingevents}\n			</ul>\n		</div>\n	</div>\n	<br clear=\"both\">\n	<div id=\"homecontent\">\n	  <div id=\"home-static-image\">\n	  </div>\n	  <div id=home-static-text>\n	  <h2>Who Were the Monuments Men?</h2>\n	  <p>\n	  The Monuments Men were a group of men and women from thirteen nations, most of whom volunteered had expertise as museum directors, curators, art scholars and educators, artists, architects, and archivists. The Monuments Men job description was simple: to save as much of the culture of Europe as they could during combat.</p>\n	  <p>\nThese men not only had the vision to understand the grave threat to the greatest cultural and artistic achievements of civilization, but then joined the front lines to do something about it. Learn More</p>\n	  </div>\n	</div>\n	<br clear=\"both\">\n</div>\n	{embed=\'global-embeds/site-footer\'}\n\n<!-- SlidesJS Required: Initialize SlidesJS with a jQuery doc ready -->\n  <script>\n    $(function() {\n      $(\'#slides\').slidesjs({\n        width: 940,\n        height: 528,\n        play: {\n          active: true,\n          auto: true,\n          interval: 5000,\n          swap: true\n        }\n      });\n    });\n  </script>\n  <!-- End SlidesJS Required -->\n{html-close}'),(257,1,'exp_templates','template_data',1366316448,1,'{html-head}\n{global-css}\n <!-- SlidesJS Required: These styles are required if you\'d like a responsive slideshow -->\n  <style>\n    #slides {\n      display: none\n    }\n\n    .container {\n      margin: 0 auto\n	  width: 1045px\n    }\n	.slidesjs-navigation{\n	display:none !important;\n	}\n  \n  </style>\n  <!-- SlidesJS Required: -->\n{html-head-end}\n\n<body>\n\n	{embed=\'global-embeds/main-nav\'}\n<div id=\"wrapper\">\n	<br clear=\"both\">\n	<div id=\"homecell\">\n		<div id=\"hero1\">\n			<div class=\"container\">\n    <div id=\"slides\">\n      <img src=\"{main_site_root}images/home/heroimage0.png\" class=\"homeslide\" usemap=\"#heroimage0\">\n      <img src=\"{main_site_root}images/home/heroimage1.png\" class=\"homeslide\" usemap=\"#heroimage1\">\n      <img src=\"{main_site_root}images/home/heroimage1.png\" class=\"homeslide\" usemap=\"#heroimage1\">\n      <img src=\"{main_site_root}images/home/heroimage1.png\" class=\"homeslide\" usemap=\"#heroimage1\">\n	</div>\n	<map name=\"heroimage0\">\n		  <area shape=\"rect\" alt=\"desc\" title=\"\" coords=\"22,46,1159,395\" href=\"\" target=\"\" />\n		  <area shape=\"rect\" coords=\"766,435,1057,474\" alt=\"order the book\" href=\"\">\n		  <area shape=\"rect\" coords=\"890,482,916,504\" alt=\"facebook\" href=\"\">\n		  <area shape=\"rect\" coords=\"919,493,935,508\" alt=\"twitter\" href=\"\">\n		  <area shape=\"rect\" coords=\"940,492,955,508\" alt=\"google+\" href=\"\">\n		  <area shape=\"rect\" coords=\"959,492,975,508\" alt=\"youtube\" href=\"\">\n		</map>\n		<map name=\"heroimage1\">\n		  <area shape=\"rect\" alt=\"desc\" title=\"\" coords=\"22,46,1159,395\" href=\"\" target=\"\" />\n		  <area shape=\"rect\" coords=\"766,435,1057,474\" alt=\"order the book\" href=\"\">\n		  <area shape=\"rect\" coords=\"890,482,916,504\" alt=\"facebook\" href=\"\">\n		  <area shape=\"rect\" coords=\"919,493,935,508\" alt=\"twitter\" href=\"\">\n		  <area shape=\"rect\" coords=\"940,492,955,508\" alt=\"google+\" href=\"\">\n		  <area shape=\"rect\" coords=\"959,492,975,508\" alt=\"youtube\" href=\"\">\n		</map>\n  </div>\n		</div>\n	</div>\n	<div id=\"homedyn\">\n		<div id=\"homeblogpreviews\">\n			<h1>Latest news, press &amp; blog posts</h1>\n			<?PHP\n \n	/******************************************************************************************************************\n	   RSS PARSING FUNCTION\n	******************************************************************************************************************/\n \n	//FUNCTION TO PARSE RSS IN PHP 4 OR PHP 4\n	function parseRSS($url) { \n \n	//PARSE RSS FEED\n        $feedeed = implode(\'\', file($url));\n        $parser = xml_parser_create();\n        xml_parse_into_struct($parser, $feedeed, $valueals, $index);\n        xml_parser_free($parser);\n \n	//CONSTRUCT ARRAY\n        foreach($valueals as $keyey => $valueal){\n            if($valueal[\'type\'] != \'cdata\') {\n                $item[$keyey] = $valueal;\n			}\n        }\n \n        $i = 0;\n\n        foreach($item as $key => $value){\n\n            if($value[\'type\'] == \'open\') {\n \n                $i++;\n                $itemame[$i] = $value[\'tag\'];\n \n            } elseif($value[\'type\'] == \'close\') {\n \n                $feed = $values[$i];\n                $item = $itemame[$i];\n                $i--;\n \n                if(count($values[$i])>1){\n                    $values[$i][$item][] = $feed;\n                } else {\n                    $values[$i][$item] = $feed;\n                }\n \n            } else {\n                $values[$i][$value[\'tag\']] = $value[\'value\'];  \n            }\n        }\n \n	//RETURN ARRAY VALUES\n        return $values[0];\n		//print_R($values);\n	} \n \n	\n	\n \n	//PARSE THE RSS FEED INTO ARRAY\n	$xml = parseRSS(\"http://www.monumentsmen.com/blog/feed/\");\n	$content = ($xml[\'RSS\'][\'CHANNEL\'][\'ITEM\'][0][\'CONTENT:ENCODED\']);\n	preg_match_all(\'/<img[^>]+>/i\',$content, $result); \n	echo \"<div id=\'homeblog1\' class=\'homeblogs\'><div class=\'homeblogimg\'>\";\n	echo $result[0][0] . \"</div><br clear=\'both\'>\";\n	echo \"<h3>\" . ($xml[\'RSS\'][\'CHANNEL\'][\'ITEM\'][0][\'TITLE\']) . \"</h3>\";\n	echo \"<p>\" . ($xml[\'RSS\'][\'CHANNEL\'][\'ITEM\'][0][\'PUBDATE\']) . \"</p>\";\n	echo \"<a href=\'\" . ($xml[\'RSS\'][\'CHANNEL\'][\'ITEM\'][0][\'LINK\']) .  \"\'>Read Blog Post</a>\";\n	echo \"</div>\";\n	echo \"<div id=\'homeblog2\' class=\'homeblogs\'><div class=\'homeblogimg\'>\";\n	$content = ($xml[\'RSS\'][\'CHANNEL\'][\'ITEM\'][1][\'CONTENT:ENCODED\']);\n	preg_match_all(\'/<img[^>]+>/i\',$content, $result); \n	echo $result[0][0] . \"</div><br clear=\'both\'>\";\n	echo \"<h3>\" . ($xml[\'RSS\'][\'CHANNEL\'][\'ITEM\'][1][\'TITLE\']) . \"</h3>\";\n	echo \"<p>\" . ($xml[\'RSS\'][\'CHANNEL\'][\'ITEM\'][1][\'PUBDATE\']) . \"</p>\";\n	echo \"<a href=\'\" . ($xml[\'RSS\'][\'CHANNEL\'][\'ITEM\'][1][\'LINK\']) .  \"\'>Read Blog Post</a>\";\n	echo \"</div>\";\n	\n\n	\n \n?>\n			\n			\n		</div>\n		<div id=\"homeevents\">\n			<h1>Upcoming Events</h1>\n			<ul>\n			{exp:channel:upcoming_events channel=\"news\" limit=\"4\"}\n				<li>\n					<h3>{event-title}</h3>\n					<p>{event-location}</p>\n					<p>{event-date}</p>\n				</li>\n			{/exp:channel:upcoming_events}\n			</ul>\n		</div>\n	</div>\n	<br clear=\"both\">\n	<div id=\"homecontent\">\n	  <div id=\"home-static-image\">\n	  </div>\n	  <div id=home-static-text>\n	  <h2>Who Were the Monuments Men?</h2>\n	  <p>\n	  The Monuments Men were a group of men and women from thirteen nations, most of whom volunteered had expertise as museum directors, curators, art scholars and educators, artists, architects, and archivists. The Monuments Men job description was simple: to save as much of the culture of Europe as they could during combat.</p>\n	  <p>\nThese men not only had the vision to understand the grave threat to the greatest cultural and artistic achievements of civilization, but then joined the front lines to do something about it. Learn More</p>\n	  </div>\n	</div>\n	<br clear=\"both\">\n</div>\n	{embed=\'global-embeds/site-footer\'}\n\n<!-- SlidesJS Required: Initialize SlidesJS with a jQuery doc ready -->\n  <script>\n    $(function() {\n      $(\'#slides\').slidesjs({\n        width: 940,\n        height: 528,\n        play: {\n          active: true,\n          auto: true,\n          interval: 5000,\n          swap: true\n        }\n      });\n    });\n  </script>\n  <!-- End SlidesJS Required -->\n{html-close}'),(258,1,'exp_templates','template_data',1366316586,1,'{html-head}\n{global-css}\n <!-- SlidesJS Required: These styles are required if you\'d like a responsive slideshow -->\n  <style>\n    #slides {\n      display: none\n    }\n\n    .container {\n      margin: 0 auto\n	  width: 1045px\n    }\n	.slidesjs-navigation{\n	display:none !important;\n	}\n  \n  </style>\n  <!-- SlidesJS Required: -->\n{html-head-end}\n\n<body>\n\n	{embed=\'global-embeds/main-nav\'}\n<div id=\"wrapper\">\n	<br clear=\"both\">\n	<div id=\"homecell\">\n		<div id=\"hero1\">\n			<div class=\"container\">\n    <div id=\"slides\">\n      <img src=\"{main_site_root}images/home/heroimage0.png\" class=\"homeslide\" usemap=\"#heroimage0\">\n      <img src=\"{main_site_root}images/home/heroimage1.png\" class=\"homeslide\" usemap=\"#heroimage1\">\n      <img src=\"{main_site_root}images/home/heroimage1.png\" class=\"homeslide\" usemap=\"#heroimage1\">\n      <img src=\"{main_site_root}images/home/heroimage1.png\" class=\"homeslide\" usemap=\"#heroimage1\">\n	</div>\n	<map name=\"heroimage0\">\n		  <area shape=\"rect\" alt=\"desc\" title=\"\" coords=\"22,46,1159,395\" href=\"\" target=\"\" />\n		  <area shape=\"rect\" coords=\"766,435,1057,474\" alt=\"order the book\" href=\"\">\n		  <area shape=\"rect\" coords=\"890,482,916,504\" alt=\"facebook\" href=\"\">\n		  <area shape=\"rect\" coords=\"919,493,935,508\" alt=\"twitter\" href=\"\">\n		  <area shape=\"rect\" coords=\"940,492,955,508\" alt=\"google+\" href=\"\">\n		  <area shape=\"rect\" coords=\"959,492,975,508\" alt=\"youtube\" href=\"\">\n		</map>\n		<map name=\"heroimage1\">\n		  <area shape=\"rect\" alt=\"desc\" title=\"\" coords=\"22,46,1159,395\" href=\"\" target=\"\" />\n		  <area shape=\"rect\" coords=\"766,435,1057,474\" alt=\"order the book\" href=\"\">\n		  <area shape=\"rect\" coords=\"890,482,916,504\" alt=\"facebook\" href=\"\">\n		  <area shape=\"rect\" coords=\"919,493,935,508\" alt=\"twitter\" href=\"\">\n		  <area shape=\"rect\" coords=\"940,492,955,508\" alt=\"google+\" href=\"\">\n		  <area shape=\"rect\" coords=\"959,492,975,508\" alt=\"youtube\" href=\"\">\n		</map>\n  </div>\n		</div>\n	</div>\n	<div id=\"homedyn\">\n		<div id=\"homeblogpreviews\">\n			<h1>Latest news, press &amp; blog posts</h1>\n			<?PHP\n \n	/******************************************************************************************************************\n	   RSS PARSING FUNCTION\n	******************************************************************************************************************/\n \n	//FUNCTION TO PARSE RSS IN PHP 4 OR PHP 4\n	function parseRSS($url) { \n \n	//PARSE RSS FEED\n        $feedeed = implode(\'\', file($url));\n        $parser = xml_parser_create();\n        xml_parse_into_struct($parser, $feedeed, $valueals, $index);\n        xml_parser_free($parser);\n \n	//CONSTRUCT ARRAY\n        foreach($valueals as $keyey => $valueal){\n            if($valueal[\'type\'] != \'cdata\') {\n                $item[$keyey] = $valueal;\n			}\n        }\n \n        $i = 0;\n\n        foreach($item as $key => $value){\n\n            if($value[\'type\'] == \'open\') {\n \n                $i++;\n                $itemame[$i] = $value[\'tag\'];\n \n            } elseif($value[\'type\'] == \'close\') {\n \n                $feed = $values[$i];\n                $item = $itemame[$i];\n                $i--;\n \n                if(count($values[$i])>1){\n                    $values[$i][$item][] = $feed;\n                } else {\n                    $values[$i][$item] = $feed;\n                }\n \n            } else {\n                $values[$i][$value[\'tag\']] = $value[\'value\'];  \n            }\n        }\n \n	//RETURN ARRAY VALUES\n        return $values[0];\n		//print_R($values);\n	} \n \n	\n	\n \n	//PARSE THE RSS FEED INTO ARRAY\n	$xml = parseRSS(\"http://www.monumentsmen.com/blog/feed/\");\n	$content = ($xml[\'RSS\'][\'CHANNEL\'][\'ITEM\'][0][\'CONTENT:ENCODED\']);\n	preg_match_all(\'/<img[^>]+>/i\',$content, $result); \n	echo \"<div id=\'homeblog1\' class=\'homeblogs\'><div class=\'homeblogimg\'>\";\n	echo $result[0][0] . \"</div><br clear=\'both\'>\";\n	echo \"<h3>\" . ($xml[\'RSS\'][\'CHANNEL\'][\'ITEM\'][0][\'TITLE\']) . \"</h3>\";\n	echo \"<p>\" . ($xml[\'RSS\'][\'CHANNEL\'][\'ITEM\'][0][\'PUBDATE\']) . \"</p>\";\n	echo \"<a href=\'\" . ($xml[\'RSS\'][\'CHANNEL\'][\'ITEM\'][0][\'LINK\']) .  \"\'>Read Blog Post</a>\";\n	echo \"</div>\";\n	echo \"<div id=\'homeblog2\' class=\'homeblogs\'><div class=\'homeblogimg\'>\";\n	$content = ($xml[\'RSS\'][\'CHANNEL\'][\'ITEM\'][1][\'CONTENT:ENCODED\']);\n	preg_match_all(\'/<img[^>]+>/i\',$content, $result); \n	echo $result[0][0] . \"</div><br clear=\'both\'>\";\n	echo \"<h3>\" . ($xml[\'RSS\'][\'CHANNEL\'][\'ITEM\'][1][\'TITLE\']) . \"</h3>\";\n	echo \"<p>\" . ($xml[\'RSS\'][\'CHANNEL\'][\'ITEM\'][1][\'PUBDATE\']) . \"</p>\";\n	echo \"<a href=\'\" . ($xml[\'RSS\'][\'CHANNEL\'][\'ITEM\'][1][\'LINK\']) .  \"\'>Read Blog Post</a>\";\n	echo \"</div>\";\n	\n\n	\n \n?>\n			\n			\n		</div>\n		<div id=\"homeevents\">\n			<h1>Upcoming Events</h1>\n			<ul>\n			{exp:channel:entries channel=\"upcoming_events\" limit=\"4\"}\n				<li>\n					<h3>{event-title}</h3>\n					<p>{event-location}</p>\n					<p>{event-date}</p>\n				</li>\n			{/exp:channel:entries}\n			</ul>\n		</div>\n	</div>\n	<br clear=\"both\">\n	<div id=\"homecontent\">\n	  <div id=\"home-static-image\">\n	  </div>\n	  <div id=home-static-text>\n	  <h2>Who Were the Monuments Men?</h2>\n	  <p>\n	  The Monuments Men were a group of men and women from thirteen nations, most of whom volunteered had expertise as museum directors, curators, art scholars and educators, artists, architects, and archivists. The Monuments Men job description was simple: to save as much of the culture of Europe as they could during combat.</p>\n	  <p>\nThese men not only had the vision to understand the grave threat to the greatest cultural and artistic achievements of civilization, but then joined the front lines to do something about it. Learn More</p>\n	  </div>\n	</div>\n	<br clear=\"both\">\n</div>\n	{embed=\'global-embeds/site-footer\'}\n\n<!-- SlidesJS Required: Initialize SlidesJS with a jQuery doc ready -->\n  <script>\n    $(function() {\n      $(\'#slides\').slidesjs({\n        width: 940,\n        height: 528,\n        play: {\n          active: true,\n          auto: true,\n          interval: 5000,\n          swap: true\n        }\n      });\n    });\n  </script>\n  <!-- End SlidesJS Required -->\n{html-close}'),(259,1,'exp_templates','template_data',1366316728,1,'{html-head}\n{global-css}\n <!-- SlidesJS Required: These styles are required if you\'d like a responsive slideshow -->\n  <style>\n    #slides {\n      display: none\n    }\n\n    .container {\n      margin: 0 auto\n	  width: 1045px\n    }\n	.slidesjs-navigation{\n	display:none !important;\n	}\n  \n  </style>\n  <!-- SlidesJS Required: -->\n{html-head-end}\n\n<body>\n\n	{embed=\'global-embeds/main-nav\'}\n<div id=\"wrapper\">\n	<br clear=\"both\">\n	<div id=\"homecell\">\n		<div id=\"hero1\">\n			<div class=\"container\">\n    <div id=\"slides\">\n      <img src=\"{main_site_root}images/home/heroimage0.png\" class=\"homeslide\" usemap=\"#heroimage0\">\n      <img src=\"{main_site_root}images/home/heroimage1.png\" class=\"homeslide\" usemap=\"#heroimage1\">\n      <img src=\"{main_site_root}images/home/heroimage1.png\" class=\"homeslide\" usemap=\"#heroimage1\">\n      <img src=\"{main_site_root}images/home/heroimage1.png\" class=\"homeslide\" usemap=\"#heroimage1\">\n	</div>\n	<map name=\"heroimage0\">\n		  <area shape=\"rect\" alt=\"desc\" title=\"\" coords=\"22,46,1159,395\" href=\"\" target=\"\" />\n		  <area shape=\"rect\" coords=\"766,435,1057,474\" alt=\"order the book\" href=\"\">\n		  <area shape=\"rect\" coords=\"890,482,916,504\" alt=\"facebook\" href=\"\">\n		  <area shape=\"rect\" coords=\"919,493,935,508\" alt=\"twitter\" href=\"\">\n		  <area shape=\"rect\" coords=\"940,492,955,508\" alt=\"google+\" href=\"\">\n		  <area shape=\"rect\" coords=\"959,492,975,508\" alt=\"youtube\" href=\"\">\n		</map>\n		<map name=\"heroimage1\">\n		  <area shape=\"rect\" alt=\"desc\" title=\"\" coords=\"22,46,1159,395\" href=\"\" target=\"\" />\n		  <area shape=\"rect\" coords=\"766,435,1057,474\" alt=\"order the book\" href=\"\">\n		  <area shape=\"rect\" coords=\"890,482,916,504\" alt=\"facebook\" href=\"\">\n		  <area shape=\"rect\" coords=\"919,493,935,508\" alt=\"twitter\" href=\"\">\n		  <area shape=\"rect\" coords=\"940,492,955,508\" alt=\"google+\" href=\"\">\n		  <area shape=\"rect\" coords=\"959,492,975,508\" alt=\"youtube\" href=\"\">\n		</map>\n  </div>\n		</div>\n	</div>\n	<div id=\"homedyn\">\n		<div id=\"homeblogpreviews\">\n			<h1>Latest news, press &amp; blog posts</h1>\n			<?PHP\n \n	/******************************************************************************************************************\n	   RSS PARSING FUNCTION\n	******************************************************************************************************************/\n \n	//FUNCTION TO PARSE RSS IN PHP 4 OR PHP 4\n	function parseRSS($url) { \n \n	//PARSE RSS FEED\n        $feedeed = implode(\'\', file($url));\n        $parser = xml_parser_create();\n        xml_parse_into_struct($parser, $feedeed, $valueals, $index);\n        xml_parser_free($parser);\n \n	//CONSTRUCT ARRAY\n        foreach($valueals as $keyey => $valueal){\n            if($valueal[\'type\'] != \'cdata\') {\n                $item[$keyey] = $valueal;\n			}\n        }\n \n        $i = 0;\n\n        foreach($item as $key => $value){\n\n            if($value[\'type\'] == \'open\') {\n \n                $i++;\n                $itemame[$i] = $value[\'tag\'];\n \n            } elseif($value[\'type\'] == \'close\') {\n \n                $feed = $values[$i];\n                $item = $itemame[$i];\n                $i--;\n \n                if(count($values[$i])>1){\n                    $values[$i][$item][] = $feed;\n                } else {\n                    $values[$i][$item] = $feed;\n                }\n \n            } else {\n                $values[$i][$value[\'tag\']] = $value[\'value\'];  \n            }\n        }\n \n	//RETURN ARRAY VALUES\n        return $values[0];\n		//print_R($values);\n	} \n \n	\n	\n \n	//PARSE THE RSS FEED INTO ARRAY\n	$xml = parseRSS(\"http://www.monumentsmen.com/blog/feed/\");\n	$content = ($xml[\'RSS\'][\'CHANNEL\'][\'ITEM\'][0][\'CONTENT:ENCODED\']);\n	preg_match_all(\'/<img[^>]+>/i\',$content, $result); \n	echo \"<div id=\'homeblog1\' class=\'homeblogs\'><div class=\'homeblogimg\'>\";\n	echo $result[0][0] . \"</div><br clear=\'both\'>\";\n	echo \"<h3>\" . ($xml[\'RSS\'][\'CHANNEL\'][\'ITEM\'][0][\'TITLE\']) . \"</h3>\";\n	echo \"<p>\" . ($xml[\'RSS\'][\'CHANNEL\'][\'ITEM\'][0][\'PUBDATE\']) . \"</p>\";\n	echo \"<a href=\'\" . ($xml[\'RSS\'][\'CHANNEL\'][\'ITEM\'][0][\'LINK\']) .  \"\'>Read Blog Post</a>\";\n	echo \"</div>\";\n	echo \"<div id=\'homeblog2\' class=\'homeblogs\'><div class=\'homeblogimg\'>\";\n	$content = ($xml[\'RSS\'][\'CHANNEL\'][\'ITEM\'][1][\'CONTENT:ENCODED\']);\n	preg_match_all(\'/<img[^>]+>/i\',$content, $result); \n	echo $result[0][0] . \"</div><br clear=\'both\'>\";\n	echo \"<h3>\" . ($xml[\'RSS\'][\'CHANNEL\'][\'ITEM\'][1][\'TITLE\']) . \"</h3>\";\n	echo \"<p>\" . ($xml[\'RSS\'][\'CHANNEL\'][\'ITEM\'][1][\'PUBDATE\']) . \"</p>\";\n	echo \"<a href=\'\" . ($xml[\'RSS\'][\'CHANNEL\'][\'ITEM\'][1][\'LINK\']) .  \"\'>Read Blog Post</a>\";\n	echo \"</div>\";\n	\n\n	\n \n?>\n			\n			\n		</div>\n		<div id=\"homeevents\">\n			<h1>Upcoming Events</h1>\n			<ul>\n			{exp:channel:entries channel=\"upcoming_events\" limit=\"4\"}\n				<li>\n					<h3>{event_title}</h3>\n					<p>{event_location}</p>\n					<p>{event_date}</p>\n				</li>\n			{/exp:channel:entries}\n			</ul>\n		</div>\n	</div>\n	<br clear=\"both\">\n	<div id=\"homecontent\">\n	  <div id=\"home-static-image\">\n	  </div>\n	  <div id=home-static-text>\n	  <h2>Who Were the Monuments Men?</h2>\n	  <p>\n	  The Monuments Men were a group of men and women from thirteen nations, most of whom volunteered had expertise as museum directors, curators, art scholars and educators, artists, architects, and archivists. The Monuments Men job description was simple: to save as much of the culture of Europe as they could during combat.</p>\n	  <p>\nThese men not only had the vision to understand the grave threat to the greatest cultural and artistic achievements of civilization, but then joined the front lines to do something about it. Learn More</p>\n	  </div>\n	</div>\n	<br clear=\"both\">\n</div>\n	{embed=\'global-embeds/site-footer\'}\n\n<!-- SlidesJS Required: Initialize SlidesJS with a jQuery doc ready -->\n  <script>\n    $(function() {\n      $(\'#slides\').slidesjs({\n        width: 940,\n        height: 528,\n        play: {\n          active: true,\n          auto: true,\n          interval: 5000,\n          swap: true\n        }\n      });\n    });\n  </script>\n  <!-- End SlidesJS Required -->\n{html-close}'),(315,5,'exp_templates','template_data',1366390128,1,'<div id=\"navcontain\">\n	<div id=\"nav\">\n		\n			<a href=\"\"><img src=\"{main_site_root}/images/home/logo.png\" class=\"logo\"></a>\n			<ul class=\"dropdown\">\n				<li><a href=\"#\">Books &amp; Movies</a>\n					<ul class=\"sub_menu\">\n						 <li>\n							<a href=\"index.php/books-movies/saving-italy\">Saving Italy<hr  class=\"navrule\"></a>\n							\n							<ul>\n								<li><a href=\"#\">Excerpt<hr  class=\"navrule\"></a></li>\n								<li><a href=\"#\">Docs &amp; Photos<hr  class=\"navrule\"></a></li>\n							</ul>\n						</li>\n						<li>\n							<a href=\"#\">The Monuments Men<hr  class=\"navrule\"></a>\n							<ul>\n								<li><a href=\"#\">Excerpt<hr  class=\"navrule\"></a></li>\n								<li><a href=\"#\">Docs &amp; Photos<hr  class=\"navrule\"></a></li>\n							</ul>\n						</li>\n						<li>\n							<a href=\"#\">Rescuing Davinci<hr  class=\"navrule\"></a>\n							<ul>\n								<li><a href=\"#\">Excerpt<hr  class=\"navrule\"></a></li>\n								<li><a href=\"#\">Docs &amp; Photos<hr  class=\"navrule\"></a></li>\n							</ul>\n						 </li>\n						 <li><a href=\"#\">Rape of Europa Collector\'s Edition<hr  class=\"navrule\"></a></li>\n						 <li><a href=\"#\">The Monuments Men Feature Film<hr  class=\"navrule\"></a></li>\n						 <li><a href=\"#\">Beyond the Dreams of Avarice</a></li>\n					</ul>\n				</li>\n			</ul>\n			<ul class=\"dropdown\">\n				<li><a href=\"#\">The Heroes</a>\n					<ul class=\"sub_menu\">\n						 <li>\n							<a href=\"#\">Monuments Men<hr  class=\"navrule\"></a>\n							\n						</li>\n						<li>\n							<a href=\"#\">Roberts Commision<hr  class=\"navrule\"></a>\n							\n						</li>\n						<li>\n							<a href=\"#\">The American Committee of Learned Societies<hr  class=\"navrule\"></a>\n							\n						 </li>\n						 <li><a href=\"#\">The Harvard Group</a></li>\n						 \n					</ul>\n				</li>\n			</ul>\n			<ul class=\"dropdown\">\n				<li><a href=\"#\">Speaking Engagements</a>\n					<ul class=\"sub_menu\">\n						 <li>\n							<a href=\"#\">Events</a>\n						</li>\n					</ul>\n				</li>\n			</ul>\n			<ul class=\"dropdown\">\n				<li><a href=\"#\">About Robert Edsel</a>\n					<ul class=\"sub_menu\">\n						 <li>\n							<a href=\"#\">Blog<hr  class=\"navrule\"></a>\n							\n						</li>\n						<li>\n							<a href=\"#\">News<hr  class=\"navrule\"></a>\n							\n						</li>\n						<li>\n							<a href=\"#\">Press Inquiries<hr  class=\"navrule\"></a>\n							\n						 </li>\n						 <li><a href=\"#\">Contact Us</a></li>\n						 \n					</ul>\n				</li>\n			</ul>\n	</div>\n</div>'),(316,5,'exp_templates','template_data',1366390158,1,'<div id=\"navcontain\">\n	<div id=\"nav\">\n		\n			<a href=\"\"><img src=\"{main_site_root}/images/home/logo.png\" class=\"logo\"></a>\n			<ul class=\"dropdown\">\n				<li><a href=\"#\">Books &amp; Movies</a>\n					<ul class=\"sub_menu\">\n						 <li>\n							<a href=\"{main_site_root}/index.php/books-movies/saving-italy\">Saving Italy<hr  class=\"navrule\"></a>\n							\n							<ul>\n								<li><a href=\"#\">Excerpt<hr  class=\"navrule\"></a></li>\n								<li><a href=\"#\">Docs &amp; Photos<hr  class=\"navrule\"></a></li>\n							</ul>\n						</li>\n						<li>\n							<a href=\"#\">The Monuments Men<hr  class=\"navrule\"></a>\n							<ul>\n								<li><a href=\"#\">Excerpt<hr  class=\"navrule\"></a></li>\n								<li><a href=\"#\">Docs &amp; Photos<hr  class=\"navrule\"></a></li>\n							</ul>\n						</li>\n						<li>\n							<a href=\"#\">Rescuing Davinci<hr  class=\"navrule\"></a>\n							<ul>\n								<li><a href=\"#\">Excerpt<hr  class=\"navrule\"></a></li>\n								<li><a href=\"#\">Docs &amp; Photos<hr  class=\"navrule\"></a></li>\n							</ul>\n						 </li>\n						 <li><a href=\"#\">Rape of Europa Collector\'s Edition<hr  class=\"navrule\"></a></li>\n						 <li><a href=\"#\">The Monuments Men Feature Film<hr  class=\"navrule\"></a></li>\n						 <li><a href=\"#\">Beyond the Dreams of Avarice</a></li>\n					</ul>\n				</li>\n			</ul>\n			<ul class=\"dropdown\">\n				<li><a href=\"#\">The Heroes</a>\n					<ul class=\"sub_menu\">\n						 <li>\n							<a href=\"#\">Monuments Men<hr  class=\"navrule\"></a>\n							\n						</li>\n						<li>\n							<a href=\"#\">Roberts Commision<hr  class=\"navrule\"></a>\n							\n						</li>\n						<li>\n							<a href=\"#\">The American Committee of Learned Societies<hr  class=\"navrule\"></a>\n							\n						 </li>\n						 <li><a href=\"#\">The Harvard Group</a></li>\n						 \n					</ul>\n				</li>\n			</ul>\n			<ul class=\"dropdown\">\n				<li><a href=\"#\">Speaking Engagements</a>\n					<ul class=\"sub_menu\">\n						 <li>\n							<a href=\"#\">Events</a>\n						</li>\n					</ul>\n				</li>\n			</ul>\n			<ul class=\"dropdown\">\n				<li><a href=\"#\">About Robert Edsel</a>\n					<ul class=\"sub_menu\">\n						 <li>\n							<a href=\"#\">Blog<hr  class=\"navrule\"></a>\n							\n						</li>\n						<li>\n							<a href=\"#\">News<hr  class=\"navrule\"></a>\n							\n						</li>\n						<li>\n							<a href=\"#\">Press Inquiries<hr  class=\"navrule\"></a>\n							\n						 </li>\n						 <li><a href=\"#\">Contact Us</a></li>\n						 \n					</ul>\n				</li>\n			</ul>\n	</div>\n</div>'),(317,5,'exp_templates','template_data',1366390179,1,'<div id=\"navcontain\">\n	<div id=\"nav\">\n		\n			<a href=\"\"><img src=\"{main_site_root}/images/home/logo.png\" class=\"logo\"></a>\n			<ul class=\"dropdown\">\n				<li><a href=\"#\">Books &amp; Movies</a>\n					<ul class=\"sub_menu\">\n						 <li>\n							<a href=\"{main_site_root}index.php/books-movies/saving-italy\">Saving Italy<hr  class=\"navrule\"></a>\n							\n							<ul>\n								<li><a href=\"#\">Excerpt<hr  class=\"navrule\"></a></li>\n								<li><a href=\"#\">Docs &amp; Photos<hr  class=\"navrule\"></a></li>\n							</ul>\n						</li>\n						<li>\n							<a href=\"#\">The Monuments Men<hr  class=\"navrule\"></a>\n							<ul>\n								<li><a href=\"#\">Excerpt<hr  class=\"navrule\"></a></li>\n								<li><a href=\"#\">Docs &amp; Photos<hr  class=\"navrule\"></a></li>\n							</ul>\n						</li>\n						<li>\n							<a href=\"#\">Rescuing Davinci<hr  class=\"navrule\"></a>\n							<ul>\n								<li><a href=\"#\">Excerpt<hr  class=\"navrule\"></a></li>\n								<li><a href=\"#\">Docs &amp; Photos<hr  class=\"navrule\"></a></li>\n							</ul>\n						 </li>\n						 <li><a href=\"#\">Rape of Europa Collector\'s Edition<hr  class=\"navrule\"></a></li>\n						 <li><a href=\"#\">The Monuments Men Feature Film<hr  class=\"navrule\"></a></li>\n						 <li><a href=\"#\">Beyond the Dreams of Avarice</a></li>\n					</ul>\n				</li>\n			</ul>\n			<ul class=\"dropdown\">\n				<li><a href=\"#\">The Heroes</a>\n					<ul class=\"sub_menu\">\n						 <li>\n							<a href=\"#\">Monuments Men<hr  class=\"navrule\"></a>\n							\n						</li>\n						<li>\n							<a href=\"#\">Roberts Commision<hr  class=\"navrule\"></a>\n							\n						</li>\n						<li>\n							<a href=\"#\">The American Committee of Learned Societies<hr  class=\"navrule\"></a>\n							\n						 </li>\n						 <li><a href=\"#\">The Harvard Group</a></li>\n						 \n					</ul>\n				</li>\n			</ul>\n			<ul class=\"dropdown\">\n				<li><a href=\"#\">Speaking Engagements</a>\n					<ul class=\"sub_menu\">\n						 <li>\n							<a href=\"#\">Events</a>\n						</li>\n					</ul>\n				</li>\n			</ul>\n			<ul class=\"dropdown\">\n				<li><a href=\"#\">About Robert Edsel</a>\n					<ul class=\"sub_menu\">\n						 <li>\n							<a href=\"#\">Blog<hr  class=\"navrule\"></a>\n							\n						</li>\n						<li>\n							<a href=\"#\">News<hr  class=\"navrule\"></a>\n							\n						</li>\n						<li>\n							<a href=\"#\">Press Inquiries<hr  class=\"navrule\"></a>\n							\n						 </li>\n						 <li><a href=\"#\">Contact Us</a></li>\n						 \n					</ul>\n				</li>\n			</ul>\n	</div>\n</div>'),(354,10,'exp_templates','template_data',1366401800,1,'{html-head}\n{global-css}\n<script type=\"text/javascript\">var switchTo5x=true;</script>\n<script type=\"text/javascript\" src=\"http://w.sharethis.com/button/buttons.js\"></script>\n<script type=\"text/javascript\">stLight.options({publisher: \"a7ef6f0b-d9d8-432d-8b13-1f207972b576\", doNotHash: false, doNotCopy: false, hashAddressBar: false});</script>\n<script>\nfunction seen(){\n	$(\'#lightbox\').removeClass(\'unseen\');\n	$(\'#lightbox\').addClass(\'seen\');\n}\n</script>\n{html-head-end}\n\n<body>\n\n	{embed=\'global-embeds/main-nav\'}\n<div id=\"wrapper\">\n \n{exp:channel:entries channel=\"Books_movies\"}\n<div id=\"breadcrumb-wrap\">\n    \n    <a href=\"{site_url}\">Home Page</a> / \n    \n    <a href=\"{site_url}/books-movies/\">Books &amp;  Movies</a> / \n    \n    {main_title}\n    \n   \n</div>  \n<br clear=\"both\">\n	<div id=\"books-top-wrapper\" style=\"background:url(\'{cover_image}\');background-repeat: no-repeat;background-position:425px 0px; width:100%; \">\n		<div id=\"books-top-left\" class=\"books\" >\n			<div class=\"vertcent\">\n				<h3><img src=\'{main_title_image}\'></h3>\n				<p>{teaser}</p>\n				\n			</div>\n			<div id=\"sharethis\">\n					<span class=\'st_fblike_hcount\' displayText=\'Like\'></span>\n					<span class=\'st_twitter_hcount\' displayText=\'Tweet\'></span>\n					<span class=\'st_pinterest_hcount\' displayText=\'Pin it\'></span>\n					<span class=\'st_sharethis_hcount\' displayText=\'Share\'></span>\n			</div>\n		</div>\n		<div id=\"books-top-right\" class=\"books\">\n			<div class=\"vertcent\">\n				<a onclick=\"$(\'#lightbox\').removeClass(\'unseen\');\"><img src=\'{main_site_root}/images/books-movies/orderbook.png\'></a>\n				\n			</div>\n		</div>\n	</div>\n	<hr class=\"bookline\">\n	<br clear=\"both\">\n	\n	<div id=\"books-main-content-left\" class=\"books\">{main_content}</div>\n	<div id=\"books-main-content-right\" class=\"books\">{main_content_two}</div>\n	<hr class=\"bookline\">\n	<br clear=\"both\">\n	<h1 class=\"mon-head\">Reviews</h1>\n	<div id=\"books-bottom-left\" class=\"books\">{reviews}</div>\n	<div id=\"books-bottom-right\" class=\"books\">{reviews_two}</div>\n</div>\n<br clear=\"both\">\n<div id=\"lightbox\" class=\"unseen\">\n	<div id=\"buybook\">\n		<div id=\"buy\"  class=\"bookshopstop\">\n			Buy {main_title}\n		</div>\n		<div id=\"amazon\" class=\"bookshops\">\n		</div>\n		<div id=\"barnes\" class=\"bookshopsr\">\n		</div>\n		<br clear=\"both\">\n		<div id=\"indie\" class=\"bookshops\">\n		</div>\n		<div id=\"powells\" class=\"bookshopsr\">\n		</div>\n		<br clear=\"both\">\n		<div id=\"ibooks\" class=\"bookshops\">\n		</div>\n		<div id=\"google\" class=\"bookshopsr\">\n		</div>\n		<br clear=\"both\">\n		<div id=\"kobo\" class=\"bookshops\">\n		</div>\n	</div>\n</div>\n    {/exp:channel:entries} \n	{embed=\'global-embeds/site-footer\'}\n\n\n{html-close}'),(357,10,'exp_templates','template_data',1366401979,1,'{html-head}\n{global-css}\n<script type=\"text/javascript\">var switchTo5x=true;</script>\n<script type=\"text/javascript\" src=\"http://w.sharethis.com/button/buttons.js\"></script>\n<script type=\"text/javascript\">stLight.options({publisher: \"a7ef6f0b-d9d8-432d-8b13-1f207972b576\", doNotHash: false, doNotCopy: false, hashAddressBar: false});</script>\n<script>\nfunction seen(){\n	$(\'#lightbox\').removeClass(\'unseen\');\n	$(\'#lightbox\').addClass(\'seen\');\n}\n</script>\n{html-head-end}\n\n<body>\n\n	{embed=\'global-embeds/main-nav\'}\n<div id=\"wrapper\">\n \n{exp:channel:entries channel=\"Books_movies\"}\n<div id=\"breadcrumb-wrap\">\n    \n    <a href=\"{site_url}\">Home Page</a> / \n    \n    <a href=\"{site_url}/books-movies/\">Books &amp;  Movies</a> / \n    \n    {main_title}\n    \n   \n</div>  \n<br clear=\"both\">\n	<div id=\"books-top-wrapper\" style=\"background:url(\'{cover_image}\');background-repeat: no-repeat;background-position:425px 0px; width:100%; \">\n		<div id=\"books-top-left\" class=\"books\" >\n			<div class=\"vertcent\">\n				<h3><img src=\'{main_title_image}\'></h3>\n				<p>{teaser}</p>\n				\n			</div>\n			<div id=\"sharethis\">\n					<span class=\'st_fblike_hcount\' displayText=\'Like\'></span>\n					<span class=\'st_twitter_hcount\' displayText=\'Tweet\'></span>\n					<span class=\'st_pinterest_hcount\' displayText=\'Pin it\'></span>\n					<span class=\'st_sharethis_hcount\' displayText=\'Share\'></span>\n			</div>\n		</div>\n		<div id=\"books-top-right\" class=\"books\">\n			<div class=\"vertcent\">\n				<a onclick=\"$(\'#lightbox\').removeClass(\'unseen\');\"><img src=\'{main_site_root}/images/books-movies/orderbook.png\'></a>\n				\n			</div>\n		</div>\n	</div>\n	<hr class=\"bookline\">\n	<br clear=\"both\">\n	\n	<div id=\"books-main-content-left\" class=\"books\">{main_content}</div>\n	<div id=\"books-main-content-right\" class=\"books\">{main_content_two}</div>\n	<hr class=\"bookline\">\n	<br clear=\"both\">\n	<h1 class=\"mon-head\">Reviews</h1>\n	<div id=\"books-bottom-left\" class=\"books\">{reviews}</div>\n	<div id=\"books-bottom-right\" class=\"books\">{reviews_two}</div>\n</div>\n<br clear=\"both\">\n<div id=\"lightbox\" class=\"unseen\">\n	<div id=\"buybook\">\n		<div id=\"buy\"  class=\"bookshopstop\">\n			Buy {main_title}\n		</div>\n		<br clear=\"both\">\n		<div id=\"amazon\" class=\"bookshops\">\n		</div>\n		<div id=\"barnes\" class=\"bookshopsr\">\n		</div>\n		<br clear=\"both\">\n		<div id=\"indie\" class=\"bookshops\">\n		</div>\n		<div id=\"powells\" class=\"bookshopsr\">\n		</div>\n		<br clear=\"both\">\n		<div id=\"ibooks\" class=\"bookshops\">\n		</div>\n		<div id=\"google\" class=\"bookshopsr\">\n		</div>\n		<br clear=\"both\">\n		<div id=\"kobo\" class=\"bookshops\">\n		</div>\n	</div>\n</div>\n    {/exp:channel:entries} \n	{embed=\'global-embeds/site-footer\'}\n\n\n{html-close}'),(359,10,'exp_templates','template_data',1366402347,1,'{html-head}\n{global-css}\n<script type=\"text/javascript\">var switchTo5x=true;</script>\n<script type=\"text/javascript\" src=\"http://w.sharethis.com/button/buttons.js\"></script>\n<script type=\"text/javascript\">stLight.options({publisher: \"a7ef6f0b-d9d8-432d-8b13-1f207972b576\", doNotHash: false, doNotCopy: false, hashAddressBar: false});</script>\n<script>\nfunction seen(){\n	$(\'#lightbox\').removeClass(\'unseen\');\n	$(\'#lightbox\').addClass(\'seen\');\n}\n</script>\n{html-head-end}\n\n<body>\n\n	{embed=\'global-embeds/main-nav\'}\n<div id=\"wrapper\">\n \n{exp:channel:entries channel=\"Books_movies\"}\n<div id=\"breadcrumb-wrap\">\n    \n    <a href=\"{site_url}\">Home Page</a> / \n    \n    <a href=\"{site_url}/books-movies/\">Books &amp;  Movies</a> / \n    \n    {main_title}\n    \n   \n</div>  \n<br clear=\"both\">\n	<div id=\"books-top-wrapper\" style=\"background:url(\'{cover_image}\');background-repeat: no-repeat;background-position:425px 0px; width:100%; \">\n		<div id=\"books-top-left\" class=\"books\" >\n			<div class=\"vertcent\">\n				<h3><img src=\'{main_title_image}\'></h3>\n				<p>{teaser}</p>\n				\n			</div>\n			<div id=\"sharethis\">\n					<span class=\'st_fblike_hcount\' displayText=\'Like\'></span>\n					<span class=\'st_twitter_hcount\' displayText=\'Tweet\'></span>\n					<span class=\'st_pinterest_hcount\' displayText=\'Pin it\'></span>\n					<span class=\'st_sharethis_hcount\' displayText=\'Share\'></span>\n			</div>\n		</div>\n		<div id=\"books-top-right\" class=\"books\">\n			<div class=\"vertcent\">\n				<a onclick=\"$(\'#lightbox\').removeClass(\'unseen\');\"><img src=\'{main_site_root}/images/books-movies/orderbook.png\'></a>\n				\n			</div>\n		</div>\n	</div>\n	<hr class=\"bookline\">\n	<br clear=\"both\">\n	\n	<div id=\"books-main-content-left\" class=\"books\">{main_content}</div>\n	<div id=\"books-main-content-right\" class=\"books\">{main_content_two}</div>\n	<hr class=\"bookline\">\n	<br clear=\"both\">\n	<h1 class=\"mon-head\">Reviews</h1>\n	<div id=\"books-bottom-left\" class=\"books\">{reviews}</div>\n	<div id=\"books-bottom-right\" class=\"books\">{reviews_two}</div>\n</div>\n<br clear=\"both\">\n<div id=\"lightbox\" class=\"unseen\">\n	<div id=\"buybook\">\n		<div id=\"buy\"  class=\"bookshopstop\">\n			Buy {main_title}<a onclick=\"$(\'#lightbox\').addClass(\'unseen\');\"><img src=\"{main_site_root}/images/books-movies/x.png\" class=\"x\"></a>\n		</div>\n		<br clear=\"both\">\n		<div id=\"amazon\" class=\"bookshops\">\n		</div>\n		<div id=\"barnes\" class=\"bookshopsr\">\n		</div>\n		<br clear=\"both\">\n		<div id=\"indie\" class=\"bookshops\">\n		</div>\n		<div id=\"powells\" class=\"bookshopsr\">\n		</div>\n		<br clear=\"both\">\n		<div id=\"ibooks\" class=\"bookshops\">\n		</div>\n		<div id=\"google\" class=\"bookshopsr\">\n		</div>\n		<br clear=\"both\">\n		<div id=\"kobo\" class=\"bookshopsbot\">\n		</div>\n	</div>\n</div>\n    {/exp:channel:entries} \n	{embed=\'global-embeds/site-footer\'}\n\n\n{html-close}'),(361,10,'exp_templates','template_data',1366402862,1,'{html-head}\n{global-css}\n<script type=\"text/javascript\">var switchTo5x=true;</script>\n<script type=\"text/javascript\" src=\"http://w.sharethis.com/button/buttons.js\"></script>\n<script type=\"text/javascript\">stLight.options({publisher: \"a7ef6f0b-d9d8-432d-8b13-1f207972b576\", doNotHash: false, doNotCopy: false, hashAddressBar: false});</script>\n<script>\nfunction seen(){\n	$(\'#lightbox\').removeClass(\'unseen\');\n	$(\'#lightbox\').addClass(\'seen\');\n}\n</script>\n{html-head-end}\n\n<body>\n\n	{embed=\'global-embeds/main-nav\'}\n<div id=\"wrapper\">\n \n{exp:channel:entries channel=\"Books_movies\"}\n<div id=\"breadcrumb-wrap\">\n    \n    <a href=\"{site_url}\">Home Page</a> / \n    \n    <a href=\"{site_url}/books-movies/\">Books &amp;  Movies</a> / \n    \n    {main_title}\n    \n   \n</div>  \n<br clear=\"both\">\n	<div id=\"books-top-wrapper\" style=\"background:url(\'{cover_image}\');background-repeat: no-repeat;background-position:425px 0px; width:100%; \">\n		<div id=\"books-top-left\" class=\"books\" >\n			<div class=\"vertcent\">\n				<h3><img src=\'{main_title_image}\'></h3>\n				<p>{teaser}</p>\n				\n			</div>\n			<div id=\"sharethis\">\n					<span class=\'st_fblike_hcount\' displayText=\'Like\'></span>\n					<span class=\'st_twitter_hcount\' displayText=\'Tweet\'></span>\n					<span class=\'st_pinterest_hcount\' displayText=\'Pin it\'></span>\n					<span class=\'st_sharethis_hcount\' displayText=\'Share\'></span>\n			</div>\n		</div>\n		<div id=\"books-top-right\" class=\"books\">\n			<div class=\"vertcent\">\n				<a onclick=\"$(\'#lightbox\').removeClass(\'unseen\');\"><img src=\'{main_site_root}/images/books-movies/orderbook.png\'></a>\n				\n			</div>\n		</div>\n	</div>\n	<hr class=\"bookline\">\n	<br clear=\"both\">\n	\n	<div id=\"books-main-content-left\" class=\"books\">{main_content}</div>\n	<div id=\"books-main-content-right\" class=\"books\">{main_content_two}</div>\n	<hr class=\"bookline\">\n	<br clear=\"both\">\n	<h1 class=\"mon-head\">Reviews</h1>\n	<div id=\"books-bottom-left\" class=\"books\">{reviews}</div>\n	<div id=\"books-bottom-right\" class=\"books\">{reviews_two}</div>\n</div>\n<br clear=\"both\">\n<div id=\"lightbox\" class=\"unseen\">\n	<div id=\"buybook\">\n		<div id=\"buy\"  class=\"bookshopstop\">\n			\n			<span class=\"buybuy\">Buy {main_title}</span><a onclick=\"$(\'#lightbox\').addClass(\'unseen\');\"><img src=\"{main_site_root}/images/books-movies/x.png\" class=\"x\"></a>\n		</div>\n		<br clear=\"both\">\n		<div id=\"amazon\" class=\"bookshops\">\n		</div>\n		<div id=\"barnes\" class=\"bookshopsr\">\n		</div>\n		<br clear=\"both\">\n		<div id=\"indie\" class=\"bookshops\">\n		</div>\n		<div id=\"powells\" class=\"bookshopsr\">\n		</div>\n		<br clear=\"both\">\n		<div id=\"ibooks\" class=\"bookshops\">\n		</div>\n		<div id=\"google\" class=\"bookshopsr\">\n		</div>\n		<br clear=\"both\">\n		<div id=\"kobo\" class=\"bookshopsbot\">\n		</div>\n	</div>\n</div>\n    {/exp:channel:entries} \n	{embed=\'global-embeds/site-footer\'}\n\n\n{html-close}'),(363,3,'exp_templates','template_data',1366403409,1,'body{\n	\n	background-color: #fff; \n	color: #364455;\n	margin: 0;\n	font-family: \"calluna\";\n	\n	width: 100%;\n}\n\n#wrapper{\nmargin: 0 auto;\nwidth: 1200px;\n\n}\n/* nav */\n#navcontain{\nbackground-image: url(\"{main_site_root}/images/home/navrule.gif\");\nbackground-position: 0px 71px;\nbackground-repeat: repeat-x;\nheight:74px;\n}\n#nav{\npadding: 0px 0px 35px 0px;\nmargin: 0 auto;\nwidth: 1300px;\n}\n.logo{float:left; display:block; position:relative; top:17px; margin-right:90px;}\n.navrule {border: 0;width: 90%;color: #5b6575;background-color: #5b6575;height: 1px;float:left;}\n//* \n	LEVEL ONE\n*/\n.dropme {margin:0;}\nul.dropdown                         { position: relative; margin:0;z-index:9999; }\nul.dropdown li                      {  float: left; zoom: 1;  list-style:none; height:74px; }\nul.dropdown a:hover		            { color: #fff; }\nul.dropdown a:active                { color: #fff; }\nul.dropdown li a                    { display: block; padding: 30px 15px; border-right: 1px solid #333;\n	 								  color: #364455; text-decoration:none;text-transform:uppercase; }\nul.dropdown li:last-child a         { border-right: none; } /* Doesn\'t work in IE */\nul.dropdown li.hover,\nul.dropdown li:hover                { background-color:rgba(50,64,82,0.9); color: #fff; position: relative; }\nul.dropdown li.hover a              { color: #fff; }\n\n\n/* \n	LEVEL TWO\n*/\nul.dropdown ul 						{ width: 220px; visibility: hidden; position: absolute; top: 100%; left: 0; z-index:9999; margin:0; }\nul.dropdown ul li 					{ font-weight: normal; background-color:rgba(50,64,82,0.9); color: #fff; \n									  border-bottom: 0px solid #ccc; float: none; margin-left:-40px; }\n									  \n                                    /* IE 6 & 7 Needs Inline Block */\nul.dropdown ul li a					{ border-right: none; width: 100%; display: inline-block;color: #fff;  } \n\n/* \n	LEVEL THREE\n*/\nul.dropdown ul ul 					{ left: 100%; top: 0; }\nul.dropdown li:hover > ul 			{ visibility: visible; }\n\n\n\n\n/*home page */\n#homecell{\nbackground-image: url(\"{main_site_root}/images/home/home-cell-bg.jpg\");\nbackground-position: 0 19px;\nbackground-repeat: no-repeat;\nwidth:100%;\nheight:800px;\nposition: relative;\ntop: -38px;\n}\n.homeslide {\nwidth:1200px !important;\nheight:554px !important;\n\n}\n.container{\n\n}\n#home-static-image{\nbackground-image: url(\"{main_site_root}images/home/mm-1.png\");\nwidth: 498px;\nheight:332px;\nfloat:left;\n}\n\n#home-static-text{\nwidth:514px;\nfloat:left;\n}\n#hero1{\n/* background-image: url(\"{main_site_root}images/home/heroimage1.png\");\nbackground-repeat: no-repeat;\nbackground-position:100px 31px; */\nwidth:100%;\nheight:604px;\n\n}\n#homeblogpreviews{\nwidth:680px;\nfloat:left;\n\n}\n\n#homeevents{\nwidth:500;\nfloat:left;\n\n}\n#homeevents li{\nmargin-left:40px;\n}\n.homeblogs{\nfloat:left;\nmargin-right:50px;\nwidth:290px;\n}\n#homedyn h1{\ntext-transform:uppercase;\nfont-size:18px;\nfont-weight:bold;\n}\n\n#homedyn h3{\ntext-transform:uppercase;\nfont-size:14px;\nfont-weight:bold;\n}\n#homedyn p{\nfont-size:10px;\n}\n#homedyn a{\ncolor:#a91111;\nfont-size:12px;\nfont-weight:bold;\ntext-decoration:none;\n}\n#homedyn img{\nwidth:290px;\nheight:auto;\n}\n.homeblogimg {\nwidth:290px;\nheight:180px;\noverflow:hidden;\n\n}\n\n#homeevents li{\nlist-style:none;\n}\n\n\n.slidesjs-pagination{\nposition:relative;\nleft:50px;\ntop:-128px;\n}\n\n.slidesjs-pagination-item{\nfloat:left;\nlist-style:none;\nwidth:260px;\nheight:188px;\n\n}\n\n.slidesjs-pagination-item a{\n\nwidth:260px;\nheight:188px;\n\n/*box-shadow: 3px 2px 4px #888888;*/\n}\n\n.slidesjs-pagination-item a.active{\n\n/*box-shadow: 1px 2px 6px #888888;*/\n}\n\n.slidesjs-pagination-item a.active{\n\n/*box-shadow: 1px 2px 6px #888888;*/\n}\n\n.slidesjs-pagination-item a[data-slidesjs-item=\'0\']{\nbackground-image: url(\"{main_site_root}images/home/slidenav0.png\");\nbackground-repeat: no-repeat;\ndisplay:block;\ntext-indent: -9999px;\n}\n\n.slidesjs-pagination-item a[data-slidesjs-item=\'0\'].active{\nbackground-image: url(\"{main_site_root}images/home/slidenav0-a.png\");\n}\n\n.slidesjs-pagination-item a[data-slidesjs-item=\'1\']{\nbackground-image: url(\"{main_site_root}images/home/slidenav1.png\");\nbackground-repeat: no-repeat;\ndisplay:block;\ntext-indent: -9999px;\n}\n\n.slidesjs-pagination-item a[data-slidesjs-item=\'1\'].active{\nbackground-image: url(\"{main_site_root}images/home/slidenav1-a.png\");\n}\n\n.slidesjs-pagination-item a[data-slidesjs-item=\'2\']{\nbackground-image: url(\"{main_site_root}images/home/slidenav2.png\");\nbackground-repeat: no-repeat;\ndisplay:block;\ntext-indent: -9999px;\n}\n\n.slidesjs-pagination-item a[data-slidesjs-item=\'2\'].active{\nbackground-image: url(\"{main_site_root}images/home/slidenav2-a.png\");\n}\n\n.slidesjs-pagination-item a[data-slidesjs-item=\'3\']{\nbackground-image: url(\"{main_site_root}images/home/slidenav3.png\");\nbackground-repeat: no-repeat;\ndisplay:block;\ntext-indent: -9999px;\n}\n\n.slidesjs-pagination-item a[data-slidesjs-item=\'3\'].active{\nbackground-image: url(\"{main_site_root}images/home/slidenav3-a.png\");\n}\n\n/* books and movies */\n.books{\nfloat:left;\ndisplay:block;\nwidth:540px;\n}\n\n#breadcrumb-wrap {\n font-family: \"proxima-nova\";\nfont-size:12px;\nfont-weight:600;\ntext-transform:uppercase;\nmargin-top:10px;\n\n}\n#breadcrumb-wrap a {\ntext-decoration:none;\ncolor:#888;\n}\n\n#books-top-left{\nwidth:480px !important;\nmargin-right:30px;\nheight:400px;\n}\n#books-top-left h3{\nfont-size:50px;\nmargin-bottom:15px;\n}\n#books-top-left p{\nfont-size:20px;\n}\n\n#books-top-right{\nfloat:right;\nwidth:348px;\n}\n\n#books-main-content-left{\n\nmargin-right:30px;\n\n}\n#books-main-content-right{\n\n\n}\n#books-main-content p{\n}\n\n#books-bottom-left{\n\nmargin-right:30px;\n}\n\n#books-bottom-right{\n\n}\n#books-top-wrapper{\nwidth:1200px;\nheight:400px;\nbackground-repeat:no-repeat;\nbackground-position:425px 0px;\n}\n#sharethis{\nposition:relative;\nbottom:0px;\n}\n.bookline {\nborder: 0;width: 90%;color: #ecedef;background-color: #ecedef;height: 1px;float:left;\n}\n.mon-head{\n font-family: \"proxima-nova\";\nfont-size:20px;\nfont-weight:400;\ntext-transform:uppercase;\n}\n.books h3{\nfont-size:16px;\ncolor:#ad1515;\nmargin:0px;\n}\n/* lightbox */\n#lightbox {\n    position:fixed; /* keeps the lightbox window in the current viewport */\n    top:0;\n    left:0;\n    width:100%;\n    height:100%;\n    background:url({main_site_root}images/books-movies/overlay.png) repeat;\n    text-align:center;\n	z-index:9999;\n}\n#buybook{background:#fff; width:501px; height:488px;margin:auto;position:relative;top:100px; padding:0px;text-align:left;}\n\n.unseen{\nvisibility:hidden;\n}\n.seen{\nvisibility:visible;\n}\n\n.bookshops{\nfloat: left;\nwidth:250px;\nheight:90px;\nborder-style:solid;\nborder-color:#ccc;\nborder-right-width:1px;\nborder-bottom-width:1px;\nborder-top-width:0px;\n\nborder-left-width:0px;\n\n\n}\n.bookshopsr{\nfloat: right;\nwidth:250px;\nheight:90px;\nborder-style:solid;\nborder-color:#ccc;\nborder-top-width:0px;\nborder-left-width:0px;\nborder-right-width:0px;\nborder-bottom-width:1px;\n\n}\n.bookshopstop{\nfloat: left;\nwidth:100%;\nheight:90px;\nborder-style:solid;\nborder-color:#ccc;\nborder-top-width:0px;\nborder-left-width:0px;\nborder-right-width:0px;\nborder-bottom-width:1px;\n\n}\n.buybuy{\nposition:relative;\ntop:35px;\nleft:10px;\n font-family: \"proxima-nova\";\nfont-size:25px;\nfont-weight:800;\ntext-transform:uppercase;\n}\n\n.bookshopsbot{\nfloat: left;\nwidth:100%;\nheight:90px;\nborder-style:solid;\nborder-color:#ccc;\nborder-top-width:0px;\nborder-left-width:0px;\nborder-right-width:1px;\nborder-bottom-width:0px;\n\n}\n.x{float:right;position:relative;top:10px;right:10px;}\n\n\n\n/*footer */\n#footcontain{\nbackground-color: #2e3c4f;\nwidth:100%;\n}\n#footer{\npadding-top:40px:\ncolor:#fff;\nfont-size: 12px;\nbackground-color: #2e3c4f;\nwidth:100%;\nheight:275px;\nmargin: 0 auto;\nwidth: 1200px;\n}\n#footer a{\ncolor:#fff;\ntext-decoration:none;\n\n}\n#footer ul{\npadding:0px;\n}\n#footer li{\nlist-style:none;\n}\n#footer h2{\ntext-transform:uppercase;\nmargin:0;\nfont-size: 15px;\nfont-weight:bold;\n}\n#foot-home{\nfloat:left;\nwidth:195px;\nmargin-left:80px;\nmargin-top:40px;\n}\n#foot-edu{\nfloat:left;\nwidth:146px;\nmargin-left:25px;\nmargin-top:25px;\n}\n#foot-heroes{\nfloat:left;\nwidth:148px;\nmargin-left:25px;\nmargin-top:25px;\n}\n#foot-speaking{\nfloat:left;\nwidth:148px;\nmargin-left:25px;\nmargin-top:25px;\n}\n#foot-about{\nfloat:left;\nwidth:167px;\nmargin-left:25px;\nmargin-top:25px;\n}\n.vertcent{\ndisplay: table-cell;\nvertical-align: middle;\nposition: relative;\nheight:357px;\n}'),(364,10,'exp_templates','template_data',1366404763,1,'{html-head}\n{global-css}\n<script type=\"text/javascript\">var switchTo5x=true;</script>\n<script type=\"text/javascript\" src=\"http://w.sharethis.com/button/buttons.js\"></script>\n<script type=\"text/javascript\">stLight.options({publisher: \"a7ef6f0b-d9d8-432d-8b13-1f207972b576\", doNotHash: false, doNotCopy: false, hashAddressBar: false});</script>\n<script>\nfunction seen(){\n	$(\'#lightbox\').removeClass(\'unseen\');\n	$(\'#lightbox\').addClass(\'seen\');\n}\n</script>\n{html-head-end}\n\n<body>\n\n	{embed=\'global-embeds/main-nav\'}\n<div id=\"wrapper\">\n \n{exp:channel:entries channel=\"Books_movies\"}\n<div id=\"breadcrumb-wrap\">\n    \n    <a href=\"{site_url}\">Home Page</a> / \n    \n    <a href=\"{site_url}/books-movies/\">Books &amp;  Movies</a> / \n    \n    {main_title}\n    \n   \n</div>  \n<br clear=\"both\">\n	<div id=\"books-top-wrapper\" style=\"background:url(\'{cover_image}\');background-repeat: no-repeat;background-position:425px 0px; width:100%; \">\n		<div id=\"books-top-left\" class=\"books\" >\n			<div class=\"vertcent\">\n				<h3><img src=\'{main_title_image}\'></h3>\n				<p>{teaser}</p>\n				\n			</div>\n			<div id=\"sharethis\">\n					<span class=\'st_fblike_hcount\' displayText=\'Like\'></span>\n					<span class=\'st_twitter_hcount\' displayText=\'Tweet\'></span>\n					<span class=\'st_pinterest_hcount\' displayText=\'Pin it\'></span>\n					<span class=\'st_sharethis_hcount\' displayText=\'Share\'></span>\n			</div>\n		</div>\n		<div id=\"books-top-right\" class=\"books\">\n			<div class=\"vertcent\">\n				<a onclick=\"$(\'#lightbox\').removeClass(\'unseen\');\"><img src=\'{main_site_root}/images/books-movies/orderbook.png\'></a>\n				\n			</div>\n		</div>\n	</div>\n	<hr class=\"bookline\">\n	<br clear=\"both\">\n	\n	<div id=\"books-main-content-left\" class=\"books\">{main_content}</div>\n	<div id=\"books-main-content-right\" class=\"books\">{main_content_two}</div>\n	<hr class=\"bookline\">\n	<br clear=\"both\">\n	<h1 class=\"mon-head\">Reviews</h1>\n	<div id=\"books-bottom-left\" class=\"books\">{reviews}</div>\n	<div id=\"books-bottom-right\" class=\"books\">{reviews_two}</div>\n</div>\n<br clear=\"both\">\n<div id=\"lightbox\" class=\"unseen\">\n	<div id=\"buybook\">\n		<div id=\"buy\"  class=\"bookshopstop\">\n			\n			<span class=\"buybuy\">Buy {main_title}</span><a onclick=\"$(\'#lightbox\').addClass(\'unseen\');\"><img src=\"{main_site_root}/images/books-movies/x.png\" class=\"x\"></a>\n		</div>\n		<br clear=\"both\">\n		<div id=\"amazon\" class=\"bookshops\">\n		<a href=\"\"><img src=\"{main_site_root}/images/books-movies/amazon.jpg\"></a>\n		</div>\n		<div id=\"barnes\" class=\"bookshopsr\">\n		<a href=\"\"><img src=\"{main_site_root}/images/books-movies/barnes.jpg\"></a>\n		</div>\n		<br clear=\"both\">\n		<div id=\"indie\" class=\"bookshops\">\n		<a href=\"\"><img src=\"{main_site_root}/images/books-movies/indie.jpg\"></a>\n		</div>\n		<div id=\"powells\" class=\"bookshopsr\">\n		<a href=\"\"><img src=\"{main_site_root}/images/books-movies/powells.jpg\"></a>\n		</div>\n		<br clear=\"both\">\n		<div id=\"ibooks\" class=\"bookshops\">\n		<a href=\"\"><img src=\"{main_site_root}/images/books-movies/ibooks.jpg\"></a>\n		</div>\n		<div id=\"google\" class=\"bookshopsr\">\n		<a href=\"\"><img src=\"{main_site_root}/images/books-movies/google.jpg\"></a>\n		</div>\n		<br clear=\"both\">\n		<div id=\"kobo\" class=\"bookshopsbot\">\n		<a href=\"\"><img src=\"{main_site_root}/images/books-movies/kobo.jpg\"></a>\n		</div>\n	</div>\n</div>\n    {/exp:channel:entries} \n	{embed=\'global-embeds/site-footer\'}\n\n\n{html-close}'),(365,3,'exp_templates','template_data',1366405991,1,'body{\n	\n	background-color: #fff; \n	color: #364455;\n	margin: 0;\n	font-family: \"calluna\";\n	\n	width: 100%;\n}\n\n#wrapper{\nmargin: 0 auto;\nwidth: 1200px;\n\n}\n/* nav */\n#navcontain{\nbackground-image: url(\"{main_site_root}/images/home/navrule.gif\");\nbackground-position: 0px 71px;\nbackground-repeat: repeat-x;\nheight:74px;\n}\n#nav{\npadding: 0px 0px 35px 0px;\nmargin: 0 auto;\nwidth: 1300px;\n}\n.logo{float:left; display:block; position:relative; top:17px; margin-right:90px;}\n.navrule {border: 0;width: 90%;color: #5b6575;background-color: #5b6575;height: 1px;float:left;}\n//* \n	LEVEL ONE\n*/\n.dropme {margin:0;}\nul.dropdown                         { position: relative; margin:0;z-index:9999; }\nul.dropdown li                      {  float: left; zoom: 1;  list-style:none; height:74px; }\nul.dropdown a:hover		            { color: #fff; }\nul.dropdown a:active                { color: #fff; }\nul.dropdown li a                    { display: block; padding: 30px 15px; border-right: 1px solid #333;\n	 								  color: #364455; text-decoration:none;text-transform:uppercase; }\nul.dropdown li:last-child a         { border-right: none; } /* Doesn\'t work in IE */\nul.dropdown li.hover,\nul.dropdown li:hover                { background-color:rgba(50,64,82,0.9); color: #fff; position: relative; }\nul.dropdown li.hover a              { color: #fff; }\n\n\n/* \n	LEVEL TWO\n*/\nul.dropdown ul 						{ width: 220px; visibility: hidden; position: absolute; top: 100%; left: 0; z-index:9999; margin:0; }\nul.dropdown ul li 					{ font-weight: normal; background-color:rgba(50,64,82,0.9); color: #fff; \n									  border-bottom: 0px solid #ccc; float: none; margin-left:-40px; }\n									  \n                                    /* IE 6 & 7 Needs Inline Block */\nul.dropdown ul li a					{ border-right: none; width: 100%; display: inline-block;color: #fff;  } \n\n/* \n	LEVEL THREE\n*/\nul.dropdown ul ul 					{ left: 100%; top: 0; }\nul.dropdown li:hover > ul 			{ visibility: visible; }\n\n\n\n\n/*home page */\n#homecell{\nbackground-image: url(\"{main_site_root}/images/home/home-cell-bg.jpg\");\nbackground-position: 0 19px;\nbackground-repeat: no-repeat;\nwidth:100%;\nheight:800px;\nposition: relative;\ntop: -38px;\n}\n.homeslide {\nwidth:1200px !important;\nheight:554px !important;\n\n}\n.container{\n\n}\n#home-static-image{\nbackground-image: url(\"{main_site_root}images/home/mm-1.png\");\nwidth: 498px;\nheight:332px;\nfloat:left;\n}\n\n#home-static-text{\nwidth:514px;\nfloat:left;\n}\n#hero1{\n/* background-image: url(\"{main_site_root}images/home/heroimage1.png\");\nbackground-repeat: no-repeat;\nbackground-position:100px 31px; */\nwidth:100%;\nheight:604px;\n\n}\n#homeblogpreviews{\nwidth:680px;\nfloat:left;\n\n}\n\n#homeevents{\nwidth:500;\nfloat:left;\n\n}\n#homeevents li{\nmargin-left:40px;\n}\n.homeblogs{\nfloat:left;\nmargin-right:50px;\nwidth:290px;\n}\n#homedyn h1{\ntext-transform:uppercase;\nfont-size:18px;\nfont-weight:bold;\n}\n\n#homedyn h3{\ntext-transform:uppercase;\nfont-size:14px;\nfont-weight:bold;\n}\n#homedyn p{\nfont-size:10px;\n}\n#homedyn a{\ncolor:#a91111;\nfont-size:12px;\nfont-weight:bold;\ntext-decoration:none;\n}\n#homedyn img{\nwidth:290px;\nheight:auto;\n}\n.homeblogimg {\nwidth:290px;\nheight:180px;\noverflow:hidden;\n\n}\n\n#homeevents li{\nlist-style:none;\n}\n\n\n.slidesjs-pagination{\nposition:relative;\nleft:50px;\ntop:-128px;\n}\n\n.slidesjs-pagination-item{\nfloat:left;\nlist-style:none;\nwidth:260px;\nheight:188px;\n\n}\n\n.slidesjs-pagination-item a{\n\nwidth:260px;\nheight:188px;\n\n/*box-shadow: 3px 2px 4px #888888;*/\n}\n\n.slidesjs-pagination-item a.active{\n\n/*box-shadow: 1px 2px 6px #888888;*/\n}\n\n.slidesjs-pagination-item a.active{\n\n/*box-shadow: 1px 2px 6px #888888;*/\n}\n\n.slidesjs-pagination-item a[data-slidesjs-item=\'0\']{\nbackground-image: url(\"{main_site_root}images/home/slidenav0.png\");\nbackground-repeat: no-repeat;\ndisplay:block;\ntext-indent: -9999px;\n}\n\n.slidesjs-pagination-item a[data-slidesjs-item=\'0\'].active{\nbackground-image: url(\"{main_site_root}images/home/slidenav0-a.png\");\n}\n\n.slidesjs-pagination-item a[data-slidesjs-item=\'1\']{\nbackground-image: url(\"{main_site_root}images/home/slidenav1.png\");\nbackground-repeat: no-repeat;\ndisplay:block;\ntext-indent: -9999px;\n}\n\n.slidesjs-pagination-item a[data-slidesjs-item=\'1\'].active{\nbackground-image: url(\"{main_site_root}images/home/slidenav1-a.png\");\n}\n\n.slidesjs-pagination-item a[data-slidesjs-item=\'2\']{\nbackground-image: url(\"{main_site_root}images/home/slidenav2.png\");\nbackground-repeat: no-repeat;\ndisplay:block;\ntext-indent: -9999px;\n}\n\n.slidesjs-pagination-item a[data-slidesjs-item=\'2\'].active{\nbackground-image: url(\"{main_site_root}images/home/slidenav2-a.png\");\n}\n\n.slidesjs-pagination-item a[data-slidesjs-item=\'3\']{\nbackground-image: url(\"{main_site_root}images/home/slidenav3.png\");\nbackground-repeat: no-repeat;\ndisplay:block;\ntext-indent: -9999px;\n}\n\n.slidesjs-pagination-item a[data-slidesjs-item=\'3\'].active{\nbackground-image: url(\"{main_site_root}images/home/slidenav3-a.png\");\n}\n\n/* books and movies */\n.books{\nfloat:left;\ndisplay:block;\nwidth:540px;\n}\n\n#breadcrumb-wrap {\n font-family: \"proxima-nova\";\nfont-size:12px;\nfont-weight:600;\ntext-transform:uppercase;\nmargin-top:10px;\n\n}\n#breadcrumb-wrap a {\ntext-decoration:none;\ncolor:#888;\n}\n\n#books-top-left{\nwidth:480px !important;\nmargin-right:30px;\nheight:400px;\n}\n#books-top-left h3{\nfont-size:50px;\nmargin-bottom:15px;\n}\n#books-top-left p{\nfont-size:20px;\n}\n\n#books-top-right{\nfloat:right;\nwidth:348px;\n}\n\n#books-main-content-left{\n\nmargin-right:30px;\n\n}\n#books-main-content-right{\n\n\n}\n#books-main-content p{\n}\n\n#books-bottom-left{\n\nmargin-right:30px;\n}\n\n#books-bottom-right{\n\n}\n#books-top-wrapper{\nwidth:1200px;\nheight:400px;\nbackground-repeat:no-repeat;\nbackground-position:425px 0px;\n}\n#sharethis{\nposition:relative;\nbottom:0px;\n}\n.bookline {\nborder: 0;width: 90%;color: #ecedef;background-color: #ecedef;height: 1px;float:left;\n}\n.mon-head{\n font-family: \"proxima-nova\";\nfont-size:20px;\nfont-weight:400;\ntext-transform:uppercase;\n}\n.books h3{\nfont-size:16px;\ncolor:#ad1515;\nmargin:0px;\n}\n/* lightbox */\n#lightbox {\n    position:fixed; /* keeps the lightbox window in the current viewport */\n    top:0;\n    left:0;\n    width:100%;\n    height:100%;\n    background:url({main_site_root}images/books-movies/overlay.png) repeat;\n    text-align:center;\n	z-index:9999;\n}\n#buybook{background:#fff; width:501px; height:488px;margin:auto;position:relative;top:100px; padding:0px;text-align:left;}\n\n.unseen{\nvisibility:hidden;\n}\n.seen{\nvisibility:visible;\n}\n\n.bookshops{\nfloat: left;\nwidth:250px;\nheight:90px;\nborder-style:solid;\nborder-color:#ccc;\nborder-right-width:1px;\nborder-bottom-width:1px;\nborder-top-width:0px;\n\nborder-left-width:0px;\n\n\n}\n.bookshopsr{\nfloat: right;\nwidth:250px;\nheight:90px;\nborder-style:solid;\nborder-color:#ccc;\nborder-top-width:0px;\nborder-left-width:0px;\nborder-right-width:0px;\nborder-bottom-width:1px;\n\n}\n.bookshopstop{\nfloat: left;\nwidth:100%;\nheight:90px;\nborder-style:solid;\nborder-color:#ccc;\nborder-top-width:0px;\nborder-left-width:0px;\nborder-right-width:0px;\nborder-bottom-width:1px;\n\n}\n.buybuy{\nposition:relative;\ntop:35px;\nleft:10px;\n font-family: \"proxima-nova\";\nfont-size:25px;\nfont-weight:800;\ntext-transform:uppercase;\n}\n\n.bookshopsbot{\nfloat: left;\nwidth:250px;\nheight:90px;\nborder-style:solid;\nborder-color:#ccc;\nborder-top-width:0px;\nborder-left-width:0px;\nborder-right-width:1px;\nborder-bottom-width:0px;\n\n}\n.x{float:right;position:relative;top:10px;right:10px;}\n#amazon img{position:relative;top:12px;left:30px;}\n#barnes{position:relative;top:12px;left:30px;}\n#indie{position:relative;top:12px;left:30px;}\n#powells{position:relative;top:12px;left:30px;}\n#ibooks{position:relative;top:12px;left:30px;}\n#google{position:relative;top:12px;left:30px;}\n#kobo{position:relative;top:12px;left:30px;}\n\n\n/*footer */\n#footcontain{\nbackground-color: #2e3c4f;\nwidth:100%;\n}\n#footer{\npadding-top:40px:\ncolor:#fff;\nfont-size: 12px;\nbackground-color: #2e3c4f;\nwidth:100%;\nheight:275px;\nmargin: 0 auto;\nwidth: 1200px;\n}\n#footer a{\ncolor:#fff;\ntext-decoration:none;\n\n}\n#footer ul{\npadding:0px;\n}\n#footer li{\nlist-style:none;\n}\n#footer h2{\ntext-transform:uppercase;\nmargin:0;\nfont-size: 15px;\nfont-weight:bold;\n}\n#foot-home{\nfloat:left;\nwidth:195px;\nmargin-left:80px;\nmargin-top:40px;\n}\n#foot-edu{\nfloat:left;\nwidth:146px;\nmargin-left:25px;\nmargin-top:25px;\n}\n#foot-heroes{\nfloat:left;\nwidth:148px;\nmargin-left:25px;\nmargin-top:25px;\n}\n#foot-speaking{\nfloat:left;\nwidth:148px;\nmargin-left:25px;\nmargin-top:25px;\n}\n#foot-about{\nfloat:left;\nwidth:167px;\nmargin-left:25px;\nmargin-top:25px;\n}\n.vertcent{\ndisplay: table-cell;\nvertical-align: middle;\nposition: relative;\nheight:357px;\n}'),(366,3,'exp_templates','template_data',1366406095,1,'body{\n	\n	background-color: #fff; \n	color: #364455;\n	margin: 0;\n	font-family: \"calluna\";\n	\n	width: 100%;\n}\n\n#wrapper{\nmargin: 0 auto;\nwidth: 1200px;\n\n}\n/* nav */\n#navcontain{\nbackground-image: url(\"{main_site_root}/images/home/navrule.gif\");\nbackground-position: 0px 71px;\nbackground-repeat: repeat-x;\nheight:74px;\n}\n#nav{\npadding: 0px 0px 35px 0px;\nmargin: 0 auto;\nwidth: 1300px;\n}\n.logo{float:left; display:block; position:relative; top:17px; margin-right:90px;}\n.navrule {border: 0;width: 90%;color: #5b6575;background-color: #5b6575;height: 1px;float:left;}\n//* \n	LEVEL ONE\n*/\n.dropme {margin:0;}\nul.dropdown                         { position: relative; margin:0;z-index:9999; }\nul.dropdown li                      {  float: left; zoom: 1;  list-style:none; height:74px; }\nul.dropdown a:hover		            { color: #fff; }\nul.dropdown a:active                { color: #fff; }\nul.dropdown li a                    { display: block; padding: 30px 15px; border-right: 1px solid #333;\n	 								  color: #364455; text-decoration:none;text-transform:uppercase; }\nul.dropdown li:last-child a         { border-right: none; } /* Doesn\'t work in IE */\nul.dropdown li.hover,\nul.dropdown li:hover                { background-color:rgba(50,64,82,0.9); color: #fff; position: relative; }\nul.dropdown li.hover a              { color: #fff; }\n\n\n/* \n	LEVEL TWO\n*/\nul.dropdown ul 						{ width: 220px; visibility: hidden; position: absolute; top: 100%; left: 0; z-index:9999; margin:0; }\nul.dropdown ul li 					{ font-weight: normal; background-color:rgba(50,64,82,0.9); color: #fff; \n									  border-bottom: 0px solid #ccc; float: none; margin-left:-40px; }\n									  \n                                    /* IE 6 & 7 Needs Inline Block */\nul.dropdown ul li a					{ border-right: none; width: 100%; display: inline-block;color: #fff;  } \n\n/* \n	LEVEL THREE\n*/\nul.dropdown ul ul 					{ left: 100%; top: 0; }\nul.dropdown li:hover > ul 			{ visibility: visible; }\n\n\n\n\n/*home page */\n#homecell{\nbackground-image: url(\"{main_site_root}/images/home/home-cell-bg.jpg\");\nbackground-position: 0 19px;\nbackground-repeat: no-repeat;\nwidth:100%;\nheight:800px;\nposition: relative;\ntop: -38px;\n}\n.homeslide {\nwidth:1200px !important;\nheight:554px !important;\n\n}\n.container{\n\n}\n#home-static-image{\nbackground-image: url(\"{main_site_root}images/home/mm-1.png\");\nwidth: 498px;\nheight:332px;\nfloat:left;\n}\n\n#home-static-text{\nwidth:514px;\nfloat:left;\n}\n#hero1{\n/* background-image: url(\"{main_site_root}images/home/heroimage1.png\");\nbackground-repeat: no-repeat;\nbackground-position:100px 31px; */\nwidth:100%;\nheight:604px;\n\n}\n#homeblogpreviews{\nwidth:680px;\nfloat:left;\n\n}\n\n#homeevents{\nwidth:500;\nfloat:left;\n\n}\n#homeevents li{\nmargin-left:40px;\n}\n.homeblogs{\nfloat:left;\nmargin-right:50px;\nwidth:290px;\n}\n#homedyn h1{\ntext-transform:uppercase;\nfont-size:18px;\nfont-weight:bold;\n}\n\n#homedyn h3{\ntext-transform:uppercase;\nfont-size:14px;\nfont-weight:bold;\n}\n#homedyn p{\nfont-size:10px;\n}\n#homedyn a{\ncolor:#a91111;\nfont-size:12px;\nfont-weight:bold;\ntext-decoration:none;\n}\n#homedyn img{\nwidth:290px;\nheight:auto;\n}\n.homeblogimg {\nwidth:290px;\nheight:180px;\noverflow:hidden;\n\n}\n\n#homeevents li{\nlist-style:none;\n}\n\n\n.slidesjs-pagination{\nposition:relative;\nleft:50px;\ntop:-128px;\n}\n\n.slidesjs-pagination-item{\nfloat:left;\nlist-style:none;\nwidth:260px;\nheight:188px;\n\n}\n\n.slidesjs-pagination-item a{\n\nwidth:260px;\nheight:188px;\n\n/*box-shadow: 3px 2px 4px #888888;*/\n}\n\n.slidesjs-pagination-item a.active{\n\n/*box-shadow: 1px 2px 6px #888888;*/\n}\n\n.slidesjs-pagination-item a.active{\n\n/*box-shadow: 1px 2px 6px #888888;*/\n}\n\n.slidesjs-pagination-item a[data-slidesjs-item=\'0\']{\nbackground-image: url(\"{main_site_root}images/home/slidenav0.png\");\nbackground-repeat: no-repeat;\ndisplay:block;\ntext-indent: -9999px;\n}\n\n.slidesjs-pagination-item a[data-slidesjs-item=\'0\'].active{\nbackground-image: url(\"{main_site_root}images/home/slidenav0-a.png\");\n}\n\n.slidesjs-pagination-item a[data-slidesjs-item=\'1\']{\nbackground-image: url(\"{main_site_root}images/home/slidenav1.png\");\nbackground-repeat: no-repeat;\ndisplay:block;\ntext-indent: -9999px;\n}\n\n.slidesjs-pagination-item a[data-slidesjs-item=\'1\'].active{\nbackground-image: url(\"{main_site_root}images/home/slidenav1-a.png\");\n}\n\n.slidesjs-pagination-item a[data-slidesjs-item=\'2\']{\nbackground-image: url(\"{main_site_root}images/home/slidenav2.png\");\nbackground-repeat: no-repeat;\ndisplay:block;\ntext-indent: -9999px;\n}\n\n.slidesjs-pagination-item a[data-slidesjs-item=\'2\'].active{\nbackground-image: url(\"{main_site_root}images/home/slidenav2-a.png\");\n}\n\n.slidesjs-pagination-item a[data-slidesjs-item=\'3\']{\nbackground-image: url(\"{main_site_root}images/home/slidenav3.png\");\nbackground-repeat: no-repeat;\ndisplay:block;\ntext-indent: -9999px;\n}\n\n.slidesjs-pagination-item a[data-slidesjs-item=\'3\'].active{\nbackground-image: url(\"{main_site_root}images/home/slidenav3-a.png\");\n}\n\n/* books and movies */\n.books{\nfloat:left;\ndisplay:block;\nwidth:540px;\n}\n\n#breadcrumb-wrap {\n font-family: \"proxima-nova\";\nfont-size:12px;\nfont-weight:600;\ntext-transform:uppercase;\nmargin-top:10px;\n\n}\n#breadcrumb-wrap a {\ntext-decoration:none;\ncolor:#888;\n}\n\n#books-top-left{\nwidth:480px !important;\nmargin-right:30px;\nheight:400px;\n}\n#books-top-left h3{\nfont-size:50px;\nmargin-bottom:15px;\n}\n#books-top-left p{\nfont-size:20px;\n}\n\n#books-top-right{\nfloat:right;\nwidth:348px;\n}\n\n#books-main-content-left{\n\nmargin-right:30px;\n\n}\n#books-main-content-right{\n\n\n}\n#books-main-content p{\n}\n\n#books-bottom-left{\n\nmargin-right:30px;\n}\n\n#books-bottom-right{\n\n}\n#books-top-wrapper{\nwidth:1200px;\nheight:400px;\nbackground-repeat:no-repeat;\nbackground-position:425px 0px;\n}\n#sharethis{\nposition:relative;\nbottom:0px;\n}\n.bookline {\nborder: 0;width: 90%;color: #ecedef;background-color: #ecedef;height: 1px;float:left;\n}\n.mon-head{\n font-family: \"proxima-nova\";\nfont-size:20px;\nfont-weight:400;\ntext-transform:uppercase;\n}\n.books h3{\nfont-size:16px;\ncolor:#ad1515;\nmargin:0px;\n}\n/* lightbox */\n#lightbox {\n    position:fixed; /* keeps the lightbox window in the current viewport */\n    top:0;\n    left:0;\n    width:100%;\n    height:100%;\n    background:url({main_site_root}images/books-movies/overlay.png) repeat;\n    text-align:center;\n	z-index:9999;\n}\n#buybook{background:#fff; width:501px; height:488px;margin:auto;position:relative;top:100px; padding:0px;text-align:left;}\n\n.unseen{\nvisibility:hidden;\n}\n.seen{\nvisibility:visible;\n}\n\n.bookshops{\nfloat: left;\nwidth:250px;\nheight:90px;\nborder-style:solid;\nborder-color:#ccc;\nborder-right-width:1px;\nborder-bottom-width:1px;\nborder-top-width:0px;\n\nborder-left-width:0px;\n\n\n}\n.bookshopsr{\nfloat: right;\nwidth:250px;\nheight:90px;\nborder-style:solid;\nborder-color:#ccc;\nborder-top-width:0px;\nborder-left-width:0px;\nborder-right-width:0px;\nborder-bottom-width:1px;\n\n}\n.bookshopstop{\nfloat: left;\nwidth:100%;\nheight:90px;\nborder-style:solid;\nborder-color:#ccc;\nborder-top-width:0px;\nborder-left-width:0px;\nborder-right-width:0px;\nborder-bottom-width:1px;\n\n}\n.buybuy{\nposition:relative;\ntop:35px;\nleft:10px;\n font-family: \"proxima-nova\";\nfont-size:25px;\nfont-weight:800;\ntext-transform:uppercase;\n}\n\n.bookshopsbot{\nfloat: left;\nwidth:250px;\nheight:90px;\nborder-style:solid;\nborder-color:#ccc;\nborder-top-width:0px;\nborder-left-width:0px;\nborder-right-width:1px;\nborder-bottom-width:0px;\n\n}\n.x{float:right;position:relative;top:10px;right:10px;}\n#amazon img{position:relative;top:12px;left:30px;}\n#barnes img{position:relative;top:12px;left:30px;}\n#indie img{position:relative;top:12px;left:30px;}\n#powells img{position:relative;top:12px;left:30px;}\n#ibooks img{position:relative;top:12px;left:30px;}\n#google img{position:relative;top:12px;left:30px;}\n#kobo img{position:relative;top:12px;left:30px;}\n\n\n/*footer */\n#footcontain{\nbackground-color: #2e3c4f;\nwidth:100%;\n}\n#footer{\npadding-top:40px:\ncolor:#fff;\nfont-size: 12px;\nbackground-color: #2e3c4f;\nwidth:100%;\nheight:275px;\nmargin: 0 auto;\nwidth: 1200px;\n}\n#footer a{\ncolor:#fff;\ntext-decoration:none;\n\n}\n#footer ul{\npadding:0px;\n}\n#footer li{\nlist-style:none;\n}\n#footer h2{\ntext-transform:uppercase;\nmargin:0;\nfont-size: 15px;\nfont-weight:bold;\n}\n#foot-home{\nfloat:left;\nwidth:195px;\nmargin-left:80px;\nmargin-top:40px;\n}\n#foot-edu{\nfloat:left;\nwidth:146px;\nmargin-left:25px;\nmargin-top:25px;\n}\n#foot-heroes{\nfloat:left;\nwidth:148px;\nmargin-left:25px;\nmargin-top:25px;\n}\n#foot-speaking{\nfloat:left;\nwidth:148px;\nmargin-left:25px;\nmargin-top:25px;\n}\n#foot-about{\nfloat:left;\nwidth:167px;\nmargin-left:25px;\nmargin-top:25px;\n}\n.vertcent{\ndisplay: table-cell;\nvertical-align: middle;\nposition: relative;\nheight:357px;\n}'),(367,3,'exp_templates','template_data',1366406386,1,'body{\n	\n	background-color: #fff; \n	color: #364455;\n	margin: 0;\n	font-family: \"calluna\";\n	\n	width: 100%;\n}\n\n#wrapper{\nmargin: 0 auto;\nwidth: 1200px;\n\n}\n/* nav */\n#navcontain{\nbackground-image: url(\"{main_site_root}/images/home/navrule.gif\");\nbackground-position: 0px 71px;\nbackground-repeat: repeat-x;\nheight:74px;\n}\n#nav{\npadding: 0px 0px 35px 0px;\nmargin: 0 auto;\nwidth: 1300px;\n}\n.logo{float:left; display:block; position:relative; top:17px; margin-right:90px;}\n.navrule {border: 0;width: 90%;color: #5b6575;background-color: #5b6575;height: 1px;float:left;}\n//* \n	LEVEL ONE\n*/\n.dropme {margin:0;}\nul.dropdown                         { position: relative; margin:0;z-index:9999; }\nul.dropdown li                      {  float: left; zoom: 1;  list-style:none; height:74px; }\nul.dropdown a:hover		            { color: #fff; }\nul.dropdown a:active                { color: #fff; }\nul.dropdown li a                    { display: block; padding: 30px 15px; border-right: 1px solid #333;\n	 								  color: #364455; text-decoration:none;text-transform:uppercase; }\nul.dropdown li:last-child a         { border-right: none; } /* Doesn\'t work in IE */\nul.dropdown li.hover,\nul.dropdown li:hover                { background-color:rgba(50,64,82,0.9); color: #fff; position: relative; }\nul.dropdown li.hover a              { color: #fff; }\n\n\n/* \n	LEVEL TWO\n*/\nul.dropdown ul 						{ width: 220px; visibility: hidden; position: absolute; top: 100%; left: 0; z-index:9999; margin:0; }\nul.dropdown ul li 					{ font-weight: normal; background-color:rgba(50,64,82,0.9); color: #fff; \n									  border-bottom: 0px solid #ccc; float: none; margin-left:-40px; }\n									  \n                                    /* IE 6 & 7 Needs Inline Block */\nul.dropdown ul li a					{ border-right: none; width: 100%; display: inline-block;color: #fff;  } \n\n/* \n	LEVEL THREE\n*/\nul.dropdown ul ul 					{ left: 100%; top: 0; }\nul.dropdown li:hover > ul 			{ visibility: visible; }\n\n\n\n\n/*home page */\n#homecell{\nbackground-image: url(\"{main_site_root}/images/home/home-cell-bg.jpg\");\nbackground-position: 0 19px;\nbackground-repeat: no-repeat;\nwidth:100%;\nheight:800px;\nposition: relative;\ntop: -38px;\n}\n.homeslide {\nwidth:1200px !important;\nheight:554px !important;\n\n}\n.container{\n\n}\n#home-static-image{\nbackground-image: url(\"{main_site_root}images/home/mm-1.png\");\nwidth: 498px;\nheight:332px;\nfloat:left;\n}\n\n#home-static-text{\nwidth:514px;\nfloat:left;\n}\n#hero1{\n/* background-image: url(\"{main_site_root}images/home/heroimage1.png\");\nbackground-repeat: no-repeat;\nbackground-position:100px 31px; */\nwidth:100%;\nheight:604px;\n\n}\n#homeblogpreviews{\nwidth:680px;\nfloat:left;\n\n}\n\n#homeevents{\nwidth:500;\nfloat:left;\n\n}\n#homeevents li{\nmargin-left:40px;\n}\n.homeblogs{\nfloat:left;\nmargin-right:50px;\nwidth:290px;\n}\n#homedyn h1{\ntext-transform:uppercase;\nfont-size:18px;\nfont-weight:bold;\n}\n\n#homedyn h3{\ntext-transform:uppercase;\nfont-size:14px;\nfont-weight:bold;\n}\n#homedyn p{\nfont-size:10px;\n}\n#homedyn a{\ncolor:#a91111;\nfont-size:12px;\nfont-weight:bold;\ntext-decoration:none;\n}\n#homedyn img{\nwidth:290px;\nheight:auto;\n}\n.homeblogimg {\nwidth:290px;\nheight:180px;\noverflow:hidden;\n\n}\n\n#homeevents li{\nlist-style:none;\n}\n\n\n.slidesjs-pagination{\nposition:relative;\nleft:50px;\ntop:-128px;\n}\n\n.slidesjs-pagination-item{\nfloat:left;\nlist-style:none;\nwidth:260px;\nheight:188px;\n\n}\n\n.slidesjs-pagination-item a{\n\nwidth:260px;\nheight:188px;\n\n/*box-shadow: 3px 2px 4px #888888;*/\n}\n\n.slidesjs-pagination-item a.active{\n\n/*box-shadow: 1px 2px 6px #888888;*/\n}\n\n.slidesjs-pagination-item a.active{\n\n/*box-shadow: 1px 2px 6px #888888;*/\n}\n\n.slidesjs-pagination-item a[data-slidesjs-item=\'0\']{\nbackground-image: url(\"{main_site_root}images/home/slidenav0.png\");\nbackground-repeat: no-repeat;\ndisplay:block;\ntext-indent: -9999px;\n}\n\n.slidesjs-pagination-item a[data-slidesjs-item=\'0\'].active{\nbackground-image: url(\"{main_site_root}images/home/slidenav0-a.png\");\n}\n\n.slidesjs-pagination-item a[data-slidesjs-item=\'1\']{\nbackground-image: url(\"{main_site_root}images/home/slidenav1.png\");\nbackground-repeat: no-repeat;\ndisplay:block;\ntext-indent: -9999px;\n}\n\n.slidesjs-pagination-item a[data-slidesjs-item=\'1\'].active{\nbackground-image: url(\"{main_site_root}images/home/slidenav1-a.png\");\n}\n\n.slidesjs-pagination-item a[data-slidesjs-item=\'2\']{\nbackground-image: url(\"{main_site_root}images/home/slidenav2.png\");\nbackground-repeat: no-repeat;\ndisplay:block;\ntext-indent: -9999px;\n}\n\n.slidesjs-pagination-item a[data-slidesjs-item=\'2\'].active{\nbackground-image: url(\"{main_site_root}images/home/slidenav2-a.png\");\n}\n\n.slidesjs-pagination-item a[data-slidesjs-item=\'3\']{\nbackground-image: url(\"{main_site_root}images/home/slidenav3.png\");\nbackground-repeat: no-repeat;\ndisplay:block;\ntext-indent: -9999px;\n}\n\n.slidesjs-pagination-item a[data-slidesjs-item=\'3\'].active{\nbackground-image: url(\"{main_site_root}images/home/slidenav3-a.png\");\n}\n\n/* books and movies */\n.books{\nfloat:left;\ndisplay:block;\nwidth:540px;\n}\n\n#breadcrumb-wrap {\n font-family: \"proxima-nova\";\nfont-size:12px;\nfont-weight:600;\ntext-transform:uppercase;\nmargin-top:10px;\n\n}\n#breadcrumb-wrap a {\ntext-decoration:none;\ncolor:#888;\n}\n\n#books-top-left{\nwidth:480px !important;\nmargin-right:30px;\nheight:400px;\n}\n#books-top-left h3{\nfont-size:50px;\nmargin-bottom:15px;\n}\n#books-top-left p{\nfont-size:20px;\n}\n\n#books-top-right{\nfloat:right;\nwidth:348px;\n}\n\n#books-main-content-left{\n\nmargin-right:30px;\n\n}\n#books-main-content-right{\n\n\n}\n#books-main-content p{\n}\n\n#books-bottom-left{\n\nmargin-right:30px;\n}\n\n#books-bottom-right{\n\n}\n#books-top-wrapper{\nwidth:1200px;\nheight:400px;\nbackground-repeat:no-repeat;\nbackground-position:425px 0px;\n}\n#sharethis{\nposition:relative;\nbottom:0px;\n}\n.bookline {\nborder: 0;width: 90%;color: #ecedef;background-color: #ecedef;height: 1px;float:left;\n}\n.mon-head{\n font-family: \"proxima-nova\";\nfont-size:20px;\nfont-weight:400;\ntext-transform:uppercase;\n}\n.books h3{\nfont-size:16px;\ncolor:#ad1515;\nmargin:0px;\n}\n/* lightbox */\n#lightbox {\n    position:fixed; /* keeps the lightbox window in the current viewport */\n    top:0;\n    left:0;\n    width:100%;\n    height:100%;\n    background:url({main_site_root}images/books-movies/overlay.png) repeat;\n    text-align:center;\n	z-index:9999;\n}\n#buybook{background:#fff; width:501px; height:488px;margin:auto;position:relative;top:100px; padding:0px;text-align:left;}\n\n.unseen{\nvisibility:hidden;\n}\n.seen{\nvisibility:visible;\n}\n\n.bookshops{\nfloat: left;\nwidth:250px;\nheight:90px;\nborder-style:solid;\nborder-color:#ccc;\nborder-right-width:1px;\nborder-bottom-width:1px;\nborder-top-width:0px;\n\nborder-left-width:0px;\n\n\n}\n.bookshopsr{\nfloat: right;\nwidth:250px;\nheight:90px;\nborder-style:solid;\nborder-color:#ccc;\nborder-top-width:0px;\nborder-left-width:0px;\nborder-right-width:0px;\nborder-bottom-width:1px;\n\n}\n.bookshopstop{\nfloat: left;\nwidth:100%;\nheight:90px;\nborder-style:solid;\nborder-color:#ccc;\nborder-top-width:0px;\nborder-left-width:0px;\nborder-right-width:0px;\nborder-bottom-width:1px;\n\n}\n.buybuy{\nposition:relative;\ntop:35px;\nleft:35px;\n font-family: \"proxima-nova\";\nfont-size:22px;\nfont-weight:800;\ntext-transform:uppercase;\n}\n\n.bookshopsbot{\nfloat: left;\nwidth:250px;\nheight:90px;\nborder-style:solid;\nborder-color:#ccc;\nborder-top-width:0px;\nborder-left-width:0px;\nborder-right-width:1px;\nborder-bottom-width:0px;\n\n}\n.x{float:right;position:relative;top:10px;right:10px;}\n#amazon img{position:relative;top:12px;left:30px;}\n#barnes img{position:relative;top:12px;left:30px;}\n#indie img{position:relative;top:12px;left:30px;}\n#powells img{position:relative;top:12px;left:43px;}\n#ibooks img{position:relative;top:27px;left:38px;}\n#google img{position:relative;top:24px;left:33px;}\n#kobo img{position:relative;top:21px;left:68px;}\n\n\n/*footer */\n#footcontain{\nbackground-color: #2e3c4f;\nwidth:100%;\n}\n#footer{\npadding-top:40px:\ncolor:#fff;\nfont-size: 12px;\nbackground-color: #2e3c4f;\nwidth:100%;\nheight:275px;\nmargin: 0 auto;\nwidth: 1200px;\n}\n#footer a{\ncolor:#fff;\ntext-decoration:none;\n\n}\n#footer ul{\npadding:0px;\n}\n#footer li{\nlist-style:none;\n}\n#footer h2{\ntext-transform:uppercase;\nmargin:0;\nfont-size: 15px;\nfont-weight:bold;\n}\n#foot-home{\nfloat:left;\nwidth:195px;\nmargin-left:80px;\nmargin-top:40px;\n}\n#foot-edu{\nfloat:left;\nwidth:146px;\nmargin-left:25px;\nmargin-top:25px;\n}\n#foot-heroes{\nfloat:left;\nwidth:148px;\nmargin-left:25px;\nmargin-top:25px;\n}\n#foot-speaking{\nfloat:left;\nwidth:148px;\nmargin-left:25px;\nmargin-top:25px;\n}\n#foot-about{\nfloat:left;\nwidth:167px;\nmargin-left:25px;\nmargin-top:25px;\n}\n.vertcent{\ndisplay: table-cell;\nvertical-align: middle;\nposition: relative;\nheight:357px;\n}'),(368,3,'exp_templates','template_data',1366406527,1,'body{\n	\n	background-color: #fff; \n	color: #364455;\n	margin: 0;\n	font-family: \"calluna\";\n	\n	width: 100%;\n}\n\n#wrapper{\nmargin: 0 auto;\nwidth: 1200px;\n\n}\n/* nav */\n#navcontain{\nbackground-image: url(\"{main_site_root}/images/home/navrule.gif\");\nbackground-position: 0px 71px;\nbackground-repeat: repeat-x;\nheight:74px;\n}\n#nav{\npadding: 0px 0px 35px 0px;\nmargin: 0 auto;\nwidth: 1300px;\nfont-family: \"proxima-nova\";\n}\n.logo{float:left; display:block; position:relative; top:17px; margin-right:90px;}\n.navrule {border: 0;width: 90%;color: #5b6575;background-color: #5b6575;height: 1px;float:left;}\n//* \n	LEVEL ONE\n*/\n.dropme {margin:0;}\nul.dropdown                         { position: relative; margin:0;z-index:9999; }\nul.dropdown li                      {  float: left; zoom: 1;  list-style:none; height:74px; }\nul.dropdown a:hover		            { color: #fff; }\nul.dropdown a:active                { color: #fff; }\nul.dropdown li a                    { display: block; padding: 30px 15px; border-right: 1px solid #333;\n	 								  color: #364455; text-decoration:none;text-transform:uppercase; }\nul.dropdown li:last-child a         { border-right: none; } /* Doesn\'t work in IE */\nul.dropdown li.hover,\nul.dropdown li:hover                { background-color:rgba(50,64,82,0.9); color: #fff; position: relative; }\nul.dropdown li.hover a              { color: #fff; }\n\n\n/* \n	LEVEL TWO\n*/\nul.dropdown ul 						{ width: 220px; visibility: hidden; position: absolute; top: 100%; left: 0; z-index:9999; margin:0; }\nul.dropdown ul li 					{ font-weight: normal; background-color:rgba(50,64,82,0.9); color: #fff; \n									  border-bottom: 0px solid #ccc; float: none; margin-left:-40px; }\n									  \n                                    /* IE 6 & 7 Needs Inline Block */\nul.dropdown ul li a					{ border-right: none; width: 100%; display: inline-block;color: #fff;  } \n\n/* \n	LEVEL THREE\n*/\nul.dropdown ul ul 					{ left: 100%; top: 0; }\nul.dropdown li:hover > ul 			{ visibility: visible; }\n\n\n\n\n/*home page */\n#homecell{\nbackground-image: url(\"{main_site_root}/images/home/home-cell-bg.jpg\");\nbackground-position: 0 19px;\nbackground-repeat: no-repeat;\nwidth:100%;\nheight:800px;\nposition: relative;\ntop: -38px;\n}\n.homeslide {\nwidth:1200px !important;\nheight:554px !important;\n\n}\n.container{\n\n}\n#home-static-image{\nbackground-image: url(\"{main_site_root}images/home/mm-1.png\");\nwidth: 498px;\nheight:332px;\nfloat:left;\n}\n\n#home-static-text{\nwidth:514px;\nfloat:left;\n}\n#hero1{\n/* background-image: url(\"{main_site_root}images/home/heroimage1.png\");\nbackground-repeat: no-repeat;\nbackground-position:100px 31px; */\nwidth:100%;\nheight:604px;\n\n}\n#homeblogpreviews{\nwidth:680px;\nfloat:left;\n\n}\n\n#homeevents{\nwidth:500;\nfloat:left;\n\n}\n#homeevents li{\nmargin-left:40px;\n}\n.homeblogs{\nfloat:left;\nmargin-right:50px;\nwidth:290px;\n}\n#homedyn h1{\ntext-transform:uppercase;\nfont-size:18px;\nfont-weight:bold;\n}\n\n#homedyn h3{\ntext-transform:uppercase;\nfont-size:14px;\nfont-weight:bold;\n}\n#homedyn p{\nfont-size:10px;\n}\n#homedyn a{\ncolor:#a91111;\nfont-size:12px;\nfont-weight:bold;\ntext-decoration:none;\n}\n#homedyn img{\nwidth:290px;\nheight:auto;\n}\n.homeblogimg {\nwidth:290px;\nheight:180px;\noverflow:hidden;\n\n}\n\n#homeevents li{\nlist-style:none;\n}\n\n\n.slidesjs-pagination{\nposition:relative;\nleft:50px;\ntop:-128px;\n}\n\n.slidesjs-pagination-item{\nfloat:left;\nlist-style:none;\nwidth:260px;\nheight:188px;\n\n}\n\n.slidesjs-pagination-item a{\n\nwidth:260px;\nheight:188px;\n\n/*box-shadow: 3px 2px 4px #888888;*/\n}\n\n.slidesjs-pagination-item a.active{\n\n/*box-shadow: 1px 2px 6px #888888;*/\n}\n\n.slidesjs-pagination-item a.active{\n\n/*box-shadow: 1px 2px 6px #888888;*/\n}\n\n.slidesjs-pagination-item a[data-slidesjs-item=\'0\']{\nbackground-image: url(\"{main_site_root}images/home/slidenav0.png\");\nbackground-repeat: no-repeat;\ndisplay:block;\ntext-indent: -9999px;\n}\n\n.slidesjs-pagination-item a[data-slidesjs-item=\'0\'].active{\nbackground-image: url(\"{main_site_root}images/home/slidenav0-a.png\");\n}\n\n.slidesjs-pagination-item a[data-slidesjs-item=\'1\']{\nbackground-image: url(\"{main_site_root}images/home/slidenav1.png\");\nbackground-repeat: no-repeat;\ndisplay:block;\ntext-indent: -9999px;\n}\n\n.slidesjs-pagination-item a[data-slidesjs-item=\'1\'].active{\nbackground-image: url(\"{main_site_root}images/home/slidenav1-a.png\");\n}\n\n.slidesjs-pagination-item a[data-slidesjs-item=\'2\']{\nbackground-image: url(\"{main_site_root}images/home/slidenav2.png\");\nbackground-repeat: no-repeat;\ndisplay:block;\ntext-indent: -9999px;\n}\n\n.slidesjs-pagination-item a[data-slidesjs-item=\'2\'].active{\nbackground-image: url(\"{main_site_root}images/home/slidenav2-a.png\");\n}\n\n.slidesjs-pagination-item a[data-slidesjs-item=\'3\']{\nbackground-image: url(\"{main_site_root}images/home/slidenav3.png\");\nbackground-repeat: no-repeat;\ndisplay:block;\ntext-indent: -9999px;\n}\n\n.slidesjs-pagination-item a[data-slidesjs-item=\'3\'].active{\nbackground-image: url(\"{main_site_root}images/home/slidenav3-a.png\");\n}\n\n/* books and movies */\n.books{\nfloat:left;\ndisplay:block;\nwidth:540px;\n}\n\n#breadcrumb-wrap {\n font-family: \"proxima-nova\";\nfont-size:12px;\nfont-weight:600;\ntext-transform:uppercase;\nmargin-top:10px;\n\n}\n#breadcrumb-wrap a {\ntext-decoration:none;\ncolor:#888;\n}\n\n#books-top-left{\nwidth:480px !important;\nmargin-right:30px;\nheight:400px;\n}\n#books-top-left h3{\nfont-size:50px;\nmargin-bottom:15px;\n}\n#books-top-left p{\nfont-size:20px;\n}\n\n#books-top-right{\nfloat:right;\nwidth:348px;\n}\n\n#books-main-content-left{\n\nmargin-right:30px;\n\n}\n#books-main-content-right{\n\n\n}\n#books-main-content p{\n}\n\n#books-bottom-left{\n\nmargin-right:30px;\n}\n\n#books-bottom-right{\n\n}\n#books-top-wrapper{\nwidth:1200px;\nheight:400px;\nbackground-repeat:no-repeat;\nbackground-position:425px 0px;\n}\n#sharethis{\nposition:relative;\nbottom:0px;\n}\n.bookline {\nborder: 0;width: 90%;color: #ecedef;background-color: #ecedef;height: 1px;float:left;\n}\n.mon-head{\n font-family: \"proxima-nova\";\nfont-size:20px;\nfont-weight:400;\ntext-transform:uppercase;\n}\n.books h3{\nfont-size:16px;\ncolor:#ad1515;\nmargin:0px;\n}\n/* lightbox */\n#lightbox {\n    position:fixed; /* keeps the lightbox window in the current viewport */\n    top:0;\n    left:0;\n    width:100%;\n    height:100%;\n    background:url({main_site_root}images/books-movies/overlay.png) repeat;\n    text-align:center;\n	z-index:9999;\n}\n#buybook{background:#fff; width:501px; height:488px;margin:auto;position:relative;top:100px; padding:0px;text-align:left;}\n\n.unseen{\nvisibility:hidden;\n}\n.seen{\nvisibility:visible;\n}\n\n.bookshops{\nfloat: left;\nwidth:250px;\nheight:90px;\nborder-style:solid;\nborder-color:#ccc;\nborder-right-width:1px;\nborder-bottom-width:1px;\nborder-top-width:0px;\n\nborder-left-width:0px;\n\n\n}\n.bookshopsr{\nfloat: right;\nwidth:250px;\nheight:90px;\nborder-style:solid;\nborder-color:#ccc;\nborder-top-width:0px;\nborder-left-width:0px;\nborder-right-width:0px;\nborder-bottom-width:1px;\n\n}\n.bookshopstop{\nfloat: left;\nwidth:100%;\nheight:90px;\nborder-style:solid;\nborder-color:#ccc;\nborder-top-width:0px;\nborder-left-width:0px;\nborder-right-width:0px;\nborder-bottom-width:1px;\n\n}\n.buybuy{\nposition:relative;\ntop:35px;\nleft:35px;\n font-family: \"proxima-nova\";\nfont-size:22px;\nfont-weight:800;\ntext-transform:uppercase;\n}\n\n.bookshopsbot{\nfloat: left;\nwidth:250px;\nheight:90px;\nborder-style:solid;\nborder-color:#ccc;\nborder-top-width:0px;\nborder-left-width:0px;\nborder-right-width:1px;\nborder-bottom-width:0px;\n\n}\n.x{float:right;position:relative;top:10px;right:10px;}\n#amazon img{position:relative;top:12px;left:30px;}\n#barnes img{position:relative;top:12px;left:30px;}\n#indie img{position:relative;top:12px;left:30px;}\n#powells img{position:relative;top:12px;left:43px;}\n#ibooks img{position:relative;top:27px;left:38px;}\n#google img{position:relative;top:24px;left:33px;}\n#kobo img{position:relative;top:21px;left:68px;}\n\n\n/*footer */\n#footcontain{\nbackground-color: #2e3c4f;\nwidth:100%;\n}\n#footer{\npadding-top:40px:\ncolor:#fff;\nfont-size: 12px;\nbackground-color: #2e3c4f;\nwidth:100%;\nheight:275px;\nmargin: 0 auto;\nwidth: 1200px;\n}\n#footer a{\ncolor:#fff;\ntext-decoration:none;\n\n}\n#footer ul{\npadding:0px;\n}\n#footer li{\nlist-style:none;\n}\n#footer h2{\ntext-transform:uppercase;\nmargin:0;\nfont-size: 15px;\nfont-weight:bold;\n}\n#foot-home{\nfloat:left;\nwidth:195px;\nmargin-left:80px;\nmargin-top:40px;\n}\n#foot-edu{\nfloat:left;\nwidth:146px;\nmargin-left:25px;\nmargin-top:25px;\n}\n#foot-heroes{\nfloat:left;\nwidth:148px;\nmargin-left:25px;\nmargin-top:25px;\n}\n#foot-speaking{\nfloat:left;\nwidth:148px;\nmargin-left:25px;\nmargin-top:25px;\n}\n#foot-about{\nfloat:left;\nwidth:167px;\nmargin-left:25px;\nmargin-top:25px;\n}\n.vertcent{\ndisplay: table-cell;\nvertical-align: middle;\nposition: relative;\nheight:357px;\n}');

/*Table structure for table `exp_rte_tools` */

DROP TABLE IF EXISTS `exp_rte_tools`;

CREATE TABLE `exp_rte_tools` (
  `tool_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(75) DEFAULT NULL,
  `class` varchar(75) DEFAULT NULL,
  `enabled` char(1) DEFAULT 'y',
  PRIMARY KEY (`tool_id`),
  KEY `enabled` (`enabled`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `exp_rte_tools` */

insert  into `exp_rte_tools`(`tool_id`,`name`,`class`,`enabled`) values (1,'Blockquote','Blockquote_rte','y'),(2,'Bold','Bold_rte','y'),(3,'Headings','Headings_rte','y'),(4,'Image','Image_rte','y'),(5,'Italic','Italic_rte','y'),(6,'Link','Link_rte','y'),(7,'Ordered List','Ordered_list_rte','y'),(8,'Underline','Underline_rte','y'),(9,'Unordered List','Unordered_list_rte','y'),(10,'View Source','View_source_rte','y');

/*Table structure for table `exp_rte_toolsets` */

DROP TABLE IF EXISTS `exp_rte_toolsets`;

CREATE TABLE `exp_rte_toolsets` (
  `toolset_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(10) DEFAULT '0',
  `name` varchar(100) DEFAULT NULL,
  `tools` text,
  `enabled` char(1) DEFAULT 'y',
  PRIMARY KEY (`toolset_id`),
  KEY `member_id` (`member_id`),
  KEY `enabled` (`enabled`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `exp_rte_toolsets` */

insert  into `exp_rte_toolsets`(`toolset_id`,`member_id`,`name`,`tools`,`enabled`) values (1,0,'Default','3|2|5|1|9|7|6|4|10','y');

/*Table structure for table `exp_search` */

DROP TABLE IF EXISTS `exp_search`;

CREATE TABLE `exp_search` (
  `search_id` varchar(32) NOT NULL,
  `site_id` int(4) NOT NULL DEFAULT '1',
  `search_date` int(10) NOT NULL,
  `keywords` varchar(60) NOT NULL,
  `member_id` int(10) unsigned NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `total_results` int(6) NOT NULL,
  `per_page` tinyint(3) unsigned NOT NULL,
  `query` mediumtext,
  `custom_fields` mediumtext,
  `result_page` varchar(70) NOT NULL,
  PRIMARY KEY (`search_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `exp_search` */

/*Table structure for table `exp_search_log` */

DROP TABLE IF EXISTS `exp_search_log`;

CREATE TABLE `exp_search_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_id` int(10) unsigned NOT NULL,
  `screen_name` varchar(50) NOT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `search_date` int(10) NOT NULL,
  `search_type` varchar(32) NOT NULL,
  `search_terms` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `exp_search_log` */

/*Table structure for table `exp_security_hashes` */

DROP TABLE IF EXISTS `exp_security_hashes`;

CREATE TABLE `exp_security_hashes` (
  `hash_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` int(10) unsigned NOT NULL,
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `hash` varchar(40) NOT NULL,
  PRIMARY KEY (`hash_id`),
  KEY `hash` (`hash`)
) ENGINE=InnoDB AUTO_INCREMENT=1677 DEFAULT CHARSET=utf8;

/*Data for the table `exp_security_hashes` */

insert  into `exp_security_hashes`(`hash_id`,`date`,`session_id`,`hash`) values (1576,1366399355,'96a3f69c26772ceadd293653c4896946b2ad14c4','0ca373517d424fe6bbf49c66be0b4453daf4f6ef'),(1577,1366399356,'96a3f69c26772ceadd293653c4896946b2ad14c4','0238df88025e872c3e4e71a421de61f578cc627d'),(1579,1366399406,'96a3f69c26772ceadd293653c4896946b2ad14c4','7f6c7b9c17c7526bfaf4a2c9426ce630aacdbc03'),(1580,1366399407,'96a3f69c26772ceadd293653c4896946b2ad14c4','7003507dd3e6af5dd0486fd66bdf46a25454dd34'),(1582,1366399558,'96a3f69c26772ceadd293653c4896946b2ad14c4','48ab7bea4df90fb1c71987a4691965c68b3b06ff'),(1584,1366400333,'96a3f69c26772ceadd293653c4896946b2ad14c4','d331a665cf8d920800f1d566f05801e2fbc2e96e'),(1585,1366400334,'96a3f69c26772ceadd293653c4896946b2ad14c4','751305112311dff8e28fc10e3f7fc3f61aa11427'),(1587,1366400380,'96a3f69c26772ceadd293653c4896946b2ad14c4','e235658cd6f7dc0625bdccb6593745a1f6d928d9'),(1589,1366400564,'96a3f69c26772ceadd293653c4896946b2ad14c4','169e6dd1181ee4f149c6f3771dd74c9cb4e1bc35'),(1591,1366400608,'96a3f69c26772ceadd293653c4896946b2ad14c4','06cb58208e7ce3dc974de64972094b10a596a21a'),(1593,1366401332,'96a3f69c26772ceadd293653c4896946b2ad14c4','72e6cfa71c03978949cdf66888ffa3596ef1b6f8'),(1594,1366401333,'96a3f69c26772ceadd293653c4896946b2ad14c4','087f31182e191b83701371b9cc2e5ee9c2015467'),(1596,1366401379,'96a3f69c26772ceadd293653c4896946b2ad14c4','4f5fce213a61d369db1ece18cce3e0a4274338f0'),(1598,1366401553,'96a3f69c26772ceadd293653c4896946b2ad14c4','285c5d27722d0ba4d0246bf03080a8db2a6d8579'),(1599,1366401554,'96a3f69c26772ceadd293653c4896946b2ad14c4','c01ef91ecdf75b8cccccd8817ee1a801193d42ba'),(1601,1366401620,'96a3f69c26772ceadd293653c4896946b2ad14c4','0847db0a9fba134aea379b1de4494074882c187d'),(1603,1366401774,'96a3f69c26772ceadd293653c4896946b2ad14c4','73ae7c552f3844f88552a8f5757c5a5e3a589763'),(1605,1366401800,'96a3f69c26772ceadd293653c4896946b2ad14c4','df6622a9aba220cb00d5332a65d9b9ba071481be'),(1606,1366401801,'96a3f69c26772ceadd293653c4896946b2ad14c4','e3947d4d77dcac9669b1236f1373180cd4640f92'),(1608,1366401840,'96a3f69c26772ceadd293653c4896946b2ad14c4','f18f4c36a6455db536b7171dde168cb2d08d9596'),(1610,1366401920,'96a3f69c26772ceadd293653c4896946b2ad14c4','62c31f5ed17c94de0dd5649a0aea20dd0cc2ace0'),(1611,1366401921,'96a3f69c26772ceadd293653c4896946b2ad14c4','7b59c0decf8250761809e5ffd1d769885ecaa60a'),(1613,1366401979,'96a3f69c26772ceadd293653c4896946b2ad14c4','5ad83bd19a98eafda67bc011cca385cc432114b5'),(1614,1366401980,'96a3f69c26772ceadd293653c4896946b2ad14c4','8b8d91ab8481674045c2f26208317601932b5c2d'),(1616,1366402086,'96a3f69c26772ceadd293653c4896946b2ad14c4','a2cbb32c18e5e84cb7a035a9088b0fcbbe1fb2c8'),(1617,1366402087,'96a3f69c26772ceadd293653c4896946b2ad14c4','920f507e10aa94cf7ddea5ef11150e3d31ee3e33'),(1618,1366402218,'96a3f69c26772ceadd293653c4896946b2ad14c4','fd8b7f7133331f36065982197b40a052b5b36fbe'),(1619,1366402220,'96a3f69c26772ceadd293653c4896946b2ad14c4','ba12354a33c478403e7eefbbfb0076dfc9d942f1'),(1621,1366402236,'96a3f69c26772ceadd293653c4896946b2ad14c4','c8d4284a546826fd41ed687b253f26fec10348c7'),(1622,1366402241,'96a3f69c26772ceadd293653c4896946b2ad14c4','75e53ea19446d8916436e7808f8b734fac6489ba'),(1624,1366402347,'96a3f69c26772ceadd293653c4896946b2ad14c4','78f66f35fb0a5b2eca8cd5ad228ca39bd2ccc1ba'),(1625,1366402349,'96a3f69c26772ceadd293653c4896946b2ad14c4','a20d6d293c2e1540a7e4067a36e49af73fd89816'),(1627,1366402376,'96a3f69c26772ceadd293653c4896946b2ad14c4','fe6f3c4242aa316dbfb39785db1b090e7f13a8dd'),(1628,1366402378,'96a3f69c26772ceadd293653c4896946b2ad14c4','559f58a22e384ef94988f8b6fcb876396284dfbd'),(1630,1366402862,'96a3f69c26772ceadd293653c4896946b2ad14c4','ec1784ea7fc2a2390413e6d75057a064192c685d'),(1631,1366402863,'96a3f69c26772ceadd293653c4896946b2ad14c4','de044e85eb15150d48b84cf60397e44fad6d02ed'),(1633,1366403190,'96a3f69c26772ceadd293653c4896946b2ad14c4','87a674e3c319a870260116d3c9d24e7b597a04bc'),(1635,1366403409,'96a3f69c26772ceadd293653c4896946b2ad14c4','9db9cdfd4fbba9dd35a25623076efca88de763e8'),(1636,1366403411,'96a3f69c26772ceadd293653c4896946b2ad14c4','03a695de122acb29c778ad907a75efd51afc93e9'),(1637,1366403862,'96a3f69c26772ceadd293653c4896946b2ad14c4','40418ad7dcf067de45424a82a0d4baac28dbdd0c'),(1638,1366403864,'96a3f69c26772ceadd293653c4896946b2ad14c4','deca40233d88b5070743fe7a424ed4579196346f'),(1640,1366403875,'96a3f69c26772ceadd293653c4896946b2ad14c4','2ff215a860220d081f295a431f40e0a8812fa575'),(1642,1366403887,'96a3f69c26772ceadd293653c4896946b2ad14c4','754f157237450b943d50b06f3626c08a40d185e6'),(1644,1366403897,'96a3f69c26772ceadd293653c4896946b2ad14c4','4db6e8d48e9ef7c9b55d3e877520d14672be110f'),(1646,1366403913,'96a3f69c26772ceadd293653c4896946b2ad14c4','4f76a9ba2043f077616ad2858854730bc96c9906'),(1648,1366403923,'96a3f69c26772ceadd293653c4896946b2ad14c4','6b5f4e89b11ba5338e67cb6d67b1c89bddb56519'),(1650,1366403933,'96a3f69c26772ceadd293653c4896946b2ad14c4','d5bd2e714513f2e5afc3f4273709ff2291eb98c2'),(1652,1366403961,'96a3f69c26772ceadd293653c4896946b2ad14c4','ac248e902d55deef49ce99394a1abd0f9872256a'),(1653,1366403966,'96a3f69c26772ceadd293653c4896946b2ad14c4','325cbc823794a8a892849ab8e74dffd9f4cf1825'),(1655,1366404763,'96a3f69c26772ceadd293653c4896946b2ad14c4','0dc8490c0a6fafe0894a172a54b00f220171fab4'),(1656,1366404764,'96a3f69c26772ceadd293653c4896946b2ad14c4','b7d01e6525d5e7c93383c55b538a8ee9be1fd00e'),(1658,1366405991,'96a3f69c26772ceadd293653c4896946b2ad14c4','f3d4294fc91717d04c7f85961c541ca254931e74'),(1660,1366406095,'96a3f69c26772ceadd293653c4896946b2ad14c4','a04784674e1715acef7ccbeab787e4a45b99e1fa'),(1662,1366406386,'96a3f69c26772ceadd293653c4896946b2ad14c4','bd42253aad7eeebd6ab68a2c6a8c08dfe1655d73'),(1664,1366406527,'96a3f69c26772ceadd293653c4896946b2ad14c4','93598b27cb7f4ac9926b3776c522e5cd29842e56'),(1665,1366406528,'96a3f69c26772ceadd293653c4896946b2ad14c4','b6e1e23b14ce602a62c5beb4486f393cdaa53633'),(1666,1366406700,'96a3f69c26772ceadd293653c4896946b2ad14c4','afb2dd3af582eaf5a7673eb108e6d68b0adbd3fb'),(1667,1366406740,'96a3f69c26772ceadd293653c4896946b2ad14c4','021033d9f9ab9a8cab1ff89453a5c277c676a2b2'),(1668,1366406796,'96a3f69c26772ceadd293653c4896946b2ad14c4','e6355ceccd090d0fbd7eed2971a973f79af34b22'),(1669,1366406827,'96a3f69c26772ceadd293653c4896946b2ad14c4','0a897ac7aa1dc9caef2a90a78c9ba75298e9d57c'),(1670,1366407252,'96a3f69c26772ceadd293653c4896946b2ad14c4','158e688391d49ecfbcf9bdaa23f12efef55578e1'),(1671,1366407358,'96a3f69c26772ceadd293653c4896946b2ad14c4','a33ae78803a0bfb630f0955395f59cd9a71d40a7'),(1672,1366407502,'96a3f69c26772ceadd293653c4896946b2ad14c4','76fcb2a7f9974bd35cd45168eaf92944cb0ab08e'),(1673,1366407507,'96a3f69c26772ceadd293653c4896946b2ad14c4','328a2c27903bcff555da1a946439e7c69a8c2778'),(1674,1366407510,'96a3f69c26772ceadd293653c4896946b2ad14c4','48b389759d36784f2b4b4448f075ca9f140a0fb8'),(1675,1366407511,'96a3f69c26772ceadd293653c4896946b2ad14c4','97645fb17993b372cfbb44ad2fecaf5339f9c2a4'),(1676,1366407512,'96a3f69c26772ceadd293653c4896946b2ad14c4','5014c8d1e396746cf37f8b80d8cf88308289dbfc');

/*Table structure for table `exp_sessions` */

DROP TABLE IF EXISTS `exp_sessions`;

CREATE TABLE `exp_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `member_id` int(10) NOT NULL DEFAULT '0',
  `admin_sess` tinyint(1) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`session_id`),
  KEY `member_id` (`member_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `exp_sessions` */

insert  into `exp_sessions`(`session_id`,`member_id`,`admin_sess`,`ip_address`,`user_agent`,`last_activity`) values ('96a3f69c26772ceadd293653c4896946b2ad14c4',1,1,'::1','Mozilla/5.0 (Windows NT 6.2; WOW64; rv:20.0) Gecko/20100101 Firefox/20.0',1366407512);

/*Table structure for table `exp_simple_commerce_emails` */

DROP TABLE IF EXISTS `exp_simple_commerce_emails`;

CREATE TABLE `exp_simple_commerce_emails` (
  `email_id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `email_name` varchar(50) NOT NULL DEFAULT '',
  `email_subject` varchar(125) NOT NULL DEFAULT '',
  `email_body` text NOT NULL,
  PRIMARY KEY (`email_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `exp_simple_commerce_emails` */

/*Table structure for table `exp_simple_commerce_items` */

DROP TABLE IF EXISTS `exp_simple_commerce_items`;

CREATE TABLE `exp_simple_commerce_items` (
  `item_id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(8) unsigned NOT NULL,
  `item_enabled` char(1) NOT NULL DEFAULT 'y',
  `item_regular_price` decimal(7,2) NOT NULL DEFAULT '0.00',
  `item_sale_price` decimal(7,2) NOT NULL DEFAULT '0.00',
  `item_use_sale` char(1) NOT NULL DEFAULT 'n',
  `recurring` char(1) NOT NULL DEFAULT 'n',
  `subscription_frequency` int(10) unsigned DEFAULT NULL,
  `subscription_frequency_unit` varchar(10) DEFAULT NULL,
  `item_purchases` int(8) NOT NULL DEFAULT '0',
  `current_subscriptions` int(8) NOT NULL DEFAULT '0',
  `new_member_group` int(8) DEFAULT '0',
  `member_group_unsubscribe` int(8) DEFAULT '0',
  `admin_email_address` varchar(200) DEFAULT NULL,
  `admin_email_template` int(5) DEFAULT '0',
  `customer_email_template` int(5) DEFAULT '0',
  `admin_email_template_unsubscribe` int(5) DEFAULT '0',
  `customer_email_template_unsubscribe` int(5) DEFAULT '0',
  PRIMARY KEY (`item_id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `exp_simple_commerce_items` */

/*Table structure for table `exp_simple_commerce_purchases` */

DROP TABLE IF EXISTS `exp_simple_commerce_purchases`;

CREATE TABLE `exp_simple_commerce_purchases` (
  `purchase_id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `txn_id` varchar(20) NOT NULL DEFAULT '',
  `member_id` varchar(50) NOT NULL DEFAULT '',
  `paypal_subscriber_id` varchar(100) DEFAULT NULL,
  `item_id` int(8) unsigned NOT NULL DEFAULT '0',
  `purchase_date` int(12) unsigned NOT NULL DEFAULT '0',
  `item_cost` decimal(10,2) NOT NULL DEFAULT '0.00',
  `paypal_details` text,
  `subscription_end_date` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`purchase_id`),
  KEY `item_id` (`item_id`),
  KEY `member_id` (`member_id`),
  KEY `txn_id` (`txn_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `exp_simple_commerce_purchases` */

/*Table structure for table `exp_sites` */

DROP TABLE IF EXISTS `exp_sites`;

CREATE TABLE `exp_sites` (
  `site_id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `site_label` varchar(100) NOT NULL DEFAULT '',
  `site_name` varchar(50) NOT NULL DEFAULT '',
  `site_description` text,
  `site_system_preferences` mediumtext NOT NULL,
  `site_mailinglist_preferences` text NOT NULL,
  `site_member_preferences` text NOT NULL,
  `site_template_preferences` text NOT NULL,
  `site_channel_preferences` text NOT NULL,
  `site_bootstrap_checksums` text NOT NULL,
  `site_pages` text NOT NULL,
  PRIMARY KEY (`site_id`),
  KEY `site_name` (`site_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `exp_sites` */

insert  into `exp_sites`(`site_id`,`site_label`,`site_name`,`site_description`,`site_system_preferences`,`site_mailinglist_preferences`,`site_member_preferences`,`site_template_preferences`,`site_channel_preferences`,`site_bootstrap_checksums`,`site_pages`) values (1,'The Monuments Men','default_site',NULL,'YTo5Mjp7czoxMDoic2l0ZV9pbmRleCI7czo5OiJpbmRleC5waHAiO3M6ODoic2l0ZV91cmwiO3M6MjQ6Imh0dHA6Ly9sb2NhbGhvc3QvbW9ubWVuLyI7czoxNjoidGhlbWVfZm9sZGVyX3VybCI7czozMToiaHR0cDovL2xvY2FsaG9zdC9tb25tZW4vdGhlbWVzLyI7czoxNToid2VibWFzdGVyX2VtYWlsIjtzOjE1OiJmcmFua0BtaWxuZS5jb20iO3M6MTQ6IndlYm1hc3Rlcl9uYW1lIjtzOjA6IiI7czoyMDoiY2hhbm5lbF9ub21lbmNsYXR1cmUiO3M6NzoiY2hhbm5lbCI7czoxMDoibWF4X2NhY2hlcyI7czozOiIxNTAiO3M6MTE6ImNhcHRjaGFfdXJsIjtzOjQwOiJodHRwOi8vbG9jYWxob3N0L21vbm1lbi9pbWFnZXMvY2FwdGNoYXMvIjtzOjEyOiJjYXB0Y2hhX3BhdGgiO3M6Mzk6IkM6XHhhbXBwXGh0ZG9jc1xtb25tZW5caW1hZ2VzXGNhcHRjaGFzXCI7czoxMjoiY2FwdGNoYV9mb250IjtzOjE6InkiO3M6MTI6ImNhcHRjaGFfcmFuZCI7czoxOiJ5IjtzOjIzOiJjYXB0Y2hhX3JlcXVpcmVfbWVtYmVycyI7czoxOiJuIjtzOjE3OiJlbmFibGVfZGJfY2FjaGluZyI7czoxOiJuIjtzOjE4OiJlbmFibGVfc3FsX2NhY2hpbmciO3M6MToibiI7czoxODoiZm9yY2VfcXVlcnlfc3RyaW5nIjtzOjE6Im4iO3M6MTM6InNob3dfcHJvZmlsZXIiO3M6MToibiI7czoxODoidGVtcGxhdGVfZGVidWdnaW5nIjtzOjE6Im4iO3M6MTU6ImluY2x1ZGVfc2Vjb25kcyI7czoxOiJuIjtzOjEzOiJjb29raWVfZG9tYWluIjtzOjA6IiI7czoxMToiY29va2llX3BhdGgiO3M6MDoiIjtzOjE3OiJ1c2VyX3Nlc3Npb25fdHlwZSI7czoxOiJjIjtzOjE4OiJhZG1pbl9zZXNzaW9uX3R5cGUiO3M6MjoiY3MiO3M6MjE6ImFsbG93X3VzZXJuYW1lX2NoYW5nZSI7czoxOiJ5IjtzOjE4OiJhbGxvd19tdWx0aV9sb2dpbnMiO3M6MToieSI7czoxNjoicGFzc3dvcmRfbG9ja291dCI7czoxOiJ5IjtzOjI1OiJwYXNzd29yZF9sb2Nrb3V0X2ludGVydmFsIjtzOjE6IjEiO3M6MjA6InJlcXVpcmVfaXBfZm9yX2xvZ2luIjtzOjE6InkiO3M6MjI6InJlcXVpcmVfaXBfZm9yX3Bvc3RpbmciO3M6MToieSI7czoyNDoicmVxdWlyZV9zZWN1cmVfcGFzc3dvcmRzIjtzOjE6Im4iO3M6MTk6ImFsbG93X2RpY3Rpb25hcnlfcHciO3M6MToieSI7czoyMzoibmFtZV9vZl9kaWN0aW9uYXJ5X2ZpbGUiO3M6MDoiIjtzOjE3OiJ4c3NfY2xlYW5fdXBsb2FkcyI7czoxOiJ5IjtzOjE1OiJyZWRpcmVjdF9tZXRob2QiO3M6NzoicmVmcmVzaCI7czo5OiJkZWZ0X2xhbmciO3M6NzoiZW5nbGlzaCI7czo4OiJ4bWxfbGFuZyI7czoyOiJlbiI7czoxMjoic2VuZF9oZWFkZXJzIjtzOjE6InkiO3M6MTE6Imd6aXBfb3V0cHV0IjtzOjE6Im4iO3M6MTM6ImxvZ19yZWZlcnJlcnMiO3M6MToibiI7czoxMzoibWF4X3JlZmVycmVycyI7czozOiI1MDAiO3M6MTE6InRpbWVfZm9ybWF0IjtzOjI6InVzIjtzOjE1OiJzZXJ2ZXJfdGltZXpvbmUiO3M6MzoiVU02IjtzOjEzOiJzZXJ2ZXJfb2Zmc2V0IjtzOjA6IiI7czoxNjoiZGF5bGlnaHRfc2F2aW5ncyI7czoxOiJ5IjtzOjIxOiJkZWZhdWx0X3NpdGVfdGltZXpvbmUiO3M6MzoiVU02IjtzOjE2OiJkZWZhdWx0X3NpdGVfZHN0IjtzOjE6InkiO3M6MTU6Imhvbm9yX2VudHJ5X2RzdCI7czoxOiJ5IjtzOjEzOiJtYWlsX3Byb3RvY29sIjtzOjQ6Im1haWwiO3M6MTE6InNtdHBfc2VydmVyIjtzOjA6IiI7czoxMzoic210cF91c2VybmFtZSI7czowOiIiO3M6MTM6InNtdHBfcGFzc3dvcmQiO3M6MDoiIjtzOjExOiJlbWFpbF9kZWJ1ZyI7czoxOiJuIjtzOjEzOiJlbWFpbF9jaGFyc2V0IjtzOjU6InV0Zi04IjtzOjE1OiJlbWFpbF9iYXRjaG1vZGUiO3M6MToibiI7czoxNjoiZW1haWxfYmF0Y2hfc2l6ZSI7czowOiIiO3M6MTE6Im1haWxfZm9ybWF0IjtzOjU6InBsYWluIjtzOjk6IndvcmRfd3JhcCI7czoxOiJ5IjtzOjIyOiJlbWFpbF9jb25zb2xlX3RpbWVsb2NrIjtzOjE6IjUiO3M6MjI6ImxvZ19lbWFpbF9jb25zb2xlX21zZ3MiO3M6MToieSI7czo4OiJjcF90aGVtZSI7czo3OiJkZWZhdWx0IjtzOjIxOiJlbWFpbF9tb2R1bGVfY2FwdGNoYXMiO3M6MToibiI7czoxNjoibG9nX3NlYXJjaF90ZXJtcyI7czoxOiJ5IjtzOjEyOiJzZWN1cmVfZm9ybXMiO3M6MToieSI7czoxOToiZGVueV9kdXBsaWNhdGVfZGF0YSI7czoxOiJ5IjtzOjI0OiJyZWRpcmVjdF9zdWJtaXR0ZWRfbGlua3MiO3M6MToibiI7czoxNjoiZW5hYmxlX2NlbnNvcmluZyI7czoxOiJuIjtzOjE0OiJjZW5zb3JlZF93b3JkcyI7czowOiIiO3M6MTg6ImNlbnNvcl9yZXBsYWNlbWVudCI7czowOiIiO3M6MTA6ImJhbm5lZF9pcHMiO3M6MDoiIjtzOjEzOiJiYW5uZWRfZW1haWxzIjtzOjA6IiI7czoxNjoiYmFubmVkX3VzZXJuYW1lcyI7czowOiIiO3M6MTk6ImJhbm5lZF9zY3JlZW5fbmFtZXMiO3M6MDoiIjtzOjEwOiJiYW5fYWN0aW9uIjtzOjg6InJlc3RyaWN0IjtzOjExOiJiYW5fbWVzc2FnZSI7czozNDoiVGhpcyBzaXRlIGlzIGN1cnJlbnRseSB1bmF2YWlsYWJsZSI7czoxNToiYmFuX2Rlc3RpbmF0aW9uIjtzOjIxOiJodHRwOi8vd3d3LnlhaG9vLmNvbS8iO3M6MTY6ImVuYWJsZV9lbW90aWNvbnMiO3M6MToieSI7czoxMjoiZW1vdGljb25fdXJsIjtzOjM5OiJodHRwOi8vbG9jYWxob3N0L21vbm1lbi9pbWFnZXMvc21pbGV5cy8iO3M6MTk6InJlY291bnRfYmF0Y2hfdG90YWwiO3M6NDoiMTAwMCI7czoxNzoibmV3X3ZlcnNpb25fY2hlY2siO3M6MToieSI7czoxNzoiZW5hYmxlX3Rocm90dGxpbmciO3M6MToibiI7czoxNzoiYmFuaXNoX21hc2tlZF9pcHMiO3M6MToieSI7czoxNDoibWF4X3BhZ2VfbG9hZHMiO3M6MjoiMTAiO3M6MTM6InRpbWVfaW50ZXJ2YWwiO3M6MToiOCI7czoxMjoibG9ja291dF90aW1lIjtzOjI6IjMwIjtzOjE1OiJiYW5pc2htZW50X3R5cGUiO3M6NzoibWVzc2FnZSI7czoxNDoiYmFuaXNobWVudF91cmwiO3M6MDoiIjtzOjE4OiJiYW5pc2htZW50X21lc3NhZ2UiO3M6NTA6IllvdSBoYXZlIGV4Y2VlZGVkIHRoZSBhbGxvd2VkIHBhZ2UgbG9hZCBmcmVxdWVuY3kuIjtzOjE3OiJlbmFibGVfc2VhcmNoX2xvZyI7czoxOiJ5IjtzOjE5OiJtYXhfbG9nZ2VkX3NlYXJjaGVzIjtzOjM6IjUwMCI7czoxNzoidGhlbWVfZm9sZGVyX3BhdGgiO3M6MzA6IkM6XHhhbXBwXGh0ZG9jc1xtb25tZW5cdGhlbWVzXCI7czoxMDoiaXNfc2l0ZV9vbiI7czoxOiJ5IjtzOjExOiJydGVfZW5hYmxlZCI7czoxOiJ5IjtzOjIyOiJydGVfZGVmYXVsdF90b29sc2V0X2lkIjtzOjE6IjEiO30=','YTozOntzOjE5OiJtYWlsaW5nbGlzdF9lbmFibGVkIjtzOjE6InkiO3M6MTg6Im1haWxpbmdsaXN0X25vdGlmeSI7czoxOiJuIjtzOjI1OiJtYWlsaW5nbGlzdF9ub3RpZnlfZW1haWxzIjtzOjA6IiI7fQ==','YTo0NDp7czoxMDoidW5fbWluX2xlbiI7czoxOiI0IjtzOjEwOiJwd19taW5fbGVuIjtzOjE6IjUiO3M6MjU6ImFsbG93X21lbWJlcl9yZWdpc3RyYXRpb24iO3M6MToibiI7czoyNToiYWxsb3dfbWVtYmVyX2xvY2FsaXphdGlvbiI7czoxOiJ5IjtzOjE4OiJyZXFfbWJyX2FjdGl2YXRpb24iO3M6NToiZW1haWwiO3M6MjM6Im5ld19tZW1iZXJfbm90aWZpY2F0aW9uIjtzOjE6Im4iO3M6MjM6Im1icl9ub3RpZmljYXRpb25fZW1haWxzIjtzOjA6IiI7czoyNDoicmVxdWlyZV90ZXJtc19vZl9zZXJ2aWNlIjtzOjE6InkiO3M6MjI6InVzZV9tZW1iZXJzaGlwX2NhcHRjaGEiO3M6MToibiI7czoyMDoiZGVmYXVsdF9tZW1iZXJfZ3JvdXAiO3M6MToiNSI7czoxNToicHJvZmlsZV90cmlnZ2VyIjtzOjY6Im1lbWJlciI7czoxMjoibWVtYmVyX3RoZW1lIjtzOjc6ImRlZmF1bHQiO3M6MTQ6ImVuYWJsZV9hdmF0YXJzIjtzOjE6InkiO3M6MjA6ImFsbG93X2F2YXRhcl91cGxvYWRzIjtzOjE6Im4iO3M6MTA6ImF2YXRhcl91cmwiO3M6Mzk6Imh0dHA6Ly9sb2NhbGhvc3QvbW9ubWVuL2ltYWdlcy9hdmF0YXJzLyI7czoxMToiYXZhdGFyX3BhdGgiO3M6Mzg6IkM6XHhhbXBwXGh0ZG9jc1xtb25tZW5caW1hZ2VzXGF2YXRhcnNcIjtzOjE2OiJhdmF0YXJfbWF4X3dpZHRoIjtzOjM6IjEwMCI7czoxNzoiYXZhdGFyX21heF9oZWlnaHQiO3M6MzoiMTAwIjtzOjEzOiJhdmF0YXJfbWF4X2tiIjtzOjI6IjUwIjtzOjEzOiJlbmFibGVfcGhvdG9zIjtzOjE6Im4iO3M6OToicGhvdG9fdXJsIjtzOjQ1OiJodHRwOi8vbG9jYWxob3N0L21vbm1lbi9pbWFnZXMvbWVtYmVyX3Bob3Rvcy8iO3M6MTA6InBob3RvX3BhdGgiO3M6NDQ6IkM6XHhhbXBwXGh0ZG9jc1xtb25tZW5caW1hZ2VzXG1lbWJlcl9waG90b3NcIjtzOjE1OiJwaG90b19tYXhfd2lkdGgiO3M6MzoiMTAwIjtzOjE2OiJwaG90b19tYXhfaGVpZ2h0IjtzOjM6IjEwMCI7czoxMjoicGhvdG9fbWF4X2tiIjtzOjI6IjUwIjtzOjE2OiJhbGxvd19zaWduYXR1cmVzIjtzOjE6InkiO3M6MTM6InNpZ19tYXhsZW5ndGgiO3M6MzoiNTAwIjtzOjIxOiJzaWdfYWxsb3dfaW1nX2hvdGxpbmsiO3M6MToibiI7czoyMDoic2lnX2FsbG93X2ltZ191cGxvYWQiO3M6MToibiI7czoxMToic2lnX2ltZ191cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3QvbW9ubWVuL2ltYWdlcy9zaWduYXR1cmVfYXR0YWNobWVudHMvIjtzOjEyOiJzaWdfaW1nX3BhdGgiO3M6NTI6IkM6XHhhbXBwXGh0ZG9jc1xtb25tZW5caW1hZ2VzXHNpZ25hdHVyZV9hdHRhY2htZW50c1wiO3M6MTc6InNpZ19pbWdfbWF4X3dpZHRoIjtzOjM6IjQ4MCI7czoxODoic2lnX2ltZ19tYXhfaGVpZ2h0IjtzOjI6IjgwIjtzOjE0OiJzaWdfaW1nX21heF9rYiI7czoyOiIzMCI7czoxOToicHJ2X21zZ191cGxvYWRfcGF0aCI7czo0NToiQzpceGFtcHBcaHRkb2NzXG1vbm1lblxpbWFnZXNccG1fYXR0YWNobWVudHNcIjtzOjIzOiJwcnZfbXNnX21heF9hdHRhY2htZW50cyI7czoxOiIzIjtzOjIyOiJwcnZfbXNnX2F0dGFjaF9tYXhzaXplIjtzOjM6IjI1MCI7czoyMDoicHJ2X21zZ19hdHRhY2hfdG90YWwiO3M6MzoiMTAwIjtzOjE5OiJwcnZfbXNnX2h0bWxfZm9ybWF0IjtzOjQ6InNhZmUiO3M6MTg6InBydl9tc2dfYXV0b19saW5rcyI7czoxOiJ5IjtzOjE3OiJwcnZfbXNnX21heF9jaGFycyI7czo0OiI2MDAwIjtzOjE5OiJtZW1iZXJsaXN0X29yZGVyX2J5IjtzOjExOiJ0b3RhbF9wb3N0cyI7czoyMToibWVtYmVybGlzdF9zb3J0X29yZGVyIjtzOjQ6ImRlc2MiO3M6MjA6Im1lbWJlcmxpc3Rfcm93X2xpbWl0IjtzOjI6IjIwIjt9','YTo2OntzOjExOiJzdHJpY3RfdXJscyI7czoxOiJ5IjtzOjg6InNpdGVfNDA0IjtzOjA6IiI7czoxOToic2F2ZV90bXBsX3JldmlzaW9ucyI7czoxOiJ5IjtzOjE4OiJtYXhfdG1wbF9yZXZpc2lvbnMiO3M6MToiNSI7czoxNToic2F2ZV90bXBsX2ZpbGVzIjtzOjE6Im4iO3M6MTg6InRtcGxfZmlsZV9iYXNlcGF0aCI7czoxOiIvIjt9','YTo5OntzOjIxOiJpbWFnZV9yZXNpemVfcHJvdG9jb2wiO3M6MzoiZ2QyIjtzOjE4OiJpbWFnZV9saWJyYXJ5X3BhdGgiO3M6MDoiIjtzOjE2OiJ0aHVtYm5haWxfcHJlZml4IjtzOjU6InRodW1iIjtzOjE0OiJ3b3JkX3NlcGFyYXRvciI7czo0OiJkYXNoIjtzOjE3OiJ1c2VfY2F0ZWdvcnlfbmFtZSI7czoxOiJuIjtzOjIyOiJyZXNlcnZlZF9jYXRlZ29yeV93b3JkIjtzOjg6ImNhdGVnb3J5IjtzOjIzOiJhdXRvX2NvbnZlcnRfaGlnaF9hc2NpaSI7czoxOiJuIjtzOjIyOiJuZXdfcG9zdHNfY2xlYXJfY2FjaGVzIjtzOjE6InkiO3M6MjM6ImF1dG9fYXNzaWduX2NhdF9wYXJlbnRzIjtzOjE6InkiO30=','YToxOntzOjMyOiJDOlx4YW1wcFxodGRvY3NcbW9ubWVuXGluZGV4LnBocCI7czozMjoiZDMxNGUzZDhjYjBiN2VjNmQ5NzRmZDYwYzE0ZWQ4YjMiO30=','YToxOntpOjE7YTozOntzOjQ6InVyaXMiO2E6MTp7aTo0O3M6MjY6Ii9ib29rcy1tb3ZpZXMvc2F2aW5nLWl0YWx5Ijt9czo5OiJ0ZW1wbGF0ZXMiO2E6MTp7aTo0O3M6MjoiMTAiO31zOjM6InVybCI7czozNDoiaHR0cDovL2xvY2FsaG9zdC9tb25tZW4vaW5kZXgucGhwLyI7fX0=');

/*Table structure for table `exp_snippets` */

DROP TABLE IF EXISTS `exp_snippets`;

CREATE TABLE `exp_snippets` (
  `snippet_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) NOT NULL,
  `snippet_name` varchar(75) NOT NULL,
  `snippet_contents` text,
  PRIMARY KEY (`snippet_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `exp_snippets` */

insert  into `exp_snippets`(`snippet_id`,`site_id`,`snippet_name`,`snippet_contents`) values (1,1,'global-css','<!-- CSS  and google fonts -->\n    <link href=\"{path=global-embeds/main-css}\" rel=\"stylesheet\" type=\"text/css\">\n   <link href=\'http://fonts.googleapis.com/css?family=Montserrat\' rel=\'stylesheet\' type=\'text/css\'>\n\n<!-- typekit -->\n<script type=\"text/javascript\" src=\"//use.typekit.net/xzx4gea.js\"></script>\n<script type=\"text/javascript\">try{Typekit.load();}catch(e){}</script>'),(2,1,'main_site_root','http://localhost/monmen/');

/*Table structure for table `exp_specialty_templates` */

DROP TABLE IF EXISTS `exp_specialty_templates`;

CREATE TABLE `exp_specialty_templates` (
  `template_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `enable_template` char(1) NOT NULL DEFAULT 'y',
  `template_name` varchar(50) NOT NULL,
  `data_title` varchar(80) NOT NULL,
  `template_data` text NOT NULL,
  PRIMARY KEY (`template_id`),
  KEY `template_name` (`template_name`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `exp_specialty_templates` */

insert  into `exp_specialty_templates`(`template_id`,`site_id`,`enable_template`,`template_name`,`data_title`,`template_data`) values (1,1,'y','offline_template','','<html>\n<head>\n\n<title>System Offline</title>\n\n<style type=\"text/css\">\n\nbody { \nbackground-color:	#ffffff; \nmargin:				50px; \nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size:			11px;\ncolor:				#000;\nbackground-color:	#fff;\n}\n\na {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-weight:		bold;\nletter-spacing:		.09em;\ntext-decoration:	none;\ncolor:			  #330099;\nbackground-color:	transparent;\n}\n  \na:visited {\ncolor:				#330099;\nbackground-color:	transparent;\n}\n\na:hover {\ncolor:				#000;\ntext-decoration:	underline;\nbackground-color:	transparent;\n}\n\n#content  {\nborder:				#999999 1px solid;\npadding:			22px 25px 14px 25px;\n}\n\nh1 {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-weight:		bold;\nfont-size:			14px;\ncolor:				#000;\nmargin-top: 		0;\nmargin-bottom:		14px;\n}\n\np {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size: 			12px;\nfont-weight: 		normal;\nmargin-top: 		12px;\nmargin-bottom: 		14px;\ncolor: 				#000;\n}\n</style>\n\n</head>\n\n<body>\n\n<div id=\"content\">\n\n<h1>System Offline</h1>\n\n<p>This site is currently offline</p>\n\n</div>\n\n</body>\n\n</html>'),(2,1,'y','message_template','','<html>\n<head>\n\n<title>{title}</title>\n\n<meta http-equiv=\'content-type\' content=\'text/html; charset={charset}\' />\n\n{meta_refresh}\n\n<style type=\"text/css\">\n\nbody { \nbackground-color:	#ffffff; \nmargin:				50px; \nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size:			11px;\ncolor:				#000;\nbackground-color:	#fff;\n}\n\na {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nletter-spacing:		.09em;\ntext-decoration:	none;\ncolor:			  #330099;\nbackground-color:	transparent;\n}\n  \na:visited {\ncolor:				#330099;\nbackground-color:	transparent;\n}\n\na:active {\ncolor:				#ccc;\nbackground-color:	transparent;\n}\n\na:hover {\ncolor:				#000;\ntext-decoration:	underline;\nbackground-color:	transparent;\n}\n\n#content  {\nborder:				#000 1px solid;\nbackground-color: 	#DEDFE3;\npadding:			22px 25px 14px 25px;\n}\n\nh1 {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-weight:		bold;\nfont-size:			14px;\ncolor:				#000;\nmargin-top: 		0;\nmargin-bottom:		14px;\n}\n\np {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size: 			12px;\nfont-weight: 		normal;\nmargin-top: 		12px;\nmargin-bottom: 		14px;\ncolor: 				#000;\n}\n\nul {\nmargin-bottom: 		16px;\n}\n\nli {\nlist-style:			square;\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size: 			12px;\nfont-weight: 		normal;\nmargin-top: 		8px;\nmargin-bottom: 		8px;\ncolor: 				#000;\n}\n\n</style>\n\n</head>\n\n<body>\n\n<div id=\"content\">\n\n<h1>{heading}</h1>\n\n{content}\n\n<p>{link}</p>\n\n</div>\n\n</body>\n\n</html>'),(3,1,'y','admin_notify_reg','Notification of new member registration','New member registration site: {site_name}\n\nScreen name: {name}\nUser name: {username}\nEmail: {email}\n\nYour control panel URL: {control_panel_url}'),(4,1,'y','admin_notify_entry','A new channel entry has been posted','A new entry has been posted in the following channel:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nPosted by: {name}\nEmail: {email}\n\nTo read the entry please visit: \n{entry_url}\n'),(5,1,'y','admin_notify_mailinglist','Someone has subscribed to your mailing list','A new mailing list subscription has been accepted.\n\nEmail Address: {email}\nMailing List: {mailing_list}'),(6,1,'y','admin_notify_comment','You have just received a comment','You have just received a comment for the following channel:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nLocated at: \n{comment_url}\n\nPosted by: {name}\nEmail: {email}\nURL: {url}\nLocation: {location}\n\n{comment}'),(7,1,'y','mbr_activation_instructions','Enclosed is your activation code','Thank you for your new member registration.\n\nTo activate your new account, please visit the following URL:\n\n{unwrap}{activation_url}{/unwrap}\n\nThank You!\n\n{site_name}\n\n{site_url}'),(8,1,'y','forgot_password_instructions','Login information','{name},\n\nTo reset your password, please go to the following page:\n\n{reset_url}\n\nYour password will be automatically reset, and a new password will be emailed to you.\n\nIf you do not wish to reset your password, ignore this message. It will expire in 24 hours.\n\n{site_name}\n{site_url}'),(9,1,'y','reset_password_notification','New Login Information','{name},\n\nHere is your new login information:\n\nUsername: {username}\nPassword: {password}\n\n{site_name}\n{site_url}'),(10,1,'y','validated_member_notify','Your membership account has been activated','{name},\n\nYour membership account has been activated and is ready for use.\n\nThank You!\n\n{site_name}\n{site_url}'),(11,1,'y','decline_member_validation','Your membership account has been declined','{name},\n\nWe\'re sorry but our staff has decided not to validate your membership.\n\n{site_name}\n{site_url}'),(12,1,'y','mailinglist_activation_instructions','Email Confirmation','Thank you for joining the \"{mailing_list}\" mailing list!\n\nPlease click the link below to confirm your email.\n\nIf you do not want to be added to our list, ignore this email.\n\n{unwrap}{activation_url}{/unwrap}\n\nThank You!\n\n{site_name}'),(13,1,'y','comment_notification','Someone just responded to your comment','{name_of_commenter} just responded to the entry you subscribed to at:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nYou can see the comment at the following URL:\n{comment_url}\n\n{comment}\n\nTo stop receiving notifications for this comment, click here:\n{notification_removal_url}'),(14,1,'y','comments_opened_notification','New comments have been added','Responses have been added to the entry you subscribed to at:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nYou can see the comments at the following URL:\n{comment_url}\n\n{comments}\n{comment} \n{/comments}\n\nTo stop receiving notifications for this entry, click here:\n{notification_removal_url}'),(15,1,'y','private_message_notification','Someone has sent you a Private Message','\n{recipient_name},\n\n{sender_name} has just sent you a Private Message titled ‘{message_subject}’.\n\nYou can see the Private Message by logging in and viewing your inbox at:\n{site_url}\n\nContent:\n\n{message_content}\n\nTo stop receiving notifications of Private Messages, turn the option off in your Email Settings.\n\n{site_name}\n{site_url}'),(16,1,'y','pm_inbox_full','Your private message mailbox is full','{recipient_name},\n\n{sender_name} has just attempted to send you a Private Message,\nbut your inbox is full, exceeding the maximum of {pm_storage_limit}.\n\nPlease log in and remove unwanted messages from your inbox at:\n{site_url}');

/*Table structure for table `exp_stats` */

DROP TABLE IF EXISTS `exp_stats`;

CREATE TABLE `exp_stats` (
  `stat_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `total_members` mediumint(7) NOT NULL DEFAULT '0',
  `recent_member_id` int(10) NOT NULL DEFAULT '0',
  `recent_member` varchar(50) NOT NULL,
  `total_entries` mediumint(8) NOT NULL DEFAULT '0',
  `total_forum_topics` mediumint(8) NOT NULL DEFAULT '0',
  `total_forum_posts` mediumint(8) NOT NULL DEFAULT '0',
  `total_comments` mediumint(8) NOT NULL DEFAULT '0',
  `last_entry_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_forum_post_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_comment_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_visitor_date` int(10) unsigned NOT NULL DEFAULT '0',
  `most_visitors` mediumint(7) NOT NULL DEFAULT '0',
  `most_visitor_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_cache_clear` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`stat_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `exp_stats` */

insert  into `exp_stats`(`stat_id`,`site_id`,`total_members`,`recent_member_id`,`recent_member`,`total_entries`,`total_forum_topics`,`total_forum_posts`,`total_comments`,`last_entry_date`,`last_forum_post_date`,`last_comment_date`,`last_visitor_date`,`most_visitors`,`most_visitor_date`,`last_cache_clear`) values (1,1,1,1,'Frank',4,0,0,0,1366318098,0,0,1366407490,12,1366229976,1366727106);

/*Table structure for table `exp_status_groups` */

DROP TABLE IF EXISTS `exp_status_groups`;

CREATE TABLE `exp_status_groups` (
  `group_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_name` varchar(50) NOT NULL,
  PRIMARY KEY (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `exp_status_groups` */

insert  into `exp_status_groups`(`group_id`,`site_id`,`group_name`) values (1,1,'Statuses');

/*Table structure for table `exp_status_no_access` */

DROP TABLE IF EXISTS `exp_status_no_access`;

CREATE TABLE `exp_status_no_access` (
  `status_id` int(6) unsigned NOT NULL,
  `member_group` smallint(4) unsigned NOT NULL,
  PRIMARY KEY (`status_id`,`member_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `exp_status_no_access` */

/*Table structure for table `exp_statuses` */

DROP TABLE IF EXISTS `exp_statuses`;

CREATE TABLE `exp_statuses` (
  `status_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(4) unsigned NOT NULL,
  `status` varchar(50) NOT NULL,
  `status_order` int(3) unsigned NOT NULL,
  `highlight` varchar(30) NOT NULL,
  PRIMARY KEY (`status_id`),
  KEY `group_id` (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `exp_statuses` */

insert  into `exp_statuses`(`status_id`,`site_id`,`group_id`,`status`,`status_order`,`highlight`) values (1,1,1,'open',1,'009933'),(2,1,1,'closed',2,'990000');

/*Table structure for table `exp_template_groups` */

DROP TABLE IF EXISTS `exp_template_groups`;

CREATE TABLE `exp_template_groups` (
  `group_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_name` varchar(50) NOT NULL,
  `group_order` int(3) unsigned NOT NULL,
  `is_site_default` char(1) NOT NULL DEFAULT 'n',
  PRIMARY KEY (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `exp_template_groups` */

insert  into `exp_template_groups`(`group_id`,`site_id`,`group_name`,`group_order`,`is_site_default`) values (1,1,'home',1,'y'),(2,1,'global-embeds',2,'n'),(3,1,'books-movies',3,'n');

/*Table structure for table `exp_template_member_groups` */

DROP TABLE IF EXISTS `exp_template_member_groups`;

CREATE TABLE `exp_template_member_groups` (
  `group_id` smallint(4) unsigned NOT NULL,
  `template_group_id` mediumint(5) unsigned NOT NULL,
  PRIMARY KEY (`group_id`,`template_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `exp_template_member_groups` */

/*Table structure for table `exp_template_no_access` */

DROP TABLE IF EXISTS `exp_template_no_access`;

CREATE TABLE `exp_template_no_access` (
  `template_id` int(6) unsigned NOT NULL,
  `member_group` smallint(4) unsigned NOT NULL,
  PRIMARY KEY (`template_id`,`member_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `exp_template_no_access` */

/*Table structure for table `exp_templates` */

DROP TABLE IF EXISTS `exp_templates`;

CREATE TABLE `exp_templates` (
  `template_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(6) unsigned NOT NULL,
  `template_name` varchar(50) NOT NULL,
  `save_template_file` char(1) NOT NULL DEFAULT 'n',
  `template_type` varchar(16) NOT NULL DEFAULT 'webpage',
  `template_data` mediumtext,
  `template_notes` text,
  `edit_date` int(10) NOT NULL DEFAULT '0',
  `last_author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cache` char(1) NOT NULL DEFAULT 'n',
  `refresh` int(6) unsigned NOT NULL DEFAULT '0',
  `no_auth_bounce` varchar(50) NOT NULL DEFAULT '',
  `enable_http_auth` char(1) NOT NULL DEFAULT 'n',
  `allow_php` char(1) NOT NULL DEFAULT 'n',
  `php_parse_location` char(1) NOT NULL DEFAULT 'o',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`template_id`),
  KEY `group_id` (`group_id`),
  KEY `template_name` (`template_name`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `exp_templates` */

insert  into `exp_templates`(`template_id`,`site_id`,`group_id`,`template_name`,`save_template_file`,`template_type`,`template_data`,`template_notes`,`edit_date`,`last_author_id`,`cache`,`refresh`,`no_auth_bounce`,`enable_http_auth`,`allow_php`,`php_parse_location`,`hits`) values (1,1,1,'index','n','webpage','{html-head}\n{global-css}\n <!-- SlidesJS Required: These styles are required if you\'d like a responsive slideshow -->\n  <style>\n    #slides {\n      display: none\n    }\n\n    .container {\n      margin: 0 auto\n	  width: 1045px\n    }\n	.slidesjs-navigation{\n	display:none !important;\n	}\n  \n  </style>\n  <!-- SlidesJS Required: -->\n{html-head-end}\n\n<body>\n\n	{embed=\'global-embeds/main-nav\'}\n<div id=\"wrapper\">\n	<br clear=\"both\">\n	<div id=\"homecell\">\n		<div id=\"hero1\">\n			<div class=\"container\">\n    <div id=\"slides\">\n      <img src=\"{main_site_root}images/home/heroimage0.png\" class=\"homeslide\" usemap=\"#heroimage0\">\n      <img src=\"{main_site_root}images/home/heroimage1.png\" class=\"homeslide\" usemap=\"#heroimage1\">\n      <img src=\"{main_site_root}images/home/heroimage1.png\" class=\"homeslide\" usemap=\"#heroimage1\">\n      <img src=\"{main_site_root}images/home/heroimage1.png\" class=\"homeslide\" usemap=\"#heroimage1\">\n	</div>\n	<map name=\"heroimage0\">\n		  <area shape=\"rect\" alt=\"desc\" title=\"\" coords=\"22,46,1159,395\" href=\"\" target=\"\" />\n		  <area shape=\"rect\" coords=\"766,435,1057,474\" alt=\"order the book\" href=\"\">\n		  <area shape=\"rect\" coords=\"890,482,916,504\" alt=\"facebook\" href=\"\">\n		  <area shape=\"rect\" coords=\"919,493,935,508\" alt=\"twitter\" href=\"\">\n		  <area shape=\"rect\" coords=\"940,492,955,508\" alt=\"google+\" href=\"\">\n		  <area shape=\"rect\" coords=\"959,492,975,508\" alt=\"youtube\" href=\"\">\n		</map>\n		<map name=\"heroimage1\">\n		  <area shape=\"rect\" alt=\"desc\" title=\"\" coords=\"22,46,1159,395\" href=\"\" target=\"\" />\n		  <area shape=\"rect\" coords=\"766,435,1057,474\" alt=\"order the book\" href=\"\">\n		  <area shape=\"rect\" coords=\"890,482,916,504\" alt=\"facebook\" href=\"\">\n		  <area shape=\"rect\" coords=\"919,493,935,508\" alt=\"twitter\" href=\"\">\n		  <area shape=\"rect\" coords=\"940,492,955,508\" alt=\"google+\" href=\"\">\n		  <area shape=\"rect\" coords=\"959,492,975,508\" alt=\"youtube\" href=\"\">\n		</map>\n  </div>\n		</div>\n	</div>\n	<div id=\"homedyn\">\n		<div id=\"homeblogpreviews\">\n			<h1>Latest news, press &amp; blog posts</h1>\n			<?PHP\n \n	/******************************************************************************************************************\n	   RSS PARSING FUNCTION\n	******************************************************************************************************************/\n \n	//FUNCTION TO PARSE RSS IN PHP 4 OR PHP 4\n	function parseRSS($url) { \n \n	//PARSE RSS FEED\n        $feedeed = implode(\'\', file($url));\n        $parser = xml_parser_create();\n        xml_parse_into_struct($parser, $feedeed, $valueals, $index);\n        xml_parser_free($parser);\n \n	//CONSTRUCT ARRAY\n        foreach($valueals as $keyey => $valueal){\n            if($valueal[\'type\'] != \'cdata\') {\n                $item[$keyey] = $valueal;\n			}\n        }\n \n        $i = 0;\n\n        foreach($item as $key => $value){\n\n            if($value[\'type\'] == \'open\') {\n \n                $i++;\n                $itemame[$i] = $value[\'tag\'];\n \n            } elseif($value[\'type\'] == \'close\') {\n \n                $feed = $values[$i];\n                $item = $itemame[$i];\n                $i--;\n \n                if(count($values[$i])>1){\n                    $values[$i][$item][] = $feed;\n                } else {\n                    $values[$i][$item] = $feed;\n                }\n \n            } else {\n                $values[$i][$value[\'tag\']] = $value[\'value\'];  \n            }\n        }\n \n	//RETURN ARRAY VALUES\n        return $values[0];\n		//print_R($values);\n	} \n \n	\n	\n \n	//PARSE THE RSS FEED INTO ARRAY\n	$xml = parseRSS(\"http://www.monumentsmen.com/blog/feed/\");\n	$content = ($xml[\'RSS\'][\'CHANNEL\'][\'ITEM\'][0][\'CONTENT:ENCODED\']);\n	preg_match_all(\'/<img[^>]+>/i\',$content, $result); \n	echo \"<div id=\'homeblog1\' class=\'homeblogs\'><div class=\'homeblogimg\'>\";\n	echo $result[0][0] . \"</div><br clear=\'both\'>\";\n	echo \"<h3>\" . ($xml[\'RSS\'][\'CHANNEL\'][\'ITEM\'][0][\'TITLE\']) . \"</h3>\";\n	echo \"<p>\" . ($xml[\'RSS\'][\'CHANNEL\'][\'ITEM\'][0][\'PUBDATE\']) . \"</p>\";\n	echo \"<a href=\'\" . ($xml[\'RSS\'][\'CHANNEL\'][\'ITEM\'][0][\'LINK\']) .  \"\'>Read Blog Post</a>\";\n	echo \"</div>\";\n	echo \"<div id=\'homeblog2\' class=\'homeblogs\'><div class=\'homeblogimg\'>\";\n	$content = ($xml[\'RSS\'][\'CHANNEL\'][\'ITEM\'][1][\'CONTENT:ENCODED\']);\n	preg_match_all(\'/<img[^>]+>/i\',$content, $result); \n	echo $result[0][0] . \"</div><br clear=\'both\'>\";\n	echo \"<h3>\" . ($xml[\'RSS\'][\'CHANNEL\'][\'ITEM\'][1][\'TITLE\']) . \"</h3>\";\n	echo \"<p>\" . ($xml[\'RSS\'][\'CHANNEL\'][\'ITEM\'][1][\'PUBDATE\']) . \"</p>\";\n	echo \"<a href=\'\" . ($xml[\'RSS\'][\'CHANNEL\'][\'ITEM\'][1][\'LINK\']) .  \"\'>Read Blog Post</a>\";\n	echo \"</div>\";\n	\n\n	\n \n?>\n			\n			\n		</div>\n		<div id=\"homeevents\">\n			<h1>Upcoming Events</h1>\n			<ul>\n			{exp:channel:entries channel=\"upcoming_events\" limit=\"4\"}\n				<li>\n					<h3>{event_title}</h3>\n					<p>{event_location}</p>\n					<p>{event_date}</p>\n				</li>\n			{/exp:channel:entries}\n			</ul>\n		</div>\n	</div>\n	<br clear=\"both\">\n	<div id=\"homecontent\">\n	  <div id=\"home-static-image\">\n	  </div>\n	  <div id=home-static-text>\n	  <h2>Who Were the Monuments Men?</h2>\n	  <p>\n	  The Monuments Men were a group of men and women from thirteen nations, most of whom volunteered had expertise as museum directors, curators, art scholars and educators, artists, architects, and archivists. The Monuments Men job description was simple: to save as much of the culture of Europe as they could during combat.</p>\n	  <p>\nThese men not only had the vision to understand the grave threat to the greatest cultural and artistic achievements of civilization, but then joined the front lines to do something about it. Learn More</p>\n	  </div>\n	</div>\n	<br clear=\"both\">\n</div>\n	{embed=\'global-embeds/site-footer\'}\n\n<!-- SlidesJS Required: Initialize SlidesJS with a jQuery doc ready -->\n  <script>\n    $(function() {\n      $(\'#slides\').slidesjs({\n        width: 940,\n        height: 528,\n        play: {\n          active: true,\n          auto: true,\n          interval: 5000,\n          swap: true\n        }\n      });\n    });\n  </script>\n  <!-- End SlidesJS Required -->\n{html-close}','',1366316728,1,'n',0,'','n','y','o',308),(2,1,2,'index','n','webpage','',NULL,1366123581,0,'n',0,'','n','n','o',0),(3,1,2,'main-css','n','css','body{\n	\n	background-color: #fff; \n	color: #364455;\n	margin: 0;\n	font-family: \"calluna\";\n	\n	width: 100%;\n}\n\n#wrapper{\nmargin: 0 auto;\nwidth: 1200px;\n\n}\n/* nav */\n#navcontain{\nbackground-image: url(\"{main_site_root}/images/home/navrule.gif\");\nbackground-position: 0px 71px;\nbackground-repeat: repeat-x;\nheight:74px;\n}\n#nav{\npadding: 0px 0px 35px 0px;\nmargin: 0 auto;\nwidth: 1300px;\nfont-family: \"proxima-nova\";\n}\n.logo{float:left; display:block; position:relative; top:17px; margin-right:90px;}\n.navrule {border: 0;width: 90%;color: #5b6575;background-color: #5b6575;height: 1px;float:left;}\n//* \n	LEVEL ONE\n*/\n.dropme {margin:0;}\nul.dropdown                         { position: relative; margin:0;z-index:9999; }\nul.dropdown li                      {  float: left; zoom: 1;  list-style:none; height:74px; }\nul.dropdown a:hover		            { color: #fff; }\nul.dropdown a:active                { color: #fff; }\nul.dropdown li a                    { display: block; padding: 30px 15px; border-right: 1px solid #333;\n	 								  color: #364455; text-decoration:none;text-transform:uppercase; }\nul.dropdown li:last-child a         { border-right: none; } /* Doesn\'t work in IE */\nul.dropdown li.hover,\nul.dropdown li:hover                { background-color:rgba(50,64,82,0.9); color: #fff; position: relative; }\nul.dropdown li.hover a              { color: #fff; }\n\n\n/* \n	LEVEL TWO\n*/\nul.dropdown ul 						{ width: 220px; visibility: hidden; position: absolute; top: 100%; left: 0; z-index:9999; margin:0; }\nul.dropdown ul li 					{ font-weight: normal; background-color:rgba(50,64,82,0.9); color: #fff; \n									  border-bottom: 0px solid #ccc; float: none; margin-left:-40px; }\n									  \n                                    /* IE 6 & 7 Needs Inline Block */\nul.dropdown ul li a					{ border-right: none; width: 100%; display: inline-block;color: #fff;  } \n\n/* \n	LEVEL THREE\n*/\nul.dropdown ul ul 					{ left: 100%; top: 0; }\nul.dropdown li:hover > ul 			{ visibility: visible; }\n\n\n\n\n/*home page */\n#homecell{\nbackground-image: url(\"{main_site_root}/images/home/home-cell-bg.jpg\");\nbackground-position: 0 19px;\nbackground-repeat: no-repeat;\nwidth:100%;\nheight:800px;\nposition: relative;\ntop: -38px;\n}\n.homeslide {\nwidth:1200px !important;\nheight:554px !important;\n\n}\n.container{\n\n}\n#home-static-image{\nbackground-image: url(\"{main_site_root}images/home/mm-1.png\");\nwidth: 498px;\nheight:332px;\nfloat:left;\n}\n\n#home-static-text{\nwidth:514px;\nfloat:left;\n}\n#hero1{\n/* background-image: url(\"{main_site_root}images/home/heroimage1.png\");\nbackground-repeat: no-repeat;\nbackground-position:100px 31px; */\nwidth:100%;\nheight:604px;\n\n}\n#homeblogpreviews{\nwidth:680px;\nfloat:left;\n\n}\n\n#homeevents{\nwidth:500;\nfloat:left;\n\n}\n#homeevents li{\nmargin-left:40px;\n}\n.homeblogs{\nfloat:left;\nmargin-right:50px;\nwidth:290px;\n}\n#homedyn h1{\ntext-transform:uppercase;\nfont-size:18px;\nfont-weight:bold;\n}\n\n#homedyn h3{\ntext-transform:uppercase;\nfont-size:14px;\nfont-weight:bold;\n}\n#homedyn p{\nfont-size:10px;\n}\n#homedyn a{\ncolor:#a91111;\nfont-size:12px;\nfont-weight:bold;\ntext-decoration:none;\n}\n#homedyn img{\nwidth:290px;\nheight:auto;\n}\n.homeblogimg {\nwidth:290px;\nheight:180px;\noverflow:hidden;\n\n}\n\n#homeevents li{\nlist-style:none;\n}\n\n\n.slidesjs-pagination{\nposition:relative;\nleft:50px;\ntop:-128px;\n}\n\n.slidesjs-pagination-item{\nfloat:left;\nlist-style:none;\nwidth:260px;\nheight:188px;\n\n}\n\n.slidesjs-pagination-item a{\n\nwidth:260px;\nheight:188px;\n\n/*box-shadow: 3px 2px 4px #888888;*/\n}\n\n.slidesjs-pagination-item a.active{\n\n/*box-shadow: 1px 2px 6px #888888;*/\n}\n\n.slidesjs-pagination-item a.active{\n\n/*box-shadow: 1px 2px 6px #888888;*/\n}\n\n.slidesjs-pagination-item a[data-slidesjs-item=\'0\']{\nbackground-image: url(\"{main_site_root}images/home/slidenav0.png\");\nbackground-repeat: no-repeat;\ndisplay:block;\ntext-indent: -9999px;\n}\n\n.slidesjs-pagination-item a[data-slidesjs-item=\'0\'].active{\nbackground-image: url(\"{main_site_root}images/home/slidenav0-a.png\");\n}\n\n.slidesjs-pagination-item a[data-slidesjs-item=\'1\']{\nbackground-image: url(\"{main_site_root}images/home/slidenav1.png\");\nbackground-repeat: no-repeat;\ndisplay:block;\ntext-indent: -9999px;\n}\n\n.slidesjs-pagination-item a[data-slidesjs-item=\'1\'].active{\nbackground-image: url(\"{main_site_root}images/home/slidenav1-a.png\");\n}\n\n.slidesjs-pagination-item a[data-slidesjs-item=\'2\']{\nbackground-image: url(\"{main_site_root}images/home/slidenav2.png\");\nbackground-repeat: no-repeat;\ndisplay:block;\ntext-indent: -9999px;\n}\n\n.slidesjs-pagination-item a[data-slidesjs-item=\'2\'].active{\nbackground-image: url(\"{main_site_root}images/home/slidenav2-a.png\");\n}\n\n.slidesjs-pagination-item a[data-slidesjs-item=\'3\']{\nbackground-image: url(\"{main_site_root}images/home/slidenav3.png\");\nbackground-repeat: no-repeat;\ndisplay:block;\ntext-indent: -9999px;\n}\n\n.slidesjs-pagination-item a[data-slidesjs-item=\'3\'].active{\nbackground-image: url(\"{main_site_root}images/home/slidenav3-a.png\");\n}\n\n/* books and movies */\n.books{\nfloat:left;\ndisplay:block;\nwidth:540px;\n}\n\n#breadcrumb-wrap {\n font-family: \"proxima-nova\";\nfont-size:12px;\nfont-weight:600;\ntext-transform:uppercase;\nmargin-top:10px;\n\n}\n#breadcrumb-wrap a {\ntext-decoration:none;\ncolor:#888;\n}\n\n#books-top-left{\nwidth:480px !important;\nmargin-right:30px;\nheight:400px;\n}\n#books-top-left h3{\nfont-size:50px;\nmargin-bottom:15px;\n}\n#books-top-left p{\nfont-size:20px;\n}\n\n#books-top-right{\nfloat:right;\nwidth:348px;\n}\n\n#books-main-content-left{\n\nmargin-right:30px;\n\n}\n#books-main-content-right{\n\n\n}\n#books-main-content p{\n}\n\n#books-bottom-left{\n\nmargin-right:30px;\n}\n\n#books-bottom-right{\n\n}\n#books-top-wrapper{\nwidth:1200px;\nheight:400px;\nbackground-repeat:no-repeat;\nbackground-position:425px 0px;\n}\n#sharethis{\nposition:relative;\nbottom:0px;\n}\n.bookline {\nborder: 0;width: 90%;color: #ecedef;background-color: #ecedef;height: 1px;float:left;\n}\n.mon-head{\n font-family: \"proxima-nova\";\nfont-size:20px;\nfont-weight:400;\ntext-transform:uppercase;\n}\n.books h3{\nfont-size:16px;\ncolor:#ad1515;\nmargin:0px;\n}\n/* lightbox */\n#lightbox {\n    position:fixed; /* keeps the lightbox window in the current viewport */\n    top:0;\n    left:0;\n    width:100%;\n    height:100%;\n    background:url({main_site_root}images/books-movies/overlay.png) repeat;\n    text-align:center;\n	z-index:9999;\n}\n#buybook{background:#fff; width:501px; height:488px;margin:auto;position:relative;top:100px; padding:0px;text-align:left;}\n\n.unseen{\nvisibility:hidden;\n}\n.seen{\nvisibility:visible;\n}\n\n.bookshops{\nfloat: left;\nwidth:250px;\nheight:90px;\nborder-style:solid;\nborder-color:#ccc;\nborder-right-width:1px;\nborder-bottom-width:1px;\nborder-top-width:0px;\n\nborder-left-width:0px;\n\n\n}\n.bookshopsr{\nfloat: right;\nwidth:250px;\nheight:90px;\nborder-style:solid;\nborder-color:#ccc;\nborder-top-width:0px;\nborder-left-width:0px;\nborder-right-width:0px;\nborder-bottom-width:1px;\n\n}\n.bookshopstop{\nfloat: left;\nwidth:100%;\nheight:90px;\nborder-style:solid;\nborder-color:#ccc;\nborder-top-width:0px;\nborder-left-width:0px;\nborder-right-width:0px;\nborder-bottom-width:1px;\n\n}\n.buybuy{\nposition:relative;\ntop:35px;\nleft:35px;\n font-family: \"proxima-nova\";\nfont-size:22px;\nfont-weight:800;\ntext-transform:uppercase;\n}\n\n.bookshopsbot{\nfloat: left;\nwidth:250px;\nheight:90px;\nborder-style:solid;\nborder-color:#ccc;\nborder-top-width:0px;\nborder-left-width:0px;\nborder-right-width:1px;\nborder-bottom-width:0px;\n\n}\n.x{float:right;position:relative;top:10px;right:10px;}\n#amazon img{position:relative;top:12px;left:30px;}\n#barnes img{position:relative;top:12px;left:30px;}\n#indie img{position:relative;top:12px;left:30px;}\n#powells img{position:relative;top:12px;left:43px;}\n#ibooks img{position:relative;top:27px;left:38px;}\n#google img{position:relative;top:24px;left:33px;}\n#kobo img{position:relative;top:21px;left:68px;}\n\n\n/*footer */\n#footcontain{\nbackground-color: #2e3c4f;\nwidth:100%;\n}\n#footer{\npadding-top:40px:\ncolor:#fff;\nfont-size: 12px;\nbackground-color: #2e3c4f;\nwidth:100%;\nheight:275px;\nmargin: 0 auto;\nwidth: 1200px;\n}\n#footer a{\ncolor:#fff;\ntext-decoration:none;\n\n}\n#footer ul{\npadding:0px;\n}\n#footer li{\nlist-style:none;\n}\n#footer h2{\ntext-transform:uppercase;\nmargin:0;\nfont-size: 15px;\nfont-weight:bold;\n}\n#foot-home{\nfloat:left;\nwidth:195px;\nmargin-left:80px;\nmargin-top:40px;\n}\n#foot-edu{\nfloat:left;\nwidth:146px;\nmargin-left:25px;\nmargin-top:25px;\n}\n#foot-heroes{\nfloat:left;\nwidth:148px;\nmargin-left:25px;\nmargin-top:25px;\n}\n#foot-speaking{\nfloat:left;\nwidth:148px;\nmargin-left:25px;\nmargin-top:25px;\n}\n#foot-about{\nfloat:left;\nwidth:167px;\nmargin-left:25px;\nmargin-top:25px;\n}\n.vertcent{\ndisplay: table-cell;\nvertical-align: middle;\nposition: relative;\nheight:357px;\n}','',1366406527,1,'n',0,'','n','n','o',434),(4,1,2,'site-footer','n','webpage','<div id=\"footcontain\">\n<div id=\"footer\">\n		<div id=\"foot-home\">\n			<a href=\"\"><h2>Home</h2></a>\n			<ul>\n				<li><a href=\"\"><h2>Books + Movies</h2></a></li>\n				<li><a href=\"\">Saving Italy</a></li>\n				<li><a href=\"\">The Monuments Men</a></li>\n				<li><a href=\"\">Rescung Davinci</a></li>\n				<li><a href=\"\">Rape of Europa Collectors Edition</a></li>\n				<li><a href=\"\">The Monuments Men Feature Film</a></li>\n				<li><a href=\"\">Beyond the Dreams of Avarice</a></li>\n			\n			</ul>\n		</div>\n		<div id=\"foot-edu\">\n			<ul>\n				<li><a href=\"\"><h2>For Educators</h2></a></li>\n				<li><a href=\"\">Free Lesson Plans</a></li>\n				<li><a href=\"\">Glossary</a></li>\n				<li><a href=\"\">Writing Team</a></li>\n				<li><a href=\"\">Advisory Board</a></li>\n				<li><a href=\"\">Supporters</a></li>\n			</ul>\n		</div>\n		<div id=\"foot-heroes\">\n			<ul>\n				<li><a href=\"\"><h2>The Heroes</h2></a></li>\n				<li><a href=\"\">Monuments Men</a></li>\n				<li><a href=\"\">Roberts Commission</a></li>\n				<li><a href=\"\">The American Committy of Learned Societies</a></li>\n				<li><a href=\"\">The Harvard Group</a></li>\n			</ul>\n		</div>\n		<div id=\"foot-speaking\">\n			<ul>\n				<li><a href=\"\"><h2>Speaking Engagements</h2></a></li>\n				<li><a href=\"\">Events</a></li>\n			</ul>\n			<ul>\n				<li><a href=\"\"><h2>Store</h2></a></li>\n				<li><a href=\"\">Products</a></li>\n				<li><a href=\"\">Cart/Checkout</a></li>\n			</ul>\n		</div>\n		<div id=\"foot-about\">\n			<ul>\n				<li><a href=\"\"><h2>About Robert Edsel</h2></a></li>\n				<li><a href=\"\">News</a></li>\n				<li><a href=\"\">Blog</a></li>\n				<li><a href=\"\">Press Inquiries</a></li>\n				<li><a href=\"\">Contact Us</a></li>\n			</ul>\n		</div>\n	</div>\n</div>','',1366234347,1,'n',0,'','n','n','o',0),(5,1,2,'main-nav','n','webpage','<div id=\"navcontain\">\n	<div id=\"nav\">\n		\n			<a href=\"\"><img src=\"{main_site_root}/images/home/logo.png\" class=\"logo\"></a>\n			<ul class=\"dropdown\">\n				<li><a href=\"#\">Books &amp; Movies</a>\n					<ul class=\"sub_menu\">\n						 <li>\n							<a href=\"{main_site_root}index.php/books-movies/saving-italy\">Saving Italy<hr  class=\"navrule\"></a>\n							\n							<ul>\n								<li><a href=\"#\">Excerpt<hr  class=\"navrule\"></a></li>\n								<li><a href=\"#\">Docs &amp; Photos<hr  class=\"navrule\"></a></li>\n							</ul>\n						</li>\n						<li>\n							<a href=\"#\">The Monuments Men<hr  class=\"navrule\"></a>\n							<ul>\n								<li><a href=\"#\">Excerpt<hr  class=\"navrule\"></a></li>\n								<li><a href=\"#\">Docs &amp; Photos<hr  class=\"navrule\"></a></li>\n							</ul>\n						</li>\n						<li>\n							<a href=\"#\">Rescuing Davinci<hr  class=\"navrule\"></a>\n							<ul>\n								<li><a href=\"#\">Excerpt<hr  class=\"navrule\"></a></li>\n								<li><a href=\"#\">Docs &amp; Photos<hr  class=\"navrule\"></a></li>\n							</ul>\n						 </li>\n						 <li><a href=\"#\">Rape of Europa Collector\'s Edition<hr  class=\"navrule\"></a></li>\n						 <li><a href=\"#\">The Monuments Men Feature Film<hr  class=\"navrule\"></a></li>\n						 <li><a href=\"#\">Beyond the Dreams of Avarice</a></li>\n					</ul>\n				</li>\n			</ul>\n			<ul class=\"dropdown\">\n				<li><a href=\"#\">The Heroes</a>\n					<ul class=\"sub_menu\">\n						 <li>\n							<a href=\"#\">Monuments Men<hr  class=\"navrule\"></a>\n							\n						</li>\n						<li>\n							<a href=\"#\">Roberts Commision<hr  class=\"navrule\"></a>\n							\n						</li>\n						<li>\n							<a href=\"#\">The American Committee of Learned Societies<hr  class=\"navrule\"></a>\n							\n						 </li>\n						 <li><a href=\"#\">The Harvard Group</a></li>\n						 \n					</ul>\n				</li>\n			</ul>\n			<ul class=\"dropdown\">\n				<li><a href=\"#\">Speaking Engagements</a>\n					<ul class=\"sub_menu\">\n						 <li>\n							<a href=\"#\">Events</a>\n						</li>\n					</ul>\n				</li>\n			</ul>\n			<ul class=\"dropdown\">\n				<li><a href=\"#\">About Robert Edsel</a>\n					<ul class=\"sub_menu\">\n						 <li>\n							<a href=\"#\">Blog<hr  class=\"navrule\"></a>\n							\n						</li>\n						<li>\n							<a href=\"#\">News<hr  class=\"navrule\"></a>\n							\n						</li>\n						<li>\n							<a href=\"#\">Press Inquiries<hr  class=\"navrule\"></a>\n							\n						 </li>\n						 <li><a href=\"#\">Contact Us</a></li>\n						 \n					</ul>\n				</li>\n			</ul>\n	</div>\n</div>','',1366390179,1,'n',0,'','n','n','o',0),(6,1,2,'jquery.slides.min','n','js','/*\n  SlidesJS 3.0.3 http://slidesjs.com\n  (c) 2013 by Nathan Searles http://nathansearles.com\n  Updated: March 15th, 2013\n  Apache License: http://www.apache.org/licenses/LICENSE-2.0\n*/\n(function(){(function(a,b,c){var d,e,f;return f=\"slidesjs\",e={width:940,height:528,start:1,navigation:{active:!0,effect:\"slide\"},pagination:{active:!0,effect:\"slide\"},play:{active:!1,effect:\"slide\",interval:5e3,auto:!1,swap:!0,pauseOnHover:!1,restartDelay:2500},effect:{slide:{speed:500},fade:{speed:300,crossfade:!0}},callback:{loaded:function(){},start:function(){},complete:function(){}}},d=function(){function b(b,c){this.element=b,this.options=a.extend(!0,{},e,c),this._defaults=e,this._name=f,this.init()}return b}(),d.prototype.init=function(){var c,d,e,f,g,h,i=this;return c=a(this.element),this.data=a.data(this),a.data(this,\"animating\",!1),a.data(this,\"total\",c.children().not(\".slidesjs-navigation\",c).length),a.data(this,\"current\",this.options.start-1),a.data(this,\"vendorPrefix\",this._getVendorPrefix()),\"undefined\"!=typeof TouchEvent&&(a.data(this,\"touch\",!0),this.options.effect.slide.speed=this.options.effect.slide.speed/2),c.css({overflow:\"hidden\"}),c.slidesContainer=c.children().not(\".slidesjs-navigation\",c).wrapAll(\"<div class=\'slidesjs-container\'>\",c).parent().css({overflow:\"hidden\",position:\"relative\"}),a(\".slidesjs-container\",c).wrapInner(\"<div class=\'slidesjs-control\'>\",c).children(),a(\".slidesjs-control\",c).css({position:\"relative\",left:0}),a(\".slidesjs-control\",c).children().addClass(\"slidesjs-slide\").css({position:\"absolute\",top:0,left:0,width:\"100%\",zIndex:0,display:\"none\",webkitBackfaceVisibility:\"hidden\"}),a.each(a(\".slidesjs-control\",c).children(),function(b){var c;return c=a(this),c.attr(\"slidesjs-index\",b)}),this.data.touch&&(a(\".slidesjs-control\",c).on(\"touchstart\",function(a){return i._touchstart(a)}),a(\".slidesjs-control\",c).on(\"touchmove\",function(a){return i._touchmove(a)}),a(\".slidesjs-control\",c).on(\"touchend\",function(a){return i._touchend(a)})),c.fadeIn(0),this.update(),this.data.touch&&this._setuptouch(),a(\".slidesjs-control\",c).children(\":eq(\"+this.data.current+\")\").eq(0).fadeIn(0,function(){return a(this).css({zIndex:10})}),this.options.navigation.active&&(g=a(\"<a>\",{\"class\":\"slidesjs-previous slidesjs-navigation\",href:\"#\",title:\"Previous\",text:\"Previous\"}).appendTo(c),d=a(\"<a>\",{\"class\":\"slidesjs-next slidesjs-navigation\",href:\"#\",title:\"Next\",text:\"Next\"}).appendTo(c)),a(\".slidesjs-next\",c).click(function(a){return a.preventDefault(),i.stop(!0),i.next(i.options.navigation.effect)}),a(\".slidesjs-previous\",c).click(function(a){return a.preventDefault(),i.stop(!0),i.previous(i.options.navigation.effect)}),this.options.play.active&&(f=a(\"<a>\",{\"class\":\"slidesjs-play slidesjs-navigation\",href:\"#\",title:\"Play\",text:\"Play\"}).appendTo(c),h=a(\"<a>\",{\"class\":\"slidesjs-stop slidesjs-navigation\",href:\"#\",title:\"Stop\",text:\"Stop\"}).appendTo(c),f.click(function(a){return a.preventDefault(),i.play(!0)}),h.click(function(a){return a.preventDefault(),i.stop(!0)}),this.options.play.swap&&h.css({display:\"none\"})),this.options.pagination.active&&(e=a(\"<ul>\",{\"class\":\"slidesjs-pagination\"}).appendTo(c),a.each(Array(this.data.total),function(b){var c,d;return c=a(\"<li>\",{\"class\":\"slidesjs-pagination-item\"}).appendTo(e),d=a(\"<a>\",{href:\"#\",\"data-slidesjs-item\":b,html:b+1}).appendTo(c),d.click(function(b){return b.preventDefault(),i.stop(!0),i.goto(1*a(b.currentTarget).attr(\"data-slidesjs-item\")+1)})})),a(b).bind(\"resize\",function(){return i.update()}),this._setActive(),this.options.play.auto&&this.play(),this.options.callback.loaded(this.options.start)},d.prototype._setActive=function(b){var c,d;return c=a(this.element),this.data=a.data(this),d=b>-1?b:this.data.current,a(\".active\",c).removeClass(\"active\"),a(\"li:eq(\"+d+\") a\",c).addClass(\"active\")},d.prototype.update=function(){var b,c,d;return b=a(this.element),this.data=a.data(this),a(\".slidesjs-control\",b).children(\":not(:eq(\"+this.data.current+\"))\").css({display:\"none\",left:0,zIndex:0}),d=b.width(),c=this.options.height/this.options.width*d,this.options.width=d,this.options.height=c,a(\".slidesjs-control, .slidesjs-container\",b).css({width:d,height:c})},d.prototype.next=function(b){var c;return c=a(this.element),this.data=a.data(this),a.data(this,\"direction\",\"next\"),void 0===b&&(b=this.options.navigation.effect),\"fade\"===b?this._fade():this._slide()},d.prototype.previous=function(b){var c;return c=a(this.element),this.data=a.data(this),a.data(this,\"direction\",\"previous\"),void 0===b&&(b=this.options.navigation.effect),\"fade\"===b?this._fade():this._slide()},d.prototype.goto=function(b){var c,d;if(c=a(this.element),this.data=a.data(this),void 0===d&&(d=this.options.pagination.effect),b>this.data.total?b=this.data.total:1>b&&(b=1),\"number\"==typeof b)return\"fade\"===d?this._fade(b):this._slide(b);if(\"string\"==typeof b){if(\"first\"===b)return\"fade\"===d?this._fade(0):this._slide(0);if(\"last\"===b)return\"fade\"===d?this._fade(this.data.total):this._slide(this.data.total)}},d.prototype._setuptouch=function(){var b,c,d,e;return b=a(this.element),this.data=a.data(this),e=a(\".slidesjs-control\",b),c=this.data.current+1,d=this.data.current-1,0>d&&(d=this.data.total-1),c>this.data.total-1&&(c=0),e.children(\":eq(\"+c+\")\").css({display:\"block\",left:this.options.width}),e.children(\":eq(\"+d+\")\").css({display:\"block\",left:-this.options.width})},d.prototype._touchstart=function(b){var c,d;return c=a(this.element),this.data=a.data(this),d=b.originalEvent.touches[0],this._setuptouch(),a.data(this,\"touchtimer\",Number(new Date)),a.data(this,\"touchstartx\",d.pageX),a.data(this,\"touchstarty\",d.pageY),b.stopPropagation()},d.prototype._touchend=function(b){var c,d,e,f,g,h,i,j=this;return c=a(this.element),this.data=a.data(this),h=b.originalEvent.touches[0],f=a(\".slidesjs-control\",c),f.position().left>.5*this.options.width||f.position().left>.1*this.options.width&&250>Number(new Date)-this.data.touchtimer?(a.data(this,\"direction\",\"previous\"),this._slide()):f.position().left<-(.5*this.options.width)||f.position().left<-(.1*this.options.width)&&250>Number(new Date)-this.data.touchtimer?(a.data(this,\"direction\",\"next\"),this._slide()):(e=this.data.vendorPrefix,i=e+\"Transform\",d=e+\"TransitionDuration\",g=e+\"TransitionTimingFunction\",f[0].style[i]=\"translateX(0px)\",f[0].style[d]=.85*this.options.effect.slide.speed+\"ms\"),f.on(\"transitionend webkitTransitionEnd oTransitionEnd otransitionend MSTransitionEnd\",function(){return e=j.data.vendorPrefix,i=e+\"Transform\",d=e+\"TransitionDuration\",g=e+\"TransitionTimingFunction\",f[0].style[i]=\"\",f[0].style[d]=\"\",f[0].style[g]=\"\"}),b.stopPropagation()},d.prototype._touchmove=function(b){var c,d,e,f,g;return c=a(this.element),this.data=a.data(this),f=b.originalEvent.touches[0],d=this.data.vendorPrefix,e=a(\".slidesjs-control\",c),g=d+\"Transform\",a.data(this,\"scrolling\",Math.abs(f.pageX-this.data.touchstartx)<Math.abs(f.pageY-this.data.touchstarty)),this.data.animating||this.data.scrolling||(b.preventDefault(),this._setuptouch(),e[0].style[g]=\"translateX(\"+(f.pageX-this.data.touchstartx)+\"px)\"),b.stopPropagation()},d.prototype.play=function(b){var c,d,e,f=this;return c=a(this.element),this.data=a.data(this),!this.data.playInterval&&(b&&(d=this.data.current,this.data.direction=\"next\",\"fade\"===this.options.play.effect?this._fade():this._slide()),a.data(this,\"playInterval\",setInterval(function(){return d=f.data.current,f.data.direction=\"next\",\"fade\"===f.options.play.effect?f._fade():f._slide()},this.options.play.interval)),e=a(\".slidesjs-container\",c),this.options.play.pauseOnHover&&(e.unbind(),e.bind(\"mouseenter\",function(){return f.stop()}),e.bind(\"mouseleave\",function(){return f.options.play.restartDelay?a.data(f,\"restartDelay\",setTimeout(function(){return f.play(!0)},f.options.play.restartDelay)):f.play()})),a.data(this,\"playing\",!0),a(\".slidesjs-play\",c).addClass(\"slidesjs-playing\"),this.options.play.swap)?(a(\".slidesjs-play\",c).hide(),a(\".slidesjs-stop\",c).show()):void 0},d.prototype.stop=function(b){var c;return c=a(this.element),this.data=a.data(this),clearInterval(this.data.playInterval),this.options.play.pauseOnHover&&b&&a(\".slidesjs-container\",c).unbind(),a.data(this,\"playInterval\",null),a.data(this,\"playing\",!1),a(\".slidesjs-play\",c).removeClass(\"slidesjs-playing\"),this.options.play.swap?(a(\".slidesjs-stop\",c).hide(),a(\".slidesjs-play\",c).show()):void 0},d.prototype._slide=function(b){var c,d,e,f,g,h,i,j,k,l,m=this;return c=a(this.element),this.data=a.data(this),this.data.animating||b===this.data.current+1?void 0:(a.data(this,\"animating\",!0),d=this.data.current,b>-1?(b-=1,l=b>d?1:-1,e=b>d?-this.options.width:this.options.width,g=b):(l=\"next\"===this.data.direction?1:-1,e=\"next\"===this.data.direction?-this.options.width:this.options.width,g=d+l),-1===g&&(g=this.data.total-1),g===this.data.total&&(g=0),this._setActive(g),i=a(\".slidesjs-control\",c),b>-1&&i.children(\":not(:eq(\"+d+\"))\").css({display:\"none\",left:0,zIndex:0}),i.children(\":eq(\"+g+\")\").css({display:\"block\",left:l*this.options.width,zIndex:10}),this.options.callback.start(d+1),this.data.vendorPrefix?(h=this.data.vendorPrefix,k=h+\"Transform\",f=h+\"TransitionDuration\",j=h+\"TransitionTimingFunction\",i[0].style[k]=\"translateX(\"+e+\"px)\",i[0].style[f]=this.options.effect.slide.speed+\"ms\",i.on(\"transitionend webkitTransitionEnd oTransitionEnd otransitionend MSTransitionEnd\",function(){return i[0].style[k]=\"\",i[0].style[f]=\"\",i.children(\":eq(\"+g+\")\").css({left:0}),i.children(\":eq(\"+d+\")\").css({display:\"none\",left:0,zIndex:0}),a.data(m,\"current\",g),a.data(m,\"animating\",!1),i.unbind(\"transitionend webkitTransitionEnd oTransitionEnd otransitionend MSTransitionEnd\"),i.children(\":not(:eq(\"+g+\"))\").css({display:\"none\",left:0,zIndex:0}),m.data.touch&&m._setuptouch(),m.options.callback.complete(g+1)})):i.stop().animate({left:e},this.options.effect.slide.speed,function(){return i.css({left:0}),i.children(\":eq(\"+g+\")\").css({left:0}),i.children(\":eq(\"+d+\")\").css({display:\"none\",left:0,zIndex:0},a.data(m,\"current\",g),a.data(m,\"animating\",!1),m.options.callback.complete(g+1))}))},d.prototype._fade=function(b){var c,d,e,f,g,h=this;return c=a(this.element),this.data=a.data(this),this.data.animating||b===this.data.current+1?void 0:(a.data(this,\"animating\",!0),d=this.data.current,b?(b-=1,g=b>d?1:-1,e=b):(g=\"next\"===this.data.direction?1:-1,e=d+g),-1===e&&(e=this.data.total-1),e===this.data.total&&(e=0),this._setActive(e),f=a(\".slidesjs-control\",c),f.children(\":eq(\"+e+\")\").css({display:\"none\",left:0,zIndex:10}),this.options.callback.start(d+1),this.options.effect.fade.crossfade?(f.children(\":eq(\"+this.data.current+\")\").stop().fadeOut(this.options.effect.fade.speed),f.children(\":eq(\"+e+\")\").stop().fadeIn(this.options.effect.fade.speed,function(){return f.children(\":eq(\"+e+\")\").css({zIndex:0}),a.data(h,\"animating\",!1),a.data(h,\"current\",e),h.options.callback.complete(e+1)})):f.children(\":eq(\"+d+\")\").stop().fadeOut(this.options.effect.fade.speed,function(){return f.children(\":eq(\"+e+\")\").stop().fadeIn(h.options.effect.fade.speed,function(){return f.children(\":eq(\"+e+\")\").css({zIndex:10})}),a.data(h,\"animating\",!1),a.data(h,\"current\",e),h.options.callback.complete(e+1)}))},d.prototype._getVendorPrefix=function(){var a,b,d,e,f;for(a=c.body||c.documentElement,d=a.style,e=\"transition\",f=[\"Moz\",\"Webkit\",\"Khtml\",\"O\",\"ms\"],e=e.charAt(0).toUpperCase()+e.substr(1),b=0;f.length>b;){if(\"string\"==typeof d[f[b]+e])return f[b];b++}return!1},a.fn[f]=function(b){return this.each(function(){return a.data(this,\"plugin_\"+f)?void 0:a.data(this,\"plugin_\"+f,new d(this,b))})}})(jQuery,window,document)}).call(this);\n','',1366145687,1,'n',0,'','n','n','o',190),(7,1,2,'jquery.dropdownPlain','n','js','$(function(){\n\n    $(\"ul.dropdown li\").hover(function(){\n    \n        $(this).addClass(\"hover\");\n        $(\'ul:first\',this).css(\'visibility\', \'visible\');\n    \n    }, function(){\n    \n        $(this).removeClass(\"hover\");\n        $(\'ul:first\',this).css(\'visibility\', \'hidden\');\n    \n    });\n    \n    $(\"ul.dropdown li ul li:has(ul)\").find(\"a:first\").append(\" &raquo; \");\n\n});','',1366299043,1,'n',0,'','n','n','o',13),(8,1,2,'jquery.dropdown','n','js','$(function(){\n\n    var config = {    \n         sensitivity: 3, // number = sensitivity threshold (must be 1 or higher)    \n         interval: 200,  // number = milliseconds for onMouseOver polling interval    \n         over: doOpen,   // function = onMouseOver callback (REQUIRED)    \n         timeout: 200,   // number = milliseconds delay before onMouseOut    \n         out: doClose    // function = onMouseOut callback (REQUIRED)    \n    };\n    \n    function doOpen() {\n        $(this).addClass(\"hover\");\n        $(\'ul:first\',this).css(\'visibility\', \'visible\');\n    }\n \n    function doClose() {\n        $(this).removeClass(\"hover\");\n        $(\'ul:first\',this).css(\'visibility\', \'hidden\');\n    }\n\n    $(\"ul.dropdown li\").hoverIntent(config);\n    \n  //  $(\"ul.dropdown li ul li:has(ul)\").find(\"a:first\").append(\" &raquo; \");\n\n});','',1366304143,1,'n',0,'','n','n','o',46),(9,1,2,'hoverintent','n','js','(function($){\n	/* hoverIntent by Brian Cherne */\n	$.fn.hoverIntent = function(f,g) {\n		// default configuration options\n		var cfg = {\n			sensitivity: 7,\n			interval: 100,\n			timeout: 0\n		};\n		// override configuration options with user supplied object\n		cfg = $.extend(cfg, g ? { over: f, out: g } : f );\n\n		// instantiate variables\n		// cX, cY = current X and Y position of mouse, updated by mousemove event\n		// pX, pY = previous X and Y position of mouse, set by mouseover and polling interval\n		var cX, cY, pX, pY;\n\n		// A private function for getting mouse position\n		var track = function(ev) {\n			cX = ev.pageX;\n			cY = ev.pageY;\n		};\n\n		// A private function for comparing current and previous mouse position\n		var compare = function(ev,ob) {\n			ob.hoverIntent_t = clearTimeout(ob.hoverIntent_t);\n			// compare mouse positions to see if they\'ve crossed the threshold\n			if ( ( Math.abs(pX-cX) + Math.abs(pY-cY) ) < cfg.sensitivity ) {\n				$(ob).unbind(\"mousemove\",track);\n				// set hoverIntent state to true (so mouseOut can be called)\n				ob.hoverIntent_s = 1;\n				return cfg.over.apply(ob,[ev]);\n			} else {\n				// set previous coordinates for next time\n				pX = cX; pY = cY;\n				// use self-calling timeout, guarantees intervals are spaced out properly (avoids JavaScript timer bugs)\n				ob.hoverIntent_t = setTimeout( function(){compare(ev, ob);} , cfg.interval );\n			}\n		};\n\n		// A private function for delaying the mouseOut function\n		var delay = function(ev,ob) {\n			ob.hoverIntent_t = clearTimeout(ob.hoverIntent_t);\n			ob.hoverIntent_s = 0;\n			return cfg.out.apply(ob,[ev]);\n		};\n\n		// A private function for handling mouse \'hovering\'\n		var handleHover = function(e) {\n			// next three lines copied from jQuery.hover, ignore children onMouseOver/onMouseOut\n			var p = (e.type == \"mouseover\" ? e.fromElement : e.toElement) || e.relatedTarget;\n			while ( p && p != this ) { try { p = p.parentNode; } catch(e) { p = this; } }\n			if ( p == this ) { return false; }\n\n			// copy objects to be passed into t (required for event object to be passed in IE)\n			var ev = jQuery.extend({},e);\n			var ob = this;\n\n			// cancel hoverIntent timer if it exists\n			if (ob.hoverIntent_t) { ob.hoverIntent_t = clearTimeout(ob.hoverIntent_t); }\n\n			// else e.type == \"onmouseover\"\n			if (e.type == \"mouseover\") {\n				// set \"previous\" X and Y position based on initial entry point\n				pX = ev.pageX; pY = ev.pageY;\n				// update \"current\" X and Y position based on mousemove\n				$(ob).bind(\"mousemove\",track);\n				// start polling interval (self-calling timeout) to compare mouse coordinates over time\n				if (ob.hoverIntent_s != 1) { ob.hoverIntent_t = setTimeout( function(){compare(ev,ob);} , cfg.interval );}\n\n			// else e.type == \"onmouseout\"\n			} else {\n				// unbind expensive mousemove event\n				$(ob).unbind(\"mousemove\",track);\n				// if hoverIntent state is true, then call the mouseOut function after the specified delay\n				if (ob.hoverIntent_s == 1) { ob.hoverIntent_t = setTimeout( function(){delay(ev,ob);} , cfg.timeout );}\n			}\n		};\n\n		// bind the function to the two event listeners\n		return this.mouseover(handleHover).mouseout(handleHover);\n	};\n	\n})(jQuery);','',1366303294,1,'n',0,'','n','n','o',46),(10,1,3,'index','n','webpage','{html-head}\n{global-css}\n<script type=\"text/javascript\">var switchTo5x=true;</script>\n<script type=\"text/javascript\" src=\"http://w.sharethis.com/button/buttons.js\"></script>\n<script type=\"text/javascript\">stLight.options({publisher: \"a7ef6f0b-d9d8-432d-8b13-1f207972b576\", doNotHash: false, doNotCopy: false, hashAddressBar: false});</script>\n<script>\nfunction seen(){\n	$(\'#lightbox\').removeClass(\'unseen\');\n	$(\'#lightbox\').addClass(\'seen\');\n}\n</script>\n{html-head-end}\n\n<body>\n\n	{embed=\'global-embeds/main-nav\'}\n<div id=\"wrapper\">\n \n{exp:channel:entries channel=\"Books_movies\"}\n<div id=\"breadcrumb-wrap\">\n    \n    <a href=\"{site_url}\">Home Page</a> / \n    \n    <a href=\"{site_url}/books-movies/\">Books &amp;  Movies</a> / \n    \n    {main_title}\n    \n   \n</div>  \n<br clear=\"both\">\n	<div id=\"books-top-wrapper\" style=\"background:url(\'{cover_image}\');background-repeat: no-repeat;background-position:425px 0px; width:100%; \">\n		<div id=\"books-top-left\" class=\"books\" >\n			<div class=\"vertcent\">\n				<h3><img src=\'{main_title_image}\'></h3>\n				<p>{teaser}</p>\n				\n			</div>\n			<div id=\"sharethis\">\n					<span class=\'st_fblike_hcount\' displayText=\'Like\'></span>\n					<span class=\'st_twitter_hcount\' displayText=\'Tweet\'></span>\n					<span class=\'st_pinterest_hcount\' displayText=\'Pin it\'></span>\n					<span class=\'st_sharethis_hcount\' displayText=\'Share\'></span>\n			</div>\n		</div>\n		<div id=\"books-top-right\" class=\"books\">\n			<div class=\"vertcent\">\n				<a onclick=\"$(\'#lightbox\').removeClass(\'unseen\');\"><img src=\'{main_site_root}/images/books-movies/orderbook.png\'></a>\n				\n			</div>\n		</div>\n	</div>\n	<hr class=\"bookline\">\n	<br clear=\"both\">\n	\n	<div id=\"books-main-content-left\" class=\"books\">{main_content}</div>\n	<div id=\"books-main-content-right\" class=\"books\">{main_content_two}</div>\n	<hr class=\"bookline\">\n	<br clear=\"both\">\n	<h1 class=\"mon-head\">Reviews</h1>\n	<div id=\"books-bottom-left\" class=\"books\">{reviews}</div>\n	<div id=\"books-bottom-right\" class=\"books\">{reviews_two}</div>\n</div>\n<br clear=\"both\">\n<div id=\"lightbox\" class=\"unseen\">\n	<div id=\"buybook\">\n		<div id=\"buy\"  class=\"bookshopstop\">\n			\n			<span class=\"buybuy\">Buy {main_title}</span><a onclick=\"$(\'#lightbox\').addClass(\'unseen\');\"><img src=\"{main_site_root}/images/books-movies/x.png\" class=\"x\"></a>\n		</div>\n		<br clear=\"both\">\n		<div id=\"amazon\" class=\"bookshops\">\n		<a href=\"\"><img src=\"{main_site_root}/images/books-movies/amazon.jpg\"></a>\n		</div>\n		<div id=\"barnes\" class=\"bookshopsr\">\n		<a href=\"\"><img src=\"{main_site_root}/images/books-movies/barnes.jpg\"></a>\n		</div>\n		<br clear=\"both\">\n		<div id=\"indie\" class=\"bookshops\">\n		<a href=\"\"><img src=\"{main_site_root}/images/books-movies/indie.jpg\"></a>\n		</div>\n		<div id=\"powells\" class=\"bookshopsr\">\n		<a href=\"\"><img src=\"{main_site_root}/images/books-movies/powells.jpg\"></a>\n		</div>\n		<br clear=\"both\">\n		<div id=\"ibooks\" class=\"bookshops\">\n		<a href=\"\"><img src=\"{main_site_root}/images/books-movies/ibooks.jpg\"></a>\n		</div>\n		<div id=\"google\" class=\"bookshopsr\">\n		<a href=\"\"><img src=\"{main_site_root}/images/books-movies/google.jpg\"></a>\n		</div>\n		<br clear=\"both\">\n		<div id=\"kobo\" class=\"bookshopsbot\">\n		<a href=\"\"><img src=\"{main_site_root}/images/books-movies/kobo.jpg\"></a>\n		</div>\n	</div>\n</div>\n    {/exp:channel:entries} \n	{embed=\'global-embeds/site-footer\'}\n\n\n{html-close}','',1366404763,1,'n',0,'','n','n','o',474);

/*Table structure for table `exp_throttle` */

DROP TABLE IF EXISTS `exp_throttle`;

CREATE TABLE `exp_throttle` (
  `throttle_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL,
  `locked_out` char(1) NOT NULL DEFAULT 'n',
  PRIMARY KEY (`throttle_id`),
  KEY `ip_address` (`ip_address`),
  KEY `last_activity` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `exp_throttle` */

/*Table structure for table `exp_upload_no_access` */

DROP TABLE IF EXISTS `exp_upload_no_access`;

CREATE TABLE `exp_upload_no_access` (
  `upload_id` int(6) unsigned NOT NULL,
  `upload_loc` varchar(3) NOT NULL,
  `member_group` smallint(4) unsigned NOT NULL,
  PRIMARY KEY (`upload_id`,`member_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `exp_upload_no_access` */

/*Table structure for table `exp_upload_prefs` */

DROP TABLE IF EXISTS `exp_upload_prefs`;

CREATE TABLE `exp_upload_prefs` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `name` varchar(50) NOT NULL,
  `server_path` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(100) NOT NULL,
  `allowed_types` varchar(3) NOT NULL DEFAULT 'img',
  `max_size` varchar(16) DEFAULT NULL,
  `max_height` varchar(6) DEFAULT NULL,
  `max_width` varchar(6) DEFAULT NULL,
  `properties` varchar(120) DEFAULT NULL,
  `pre_format` varchar(120) DEFAULT NULL,
  `post_format` varchar(120) DEFAULT NULL,
  `file_properties` varchar(120) DEFAULT NULL,
  `file_pre_format` varchar(120) DEFAULT NULL,
  `file_post_format` varchar(120) DEFAULT NULL,
  `cat_group` varchar(255) DEFAULT NULL,
  `batch_location` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `exp_upload_prefs` */

insert  into `exp_upload_prefs`(`id`,`site_id`,`name`,`server_path`,`url`,`allowed_types`,`max_size`,`max_height`,`max_width`,`properties`,`pre_format`,`post_format`,`file_properties`,`file_pre_format`,`file_post_format`,`cat_group`,`batch_location`) values (1,1,'images-home','C:\\xampp\\htdocs\\monmen\\images\\home/','http://localhost/monmen/images/home/','img','','','','','','','','','','',NULL),(2,1,'books movies','C:\\xampp\\htdocs\\monmen\\images\\books-movies/','http://localhost/monmen/images/books-movies/','img','','','','','','','','','','',NULL);

/*Table structure for table `exp_whitelisted` */

DROP TABLE IF EXISTS `exp_whitelisted`;

CREATE TABLE `exp_whitelisted` (
  `whitelisted_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `whitelisted_type` varchar(20) DEFAULT NULL,
  `whitelisted_value` longtext,
  PRIMARY KEY (`whitelisted_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `exp_whitelisted` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
