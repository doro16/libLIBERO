-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.1.45-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 테이블 liblibero.user 구조 내보내기
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` varchar(30) NOT NULL,
  `password` varchar(20) NOT NULL,
  `nickname` varchar(20) NOT NULL,
  `profile` varchar(50) DEFAULT NULL,
  `gender_code` char(1) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `phone` varchar(14) DEFAULT NULL,
  `phone_code` smallint(6) NOT NULL DEFAULT '0',
  `user_code` smallint(6) NOT NULL DEFAULT '1',
  `role` char(1) NOT NULL,
  `birth_date` date NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `factory_no` varchar(20) DEFAULT NULL,
  `cash_code` char(2) NOT NULL DEFAULT 'bf',
  `a5_price` int(11) DEFAULT NULL,
  `b5_price` int(11) DEFAULT NULL,
  `a4_price` int(11) DEFAULT NULL,
  `color_price` int(11) DEFAULT NULL,
  `black_price` int(11) DEFAULT NULL,
  `snow_price` int(11) DEFAULT NULL,
  `mont_price` int(11) DEFAULT NULL,
  `arte_price` int(11) DEFAULT NULL,
  `white_price` int(11) DEFAULT NULL,
  `ivory_price` int(11) DEFAULT NULL,
  `rough_price` int(11) DEFAULT NULL,
  `kakao_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `인덱스 2` (`nickname`) USING BTREE,
  UNIQUE KEY `인덱스 3` (`phone`),
  UNIQUE KEY `factory_no` (`factory_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 liblibero.user:~13 rows (대략적) 내보내기
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`user_id`, `password`, `nickname`, `profile`, `gender_code`, `name`, `address`, `phone`, `phone_code`, `user_code`, `role`, `birth_date`, `reg_date`, `factory_no`, `cash_code`, `a5_price`, `b5_price`, `a4_price`, `color_price`, `black_price`, `snow_price`, `mont_price`, `arte_price`, `white_price`, `ivory_price`, `rough_price`, `kakao_id`) VALUES
	('admin1', '1234', '관리자1', 'ice1.jpg', 'm', '관리자', '서울시 강남구', '000-0000-1111', 1, 1, 'a', '2020-07-28', '2020-07-15 12:28:59', NULL, 'bf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('admin2', '1234', '관리자2', 'ice2.jpg', 'm', '관리자', NULL, '000-1111-2222', 1, 1, 'a', '2020-07-28', '2020-07-15 12:41:54', NULL, 'bf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('admin3', '1234', '관리자3', 'ice3.jpg', 'f', '관리자', NULL, '000-2222-3333', 1, 1, 'a', '2020-07-28', '2020-07-15 12:43:09', NULL, 'bf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('admin4', '1234', '관리자4', 'pururum.jpg', 'f', '관리자', NULL, '000-3333-2222', 1, 1, 'a', '1994-10-31', '2020-07-15 12:43:09', NULL, 'bf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('choije9410@gmail.com', '1111', '유저유저', 'pururum.jpg', 'f', '최지은', '경기도 수원시', '010-0000-3555', 0, 1, 'u', '1994-10-31', '2020-07-15 16:58:30', NULL, 'bf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('factory01@naver.com', '1111', '인쇄소01', 'ice1.jpg', 'f', '인쇄소', '경기도', '000-1234-2222', 0, 1, 'f', '2000-07-28', '2020-07-15 12:45:24', '1234', 'bf', 10, 20, 40, 100, 40, 3000, 4000, 4300, 10, 20, 10, NULL),
	('factory02@hanmail.net', '2222', '인쇄소02', NULL, 'f', '인쇄소', '경기도', '000-1313-2222', 0, 1, 'f', '1970-07-28', '2020-07-15 12:45:24', '1424132', 'bf', 20, 30, 40, 100, 100, 2000, 3000, 3500, 10, 5, 5, NULL),
	('factory03', '3333', '인쇄03', NULL, 'f', '인쇄소', '서울', '010-1313-3333', 0, 1, 'f', '2020-07-28', '2020-07-24 16:08:31', '12312311', 'bf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('factory04', '4444', '인쇄0404', NULL, 'm', '인쇄04', NULL, '010-1414-1414', 0, 1, 'f', '2020-07-28', '2020-07-28 09:41:35', '1231232', 'bf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('user01', '0101', '유저01', 'ice1.jpg', 'm', '유저01', NULL, '010-0101-0101', 0, 1, 'u', '1980-07-28', '2020-07-15 16:55:56', NULL, 'bf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('user02', '0202', '유저02', 'ice3.jpg', 'f', '유저02', NULL, '010-0202-0202', 0, 1, 'u', '2020-07-28', '2020-07-15 16:55:56', NULL, 'bf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('wjddbstp95@gmail.com', '1111', '윤세', NULL, 'm', '정윤세', NULL, '010-0011-1100', 0, 1, 'u', '2020-07-16', '2020-07-29 10:27:24', NULL, 'bf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('xodnr097@naver.com', '1111', '유저유저1', NULL, 'f', '김태욱', '충정도', '010-9430-3757', 0, 1, 'u', '2020-07-16', '2020-07-29 10:27:28', NULL, 'bf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

-- 테이블 liblibero.product 구조 내보내기
CREATE TABLE IF NOT EXISTS `product` (
  `prod_no` int(11) NOT NULL AUTO_INCREMENT,
  `prod_type` varchar(10) NOT NULL,
  `prod_name` varchar(50) DEFAULT NULL,
  `prod_detail` text,
  `author` varchar(20) DEFAULT NULL,
  `retail_price` int(11) DEFAULT NULL,
  `print_price` int(11) DEFAULT NULL,
  `blind_code` varchar(50) NOT NULL DEFAULT 'show' COMMENT 'show,hide,report,request',
  `prod_thumbnail` varchar(50) DEFAULT NULL,
  `cover_file` varchar(50) DEFAULT NULL,
  `purpose_code` char(4) DEFAULT NULL,
  `manu_file` varchar(50) DEFAULT NULL,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `discount_code` char(1) DEFAULT 'o',
  `book_page` int(3) DEFAULT NULL,
  `size_type` char(2) DEFAULT NULL,
  `color_type` char(5) DEFAULT NULL,
  `cover_type` char(4) DEFAULT NULL,
  `inner_type` char(5) DEFAULT NULL,
  `factory_id` varchar(30) DEFAULT NULL,
  `creator` varchar(30) NOT NULL,
  `like_count` int(11) NOT NULL DEFAULT '0',
  `book_category` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`prod_no`),
  KEY `FK_product_user` (`factory_id`),
  KEY `FK_product_user_2` (`creator`),
  KEY `prod_type` (`prod_type`),
  CONSTRAINT `FK_product_user` FOREIGN KEY (`factory_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `FK_product_user_2` FOREIGN KEY (`creator`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 liblibero.buy 구조 내보내기
CREATE TABLE IF NOT EXISTS `buy` (
  `buy_no` int(11) NOT NULL AUTO_INCREMENT,
  `prod_no` int(11) NOT NULL,
  `user_id` varchar(30) NOT NULL,
  `buy_amount` int(11) NOT NULL DEFAULT '1',
  `buy_code` varchar(50) NOT NULL DEFAULT 'ready',
  `pay_no` varchar(50) DEFAULT NULL,
  `prod_type` varchar(10) NOT NULL,
  PRIMARY KEY (`buy_no`) USING BTREE,
  KEY `FK_buy_product` (`prod_no`) USING BTREE,
  KEY `FK_buy_user` (`user_id`) USING BTREE,
  KEY `FK_buy_pay` (`pay_no`) USING BTREE,
  CONSTRAINT `FK_buy_pay` FOREIGN KEY (`pay_no`) REFERENCES `pay` (`pay_no`),
  CONSTRAINT `FK_buy_product` FOREIGN KEY (`prod_no`) REFERENCES `product` (`prod_no`),
  CONSTRAINT `FK_buy_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 liblibero.pay 구조 내보내기
CREATE TABLE IF NOT EXISTS `pay` (
  `pay_no` varchar(50) NOT NULL,
  `user_id` varchar(30) NOT NULL,
  `payment_type` varchar(10) NOT NULL,
  `actual_price` int(11) NOT NULL,
  `receiver_name` varchar(20) NOT NULL,
  `receiver_addr` varchar(100) NOT NULL,
  `receiver_phone` varchar(14) NOT NULL,
  `delivery_req` varchar(50) DEFAULT NULL,
  `pay_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `delivery_code` smallint(6) NOT NULL DEFAULT '1',
  `pay_code` varchar(50) DEFAULT NULL,
  `cancel_type` int(1) DEFAULT NULL,
  PRIMARY KEY (`pay_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 liblibero.cash 구조 내보내기
CREATE TABLE IF NOT EXISTS `cash` (
  `cash_no` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(30) NOT NULL,
  `cash_amount` int(11) NOT NULL,
  `cash_current` int(11) NOT NULL,
  `cash_withdraw` int(11) NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `buy_no` int(11) DEFAULT NULL,
  PRIMARY KEY (`cash_no`),
  KEY `FK_cash_user` (`user_id`),
  KEY `buy_no` (`buy_no`),
  CONSTRAINT `FK_cash_buy` FOREIGN KEY (`buy_no`) REFERENCES `buy` (`buy_no`),
  CONSTRAINT `FK_cash_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 liblibero.chat_room 구조 내보내기
CREATE TABLE IF NOT EXISTS `chat_room` (
  `room_no` int(11) NOT NULL AUTO_INCREMENT,
  `host` varchar(30) NOT NULL,
  `guest` varchar(30) NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`room_no`),
  KEY `FK_chat_room_user` (`host`),
  KEY `FK_chat_room_user_2` (`guest`),
  CONSTRAINT `FK_chat_room_user` FOREIGN KEY (`host`) REFERENCES `user` (`user_id`),
  CONSTRAINT `FK_chat_room_user_2` FOREIGN KEY (`guest`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 liblibero.chat_message 구조 내보내기
CREATE TABLE IF NOT EXISTS `chat_message` (
  `message_no` int(11) NOT NULL AUTO_INCREMENT,
  `room_no` int(11) NOT NULL,
  `sender_id` varchar(30) NOT NULL,
  `send_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `message_content` varchar(100) NOT NULL,
  `message_image` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`message_no`),
  KEY `FK_chat_message_chat_room` (`room_no`),
  KEY `FK_chat_message_user` (`sender_id`),
  CONSTRAINT `FK_chat_message_chat_room` FOREIGN KEY (`room_no`) REFERENCES `chat_room` (`room_no`),
  CONSTRAINT `FK_chat_message_user` FOREIGN KEY (`sender_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 liblibero.comment 구조 내보내기
CREATE TABLE IF NOT EXISTS `comment` (
  `comment_no` int(11) NOT NULL AUTO_INCREMENT,
  `post_no` int(11) NOT NULL,
  `user_id` varchar(30) NOT NULL,
  `comment_content` text NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `parent_comment_no` int(11) DEFAULT NULL,
  PRIMARY KEY (`comment_no`),
  KEY `FK_comment_user` (`user_id`),
  KEY `FK_comment_post` (`post_no`),
  KEY `FK_comment_comment` (`parent_comment_no`),
  CONSTRAINT `FK_comment_comment` FOREIGN KEY (`parent_comment_no`) REFERENCES `comment` (`comment_no`),
  CONSTRAINT `FK_comment_post` FOREIGN KEY (`post_no`) REFERENCES `post` (`post_no`),
  CONSTRAINT `FK_comment_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 liblibero.hashtag 구조 내보내기
CREATE TABLE IF NOT EXISTS `hashtag` (
  `hashtag_no` int(11) NOT NULL AUTO_INCREMENT,
  `prod_no` int(11) DEFAULT NULL,
  `hashtag_name` varchar(50) NOT NULL,
  `user_id` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`hashtag_no`),
  KEY `FK_hashtag_user` (`user_id`),
  KEY `FK_hashtag_product` (`prod_no`),
  CONSTRAINT `FK_hashtag_product` FOREIGN KEY (`prod_no`) REFERENCES `product` (`prod_no`),
  CONSTRAINT `FK_hashtag_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 liblibero.post 구조 내보내기
CREATE TABLE IF NOT EXISTS `post` (
  `post_no` int(11) NOT NULL AUTO_INCREMENT,
  `post_type` char(1) NOT NULL,
  `user_id` varchar(30) NOT NULL,
  `post_name` varchar(50) NOT NULL,
  `post_content` text NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `blind_code` varchar(50) NOT NULL DEFAULT 'show',
  `view_count` int(11) NOT NULL DEFAULT '0',
  `comment_count` int(11) DEFAULT '0',
  `qna_reg_type` char(1) DEFAULT NULL,
  `qna_code` char(1) DEFAULT NULL,
  `report_count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`post_no`),
  KEY `FK_post_user` (`user_id`),
  CONSTRAINT `FK_post_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10010 DEFAULT CHARSET=utf8;

-- 테이블 데이터 liblibero.post:~10 rows (대략적) 내보내기
DELETE FROM `post`;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` (`post_no`, `post_type`, `user_id`, `post_name`, `post_content`, `reg_date`, `blind_code`, `report_count`, `view_count`, `comment_count`, `qna_reg_type`, `qna_code`) VALUES
	(10000, 'N', 'admin3', '공지1', '첫번째 공지입니다', '2020-07-15 17:37:11', 'o', 0, 0, 0, NULL, NULL),
	(10001, 'N', 'admin3', '서버 증설 안내', '리브리베로 서버점검 및 서버 증설 안내\r\n\r\n\r\n\r\n안녕하세요, 자가출판 플랫폼 리브리베로 개발팀입니다.\r\n\r\n\r\n\r\n리브리베로 웹사이트의 서버 점검이 이루어집니다. \r\n\r\n하기 내용을 양지하시어 이용에 불편이 없도록 유의하시기 바랍니다.\r\n\r\n\r\n\r\n\r\n작업내용\r\n\r\n\r\n\r\n  리브리베로 서버 증설 및 안정화 작업\r\n\r\n\r\n\r\n일정안내\r\n\r\n\r\n\r\n  작업시작 : 2020년 06월 27일 오전 1시부터 (AM 01:00)\r\n\r\n  작업종료 : 2020년 06월 27일 오전 2시까지 (AM 02:00)\r\n\r\n\r\n\r\n보다 쾌적한 환경과 서비스를 제공하기 위해서 노력하겠습니다. \r\n\r\n항상 감사합니다.\r\n', '2020-07-15 17:38:25', 'o', 0, 0, 0, NULL, NULL),
	(10002, 'N', 'admin3', '7월 공지', '7월 15일 구현 시작', '2020-07-15 17:40:48', 'o', 0, 0, 0, NULL, NULL),
	(10003, 'F', 'factory02@hanmail.net', '저희 인쇄소 가격 인상했습니다', '그렇다구요', '2020-07-15 17:42:21', 'o', 0, 0, 0, NULL, NULL),
	(10004, 'F', 'user01', '6시 어떻게 생각하세요', '전 좋게 생각해요', '2020-07-15 17:42:54', 'o', 0, 0, 0, NULL, NULL),
	(10005, 'F', 'user01', '제가 쓴 글 좀 보세요', '제가 쓴 댓글을 보세요', '2020-07-15 17:43:31', 'o', 0, 0, 0, NULL, NULL),
	(10006, 'Q', 'user02', '저자 수익을 0으로 하고 책값을 낮추고 싶습니다.', '현재 최대로 낮추어도 1500원 정도의 수익이 나고 있는데, 아예 0으로 낮추고 책값을 낮추는 방법이 있을까요?\r\n\r\n(계좌로 입금되는 금액 없도록)\r\n\r\n\r\n\r\n정부연구비로 출판을 하게되어 수익이 발생할 경우 문제 소지가 있어 질문드립니다.', '2020-07-15 17:46:04', 'o', 0, 0, 0, 'P', 'O'),
	(10007, 'Q', 'user01', 'A5 사이즈 컬러내지 책 최소 페이지', '문의드립니다.\r\n\r\n\r\n\r\nA5 판형 컬러내지 책의 최소 페이지는 어느 정도인지 알고 싶습니다.\r\n\r\n제본에 무리가 없으려면 어느 정도 페이지여야 할까요?\r\n\r\n\r\n\r\n수고에 감사드립니다.', '2020-07-15 17:49:08', 'o', 0, 0, 0, 'P', 'X'),
	(10008, '0', 'admin1', '얘는 쿼카에요', '<p>&nbsp;<img src="/libero/resources/images/community/fileUpload/d2afcd45-ada2-4312-98d0-d685adf38297.jpg" style="width: 400px;"></p><p>ㅎㅎ 웃어</p>', '2020-07-27 15:03:09', 'o', 0, 0, 0, NULL, NULL),
	(10009, '0', 'admin1', '얘는 부엉이', '<p>올빼미? 부엉이</p><p><img src="/libero/resources/images/community/fileUpload/0dc24b96-4ffb-4ca6-8142-832042faf250.jpeg" style="width: 1088px;"><br></p>', '2020-07-27 15:08:45', 'o', 0, 0, 0, NULL, NULL);
/*!40000 ALTER TABLE `post` ENABLE KEYS */;


-- 테이블 liblibero.report 구조 내보내기
CREATE TABLE IF NOT EXISTS `report` (
  `report_no` int(11) NOT NULL AUTO_INCREMENT,
  `prod_no` int(11) DEFAULT NULL,
  `post_no` int(11) DEFAULT NULL,
  `report_type` smallint(6) NOT NULL,
  `reporter_id` varchar(30) NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`report_no`),
  KEY `FK_report_product` (`prod_no`),
  KEY `FK_report_post` (`post_no`),
  KEY `FK_report_user` (`reporter_id`),
  CONSTRAINT `FK_report_post` FOREIGN KEY (`post_no`) REFERENCES `post` (`post_no`),
  CONSTRAINT `FK_report_product` FOREIGN KEY (`prod_no`) REFERENCES `product` (`prod_no`),
  CONSTRAINT `FK_report_user` FOREIGN KEY (`reporter_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 liblibero.review 구조 내보내기
CREATE TABLE IF NOT EXISTS `review` (
  `review_no` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(30) NOT NULL,
  `buy_no` int(11) NOT NULL,
  `review_name` varchar(40) DEFAULT NULL,
  `review_content` text NOT NULL,
  `review_image` varchar(200) DEFAULT NULL,
  `star_rate` int(11) NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `prod_no` int(11) DEFAULT NULL,
  PRIMARY KEY (`review_no`),
  KEY `FK__user` (`user_id`),
  KEY `FK_review_order` (`buy_no`) USING BTREE,
  KEY `prod_no` (`prod_no`),
  CONSTRAINT `FK__user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `FK_review_buy` FOREIGN KEY (`buy_no`) REFERENCES `buy` (`buy_no`),
  CONSTRAINT `FK_review_product` FOREIGN KEY (`prod_no`) REFERENCES `product` (`prod_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 liblibero.upload_file 구조 내보내기
CREATE TABLE IF NOT EXISTS `upload_file` (
  `file_no` int(11) NOT NULL AUTO_INCREMENT,
  `review_no` int(11) DEFAULT NULL,
  `post_no` int(11) DEFAULT NULL,
  `prod_no` int(11) DEFAULT NULL,
  `file_name` varchar(50) NOT NULL,
  `file_path` varchar(100) NOT NULL,
  PRIMARY KEY (`file_no`),
  KEY `FK__post` (`post_no`),
  KEY `FK__product` (`prod_no`),
  KEY `FK_upload_file_review` (`review_no`),
  CONSTRAINT `FK__post` FOREIGN KEY (`post_no`) REFERENCES `post` (`post_no`),
  CONSTRAINT `FK__product` FOREIGN KEY (`prod_no`) REFERENCES `product` (`prod_no`),
  CONSTRAINT `FK_upload_file_review` FOREIGN KEY (`review_no`) REFERENCES `review` (`review_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 liblibero.wish 구조 내보내기
CREATE TABLE IF NOT EXISTS `wish` (
  `wish_no` int(11) NOT NULL AUTO_INCREMENT,
  `prod_no` int(11) NOT NULL,
  `user_id` varchar(30) NOT NULL,
  PRIMARY KEY (`wish_no`) USING BTREE,
  KEY `FK_like_product` (`prod_no`),
  KEY `FK_like_user` (`user_id`),
  CONSTRAINT `FK_like_product` FOREIGN KEY (`prod_no`) REFERENCES `product` (`prod_no`),
  CONSTRAINT `FK_like_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
