-- MySQL dump 10.13  Distrib 8.0.12, for osx10.13 (x86_64)
--
-- Host: 127.0.0.1    Database: teach
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `users_teacherprofile`
--

DROP TABLE IF EXISTS `users_teacherprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8 ;
CREATE TABLE `users_teacherprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gender` smallint(6) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `birthday` date NOT NULL,
  `from_province` varchar(50) NOT NULL,
  `education` smallint(6) NOT NULL,
  `id_code` varchar(18) NOT NULL,
  `school_id` int(11) NOT NULL,
  `specialty` varchar(50) NOT NULL,
  `teach_age` int(11) DEFAULT NULL,
  `province` varchar(30) NOT NULL,
  `address` varchar(100) NOT NULL,
  `postal_code` varchar(10) NOT NULL,
  `status` smallint(6) NOT NULL,
  `pass_datetime` datetime DEFAULT NULL,
  `id_code_pic` varchar(100) DEFAULT NULL,
  `info` longtext,
  `description` longtext,
  `cert` longtext,
  `resume` longtext,
  `life_area_id` int(11) NOT NULL,
  `position_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `work_area_id` int(11) NOT NULL,
  `teach` varchar(50) DEFAULT NULL,
  `head_img` varchar(100) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `rate` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mobile` (`mobile`),
  KEY `users_teacherprofile_life_area_id_48a5c06f_fk_users_district_id` (`life_area_id`),
  KEY `users_teacherprofile_position_id_9a149cba_fk_users_position_id` (`position_id`),
  KEY `users_teacherprofile_user_id_976ceafc_fk_users_user_id` (`user_id`),
  KEY `users_teacherprofile_work_area_id_3fe947a9_fk_users_district_id` (`work_area_id`),
  KEY `users_teacherprofile_school_id_ce55eb1f` (`school_id`),
  CONSTRAINT `users_teacherprofile_life_area_id_48a5c06f_fk_users_district_id` FOREIGN KEY (`life_area_id`) REFERENCES `users_district` (`id`),
  CONSTRAINT `users_teacherprofile_position_id_9a149cba_fk_users_position_id` FOREIGN KEY (`position_id`) REFERENCES `users_position` (`id`),
  CONSTRAINT `users_teacherprofile_school_id_ce55eb1f_fk_users_school_id` FOREIGN KEY (`school_id`) REFERENCES `users_school` (`id`),
  CONSTRAINT `users_teacherprofile_user_id_976ceafc_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`),
  CONSTRAINT `users_teacherprofile_work_area_id_3fe947a9_fk_users_district_id` FOREIGN KEY (`work_area_id`) REFERENCES `users_district` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_teacherprofile`
--

LOCK TABLES `users_teacherprofile` WRITE;
/*!40000 ALTER TABLE `users_teacherprofile` DISABLE KEYS */;
INSERT INTO `users_teacherprofile` VALUES (1,2,'13111111113','龙教员','1996-04-07','北京',8,'111111111111111111',1,'计算机',NULL,'北京','北京','1132131',3,'2019-04-28 06:41:00.492730','2019/04/21/expectedresidencepriceIcon.png','龙霞：本科毕业于中央美院城市设计学院，硕士研究生毕业于中央美院壁画系，中韩日国际美术家协会会员，央美画室校长。 长达11年美术专业教育，涵盖幼儿、小学、初中，高考以及成人绘画教育。作品曾展览于韩国大使馆，中央美术学院壁画系展厅，中央美术学院展览馆，798熙丰艺术空间，湖北美术馆，韩国釜山市立文化会馆，日本福冈美术馆，宋庄国际书画院，台湾宝胜画廊台湾展厅和北京展厅，北京万荷美术馆，北京玫瑰之名艺术中心……多幅作品成功于嘉德拍卖。出版刊物有《中央美术学院学生作品素描精选》《美食论坛》《构成新概念——平面篇》《新视觉》《中国青年艺术家》《中国大学生美术作品年鉴》','专攻美术，学前，小学，初中，成人均可','龙霞：07年毕业于中央美院城市设计学院，09年毕业于中央美院壁画系研究生班，中韩日国际美术家协会会员，央美画室校长。 作品曾展览于韩国大使馆，中央美术学院壁画系展厅，中央美术学院展览馆，798熙丰艺术空间，湖北美术馆，韩国釜山市立文化会馆，日本福冈美术馆，宋庄国际书画院，台湾宝胜画廊台湾展厅和北京展厅，北京万荷美术馆，北京玫瑰之名艺术中心……多幅作品成功于嘉德拍卖。出版刊物有《中央美术学院学生作品素描精选》《美术论坛》《构成新概念——平面篇》《新视觉》《中国青年艺术家》《中国大学生美术作品年鉴》','06年开始做家教，有十多年的、多角度的针对性的不同年龄段的专业性教育经验；15年担任央美画室校长并担任部分教学任务，期间无数学生多次参加并取得相关展览的奖项。地理位置虽然有改变，但许多学生家长迄今一直保持友好并延伸性的专业性的沟通。',2,21,20,2,'专攻美术，学前，小学，初中，成人均可','headimgs/20170622131955_h4eZS.thumb.700_0.jpeg','teacher2@qq.com',4),(2,2,'13122223333','杨教员','1999-07-05','北京',4,'110221111111111111',5,'师范',NULL,'','北京海淀','11022123',3,'2019-04-28 08:56:42.680534','','本人高考数学成绩140，在理综方面突出，现在是一名在职家教老师，经验丰富。在平时积极报名学校组织的进校园活动，努力与同学们构建良好关系。在大二寒假期间，参加学校举办的河南封丘支教，收益颇多。','','','',1,26,22,1,NULL,'headimgs/u37022307112593481508fm27gp0.jpg','',2),(3,1,'13122223334','冯教员','1969-06-05','北京',5,'110221111111111111',4,'数学',NULL,'','北京朝阳','11022123',3,'2019-04-28 08:55:50.733604','','','','','',2,16,23,2,NULL,'headimgs/u1952644193724671486fm27gp0.jpg','',5),(4,1,'13122223335','杜教员','1992-12-12','河南',5,'110221111111111111',46,'教育学',NULL,'','北京朝阳','11022123',3,'2019-04-28 09:25:07.205224','','作为一名在职老师，我准备用自己的生命去影响孩子的一生，陪伴孩子的心灵，引导他们快乐的学习。\r\n运用《幸福心理学》专业知识，同理、接纳、爱每一个孩子。在教学过程中，自己擅长情商教育，提高孩子的EQ(情绪商数）/AQ（逆境商数）。不仅仅注重学科基础教育，提升孩子的学科成绩，还同步关注学生的品格基础教育，塑造良好的品格（真诚、友善、责任、爱心、乐观）。关注学生的心灵健康培养，全面发展，给学生提供一个健康的学习环境与心态。','擅长：1-由于专业是心理咨询，因此和孩子沟通很容易，能快速的走进孩子的内心，解说青少年心语，增强学生自信心，陪伴学生快乐成长。 2-数学（擅长珠心算），通过算盘的应用，长期培养后可在孩子的脑海中形成一个虚算盘，用数字0、1、5，运算大量的数学，培养逻辑思维能力。\r\n自己有学习过心理学，心理咨询，可以帮助学生建立爱的关系，营造一个很好的学习生活','美国ACI注册心理咨询师，英语四级、计算机二级、','',2,24,24,2,NULL,'headimgs/u18298864503355529358fm27gp0.jpg','',2),(5,1,'13122223336','杨教员','1996-06-08','湖南',9,'110221111111111111',1,'等离子体物理',NULL,'','北京朝阳','11022123',3,'2019-04-28 09:30:07.212090','','具有不错的表达能力和亲和力，与学生相处愉快，讲解条理清晰，深受好评。','无要求','英语四级、六级证书。全国大学生数学竞赛省一等奖、国家三等奖。全国中学生物理竞赛省一等奖、国家三等奖。高中数学竞赛省一等奖。','大学四年在读期间一直兼职家教，两名同学提升显著，数学一度从月考80分提升至期末130分。辅导学生评价一致：讲解耐心富有条理、收获很大。',2,30,25,2,NULL,'headimgs/u20779497953562122090fm27gp0.jpg','',NULL),(6,2,'13122223337','李教员','1996-11-16','黑龙江',5,'110221111111111111',33,'舞蹈教师',NULL,'','北京朝阳','11022123',3,'2019-04-29 09:22:34.209421','','擅长五岁以上孩子的基本功，软度，技巧的训练，带过的孩子参加艺术节，获过多个奖项，家教多份，有经验，一节课就可以清楚的了解孩子的长处和短处，来根据训练。群舞比赛获得过金奖和银奖，教学三年，接触孩子较多，教学内容丰富，较了解孩子的情况和家长的需求','五环外不接课','民族民间舞考级1-3级\r\n计算机考级证书\r\n各大型舞蹈比赛证书\r\n在校内表现优秀所获证书\r\n北京舞蹈学院考级证书','',4,24,26,4,NULL,'headimgs/teacher_picnet_type-0-id-84304-size-200x200-sex-1.jpg','',NULL),(7,2,'13122223338','李教员','1959-03-04','陕西',5,'110221111111111111',48,'生物',NULL,'','北京丰台','11022123',3,'2019-04-29 09:22:24.232582','','本人系北京市重点中学在职高中生物高级教师。具有丰富的教学经验，长期担任高三生物教学工作，十多年的一对一家教经历取得了很好的教学效果。生物课专业性强，很多同学需要老师的指点，我采用目标启导法教学，诠释高考会考知识点，把握教材重点难度，了解学生盲点，凝点。破解考点。预测考试动向。教给学生学习生物的方法，最大限度提高学生学习成绩。如八一中学王同学生物考试不及格。通过我的辅导会考得A,14年高考生物选择题全部正确，非选择题仅错了一个空，因此考上北大。我的教学理念是只要学生目标锁定，有一个好教学过程和方法，理想就会变为现实。欢迎学生家长与我联系，帮你孩子学好并考好生物这门课实现你们的人生梦想。','地铁可到范围均可','高中教师资格，中学高级教师','具有丰富的教学经验，长期担任高三生物教学工作，十多年的一对一家教经历取得了很好的教学效果。生物课专业性强，很多同学需要老师的指点，我采用目标启导法教学，诠释高考会考知识点，把握教材重点难度，了解学生盲点，凝点。破解考点。预测考试动向。教给学生学习生物的方法，最大限度提高学生学习成绩。如八一中学王同学生物考试不及格。通过我的辅导会考得A,14年高考生物选择题全部正确，非选择题仅错了一个空，因此考上北大。我的教学理念是只要学生目标锁定，有一个好教学过程和方法，理想就会变为现实。欢迎学生家长与我联系，帮你孩子学好并考好生物这门课实现你们的人生梦想。',5,16,27,5,NULL,'headimgs/teacher_picnet_type-0-id-81984-size-200x200-sex-1.jpg','',NULL),(8,2,'13122223339','武教员','1996-09-12','北京',4,'110221111111111111',5,'思想政治教育',NULL,'','北京海淀','11022123',3,'2019-05-06 03:30:28.999673','','英语四级546，高考606，高考数学144(可能因为北京市题目简单)，英语130。','曾经长期指导家里妹妹的数学及英语作业，热爱语文及写作，文笔较好，曾经为自己学校高中的刊物投递过文章。喜欢和孩子打交道，有耐心，比较有亲和力，在初高中时期的学习中，同学们很乐意同我一起探讨问题，我也很愿意为大家解答困惑。','英语四级证书','这是我第一次尝试做家教，虽然家教经验不足，但我会因此更加重视这份工作，尽最大努力不去辜负家长的期待。我是个有责任心的人，不会拿孩子的未来和前途开玩笑。当然我更希望可以通过我的力量帮助到孩子，工作的不足也欢迎家长多多批评指正',1,27,28,1,'小学全科, 初一初二语文, 初一初二英语, 初一初二数学,','headimgs/teacher_picnet_type-0-id-91310-size-200x200-sex-1.jpg','',NULL);
/*!40000 ALTER TABLE `users_teacherprofile` ENABLE KEYS */;
UNLOCK TABLES;
