# Host: localhost  (Version: 5.5.15)
# Date: 2018-01-31 17:13:44
# Generator: MySQL-Front 5.3  (Build 4.269)

/*!40101 SET NAMES gb2312 */;

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


#
# Structure for table "chapter_comment"
#

DROP TABLE IF EXISTS `chapter_comment`;
CREATE TABLE `chapter_comment` (
  `chapter_id` varchar(33) NOT NULL,
  `comment_id` bigint(20) NOT NULL,
  `is_delete` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`chapter_id`,`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

#
# Data for table "chapter_comment"
#


#
# Structure for table "chapter_exercise"
#

DROP TABLE IF EXISTS `chapter_exercise`;
CREATE TABLE `chapter_exercise` (
  `chapter_id` varchar(64) NOT NULL,
  `exercise_id` varchar(64) NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updatetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `isDelete` int(1) NOT NULL,
  PRIMARY KEY (`chapter_id`,`exercise_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "chapter_exercise"
#


#
# Structure for table "chapter_homework"
#

DROP TABLE IF EXISTS `chapter_homework`;
CREATE TABLE `chapter_homework` (
  `chapter_id` varchar(64) NOT NULL,
  `homework_id` varchar(64) NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updatetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `isDelete` int(1) NOT NULL,
  PRIMARY KEY (`chapter_id`,`homework_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "chapter_homework"
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


#
# Structure for table "course_inform"
#

DROP TABLE IF EXISTS `course_inform`;
CREATE TABLE `course_inform` (
  `course_id` varchar(64) NOT NULL,
  `inform_id` varchar(64) NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updatetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `isDelete` int(1) NOT NULL,
  PRIMARY KEY (`course_id`,`inform_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "course_inform"
#


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


#
# Structure for table "exercise"
#

DROP TABLE IF EXISTS `exercise`;
CREATE TABLE `exercise` (
  `id` varchar(64) NOT NULL,
  `name` varchar(20) NOT NULL,
  `content` text NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updatetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `isDelete` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "exercise"
#


#
# Structure for table "homework"
#

DROP TABLE IF EXISTS `homework`;
CREATE TABLE `homework` (
  `id` bigint(20) NOT NULL,
  `name` varchar(32) NOT NULL,
  `url` varchar(128) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_delete` smallint(6) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

#
# Data for table "homework"
#


#
# Structure for table "inform"
#

DROP TABLE IF EXISTS `inform`;
CREATE TABLE `inform` (
  `id` bigint(20) NOT NULL,
  `title` varchar(64) NOT NULL,
  `content` text NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_delete` smallint(6) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

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

INSERT INTO `manager` VALUES ('1','1','1',1,0,'2018-01-31 00:00:00','2018-01-31 00:00:00');

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
  `type` varchar(8) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "office"
#


#
# Structure for table "otherresource"
#

DROP TABLE IF EXISTS `otherresource`;
CREATE TABLE `otherresource` (
  `id` varchar(64) NOT NULL,
  `type` varchar(20) NOT NULL,
  `chinesedescription` varchar(60) DEFAULT NULL,
  `url` varchar(200) NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updatetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `isDelete` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "otherresource"
#


#
# Structure for table "picture"
#

DROP TABLE IF EXISTS `picture`;
CREATE TABLE `picture` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(128) NOT NULL,
  `url` varchar(128) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isDelete` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

#
# Data for table "picture"
#


#
# Structure for table "ppt"
#

DROP TABLE IF EXISTS `ppt`;
CREATE TABLE `ppt` (
  `id` varchar(64) NOT NULL,
  `chinesedescription` varchar(60) DEFAULT NULL,
  `url` varchar(200) NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updatetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `isDelete` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "ppt"
#


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
  `last_login` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `introduction` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `email` (`email`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "student"
#


#
# Structure for table "student_comment"
#

DROP TABLE IF EXISTS `student_comment`;
CREATE TABLE `student_comment` (
  `student_id` varchar(33) NOT NULL,
  `comment_id` bigint(20) NOT NULL,
  `is_delete` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`student_id`,`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

#
# Data for table "student_comment"
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
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

#
# Data for table "student_course"
#


#
# Structure for table "student_picture"
#

DROP TABLE IF EXISTS `student_picture`;
CREATE TABLE `student_picture` (
  `student_id` varchar(64) NOT NULL,
  `picture_id` varchar(64) NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updatetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `isDelete` int(1) NOT NULL,
  PRIMARY KEY (`student_id`,`picture_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "student_picture"
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


#
# Structure for table "unit_otherresource"
#

DROP TABLE IF EXISTS `unit_otherresource`;
CREATE TABLE `unit_otherresource` (
  `unit_id` varchar(64) NOT NULL,
  `otherresource_id` varchar(64) NOT NULL,
  `createtime` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `updatetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `isDelete` int(1) NOT NULL,
  PRIMARY KEY (`unit_id`,`otherresource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "unit_otherresource"
#


#
# Structure for table "unit_ppt"
#

DROP TABLE IF EXISTS `unit_ppt`;
CREATE TABLE `unit_ppt` (
  `unit_id` varchar(64) NOT NULL,
  `ppt_id` varchar(64) NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updatetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `isDelete` int(1) NOT NULL,
  PRIMARY KEY (`unit_id`,`ppt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "unit_ppt"
#


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
  `id` varchar(64) NOT NULL,
  `chinesedescription` varchar(60) DEFAULT NULL,
  `url` varchar(200) NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updatetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `isDelete` int(1) NOT NULL,
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

