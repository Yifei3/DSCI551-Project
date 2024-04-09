DROP DATABASE IF EXISTS `student-1`;
CREATE DATABASE `student-1`; 
USE `student-1`;

SET NAMES utf8 ;
SET character_set_client = utf8mb4 ;

DROP TABLE IF EXISTS `students`;
DROP TABLE IF EXISTS `course_taken_by`;
DROP TABLE IF EXISTS `student_to_department`;


CREATE TABLE `students` (
  `student_id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `email` varchar(50),
  `department_id` int NOT NULL,
  `gpa` decimal(3,2),
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `course_taken_by` (
  `course_id` varchar(50),
  `student_id` int,
  PRIMARY KEY (`course_id`, `student_id`),
  FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;




INSERT INTO `students` VALUES (1,'Thomas Taylor','female', 'thomas297@gmail.com', 3, 2.09);
INSERT INTO `students` VALUES (2,'Joseph Wilson','male', 'joseph208@gmail.com', 2, 2.1);
INSERT INTO `students` VALUES (3,'Mary Brown','male', 'mary220@gmail.com', 1, 2.53);
INSERT INTO `students` VALUES (4,'Elizabeth Williams','female', 'elizabeth204@gmail.com', 3, 2.11);
INSERT INTO `students` VALUES (5,'Sarah Rodriguez','male', 'sarah233@gmail.com', 3, 4.0);
INSERT INTO `students` VALUES (6,'Michael Moore','male', 'michael282@gmail.com', 2, 2.61);
INSERT INTO `students` VALUES (7,'Richard Martin','female', 'richard248@gmail.com', 1, 2.93);
INSERT INTO `students` VALUES (8,'Michael Moore','male', 'michael204@gmail.com', 1, 2.84);
INSERT INTO `students` VALUES (9,'Jennifer Hernandez','female', 'jennifer285@gmail.com', 1, 3.6);
INSERT INTO `students` VALUES (10,'William Smith','male', 'william272@gmail.com', 1, 3.67);
INSERT INTO `students` VALUES (11,'Susan Martin','female', 'susan300@gmail.com', 1, 3.18);
INSERT INTO `students` VALUES (12,'William Hernandez','female', 'william262@gmail.com', 1, 3.01);
INSERT INTO `students` VALUES (13,'Richard Hernandez','female', 'richard249@gmail.com', 1, 3.27);
INSERT INTO `students` VALUES (14,'Robert Wilson','male', 'robert257@gmail.com', 1, 3.07);
INSERT INTO `students` VALUES (15,'John Rodriguez','female', 'john236@gmail.com', 3, 2.53);
INSERT INTO `students` VALUES (16,'Robert Moore','female', 'robert253@gmail.com', 2, 3.26);
INSERT INTO `students` VALUES (17,'John Williams','female', 'john281@gmail.com', 2, 3.09);
INSERT INTO `students` VALUES (18,'Jennifer Smith','female', 'jennifer267@gmail.com', 1, 2.33);
INSERT INTO `students` VALUES (19,'William Smith','female', 'william269@gmail.com', 2, 3.15);
INSERT INTO `students` VALUES (20,'William Garcia','male', 'william223@gmail.com', 3, 3.7);
INSERT INTO `students` VALUES (21,'Patricia Wilson','female', 'patricia273@gmail.com', 1, 2.91);
INSERT INTO `students` VALUES (22,'Barbara Gonzalez','male', 'barbara213@gmail.com', 3, 3.3);
INSERT INTO `students` VALUES (23,'Jessica Johnson','female', 'jessica216@gmail.com', 2, 2.43);
INSERT INTO `students` VALUES (24,'Barbara Wilson','male', 'barbara213@gmail.com', 2, 3.3);
INSERT INTO `students` VALUES (25,'Thomas Taylor','male', 'thomas249@gmail.com', 1, 2.13);
INSERT INTO `students` VALUES (26,'Charles Martinez','female', 'charles247@gmail.com', 1, 2.38);
INSERT INTO `students` VALUES (27,'Susan Wilson','male', 'susan250@gmail.com', 1, 2.5);
INSERT INTO `students` VALUES (28,'David Hernandez','female', 'david239@gmail.com', 3, 2.51);
INSERT INTO `students` VALUES (29,'Thomas Jackson','female', 'thomas268@gmail.com', 2, 3.51);
INSERT INTO `students` VALUES (30,'Thomas Brown','male', 'thomas279@gmail.com', 2, 2.6);
INSERT INTO `students` VALUES (31,'James Wilson','female', 'james281@gmail.com', 3, 3.42);
INSERT INTO `students` VALUES (32,'Jennifer Wilson','male', 'jennifer240@gmail.com', 1, 3.08);
INSERT INTO `students` VALUES (33,'William Brown','female', 'william211@gmail.com', 1, 2.51);
INSERT INTO `students` VALUES (34,'Patricia Martin','male', 'patricia296@gmail.com', 1, 3.78);
INSERT INTO `students` VALUES (35,'James Davis','female', 'james248@gmail.com', 1, 3.35);
INSERT INTO `students` VALUES (36,'Joseph Johnson','female', 'joseph290@gmail.com', 1, 2.79);
INSERT INTO `students` VALUES (37,'William Rodriguez','female', 'william257@gmail.com', 1, 2.1);
INSERT INTO `students` VALUES (38,'Sarah Jackson','male', 'sarah288@gmail.com', 1, 3.57);
INSERT INTO `students` VALUES (39,'Susan Rodriguez','male', 'susan217@gmail.com', 1, 2.11);
INSERT INTO `students` VALUES (40,'Jennifer Rodriguez','female', 'jennifer272@gmail.com', 1, 3.73);
INSERT INTO `students` VALUES (41,'Elizabeth Williams','male', 'elizabeth291@gmail.com', 1, 2.66);
INSERT INTO `students` VALUES (42,'Jessica Miller','female', 'jessica216@gmail.com', 1, 2.43);
INSERT INTO `students` VALUES (43,'Jessica Taylor','female', 'jessica241@gmail.com', 1, 2.1);
INSERT INTO `students` VALUES (44,'Jennifer Wilson','female', 'jennifer246@gmail.com', 1, 2.2);
INSERT INTO `students` VALUES (45,'James Wilson','male', 'james281@gmail.com', 1, 3.42);
INSERT INTO `students` VALUES (46,'Susan Johnson','male', 'susan262@gmail.com', 1, 3.06);
INSERT INTO `students` VALUES (47,'David Jones','male', 'david166@gmail.com', 3, 2.91);
INSERT INTO `students` VALUES (48,'Karen Garcia','male', 'karen200@gmail.com', 3, 2.96);
INSERT INTO `students` VALUES (49,'Robert Davis','female', 'robert138@gmail.com', 2, 2.9);
INSERT INTO `students` VALUES (50,'Joseph Williams','male', 'joseph147@gmail.com', 2, 3.63);

INSERT INTO `course_taken_by` VALUES ('DS104', 1);
INSERT INTO `course_taken_by` VALUES ('CS101', 2);
INSERT INTO `course_taken_by` VALUES ('DS105', 3);
INSERT INTO `course_taken_by` VALUES ('CS102', 3);
INSERT INTO `course_taken_by` VALUES ('DS100', 3);
INSERT INTO `course_taken_by` VALUES ('DS102', 4);
INSERT INTO `course_taken_by` VALUES ('DS102', 5);
INSERT INTO `course_taken_by` VALUES ('CS103', 5);
INSERT INTO `course_taken_by` VALUES ('DS103', 5);
INSERT INTO `course_taken_by` VALUES ('DS102', 6);
INSERT INTO `course_taken_by` VALUES ('DS105', 7);
INSERT INTO `course_taken_by` VALUES ('DS102', 7);
INSERT INTO `course_taken_by` VALUES ('DS100', 7);
INSERT INTO `course_taken_by` VALUES ('CS102', 8);
INSERT INTO `course_taken_by` VALUES ('DS103', 8);
INSERT INTO `course_taken_by` VALUES ('CS103', 8);
INSERT INTO `course_taken_by` VALUES ('DS104', 9);
INSERT INTO `course_taken_by` VALUES ('CS102', 9);
INSERT INTO `course_taken_by` VALUES ('CS101', 10);
INSERT INTO `course_taken_by` VALUES ('DS103', 10);
INSERT INTO `course_taken_by` VALUES ('CS102', 10);
INSERT INTO `course_taken_by` VALUES ('DS103', 11);
INSERT INTO `course_taken_by` VALUES ('CS101', 12);
INSERT INTO `course_taken_by` VALUES ('DS104', 12);
INSERT INTO `course_taken_by` VALUES ('DS102', 13);
INSERT INTO `course_taken_by` VALUES ('DS100', 13);
INSERT INTO `course_taken_by` VALUES ('DS105', 14);
INSERT INTO `course_taken_by` VALUES ('DS103', 14);
INSERT INTO `course_taken_by` VALUES ('CS104', 15);
INSERT INTO `course_taken_by` VALUES ('CS105', 16);
INSERT INTO `course_taken_by` VALUES ('DS104', 16);
INSERT INTO `course_taken_by` VALUES ('CS104', 16);
INSERT INTO `course_taken_by` VALUES ('DS102', 17);
INSERT INTO `course_taken_by` VALUES ('DS103', 18);
INSERT INTO `course_taken_by` VALUES ('CS103', 18);
INSERT INTO `course_taken_by` VALUES ('DS100', 19);
INSERT INTO `course_taken_by` VALUES ('DS105', 19);
INSERT INTO `course_taken_by` VALUES ('CS102', 20);
INSERT INTO `course_taken_by` VALUES ('CS104', 21);
INSERT INTO `course_taken_by` VALUES ('DS100', 21);
INSERT INTO `course_taken_by` VALUES ('CS101', 22);
INSERT INTO `course_taken_by` VALUES ('CS103', 22);
INSERT INTO `course_taken_by` VALUES ('CS105', 23);
INSERT INTO `course_taken_by` VALUES ('DS105', 23);
INSERT INTO `course_taken_by` VALUES ('CS101', 24);
INSERT INTO `course_taken_by` VALUES ('CS103', 24);
INSERT INTO `course_taken_by` VALUES ('CS104', 25);
INSERT INTO `course_taken_by` VALUES ('DS102', 25);
INSERT INTO `course_taken_by` VALUES ('CS103', 25);
INSERT INTO `course_taken_by` VALUES ('DS102', 26);
INSERT INTO `course_taken_by` VALUES ('DS100', 26);
INSERT INTO `course_taken_by` VALUES ('DS103', 26);
INSERT INTO `course_taken_by` VALUES ('DS100', 27);
INSERT INTO `course_taken_by` VALUES ('DS102', 27);
INSERT INTO `course_taken_by` VALUES ('CS104', 28);
INSERT INTO `course_taken_by` VALUES ('CS101', 28);
INSERT INTO `course_taken_by` VALUES ('CS104', 29);
INSERT INTO `course_taken_by` VALUES ('DS104', 30);
INSERT INTO `course_taken_by` VALUES ('CS104', 31);
INSERT INTO `course_taken_by` VALUES ('DS105', 31);
INSERT INTO `course_taken_by` VALUES ('CS102', 32);
INSERT INTO `course_taken_by` VALUES ('DS100', 32);
INSERT INTO `course_taken_by` VALUES ('DS100', 33);
INSERT INTO `course_taken_by` VALUES ('DS102', 33);
INSERT INTO `course_taken_by` VALUES ('CS104', 33);
INSERT INTO `course_taken_by` VALUES ('CS102', 34);
INSERT INTO `course_taken_by` VALUES ('DS103', 34);
INSERT INTO `course_taken_by` VALUES ('DS104', 34);
INSERT INTO `course_taken_by` VALUES ('CS104', 35);
INSERT INTO `course_taken_by` VALUES ('DS100', 35);
INSERT INTO `course_taken_by` VALUES ('DS105', 35);
INSERT INTO `course_taken_by` VALUES ('DS103', 36);
INSERT INTO `course_taken_by` VALUES ('CS105', 36);
INSERT INTO `course_taken_by` VALUES ('DS105', 36);
INSERT INTO `course_taken_by` VALUES ('CS102', 37);
INSERT INTO `course_taken_by` VALUES ('DS100', 37);
INSERT INTO `course_taken_by` VALUES ('CS104', 38);
INSERT INTO `course_taken_by` VALUES ('CS102', 39);
INSERT INTO `course_taken_by` VALUES ('CS103', 39);
INSERT INTO `course_taken_by` VALUES ('DS105', 40);
INSERT INTO `course_taken_by` VALUES ('DS103', 40);
INSERT INTO `course_taken_by` VALUES ('CS101', 40);
INSERT INTO `course_taken_by` VALUES ('DS102', 41);
INSERT INTO `course_taken_by` VALUES ('CS103', 41);
INSERT INTO `course_taken_by` VALUES ('CS105', 41);
INSERT INTO `course_taken_by` VALUES ('DS104', 42);
INSERT INTO `course_taken_by` VALUES ('DS100', 42);
INSERT INTO `course_taken_by` VALUES ('CS102', 42);
INSERT INTO `course_taken_by` VALUES ('DS105', 43);
INSERT INTO `course_taken_by` VALUES ('CS101', 43);
INSERT INTO `course_taken_by` VALUES ('CS104', 43);
INSERT INTO `course_taken_by` VALUES ('DS103', 44);
INSERT INTO `course_taken_by` VALUES ('CS105', 44);
INSERT INTO `course_taken_by` VALUES ('DS102', 44);
INSERT INTO `course_taken_by` VALUES ('CS101', 45);
INSERT INTO `course_taken_by` VALUES ('CS103', 45);
INSERT INTO `course_taken_by` VALUES ('DS104', 45);
INSERT INTO `course_taken_by` VALUES ('CS102', 46);
INSERT INTO `course_taken_by` VALUES ('DS105', 46);
INSERT INTO `course_taken_by` VALUES ('DS100', 46);
INSERT INTO `course_taken_by` VALUES ('DS103', 47);
INSERT INTO `course_taken_by` VALUES ('CS104', 47);
INSERT INTO `course_taken_by` VALUES ('CS105', 47);
INSERT INTO `course_taken_by` VALUES ('CS101', 48);
INSERT INTO `course_taken_by` VALUES ('DS102', 48);
INSERT INTO `course_taken_by` VALUES ('DS104', 48);
INSERT INTO `course_taken_by` VALUES ('CS103', 49);
INSERT INTO `course_taken_by` VALUES ('DS105', 49);
INSERT INTO `course_taken_by` VALUES ('CS102', 49);
INSERT INTO `course_taken_by` VALUES ('DS100', 50);
INSERT INTO `course_taken_by` VALUES ('CS104', 50);
INSERT INTO `course_taken_by` VALUES ('CS105', 50);
-- student-1 DONE

DROP DATABASE IF EXISTS `student-2`;
CREATE DATABASE `student-2`; 
USE `student-2`;

SET NAMES utf8 ;
SET character_set_client = utf8mb4 ;

DROP TABLE IF EXISTS `students`;
DROP TABLE IF EXISTS `course_taken_by`;
DROP TABLE IF EXISTS `student_to_department`;


CREATE TABLE `students` (
  `student_id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `email` varchar(50),
  `department_id` int NOT NULL,
  `gpa` decimal(3,2),
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `course_taken_by` (
  `course_id` varchar(50),
  `student_id` int,
  PRIMARY KEY (`course_id`, `student_id`),
  FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;




INSERT INTO `students` VALUES (51,'William Miller','male', 'williammiller57@university.edu', 3, 3.54);
INSERT INTO `students` VALUES (52,'Karen Jackson','female', 'karenjackson100@university.edu', 2, 3.94);
INSERT INTO `students` VALUES (53,'James Rodriguez','male', 'jamesrodriguez87@university.edu', 2, 2.27);
INSERT INTO `students` VALUES (54,'William Jackson','female', 'williamjackson90@university.edu', 2, 3.91);
INSERT INTO `students` VALUES (55,'Jessica Jackson','female', 'jessicajackson78@university.edu', 2, 2.25);
INSERT INTO `students` VALUES (56,'Robert Williams','male', 'robertwilliams78@university.edu', 2, 3.19);
INSERT INTO `students` VALUES (57,'Karen Lopez','female', 'karenlopez63@university.edu', 2, 2.86);
INSERT INTO `students` VALUES (58,'Patricia Taylor','female', 'patriciataylor65@university.edu', 2, 2.99);
INSERT INTO `students` VALUES (59,'Mary Moore','male', 'marymoore73@university.edu', 3, 2.34);
INSERT INTO `students` VALUES (60,'David Davis','male', 'daviddavis81@university.edu', 2, 3.47);
INSERT INTO `students` VALUES (61,'Elizabeth Martin','male', 'elizabethmartin74@university.edu', 2, 3.45);
INSERT INTO `students` VALUES (62,'Sarah Jackson','male', 'sarahjackson77@university.edu', 3, 3.55);
INSERT INTO `students` VALUES (63,'Robert Jackson','male', 'robertjackson52@university.edu', 2, 2.72);
INSERT INTO `students` VALUES (64,'Linda Johnson','male', 'lindajohnson68@university.edu', 3, 3.63);
INSERT INTO `students` VALUES (65,'Robert Anderson','female', 'robertanderson70@university.edu', 2, 3.08);
INSERT INTO `students` VALUES (66,'John Johnson','female', 'johnjohnson95@university.edu', 2, 3.25);
INSERT INTO `students` VALUES (67,'Jennifer Miller','female', 'jennifermiller64@university.edu', 2, 3.41);
INSERT INTO `students` VALUES (68,'Charles Gonzalez','female', 'charlesgonzalez67@university.edu', 2, 2.12);
INSERT INTO `students` VALUES (69,'Michael Brown','male', 'michaelbrown91@university.edu', 2, 2.65);
INSERT INTO `students` VALUES (70,'Richard Davis','female', 'richarddavis82@university.edu', 2, 3.02);
INSERT INTO `students` VALUES (71,'Susan Wilson','female', 'susanwilson85@university.edu', 2, 2.87);
INSERT INTO `students` VALUES (72,'James Smith','male', 'jamessmith72@university.edu', 2, 3.12);
INSERT INTO `students` VALUES (73,'Patricia Brown','female', 'patriciabrown83@university.edu', 2, 2.98);
INSERT INTO `students` VALUES (74,'Jessica Davis','female', 'jessicadavis96@university.edu', 2, 3.45);
INSERT INTO `students` VALUES (75,'Michael Johnson','male', 'michaeljohnson54@university.edu', 2, 3.6);
INSERT INTO `students` VALUES (76,'Linda Smith','female', 'lindasmith59@university.edu', 3, 2.35);
INSERT INTO `students` VALUES (77,'John Williams','male', 'johnwilliams71@university.edu', 2, 3.85);
INSERT INTO `students` VALUES (78,'Jennifer Brown','female', 'jenniferbrown69@university.edu', 2, 3.25);
INSERT INTO `students` VALUES (79,'Michael Davis','male', 'michaeldavis62@university.edu', 2, 2.95);
INSERT INTO `students` VALUES (80,'Elizabeth Wilson','female', 'elizabethwilson53@university.edu', 2, 2.65);
INSERT INTO `students` VALUES (81,'Mary Brown','female', 'marybrown74@university.edu', 2, 3.87);
INSERT INTO `students` VALUES (82,'John Jackson','male', 'johnjackson51@university.edu', 2, 2.23);
INSERT INTO `students` VALUES (83,'Michael Martin','male', 'michaelmartin88@university.edu', 2, 3.34);
INSERT INTO `students` VALUES (84,'Sarah Jones','male', 'sarahjones59@university.edu', 2, 2.93);
INSERT INTO `students` VALUES (85,'James Thomas','female', 'jamesthomas75@university.edu', 2, 3.7);
INSERT INTO `students` VALUES (86,'Linda Davis','female', 'lindadavis75@university.edu', 2, 2.19);
INSERT INTO `students` VALUES (87,'William Davis','male', 'williamdavis63@university.edu', 2, 2.04);
INSERT INTO `students` VALUES (88,'William Martinez','male', 'williammartinez63@university.edu', 2, 2.31);
INSERT INTO `students` VALUES (89,'Susan Smith','male', 'susansmith81@university.edu', 1, 2.35);
INSERT INTO `students` VALUES (90,'Jessica Anderson','male', 'jessicaanderson88@university.edu', 2, 3.01);
INSERT INTO `students` VALUES (91,'Susan Martinez','female', 'susanmartinez98@university.edu', 2, 2.76);
INSERT INTO `students` VALUES (92,'William Jackson','male', 'williamjackson59@university.edu', 2, 3.93);
INSERT INTO `students` VALUES (93,'Michael Smith','male', 'michaelsmith71@university.edu', 1, 2.48);
INSERT INTO `students` VALUES (94,'Elizabeth Hernandez','female', 'elizabethhernandez56@university.edu', 2, 3.93);
INSERT INTO `students` VALUES (95,'Thomas Brown','female', 'thomasbrown100@university.edu', 1, 2.51);
INSERT INTO `students` VALUES (96,'Robert Johnson','male', 'robertjohnson54@university.edu', 1, 3.77);
INSERT INTO `students` VALUES (97,'Michael Taylor','female', 'michaeltaylor73@university.edu', 1, 3.58);
INSERT INTO `students` VALUES (98,'Thomas Lopez','female', 'thomaslopez68@university.edu', 1, 3.33);
INSERT INTO `students` VALUES (99,'Robert Martin','female', 'robertmartin98@university.edu', 3, 3.36);
INSERT INTO `students` VALUES (100,'Linda Garcia','female', 'lindagarcia91@university.edu', 3, 2.14);

INSERT INTO `course_taken_by` VALUES ('ACCT101', 79);
INSERT INTO `course_taken_by` VALUES ('MGMT101', 79);
INSERT INTO `course_taken_by` VALUES ('MGMT101', 60);
INSERT INTO `course_taken_by` VALUES ('STAT101', 65);
INSERT INTO `course_taken_by` VALUES ('FIN200', 65);
-- student-2 DONE


DROP DATABASE IF EXISTS `university`;
CREATE DATABASE `university`; 
USE `university`;

SET NAMES utf8 ;
SET character_set_client = utf8mb4 ;

DROP TABLE IF EXISTS `professors`;
DROP TABLE IF EXISTS `courses`;
DROP TABLE IF EXISTS `departments`;


CREATE TABLE `professors` (
  `professor_id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `email` varchar(50),
  `department_id` int NOT NULL,
  `salary` decimal(10,2),
  PRIMARY KEY (`professor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `departments` (
  `department_id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `courses` (
  `course_id` varchar(50) NOT NULL,
  `prof_id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `department_id` int NOT NULL,
  `schedule_time` varchar(50) NOT NULL,
  `seat_available` int NOT NULL,
  `description` text,
  PRIMARY KEY (`course_id`),
  FOREIGN KEY (`prof_id`) REFERENCES `professors` (`professor_id`),
  FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `departments` VALUES (1,'viterbi');
INSERT INTO `departments` VALUES (2,'dornsife');
INSERT INTO `departments` VALUES (3,'marshall');

INSERT INTO `professors` VALUES (1,'James Brown','female', 'james.brown16@university.edu', 2, 86991.23);
INSERT INTO `professors` VALUES (2,'Michael Moore','female', 'michael.moore24@university.edu', 1, 108867.19);
INSERT INTO `professors` VALUES (3,'Barbara Davis','male', 'barbara.davis22@university.edu', 3, 72632.97);
INSERT INTO `professors` VALUES (4,'Jennifer Garcia','male', 'jennifer.garcia2@university.edu', 1, 130153.24);
INSERT INTO `professors` VALUES (5,'Joseph Wilson','male', 'joseph.wilson1@university.edu', 3, 74611.57);
INSERT INTO `professors` VALUES (6,'Elizabeth Thomas','female', 'elizabeth.thomas18@university.edu', 1, 67038.53);
INSERT INTO `professors` VALUES (7,'Elizabeth Miller','female', 'elizabeth.miller34@university.edu', 2, 84727.16);
INSERT INTO `professors` VALUES (8,'Elizabeth Wilson','female', 'elizabeth.wilson10@university.edu', 1, 105676.7);
INSERT INTO `professors` VALUES (9,'Sarah Hernandez','male', 'sarah.hernandez9@university.edu', 3, 65362.45);
INSERT INTO `professors` VALUES (10,'Robert Hernandez','female', 'robert.hernandez48@university.edu', 1, 139292.15);
INSERT INTO `professors` VALUES (11,'William Davis','female', 'william.davis10@university.edu', 1, 79531.83);
INSERT INTO `professors` VALUES (12,'Joseph Lopez','male', 'joseph.lopez44@university.edu', 3, 53595.61);
INSERT INTO `professors` VALUES (13,'Jessica Jackson','female', 'jessica.jackson41@university.edu', 1, 92655.58);
INSERT INTO `professors` VALUES (14,'Linda Jones','male', 'linda.jones42@university.edu', 2, 120841.07);
INSERT INTO `professors` VALUES (15,'Sarah Williams','male', 'sarah.williams31@university.edu', 2, 92871.98);
INSERT INTO `professors` VALUES (16,'Elizabeth Brown','female', 'elizabeth.brown29@university.edu', 2, 101813.6);
INSERT INTO `professors` VALUES (17,'Elizabeth Davis','female', 'elizabeth.davis16@university.edu', 2, 126486.84);
INSERT INTO `professors` VALUES (18,'Sarah Miller','male', 'sarah.miller21@university.edu', 2, 98635.66);
INSERT INTO `professors` VALUES (19,'Linda Martinez','female', 'linda.martinez30@university.edu', 2, 54279.54);
INSERT INTO `professors` VALUES (20,'James Davis','female', 'james.davis18@university.edu', 2, 65676.23);
INSERT INTO `professors` VALUES (21,'Charles Wilson','female', 'charles.wilson28@university.edu', 2, 83459.88);
INSERT INTO `professors` VALUES (22,'James Thomas','male', 'james.thomas26@university.edu', 2, 78900.05);
INSERT INTO `professors` VALUES (23,'Jennifer Miller','female', 'jennifer.miller27@university.edu', 2, 93622.21);
INSERT INTO `professors` VALUES (24,'Jessica Lopez','female', 'jessica.lopez21@university.edu', 2, 104534.88);
INSERT INTO `professors` VALUES (25,'Jennifer Garcia','male', 'jennifer.garcia26@university.edu', 2, 93770.82);
INSERT INTO `professors` VALUES (26,'Charles Gonzalez','male', 'charles.gonzalez23@university.edu', 2, 126314.32);
INSERT INTO `professors` VALUES (27,'William Jackson','female', 'william.jackson28@university.edu', 2, 80768.13);
INSERT INTO `professors` VALUES (28,'William Miller','male', 'william.miller27@university.edu', 2, 134269.98);
INSERT INTO `professors` VALUES (29,'William Williams','female', 'william.williams26@university.edu', 2, 119899.89);
INSERT INTO `professors` VALUES (30,'Richard Jones','male', 'richard.jones21@university.edu', 2, 69596.02);
INSERT INTO `professors` VALUES (31,'Thomas Williams','female', 'thomas.williams32@university.edu', 3, 145041.03);
INSERT INTO `professors` VALUES (32,'James Davis','female', 'james.davis41@university.edu', 3, 138876.33);
INSERT INTO `professors` VALUES (33,'Joseph Miller','female', 'joseph.miller42@university.edu', 3, 143634.39);
INSERT INTO `professors` VALUES (34,'Thomas Rodriguez','male', 'thomas.rodriguez38@university.edu', 3, 129806.67);
INSERT INTO `professors` VALUES (35,'Richard Garcia','male', 'richard.garcia45@university.edu', 3, 135721.27);
INSERT INTO `professors` VALUES (36,'Charles Williams','female', 'charles.williams40@university.edu', 3, 143248.8);
INSERT INTO `professors` VALUES (37,'Jessica Smith','male', 'jessica.smith42@university.edu', 3, 100998.73);
INSERT INTO `professors` VALUES (38,'Elizabeth Martin','female', 'elizabeth.martin36@university.edu', 3, 109670.17);
INSERT INTO `professors` VALUES (39,'Jennifer Martinez','male', 'jennifer.martinez36@university.edu', 3, 104541.23);
INSERT INTO `professors` VALUES (40,'Elizabeth Garcia','female', 'elizabeth.garcia43@university.edu', 3, 54847.24);
INSERT INTO `professors` VALUES (41,'Mary Anderson','male', 'mary.anderson31@university.edu', 3, 131672.31);
INSERT INTO `professors` VALUES (42,'Charles Davis','female', 'charles.davis45@university.edu', 3, 50869.24);
INSERT INTO `professors` VALUES (43,'William Lopez','female', 'william.lopez38@university.edu', 3, 147932.37);
INSERT INTO `professors` VALUES (44,'David Johnson','male', 'david.johnson31@university.edu', 3, 82641.16);
INSERT INTO `professors` VALUES (45,'Richard Miller','male', 'richard.miller43@university.edu', 3, 84696.61);

INSERT INTO `courses` VALUES ('DS100', 11, 'Privacy', 1, 'Tuesday 13:00', 11, 'Introduction to privacy');
INSERT INTO `courses` VALUES ('DS102', 5, 'Big Data', 3, 'Monday 16:00', 28, 'Introduction to big data');
INSERT INTO `courses` VALUES ('CS101', 12, 'Java', 2, 'Tuesday 11:00', 10, 'Introduction to java');
INSERT INTO `courses` VALUES ('CS102', 6, 'Python', 2, 'Wednesday 8:00', 30, 'Introduction to python');
INSERT INTO `courses` VALUES ('CS103', 13, 'C++', 3, 'Thursday 8:00', 26, 'Introduction to c++');
INSERT INTO `courses` VALUES ('DS103', 9, 'Data analysis', 1, 'Monday 14:00', 29, 'Introduction to data analysis');
INSERT INTO `courses` VALUES ('DS104', 3, 'Data security', 1, 'Thursday 17:00', 15, 'Introduction to data security');
INSERT INTO `courses` VALUES ('CS104', 2, 'AI', 1, 'Thursday 13:00', 26, 'Introduction to artificial intelligence');
INSERT INTO `courses` VALUES ('CS105', 14, 'ML', 2, 'Thursday 10:00', 20, 'Introduction to machine learning');
INSERT INTO `courses` VALUES ('DS105', 7, 'BA', 3, 'Monday 11:00', 25, 'Introduction to business analysis');
INSERT INTO `courses` VALUES ('ACCT101', 32, 'Accounting Basics', 3, 'Tuesday 10:00', 15, 'Introduction to basic accounting principles.');
INSERT INTO `courses` VALUES ('MKT100', 31, 'Marketing Fundamentals', 3, 'Wednesday 9:00', 10, 'Overview of fundamental marketing concepts.');
INSERT INTO `courses` VALUES ('FIN200', 38, 'Finance Essentials', 3, 'Friday 9:00', 16, 'Essentials of finance for beginners.');
INSERT INTO `courses` VALUES ('HRM150', 31, 'Human Resources Management', 3, 'Monday 11:00', 23, 'Introduction to HRM principles and practices.');
INSERT INTO `courses` VALUES ('MGMT101', 41, 'Principles of Management', 3, 'Wednesday 9:00', 13, 'Foundational management concepts and theories.');
INSERT INTO `courses` VALUES ('ECON150', 45, 'Macroeconomics', 3, 'Monday 11:00', 15, 'Introduction to macroeconomic principles.');
INSERT INTO `courses` VALUES ('STAT101', 38, 'Statistics for Business', 3, 'Friday 8:00', 27, 'Basic statistical concepts in a business context.');
INSERT INTO `courses` VALUES ('BUS101', 35, 'Business Law', 3, 'Monday 15:00', 14, 'Overview of legal concepts in business.');
INSERT INTO `courses` VALUES ('INTB200', 44, 'International Business', 3, 'Monday 15:00', 10, 'Fundamentals of business operations across borders.');
INSERT INTO `courses` VALUES ('ENTR100', 41, 'Entrepreneurship', 3, 'Thursday 16:00', 13, 'Exploring the basics of starting a business.');
INSERT INTO `courses` VALUES ('ENGL123', 25, 'Literature', 2, 'Friday 13:00', 28, 'Introduction to Literature');
INSERT INTO `courses` VALUES ('CHEM200', 27, 'Organic Chemistry', 2, 'Friday 18:00', 19, 'Introduction to Organic Chemistry');
INSERT INTO `courses` VALUES ('BIOL101', 26, 'Cell Biology', 2, 'Friday 8:00', 26, 'Introduction to Cell Biology');
INSERT INTO `courses` VALUES ('MATH150', 17, 'Calculus', 2, 'Wednesday 11:00', 30, 'Introduction to Calculus');
INSERT INTO `courses` VALUES ('PHYS101', 16, 'Mechanics', 2, 'Monday 11:00', 20, 'Introduction to Mechanics');
INSERT INTO `courses` VALUES ('HIST201', 17, 'World History', 2, 'Wednesday 18:00', 20, 'Introduction to World History');
INSERT INTO `courses` VALUES ('PSYC100', 27, 'Psychology', 2, 'Monday 16:00', 25, 'Introduction to Psychology');
INSERT INTO `courses` VALUES ('SOC101', 27, 'Sociology', 2, 'Tuesday 13:00', 29, 'Introduction to Sociology');
INSERT INTO `courses` VALUES ('ECON102', 17, 'Microeconomics', 2, 'Friday 10:00', 28, 'Introduction to Microeconomics');
INSERT INTO `courses` VALUES ('ART150', 18, 'Art History', 2, 'Thursday 18:00', 10, 'Introduction to Art History');


-- university DONE



