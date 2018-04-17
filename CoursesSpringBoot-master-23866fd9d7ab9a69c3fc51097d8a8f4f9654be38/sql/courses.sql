# Host: localhost  (Version: 5.5.15)
# Date: 2018-03-13 18:47:48
# Generator: MySQL-Front 5.3  (Build 4.269)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "agreement"
#

DROP TABLE IF EXISTS `agreement`;
CREATE TABLE `agreement` (
  `student_id` varchar(33) NOT NULL,
  `comment_id` int(11) NOT NULL,
  PRIMARY KEY (`student_id`,`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "agreement"
#


#
# Structure for table "chapter"
#

DROP TABLE IF EXISTS `chapter`;
CREATE TABLE `chapter` (
  `id` varchar(64) NOT NULL,
  `number` varchar(9) NOT NULL,
  `name` varchar(40) NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updatetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `isDelete` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "chapter"
#

INSERT INTO `chapter` VALUES ('085b7833e3cd49659214ed1fb00919a3','第1章','11','2018-03-10 17:15:11','2018-03-11 21:56:12',1),('18afc39a21ee47f2ac76ed540d3dce27','第10章','asdsfbgshdmjk','2018-03-10 20:42:05','2018-03-10 20:42:08',1),('1e5693339e8444d28df592d8dd307e16','第3章','chapter3','2018-03-03 16:39:03','2018-03-03 16:39:03',0),('4d26c828e8084d3097d5cab9a8103a14','第1章','chapter1','2018-03-13 16:16:14','2018-03-13 16:16:14',0),('50b98ac49fc84477ac08c0f46a31c5ac','第3章','11','2018-03-03 20:26:16','2018-03-03 20:26:16',0),('6e0231d9e7174d0f892ff4f55e4ab513','第1章','chapter1','2018-03-01 22:31:37','2018-03-11 20:19:02',0),('6e30afc029864278b3d3b8171d152063','第10章','dsbfngmh','2018-03-10 20:38:14','2018-03-12 13:55:57',0),('8366a55965ce43f9bcbe174f9ec1f2ba','第8章','方','2018-03-11 10:37:53','2018-03-11 10:37:53',0),('a80e1ef013ea4b058a5a42aa0299a7ed','','1','2018-03-10 18:27:11','2018-03-10 18:27:11',0),('ac1feb5cf5c648ee96b5c667c3da5abb','第3章','chapter3','2018-03-13 16:19:47','2018-03-13 16:19:47',0),('ae67c22fd62a4d9093ad4c8f558c3b65','第3章','chapter3','2018-03-03 17:06:58','2018-03-03 17:06:58',0),('bb158e1832064570be0cfd58888071cf','第2章','chapter2','2018-03-13 16:18:49','2018-03-13 16:18:49',0),('d556e6cdcf2c4ec78a3d5da5c0e5b95e','第2章','1','2018-03-10 18:27:44','2018-03-10 18:27:44',0),('d8f2413f22bd4e77bcded22658ad8732','第2章','chapter2','2018-03-03 16:30:29','2018-03-03 16:30:29',0),('e6e760a9f52d40f0be6432302ad8d5d1','第4章','chapter4','2018-03-11 21:56:24','2018-03-11 21:56:30',0),('eca482c447984b69b23c85e44597d267','第1章','Chapter1','2018-02-28 23:04:12','2018-02-28 23:04:12',0);

#
# Structure for table "chapter_comment"
#

DROP TABLE IF EXISTS `chapter_comment`;
CREATE TABLE `chapter_comment` (
  `chapter_id` varchar(33) NOT NULL,
  `comment_id` bigint(20) NOT NULL,
  `is_delete` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`chapter_id`,`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "chapter_comment"
#


#
# Structure for table "chapter_unit"
#

DROP TABLE IF EXISTS `chapter_unit`;
CREATE TABLE `chapter_unit` (
  `chapter_id` varchar(64) NOT NULL,
  `unit_id` varchar(64) NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updatetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `isDelete` int(1) NOT NULL,
  PRIMARY KEY (`chapter_id`,`unit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "chapter_unit"
#

INSERT INTO `chapter_unit` VALUES ('085b7833e3cd49659214ed1fb00919a3','52abe90eb481433a8d61738438037f0d','2018-03-11 13:44:21','2018-03-11 13:44:21',1),('1e5693339e8444d28df592d8dd307e16','e7f79f775ce54037b4aec0e901989672','2018-03-03 16:44:05','2018-03-03 16:44:05',1),('4d26c828e8084d3097d5cab9a8103a14','32f316a9c9de4db19cc30e34b2d3d9f9','2018-03-13 16:17:20','2018-03-13 16:17:20',0),('4d26c828e8084d3097d5cab9a8103a14','71bad896a37c4d76a395811086a3f53d','2018-03-13 16:18:16','2018-03-13 16:18:16',0),('4d26c828e8084d3097d5cab9a8103a14','b4440ce749b74a1cb85cba179fa1de85','2018-03-13 16:16:23','2018-03-13 16:16:23',0),('4d26c828e8084d3097d5cab9a8103a14','eafa71cce8dd492681a544e7aa59da4a','2018-03-13 16:17:53','2018-03-13 16:17:53',0),('6e0231d9e7174d0f892ff4f55e4ab513','2829dfa6ecf1491f8acb24f536bf660c','2018-03-11 20:18:19','2018-03-11 20:18:19',1),('6e0231d9e7174d0f892ff4f55e4ab513','618e251eeeb8431d9a7e22946d5ef04c','2018-03-11 13:53:54','2018-03-11 13:53:54',0),('6e0231d9e7174d0f892ff4f55e4ab513','c4141f83fe6e4021b344c412bd2ac52b','2018-03-01 22:34:06','2018-03-01 22:34:06',1),('6e0231d9e7174d0f892ff4f55e4ab513','ffd6646195d3430d8ab43544e86b7c9d','2018-03-01 22:34:48','2018-03-01 22:34:48',0),('6e30afc029864278b3d3b8171d152063','67e36c88c4f64abe9bc4236e87c818c3','2018-03-12 13:55:29','2018-03-12 13:55:29',0),('ac1feb5cf5c648ee96b5c667c3da5abb','83c7fc6d94ef4ea3a1fa510faceec22a','2018-03-13 16:20:00','2018-03-13 16:20:00',0),('bb158e1832064570be0cfd58888071cf','42c67e777e1549dba3193080b233b7e8','2018-03-13 16:19:19','2018-03-13 16:19:19',0),('bb158e1832064570be0cfd58888071cf','8554e7ef833c41629d65d2bc093c4a0b','2018-03-13 16:18:58','2018-03-13 16:18:58',0),('e6e760a9f52d40f0be6432302ad8d5d1','cd639120c3f644f3883f4b7cf86f68a7','2018-03-11 21:56:39','2018-03-11 21:56:39',0);

#
# Structure for table "comment"
#

DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(1024) NOT NULL,
  `agree_count` int(11) NOT NULL DEFAULT '0',
  `is_check` tinyint(4) NOT NULL DEFAULT '0',
  `is_pass` tinyint(4) NOT NULL DEFAULT '1',
  `student_id` varchar(33) NOT NULL,
  `chapter_id` varchar(33) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_delete` tinyint(4) NOT NULL DEFAULT '0',
  `reply` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `chapter_id` (`chapter_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "comment"
#


#
# Structure for table "course"
#

DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `id` varchar(64) NOT NULL,
  `number` varchar(20) NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `type` varchar(20) NOT NULL,
  `introduction` text,
  `credit` varchar(10) DEFAULT NULL,
  `hours` varchar(10) DEFAULT NULL,
  `createtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updatetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `isDelete` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "course"
#

INSERT INTO `course` VALUES ('01d32f5338074deab8e63d8cc93ed339','4-Course1','4-Course1','核心课程','1','1','1','2018-03-13 16:00:22','2018-03-13 16:00:22',0),('05d6e3bc096b4cb7a7b01c4be282b793','5-Course3','5-Course3','辅助课程','1','1','1','2018-03-13 16:02:18','2018-03-13 16:02:18',0),('28b8a7bfd46d4daeab0e0e6fdeeed540','3-Course2','3-Course2','辅助课程','1','1','1','2018-03-13 15:58:49','2018-03-13 15:58:49',0),('2dd3a7b0a4cd4bd2b0d5f54d6187e1cb','5-Course2','5-Course2','辅助课程','1','1','1','2018-03-13 16:01:58','2018-03-13 16:01:58',0),('3052508d71004c9dafd9139243eb5415','Course5','课程5','辅助课程','1','1','1','2018-03-13 15:55:35','2018-03-13 15:55:35',0),('3446733295a74b3887c16fa361b77e5e','Course1','课程1','核心课程','1','1','1','2018-03-13 15:54:23','2018-03-13 15:54:23',0),('35da96aaa8244304a87d8dc92dfae4be','C01','CTest01','核心课程','1','1','1','2018-02-28 23:02:51','2018-02-28 23:02:51',0),('3dfef93d8d53401c97739e6a12dd94f2','3-Course3','3-Course3','辅助课程','1','1','1','2018-03-13 15:59:34','2018-03-13 15:59:34',0),('447d2ff96b4545ea8e80d6cb20ba0e89','2-Course1','2-Course1','核心课程','1','1','1','2018-03-13 15:57:03','2018-03-13 15:57:03',0),('4ee0af14b0784ad0bcc88bdd810a7f9a','2-Course3','2-Course3','辅助课程','1','1','1','2018-03-13 15:57:36','2018-03-13 15:57:36',0),('5175a34d7a42458996161d04af1677e6','5-Course4','5-Course4','辅助课程','1','1','1','2018-03-13 16:02:34','2018-03-13 16:02:34',0),('5e29e06a542a442689e1d6f40c11f5e0','3-Course4','3-Course4','辅助课程','1','1','1','2018-03-13 15:59:49','2018-03-13 15:59:49',0),('64d064de406e4dc9a68ecca5b286dfa4','4-Course3','4-Course3','辅助课程','1','1','1','2018-03-13 16:00:57','2018-03-13 16:00:57',0),('7162264310104dd180ab4f153c8e8423','4-Course4','4-Course4','辅助课程','1','1','1','2018-03-13 16:01:11','2018-03-13 16:01:11',0),('8102de1aef244aadb740136e8a0af5eb','4-Course2','4-Course2','辅助课程','1','1','1','2018-03-13 16:00:43','2018-03-13 16:00:43',0),('854f2393b78542afa358dbd785fa99f5','Course2','课程2','辅助课程','1','1','1','2018-03-13 15:54:40','2018-03-13 15:54:40',0),('9037920cbd534c65b1f9579932ae3da0','2-Course4','2-Course4','辅助课程','1','1','1','2018-03-13 15:57:54','2018-03-13 15:57:54',0),('95a0f9f6cc394cfea2409e6232807162','3-Course1','3-Course1','核心课程','1','1','1','2018-03-13 15:58:29','2018-03-13 15:58:29',0),('9be4e8a927db4d6db0c78e51d21f94e9','5-Course1','5-Course1','核心课程','1','1','1','2018-03-13 16:01:41','2018-03-13 16:01:41',0),('ad0ecd04a5d042fdb9596222babe7ee2','Course3','课程3','辅助课程','1','1','1','2018-03-13 15:54:58','2018-03-13 15:54:58',0),('b1dbb521205b4ea88cd170893e0f29e2','2-Course2','2-Course2','辅助课程','1','1','1','2018-03-13 15:57:20','2018-03-13 15:57:20',0),('e9537f4f6b62488c92627a3d99bb2360','4-Course5','4-Course5','辅助课程','1','1','1','2018-03-13 16:01:26','2018-03-13 16:01:26',0),('ec7286fd872c4367ad0b831e4b138ca7','Course4','课程4','辅助课程','1','1','1','2018-03-13 15:55:15','2018-03-13 15:55:15',0),('f59768fc38a749d6b68040af9ee4cc5e','5-Course5','5-Course5','辅助课程','1','1','1','2018-03-13 16:02:51','2018-03-13 16:02:51',0),('f5a9ac6d95064f73a065a80fa12bfd70','3-Course5','3-Course5','辅助课程','1','1','1','2018-03-13 16:00:06','2018-03-13 16:00:06',0),('fc0b04794f0e471cbffef8020bd69c54','2-Course5','2-Course5','辅助课程','1','1','1','2018-03-13 15:58:10','2018-03-13 15:58:10',0);

#
# Structure for table "course_chapter"
#

DROP TABLE IF EXISTS `course_chapter`;
CREATE TABLE `course_chapter` (
  `course_id` varchar(64) NOT NULL,
  `chapter_id` varchar(64) NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updatetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `isDelete` int(1) NOT NULL,
  PRIMARY KEY (`course_id`,`chapter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "course_chapter"
#

INSERT INTO `course_chapter` VALUES ('3446733295a74b3887c16fa361b77e5e','4d26c828e8084d3097d5cab9a8103a14','2018-03-13 16:16:14','2018-03-13 16:16:14',0),('3446733295a74b3887c16fa361b77e5e','ac1feb5cf5c648ee96b5c667c3da5abb','2018-03-13 16:19:47','2018-03-13 16:19:47',0),('3446733295a74b3887c16fa361b77e5e','bb158e1832064570be0cfd58888071cf','2018-03-13 16:18:49','2018-03-13 16:18:49',0),('35da96aaa8244304a87d8dc92dfae4be','085b7833e3cd49659214ed1fb00919a3','2018-03-10 17:15:11','2018-03-10 17:15:11',1),('35da96aaa8244304a87d8dc92dfae4be','18afc39a21ee47f2ac76ed540d3dce27','2018-03-10 20:42:05','2018-03-10 20:42:05',1),('35da96aaa8244304a87d8dc92dfae4be','1e5693339e8444d28df592d8dd307e16','2018-03-03 16:39:03','2018-03-03 16:39:03',0),('35da96aaa8244304a87d8dc92dfae4be','50b98ac49fc84477ac08c0f46a31c5ac','2018-03-03 20:26:16','2018-03-03 20:26:16',0),('35da96aaa8244304a87d8dc92dfae4be','6e0231d9e7174d0f892ff4f55e4ab513','2018-03-01 22:31:37','2018-03-01 22:31:37',0),('35da96aaa8244304a87d8dc92dfae4be','6e30afc029864278b3d3b8171d152063','2018-03-10 20:38:14','2018-03-10 20:38:14',0),('35da96aaa8244304a87d8dc92dfae4be','8366a55965ce43f9bcbe174f9ec1f2ba','2018-03-11 10:37:53','2018-03-11 10:37:53',0),('35da96aaa8244304a87d8dc92dfae4be','a80e1ef013ea4b058a5a42aa0299a7ed','2018-03-10 18:27:11','2018-03-10 18:27:11',0),('35da96aaa8244304a87d8dc92dfae4be','ae67c22fd62a4d9093ad4c8f558c3b65','2018-03-03 17:06:58','2018-03-03 17:06:58',0),('35da96aaa8244304a87d8dc92dfae4be','d556e6cdcf2c4ec78a3d5da5c0e5b95e','2018-03-10 18:27:44','2018-03-10 18:27:44',0),('35da96aaa8244304a87d8dc92dfae4be','d8f2413f22bd4e77bcded22658ad8732','2018-03-03 16:30:29','2018-03-03 16:30:29',0),('35da96aaa8244304a87d8dc92dfae4be','e6e760a9f52d40f0be6432302ad8d5d1','2018-03-11 21:56:24','2018-03-11 21:56:24',0),('35da96aaa8244304a87d8dc92dfae4be','eca482c447984b69b23c85e44597d267','2018-02-28 23:04:12','2018-02-28 23:04:12',0);

#
# Structure for table "course_office"
#

DROP TABLE IF EXISTS `course_office`;
CREATE TABLE `course_office` (
  `course_id` varchar(64) NOT NULL,
  `office_id` varchar(64) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `isDelete` smallint(6) DEFAULT '0',
  PRIMARY KEY (`course_id`,`office_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "course_office"
#


#
# Structure for table "course_picture"
#

DROP TABLE IF EXISTS `course_picture`;
CREATE TABLE `course_picture` (
  `course_id` varchar(64) NOT NULL,
  `picture_id` varchar(64) NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updatetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `isDelete` int(1) NOT NULL,
  PRIMARY KEY (`course_id`,`picture_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "course_picture"
#

INSERT INTO `course_picture` VALUES ('01d32f5338074deab8e63d8cc93ed339','51','2018-03-13 16:41:46','2018-03-13 16:41:46',0),('05d6e3bc096b4cb7a7b01c4be282b793','50','2018-03-13 16:41:36','2018-03-13 16:41:36',0),('28b8a7bfd46d4daeab0e0e6fdeeed540','49','2018-03-13 16:41:25','2018-03-13 16:41:25',0),('2dd3a7b0a4cd4bd2b0d5f54d6187e1cb','48','2018-03-13 16:41:14','2018-03-13 16:41:14',0),('3052508d71004c9dafd9139243eb5415','52','2018-03-13 16:41:56','2018-03-13 16:41:56',0),('3446733295a74b3887c16fa361b77e5e','28','2018-03-13 16:15:53','2018-03-13 16:15:53',0),('35da96aaa8244304a87d8dc92dfae4be','10','2018-03-10 10:09:03','2018-03-10 10:09:03',1),('35da96aaa8244304a87d8dc92dfae4be','11','2018-03-10 10:10:41','2018-03-10 10:10:41',1),('35da96aaa8244304a87d8dc92dfae4be','12','2018-03-10 10:10:58','2018-03-10 10:10:58',1),('35da96aaa8244304a87d8dc92dfae4be','13','2018-03-10 10:18:38','2018-03-10 10:18:38',1),('35da96aaa8244304a87d8dc92dfae4be','14','2018-03-10 10:22:01','2018-03-10 10:22:01',1),('35da96aaa8244304a87d8dc92dfae4be','2','2018-03-10 09:13:34','2018-03-10 09:13:34',1),('35da96aaa8244304a87d8dc92dfae4be','22','2018-03-11 21:57:28','2018-03-11 21:57:28',0),('35da96aaa8244304a87d8dc92dfae4be','3','2018-03-10 09:41:26','2018-03-10 09:41:26',1),('35da96aaa8244304a87d8dc92dfae4be','4','2018-03-10 09:44:09','2018-03-10 09:44:09',1),('35da96aaa8244304a87d8dc92dfae4be','5','2018-03-10 09:44:22','2018-03-10 09:44:22',1),('35da96aaa8244304a87d8dc92dfae4be','6','2018-03-10 09:47:21','2018-03-10 09:47:21',1),('35da96aaa8244304a87d8dc92dfae4be','7','2018-03-10 09:49:30','2018-03-10 09:49:30',1),('35da96aaa8244304a87d8dc92dfae4be','8','2018-03-10 10:08:24','2018-03-10 10:08:24',1),('35da96aaa8244304a87d8dc92dfae4be','9','2018-03-10 10:08:40','2018-03-10 10:08:40',1),('3dfef93d8d53401c97739e6a12dd94f2','47','2018-03-13 16:40:37','2018-03-13 16:40:37',0),('447d2ff96b4545ea8e80d6cb20ba0e89','46','2018-03-13 16:40:26','2018-03-13 16:40:26',0),('4ee0af14b0784ad0bcc88bdd810a7f9a','45','2018-03-13 16:40:13','2018-03-13 16:40:13',0),('5175a34d7a42458996161d04af1677e6','44','2018-03-13 16:40:02','2018-03-13 16:40:02',0),('5e29e06a542a442689e1d6f40c11f5e0','43','2018-03-13 16:39:51','2018-03-13 16:39:51',0),('64d064de406e4dc9a68ecca5b286dfa4','42','2018-03-13 16:39:38','2018-03-13 16:39:38',0),('7162264310104dd180ab4f153c8e8423','41','2018-03-13 16:39:26','2018-03-13 16:39:26',0),('8102de1aef244aadb740136e8a0af5eb','40','2018-03-13 16:39:14','2018-03-13 16:39:14',0),('854f2393b78542afa358dbd785fa99f5','29','2018-03-13 16:36:36','2018-03-13 16:36:36',0),('9037920cbd534c65b1f9579932ae3da0','39','2018-03-13 16:39:01','2018-03-13 16:39:01',0),('95a0f9f6cc394cfea2409e6232807162','38','2018-03-13 16:38:48','2018-03-13 16:38:48',0),('9be4e8a927db4d6db0c78e51d21f94e9','37','2018-03-13 16:38:35','2018-03-13 16:38:35',0),('ad0ecd04a5d042fdb9596222babe7ee2','30','2018-03-13 16:36:49','2018-03-13 16:36:49',0),('b1dbb521205b4ea88cd170893e0f29e2','36','2018-03-13 16:38:08','2018-03-13 16:38:08',0),('e9537f4f6b62488c92627a3d99bb2360','35','2018-03-13 16:37:57','2018-03-13 16:37:57',0),('ec7286fd872c4367ad0b831e4b138ca7','34','2018-03-13 16:37:42','2018-03-13 16:37:42',0),('f59768fc38a749d6b68040af9ee4cc5e','33','2018-03-13 16:37:27','2018-03-13 16:37:27',0),('f5a9ac6d95064f73a065a80fa12bfd70','32','2018-03-13 16:37:13','2018-03-13 16:37:13',0),('fc0b04794f0e471cbffef8020bd69c54','31','2018-03-13 16:37:01','2018-03-13 16:37:01',0);

#
# Structure for table "coursegroup"
#

DROP TABLE IF EXISTS `coursegroup`;
CREATE TABLE `coursegroup` (
  `id` varchar(64) NOT NULL,
  `number` varchar(20) NOT NULL,
  `name` varchar(40) NOT NULL,
  `introduction` text,
  `createtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updatetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `isDelete` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "coursegroup"
#

INSERT INTO `coursegroup` VALUES ('152e542712814b30bb7ba5042df7d2fd','CourseGroup4','课程组4','','2018-03-13 15:52:23','2018-03-13 15:52:23',0),('254e187853af47849a7998f6f371df7f','A1','Test1','','2018-02-28 23:02:09','2018-02-28 23:02:09',0),('4075b80ab5b244db8c88dac610119c85','CourseGroup5','课程组5','','2018-03-13 15:52:34','2018-03-13 15:52:34',0),('6c7ce17de46648bb97d7c06679c10823','CourseGroup1','课程组1','','2018-03-13 15:51:37','2018-03-13 15:53:39',0),('785cafbda51c448fb62cb1ad87a3c8f8','CourseGroup2','课程组2','','2018-03-13 15:51:54','2018-03-13 15:51:54',0),('dba31ec2b4cd430d975dbe06a0c68147','CourseGroup3','课程组3','','2018-03-13 15:52:07','2018-03-13 15:52:07',0);

#
# Structure for table "coursegroup_course"
#

DROP TABLE IF EXISTS `coursegroup_course`;
CREATE TABLE `coursegroup_course` (
  `coursegroup_id` varchar(64) NOT NULL,
  `course_id` varchar(64) NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updatetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `isDelete` int(1) NOT NULL,
  PRIMARY KEY (`coursegroup_id`,`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "coursegroup_course"
#

INSERT INTO `coursegroup_course` VALUES ('152e542712814b30bb7ba5042df7d2fd','01d32f5338074deab8e63d8cc93ed339','2018-03-13 16:05:37','2018-03-13 16:05:37',0),('152e542712814b30bb7ba5042df7d2fd','64d064de406e4dc9a68ecca5b286dfa4','2018-03-13 16:09:13','2018-03-13 16:09:13',0),('152e542712814b30bb7ba5042df7d2fd','7162264310104dd180ab4f153c8e8423','2018-03-13 16:09:11','2018-03-13 16:09:11',0),('152e542712814b30bb7ba5042df7d2fd','8102de1aef244aadb740136e8a0af5eb','2018-03-13 16:09:09','2018-03-13 16:09:09',0),('152e542712814b30bb7ba5042df7d2fd','e9537f4f6b62488c92627a3d99bb2360','2018-03-13 16:11:51','2018-03-13 16:11:51',0),('254e187853af47849a7998f6f371df7f','35da96aaa8244304a87d8dc92dfae4be','2018-02-28 23:03:33','2018-02-28 23:03:33',0),('4075b80ab5b244db8c88dac610119c85','05d6e3bc096b4cb7a7b01c4be282b793','2018-03-13 16:06:57','2018-03-13 16:06:57',0),('4075b80ab5b244db8c88dac610119c85','5175a34d7a42458996161d04af1677e6','2018-03-13 16:09:16','2018-03-13 16:09:16',0),('4075b80ab5b244db8c88dac610119c85','9be4e8a927db4d6db0c78e51d21f94e9','2018-03-13 16:09:00','2018-03-13 16:09:00',0),('4075b80ab5b244db8c88dac610119c85','f59768fc38a749d6b68040af9ee4cc5e','2018-03-13 16:11:49','2018-03-13 16:11:49',0),('6c7ce17de46648bb97d7c06679c10823','3052508d71004c9dafd9139243eb5415','2018-03-13 15:56:05','2018-03-13 15:56:05',0),('6c7ce17de46648bb97d7c06679c10823','3446733295a74b3887c16fa361b77e5e','2018-03-13 15:55:58','2018-03-13 15:55:58',0),('6c7ce17de46648bb97d7c06679c10823','854f2393b78542afa358dbd785fa99f5','2018-03-13 15:56:09','2018-03-13 15:56:09',0),('6c7ce17de46648bb97d7c06679c10823','ad0ecd04a5d042fdb9596222babe7ee2','2018-03-13 15:56:12','2018-03-13 15:56:12',0),('6c7ce17de46648bb97d7c06679c10823','ec7286fd872c4367ad0b831e4b138ca7','2018-03-13 15:56:16','2018-03-13 15:56:16',0),('785cafbda51c448fb62cb1ad87a3c8f8','447d2ff96b4545ea8e80d6cb20ba0e89','2018-03-13 16:07:58','2018-03-13 16:07:58',0),('785cafbda51c448fb62cb1ad87a3c8f8','4ee0af14b0784ad0bcc88bdd810a7f9a','2018-03-13 16:08:00','2018-03-13 16:08:00',0),('785cafbda51c448fb62cb1ad87a3c8f8','9037920cbd534c65b1f9579932ae3da0','2018-03-13 16:09:04','2018-03-13 16:09:04',0),('785cafbda51c448fb62cb1ad87a3c8f8','b1dbb521205b4ea88cd170893e0f29e2','2018-03-13 16:11:53','2018-03-13 16:11:53',0),('785cafbda51c448fb62cb1ad87a3c8f8','fc0b04794f0e471cbffef8020bd69c54','2018-03-13 16:11:46','2018-03-13 16:11:46',0),('dba31ec2b4cd430d975dbe06a0c68147','5e29e06a542a442689e1d6f40c11f5e0','2018-03-13 16:09:14','2018-03-13 16:09:14',0),('dba31ec2b4cd430d975dbe06a0c68147','95a0f9f6cc394cfea2409e6232807162','2018-03-13 16:09:02','2018-03-13 16:09:02',0),('dba31ec2b4cd430d975dbe06a0c68147','f5a9ac6d95064f73a065a80fa12bfd70','2018-03-13 16:11:47','2018-03-13 16:11:47',0);

#
# Structure for table "coursegroup_picture"
#

DROP TABLE IF EXISTS `coursegroup_picture`;
CREATE TABLE `coursegroup_picture` (
  `coursegroup_id` varchar(64) NOT NULL,
  `picture_id` varchar(64) NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updatetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `isDelete` int(1) NOT NULL,
  PRIMARY KEY (`coursegroup_id`,`picture_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "coursegroup_picture"
#


#
# Structure for table "coursegroup_teacher"
#

DROP TABLE IF EXISTS `coursegroup_teacher`;
CREATE TABLE `coursegroup_teacher` (
  `coursegroup_id` varchar(64) NOT NULL,
  `teacher_id` varchar(64) NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updatetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `isDelete` int(1) NOT NULL,
  PRIMARY KEY (`coursegroup_id`,`teacher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "coursegroup_teacher"
#

INSERT INTO `coursegroup_teacher` VALUES ('152e542712814b30bb7ba5042df7d2fd','5c7309cfe934430eb5a3ce43dcb1065b','2018-03-13 16:06:52','2018-03-13 16:06:52',0),('254e187853af47849a7998f6f371df7f','1c456a498ecf4fa3b91c183625bba983','2018-03-13 16:07:41','2018-03-13 16:07:41',0),('254e187853af47849a7998f6f371df7f','7cbdb365b5e145ea98dfdcd5f84182ac','2018-02-28 23:03:37','2018-02-28 23:03:37',1),('4075b80ab5b244db8c88dac610119c85','0ed004f0a9234317b0254af420c81449','2018-03-13 16:07:00','2018-03-13 16:07:00',0),('6c7ce17de46648bb97d7c06679c10823','1c456a498ecf4fa3b91c183625bba983','2018-03-13 16:07:25','2018-03-13 16:07:25',0),('785cafbda51c448fb62cb1ad87a3c8f8','8cf5572577bb4f3589cde68e98b5f098','2018-03-13 16:08:23','2018-03-13 16:08:23',0),('dba31ec2b4cd430d975dbe06a0c68147','2c35fbde2c2d4819a7c43bef05d016b1','2018-03-13 16:07:13','2018-03-13 16:07:13',0);

#
# Structure for table "homework"
#

DROP TABLE IF EXISTS `homework`;
CREATE TABLE `homework` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `office_id` int(11) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_delete` tinyint(4) DEFAULT '0',
  `course_id` varchar(33) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "homework"
#


#
# Structure for table "inform"
#

DROP TABLE IF EXISTS `inform`;
CREATE TABLE `inform` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL,
  `content` text NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_delete` tinyint(4) DEFAULT '0',
  `course_id` varchar(33) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "inform"
#


#
# Structure for table "knowledgepoint"
#

DROP TABLE IF EXISTS `knowledgepoint`;
CREATE TABLE `knowledgepoint` (
  `id` varchar(64) NOT NULL,
  `content` varchar(40) NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updatetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `isDelete` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "knowledgepoint"
#

INSERT INTO `knowledgepoint` VALUES ('0c9cea7649c2443190f138d791f2c8be','kp1','2018-03-13 16:19:10','2018-03-13 16:19:10',0),('1','知识管理','2018-03-01 22:34:06','2018-03-01 22:34:06',0),('151a0080ba24423cb347cac7991c864c','kp6','2018-03-10 14:40:01','2018-03-10 14:40:01',0),('2','知识测试','2018-03-01 22:34:06','2018-03-01 22:34:06',1),('2ffd4a482f694102aa4b1645e9cf1bad','kp4','2018-03-13 16:17:07','2018-03-13 16:17:07',0),('3038d272aace4723b956d4819ed7cce4','kp1','2018-03-13 16:19:30','2018-03-13 16:19:30',0),('3805a63bd136412c8325ae6e274d54dc','kp2','2018-03-13 16:17:07','2018-03-13 16:17:07',0),('3851eacdf20344a59dae22cf95ad7aeb','33','2018-03-11 20:18:34','2018-03-11 20:18:34',0),('426a9b62d72043ac9e23162a6eb959cb','kp2','2018-03-13 16:19:30','2018-03-13 16:19:30',0),('46a107ba200f4212bf34e0ab160a4283','kp3','2018-03-13 16:18:33','2018-03-13 16:18:33',0),('4795c399689347efa1a8e325b471a773','kp1','2018-03-13 16:18:33','2018-03-13 16:18:33',0),('5579771973aa41a0936b964b0e1a7e62','kp2','2018-03-10 14:40:01','2018-03-10 14:40:01',1),('56192483f8454827b12c2993ed9e614e','kp1','2018-03-13 16:17:39','2018-03-13 16:17:39',0),('5c270e77706545159592f290b9b89797','kp4','2018-03-10 14:40:01','2018-03-10 14:40:01',0),('637906cdff2d47d9bfbc2d85c1448905','kp4','2018-03-11 21:57:13','2018-03-11 21:57:13',0),('679748698f954d97a1f4d945513ba91d','kp3','2018-03-13 16:18:07','2018-03-13 16:18:07',0),('68abe6c3a1d541a1b95ae80e2e56e76f','kp2','2018-03-13 16:17:39','2018-03-13 16:17:39',0),('694ad69f199148edafadd9937af5c972','kp2','2018-03-13 16:19:10','2018-03-13 16:19:10',0),('6a5ed55bb996421da18f630718d6dc44','kp3','2018-03-13 16:19:30','2018-03-13 16:19:30',0),('76fe11c2a7fd43cf8a7cb89fa7b75765','kp3','2018-03-13 16:17:07','2018-03-13 16:17:07',0),('82b972a9d26946479a70c5e4126532cd','kp1','2018-03-13 16:17:06','2018-03-13 16:17:06',0),('868f1594ceb845aa9ec3cc1931b7e8d0','kp1','2018-03-13 16:18:07','2018-03-13 16:18:07',0),('8d7f3480916b494daeed6408b03f6a2d','kp8','2018-03-10 16:03:16','2018-03-10 16:03:16',0),('8e88a03cd1f74165b5c6fc1090bc60d6','31','2018-03-11 20:18:34','2018-03-11 20:18:34',0),('92c5206388d341559b30533cca91d2f9','kp1','2018-03-13 16:20:13','2018-03-13 16:20:13',0),('9e68a4ee86eb40578eb6459855e68196','kp3','2018-03-13 16:17:39','2018-03-13 16:17:39',0),('a030ecee86c54dd89de96c5bf2418ea2','kp3','2018-03-10 16:02:36','2018-03-10 16:02:36',0),('a3c68fc631e04fc683039308d91f763d','kp2','2018-03-13 16:20:13','2018-03-13 16:20:13',0),('ae8fd565d51144b784c2c0d4418e8498','kp2','2018-03-13 16:18:33','2018-03-13 16:18:33',0),('aff50bc85ec345a1bc392c70353c4783','kp1','2018-03-10 14:40:01','2018-03-10 14:40:01',0),('b4031d396d0e4baaac0425ea5a42b127','kp2','2018-03-13 16:18:07','2018-03-13 16:18:07',0),('b9bf3112d13f4784867c2ac01e6aac5c','kp3','2018-03-10 14:40:01','2018-03-10 14:40:01',1),('c4c2753b816c47e2825ccb141bcf147e','kp3','2018-03-13 16:19:10','2018-03-13 16:19:10',0),('c5f5d619a2e84f2d8488449f4005c5c5','kp3','2018-03-11 21:57:13','2018-03-11 21:57:13',0),('cea13b9983cb4454bb8c4b9dfaa9c360','kp3','2018-03-13 16:20:13','2018-03-13 16:20:13',0),('d4034cd3f08b4fef8cc58c35fe248e3e','kp2','2018-03-11 21:57:12','2018-03-11 21:57:12',0),('e884525be8394fb1babccfd08d8a7575','kp5','2018-03-10 14:40:01','2018-03-10 14:40:01',0),('ea16b59a64c04ae39faa18eed4dcecab','kp1','2018-03-11 21:57:12','2018-03-11 21:57:12',0),('eac06b55267740399338182739a22e6b','kp5','2018-03-11 21:57:13','2018-03-11 21:57:13',0),('fb30b80f60764944966ed1f3d435686f','32','2018-03-11 20:18:34','2018-03-11 20:18:34',0),('fdec999f86fa4d429743ed1f74d62ab6','kp7','2018-03-10 14:40:01','2018-03-10 14:40:01',0);

#
# Structure for table "manager"
#

DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager` (
  `id` varchar(64) NOT NULL,
  `account` varchar(20) NOT NULL,
  `password` varchar(64) NOT NULL,
  `issuper` int(1) NOT NULL,
  `isDelete` int(1) NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updatetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "manager"
#

INSERT INTO `manager` VALUES ('08582fb1815b43608bbe75da47559b13','1','1',0,0,'2018-03-13 15:58:10','2018-03-13 15:58:10'),('1','1','1',1,0,'2018-02-27 20:00:00','2018-02-27 20:00:00'),('184c4f01015947559d691d4acb98f094','1','1',0,0,'2018-03-13 15:54:58','2018-03-13 15:54:58'),('199cf8075a3e4c1cb8f1109dacd5c660','1','1',0,0,'2018-03-13 15:57:54','2018-03-13 15:57:54'),('1e5aaf585eeb4ce9a38a105b4667cb3d','1','1',0,0,'2018-03-13 16:00:43','2018-03-13 16:00:43'),('203bd14856fd4a94a76ff90094128232','1','1',0,0,'2018-02-28 23:02:51','2018-02-28 23:02:51'),('37d0971b59ab4e138e9a705332f5fd55','1','1',0,0,'2018-03-13 16:01:11','2018-03-13 16:01:11'),('52ea5bc178cd4f3588ed8bf1afb50806','1','1',0,0,'2018-03-13 16:00:06','2018-03-13 16:00:06'),('5afe81c48f234ffe911cb83e52cb80a9','1','1',0,0,'2018-03-13 16:00:22','2018-03-13 16:00:22'),('6bb7ec1d883b442bb1833d74b8879f61','1','1',0,0,'2018-03-13 15:55:35','2018-03-13 15:55:35'),('75b12140f80e4581b6366efd3dd07084','1','1',0,0,'2018-03-13 16:01:41','2018-03-13 16:01:41'),('7e711d83afe2414dba39df3e5b0d44dd','1','1',0,0,'2018-03-13 16:02:34','2018-03-13 16:02:34'),('8ca0587f46a94eb79d87ad90d00a6d7f','1','1',0,0,'2018-03-13 16:02:18','2018-03-13 16:02:18'),('99ddd20cb5bb4dea9bb5cfa8981f9cb3','1','1',0,0,'2018-03-13 16:01:26','2018-03-13 16:01:26'),('9da0e02fc3744310a9676c2d3c12416f','1','1',0,0,'2018-03-13 16:00:57','2018-03-13 16:00:57'),('9ec90bdaf5734c69899a0edebdeeff0a','1','1',0,0,'2018-03-13 15:58:49','2018-03-13 15:58:49'),('a12941bbf07746bab396590f440484ec','1','1',0,0,'2018-03-13 15:55:15','2018-03-13 15:55:15'),('a8539f1caa7241998d4c1a7c4eb4c883','1','1',0,0,'2018-03-13 16:01:58','2018-03-13 16:01:58'),('c2c13e6f36c945bb8c9dca06a94c78bd','1','1',0,0,'2018-03-13 15:59:34','2018-03-13 15:59:34'),('ced6b6ffc8d94e8e8e4639c5b9df1682','1','1',0,0,'2018-03-13 15:54:40','2018-03-13 15:54:40'),('d82ca9fcd1f1479f92ce445866a1a0f2','1','1',0,0,'2018-03-13 15:58:29','2018-03-13 15:58:29'),('dfbbc52bfe3446c8bc8aa3dd1774470a','1','1',0,0,'2018-03-13 15:57:36','2018-03-13 15:57:36'),('dfe1238aca3247e4aa7709e247bc6674','1','1',0,0,'2018-03-13 15:59:49','2018-03-13 15:59:49'),('efa23e29fb6e476db0dfa2c700121534','1','1',0,0,'2018-03-13 15:57:03','2018-03-13 15:57:03'),('f9ca3ebceaed463893a36667af2a942a','1','1',0,0,'2018-03-13 15:54:23','2018-03-13 15:54:23'),('f9e8ada01c3b4b119f36b7870ea8ad24','1','1',0,0,'2018-03-13 15:57:20','2018-03-13 15:57:20'),('faf28e5640794bd8bbc7c782db6a6e96','1','1',0,0,'2018-03-13 16:02:51','2018-03-13 16:02:51');

#
# Structure for table "manager_course"
#

DROP TABLE IF EXISTS `manager_course`;
CREATE TABLE `manager_course` (
  `manager_id` varchar(64) NOT NULL,
  `course_id` varchar(64) NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updatetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `isDelete` int(1) NOT NULL,
  PRIMARY KEY (`manager_id`,`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "manager_course"
#

INSERT INTO `manager_course` VALUES ('08582fb1815b43608bbe75da47559b13','fc0b04794f0e471cbffef8020bd69c54','2018-03-13 15:58:10','2018-03-13 15:58:10',0),('184c4f01015947559d691d4acb98f094','ad0ecd04a5d042fdb9596222babe7ee2','2018-03-13 15:54:58','2018-03-13 15:54:58',0),('199cf8075a3e4c1cb8f1109dacd5c660','9037920cbd534c65b1f9579932ae3da0','2018-03-13 15:57:54','2018-03-13 15:57:54',0),('1e5aaf585eeb4ce9a38a105b4667cb3d','8102de1aef244aadb740136e8a0af5eb','2018-03-13 16:00:43','2018-03-13 16:00:43',0),('203bd14856fd4a94a76ff90094128232','35da96aaa8244304a87d8dc92dfae4be','2018-02-28 23:02:51','2018-02-28 23:02:51',0),('37d0971b59ab4e138e9a705332f5fd55','7162264310104dd180ab4f153c8e8423','2018-03-13 16:01:11','2018-03-13 16:01:11',0),('52ea5bc178cd4f3588ed8bf1afb50806','f5a9ac6d95064f73a065a80fa12bfd70','2018-03-13 16:00:06','2018-03-13 16:00:06',0),('5afe81c48f234ffe911cb83e52cb80a9','01d32f5338074deab8e63d8cc93ed339','2018-03-13 16:00:22','2018-03-13 16:00:22',0),('6bb7ec1d883b442bb1833d74b8879f61','3052508d71004c9dafd9139243eb5415','2018-03-13 15:55:35','2018-03-13 15:55:35',0),('75b12140f80e4581b6366efd3dd07084','9be4e8a927db4d6db0c78e51d21f94e9','2018-03-13 16:01:41','2018-03-13 16:01:41',0),('7e711d83afe2414dba39df3e5b0d44dd','5175a34d7a42458996161d04af1677e6','2018-03-13 16:02:34','2018-03-13 16:02:34',0),('8ca0587f46a94eb79d87ad90d00a6d7f','05d6e3bc096b4cb7a7b01c4be282b793','2018-03-13 16:02:18','2018-03-13 16:02:18',0),('99ddd20cb5bb4dea9bb5cfa8981f9cb3','e9537f4f6b62488c92627a3d99bb2360','2018-03-13 16:01:26','2018-03-13 16:01:26',0),('9da0e02fc3744310a9676c2d3c12416f','64d064de406e4dc9a68ecca5b286dfa4','2018-03-13 16:00:57','2018-03-13 16:00:57',0),('9ec90bdaf5734c69899a0edebdeeff0a','28b8a7bfd46d4daeab0e0e6fdeeed540','2018-03-13 15:58:49','2018-03-13 15:58:49',0),('a12941bbf07746bab396590f440484ec','ec7286fd872c4367ad0b831e4b138ca7','2018-03-13 15:55:15','2018-03-13 15:55:15',0),('a8539f1caa7241998d4c1a7c4eb4c883','2dd3a7b0a4cd4bd2b0d5f54d6187e1cb','2018-03-13 16:01:58','2018-03-13 16:01:58',0),('c2c13e6f36c945bb8c9dca06a94c78bd','3dfef93d8d53401c97739e6a12dd94f2','2018-03-13 15:59:34','2018-03-13 15:59:34',0),('ced6b6ffc8d94e8e8e4639c5b9df1682','854f2393b78542afa358dbd785fa99f5','2018-03-13 15:54:40','2018-03-13 15:54:40',0),('d82ca9fcd1f1479f92ce445866a1a0f2','95a0f9f6cc394cfea2409e6232807162','2018-03-13 15:58:29','2018-03-13 15:58:29',0),('dfbbc52bfe3446c8bc8aa3dd1774470a','4ee0af14b0784ad0bcc88bdd810a7f9a','2018-03-13 15:57:36','2018-03-13 15:57:36',0),('dfe1238aca3247e4aa7709e247bc6674','5e29e06a542a442689e1d6f40c11f5e0','2018-03-13 15:59:49','2018-03-13 15:59:49',0),('efa23e29fb6e476db0dfa2c700121534','447d2ff96b4545ea8e80d6cb20ba0e89','2018-03-13 15:57:03','2018-03-13 15:57:03',0),('f9ca3ebceaed463893a36667af2a942a','3446733295a74b3887c16fa361b77e5e','2018-03-13 15:54:23','2018-03-13 15:54:23',0),('f9e8ada01c3b4b119f36b7870ea8ad24','b1dbb521205b4ea88cd170893e0f29e2','2018-03-13 15:57:20','2018-03-13 15:57:20',0),('faf28e5640794bd8bbc7c782db6a6e96','f59768fc38a749d6b68040af9ee4cc5e','2018-03-13 16:02:51','2018-03-13 16:02:51',0);

#
# Structure for table "office"
#

DROP TABLE IF EXISTS `office`;
CREATE TABLE `office` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `description` varchar(256) DEFAULT NULL,
  `view_url` varchar(128) NOT NULL,
  `file_url` varchar(128) NOT NULL,
  `cover` varchar(128) DEFAULT NULL,
  `type` varchar(8) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

#
# Data for table "office"
#

INSERT INTO `office` VALUES (2,'2','2','2','2','2','2','2018-03-10 20:34:25'),(3,'1-2015213738-朱汉卿.docx',NULL,'/view/20180311203721345.pdf','/20180311203721345.docx','/pic/20180311203727425.png','docx','2018-03-11 20:37:29'),(4,'1-2015213738-朱汉卿.docx',NULL,'/view/20180311203829859.pdf','/20180311203829859.docx','/pic/20180311203830774.png','docx','2018-03-11 20:38:30'),(6,'1-2015213738-朱汉卿.docx',NULL,'/view/20180311204220535.pdf','/20180311204220535.docx','/pic/20180311204221636.png','docx','2018-03-11 20:42:21'),(7,'2-2015213738-朱汉卿.docx',NULL,'/view/20180311213922208.pdf','/20180311213922208.docx','/pic/20180311213923724.png','docx','2018-03-11 21:39:24'),(8,'3-2015213738-朱汉卿.docx',NULL,'/view/20180311215236305.pdf','/20180311215236305.docx','/pic/20180311215237362.png','docx','2018-03-11 21:52:37'),(9,'1-2015213738-朱汉卿.docx',NULL,'/view/20180311215649500.pdf','/20180311215649500.docx','/pic/20180311215650622.png','docx','2018-03-11 21:56:50');

#
# Structure for table "picture"
#

DROP TABLE IF EXISTS `picture`;
CREATE TABLE `picture` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(128) NOT NULL,
  `url` varchar(128) NOT NULL,
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isDelete` tinyint(3) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

#
# Data for table "picture"
#

INSERT INTO `picture` VALUES (1,'test','http://www.baidu.com','2018-03-03 20:48:21',1),(2,'IMG20151121205949.jpg','/pic/ajc3bddehfe16bjdxt5z.jpg','2018-03-10 09:13:34',1),(3,'IMG20151121205949.jpg','/pic/d7ycs94nn3fb1npdhj4s.jpg','2018-03-10 09:41:26',1),(4,'IMG20151121205949.jpg','/pic/dya7dftn2x393xcfey92.jpg','2018-03-10 09:44:09',1),(5,'IMG20160122112212.jpg','/pic/164yt1xsxcns2tschdap.jpg','2018-03-10 09:44:21',1),(6,'IMG20160122112212.jpg','/pic/m35d5hnyemzf9agex83h.jpg','2018-03-10 09:47:21',1),(7,'IMG20160122112613.jpg','/pic/dh7sfyf7e1375aem99xg.jpg','2018-03-10 09:49:30',1),(8,'IMG20151121205949.jpg','/pic/4yn1x3sby81zffgspdef.jpg','2018-03-10 10:08:24',1),(9,'IMG20160806091045.jpg','/pic/tad3zy8a4msmh8mdseyg.jpg','2018-03-10 10:08:40',1),(10,'IMG20160127084758.jpg','/pic/11cf62afnfxh8f2eenmy.jpg','2018-03-10 10:09:02',1),(11,'IMG20151121205949.jpg','/pic/xj72gdjnnx4z1cxp1e4p.jpg','2018-03-10 10:10:38',1),(12,'IMG20160122114511.jpg','/pic/z93943d5fx7j3jjcg1ex.jpg','2018-03-10 10:10:52',1),(13,'IMG20151121205949.jpg','/pic/3mz6behnzxp5bpaczdza.jpg','2018-03-10 10:18:37',1),(14,'IMG20151124205514.jpg','/pic/tyspdbhtndddcdbjhd7h.jpg','2018-03-10 10:22:01',1),(15,'IMG20160501112526.jpg','/pic/3542fjx6faxpbz9mjmep.jpg','2018-03-10 10:47:02',0),(16,'IMG20160501112526.jpg','/pic/54y3d1b93jypen6aanz9.jpg','2018-03-10 10:50:08',0),(17,'IMG20160127122530.jpg','/pic/scxt1hdf9576s41b5tap.jpg','2018-03-10 10:54:38',1),(18,'IMG20160122112613.jpg','/pic/94pa2bxgbp59cbjbz4f6.jpg','2018-03-10 11:17:05',0),(19,'IMG20160122112613.jpg','/pic/nmgdf6xgjx3z1pfa4jcx.jpg','2018-03-10 11:19:36',0),(20,'IMG20160122112613.jpg','/pic/pjza164p3t4cz4x1j7j8.jpg','2018-03-10 11:22:56',0),(21,'IMG20160122112212.jpg','/pic/975h7y4ttx5cy1be5fp5.jpg','2018-03-10 11:58:02',0),(22,'2n8phng9yh8gt3gx46cj.jpg','/pic/f853haz8jgx3z67p43j2.jpg','2018-03-11 21:57:28',0),(23,'2n8phng9yh8gt3gx46cj.jpg','/pic/gsehx8tj5tssjjd8m293.jpg','2018-03-13 16:03:54',0),(24,'2n8phng9yh8gt3gx46cj.jpg','/pic/fnnmdxmhnt8164xaf5ys.jpg','2018-03-13 16:04:21',0),(25,'2n8phng9yh8gt3gx46cj.jpg','/pic/6jtcbbahhjh3ymh9gz3t.jpg','2018-03-13 16:04:54',0),(26,'2n8phng9yh8gt3gx46cj.jpg','/pic/4pxebdfa1t3y5ahj8bjp.jpg','2018-03-13 16:05:20',0),(27,'2n8phng9yh8gt3gx46cj.jpg','/pic/eenp67n8bsah3b62ff98.jpg','2018-03-13 16:06:38',0),(28,'7084_480.jpg','/pic/7bza9ptjmtncxgp4gtn5.jpg','2018-03-13 16:15:52',0),(29,'7bza9ptjmtncxgp4gtn5.jpg','/pic/3z85apb6xyz9t9jcmj7y.jpg','2018-03-13 16:36:36',0),(30,'3z85apb6xyz9t9jcmj7y.jpg','/pic/hxafgd5yycp4n623xsem.jpg','2018-03-13 16:36:49',0),(31,'3z85apb6xyz9t9jcmj7y.jpg','/pic/cyzdd61p26y69yhcdzj5.jpg','2018-03-13 16:37:01',0),(32,'3z85apb6xyz9t9jcmj7y.jpg','/pic/8he559mmgncnctcy817n.jpg','2018-03-13 16:37:13',0),(33,'3z85apb6xyz9t9jcmj7y.jpg','/pic/2p7mgjbct1zefs5zzhe6.jpg','2018-03-13 16:37:27',0),(34,'3z85apb6xyz9t9jcmj7y.jpg','/pic/86hcnj9cj2bd825996yx.jpg','2018-03-13 16:37:42',0),(35,'2p7mgjbct1zefs5zzhe6.jpg','/pic/4cdsg8xgdsbnzp4za144.jpg','2018-03-13 16:37:57',0),(36,'3z85apb6xyz9t9jcmj7y.jpg','/pic/569tzxa8yb23d87syt4m.jpg','2018-03-13 16:38:08',0),(37,'3z85apb6xyz9t9jcmj7y.jpg','/pic/hhy1z7899y7xmjt2689x.jpg','2018-03-13 16:38:35',0),(38,'3z85apb6xyz9t9jcmj7y.jpg','/pic/3dc1ctt2ta58xxzyhayf.jpg','2018-03-13 16:38:48',0),(39,'3dc1ctt2ta58xxzyhayf.jpg','/pic/z871y42he2gng9f47zxz.jpg','2018-03-13 16:39:01',0),(40,'3dc1ctt2ta58xxzyhayf.jpg','/pic/mf2635fyzhmndcjat4s7.jpg','2018-03-13 16:39:14',0),(41,'3dc1ctt2ta58xxzyhayf.jpg','/pic/cp3jz1agzcnhffz1fhmx.jpg','2018-03-13 16:39:25',0),(42,'3dc1ctt2ta58xxzyhayf.jpg','/pic/ccz7fb7phgj3z8537ec8.jpg','2018-03-13 16:39:38',0),(43,'3dc1ctt2ta58xxzyhayf.jpg','/pic/2mne76h95ezcyef82ysz.jpg','2018-03-13 16:39:51',0),(44,'3dc1ctt2ta58xxzyhayf.jpg','/pic/djjzgf5f6p5hep9h5b6a.jpg','2018-03-13 16:40:02',0),(45,'2p7mgjbct1zefs5zzhe6.jpg','/pic/b97b74f64xeste49ybse.jpg','2018-03-13 16:40:13',0),(46,'2mne76h95ezcyef82ysz.jpg','/pic/2md2bngmy94g36x7c98h.jpg','2018-03-13 16:40:26',0),(47,'2md2bngmy94g36x7c98h.jpg','/pic/765sb9nh6ydm85z11619.jpg','2018-03-13 16:40:37',0),(48,'2p7mgjbct1zefs5zzhe6.jpg','/pic/3dcznzpt6hf3zz3dx9jt.jpg','2018-03-13 16:41:14',0),(49,'2p7mgjbct1zefs5zzhe6.jpg','/pic/5txsxm9na2y2n6japy5d.jpg','2018-03-13 16:41:25',0),(50,'2mne76h95ezcyef82ysz.jpg','/pic/bcfaam88s1ngt9yc1gjh.jpg','2018-03-13 16:41:36',0),(51,'2p7mgjbct1zefs5zzhe6.jpg','/pic/eznaf8j65hfde8jnct1b.jpg','2018-03-13 16:41:46',0),(52,'2p7mgjbct1zefs5zzhe6.jpg','/pic/mz7d73561eapxjz4m56y.jpg','2018-03-13 16:41:56',0);

#
# Structure for table "reply"
#

DROP TABLE IF EXISTS `reply`;
CREATE TABLE `reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `comment_id` int(11) NOT NULL,
  `student_id` varchar(33) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_delete` smallint(6) DEFAULT '0',
  `reply` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `reply` (`reply`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "reply"
#


#
# Structure for table "student"
#

DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` varchar(33) NOT NULL,
  `account` varchar(10) DEFAULT NULL,
  `password` varchar(64) NOT NULL,
  `name` varchar(32) NOT NULL,
  `sex` tinyint(4) NOT NULL DEFAULT '1',
  `phone` char(11) DEFAULT NULL,
  `email` varchar(64) NOT NULL,
  `clazz` varchar(64) DEFAULT NULL,
  `major` varchar(64) DEFAULT NULL,
  `school` varchar(64) DEFAULT NULL,
  `img` varchar(128) DEFAULT 'http://image.chenliangliang.xin/people',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_delete` tinyint(4) DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `last_login` timestamp NULL DEFAULT NULL,
  `introduction` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `email` (`email`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "student"
#


#
# Structure for table "student_course"
#

DROP TABLE IF EXISTS `student_course`;
CREATE TABLE `student_course` (
  `student_id` varchar(33) NOT NULL,
  `course_id` varchar(33) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_delete` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`student_id`,`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "student_course"
#


#
# Structure for table "teacher"
#

DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `id` varchar(64) NOT NULL,
  `number` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `sex` varchar(4) NOT NULL,
  `position` varchar(40) DEFAULT NULL,
  `personIntroduction` text,
  `createtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updatetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `isDelete` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "teacher"
#

INSERT INTO `teacher` VALUES ('0ed004f0a9234317b0254af420c81449','Teacher5','Teacher5','男','教授','；开始建行','2018-03-13 16:05:22','2018-03-13 16:05:22',0),('1c456a498ecf4fa3b91c183625bba983','Teacher1','Teacher1','man','教授','1111111','2018-03-13 16:03:58','2018-03-13 16:03:58',0),('2b0beb434777475088f57562e33e9f9c','T0000000001','天天','男','教授','啦啦啦啦啦啦啦','2018-03-10 10:50:24','2018-03-10 10:50:24',0),('2c35fbde2c2d4819a7c43bef05d016b1','Teacher3','Teacher3','男','教授','坎坎坷坷扩扩','2018-03-13 16:04:56','2018-03-13 16:04:56',0),('5c7309cfe934430eb5a3ce43dcb1065b','Teacher4','Teacher4','man','教授','见客户金刚萨埵','2018-03-13 16:06:41','2018-03-13 16:06:41',0),('65c3694edcb645b98b023d52db02cf99','','','','','','2018-03-10 11:58:19','2018-03-10 11:58:19',1),('67088f0926d244b7b77951da93d62672','1','','','','','2018-03-10 11:01:17','2018-03-10 11:01:17',1),('7cbdb365b5e145ea98dfdcd5f84182ac','T01','TTest01','男','教授','略','2018-02-28 23:03:22','2018-03-10 12:12:28',0),('8cf5572577bb4f3589cde68e98b5f098','Teacher2','Teacher2','男','教授','1111111','2018-03-13 16:04:24','2018-03-13 16:04:24',0),('de442a72400745e1989f08949e0b0862','','','','','','2018-03-10 10:54:48','2018-03-10 10:54:48',1);

#
# Structure for table "teacher_course"
#

DROP TABLE IF EXISTS `teacher_course`;
CREATE TABLE `teacher_course` (
  `teacher_id` varchar(64) NOT NULL,
  `course_id` varchar(64) NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updatetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `isDelete` int(1) NOT NULL,
  PRIMARY KEY (`teacher_id`,`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "teacher_course"
#

INSERT INTO `teacher_course` VALUES ('0ed004f0a9234317b0254af420c81449','05d6e3bc096b4cb7a7b01c4be282b793','2018-03-13 16:07:00','2018-03-13 16:07:00',0),('0ed004f0a9234317b0254af420c81449','2dd3a7b0a4cd4bd2b0d5f54d6187e1cb','2018-03-13 16:07:09','2018-03-13 16:07:09',0),('0ed004f0a9234317b0254af420c81449','5175a34d7a42458996161d04af1677e6','2018-03-13 16:11:03','2018-03-13 16:11:03',0),('0ed004f0a9234317b0254af420c81449','9be4e8a927db4d6db0c78e51d21f94e9','2018-03-13 16:10:47','2018-03-13 16:10:47',0),('0ed004f0a9234317b0254af420c81449','f59768fc38a749d6b68040af9ee4cc5e','2018-03-13 16:12:10','2018-03-13 16:12:10',0),('1c456a498ecf4fa3b91c183625bba983','3052508d71004c9dafd9139243eb5415','2018-03-13 16:07:25','2018-03-13 16:07:25',0),('1c456a498ecf4fa3b91c183625bba983','3446733295a74b3887c16fa361b77e5e','2018-03-13 16:07:50','2018-03-13 16:07:50',0),('1c456a498ecf4fa3b91c183625bba983','35da96aaa8244304a87d8dc92dfae4be','2018-03-13 16:07:41','2018-03-13 16:07:41',0),('1c456a498ecf4fa3b91c183625bba983','854f2393b78542afa358dbd785fa99f5','2018-03-13 16:10:56','2018-03-13 16:10:56',0),('1c456a498ecf4fa3b91c183625bba983','ad0ecd04a5d042fdb9596222babe7ee2','2018-03-13 16:10:45','2018-03-13 16:10:45',0),('1c456a498ecf4fa3b91c183625bba983','ec7286fd872c4367ad0b831e4b138ca7','2018-03-13 16:12:05','2018-03-13 16:12:05',0),('2c35fbde2c2d4819a7c43bef05d016b1','28b8a7bfd46d4daeab0e0e6fdeeed540','2018-03-13 16:07:13','2018-03-13 16:07:13',0),('2c35fbde2c2d4819a7c43bef05d016b1','3dfef93d8d53401c97739e6a12dd94f2','2018-03-13 16:08:09','2018-03-13 16:08:09',0),('2c35fbde2c2d4819a7c43bef05d016b1','5e29e06a542a442689e1d6f40c11f5e0','2018-03-13 16:11:02','2018-03-13 16:11:02',0),('2c35fbde2c2d4819a7c43bef05d016b1','95a0f9f6cc394cfea2409e6232807162','2018-03-13 16:10:49','2018-03-13 16:10:49',0),('2c35fbde2c2d4819a7c43bef05d016b1','f5a9ac6d95064f73a065a80fa12bfd70','2018-03-13 16:12:42','2018-03-13 16:12:42',0),('5c7309cfe934430eb5a3ce43dcb1065b','01d32f5338074deab8e63d8cc93ed339','2018-03-13 16:06:52','2018-03-13 16:06:52',0),('5c7309cfe934430eb5a3ce43dcb1065b','64d064de406e4dc9a68ecca5b286dfa4','2018-03-13 16:11:01','2018-03-13 16:11:01',0),('5c7309cfe934430eb5a3ce43dcb1065b','7162264310104dd180ab4f153c8e8423','2018-03-13 16:10:59','2018-03-13 16:10:59',0),('5c7309cfe934430eb5a3ce43dcb1065b','8102de1aef244aadb740136e8a0af5eb','2018-03-13 16:10:57','2018-03-13 16:10:57',0),('5c7309cfe934430eb5a3ce43dcb1065b','e9537f4f6b62488c92627a3d99bb2360','2018-03-13 16:12:00','2018-03-13 16:12:00',0),('7cbdb365b5e145ea98dfdcd5f84182ac','35da96aaa8244304a87d8dc92dfae4be','2018-02-28 23:03:37','2018-02-28 23:03:37',1),('8cf5572577bb4f3589cde68e98b5f098','447d2ff96b4545ea8e80d6cb20ba0e89','2018-03-13 16:08:23','2018-03-13 16:08:23',0),('8cf5572577bb4f3589cde68e98b5f098','4ee0af14b0784ad0bcc88bdd810a7f9a','2018-03-13 16:08:33','2018-03-13 16:08:33',0),('8cf5572577bb4f3589cde68e98b5f098','9037920cbd534c65b1f9579932ae3da0','2018-03-13 16:10:54','2018-03-13 16:10:54',0),('8cf5572577bb4f3589cde68e98b5f098','b1dbb521205b4ea88cd170893e0f29e2','2018-03-13 16:11:57','2018-03-13 16:11:57',0),('8cf5572577bb4f3589cde68e98b5f098','fc0b04794f0e471cbffef8020bd69c54','2018-03-13 16:12:51','2018-03-13 16:12:51',0);

#
# Structure for table "teacher_picture"
#

DROP TABLE IF EXISTS `teacher_picture`;
CREATE TABLE `teacher_picture` (
  `teacher_id` varchar(64) NOT NULL,
  `picture_id` varchar(64) NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updatetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `isDelete` int(1) NOT NULL,
  PRIMARY KEY (`teacher_id`,`picture_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "teacher_picture"
#

INSERT INTO `teacher_picture` VALUES ('0ed004f0a9234317b0254af420c81449','26','2018-03-13 16:05:22','2018-03-13 16:05:22',0),('1c456a498ecf4fa3b91c183625bba983','23','2018-03-13 16:03:58','2018-03-13 16:03:58',0),('2b0beb434777475088f57562e33e9f9c','16','2018-03-10 10:50:24','2018-03-10 10:50:24',0),('2c35fbde2c2d4819a7c43bef05d016b1','25','2018-03-13 16:04:56','2018-03-13 16:04:56',0),('5c7309cfe934430eb5a3ce43dcb1065b','27','2018-03-13 16:06:41','2018-03-13 16:06:41',0),('7cbdb365b5e145ea98dfdcd5f84182ac','20','2018-03-10 11:22:56','2018-03-10 11:22:56',0),('8cf5572577bb4f3589cde68e98b5f098','24','2018-03-13 16:04:24','2018-03-13 16:04:24',0),('de442a72400745e1989f08949e0b0862','17','2018-03-10 10:54:48','2018-03-10 10:54:48',1),('de442a72400745e1989f08949e0b0862','21','2018-03-10 11:58:02','2018-03-10 11:58:02',1);

#
# Structure for table "unit"
#

DROP TABLE IF EXISTS `unit`;
CREATE TABLE `unit` (
  `id` varchar(64) NOT NULL,
  `number` varchar(9) NOT NULL,
  `name` varchar(40) NOT NULL,
  `content` text,
  `createtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updatetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `isDelete` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "unit"
#

INSERT INTO `unit` VALUES ('2829dfa6ecf1491f8acb24f536bf660c','第3课','unit3',NULL,'2018-03-11 20:18:19','2018-03-11 20:18:19',1),('32f316a9c9de4db19cc30e34b2d3d9f9','第2课','unit2','ssssssssssssssssssssssssssssssssssss','2018-03-13 16:17:20','2018-03-13 16:17:25',0),('42c67e777e1549dba3193080b233b7e8','第2课','unit2','bbbbbbbbbbbbbbbbbbbbbbbbbbb','2018-03-13 16:19:19','2018-03-13 16:19:22',0),('52abe90eb481433a8d61738438037f0d','第1章','1',NULL,'2018-03-11 13:44:21','2018-03-11 13:44:21',1),('618e251eeeb8431d9a7e22946d5ef04c','第2课','unit2','','2018-03-11 13:53:54','2018-03-12 13:51:02',0),('67e36c88c4f64abe9bc4236e87c818c3','第1课','unit1','','2018-03-12 13:55:28','2018-03-12 13:55:31',0),('71bad896a37c4d76a395811086a3f53d','第4课','unit4','ssssssssssssssssssssssssssssssss','2018-03-13 16:18:16','2018-03-13 16:18:20',0),('83c7fc6d94ef4ea3a1fa510faceec22a','第1课','unit1','sssssssssssssssssssssssssssss','2018-03-13 16:20:00','2018-03-13 16:20:04',0),('8554e7ef833c41629d65d2bc093c4a0b','第1课','unit1','bbbbbbbbbbbbbbbbbbbbbbbb','2018-03-13 16:18:58','2018-03-13 16:19:01',0),('b4440ce749b74a1cb85cba179fa1de85','第1课','unit1','lalallalallallalalallalllllllllllllllllllllllllll','2018-03-13 16:16:23','2018-03-13 16:16:32',0),('c4141f83fe6e4021b344c412bd2ac52b','第1课','unit1',NULL,'2018-03-01 22:34:06','2018-03-01 22:34:06',1),('cd639120c3f644f3883f4b7cf86f68a7','第1课','unit1','水电费','2018-03-11 21:56:39','2018-03-11 21:56:43',0),('e7f79f775ce54037b4aec0e901989672','第1课','unit1',NULL,'2018-03-03 16:44:05','2018-03-03 16:44:05',1),('eafa71cce8dd492681a544e7aa59da4a','第3课','unit3','sssssssssssssssssssssssssssss','2018-03-13 16:17:53','2018-03-13 16:17:57',0),('ffd6646195d3430d8ab43544e86b7c9d','第1课','unit1','<p>但是丰东股份回归炬华科技</p>','2018-03-01 22:34:48','2018-03-12 13:49:11',0);

#
# Structure for table "unit_knowledgepoint"
#

DROP TABLE IF EXISTS `unit_knowledgepoint`;
CREATE TABLE `unit_knowledgepoint` (
  `unit_id` varchar(64) NOT NULL,
  `knowledgepoint_id` varchar(64) NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updatetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `isDelete` int(1) NOT NULL,
  PRIMARY KEY (`unit_id`,`knowledgepoint_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "unit_knowledgepoint"
#

INSERT INTO `unit_knowledgepoint` VALUES ('2829dfa6ecf1491f8acb24f536bf660c','3851eacdf20344a59dae22cf95ad7aeb','2018-03-11 20:18:34','2018-03-11 20:18:34',0),('2829dfa6ecf1491f8acb24f536bf660c','8e88a03cd1f74165b5c6fc1090bc60d6','2018-03-11 20:18:34','2018-03-11 20:18:34',0),('2829dfa6ecf1491f8acb24f536bf660c','fb30b80f60764944966ed1f3d435686f','2018-03-11 20:18:34','2018-03-11 20:18:34',0),('32f316a9c9de4db19cc30e34b2d3d9f9','56192483f8454827b12c2993ed9e614e','2018-03-13 16:17:39','2018-03-13 16:17:39',0),('32f316a9c9de4db19cc30e34b2d3d9f9','68abe6c3a1d541a1b95ae80e2e56e76f','2018-03-13 16:17:39','2018-03-13 16:17:39',0),('32f316a9c9de4db19cc30e34b2d3d9f9','9e68a4ee86eb40578eb6459855e68196','2018-03-13 16:17:40','2018-03-13 16:17:40',0),('42c67e777e1549dba3193080b233b7e8','3038d272aace4723b956d4819ed7cce4','2018-03-13 16:19:30','2018-03-13 16:19:30',0),('42c67e777e1549dba3193080b233b7e8','426a9b62d72043ac9e23162a6eb959cb','2018-03-13 16:19:30','2018-03-13 16:19:30',0),('42c67e777e1549dba3193080b233b7e8','6a5ed55bb996421da18f630718d6dc44','2018-03-13 16:19:30','2018-03-13 16:19:30',0),('71bad896a37c4d76a395811086a3f53d','46a107ba200f4212bf34e0ab160a4283','2018-03-13 16:18:33','2018-03-13 16:18:33',0),('71bad896a37c4d76a395811086a3f53d','4795c399689347efa1a8e325b471a773','2018-03-13 16:18:33','2018-03-13 16:18:33',0),('71bad896a37c4d76a395811086a3f53d','ae8fd565d51144b784c2c0d4418e8498','2018-03-13 16:18:33','2018-03-13 16:18:33',0),('83c7fc6d94ef4ea3a1fa510faceec22a','92c5206388d341559b30533cca91d2f9','2018-03-13 16:20:13','2018-03-13 16:20:13',0),('83c7fc6d94ef4ea3a1fa510faceec22a','a3c68fc631e04fc683039308d91f763d','2018-03-13 16:20:13','2018-03-13 16:20:13',0),('83c7fc6d94ef4ea3a1fa510faceec22a','cea13b9983cb4454bb8c4b9dfaa9c360','2018-03-13 16:20:13','2018-03-13 16:20:13',0),('8554e7ef833c41629d65d2bc093c4a0b','0c9cea7649c2443190f138d791f2c8be','2018-03-13 16:19:10','2018-03-13 16:19:10',0),('8554e7ef833c41629d65d2bc093c4a0b','694ad69f199148edafadd9937af5c972','2018-03-13 16:19:10','2018-03-13 16:19:10',0),('8554e7ef833c41629d65d2bc093c4a0b','c4c2753b816c47e2825ccb141bcf147e','2018-03-13 16:19:10','2018-03-13 16:19:10',0),('b4440ce749b74a1cb85cba179fa1de85','2ffd4a482f694102aa4b1645e9cf1bad','2018-03-13 16:17:07','2018-03-13 16:17:07',0),('b4440ce749b74a1cb85cba179fa1de85','3805a63bd136412c8325ae6e274d54dc','2018-03-13 16:17:07','2018-03-13 16:17:07',0),('b4440ce749b74a1cb85cba179fa1de85','76fe11c2a7fd43cf8a7cb89fa7b75765','2018-03-13 16:17:07','2018-03-13 16:17:07',0),('b4440ce749b74a1cb85cba179fa1de85','82b972a9d26946479a70c5e4126532cd','2018-03-13 16:17:07','2018-03-13 16:17:07',0),('cd639120c3f644f3883f4b7cf86f68a7','637906cdff2d47d9bfbc2d85c1448905','2018-03-11 21:57:13','2018-03-11 21:57:13',0),('cd639120c3f644f3883f4b7cf86f68a7','c5f5d619a2e84f2d8488449f4005c5c5','2018-03-11 21:57:13','2018-03-11 21:57:13',0),('cd639120c3f644f3883f4b7cf86f68a7','d4034cd3f08b4fef8cc58c35fe248e3e','2018-03-11 21:57:12','2018-03-11 21:57:12',0),('cd639120c3f644f3883f4b7cf86f68a7','ea16b59a64c04ae39faa18eed4dcecab','2018-03-11 21:57:12','2018-03-11 21:57:12',0),('cd639120c3f644f3883f4b7cf86f68a7','eac06b55267740399338182739a22e6b','2018-03-11 21:57:13','2018-03-11 21:57:13',0),('e7f79f775ce54037b4aec0e901989672','1','2018-03-04 20:42:25','2018-03-04 20:42:25',0),('eafa71cce8dd492681a544e7aa59da4a','679748698f954d97a1f4d945513ba91d','2018-03-13 16:18:07','2018-03-13 16:18:07',0),('eafa71cce8dd492681a544e7aa59da4a','868f1594ceb845aa9ec3cc1931b7e8d0','2018-03-13 16:18:07','2018-03-13 16:18:07',0),('eafa71cce8dd492681a544e7aa59da4a','b4031d396d0e4baaac0425ea5a42b127','2018-03-13 16:18:07','2018-03-13 16:18:07',0),('ffd6646195d3430d8ab43544e86b7c9d','151a0080ba24423cb347cac7991c864c','2018-03-10 14:40:01','2018-03-10 14:40:01',0),('ffd6646195d3430d8ab43544e86b7c9d','2','2018-03-04 20:42:25','2018-03-04 20:42:25',1),('ffd6646195d3430d8ab43544e86b7c9d','5579771973aa41a0936b964b0e1a7e62','2018-03-10 14:40:01','2018-03-10 14:40:01',1),('ffd6646195d3430d8ab43544e86b7c9d','5c270e77706545159592f290b9b89797','2018-03-10 14:40:01','2018-03-10 14:40:01',0),('ffd6646195d3430d8ab43544e86b7c9d','8d7f3480916b494daeed6408b03f6a2d','2018-03-10 16:03:17','2018-03-10 16:03:17',0),('ffd6646195d3430d8ab43544e86b7c9d','a030ecee86c54dd89de96c5bf2418ea2','2018-03-10 16:02:36','2018-03-10 16:02:36',0),('ffd6646195d3430d8ab43544e86b7c9d','aff50bc85ec345a1bc392c70353c4783','2018-03-10 14:40:01','2018-03-10 14:40:01',0),('ffd6646195d3430d8ab43544e86b7c9d','b9bf3112d13f4784867c2ac01e6aac5c','2018-03-10 14:40:01','2018-03-10 14:40:01',1),('ffd6646195d3430d8ab43544e86b7c9d','e884525be8394fb1babccfd08d8a7575','2018-03-10 14:40:01','2018-03-10 14:40:01',0),('ffd6646195d3430d8ab43544e86b7c9d','fdec999f86fa4d429743ed1f74d62ab6','2018-03-10 14:40:01','2018-03-10 14:40:01',0);

#
# Structure for table "unit_office"
#

DROP TABLE IF EXISTS `unit_office`;
CREATE TABLE `unit_office` (
  `unit_id` varchar(64) NOT NULL,
  `office_id` varchar(64) NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `isDelete` smallint(6) DEFAULT '0',
  PRIMARY KEY (`unit_id`,`office_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "unit_office"
#

INSERT INTO `unit_office` VALUES ('52abe90eb481433a8d61738438037f0d','8','2018-03-11 21:52:37','2018-03-11 21:52:37',0),('cd639120c3f644f3883f4b7cf86f68a7','9','2018-03-11 21:56:50','2018-03-11 21:56:50',0),('e7f79f775ce54037b4aec0e901989672','2','2018-03-03 16:54:47','2018-03-03 16:54:47',0),('undefined','6','2018-03-11 20:42:21','2018-03-11 20:42:21',0);

#
# Structure for table "unit_video"
#

DROP TABLE IF EXISTS `unit_video`;
CREATE TABLE `unit_video` (
  `unit_id` varchar(64) NOT NULL,
  `video_id` varchar(64) NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updatetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `isDelete` int(1) NOT NULL,
  PRIMARY KEY (`unit_id`,`video_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "unit_video"
#


#
# Structure for table "video"
#

DROP TABLE IF EXISTS `video`;
CREATE TABLE `video` (
  `id` bigint(20) NOT NULL,
  `chinese_description` varchar(256) DEFAULT NULL,
  `url` varchar(128) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_delete` smallint(6) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "video"
#


#
# Structure for table "video_picture"
#

DROP TABLE IF EXISTS `video_picture`;
CREATE TABLE `video_picture` (
  `video_id` varchar(64) NOT NULL DEFAULT '',
  `picture_id` varchar(64) NOT NULL DEFAULT '',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updatetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `isDelete` int(1) DEFAULT '0',
  PRIMARY KEY (`video_id`,`picture_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "video_picture"
#

INSERT INTO `video_picture` VALUES ('1','23','2018-03-03 16:54:47','2018-03-03 16:54:47',0);
