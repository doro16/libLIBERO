-- --------------------------------------------------------
-- 호스트:                          13.209.41.26
-- 서버 버전:                        10.1.45-MariaDB - MariaDB Server
-- 서버 OS:                        Linux
-- HeidiSQL 버전:                  11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- liblibero 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `liblibero` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `liblibero`;

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
) ENGINE=InnoDB AUTO_INCREMENT=10044 DEFAULT CHARSET=utf8;

-- 테이블 데이터 liblibero.buy:~23 rows (대략적) 내보내기
/*!40000 ALTER TABLE `buy` DISABLE KEYS */;
INSERT INTO `buy` (`buy_no`, `prod_no`, `user_id`, `buy_amount`, `buy_code`, `pay_no`, `prod_type`) VALUES
	(10001, 10005, 'choije9410@gmail.com', 1, 'paid', 'imp_792996908661', 'paper'),
	(10002, 10007, 'kimsur1111@hanmail.net', 1, 'paid', 'imp_744770622922', 'design'),
	(10004, 10025, 'choije9410@gmail.com', 1, 'paid', 'imp_792996908661', 'paper'),
	(10005, 10027, 'admin4', 1, 'ready', NULL, 'ebook'),
	(10006, 10026, 'admin4', 1, 'ready', NULL, 'paper'),
	(10009, 10026, 'buyer@naver.com', 5, 'paid', 'imp_232027340337', 'paper'),
	(10010, 10026, 'user01', 10, 'paid', 'imp_941784037318', 'paper'),
	(10011, 10025, 'user01', 3, 'paid', 'imp_941784037318', 'paper'),
	(10012, 10027, 'user01', 1, 'paid', 'imp_941784037318', 'ebook'),
	(10026, 10032, 'choije9410@gmail.com', 1, 'paid', 'imp_211530641120', 'ebook'),
	(10029, 10007, 'kimsur1111@hanmail.net', 1, 'paid', 'imp_673934945890', 'design'),
	(10031, 10038, 'wjddbstp@naver.com', 1, 'paid', 'imp_114093786868', 'paper'),
	(10032, 10038, 'kimsur1111@hanmail.net', 1, 'ready', NULL, 'paper'),
	(10033, 10038, 'choije9410@gmail.com', 1, 'paid', 'imp_781671925350', 'paper'),
	(10035, 10038, 'user01', 4, 'paid', 'imp_771780746677', 'paper'),
	(10036, 10038, 'buyer@naver.com', 1, 'paid', 'imp_646735670175', 'paper'),
	(10037, 10038, 'choije9410@gmail.com', 1, 'paid', 'imp_125999169853', 'paper'),
	(10038, 10038, 'user02', 11, 'paid', 'imp_973427422143', 'paper'),
	(10039, 10038, 'user01', 5, 'paid', 'imp_524335958714', 'paper'),
	(10040, 10033, 'choije9410@gmail.com', 15, 'paid', 'imp_284676742973', 'ebook'),
	(10041, 10027, 'choije9410@gmail.com', 4, 'paid', 'imp_277997831331', 'ebook'),
	(10042, 10027, 'user01', 1, 'paid', 'imp_623226323783', 'ebook'),
	(10043, 10032, 'user01', 1, 'ready', NULL, 'ebook');
/*!40000 ALTER TABLE `buy` ENABLE KEYS */;

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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- 테이블 데이터 liblibero.cash:~29 rows (대략적) 내보내기
/*!40000 ALTER TABLE `cash` DISABLE KEYS */;
INSERT INTO `cash` (`cash_no`, `user_id`, `cash_amount`, `cash_current`, `cash_withdraw`, `reg_date`, `buy_no`) VALUES
	(1, 'kimsur1111@naver.com', 0, 10850, 0, '2020-03-18 01:46:42', 10002),
	(2, 'kimsur1111@hanmail.net', 0, 2895, 0, '2020-05-18 10:10:51', 10001),
	(3, 'kimsur1111@hanmail.net', 0, 6195, 0, '2020-05-18 10:10:51', 10004),
	(4, 'kimsur1111@hanmail.net', 0, 765, 0, '2020-08-18 10:27:44', 10009),
	(5, 'kimsur1111@hanmail.net', 0, 1530, 0, '2020-08-18 10:40:13', 10010),
	(6, 'kimsur1111@hanmail.net', 0, 4830, 0, '2020-08-18 10:40:13', 10011),
	(7, 'kimsur1111@hanmail.net', 0, 10430, 0, '2020-08-18 10:40:13', 10012),
	(8, 'kimsur1111@hanmail.net', 0, 13930, 0, '2020-08-18 11:25:59', 10026),
	(9, 'kimsur1111@naver.com', 0, 21700, 0, '2020-08-18 12:56:21', 10029),
	(10, 'kimsur1111@hanmail.net', 0, 19270, 0, '2020-08-18 14:38:46', 10031),
	(11, 'kimsur1111@hanmail.net', 0, 24610, 0, '2020-08-18 14:48:30', 10033),
	(12, 'kimsur1111@hanmail.net', 0, 29950, 0, '2020-08-18 15:22:46', 10036),
	(13, 'kimsur1111@hanmail.net', 0, 35290, 0, '2020-08-18 15:23:34', 10035),
	(14, 'kimsur1111@hanmail.net', 0, 40630, 0, '2020-08-18 15:34:24', 10038),
	(17, 'kimsur1111@hanmail.net', 0, 25630, 15000, '2020-08-18 15:56:46', 10038),
	(18, 'kimsur1111@hanmail.net', 12000, 0, 0, '2020-02-15 15:57:08', 10038),
	(19, 'kimsur1111@hanmail.net', 15000, 0, 0, '2020-03-15 09:00:00', 10029),
	(20, 'kimsur1111@hanmail.net', 36000, 0, 0, '2020-04-15 16:33:36', NULL),
	(21, 'kimsur1111@hanmail.net', 42000, 0, 0, '2020-05-15 16:34:50', 10037),
	(22, 'kimsur1111@hanmail.net', 53800, 0, 0, '2020-06-15 16:35:36', NULL),
	(23, 'kimsur1111@hanmail.net', 62000, 48000, 0, '2020-07-18 16:39:25', 10039),
	(24, 'kimsur1111@hanmail.net', 62000, 5000, 43000, '2020-08-18 16:54:08', 10039),
	(25, 'kimsur1111@hanmail.net', 110000, 0, 0, '2020-08-18 16:56:35', 10039),
	(26, 'kimsur1111@naver.com', 0, 21700, 0, '2020-08-18 16:56:40', 10029),
	(27, 'choije9410@gmail.com', 0, 8400, 0, '2020-08-18 17:01:45', 10040),
	(28, 'choije9410@gmail.com', 0, 0, 8400, '2020-08-18 17:02:01', 10040),
	(29, 'choije9410@gmail.com', 0, 5600, 0, '2020-08-18 17:07:08', 10041),
	(30, 'user01', 0, 5600, 0, '2020-08-18 17:11:23', 10042),
	(31, 'user01', 0, 0, 5600, '2020-08-18 17:11:36', 10042);
/*!40000 ALTER TABLE `cash` ENABLE KEYS */;

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
) ENGINE=InnoDB AUTO_INCREMENT=10018 DEFAULT CHARSET=utf8;

-- 테이블 데이터 liblibero.comment:~11 rows (대략적) 내보내기
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` (`comment_no`, `post_no`, `user_id`, `comment_content`, `reg_date`, `parent_comment_no`) VALUES
	(10000, 10021, 'buyer@naver.com', '흥미가 생기는 책이네요 !', '2020-08-18 14:53:19', NULL),
	(10003, 10021, 'factory04', '부러워요', '2020-08-18 15:09:17', NULL),
	(10004, 10022, 'buyer@naver.com', '정말 좋은 책인 것 같습니다 !', '2020-08-18 15:19:42', NULL),
	(10005, 10023, 'buyer@naver.com', '정말 흥미로운 내용입니다 ! 책 구매 하겠습니다.', '2020-08-18 15:20:42', NULL),
	(10011, 10021, 'choije9410@gmail.com', '저도 많이 팔고싶어요!!', '2020-08-18 16:15:40', NULL),
	(10012, 10027, 'admin1', '안녕하세요 김작가님, 리브리베로입니다.\n\n제출하신 도서 승인처리하여 메일드릴 예정입니다.\n원고와 표지 모두 사이즈 이상없습니다^^\n최종 인쇄용 파일 메일로 전달드릴 예정이오니 해당 파일 꼼꼼히 확인 후 구매 부탁드립니다!\n\n주말동안 구매해주시면 다음주 월요일부터 제작이 시작될 예정이며, 제작기일은 평일기준\n(공휴일, 주말제외) 3-5일정도 소요될 수 있습니다.\n제작은 24일내로 처리 가능할것으로 예상됩니다^^', '2020-08-18 16:40:53', NULL),
	(10013, 10029, 'admin1', '안녕하세요 단비님, 리브리베로입니다.\n\n사이트내 [책만들기]-[종이책 만들기] 첫번째 화면에서 도서 규격, 흑백도서 or 칼라도서 선택 후\n표지 날개유무 클릭, 총페이지수 입력하시면 우측 하단에 소장용 도서 가격 확인 가능합니다.\n\n해당 가격에 x 20을 하시면 구매비용 확인 가능하오니 참고부탁드립니다!\n감사합니다.', '2020-08-18 16:45:49', NULL),
	(10014, 10030, 'admin1', '주문내역조회 > 상품정보 보기 \n안녕하세요 김작님, 리브리베로입니다.\n\n사이트 상단 [주문내역조회] 들어가셔서 상품정보 보기 > 다운로드 버튼 누르시면 됩니다.\n구매하기 진행이 아닌 [주문내역조회]에서 다운로드 버튼 눌러주세요~\n\n감사합니다.', '2020-08-18 16:49:18', NULL),
	(10015, 10028, 'admin1', '안녕하세요 단비님.\n저희 리베로에 많은 관심을 가져주셔서 감사합니다.\n\n회원님의 소중한 의견을 반영할 수 있도록 노력하는 리베로가 되겠습니다.\n감사합니다.', '2020-08-18 17:00:55', NULL),
	(10016, 10023, 'user01', '살인내용이 포함되나요?', '2020-08-18 17:15:30', NULL),
	(10017, 10023, 'doro16@naver.com', '저 이거 범인 누군지 알아요', '2020-08-18 17:17:40', NULL);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;

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
) ENGINE=InnoDB AUTO_INCREMENT=10067 DEFAULT CHARSET=utf8;

-- 테이블 데이터 liblibero.hashtag:~56 rows (대략적) 내보내기
/*!40000 ALTER TABLE `hashtag` DISABLE KEYS */;
INSERT INTO `hashtag` (`hashtag_no`, `prod_no`, `hashtag_name`, `user_id`) VALUES
	(10000, NULL, '해킹', 'wjddbstp@naver.com'),
	(10001, NULL, '간나쉑', 'wjddbstp@naver.com'),
	(10002, NULL, '진짜', 'wjddbstp@naver.com'),
	(10003, NULL, '졸림', 'wjddbstp@naver.com'),
	(10004, 10000, '공포', NULL),
	(10005, 10000, '스릴', NULL),
	(10006, 10000, '어린이', NULL),
	(10007, 10000, '모험', NULL),
	(10008, 10001, '공포', NULL),
	(10009, 10001, '모험', NULL),
	(10010, 10001, '스릴', NULL),
	(10011, 10001, '아이들', NULL),
	(10012, 10001, '파리', NULL),
	(10013, 10002, '우주', NULL),
	(10014, 10002, '나혼자', NULL),
	(10015, 10002, '감자', NULL),
	(10016, 10002, '맛있다', NULL),
	(10017, 10002, '생존', NULL),
	(10018, 10002, '극한', NULL),
	(10019, 10003, '그림', NULL),
	(10020, 10003, '현대', NULL),
	(10021, 10003, '미술', NULL),
	(10022, 10003, '스릴', NULL),
	(10023, 10003, '반전', NULL),
	(10028, 10004, '대서사시', NULL),
	(10029, 10004, '판타지', NULL),
	(10030, 10004, '중세', NULL),
	(10031, 10004, '반지', NULL),
	(10032, 10004, '원정', NULL),
	(10033, 10005, '과학', NULL),
	(10034, 10005, '생물', NULL),
	(10035, 10005, '어린이', NULL),
	(10036, NULL, '책', 'kimsur1111@naver.com'),
	(10037, NULL, '작가', 'kimsur1111@naver.com'),
	(10038, NULL, '소설', 'kimsur1111@naver.com'),
	(10039, NULL, '추리', 'kimsur1111@naver.com'),
	(10040, 10006, '에세이', NULL),
	(10041, 10006, '시', NULL),
	(10043, 10010, '로맨스', NULL),
	(10044, 10025, '이탈리아', NULL),
	(10045, 10025, '파스타', NULL),
	(10046, 10025, '요리', NULL),
	(10047, 10025, '생활요리', NULL),
	(10048, 10026, '시집', NULL),
	(10049, 10027, '자기계발', NULL),
	(10050, 10027, '기획', NULL),
	(10051, 10027, '시간관리', NULL),
	(10052, 10032, '인구통계학', NULL),
	(10053, 10033, '요리', NULL),
	(10054, 10033, '생활요리', NULL),
	(10055, 10033, '채식', NULL),
	(10056, 10034, '포트폴리오', NULL),
	(10057, 10035, '', NULL),
	(10058, 10036, '포트폴리오', NULL),
	(10059, 10037, '교육', NULL),
	(10060, 10038, '연인', NULL),
	(10061, 10038, '사랑', NULL),
	(10062, 10038, '로맨스', NULL),
	(10063, 10038, '추리', NULL),
	(10064, 10038, '공포', NULL),
	(10066, 10041, '', NULL);
/*!40000 ALTER TABLE `hashtag` ENABLE KEYS */;

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

-- 테이블 데이터 liblibero.pay:~16 rows (대략적) 내보내기
/*!40000 ALTER TABLE `pay` DISABLE KEYS */;
INSERT INTO `pay` (`pay_no`, `user_id`, `payment_type`, `actual_price`, `receiver_name`, `receiver_addr`, `receiver_phone`, `delivery_req`, `pay_date`, `delivery_code`, `pay_code`, `cancel_type`) VALUES
	('imp_114093786868', 'wjddbstp@naver.com', 'card', 100, '정윤세', '17066 경기 용인시 기흥구 기흥역로58번길 78,구갈동, 기흥역 더샵, ', '01077374501', '빨리 와주세요~', '2020-08-18 14:38:45', 4, 'paid', NULL),
	('imp_125999169853', 'choije9410@gmail.com', 'card', 100, '최지은', '06134 서울 강남구 테헤란로5길 11, 역삼동 YBM 빌딩 2층', '010-0000-3555', '', '2020-04-18 16:34:50', 1, 'paid', NULL),
	('imp_211530641120', 'choije9410@gmail.com', 'card', 100, '최지은', '06134 서울 강남구 테헤란로5길 11,역삼동 YBM 빌딩 2층, 비트캠프', '010-0000-3555', '', '2020-08-18 11:25:59', 1, 'paid', NULL),
	('imp_232027340337', 'buyer@naver.com', 'card', 100, '최지은', '06134 서울 강남구 테헤란로5길 11,역삼동 YBM 빌딩 2층, 비트캠프', '010-0000-3555', '', '2020-08-18 10:27:44', 4, 'paid', NULL),
	('imp_277997831331', 'choije9410@gmail.com', 'card', 100, '최지은', '06134 서울 강남구 테헤란로5길 11,역삼동 YBM 빌딩 2층, 비트캠프', '010-0000-3555', '', '2020-08-18 17:07:08', 1, 'paid', NULL),
	('imp_284676742973', 'choije9410@gmail.com', 'card', 100, '최지은', '06134 서울 강남구 테헤란로5길 11,역삼동 YBM 빌딩 2층, 비트캠프', '010-0000-3555', '', '2020-08-18 17:01:45', 1, 'paid', NULL),
	('imp_524335958714', 'user01', 'card', 100, '박소비자', '06134 서울 강남구 테헤란로5길 11 역삼동 역삼동 YBM건물 2층 비트캠프', '010-0101-0101', '', '2020-06-18 16:39:25', 1, 'paid', NULL),
	('imp_623226323783', 'user01', 'card', 100, '유저01', ' ', '010-0101-0101', '', '2020-08-18 17:11:03', 1, 'paid', NULL),
	('imp_646735670175', 'buyer@naver.com', 'card', 100, '박소비자', '강남구 테헤란로5길 11 YBM빌딩 2층 205호', '01042796268', '문 앞에 놓고 가주세요 ~', '2020-08-18 15:22:46', 5, 'paid', NULL),
	('imp_673934945890', 'kimsur1111@hanmail.net', 'card', 100, '김작가', '06134 서울 강남구 테헤란로5길 11,역삼동 YBM 빌딩 2층, 201호', '01094303757', '문 앞에 놓고 가주세요 !', '2020-08-18 12:56:19', 1, 'paid', NULL),
	('imp_744770622922', 'kimsur1111@hanmail.net', 'card', 18000, '', ' ', '', '', '2020-08-18 01:46:42', 1, 'paid', NULL),
	('imp_771780746677', 'user01', 'card', 100, '최지은', '06134 서울 강남구 테헤란로5길 11,역삼동 YBM 빌딩 2층, 비트캠프', '010-0000-3555', '', '2020-05-18 15:23:34', 5, 'paid', NULL),
	('imp_781671925350', 'choije9410@gmail.com', 'card', 100, '최지은', '06134 서울 강남구 테헤란로5길 11,역삼동 YBM 빌딩 2층, 비트캠프', '010-0000-3555', '', '2020-08-18 14:48:30', 5, 'paid', NULL),
	('imp_792996908661', 'choije9410@gmail.com', 'card', 100, '최지은', '16697 경기 수원시 영통구 매영로310번길 12 영통동, 신성.신안.쌍용.진흥아파트 영통동, 신성.신안.쌍용.진흥아파트 ', '010-3593-9410', '', '2020-08-18 10:10:51', 5, 'paid', NULL),
	('imp_941784037318', 'user01', 'card', 100, '최지은', '06134 서울 강남구 테헤란로5길 11,역삼동 YBM 빌딩 2층, 비트캠프', '010-0000-3555', '', '2020-05-18 10:40:13', 4, 'paid', NULL),
	('imp_973427422143', 'user02', 'card', 100, '박구매자', '06134 서울 강남구 테헤란로5길 11 역삼동 YBM 건물 2층 비트캠프', '010-0202-0202', '', '2020-03-18 15:34:24', 4, 'paid', NULL);
/*!40000 ALTER TABLE `pay` ENABLE KEYS */;

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
) ENGINE=InnoDB AUTO_INCREMENT=10031 DEFAULT CHARSET=utf8;

-- 테이블 데이터 liblibero.post:~19 rows (대략적) 내보내기
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` (`post_no`, `post_type`, `user_id`, `post_name`, `post_content`, `reg_date`, `blind_code`, `view_count`, `comment_count`, `qna_reg_type`, `qna_code`, `report_count`) VALUES
	(10010, 'n', 'admin1', '출판 편집 전문가 지원 서비스 오픈', '<p>작가서비스는 국내 최초로 출판관련 프리랜서가 입점, </p><p>작가가 프리랜서들의 포트 폴리오를 직접확인하고, 희망하는 프리랜서에게 직접 의뢰를 하는 서비스로 출판편집 전문서비스입니다.</p><p><br></p><p><img src="/libero/resources/images/community/fileUpload/7bbd46b2-1528-4ee0-88dd-8f5df8f6786c.jpg" style="width: 807.798px; height: 547.078px;"></p><p><br></p><p>부크크 작가서비스의 큰 특징은 시안차수 거래시스템을 도입하여, </p><p>거래 횟수 제안이 명확하지 않았던 기존 프리랜서 위주의 거래방식보다 작가에게 더 안전하게 만들었습니다. </p><p>작가서비스는 플랫폼 내에서 작업에 대한 결제부터 시안을 확인하고 프리랜서와 작가가 대화할 수 있도록 시스템을 갖춰두었습니다.</p><p><br></p><p>고급표지는 이미 만들어진 표지를 구입하면 단 하나뿐인 나만의 표지로 편집해주는 서비스입니다. </p><p>1만원에서 10만원 사이의 저렴한 금액으로 표지를 구매할 수 있으며, 한 번 판매된 표지는 다시 판매되지 않습니다^^</p>', '2020-08-17 19:12:49', 'show', 0, 0, NULL, NULL, 0),
	(10011, 'n', 'admin1', '[표지재질 업데이트] 아르떼가 추가되었습니다.', '<p>안녕하세요. 리브리베로 최지은입니다.</p><p>책만들기를 통해서 선택할 수 있는 표지재질이 아래와 같이 업데이트 되었습니다.</p><p><br></p><p><br></p><p style="text-align: left;">[추가된 표지재질] 아르떼(광택있는): 아르떼210g, 유광코팅</p><p style="text-align: left;">[삭제된 표지재질] 르네상스(거친느낌): 르네상스270g, 코팅없음</p><p style="text-align: left;"><br></p><p style="text-align: left;"><img src="/libero/resources/images/community/fileUpload/b53c5340-e08a-48a7-b706-dad8496d36e3.jpg" style="width: 512px;"><br></p><p><br></p><p><br></p><p>르네상스의 거친느낌의 질감을 좋아해주시고 선택해주신 작가님들에게는 아쉬운 소식을 전해드린 것 같아서 죄송합니다. 르네상스 종이를 빼게된 계기는 시즌2가 되면서 바뀐 부분과 관련되어 2가지 이유가 있습니다.</p><p><br></p><p><br></p><p>1) "아르떼210g, 무광코팅" 표지재질이 르네상스를 대체할만한 표지입니다.</p><p>- 리브리베로 시즌1에 인쇄소의 한계로 인해서 지원하지 못했던 표지를 시즌2에 지원이 가능하게 되었습니다. 리브리베로를 시작하며 시중에 있는 도서관을 조사하여 자주 사용되는 표지를 조사했었는데요. 그 당시에 아르떼210g, 무광코팅을 사용하는 표지가 많이 있었습니다.</p><p><br></p><p>하지만 초기에는 이러한 표지를 제작할 수 있는 여건이 되지 않아서 부득이 거친표지(랑데뷰205g, 르네상스270g)을 이용하던 상황이었습니다. 시즌2와 함께 아르떼210g, 무광코팅이 추가되어 이전까지 임시 대체재로 사용하던 종이를 빼기로 결정했습니다.</p><p><br></p><p><br></p><p><br></p><p>2) 표지날개가 추가되며 발생한 문제</p><p>- 더불어 표지날개가 추가되면서, 표지가 접히는 부분이 생기는데요. \'르네상스270g, 코팅없음\' 표지처럼 코팅이 들어가지 않은 표지의 경우는 접히는 부분이 튿어지는 문제가 발생했습니다.</p><p>따라서 날개지원과 함께 르네상스270g 표지가 적절하지 않은 상황이 되었습니다.</p><p><br></p><p><br></p><p><br></p><p>그래서 유광코팅 표지(아르떼 210g, 유광코팅)를 추가하였습니다.</p><p><br></p><p>르네상스 표지를 없애면서, 추가로 유광코팅에 대한 작가님들의 요청을 수용하기 결정을 했습니다. 기존에 유광코팅으로 책을 제작하기를 희망하셨던 분들에게는 좋은 소식이 되기를 기대하며 추가를 했는데요. 많은 호응이 있었으면 좋겠습니다^^</p><p><br></p><p>* 기존 도서에 대한 조치(르네상스270g, 무코팅 -&gt; 아르떼210g, 무광코팅)</p><p>- 기존에 르네상스270g, 무코팅을 선택하신 도서에 대해서는 특별한 요청이 없는 경우에는 일괄적으로 아르떼210g, 무광코팅으로 변경하도록 하겠습니다.</p><p><br></p><p><br></p>', '2020-08-17 19:15:22', 'show', 1, 0, NULL, NULL, 0),
	(10012, 'n', 'admin1', '제작실 휴가로 인한 출고지연 안내', '<p>무더운 여름 잘 보내고 계신지요?</p><p>이번 주부터 휴가 시즌이 시작되는 것 같습니다. 즐겁고 안전한 휴가 보내시길 바랍니다.</p><p>이번 연도 당사 제작팀 담당자분들 휴가 일정은 아래와 같습니다.</p><p><br></p><p><img src="/libero/resources/images/community/fileUpload/2375cdec-d79e-4909-b51a-c30d470d2846.jpg" style="width: 725.647px; height: 452.078px;"></p><p><br></p><p>◆ 휴가일정 : 8월 14일(수) ~ 8월 18일(일)</p><p>◆ 휴가 영향 : 도서 제작 및 출고 지연</p><p><br></p><p>8월 5일(월요일) 주문 건까지는 8월 6일(화)과 8월 7일(수)에 배송 출고가 될 예정입니다.</p><p>8월 5일(월요일) 오후 2시 30분 이후 주문 건부터는 제작팀 업무 복귀하는 8월 12일 월요일부터</p><p>제작이 시작되어 배송 출고가 지연될 것으로 보입니다.</p><p><br></p><p>제작 외 고객센터, 원고 검수팀, 디자인팀은 모두 정상업무 됩니다.</p><p>이해해주심에 깊은 감사드립니다.</p><p>업무 복귀 후 최대한 빨리 출고될 수 있도록 노력하겠습니다.</p><p><br></p><p><br></p><p>감사합니다.</p>', '2020-08-17 19:18:31', 'show', 1, 0, NULL, NULL, 0),
	(10013, 'n', 'admin1', '[마감]자가출판플랫폼 \'부크크\'와 함께하는 한권무료 이벤트!', '<p>자가출판플랫폼 \'리브리베로\'와 함께하는 무료출판 이벤트!&nbsp;</p><p><span style="font-size: 1rem;">8월을 맞이해 이벤트를 준비하였습니다.</span></p><p>리브리베로에서 무료로 출판하면 본인 소장용 도서 한 권을 선물로 보내드립니다^^</p><p><br></p><p><img src="/libero/resources/images/community/fileUpload/5be8a7be-b5f6-4fe3-806c-f91711d55f29.jpg" style="width: 596px;"></p><p><br></p><p>어떠한 장르도 상관없습니다~</p><p>본인의 작품을 책장에 꽂아두고 평생 간직하세요!</p><p><br></p><p>참여방법</p><p>이벤트 소식을 공유하거나 리브리베로에 대해 소문을 내주시고 출판하면 끝!</p><p><br></p><p>※증정되는 도서는 본인이 집필한 원고에 한합니다.</p><p><br></p>', '2020-08-17 19:20:21', 'show', 11, 0, NULL, NULL, 0),
	(10014, 'n', 'admin1', '서버 점검 안내', '<p>안녕하세요, 출판플랫폼 리브리베로 개발팀입니다.</p><p>보다 나은 서비스를 제공하기 위해 리브리베로 DNS 교체 작업이 이루어집니다.&nbsp;</p><p>하기 내용을 양지하시어 이용에 불편이 없도록 유의하시기 바랍니다.</p><p><br></p><p><img src="/libero/resources/images/community/fileUpload/9afb2fdd-0ee3-4d1f-8d76-a3b47424c570.jpg" style="width: 760.998px; height: 447.078px;"><br></p><p><br></p><p><br></p><p><br></p><p>* 작업 내용</p><p><br></p><p>&nbsp; DNS 교체 작업 (네임서버 교체 작업)</p><p><br></p><p><br></p><p><br></p><p>* 일정안내</p><p><br></p><p>&nbsp; 작업 시작 : 2020년 08월 15일(토) 오전 1시부터</p><p><br></p><p>&nbsp; 작업 종료 : 2020년 08월 16일(일) 오후 6시까지</p><p><br></p><p><br></p><p><br></p><p>* 서비스 이용 유의사항</p><p><br></p><p>&nbsp; - 리브리베로접속이 간헐적으로 느려지거나, 접속되지 않을 수 있습니다.</p><p><br></p><p>&nbsp; - 작업이 종료되면 정상적으로 이용이 가능하십니다. 가급적 이메일을 보내시게 된다면 17일 이후 보내주시면</p><p><br></p><p>&nbsp; &nbsp;성실히 처리해드리겠습니다.</p><p><br></p><p>&nbsp; (해당 기간 이메일은 수신이 안될 수 있어, 반송함 또는 스팸메일함을 확인해 주시기 바랍니다.)</p><p><br></p><p><br></p><p><br></p><p>보다 쾌적한 환경과 서비스를 제공하기 위해서 노력하겠습니다.&nbsp;</p><p><br></p><p><br></p><p><br></p><p>항상 감사합니다.</p>', '2020-08-17 19:23:24', 'show', 0, 0, NULL, NULL, 0),
	(10015, 'n', 'admin1', '특별한 책, 특별하게 보관하는 방법', '<p>이윤경 회원님께서 작성해주신 책 보관법을 공지로 등록해두었습니다.&nbsp;<span style="font-size: 1rem;">여러분은 어떻게 보관하고 계신가요?</span></p><div id="section-1" class="part" style="font-family: &quot;Noto Sans KR&quot;, sans-serif; line-height: 1.8; padding-top: 0px; color: rgb(51, 51, 51); font-size: 18px;"><p class="headline font-size-3xlarge mt-9 mb-3 leading-tight" style="line-height: 1.8; margin-top: 3rem !important; margin-bottom: 0.75rem !important; font-size: 1.75rem !important;"><span style="font-weight: 700;">특별한 책, 특별하게 보관하는 방법</span></p><p style="margin-bottom: 0px; line-height: 1.8;">중국 작가 린위탕(1895–1976)은 &lt;생활의 발견&gt;에서 자연과 벗하며 사는 즐거움을 말하며 그 즐거움을 방해하는 열 가지 화나는 일을 나열합니다. 자신은 농부가 될 수 없고 고작 뜰에 물이나 뿌리고 풀 뜯기 정도만 할 수 있을 뿐이라며 아쉬워합니다.</p><blockquote style="margin-top: 2rem; margin-bottom: 2rem; padding-left: 20px; border-left: 3px solid rgb(195, 180, 160); font-size: 1.125rem; color: rgb(123, 119, 115);"><p style="margin-bottom: 0px; line-height: 1.8;">1. 책 겉장은 좀이 먹기 쉽고,</p><p style="margin-bottom: 0px; line-height: 1.8;">2. 여름밤은 모기 때문에 엉망진창이 되고,</p><p style="margin-bottom: 0px; line-height: 1.8;">3. 망월대는 비가 새기 쉽고,</p><p style="margin-bottom: 0px; line-height: 1.8;">4. 국화잎은 자칫하면 마르기 쉽고,</p><p style="margin-bottom: 0px; line-height: 1.8;">5. 소나무엔 큰 개미가 떼 지어 있기 쉽고,</p><p style="margin-bottom: 0px; line-height: 1.8;">6. 참대 잎은 온통 땅에 떨어져 쌓이고,</p><p style="margin-bottom: 0px; line-height: 1.8;">7. 물푸레나무와 연꽃은 시들기 쉽고,</p><p style="margin-bottom: 0px; line-height: 1.8;">8. 담쟁이 굴에는 뱀이 곧잘 숨고,</p><p style="margin-bottom: 0px; line-height: 1.8;">9. 시렁에 핀 꽃에는 가시가 있고,</p><p style="margin-bottom: 0px; line-height: 1.8;">10. 고슴도치는 독이 있어 먹을 수 없다는 것.</p><p style="margin-bottom: 0px; line-height: 1.8;">&nbsp;</p><p style="margin-bottom: 0px; line-height: 1.8;">- 린위탕(임어당), &lt;생활의 발견&gt;, 범우사(2011)</p></blockquote><p style="margin-bottom: 0px; line-height: 1.8;">애서가라면 린위탕의 고충을 이해할 수 있을 듯합니다. 자연에서 사는 데 가장 큰 걸림돌이 책이 상하는 것이니 그가 얼마나 책을 사랑했는지 미루어 짐작할 수 있습니다. 사실 &lt;생활의 발견&gt;에는 수많은 책이 소개되어 있고, 특히 노장 사상과 시에 대해선 그 깊이를 알 수 없을 만큼 명저이기도 합니다.</p><p style="margin-bottom: 0px; line-height: 1.8;"><br></p><p style="text-align: center; margin-bottom: 0px; line-height: 1.8;"><img src="/libero/resources/images/community/fileUpload/e95c2afa-d698-4c90-aa25-6283b1c797fe.png" style="width: 765px;"><br></p><p style="margin-bottom: 0px; line-height: 1.8;"><big style="display: block; margin: 45px 0px; padding: 0px 10px; text-align: center;">옛사람들은 책이 좀 먹는 걸<br style="line-height: 36px; font-size: 1.24rem;">막기 위해 은행잎을<br style="line-height: 36px; font-size: 1.24rem;">책장 사이에 끼워 두기도 했습니다</big></p><p style="margin-bottom: 0px; line-height: 1.8;">가끔 책방의 책들을 살펴보다 은행잎이 나오는 경우가 있는데 단순히 가을 정취를 추억하고 책갈피로 쓰기 위한 것일 수도 있지만, 옛 선비의 지혜가 습관처럼 독서가들에게 내려온 것은 아닐까 생각합니다. 좀 같은 벌레뿐만 아니라 책을 위협하는 것은 도처에 널려 있습니다.&nbsp;<span style="font-weight: 700;">책은 얼마나 미약한 존재인가요.</span>&nbsp;이태준 선생은 책을 소녀와 유부인(遺夫人)에 비유하기도 했습니다.</p><blockquote style="margin-top: 2rem; margin-bottom: 2rem; padding-left: 20px; border-left: 3px solid rgb(195, 180, 160); font-size: 1.125rem; color: rgb(123, 119, 115);"><p style="margin-bottom: 0px; line-height: 1.8;">한 표정 고운 소녀와 같이, 한 그윽한 눈매를 보이는 젊은 미망인처럼 가지가지다. 신간란에서 새로 뽑을 수 있는 잉크 냄새 새로운 것은, 소녀라고 해서 어찌 다 그다지 신선하고 상냥스러우랴! 고서점에서 먼지를 털고 겨드랑 땀내 같은 것을 풍기는 것들은 자못 미망인다운 함축미인 것이다.</p><p style="margin-bottom: 0px; line-height: 1.8;">&nbsp;</p><p style="margin-bottom: 0px; line-height: 1.8;">- 이태준, &lt;무서록&gt;, 범우사(2010)</p></blockquote><p style="margin-bottom: 0px; line-height: 1.8;">그만한 매력에는 대가가 따르는 법이죠. 그 매력을 위협하고 시기하는 적들을 따로 분류하고 연구한 사람이 있었으니 바로 애서가이자 인쇄소 집안에서 태어난 윌리엄 블레이즈(William&nbsp;Blades)입니다. 그는 1824년 런던에서 태어나 부모가 경영하는 인쇄소에서 일하며 나중에 공동경영자가 되었습니다.</p><p style="margin-bottom: 0px; line-height: 1.8;">&nbsp;</p><div class="whole-chapter" style="line-height: 1.8;"><p style="margin-bottom: 0px; line-height: 1.8;">블레이즈는 서지학자인 헨리 브래드쇼와 함께 노동자를 계몽하기 위해 도서관협회를 설립했습니다. 또한 영국 최초의 인쇄업자이며 출판 대중화에 앞장선 윌리엄 캑스턴의 생애를 조사하고, 그의 성과를 기록한 &lt;윌리엄 캑스턴의 생애와 인쇄술(The Life and Typography of William Caxton)&gt;을 쓰고 &lt;책의 적(The Enemies of Books)&gt;을 남겼습니다.</p><p style="margin-bottom: 0px; line-height: 1.8;">&nbsp;</p><p style="margin-bottom: 0px; line-height: 1.8;">그는 &lt;책의 적&gt;에서 모두 열 가지 \'사악한 존재들\'을 언급했습니다. 불, 물, 가스와 열기, 먼지와 무관심, 무지와 편견, 책을 먹는 좀, 해로운 동물들, 제책사의 횡포, 서적 수집광, 하인과 아이들이 바로 끊임없이 책을 괴롭히고 망가뜨리는 존재들이죠.</p><p style="margin-bottom: 0px; line-height: 1.8;">&nbsp;</p><p style="margin-bottom: 0px; line-height: 1.8;">첫 번째로 불을 꼽은 것은 당연하다 생각합니다. 하지만 왜 책을 가장 사랑하는 서적 수집광을 책의 적으로 규정했는지 차례만 읽고선 의아했습니다. 그는 런던 골동품애호가협회 설립자인 존 백포드(1650–1716)를 예로 들었습니다.</p><p style="margin-bottom: 0px; line-height: 1.8;">&nbsp;</p><p style="margin-bottom: 0px; line-height: 1.8;">그는 지방 도서관을 돌아다니며 수많은 희귀본의 속표지를 잘라내 수집한 다음 국가와 지방별로 분류하고 또 다른 자료들을 모아 100여 권이 넘는 2절판 크기의 책으로 펴냈습니다. 자신의 책을 살 찌우기 위해 희귀본의 살점을 도려낸 거죠.</p><p style="margin-bottom: 0px; line-height: 1.8;">&nbsp;</p><p style="margin-bottom: 0px; line-height: 1.8;">당시 영국에서 그를 모방한 서적 수집광들이 희귀본들을 그렇게 훼손하고 다닌 것에 대해 윌리엄 블레이즈는 분개했습니다. 책이 가장 가치 있을 때는 서가에 꽂혀 있을 때가 아니라 책 읽는 이의 손에 들려 있을 때입니다. 그도 그 사실을 잘 알고 있는 독서인이었죠.</p><p style="margin-bottom: 0px; line-height: 1.8;">&nbsp;</p><p style="margin-bottom: 0px; line-height: 1.8;">다시 \'좀\'&nbsp;이야기로 넘어가서, 이 책엔 책의 소중함을 모르는 무식한 좀을 꾸지람하는 존 도바스톤(1782–1854)의 시가 인용되어 있습니다. 마지막 두 문장을 주목해서 읽어야 합니다.</p><blockquote style="margin-top: 2rem; margin-bottom: 2rem; padding-left: 20px; border-left: 3px solid rgb(195, 180, 160); font-size: 1.125rem; color: rgb(123, 119, 115);"><p style="margin-bottom: 0px; line-height: 1.8;">바삐 움직이는 벌레가 있어 / 가장 훌륭한 책들을 불구로 만드네. / 곳곳마다 갉아서 구멍을 내니 /&nbsp;네 발길 닿는 곳마다 온통 똑같은 모양이네. / 책의 소중함을 전혀 모르니 / 무엇을 알아서 상관하리오.</p><p style="margin-bottom: 0px; line-height: 1.8;">&nbsp;</p><p style="margin-bottom: 0px; line-height: 1.8;">맛도 모르는 이빨로 찢고 더럽히니 /&nbsp;시인, 우국지사, 현인, 성자는 / 지혜고 지식이고 아무것도 남길 수 없네.<br><br>자, 그대가 그 까닭을 모른다면 /&nbsp;내가 가장 타당한 이유를 말해 주지. /&nbsp;이것이야말로 가엾은 악당의 먹을거리라는 걸.<br><br>후춧가루, 코담배가루, 담배 연기에도 끄떡없고 /&nbsp;러시아 가죽마저 그들에겐 비웃음거리일 뿐. /&nbsp;그런데 학문의 후예들이 /&nbsp;이따위 하잘것없는 골칫거리를 두려워하랴? /&nbsp;<span style="font-weight: 700;">책을 펴놓고서 읽기만 한다면 / 벌레들은 저절로 사라지는 것을.</span></p><p style="margin-bottom: 0px; line-height: 1.8;">&nbsp;</p><p style="margin-bottom: 0px; line-height: 1.8;">-&nbsp;윌리엄 블레이즈, &lt;책의 적&gt;, 서해문집(2005)</p></blockquote><p style="margin-bottom: 0px; line-height: 1.8;">이 모든 책의 적을 피해 어찌 되었건 소중하게 간직하고픈 책들이 있습니다. 책방에 있는 대부분의 책을 팔지만, 팔지 않고 보관만 하는 책들도 있습니다. 되도록 책방 서가에 두지 않지만 손님들이 가끔 사무실 안쪽 서가나&nbsp;책상 위에 놓인 팔지 않는 책을 발견하곤 책방에서 왜 책을 팔지 않느냐 물으면 난감할 때가 있습니다.</p><p style="margin-bottom: 0px; line-height: 1.8;">&nbsp;</p><p style="margin-bottom: 0px; line-height: 1.8;">"팔기 싫어서요"라고 단도직입으로 말씀드릴 수는 없으니까요. 에둘러 "아직 책값을 정하지 못해서요"라고 하거나 "인터넷으로 구입하는 편이 더 저렴합니다"라고 합니다. 팔지 않는 책은 주로 구하기 어려운 사진책이거나 선물 받은 서명본이거나 너무 오래되어 값을 정할 수 없는 책이 대부분입니다. 지금 재밌게 읽고 있는 책도 포함해야겠군요.</p><p style="margin-bottom: 0px; line-height: 1.8;">&nbsp;</p><p style="margin-bottom: 0px; line-height: 1.8;"><span style="font-weight: 700;">특별하게 보관해야 하는 책은 제 경우엔 주로 1950–1960년대에 나온 책들입니다.</span>&nbsp;할아버지께 물려받은 한적(漢籍*)&nbsp;몇 권을 제외하면 대부분 그리 오래된 책이 아닙니다. 하지만 일제강점기, 분단, 전쟁, 독재와 쿠데타, 혁명으로 격동기를 거친 우리 근현대사는 출판에도 많은 영향을 미쳤습니다.</p><p style="margin-top: 0.3rem; margin-bottom: 0px; line-height: 1.8; color: rgb(127, 140, 141); font-size: 14px;">* 한문으로 쓴 책</p><p style="margin-bottom: 0px; line-height: 1.8;">&nbsp;</p><p style="margin-bottom: 0px; line-height: 1.8;">1950년대 나온 책들을 가끔 만나면 종이질이 워낙 나빠 만지기만 해도 부스러지는 경우가 있습니다. 감히 책장을 휘리릭 넘겨 볼 생각은 하지도 못합니다. 이런 책은 다른 책들과 함께 일반적인 방법으로는 보관할 수&nbsp;없습니다. 지식이 부족해 당장 책의 가치를 판단할 수 없다 해도 더는 훼손되지 않게 잘 보관하는 것이 중요하다고 생각합니다.</p><p style="margin-bottom: 0px; line-height: 1.8;">&nbsp;</p><p style="margin-bottom: 0px; line-height: 1.8;"><br></p></div></div>', '2020-08-17 19:25:57', 'show', 7, 0, NULL, NULL, 0),
	(10016, 'n', 'admin1', '소비자가격이 지나치게 높은 경우와 관련된 공지', '<p><span style="font-size: 1rem;">리브리베로에서는 언제나 사용자분들이 만족하는 서비스를 제공해드리고자 노력하고 개선해나가고자 합니다.</span><br></p><p>책을 만들때에 소비자가격을 결정하는 부분도 작가님들을 위한 것이 무엇일지 고민을 하였습니다.</p><p>그래서 정한 방침이 리브리베로에 손실이 발생하지 않는 한에서 작가님들이 자발적으로 소비자가격을 결정할 수 있도록 하는 것이었습니다.</p><p><br></p><p><br></p><p><br></p><p>대부분의 작가님들이, 소비자가격을 최소가격보다 낮추는 것을 원하셔서 요청을 하시는 경우가 종종 있었습니다.</p><p>하지만 낱권인쇄와 납본, 정산(35%)에 대한 리브리베로의 약속이 있었기에 그 이하로 낮추는 것이 어렵다는 것에 대해 작가님들에게 이해를 구했고, 많은 분들이 이해를 해주셨습니다.</p><p><br></p><p><br></p><p><br></p><p>하지만 최근에 특별한 경우가 발생하게 되어서 공지를 하게 되었습니다.</p><p>반대로 소비자가격을 지나치게 높게 책정해서 올려주시는 경우가 있었습니다.(500p 도서 15만원/50p 도서 3만원)</p><p>그래서 이러한 사항에 대해서 국립중앙도서관 ISBN 담당부서에 문의를 해보았습니다.</p><p><br></p><p><br></p><p><br></p><p>답변 내용을 정리하면, 가격을 얼마로 책정하든지 상관은 없으나 해당도서를 국립중앙도서관에서 납본으로 받았을 때 도서의 가격이 지나치게 높은 경우 심의회를 열어서 적합 여부를 결정하게 됩니다. 그 결과 해당 도서의 가격책정이 부적합하다고 판단이 되면, 해당 도서의 발행이 무효가 되지는 않으나(발행 도서를 삭제할 수 없으므로) 도서를 발행한 출판사에 패널티를 가하게 됩니다.</p><p><br></p><p><br></p><p><br></p><p>이에 따라서, 소비자가격을 지나치게 높은 상태로 ISBN 발행을 신청하는 경우는 리브리베로&nbsp;측에서 통보와 함께 반려처리를 할 수 있음을 알려드립니다. 가격을 시장에 통용되는 것 이상으로 등록을 하는 것은, 작가님들의 도서 판매에도 지장이 있을 뿐만 아니라 리브리베로에도 어려움이 있을 수 있기 때문입니다.</p><p>관련 사항들에 대해서 다양한 의견이 있을 수 있을 것 같습니다. 리브리베로&nbsp;내부적으로도 소비자가격의 최대치에 대한 가이드라인을 마련하고자 합니다. 도서의 페이지 분량뿐만 아니라, 해당 도서의 분야적 특성에 따라서 시장가격이 천차만별인 부분이 있어서. 우선은 가이드라인이 마련되기 전까지는 문제가 되는 건에 대해서 개별로 사유를 알려드리는 방식으로 진행하도록 하겠습니다.</p><p><br></p><p><img src="/libero/resources/images/community/fileUpload/da7ba3e5-4bef-48fc-b132-1f63ff94ea4c.jpeg" style="width: 400px;"><br></p><p><br></p><p>감사합니다.</p>', '2020-08-17 19:29:58', 'show', 1, 0, NULL, NULL, 0),
	(10018, 'f', 'doro16@naver.com', '나왔다! 거제도 김강사님의 스쿠버다이빙 보충수업!', '<p>2020년 7월 21일. 드디어 출판했습니다.</p><p>시작은 원대했지만 끝으로 갈수록 부족함과 부끄러움이 많아지더군요. 이렇게 또 깊이 배웁니다.</p><p>새로 시작한 다이버 또는 오랫동안 스쿠버를 쉬었던 분들을 위해 썼으니 주위에 널리 추천해주세요~</p><p><br></p><p><img src="/libero/resources/images/community/fileUpload/ecc60567-34b0-42c6-8e7d-c602a9a1b903.jpg" style="width: 515px;"><br></p>', '2020-08-17 19:35:47', 'require', 10, 0, NULL, NULL, 3),
	(10019, 'f', 'doro16@naver.com', '송석현 님의 따스한 세글자 잘 읽었습니다.', '<p>요즘 같은 추운 상황에 제목부터 무척 따스하게 느껴져요.&nbsp;</p><p><span style="font-size: 1rem;">그 따스함이 마음까지 전해집니다.</span></p><p>제목 페이지를 넘기면, ‘길목에서 만난 함께라는 단어 고맙습니다.’라는 표현을 만날 수 있어요.</p><p><br></p><p>‘함께’라는 이 글귀에 제 마음이, 눈길이 계속 가네요.^^</p><p><br></p><p>요즘 정말 이 단어가 얼마나 절실하고, 고마운지요.</p><p><br></p><p>얄밉던 남편도, 질풍노도의 사춘기를 보내는 아이들도 지금 이 순간, 함께 있어서 참 고맙더라고요.</p><p><br></p><p>&nbsp;</p><p><br></p><p>동행에서 ‘구부정한 길 앞에 홀로 서있는 한 남자’라는 첫 표현부터</p><p><br></p><p>문득 돌아가신 제 아버지가 생각나 울컥하게 되었어요.</p><p><br></p><p>가족이 당신의 마음을 알아주지 않아도 우리를 지켜주시기 위해 묵묵히 일만하셨던 아버지,</p><p><br></p><p>당신도 어떻게 할지 몰라 두려우셨을 텐데,</p><p><br></p><p>암에 걸려서 돌아가시는 순간까지 가족을 걱정하셨던 아버지........</p><p><br></p><p>평소 손 한번 잡아드리지도 못했고, 따스한 말 한마디도 못했던 제 마음을</p><p><br></p><p>66페이지의 마지막 글귀로 대신합니다.</p><p><br></p><p>당신이 보여주신 것이 사랑이라는 것을</p><p><br></p><p>그 동안 고마웠습니다.</p><p><br></p><p>&nbsp;</p><p><br></p><p>눈물을 흘리는 별에서는 별의 의미를 알게 되어 좋았어요.</p><p><br></p><p>받은 것이 많아서 흘러 넘칠까봐</p><p><br></p><p>받은 것이 많아서 사라질까봐</p><p><br></p><p>받은 것이 많아서 잊혀질까봐</p><p><br></p><p>뜨겁게 뜨겁게 흘리고 있다는 것을 알게 되었습니다.</p><p><br></p><p>&nbsp;</p><p><br></p><p>잡아주세요에서는 내 스스로 만든 외로움에 대하여 설명해주셨는데 절대 공감합니다.</p><p><br></p><p>&nbsp;</p><p><br></p><p>계속 읽다보면 파스텔 색깔로 물들인 연인들의 사랑이야기 같아요.</p><p><br></p><p>대만영화 ‘나의 소녀시대’를 떠올리게 합니다.</p><p><br></p><p>특히 조각난 어울림을 읽었을 때는</p><p><br></p><p>영화 속 여주인공이 남주인공에게 잘 보이려고 한껏 꾸몄는데,</p><p><br></p><p>남주인공은 고등학교선생님 같다며 놀리는 장면이 생각나 많이 웃었어요.</p><p><br></p><p>&nbsp;</p><p><br></p><p>좋은 글 감사히 잘 읽었습니다.^^</p><p><br></p><p>지난번에 댓글로 좋은 책 열심히 읽겠다고 올렸는데 이제야 글 올립니다.</p><p><br></p><p>제가 워낙 게을러서 행동으로 옮기기까지 시간이 좀 걸려요.</p><p><br></p><p>그리고 책 내용에 대하여 개인적인 경험에 의한 느낌을 적었을 뿐이니</p><p><br></p><p>작가님 또는 다른 분들의 의견과 다를 수 있음을 이해부탁 드립니다.</p>', '2020-08-17 19:37:15', 'show', 9, 0, NULL, NULL, 0),
	(10020, 'f', 'doro16@naver.com', '영화를 좋아하는 사람들을 위하여', '<p>반갑습니다!</p><p>네 번째 책 &lt;영화 생각&gt;을 만든 고등학생 작가 김현우입니다.</p><p>그 이전의 책들은 이렇게 홍보하기 선뜻 망설여졌는데요, 이번 책만큼은 뭔가 자신있게 소개할 수 있어서 좋습니다.</p><p><br></p><p>모두들 영화를 좋아하실 겁니다. 다른 장르의 예술에 비해 다가가기 쉽고, 직관적이고, 짧게 끝나죠. </p><p>저도 그런 매력에 빠진 학생이고, 어릴 적부터 영화광이었습니다. 지금도 마찬가지구요.</p><p><br></p><p><img src="/libero/resources/images/community/fileUpload/fb5aa7c3-9b8e-41e1-a0a5-6ab08183baaf.jpg" style="width: 555px;"></p><p><br></p><p><br></p><p>이 책은 제가 중학생 때 부터 쌓아온 영화 관련 글들을 모은 책입니다. 제 삶이 녹아들어있고, 제 생각이 담겨있어요.</p><p><br></p><p>제가 비록 영화계에서 일하고 있는 전문가는 아니지만, 영화 지망생으로서, 나름 수많은 영화를 봐 온 학생으로서, 최선을 다해 글을 썼습니다.</p><p><br></p><p><br></p><p><br></p><p>이제 수능만 보면 제 학창시절은 끝납니다. 대학생이 되면, 저는 육중한 책임감으로 사회에 떨어지게 되겠죠.</p><p><br></p><p>어쩌면 이 책은 제가 따듯한 알 속에서 마지막으로 쓴 책이 되겠네요. 앞으로는 정식으로, 열심히 영화계에 종사해야겠죠.</p><p><br></p><p><br></p><p><br></p><p>저는 이 책을, 저를 둘러싼 이 안정적인 세상, 커다란 알을 깨뜨리기 위한 도약이라고 생각합니다.</p><p><br></p><p>서툴고 불완전한 글이지만, 나름 적잖은 양으로 제가 가진 지식들을 신나게 쏟아냈으니까요, 많은 사랑 부탁드리겠습니다.</p><p><br></p><p><br></p><p><br></p><p>분명 영화를 좋아하시는 분들이라면 특히 이 책을 읽고 공감하는 부분이 많을 겁니다.</p><p><br></p><p><br></p><p><br></p><p>자신만의 알을 깨뜨리신 분들, 자신만의 알을 깨뜨려야만 하는 분들.</p><p><br></p><p>모두에게 건강이 깃들기를 바래요.</p>', '2020-08-17 19:39:32', 'show', 10, 0, NULL, NULL, 1),
	(10021, 'f', 'doro16@naver.com', '한달동안 6권 팔았어요', '<p>기존 작가의 발의 때만큼도 미치지 못하는 권수이지만...ㅋㅋ</p><p>그래도 제 책이 팔렸다는게 뭔가 뿌듯하네요.ㅎㅎㅎ</p><p>인터넷으로 글 연재할 때랑은 다른 재미~~ 여러분 이거 보시고 말싸움에서 꼭 지지마세요!</p><p><br></p><p><img src="/libero/resources/images/community/fileUpload/e965add5-7a88-49db-b9d7-cfdadd23cbba.jpg" style="width: 800px;"><br></p>', '2020-08-17 19:41:28', 'show', 23, 3, NULL, NULL, 0),
	(10022, 'f', 'doro16@naver.com', '100년 뒤 우리는 이 세상에 없어요.', '<p>부제는 그러니까, 사소한 일에 목숨 걸지마세요 입니다.&nbsp;</p><p><span style="font-size: 1rem;">저의 소박한 생각을 담았는데 </span></p><p><span style="font-size: 1rem;">몇 자 적고 가겠습니다.</span></p><p><span style="font-size: 1rem;"><br></span></p><p><img src="/libero/resources/images/community/fileUpload/28a6ab09-3ee0-4316-8387-e2a4b2f1eedc.jpeg" style="width: 800px;"><span style="font-size: 1rem;"><br></span></p><p><span style="font-size: 1rem;"><br></span></p><p><span style="font-size: 1rem;"><br></span></p><p>p.123</p><p><br></p><p>마음의 평정을 잃고 싶지 않다면, 대개는 옳은 사람이 되기보다 친절한 사람이 되는 쪽을 선택해야 합니다. 그리고 가장 좋은 출발점은 지금 당신이 옆 사람과 나누고 있는 대화인겁니다.</p><p><br></p><p>p<span style="font-size: 1rem;">.216</span></p><p><br></p><p>당신이 삶에서 늘 연습하는 대상이 곧 자신의 모습이 될 거라는 사실을 떠올린다면, 아마 지금과는 다른 것을 연습하게 될 겁니다.</p><p><br></p><p><br></p><p><br></p>', '2020-08-17 19:45:00', 'show', 9, 1, NULL, NULL, 1),
	(10023, 'f', 'kimsur1111@hanmail.net', '사랑을 다룬 공포 소설, 여름의 더위를 쫓아내세요 !', '<p>여름이 덥지는 않으신가요 ? 더위를 쫓아내시기 위해 <span style="background-color: rgb(247, 198, 206);">공포 이야기 </span>어떠세요?</p><p><br></p><p>많은 사랑 부탁드립니다 !</p><p><br></p><p><img src="/libero/resources/images/community/fileUpload/b4ba8626-0894-40c7-94b8-726baf585641.jpg" style="width: 25%;"></p>', '2020-08-18 14:44:57', 'show', 51, 3, NULL, NULL, 1),
	(10025, 'q', 'choije9410@gmail.com', '안녕하세요 인쇄소는 3개만 있는건가요?', '<p>지금 있는 인쇄소 3개만 사용 가능한가요?</p>', '2020-08-18 16:14:50', 'show', 2, 0, 'p', 'x', 0),
	(10026, 'q', 'doro16@naver.com', '혹시 주문한 책 취소가 가능할까요?', '<p>최초 1권만 주문 후 다량주문하라는 메일을 제대로 확인하지 못 하고 첫 주문에 많은 양을 넣어버렸습니다. </p><p>제 부주의로 인한 것이라... 정말 죄송하지만 혹시 인쇄 시작되지 않았다면 주문 취소를 하고 싶습니다. </p><p><br></p>', '2020-08-18 16:32:09', 'show', 1, 0, 'b', 'x', 0),
	(10027, 'q', 'kimsur1111@hanmail.net', '로고 제거 문의', '<p>방금 업로드하였는데 개인 소장용 책도 리브리베로 로고 제거가 불가능한가요?&nbsp; </p><p>표지 디자인을 따로 한거라 로고가 없으면 좋겠습니다.. </p><p>그리고 문서는 1:1 문의로 확인을 받고 표지, 내지 둘다 도련하는 부분 3mm씩 추가해서 제작했는데요~ </p><p>업로드할 때 보니까 표지크기가 많이 벗어나서요, 제가 잘못 제작한건지 모니터상으로 보이는 이미지가 실제크기가 아닌건지 알 수가 없네요.</p><p><br></p><p>제가 25일에 필요해서 최대한 빠르게 진행되면 좋겠습니다.. 24일까지 배송이 어렵다면 직접 찾으러 가고 싶은데, 별 문제 사항 없으면 24일까지 제작은 가능한지 궁금합니다.</p><p><br></p><p><br></p><p><br></p><p>정리하자면</p><p><br></p><p><br></p><p><br></p><p>1. 개인 소장용 책 리브리베로 로고 제거 가능한가요?</p><p><br></p><p>2. 제작 시 표지 및 내지 사이즈 확인 부탁드려요</p><p><br></p><p>&nbsp; 이미지 전체 다 나오는 거라(풀빼다라고 하시던데) 기본 사이즈보다 상하좌우 3mm씩 추가했습니다</p><p><br></p><p>3. 수정사항이 없다면 승인과 제작까지 24일 안에 가능할까요?</p>', '2020-08-18 16:37:50', 'show', 16, 1, 'p', 'o', 0),
	(10028, 'q', 'doro16@naver.com', '정산 관련 문의드립니다', '<p>담당자 님, 안녕하십니까?</p><p><br></p><p>정산 관련 문의드립니다.&nbsp;</p><p>저희는 저자가 여러 분이셔서&nbsp;&nbsp;</p><p>현재의 1만원 단위 결제 시 정확한 정산이 어렵습니다.&nbsp;</p><p>그래서 각각의 내역을 시트로 받을 수 있다면 좋을 것 같습니다.&nbsp;</p><p>처리를 부탁드립니다.</p><p><br></p><p><br></p><p>수고에 항상 감사드립니다.</p>', '2020-08-18 16:43:32', 'show', 4, 1, 'u', 'o', 0),
	(10029, 'q', 'doro16@naver.com', '소장용 책 20권 정도 만드려는데 가격이 얼마나 될까요?', '<p>소장용으로 책을 20권 정도 만들고 싶은데 대충 제작비가 얼마 정도 나올지 알 수 있을까요?<br></p>', '2020-08-18 16:45:21', 'show', 1, 1, 'p', 'o', 0),
	(10030, 'q', 'kimsur1111@hanmail.net', '전자책 구매 폰을 바꿔다시하려니', '<p>헤어디자이너의 인턴일기 저자 김작가입니다. </p><p>제 책의 전자책을 다시 받을려고하니 이미 구매했다고 다운이안되는데</p><p> 폰을바꾸어 다시 받으려면 어찌해야하나요<br></p>', '2020-08-18 16:47:19', 'show', 2, 1, 'u', 'o', 0);
/*!40000 ALTER TABLE `post` ENABLE KEYS */;

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
  `report_count` int(11) DEFAULT '0',
  PRIMARY KEY (`prod_no`),
  KEY `FK_product_user` (`factory_id`),
  KEY `FK_product_user_2` (`creator`),
  KEY `prod_type` (`prod_type`),
  CONSTRAINT `FK_product_user` FOREIGN KEY (`factory_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `FK_product_user_2` FOREIGN KEY (`creator`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10043 DEFAULT CHARSET=utf8;

-- 테이블 데이터 liblibero.product:~40 rows (대략적) 내보내기
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` (`prod_no`, `prod_type`, `prod_name`, `prod_detail`, `author`, `retail_price`, `print_price`, `blind_code`, `prod_thumbnail`, `cover_file`, `purpose_code`, `manu_file`, `reg_date`, `discount_code`, `book_page`, `size_type`, `color_type`, `cover_type`, `inner_type`, `factory_id`, `creator`, `like_count`, `book_category`, `report_count`) VALUES
	(10000, 'paper', 'Holes!', '<p><br></p><p><span style="color: rgb(51, 51, 51); font-family: malgun, &quot;Malgun Gothic&quot;, Dotum, 돋움, sans-serif; font-size: 15px; letter-spacing: -0.3px;">1999년 뉴베리상을 받은 청소년과 성인을 위한 소설. &lt;There\'s a Boy in the Girls\' Bathroom&gt;의 지은이 루이스 새커의 이름을 알린 소설이다.</span><br style="color: rgb(51, 51, 51); font-family: malgun, &quot;Malgun Gothic&quot;, Dotum, 돋움, sans-serif; font-size: 15px; letter-spacing: -0.3px;"><br style="color: rgb(51, 51, 51); font-family: malgun, &quot;Malgun Gothic&quot;, Dotum, 돋움, sans-serif; font-size: 15px; letter-spacing: -0.3px;"><span style="color: rgb(51, 51, 51); font-family: malgun, &quot;Malgun Gothic&quot;, Dotum, 돋움, sans-serif; font-size: 15px; letter-spacing: -0.3px;">주인공 소년 스탠리의 가문은 고조할아버지 대로부터 전해져 내려오는 \'저주\'에 걸린 집안이다. 그 저주 때문에 스탠리는 \'재수없게도\' 청소년 감호소에 보내지게 된다. 캠프 그린 레이크라는 그 감호소에서 소년들이 하는 일은 매일 하루종일 커다란 구덩이를 파는 일.</span><br style="color: rgb(51, 51, 51); font-family: malgun, &quot;Malgun Gothic&quot;, Dotum, 돋움, sans-serif; font-size: 15px; letter-spacing: -0.3px;"><br style="color: rgb(51, 51, 51); font-family: malgun, &quot;Malgun Gothic&quot;, Dotum, 돋움, sans-serif; font-size: 15px; letter-spacing: -0.3px;"><span style="color: rgb(51, 51, 51); font-family: malgun, &quot;Malgun Gothic&quot;, Dotum, 돋움, sans-serif; font-size: 15px; letter-spacing: -0.3px;">감호소에 모인 소년들은 어느 날 문득, 이 일이 그저 자신들을 벌주기 위한 것이 아니라, 감독관이 무언가 절실히 찾는 것이 있어 계획되었음을 알게 된다. 그러나 과연 그것이 무엇일까? 모험, &lt;파리대왕&gt;과 같은 집단과 개인의 이야기가 있는, 그러면서도 유머러스한 이야기.</span><br></p>', 'Louis Sachar', 21100, 10550, 'show', '6b58f695-3c3d-4412-a991-56a66fa9db8a.jpg', 'f1853937-5bd3-4db4-b2df-227bae985ba0.jpg', 'sale', '4d5da1b9-cbe3-4b6c-8494-a3440112acf4.pdf', '2020-08-17 18:34:05', 'o', 215, 'b5', 'color', 'mont', 'rough', 'factory01@naver.com', 'wjddbstp@naver.com', 0, '소설', 1),
	(10001, 'paper', 'Lord of the Flies', '<p><br></p><p><span style="color: rgb(51, 51, 51); font-family: malgun, &quot;Malgun Gothic&quot;, Dotum, 돋움, sans-serif; font-size: 15px; letter-spacing: -0.3px;">\'파리대왕\'은 성서에 등장하는 말로 악마를 뜻한다. 비행기 사고로 남해의 외딴섬에 표류하게 된 몇 명의 소년들은 문명적인 규칙을 자신들에게 부과하여 공동체를 만들지만 결국 원시적인 야만상태로 퇴행해 간다. 이 작품으로 골딩은 1983년 노벨문학상을 받았다.</span><br style="color: rgb(51, 51, 51); font-family: malgun, &quot;Malgun Gothic&quot;, Dotum, 돋움, sans-serif; font-size: 15px; letter-spacing: -0.3px;"><br style="color: rgb(51, 51, 51); font-family: malgun, &quot;Malgun Gothic&quot;, Dotum, 돋움, sans-serif; font-size: 15px; letter-spacing: -0.3px;"><br style="color: rgb(51, 51, 51); font-family: malgun, &quot;Malgun Gothic&quot;, Dotum, 돋움, sans-serif; font-size: 15px; letter-spacing: -0.3px;"><br style="color: rgb(51, 51, 51); font-family: malgun, &quot;Malgun Gothic&quot;, Dotum, 돋움, sans-serif; font-size: 15px; letter-spacing: -0.3px;"><span style="color: rgb(51, 51, 51); font-family: malgun, &quot;Malgun Gothic&quot;, Dotum, 돋움, sans-serif; font-size: 15px; letter-spacing: -0.3px;">Lord of the Flies remains as provocative today as when it was first published in 1954, igniting passionate debate with its startling, brutal portrait of human nature. Though critically acclaimed, it was largely ignored upon its initial publication. Yet soon it became a cult favorite among both students and literary critics who compared it to J.D. Salinger\'s The Catcher in the Rye in its influence on modern thought and literature.</span><br style="color: rgb(51, 51, 51); font-family: malgun, &quot;Malgun Gothic&quot;, Dotum, 돋움, sans-serif; font-size: 15px; letter-spacing: -0.3px;"><br style="color: rgb(51, 51, 51); font-family: malgun, &quot;Malgun Gothic&quot;, Dotum, 돋움, sans-serif; font-size: 15px; letter-spacing: -0.3px;"><span style="color: rgb(51, 51, 51); font-family: malgun, &quot;Malgun Gothic&quot;, Dotum, 돋움, sans-serif; font-size: 15px; letter-spacing: -0.3px;">Labeled a parable, an allegory, a myth, a morality tale, a parody, a political treatise, even a vision of the apocalypse, Lord of the Flies has established itself as a true classic.</span><br></p><div><span style="color: rgb(51, 51, 51); font-family: malgun, &quot;Malgun Gothic&quot;, Dotum, 돋움, sans-serif; font-size: 15px; letter-spacing: -0.3px;"><br></span></div>', 'William Golding', 22400, 11200, 'show', 'ce06e512-6e49-40d9-8deb-61a848606a8c.jpg', 'c6be5f35-cf65-4106-ba09-3ebf36257ed8.jpg', 'sale', '7149ad02-bea0-4f73-9b7d-c45054e1db01.pdf', '2020-08-17 18:37:54', 'o', 170, 'b5', 'color', 'arte', 'ivory', 'factory01@naver.com', 'wjddbstp@naver.com', 0, '소설', 0),
	(10002, 'paper', 'the MARTIAN', '<div style="color: rgb(51, 51, 51); font-family: malgun, &quot;Malgun Gothic&quot;, Dotum, 돋움, sans-serif; font-size: 15px; letter-spacing: -0.3px; word-break: break-all;">The Sunday Times bestseller: Robinson Crusoe on Mars - a survival story for the 21st Century<br><br>Robinson Crusoe on Mars A survival story for the 21st century and the international bestseller behind the major film from Ridley Scott starring Matt Damon and Jessica Chastain. I\'m stranded on Mars. I have no way to communicate with Earth. I\'m in a Habitat designed to last 31 days. If the Oxygenator breaks down, I\'ll suffocate. If the Water Reclaimer breaks down, I\'ll die of thirst. If the Hab breaches, I\'ll just kind of explode. If none of those things happen, I\'ll eventually run out of food and starve to death. So yeah. I\'m screwed. Andy Weir\'s second novel Artemis is now available<br><br></div>', 'And Weir', 22200, 11100, 'show', 'abaa3bf1-5a57-4596-acd0-9f0b238a075e.jpg', '2c204972-52e1-4b78-98e3-401dc5f15ea2.jpg', 'sale', '93817585-40ef-4bc9-8d39-5296f9306a7c.pdf', '2020-08-17 18:39:32', 'o', 300, 'a5', 'black', 'arte', 'rough', 'factory02@hanmail.net', 'wjddbstp@naver.com', 0, '소설', 0),
	(10003, 'paper', '오후의 이자벨', '<p><br></p><p><span style="color: rgb(51, 51, 51); font-family: malgun, &quot;Malgun Gothic&quot;, Dotum, 돋움, sans-serif; font-size: 15px; letter-spacing: -0.3px;">2010년 무려 200주 동안 베스트셀러를 기록한 《빅 픽처》 작가 더글라스 케네디의 신작장편소설. 우리가 삶을 통해 만나게 되는 사랑에 대해 매우 솔직하고 파격적인 메시지를 던지는 소설이다. 더글라스 케네디는 이미 《모멘트》를 통해 운명적인 만남과 절절한 사랑에 대해 이야기한 바 있다. 아무리 운명적인 상대를 만나더라도 극복하기 힘든 현실의 장벽에 가로막히게 되면 함께하는 미래로 이어지지 않는다.</span><br style="color: rgb(51, 51, 51); font-family: malgun, &quot;Malgun Gothic&quot;, Dotum, 돋움, sans-serif; font-size: 15px; letter-spacing: -0.3px;"><br style="color: rgb(51, 51, 51); font-family: malgun, &quot;Malgun Gothic&quot;, Dotum, 돋움, sans-serif; font-size: 15px; letter-spacing: -0.3px;"><span style="color: rgb(51, 51, 51); font-family: malgun, &quot;Malgun Gothic&quot;, Dotum, 돋움, sans-serif; font-size: 15px; letter-spacing: -0.3px;">《모멘트》에서는 페레스트로이카 시절 미국 여행 작가와 동베를린 출신 여성이 만나 서로 뜨겁게 사랑하지만 이념 대결로 치닫던 동서냉전시대의 장벽에 가로막혀 결국 좌초하게 되는 이야기이다. 이 소설의 주인공 이자벨은 번역 일을 하는 프랑스의 기혼 여성이고, 샘은 로스쿨 입학을 앞두고 파리에 여행 온 대학생이다.</span><br style="color: rgb(51, 51, 51); font-family: malgun, &quot;Malgun Gothic&quot;, Dotum, 돋움, sans-serif; font-size: 15px; letter-spacing: -0.3px;"><br style="color: rgb(51, 51, 51); font-family: malgun, &quot;Malgun Gothic&quot;, Dotum, 돋움, sans-serif; font-size: 15px; letter-spacing: -0.3px;"><span style="color: rgb(51, 51, 51); font-family: malgun, &quot;Malgun Gothic&quot;, Dotum, 돋움, sans-serif; font-size: 15px; letter-spacing: -0.3px;">기혼 여성과 여행자인 대학생의 만남이라면 단발성으로 끝나게 되리라 예상하기 쉽지만 두 사람 관계는 샘이 다른 여성을 만나 결혼한 이후로도 오랫동안 계속 이어지게 된다. 이 소설은 대서양을 사이에 둔 미국 남자 샘과 프랑스 여자 이자벨이 오랜 세월 동안 어떻게 사랑을 이어가는지 다루는 한편 가정에서 벌어지는 다양한 문제들을 매우 설득력 있게 그리고 있다.</span><br></p>', 'Douglas Kennedy', 16600, 8300, 'show', '779240a1-4ce2-4459-8be8-4d51f4f58d6e.jpg', '871437fa-44c1-4461-baed-2a8bfc44fe3d.jpg', 'sale', '48d1a046-b3e4-44a7-a455-97b9235aae1e.pdf', '2020-08-17 18:42:00', 'o', 130, 'b5', 'color', 'mont', 'white', 'factory02@hanmail.net', 'wjddbstp@naver.com', 0, '비문학', 0),
	(10004, 'paper', 'Lord Of the Rings', '<p><a style="color: rgb(68, 68, 68); font-family: malgun, &quot;Malgun Gothic&quot;, Dotum, 돋움, sans-serif; font-size: 15px; font-weight: 400; letter-spacing: -0.3px; background-color: rgb(255, 255, 255); text-decoration: none !important;"><b>피터 잭슨의 영화가 한 그루 나무라면 톨킨의 원작은 거대한 숲이다!</b><br>출간 이후 38개국의 언어로 번역되어 전 세계에서 1억 부 이상이 판매 되었고, 2003년도 통계로 매년 3백만 부씩 팔려 나갔던 반지의 위력. 그의 작품은 영화화되면서 관객들로부터 뜨거운 호응을 이끌어냈으나 책의 평가는 비주류라는 판타지 문학에 대한 편견의 틀을 벗지 못했다.<br>그러나 2003년 영국 BBC의 빅 리드(Big Read) 조사에서 &lt;반지의 제왕&gt;은 ‘영국민이 가장 사랑하는 책’으로 선정되었고, 2004년 독일과 호주에서 벌어진 조사에서도 &lt;반지의 제왕&gt;은 가장 인기 있는 책으로 조사되었다. 1999년에 아마존 닷컴에서 실시한 고객 조사에서 반지의 제왕은 최고의 ‘세기의 책’으로 뽑힌 바 있다.<br>살아간다는 것 자체가 판타지임에도 불구하고 판타지의 세계를 현실과는 동떨어진 공상의 세계라고 믿고 있는 사람들, 그리하여 영화의 감동에만 머물러 있는 사람들에게 톨킨의 &lt;반지의 제왕&gt;이 가진 존재와 희망에 대한 방대한 메시지들을 ‘씨앗을 뿌리는 사람’에서 다시 한 번 전해주고자 한다.<br>원작을 직접 만나는 것이야말로 J.R.R. 톨킨이 창조한 신화를 진정으로 이해할 수 있는 유일한 길이다!<br><br><b>2010년 양장 일러스트판 &lt;반지의 제왕&gt; 출간!</b><br>2010년 양장 일러스트판 &lt;반지의 제왕&gt;(전3권)은 톨킨의 장대한 상상력을 가장 극적으로 그려내는 것으로 유명한 존 하우의 표지 일러스트와 세밀한 묘사로 ‘가운데땅’으로 빠져들 수밖에 없는 앨런 리의 본문 일러스트로 새롭게 꾸몄다. 톨킨의 세계를 꿈꾸었던 위대한 화가들의 여정을 통해 미지의 대륙을 함께 탐색하는 환상적인 기쁨을 맘껏 누릴 수 있다.<br>가운데땅의 모든 종족의 운명을 결정지을 ‘절대반지’를 둘러싼 선과 악의 대결을 통해 인간 본원에 대한 근원적인 메시지를 전달하는 작품으로 국내에 톨킨을 처음 소개했던 영문학자들이 톨킨의 요정어, 고유명사 발음 및 번역 원칙에 충실한 번역판으로 2007년에 이어 3년 만에 다시 부분적인 수정을 거쳐 새롭게 선보인다. 지난 보급판의 경우 영화 컨셉에 맞추었다면, 이번 양장본은 시간이 흘러도 변함없이 가치를 지닌 고전문학이라는 측면에 맞추어 앤틱과 실용적 요소를 최대한 구현하였다. 시간이 지나도 잊히지 않는 톨킨의 세계를 기다려온 사람들에게 좋은 선물이 될 것이다.<br><br><b>전 세계가 영화 &lt;호빗&gt;의 탄생을 기다리고 있다!</b><br>얼마 전부터 톨킨의 판타지 소설 걸작이라 할 수 있는 &lt;호빗&gt;의 영화화 논의가 한창이다. 영화 &lt;호빗&gt;은 &lt;반지의 제왕&gt;의 피터 잭슨 감독과 &lt;헬보이 1, 2&gt;, &lt;판의 미로&gt;로 유명한 기예르모 델 토로 감독이 참여한다. 영화는 총 2부작으로, 2011년에 1부, 2012년에 2부가 연이어 개봉될 예정이다. 이미 예전 &lt;반지의 제왕&gt;을 촬영했던 뉴질랜드에서는 영화 &lt;호빗&gt;의 세트 건설이 한창이다. &lt;반지의 제왕&gt;에 출연했던 이안 맥켈런(간달프 역), 휴고 위빙(엘론드 역) 등 예전 출연진들의 출연 여부도 기대를 불러일으키고 있으며, 전 세계의 톨킨 팬들이 공사가 시작된 ‘호빗’ 마을을 보며 ‘가운데땅’의 재탄생에 흥분하고 있다.</a><br></p>', 'John R.R Tolkien', 34200, 17100, 'show', '36ebf2a0-8a42-4764-a231-11d858439af6.jpg', 'fdc311d5-ea82-4d3e-837a-02fc93bbe293.jpg', 'sale', '9c346940-6f10-4334-add6-5acd751ed80d.pdf', '2020-08-17 18:45:01', 'o', 300, 'a4', 'color', 'arte', 'ivory', 'factory02@hanmail.net', 'wjddbstp@naver.com', 0, '소설', 0),
	(10005, 'paper', '이토록 멋진 곤충', '<p><span style="font-size: 24px;">﻿</span><i><span style="font-size: 24px;">"사랑해주세요! 인간의 소중한 친구 \'곤충\'"</span></i></p><p>노르웨이 숲속에서 유년 시절을 보낸 곤충학자가, 친구를 소개하듯 재미난 별명들을 붙여가며 곤충이 가진 대단한 능력을 브리핑한다. 모기가 물면 왜 가려운지 속시원히 밝혀주고, 곰팡이 때문에 좀비가 되는 희한한 딱정벌레 이야기도 들려주고, 암컷이 지배하는 흥미진진한 개미 세계로 초대하기도 한다. 50마리 곤충들이 각자 맡고 있는 특별한 임무들을 하나하나 짚어주면서, 곤충과 지구의 다른 구성원들이 어떤 영향을 주고 받는지 밝혀나간다. 곤충이 없다면 인간도 지구에서 살아갈 수 없다는 사실을 알게 되어서인지, 아름다운 곤충 수채화 덕분인지 이 작은 벌레들에 대한 호감이 급상승한다.</p><p><br></p><p>&lt;세상에 나쁜 곤충은 없다&gt;(원제:Insektenes Planet)의 저자 안네 스베르드루프-튀게손이 어린이를 위해 쓴 곤충 생태 보고서다. \'모든 사람이 곤충을 사랑하게 되었으면 좋겠다\'는 집필 의도는 그대로 이어가면서 전작과 달라진 점 하나. 제아무리 냉철한 과학자라도 아이들 앞에선 부드러운 말투가 저절로 나오나 보다. 곤충이 가진 신비로운 매력을 전하는 달변에, 온화한 목소리와 상냥한 미소까지 더해졌다. 아직 곤충이 뭔지 모르는 내 아이가 훗날 엄마의 말을 알아듣게 될 때 이 책이 씌어진 이유를 설명해주고 싶다. 함께 살아가는 존재에 관심을 기울이고 사랑해야 한다는 생각에 관한 대화를 나누고 싶다.</p>', '조은영', 14000, 6905, 'show', 'c7b7d5b0-b5ef-4be4-94f3-5410bf41a523.jpg', '186e0951-e559-437a-8274-73d01fe29f18.jpg', 'sale', '5141501d-6e05-4020-af19-6e8614f1d732.pdf', '2020-08-17 18:50:16', 'o', 235, 'b5', 'color', 'snow', 'white', 'printer@naver.com', 'kimsur1111@hanmail.net', 0, '교육', 1),
	(10006, 'ebook', '쓰기로 했다', '<p><span style="font-size: 24px;"><b><u>도서 정보</u></b></span></p><p>한참을 걸어가고 있어 너무 앞만 보고 온 걸까</p><p>내 마음처럼 네 마음도 아팠을 텐데</p><p>누군가 내 맘을 알아주길 바라기만 했던 거 같아</p><p>잠깐 걸음을 멈춰 하늘을 올려 다 볼래</p><p>이 시간들을 이 풍경들을 담아서</p><p>고된 우리의 여행 속 가끔 꺼내어봤을 때</p><p>아름다운 페이지가 될 수 있게</p><p>-볼빨간사춘기,바닐라 어쿠스틱 &lt;행복은 늘 가까이에 있어&gt;中</p><p><br></p><p>아주 사소한 순간에 찾아오는 깨달음이 있다.</p><p>낮과 밤이 반대인것처럼 기쁨과 슬픔도 반대지만</p><p>우리가 눈물을 흘리는 이유는 단지 슬퍼서 뿐만이 아니라는 것</p><p>사람의 감정이란 꽤나 복잡하고 오묘해서 설명하기 어렵지만</p><p>사실 기쁨과 슬픔은 반대의 개념이 아니라는 것</p><p>분명한 건 반드시 나쁜 일은 일어나지만</p><p>중요한 건 그걸 받아들이는 자신의 몫이라는 것</p><p><br></p><p>같은 시간, 같은 공간, 다른 생각을 적어내는 10인의 작가들</p><p>저마다의 시간을 걸어온 그들이 만나 6주를 함께 했다.</p><p>첫 만남에 설렘과 어색함이 해소되지 못한 시간</p><p>짧은 만큼 찬란했던 시간을 담아 우리는 쓰기로 했다.</p>', '최원경', 8000, NULL, 'show', '7bbc765a-aba6-44c2-b439-7d161f64e25b.png', '8f47fff5-4d0b-4d53-85d9-1db94b72c040.png', 'sale', 'a3ec46d1-f1e1-446e-8ada-cc367b8d4d6f.pdf', '2020-08-17 19:02:29', 'o', 232, NULL, NULL, NULL, NULL, NULL, 'kimsur1111@hanmail.net', 0, '시', 3),
	(10007, 'design', '연인', '<p><span style="background-color: rgb(247, 198, 206);">연인</span>의 만남을 표현한 디자인</p>', '고문영', 15500, NULL, 'show', '493140c4-d0e7-4182-b482-d138e85ae0c9.jpg', '8a009441-e791-40c1-82c4-df34891e11e0.jpg', NULL, NULL, '2020-08-17 19:03:22', 'x', NULL, NULL, NULL, NULL, NULL, NULL, 'kimsur1111@naver.com', 0, NULL, 0),
	(10008, 'design', '산 속의 캠핑', '<p>산 속에서 캠핑을 하는 듯한 느낌을 주는 디자인 !</p><p><br></p><p>특별 가격 <span style="background-color: rgb(255, 156, 0);">23500원</span>에 모십니다.</p>', '김선욱', 23500, NULL, 'show', '1110f980-a49c-47aa-ba19-af7868ae5da2.png', '6fc666c1-95c1-4f6d-9cc5-0fd9259ef237.png', NULL, NULL, '2020-08-17 19:17:10', 'x', NULL, NULL, NULL, NULL, NULL, NULL, 'kimsur1111@naver.com', 0, NULL, 0),
	(10009, 'design', '아보아보', '<p>숲 속의 버터 아보카도를 표지로 만나보세요 !</p>', '서연희', 27000, NULL, 'show', 'c6345765-78dd-4069-9be5-ca84bb41d834.png', '616948cc-282c-4e9a-b437-01428bb75207.png', NULL, NULL, '2020-08-17 19:18:04', 'x', NULL, NULL, NULL, NULL, NULL, NULL, 'kimsur1111@naver.com', 0, NULL, 0),
	(10010, 'ebook', '나의 바다', '<p><span style="font-size: 1rem;">비밀~!</span><br></p><p>네이버 블로그</p><p>\'연짱\'을 찾아오세요</p><div><br></div>', '연짱', 5000, NULL, 'show', '0d0973d6-1e54-424a-95ea-8d13a430d89b.png', 'd6c0d38e-b936-4aa3-8dc0-4038dedec18d.png', 'sale', '017e9382-847d-4c5a-ab5d-12dc1ee9ed0b.pdf', '2020-08-17 19:18:52', 'o', 199, NULL, NULL, NULL, NULL, NULL, 'choije9410@gmail.com', 0, '소설', 0),
	(10011, 'design', '짹짹', '<p>느낌과 디자인을 동시에 잡은 표지를 원하신다면 이 디자인 어떠세요?</p><p>책 속에서 새가 살아 움직이는 듯한 느낌을 받으실 수 있을겁니다!</p>', '김태욱', 24600, NULL, 'show', '80ef0eba-c370-433e-890a-f719e6192650.png', NULL, NULL, NULL, '2020-08-17 19:19:17', 'x', NULL, NULL, NULL, NULL, NULL, NULL, 'kimsur1111@naver.com', 0, NULL, 0),
	(10012, 'design', '그믐달', '<h1><b><u>NOTICE</u></b></h1><p><br></p><p>모든 디자인의 저작권은 리썸에게 있습니다</p><p>분양 받은 표지를 다른 용도로 가공하거나 타인을 통한 수정은 금지합니다</p><p>- 다른 인포에 사진이 쓰이는 경우 미리 알려주시면 감사하겠습니다</p><p>작업물들은 개인 포트폴리오로 사용됩니다</p><p><br></p><p>표지의 뒷면/책날개에&nbsp; "Copyright. Lissome " 문구가 작게 삽입됩니다</p><p><br></p><p>* 속지 작업은 하지 않습니다</p>', '리썸디자인', 50000, NULL, 'show', 'da964d31-3fd6-4686-98fc-7da52869e180.png', '8bcf0839-f01a-4d6f-9c72-352e4414a334.png', NULL, NULL, '2020-08-17 19:21:30', 'x', NULL, NULL, NULL, NULL, NULL, NULL, 'kimsur1111@naver.com', 0, NULL, 0),
	(10013, 'design', '거품 소동', '<p style="text-align: center; "><a href="https://designzoehee.postype.com/" target="_blank">https://designzoehee.postype.com/</a><a href="https://designzoehee.postype.com/"></a></p><p><div style="text-align: center;"><span style="font-size: 1rem;">디자인 조희</span></div><br></p>', '조희', 30000, NULL, 'show', '349eee4d-3125-4537-b3c3-b67fe59479c1.jpg', 'c605e979-014d-4c9e-a83f-07c7617f36de.jpg', NULL, NULL, '2020-08-17 19:23:33', 'x', NULL, NULL, NULL, NULL, NULL, NULL, 'kimsur1111@naver.com', 0, NULL, 0),
	(10014, 'target', '☆맞춤 디자인 제작☆', '<div class="description" style="text-align: center; margin: 10px 0px 20px; color: rgb(48, 48, 48); font-family: &quot;Malgun Gothic&quot;, &quot;Nanum Gothic&quot;, Dotum, serif; letter-spacing: -1px;">요즘의 책의 표지는 무엇보다도 중요합니다,<br>아래 포트폴리오를 보시고, 마음에 드는 스타일을 골라주시는 것이 작업하기에 가장 편합니다^^<br><br>또는 참고할만한 표지를 알려주셔도 작업하기에 좋습니다.<br><br>본 작업은 1차 2안 , 2차 최종수정 1안입니다.<br><br></div><div class="detail" style="text-align: center; margin-bottom: 10px; color: rgb(48, 48, 48); font-family: &quot;Malgun Gothic&quot;, &quot;Nanum Gothic&quot;, Dotum, serif; letter-spacing: -1px;"><img src="http://www.bookk.co.kr/files/2015/01/19/3bcff16927a6b52bf73b7cb9ab1c0231.png" style="border: 0px; max-width: 100%;"></div>', '디자인스튜디오', 100000, NULL, 'show', 'eb9711eb-e952-41ba-b338-3385e4822717.jpg', NULL, NULL, NULL, '2020-08-17 19:24:52', 'x', NULL, NULL, NULL, NULL, NULL, NULL, 'kimsur1111@naver.com', 0, NULL, 0),
	(10015, 'correct', '국어교육 전공 프리랜서 \'글맛\'', '<p style="text-align: center; "><font color="#303030" face="Malgun Gothic, Nanum Gothic, Dotum, serif"><span style="letter-spacing: -1px;">국어교육 전공/교정․교열․윤문 전문 프리랜서 ‘글맛’</span></font></p><p style="text-align: center; "><font color="#303030" face="Malgun Gothic, Nanum Gothic, Dotum, serif"><span style="letter-spacing: -1px;"><br></span></font></p><p style="text-align: center; "><font color="#303030" face="Malgun Gothic, Nanum Gothic, Dotum, serif"><span style="letter-spacing: -1px;">작가님들의 귀한 자식, 교정교열 프리랜서 ‘글맛’에게 맡겨보세요.</span></font></p><p style="text-align: center; "><font color="#303030" face="Malgun Gothic, Nanum Gothic, Dotum, serif"><span style="letter-spacing: -1px;"><br></span></font></p><p style="text-align: center; "><font color="#303030" face="Malgun Gothic, Nanum Gothic, Dotum, serif"><span style="letter-spacing: -1px;">안녕하세요. 교정․교열․윤문 전문 프리랜서 ‘글맛’입니다. 전공 영역은 국어교육입니다.</span></font></p><p style="text-align: center; "><font color="#303030" face="Malgun Gothic, Nanum Gothic, Dotum, serif"><span style="letter-spacing: -1px;">우리 속담에 ‘고슴도치도 제 새끼는 함함하다고 한다’라는 속담이 있습니다. 부모 눈에는 자녀가 다 좋아보이고 귀엽게만 보인다는 뜻입니다. 열 달 동안 힘겹게 배 속에 품고 사랑과 정성으로 키운 자식마냥 여러분의 작품은 마냥 소중하고 좋아보입니다. 그럼에도 불구하고 다른 이의 객관적인 관점으로 검토해보고 싶으시다면 ‘글맛’에게 맡겨보세요.</span></font></p><p style="text-align: center; "><font color="#303030" face="Malgun Gothic, Nanum Gothic, Dotum, serif"><span style="letter-spacing: -1px;">‘귀한 자식 매 한 대 더 때린다’라는 속담도 있습니다. 애지중지 키운 자녀이지만 더 나은 모습으로 성장하기를 기대한다면 엄격한 훈계와 타이름도 필요하겠지요. 여러분의 귀한 작품을 더욱 나은 모습으로 매끄럽게 다듬고 싶으시다면 ‘글맛’에게 맡겨보세요.</span></font></p><p style="text-align: center; "><font color="#303030" face="Malgun Gothic, Nanum Gothic, Dotum, serif"><span style="letter-spacing: -1px;">또‘보기 좋은 떡이 먹기도 좋다’는 속담도 있습니다. 작가의 성실함과 열정, 개성있고 흥미진진한 이야기로 가득찬 글의 속살에 명료하고 정확한 단어 표현, 유연한 문장의 맥이라는 옷을 입혀준다면 독자들은 여러분의 작품에 오래도록 매료될 것입니다.</span></font></p><p style="text-align: center; "><font color="#303030" face="Malgun Gothic, Nanum Gothic, Dotum, serif"><span style="letter-spacing: -1px;"><br></span></font></p><p style="text-align: center; "><font color="#303030" face="Malgun Gothic, Nanum Gothic, Dotum, serif"><span style="letter-spacing: -1px;">독자가 신뢰할 수 있고, 마지막 책장을 넘기는 순간까지 읽고 싶은 글이 될 수 있도록 최선을 다해서 검토(교정․교열․윤문)해드립니다. 또한 작가님의 작품이 더욱 발전된 글이 될 수 있도록 책을 사랑하고 독서를 즐기는 독자 의 시각으로 가감없이 비평(서평)해드립니다.</span></font></p>', '글맛', 1500, NULL, 'show', '4bc6a868-8db9-40c2-8bf9-2098012ce363.jfif', NULL, NULL, NULL, '2020-08-17 19:38:42', 'x', NULL, NULL, NULL, NULL, NULL, NULL, 'kimsur1111@naver.com', 0, NULL, 0),
	(10016, 'design', '애니멀', '<p><span style="font-family: Verdana;">동심을 찾아주는 <span style="background-color: rgb(214, 239, 214);">애니멀</span> 디자인</span></p><p>동화 혹은 동물을 다룬 소설을 쓰신다면 이 디자인 추천합니다&nbsp;</p>', '정윤세', 34000, NULL, 'show', 'afa5d14a-1efb-458d-a40e-5bf5f3603a35.jpg', NULL, NULL, NULL, '2020-08-17 19:40:23', 'x', NULL, NULL, NULL, NULL, NULL, NULL, 'kimsur1111@naver.com', 0, NULL, 0),
	(10017, 'design', 'BBQ PARTY', '<p>심플한 디자인 찾으신다면 여깁니다 !</p><p>BBQ하고 싶지 않으신가요?</p><p>이 디자인이 주는 효과입니다.</p>', '이윤경', 36000, NULL, 'show', '93a3fed7-6e3a-4b97-b64d-c01d21011a46.jpg', NULL, NULL, NULL, '2020-08-17 19:41:43', 'x', NULL, NULL, NULL, NULL, NULL, NULL, 'kimsur1111@naver.com', 0, NULL, 0),
	(10018, 'design', '전시회', '<p>전시회에 온듯한 디자인</p>', '도정민', 27500, NULL, 'show', 'd8046364-3ba9-485e-99c3-e79f0de3ea14.jpg', NULL, NULL, NULL, '2020-08-17 19:42:17', 'x', NULL, NULL, NULL, NULL, NULL, NULL, 'kimsur1111@naver.com', 0, NULL, 0),
	(10019, 'target', '당신의 감성을 담아 낸 책을 디자인 해 드립니다.', '<h2><b>서비스 설명</b></h2><p>안녕하세요 북 디자이너 부페르카 입니다.</p><p>여러분의 감성을 담은 책을 만들어 드립니다.</p><p><b>-작업 과정</b></p><p>주문 &gt; 시안제안 &gt; 수정작업 &gt; 원본파일전달 &gt; 완료 및 구매확정</p><p><b>-사용 폰트</b></p><p>무료 / 유료폰트 사용</p><p><b>-사용 라이센스</b></p><p>무료 / 유료이미지 사용</p><p><b>-원본파일</b></p><p>유료제공</p><p><b>-상업적 이용</b></p><p>상업적 이용 가능(무료)</p><p><b>-저작권 귀속</b></p><p>의뢰인 귀속</p><p><b>-포트폴리오 사용</b></p><p><br></p>', '부페르카', 50000, NULL, 'show', 'f476e5d2-45dc-4556-90cd-5423e643b7f0.jpg', NULL, NULL, NULL, '2020-08-17 19:43:09', 'x', NULL, NULL, NULL, NULL, NULL, NULL, 'kimsur1111@naver.com', 0, NULL, 0),
	(10020, 'design', '세탁 세탁 세탁', '<p>세탁을 다룬 디자인입니다.</p><p><br></p>', '배범희', 29000, NULL, 'show', '9082c59c-969d-4ae7-b1b0-8421188e2301.jpg', NULL, NULL, NULL, '2020-08-17 19:43:10', 'x', NULL, NULL, NULL, NULL, NULL, NULL, 'kimsur1111@naver.com', 0, NULL, 0),
	(10021, 'design', '한 여름', '<p>여름 날을 그린 디자인</p>', '김수린', 46000, NULL, 'show', '7db3f58b-85e7-417f-9c08-52765ad9da30.jpg', NULL, NULL, NULL, '2020-08-17 19:43:52', 'x', NULL, NULL, NULL, NULL, NULL, NULL, 'kimsur1111@naver.com', 0, NULL, 0),
	(10022, 'design', 'BBQ PARTY2', '<p>많은 사랑에 보답하기 위해 나온 BBQ PARTY SEASON 2&nbsp;</p><p>더 많은 사랑 부탁 드립니다 !</p><p><br></p>', '이윤경', 42000, NULL, 'show', 'de8683af-8233-4e7c-a0be-8d21ff1d8233.jpg', NULL, NULL, NULL, '2020-08-17 19:46:29', 'x', NULL, NULL, NULL, NULL, NULL, NULL, 'kimsur1111@naver.com', 0, NULL, 0),
	(10023, 'design', '느낌 가는 대로', '<p style="text-align: center; ">안녕하세요 표지 디자이너 온도입니다.</p><p style="text-align: center; "><br></p>', '온도', 30000, NULL, 'show', '08ac3054-2ea2-464d-b1b3-bb95c7538d5e.jpg', '339fc1c6-8434-49e7-9235-f77aa7f0c275.jpg', NULL, NULL, '2020-08-17 22:16:56', 'x', NULL, NULL, NULL, NULL, NULL, NULL, 'choije9410@gmail.com', 0, NULL, 0),
	(10024, 'design', '새벽 잠', '<p style="text-align: center; "><img src="/libero/resources/images/publish/fileUpload/fb1330ee-66a2-4048-8475-b4c97b74481c.jfif" style="width: 300px;"></p><p style="text-align: center; "><img src="/libero/resources/images/publish/fileUpload/31c169dd-fb3a-478d-9f10-08f0f3af5e33.jpg" style="width: 25%;"></p><p style="text-align: center; "><br></p><p style="text-align: center; ">안녕하세요 레데의 디자인 공방입니다.</p>', '레데', 50000, NULL, 'show', '2a04ceac-0b06-491e-a921-09db0fe902f7.jpg', '0fdeb99b-e992-4601-9b18-eb8888c5c020.jpg', NULL, NULL, '2020-08-17 22:43:02', 'x', NULL, NULL, NULL, NULL, NULL, NULL, 'choije9410@gmail.com', 0, NULL, 0),
	(10025, 'paper', '파스타 마스터 클래스', '<p><span style="font-size: 28px;"><b><u>책소개</u></b></span></p><p>쿠킹 클래스 열풍의 시초인 연남동 ‘제리코 레시피’의 간판 수업을 책으로 담은 쿡북. 2017년부터 연일 마감 행진을 기록했던 인기 특강 ‘파스타 마스터 클래스’에서 가장 많이 사랑받고 연신 후기가 쏟아진 파스타를 계절별로 8가지씩 모아 총 32종의 다채로운 파스타 레시피를 엄선했다. 소문난 클래스를 눈앞에서 체험하는 듯한 자세한 과정 사진과 먹음직스러운 화보컷들을 통해 책만으로도 생생한 현장감을 물씬 느낄 수 있다.</p><p><br></p><p>책 속 레시피의 가장 큰 장점은 몇 가지 규칙만 지킨다면 그 안에서는 입맛과 취향에 따라 얼마든지 각자 자신의 파스타를 만들어 볼 수 있도록 가능성을 열어 둔 것. 누구나 부담 없이 따라 할 수 있도록 제리코 레시피의 비법들을 아낌없이 쏟아냈다. 계절마다 등장하는 친숙한 제철 나물이나 고등어, 가지, 옥수수, 굴 같은 일상의 냉장고 속 재료들도 여기서는 훌륭한 파스타로 변신해 당장 만들어 먹어 보고 싶은 욕구를 자극한다.</p><div><br></div>', '백지혜', 16300, 8110, 'show', 'aa7d6c11-9e14-4a02-9d71-3419cccd4326.jpg', 'db49e83c-6f95-465a-8454-ee02a8d870ec.jpg', 'sale', '7073100d-8cfb-49f2-9e65-a15c16eb7c28.pdf', '2020-08-17 22:45:33', 'o', 188, 'a4', 'color', 'mont', 'ivory', 'printer@naver.com', 'kimsur1111@hanmail.net', 0, '비문학', 0),
	(10026, 'paper', '19시', '<p><span style="font-size: 28px;"><b>목차</b></span><br></p><p>박수</p><p>포옹</p><p>밀린 빨래</p><p>모기야</p><p>못</p><p>스마트폰</p><p>치킨</p><p>카스테라</p><p>콤플렉스</p><p>포장 음식</p><p><span style="font-size: 28px;"><b>도서 정보</b></span></p><p>10편의 짧은 시...</p>', '송석현', 3800, 1895, 'show', 'c0b59a92-9e46-4fd2-9525-938503b42b32.png', 'c96ab9ec-5284-4811-8e41-9e8c34b07899.png', 'sale', '5a709d52-0b01-48ac-85a8-1ad8dbf39337.pdf', '2020-08-17 22:52:55', 'o', 15, 'a5', 'black', 'mont', 'rough', 'printer@naver.com', 'kimsur1111@hanmail.net', 0, '시', 0),
	(10027, 'ebook', '기획자의 일', '<p><span style="font-size: 28px;"><b><u>책소개</u></b></span></p><p><span style="font-size: 10px;">﻿</span><span style="font-size: 28px;"><b><u><br></u></b></span>모든 직장인에게 어려운 과제로 손꼽히는 업무가 있다. 바로 ‘기획’이다. 무에서 유를 만들어내는 것과 같은 기획은 머릿속 생각을 설득력 있게 풀어내고 또 실현해내야 한다는 점에서 큰 부담감을 느끼게 하는, 대표적인 업무 영역이다. 하지만 “모든 비즈니스의 시작은 기획”이라고 말할 수 있는 만큼 직장인이라면 절대 피할 수 없는 일이기도 하다. 그렇다면 어떻게 하면 기획을 잘 해낼 수 있을까?</p><p><br></p><p>상사에게 기획안을 제출했을 때 누구나 한 번쯤 “그래서, 하고 싶은 말이 뭔데?” “좀 다른 거 없어?” “그게 되겠어?” “내가 원한 건 이게 아닌데….” 하는 피드백을 들어봤을 것이다. 왜 이런 반응이 나오는 것일까? 저자는 이런 피드백들이 나오는 이유를 알면 놀랄 만큼 기획이 쉽게 풀릴 수 있다고 말한다.</p><p><br></p><p>LG, 두산, CJ… 국내 굴지의 대기업에서 25년간 수많은 기획안을 주물러온 기획 고수가 자신의 경험과 기획 노하우를 통해 한 번에 OK 받는 일 잘하는 기획자가 되기 위해 반드시 챙겨야 할 10가지 기획의 기술을 상세하게 알려준다.</p><div><br></div>', '양은우', 8000, NULL, 'show', '130fdd1d-6f20-4e5b-8365-41331ee9b45a.jpg', 'a3ed2d21-90cc-416d-9f63-d99f75bc9ea4.jpg', 'sale', '449c3614-6878-43f8-b1ea-31a585a7ec61.pdf', '2020-08-17 23:01:20', 'o', 300, NULL, NULL, NULL, NULL, NULL, 'user01', 0, '수필', 0),
	(10028, 'target', '북디자인 전문 기업 1MM', '<p style="text-align: center; "><img src="/libero/resources/images/publish/fileUpload/f7253524-f4a8-4c25-b2c6-71242ea23563.jfif" style="width: 100%;"><img src="/libero/resources/images/publish/fileUpload/41c02472-cedb-4bcf-a5a6-f0d7acdb631e.jfif" style="width: 100%;"><br></p>', '1MM', 90000, NULL, 'show', 'fca089e7-79c8-4ada-9048-3fb537cdb671.jfif', NULL, NULL, NULL, '2020-08-17 23:07:39', 'x', NULL, NULL, NULL, NULL, NULL, NULL, 'choije9410@gmail.com', 0, NULL, 0),
	(10031, 'ebook', NULL, NULL, NULL, NULL, NULL, 'temp', NULL, NULL, NULL, NULL, '2020-08-17 23:26:52', 'o', 222, NULL, NULL, NULL, NULL, NULL, 'choije9410@gmail.com', 0, NULL, 0),
	(10032, 'ebook', 'Voice of Asia', '<div class="author-info info" style="color: rgb(48, 48, 48); font-family: &quot;Malgun Gothic&quot;, &quot;Nanum Gothic&quot;, Dotum, serif; letter-spacing: -1px;"><h3><b><u>목차</u></b></h3></div><div class="index-info info" style="color: rgb(48, 48, 48); font-family: &quot;Malgun Gothic&quot;, &quot;Nanum Gothic&quot;, Dotum, serif; letter-spacing: -1px;"><div class="content">인구변화, 아시아 힘의 균형에도 변화를 2<br>늙어가는 호랑이, 숨은 용 7<br>인구변화로 변곡점에 선 아시아의 성장률 21<br>주목할만한 국가별 인구통계 31</div></div><div class="book-info info" style="color: rgb(48, 48, 48); font-family: &quot;Malgun Gothic&quot;, &quot;Nanum Gothic&quot;, Dotum, serif; letter-spacing: -1px;"><h3><u><b>도서 정보</b></u></h3><div class="content">인구변화, 아시아 힘의 균형에도 변화를<br>인구의 변화는 모든 국가를 움직이는 원동력, 아시아 지역 내 힘의 균형 변화<br><br>딜로이트 아태지역본부의 아시아의 경제 전망 분석보고서인 ‘보이스 오브 아시아(Voice of Asia)’ 시리즈의 세 번째 국문판입니다.<br><br>이번 호에서는 인구통계학을 기반으로 한국을 비롯한 일본, 중국, 인도 등 아시아 국가들의 경제성장 추이, 미래산업 예측, 새로운 비즈니스 성장 기회 창출 등에 대한 인사이트를 제공해 드립니다.<br>각국의 고령화는 위기가 아닌 \'기회\'라는 딜로이트 이코노미스트들의 전망이 흥미롭습니다.<br><br>보고서는 2030년에는 전 세계의 65세 이상 인구 중 65%가 동양인이 될 것이며, 2042년에는 아시아 지역 65세 이상 인구수가 유럽과 북미지역 65세 이상 인구의 합산을 뛰어넘을 것으로 전망했다. 또 아시아 국가들의 65세 이상 인구는 2017년 3억 3천 5백 만 명에서 2027년에는 5억 2천 만 명으로 급증할 것이라고 내다봤습니다.<br><br>이처럼 아시아는 인구는 급속도로 고령화되고 있으며, 50년 안에 10억 명이 65세 이상이 될 것으로 예측되고 있습니다. 고령화에 따라 만성질환의 치료 목적으로 사용되는 의료기구나 간호서비스, 노인들을 위한 생활필수품, 노인가구에 알맞은 소형주택, 사회기반시설, 100세 시대를 위한 자산관리 서비스와 노인보험 등이 고령 소비자들로부터 주목 받게 될 것이라는 것이 전문가들의 분석입니다.</div></div>', '딜로이트', 5000, NULL, 'show', '5f32c56c-0b51-4129-92de-1d0d46fdb800.png', '838f7536-6dcc-46e6-acf0-933155a596dd.png', 'sale', '3b77f272-bf10-4f64-a8aa-6ec91b31efa2.pdf', '2020-08-18 11:23:01', 'o', 52, NULL, NULL, NULL, NULL, NULL, 'kimsur1111@hanmail.net', 0, '비문학', 0),
	(10033, 'ebook', '채식 연습', '<p><span style="font-size: 1rem;"><b><i>책소개</i></b></span></p><p><span style="font-size: 1rem;">건강이나 환경, 동물권 등 여러 가지 이유로 채식 라이프에 도전하려는 분들이 부담과 강박에서 벗어나, 천천히 즐기면서 채식과 친해지는 연습의 과정들을 안내하고 있다. 첫 단계에서는 지금까지 내 식생활을 돌아보고 점검하는 것부터 시작한다. 이어 채식의 가치와 이점을 짚어보고, 슬기로운 채식 생활을 위해 알아두면 유용한 장보기, 재료 관리, 쿠킹 포인트 등 실질적인 정보들을 알려준다.</span><br></p><p><br></p><p>본격적인 채식 요리편에서는 채소에 대한 감수성을 높이는 심플하면서도 새로운 채식 레시피, 일주일에 하루 실천하는 아침 점심 저녁 채식 레시피, 운동이나 보양, 스트레스 등 채식하기 어려운 상황을 위한 채식 레시피, 혈당과 혈압, 뱃살, 빈혈, 가려움증 등을 완화시키는 증상별 채식 레시피까지 100여 가지의 채식 메뉴들을 소개하고 있다.</p><p><br></p><p>한 그릇 밥과 면부터 죽과 수프, 샌드위치와 샐러드, 반찬과 국물, 일품요리, 브런치와 디저트, 건강 음료까지 다채롭게 다루었으니 채식을 시작하는 분들은 물론 이미 채식을 하고 있지만 좀 더 다양한 레시피가 필요한 분들에게도 많은 도움이 될 것이다.</p>', '이현주', 12000, NULL, 'show', '84020a67-88ab-4e02-be84-44edfd65b028.jpg', '429c88a1-9e35-4737-9329-ffb9cf990c80.jpg', 'sale', 'fe666b3c-2a58-45fe-b49e-7f8bdabf8645.pdf', '2020-08-18 11:51:44', 'x', 200, NULL, NULL, NULL, NULL, NULL, 'choije9410@gmail.com', 0, '비문학', 1),
	(10034, 'paper', '비트 158기 Coala', '<p>포트폴리오&nbsp;</p>', '정윤세', 27100, 13520, 'show', '41ed40aa-7282-42e3-9199-835cf690c234.png', '79735c76-2c60-4417-bab8-6d22102e7865.png', 'have', '2928d748-dd17-4100-bad6-37fec529d3b7.pdf', '2020-08-18 11:56:53', 'o', 500, 'b5', 'black', 'snow', 'white', 'printer@naver.com', 'choije9410@gmail.com', 0, '교육', 0),
	(10035, 'ebook', '비트 158기 Win98', '<p>포폴입니다</p>', '최수하', 0, NULL, 'show', '7c8dc94d-f673-45e6-95bc-110e46419613.png', '58ef3af0-987e-4432-be15-aefaf7c63e3e.png', 'have', 'b4e42571-1ccb-4ccf-9b18-2d82bcbf3bff.pdf', '2020-08-18 12:02:59', 'o', 100, NULL, NULL, NULL, NULL, NULL, 'wjddbstp@naver.com', 0, '교육', 0),
	(10036, 'paper', '비트 158기 자기전에 Commit해조', '<p><br></p>', '도정민', 40326, 31020, 'show', '60f6061d-53f6-4524-ac49-046be2a91d6f.png', 'a8a81789-6ddf-4b3f-8040-ceca28311ce0.png', 'have', '19370cfe-30f0-4578-8885-05d79a87eef8.pdf', '2020-08-18 12:04:23', 'o', 1000, 'a4', 'black', 'snow', 'white', 'printer@naver.com', 'choije9410@gmail.com', 0, '교육', 0),
	(10037, 'ebook', '3개국어 동사변화', '<p style="text-align: center; ">포르투갈어, 스페인어, 프랑스어</p>', '장익수', 5000, NULL, 'hide', 'f97ab563-0725-441f-8b7a-6bccc1f22554.png', 'e850fb26-1ebf-40aa-99e7-005da057f214.png', 'sale', 'a9cfbaae-d2b6-49d3-8452-54af0795f548.pdf', '2020-08-18 12:42:08', 'o', 200, NULL, NULL, NULL, NULL, NULL, 'doro16@naver.com', 0, '교육', 0),
	(10038, 'paper', '연인의 사랑', '<p><span style="background-color: rgb(247, 198, 206);">연인</span>의 사랑을 담은 책을 만나보세요 !</p>', '임은지', 26600, 13280, 'show', '3986198f-5fa5-408d-abad-4fd754152caa.jpg', '46d6e5dc-0414-4600-9568-3eb0fb409a65.jpg', 'sale', 'bd62662a-7fe2-429f-bb45-1822975e4b37.pdf', '2020-08-18 14:16:58', 'o', 350, 'a4', 'color', 'snow', 'ivory', 'printer@naver.com', 'kimsur1111@hanmail.net', 0, '소설', 0),
	(10039, 'paper', NULL, NULL, NULL, NULL, 9020, 'temp', NULL, NULL, NULL, NULL, '2020-08-18 15:03:48', 'o', 250, 'a4', 'black', 'mont', 'white', 'printer@naver.com', 'kimsur1111@hanmail.net', 0, NULL, 0),
	(10041, 'paper', 'FUCK YOU', '<p><br></p>', '나은아', 11100, 5520, 'show', '8e42699a-2d64-4b30-adda-fff1b27f7b9c.jpg', '3fc11cf9-7bc8-4656-b5e0-39720ddeffa0.jpg', 'sale', 'f28faf28-0c68-44bd-a931-78c321db8eac.pdf', '2020-08-18 15:08:30', 'o', 150, 'a4', 'black', 'snow', 'white', 'printer@naver.com', 'kimsur1111@hanmail.net', 0, '시', 0),
	(10042, 'paper', NULL, NULL, NULL, NULL, 3500, 'temp', NULL, NULL, NULL, NULL, '2020-08-18 16:53:16', 'o', 23, 'a5', 'black', 'snow', 'white', 'factory01@naver.com', 'wjddbstp@naver.com', 0, NULL, 0);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;

-- 테이블 liblibero.report 구조 내보내기
CREATE TABLE IF NOT EXISTS `report` (
  `report_no` int(11) NOT NULL AUTO_INCREMENT,
  `prod_no` int(11) DEFAULT NULL,
  `post_no` int(11) DEFAULT NULL,
  `report_type` smallint(6) NOT NULL,
  `reporter_id` varchar(30) NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `prod_post` char(4) NOT NULL,
  PRIMARY KEY (`report_no`),
  KEY `FK_report_product` (`prod_no`),
  KEY `FK_report_post` (`post_no`),
  KEY `FK_report_user` (`reporter_id`),
  CONSTRAINT `FK_report_post` FOREIGN KEY (`post_no`) REFERENCES `post` (`post_no`),
  CONSTRAINT `FK_report_product` FOREIGN KEY (`prod_no`) REFERENCES `product` (`prod_no`),
  CONSTRAINT `FK_report_user` FOREIGN KEY (`reporter_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10015 DEFAULT CHARSET=utf8;

-- 테이블 데이터 liblibero.report:~12 rows (대략적) 내보내기
/*!40000 ALTER TABLE `report` DISABLE KEYS */;
INSERT INTO `report` (`report_no`, `prod_no`, `post_no`, `report_type`, `reporter_id`, `reg_date`, `prod_post`) VALUES
	(10001, NULL, 10020, 4, 'factory03', '2020-08-18 16:49:50', 'post'),
	(10002, NULL, 10023, 5, 'choije9410@gmail.com', '2020-08-18 16:51:55', 'post'),
	(10003, NULL, 10018, 4, 'choije9410@gmail.com', '2020-08-18 16:52:07', 'post'),
	(10004, NULL, 10018, 6, 'factory03', '2020-08-18 16:52:14', 'post'),
	(10005, 10033, NULL, 2, 'wjddbstp@naver.com', '2020-08-18 16:52:42', 'prod'),
	(10006, NULL, 10022, 6, 'wjddbstp@naver.com', '2020-08-18 16:52:51', 'post'),
	(10007, 10006, NULL, 5, 'wjddbstp@naver.com', '2020-08-18 16:53:09', 'prod'),
	(10008, NULL, 10018, 3, 'choije9410@gmail.com', '2020-08-18 16:55:25', 'post'),
	(10009, 10006, NULL, 1, 'doro16@naver.com', '2020-08-18 17:07:08', 'prod'),
	(10012, 10005, NULL, 6, 'doro16@naver.com', '2020-08-18 17:07:36', 'prod'),
	(10013, 10000, NULL, 2, 'doro16@naver.com', '2020-08-18 17:07:59', 'prod'),
	(10014, 10006, NULL, 1, 'admin4', '2020-08-18 17:10:03', 'prod');
/*!40000 ALTER TABLE `report` ENABLE KEYS */;

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- 테이블 데이터 liblibero.review:~4 rows (대략적) 내보내기
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` (`review_no`, `user_id`, `buy_no`, `review_name`, `review_content`, `review_image`, `star_rate`, `reg_date`, `prod_no`) VALUES
	(1, 'choije9410@gmail.com', 10001, NULL, '아이 교육용으로 좋은 책이네요 ^^', NULL, 5, '2020-08-18 10:25:29', 10005),
	(2, 'choije9410@gmail.com', 10004, NULL, '사진도 자세하고 레시피도 좋아요', NULL, 50, '2020-08-18 10:25:51', 10025),
	(4, 'buyer@naver.com', 10036, NULL, '지금까지 읽어본 소설 중 최고의 소설입니다 ! 지금 생각해봐도 소름이 돋아요 x.x', '2d26a2b6-3aaa-4af9-b89c-e9701b4f1e0a.jpg', 50, '2020-08-18 15:47:27', 10038),
	(5, 'choije9410@gmail.com', 10033, NULL, '로맨스와 공포라니 새롭네요! 정말 재밌어요 추천합니다', NULL, 50, '2020-08-18 16:20:59', 10038),
	(6, 'user01', 10035, NULL, '공포를 기대했는데 별로였어요', NULL, 15, '2020-08-18 16:21:46', 10038);
/*!40000 ALTER TABLE `review` ENABLE KEYS */;

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

-- 테이블 데이터 liblibero.upload_file:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `upload_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `upload_file` ENABLE KEYS */;

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
  `birth_date` date DEFAULT NULL,
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

-- 테이블 데이터 liblibero.user:~19 rows (대략적) 내보내기
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`user_id`, `password`, `nickname`, `profile`, `gender_code`, `name`, `address`, `phone`, `phone_code`, `user_code`, `role`, `birth_date`, `reg_date`, `factory_no`, `cash_code`, `a5_price`, `b5_price`, `a4_price`, `color_price`, `black_price`, `snow_price`, `mont_price`, `arte_price`, `white_price`, `ivory_price`, `rough_price`, `kakao_id`) VALUES
	('admin1', '1234', '관리자1', 'ice1.jpg', 'm', '관리자', '서울시 강남구', '000-0000-1111', 1, 1, 'a', '2020-07-28', '2020-07-15 21:28:59', NULL, 'bf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('admin2', '1234', '관리자2', 'ice2.jpg', 'm', '관리자', NULL, '000-1111-2222', 1, 1, 'a', '2020-07-28', '2020-07-15 21:41:54', NULL, 'bf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('admin3', '1234', '관리자3', 'ice3.jpg', 'f', '관리자', NULL, '000-2222-3333', 1, 1, 'a', '2020-07-28', '2020-07-15 21:43:09', NULL, 'bf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('admin4', '1234', '관리자4', 'pururum.jpg', 'f', '관리자', NULL, '000-3333-2222', 1, 1, 'a', '1994-10-31', '2020-07-15 21:43:09', NULL, 'bf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('buyer@naver.com', '1111', '박소비자', '70e85935-65e3-489e-8181-9c15ba6836d5.jpg', 'm', '박소비자', '강남구 테헤란로5길 11 YBM빌딩 2층', '01022222222', 0, 1, 'u', '1995-08-18', '2020-08-17 19:05:50', NULL, 'bf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('choije9410@gmail.com', '1111', '초코', 'pururum.jpg', 'f', '최지은', '06134 서울 강남구 테헤란로5길 11,역삼동 YBM 빌딩 2층,', '010-0000-3555', 1, 1, 'u', '1994-10-31', '2020-07-16 01:58:30', NULL, 'af', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('doro16@naver.com', '1234', '단비', 'zzime.jpg', 'f', '이윤경', '서울시 ', '010-9599-9599', 1, 1, 'u', '2020-08-17', '2020-08-17 19:33:28', NULL, 'bf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('factory01@naver.com', '1111', '인쇄소01', 'ice1.jpg', 'f', '인쇄소', '경기도', '000-1234-2222', 0, 1, 'f', '2000-07-28', '2020-07-15 21:45:24', '1234', 'bf', 10, 20, 40, 100, 40, 3000, 4000, 4300, 10, 20, 10, NULL),
	('factory02@hanmail.net', '2222', '인쇄소02', NULL, 'f', '인쇄소', '경기도', '000-1313-2222', 0, 1, 'f', '1970-07-28', '2020-07-15 21:45:24', '1424132', 'bf', 20, 30, 40, 100, 100, 2000, 3000, 3500, 10, 5, 5, NULL),
	('factory03', '3333', '인쇄03', NULL, 'f', '인쇄소', '서울', '010-1313-3333', 0, 1, 'f', '2020-07-28', '2020-07-25 01:08:31', '12312311', 'bf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('factory04', '4444', '인쇄0404', NULL, 'm', '인쇄04', NULL, '010-1414-1414', 0, 1, 'f', '2020-07-28', '2020-07-28 18:41:35', '1231232', 'bf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('kimsur1111@hanmail.net', '1111', '김작가', 'd46fbf61-d246-4534-b95c-12acd2d6899c.png', 'f', '김작가', '06134 서울 강남구 테헤란로5길 11,역삼동 YBM 빌딩 2층,', '01042796268', 1, 1, 'u', '1996-11-11', '2020-08-17 19:14:21', NULL, 'bf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1390389807'),
	('kimsur1111@naver.com', '1111', '윤디자이너', 'c5a95fd8-e197-4efa-a693-90b404de00a7.jpg', 'f', '윤디자이너', '06134 서울 강남구 테헤란로5길 11,역삼동 YBM 빌딩 2층,', '01035939410', 1, 1, 'u', '1996-11-11', '2020-08-17 19:01:46', NULL, 'bf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('printer@naver.com', '1111', '중앙 인쇄소', 'ed99ca03-c039-4d8f-b062-c4480d06c917.png', 'm', '중앙 인쇄소', '강남구 테헤란로5길 11 YBM빌딩 2층', '01011111111', 1, 1, 'f', '1996-11-11', '2020-08-17 18:20:05', '10000', 'bf', 5, 15, 20, 30, 20, 1000, 1500, 2000, 10, 15, 20, NULL),
	('user01', '0101', '루이맘', NULL, 'f', '윤다희', '06362 서울 강남구 밤고개로 76-2 수서동', '010-0101-0101', 0, 1, 'u', '1982-11-01', '2020-07-16 01:55:56', NULL, 'af', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('user02', '0202', '유저02', 'ice3.jpg', 'f', '유저02', NULL, '010-0202-0202', 0, 1, 'u', '2010-07-28', '2020-07-16 01:55:56', NULL, 'bf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('wjddbstp95@gmail.com', '1111', '윤세', NULL, 'm', '정윤세', NULL, '010-0011-1100', 0, 1, 'u', '2020-07-16', '2020-07-29 19:27:24', NULL, 'bf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('wjddbstp@naver.com', '1234', 'pepe', 'dd51904c-051f-436e-b031-1c47a235aa76.jpg', 'm', '정윤세', '17066 경기 용인시 기흥구 기흥역로58번길 78,구갈동, 기흥역 더샵,', '01077374501', 1, 1, 'u', '1995-02-23', '2020-08-17 18:32:45', NULL, 'bf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('xodnr097@naver.com', '1111', '유저유저1', NULL, 'f', '김태욱', '충정도', '010-9430-3757', 0, 1, 'u', '2020-07-16', '2020-07-29 19:27:28', NULL, 'bf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

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
) ENGINE=InnoDB AUTO_INCREMENT=10015 DEFAULT CHARSET=utf8;

-- 테이블 데이터 liblibero.wish:~4 rows (대략적) 내보내기
/*!40000 ALTER TABLE `wish` DISABLE KEYS */;
INSERT INTO `wish` (`wish_no`, `prod_no`, `user_id`) VALUES
	(10000, 10003, 'choije9410@gmail.com'),
	(10010, 10021, 'kimsur1111@hanmail.net'),
	(10011, 10018, 'kimsur1111@hanmail.net'),
	(10013, 10007, 'kimsur1111@hanmail.net'),
	(10014, 10038, 'buyer@naver.com');
/*!40000 ALTER TABLE `wish` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
