-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: 194.81.104.22    Database: db14406068
-- ------------------------------------------------------
-- Server version	5.6.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin_staff`
--

DROP TABLE IF EXISTS `admin_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_staff` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `office_id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `surname` varchar(45) NOT NULL,
  `gender` char(1) NOT NULL,
  `dob` date NOT NULL,
  PRIMARY KEY (`admin_id`,`office_id`),
  KEY `fk_admin_staff_offices1_idx` (`office_id`),
  CONSTRAINT `fk_admin_staff_offices1` FOREIGN KEY (`office_id`) REFERENCES `office` (`office_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_staff`
--

LOCK TABLES `admin_staff` WRITE;
/*!40000 ALTER TABLE `admin_staff` DISABLE KEYS */;
INSERT INTO `admin_staff` VALUES (1,1,'Mehul','Chamunda','M','1990-01-09'),(2,4,'Shiv','Patel','M','1991-09-15'),(3,5,'Ali','Raja','M','1996-12-09'),(4,1,'Sam','Patterson','M','1981-09-01'),(5,1,'Beth','Hopes','F','1991-07-07'),(6,4,'Steph','Walls','F','1980-02-02'),(7,5,'Maciek','Pawel','M','1991-01-01'),(8,5,'Lucy','Patel','F','1995-08-08');
/*!40000 ALTER TABLE `admin_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car`
--

DROP TABLE IF EXISTS `car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `car` (
  `car_reg_plate` varchar(7) NOT NULL,
  `make` varchar(45) NOT NULL,
  `model` varchar(45) NOT NULL,
  PRIMARY KEY (`car_reg_plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car`
--

LOCK TABLES `car` WRITE;
/*!40000 ALTER TABLE `car` DISABLE KEYS */;
INSERT INTO `car` VALUES ('BX59TWK','BMW','3 SERIES'),('P212SUL','TOYOTA','YARIS'),('SA02BCU','HYUNDAI','WORK'),('VE08XPZ','AUDI','A4'),('YFI0WXB','FORD','MONDEO');
/*!40000 ALTER TABLE `car` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car_inspection`
--

DROP TABLE IF EXISTS `car_inspection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `car_inspection` (
  `carReport_id` int(11) NOT NULL AUTO_INCREMENT,
  `car_reg_plate` varchar(10) NOT NULL,
  `car_test_result` char(1) NOT NULL,
  `fault_info` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`carReport_id`,`car_reg_plate`),
  KEY `fk_car_inspection_cars1_idx` (`car_reg_plate`),
  CONSTRAINT `fk_car_inspection_cars1` FOREIGN KEY (`car_reg_plate`) REFERENCES `car` (`car_reg_plate`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car_inspection`
--

LOCK TABLES `car_inspection` WRITE;
/*!40000 ALTER TABLE `car_inspection` DISABLE KEYS */;
INSERT INTO `car_inspection` VALUES (1,'BX59TWK','P',NULL),(2,'P212SUL','P',NULL),(3,'SA02BCU','P',NULL),(4,'VE08XPZ','F','Rear brake light not working'),(5,'YFI0WXB','F','Tyre deflated'),(6,'BX59TWK','P',NULL),(7,'P212SUL','P',NULL),(8,'SA02BCU','P',NULL),(9,'VE08XPZ','P',NULL),(10,'YFI0WXB','F','Windscreen whipers not working'),(11,'BX59TWK','F','Front right indicator faulty'),(12,'YFI0WXB','F','Window broken'),(13,'YFI0WXB','P',NULL);
/*!40000 ALTER TABLE `car_inspection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client` (
  `client_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `surname` varchar(45) NOT NULL,
  `dob` date NOT NULL,
  `gender` char(1) NOT NULL,
  `license_number` varchar(16) NOT NULL,
  `address` varchar(50) NOT NULL,
  `postcode` varchar(8) NOT NULL,
  `telephone` varchar(11) NOT NULL,
  `hours_booked` int(11) DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (3,'Mehul','Chamunda','1996-08-08','M','CHAMU5347868','55 Yorkshire Road','LE46PL','09987456224',10),(5,'Bob','Teller','1990-01-01','M','TELLE35324234','42 Example Road','TE47YU','08879654887',1),(6,'Ali','Raja','1991-01-01','M','RAJA88756567','6 Laptop Road','H859UJ','08879365447',8),(7,'Sam','Patterson','1994-01-01','M','PATTE4556546','9 Kettering Road','NN11DH','07864257993',6),(9,'Lucy','Road','1996-08-07','F','ROAD9787987','6 Barrack Road','NN5GH8','47789632115',15),(10,'John','Raja','1995-01-01','M','RAJA4545545','St Johns','NN11DH','07789654886',25),(11,'Kanye','East','1937-03-03','M','WEST35216234','21 Kanye Lane','KL32 0FD','01234567891',0);
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `driving_test`
--

DROP TABLE IF EXISTS `driving_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `driving_test` (
  `drivingTest_id` int(11) NOT NULL AUTO_INCREMENT,
  `client_client_id` int(11) NOT NULL,
  `written_test` char(1) NOT NULL,
  `practical_test` char(1) NOT NULL,
  `practical_date` date NOT NULL,
  `fail_reason` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`drivingTest_id`),
  KEY `fk_driving_test_client1_idx` (`client_client_id`),
  CONSTRAINT `fk_driving_test_client1` FOREIGN KEY (`client_client_id`) REFERENCES `client` (`client_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driving_test`
--

LOCK TABLES `driving_test` WRITE;
/*!40000 ALTER TABLE `driving_test` DISABLE KEYS */;
INSERT INTO `driving_test` VALUES (1,3,'P','F','2016-01-01','Crashed'),(2,5,'P','F','2016-05-09','Speeding around a roundabout'),(3,6,'P','P','2016-05-03',NULL),(4,9,'P','P','2016-09-13',NULL),(5,5,'P','F','2016-05-11','Not checking mirrors before moving off'),(6,5,'P','F','2016-05-20','Not wearing a seat belt'),(7,3,'P','F','2015-12-01','Driving off at red light'),(8,3,'P','F','2016-12-17','Very slow driving'),(9,5,'P','F','2016-12-18','Hesitation'),(10,3,'P','P','2016-12-19',NULL);
/*!40000 ALTER TABLE `driving_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructor`
--

DROP TABLE IF EXISTS `instructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instructor` (
  `instructor_id` int(11) NOT NULL AUTO_INCREMENT,
  `office_id` int(11) NOT NULL,
  `car_reg_plate` varchar(10) NOT NULL,
  `manager` varchar(3) NOT NULL,
  `name` varchar(45) NOT NULL,
  `surname` varchar(45) NOT NULL,
  `dob` date NOT NULL,
  `gender` varchar(45) NOT NULL,
  `telephone` varchar(11) NOT NULL,
  PRIMARY KEY (`instructor_id`,`office_id`,`car_reg_plate`),
  KEY `fk_instructors_offices1_idx` (`office_id`),
  KEY `fk_instructor_car1_idx` (`car_reg_plate`),
  CONSTRAINT `fk_instructor_car1` FOREIGN KEY (`car_reg_plate`) REFERENCES `car` (`car_reg_plate`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_instructors_offices1` FOREIGN KEY (`office_id`) REFERENCES `office` (`office_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructor`
--

LOCK TABLES `instructor` WRITE;
/*!40000 ALTER TABLE `instructor` DISABLE KEYS */;
INSERT INTO `instructor` VALUES (1,1,'BX59TWK','Y','Luke','Patel','1959-08-16','M','07543799567'),(2,4,'P212SUL','N','William','Leedham','1996-08-16','M','01162610664'),(3,5,'SA02BCU','Y','Hannah','Turn','1960-08-01','F','05587965117'),(4,4,'VE08XPZ','Y','Harry','Johnson','1996-01-01','M','09987456332'),(5,1,'YFI0WXB','N','Emily','Mason','1991-04-09','F','04478963214');
/*!40000 ALTER TABLE `instructor` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`s14406068`@`%`*/ /*!50003 TRIGGER `db14406068`.`instructor_BEFORE_INSERT` BEFORE INSERT ON`instructor` FOR EACH ROW
BEGIN
	IF NOT (NEW.gender = 'M' or NEW.gender = 'F' OR NEW.gender = 'O') THEN
		SET NEW.gender = '-';     
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`s14406068`@`%`*/ /*!50003 TRIGGER `db14406068`.`instructor_BEFORE_UPDATE` BEFORE UPDATE ON `instructor` FOR EACH ROW
BEGIN

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `interview`
--

DROP TABLE IF EXISTS `interview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interview` (
  `interview_id` int(11) NOT NULL AUTO_INCREMENT,
  `instructor_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `notes` varchar(100) DEFAULT NULL,
  `i_date` date NOT NULL,
  `i_time` time NOT NULL,
  PRIMARY KEY (`interview_id`,`instructor_id`,`client_id`),
  KEY `fk_interviews_instructors1_idx` (`instructor_id`),
  KEY `fk_interview_client1_idx` (`client_id`),
  CONSTRAINT `fk_interview_client1` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_interviews_instructors1` FOREIGN KEY (`instructor_id`) REFERENCES `instructor` (`instructor_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interview`
--

LOCK TABLES `interview` WRITE;
/*!40000 ALTER TABLE `interview` DISABLE KEYS */;
INSERT INTO `interview` VALUES (1,5,3,'Second time driving switched from another school','2016-01-08','10:00:00'),(2,3,5,NULL,'2016-05-04','10:15:00'),(3,1,6,'Theory already passed','2016-05-09','17:50:00'),(4,2,7,'New driver and very nervous','2016-04-23','15:15:00'),(5,5,9,NULL,'2016-01-05','09:00:00'),(6,5,10,'Has experience with driving cars','2016-08-08','14:00:00');
/*!40000 ALTER TABLE `interview` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lesson`
--

DROP TABLE IF EXISTS `lesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lesson` (
  `lesson_id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `instructor_id` int(11) NOT NULL,
  `lesson_time` time NOT NULL,
  `lesson_date` date NOT NULL,
  `start_mileage` int(6) DEFAULT NULL,
  `end_mileage` int(6) DEFAULT NULL,
  `progress` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`lesson_id`,`client_id`,`instructor_id`),
  KEY `fk_appointments_clients1_idx` (`client_id`),
  KEY `fk_lessons_instructors1_idx` (`instructor_id`),
  CONSTRAINT `fk_appointments_clients1` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_lessons_instructors1` FOREIGN KEY (`instructor_id`) REFERENCES `instructor` (`instructor_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lesson`
--

LOCK TABLES `lesson` WRITE;
/*!40000 ALTER TABLE `lesson` DISABLE KEYS */;
INSERT INTO `lesson` VALUES (1,3,1,'08:00:00','2016-12-19',70000,70010,'Did very well on bay parking but need to improve on speeding'),(2,5,2,'09:00:00','2016-12-20',80000,80009,'Roundabouts and three point turn'),(3,6,2,'15:00:00','2016-12-21',90000,90022,'Speeding on 40mph roads'),(4,7,3,'13:00:00','2016-12-20',61000,61024,'Roundabouts and practical test revision'),(5,9,5,'11:00:00','2016-12-30',63000,63012,'Practical test revision'),(6,10,4,'15:00:00','2017-01-15',58000,58009,'Roundabouts revision'),(7,7,4,'15:00:00','2016-12-27',NULL,NULL,NULL),(8,7,4,'15:00:00','2016-12-29',NULL,NULL,NULL),(9,10,5,'13:00:00','2016-12-30',NULL,NULL,NULL),(10,10,5,'13:00:00','2017-01-02',NULL,NULL,NULL),(11,7,4,'15:00:00','2017-01-16',NULL,NULL,NULL),(12,7,4,'15:00:00','2017-01-16',NULL,NULL,NULL);
/*!40000 ALTER TABLE `lesson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `office`
--

DROP TABLE IF EXISTS `office`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `office` (
  `office_id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(50) NOT NULL,
  `postcode` varchar(8) NOT NULL,
  `telephone` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`office_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `office`
--

LOCK TABLES `office` WRITE;
/*!40000 ALTER TABLE `office` DISABLE KEYS */;
INSERT INTO `office` VALUES (1,'55 OFFICE ROAD','LE78HG','01778965411'),(4,'85 WORLD ROAD','NN11DH','78965485224'),(5,'23 BARACK ROAD','KE79HG','01157896335');
/*!40000 ALTER TABLE `office` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `view_female_instructors`
--

DROP TABLE IF EXISTS `view_female_instructors`;
/*!50001 DROP VIEW IF EXISTS `view_female_instructors`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_female_instructors` AS SELECT 
 1 AS `office_id`,
 1 AS `name`,
 1 AS `surname`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'db14406068'
--

--
-- Dumping routines for database 'db14406068'
--
/*!50003 DROP FUNCTION IF EXISTS `func_date_diffrence_55` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`s14406068`@`%` FUNCTION `func_date_diffrence_55`() RETURNS date
BEGIN
	DECLARE year_diff DATE; 
    SET year_diff = DATE_SUB(CURDATE(),INTERVAL 55 YEAR);
RETURN year_diff;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `func_next_sunday` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`s14406068`@`%` FUNCTION `func_next_sunday`() RETURNS date
BEGIN
DECLARE sunday_date DATE; 
	SET sunday_date = DATE_ADD(CURDATE(), INTERVAL (8 - IF(DAYOFWEEK(CURDATE())=1, 8, DAYOFWEEK(CURDATE()))) DAY);
RETURN sunday_date;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_appointments_nextweek` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`s14406068`@`%` PROCEDURE `proc_appointments_nextweek`(in_instructor_id INT(6))
BEGIN
	SELECT c.name, c.surname, l.lesson_time, l.lesson_date
		FROM lesson l
		JOIN instructor i
			ON l.instructor_id = i.instructor_id
		JOIN client c
			ON l.client_id = c.client_id
		WHERE i.instructor_id = in_instructor_id 
        AND (l.lesson_date<=(func_next_sunday() + INTERVAL 7 DAY)) 
        AND (l.lesson_date>= func_next_sunday())
        ORDER BY l.lesson_date ASC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_average_miles` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`s14406068`@`%` PROCEDURE `proc_average_miles`()
BEGIN
	SELECT round(avg(end_mileage-start_mileage),0) AS rounded_average FROM lesson;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_car_no_faults` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`s14406068`@`%` PROCEDURE `proc_car_no_faults`()
BEGIN
	SELECT car_reg_plate 
	FROM car_inspection ci
	WHERE (SELECT COUNT(car_test_result) FROM car_inspection WHERE car_test_result = 'F' AND  car_reg_plate = ci.car_reg_plate) < 1
	GROUP BY car_reg_plate;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_female_office` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`s14406068`@`%` PROCEDURE `proc_female_office`(in_office_id INT(6))
BEGIN
	SELECT name, surname FROM view_female_instructors WHERE office_id = in_office_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_instructors_over55` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`s14406068`@`%` PROCEDURE `proc_instructors_over55`()
BEGIN
	SELECT name, surname, telephone FROM instructor WHERE dob <= func_date_diffrence_55();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_instructor_interview` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`s14406068`@`%` PROCEDURE `proc_instructor_interview`(in_instructor_id INT(6))
BEGIN
	SELECT c.name, c.surname, i_date, notes
		FROM interview i
		JOIN client c
		ON i.client_id = c.client_id
		WHERE i.instructor_id = in_instructor_id; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_manager_office` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`s14406068`@`%` PROCEDURE `proc_manager_office`()
BEGIN
	SELECT i.name, i.surname, i.telephone, o.address, o.telephone
		FROM office o
		JOIN instructor i
			ON o.office_id = i.office_id AND i.manager = 'Y';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_month_pass` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`s14406068`@`%` PROCEDURE `proc_month_pass`(in_month int, in_year int)
BEGIN
	SELECT c.name, c.surname, dt.practical_date
		FROM driving_test dt
		JOIN client c
			ON c.client_id = dt.client_client_id
		WHERE MONTH(practical_date) = in_month AND YEAR(practical_date) = in_year AND practical_test = 'P';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_office_staff` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`s14406068`@`%` PROCEDURE `proc_office_staff`()
BEGIN
SELECT o.address, count(ad.office_id) AS no_of_staff 
	FROM office o 
	JOIN admin_staff ad
		ON ad.office_id = o.office_id
	GROUP BY o.office_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_still_failed_over3` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`s14406068`@`%` PROCEDURE `proc_still_failed_over3`()
BEGIN
	SELECT DISTINCT c.name, c.surname
		FROM driving_test dt
		join client c
		ON dt.client_client_id = c.client_id
		WHERE (SELECT COUNT(practical_test) FROM driving_test WHERE practical_test = 'F' AND  client_client_id = dt.client_client_id) >=3 
        AND   (SELECT COUNT(practical_test) FROM driving_test WHERE practical_test = 'P' AND  client_client_id = dt.client_client_id) <1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `view_female_instructors`
--

/*!50001 DROP VIEW IF EXISTS `view_female_instructors`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`s14406068`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_female_instructors` AS select `instructor`.`office_id` AS `office_id`,`instructor`.`name` AS `name`,`instructor`.`surname` AS `surname` from `instructor` where (`instructor`.`gender` = 'F') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-13 19:57:18
