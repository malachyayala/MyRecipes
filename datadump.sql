-- MySQL dump 10.13  Distrib 8.0.25, for macos11.3 (x86_64)
--
-- Host: 127.0.0.1    Database: nu_recipes
-- ------------------------------------------------------
-- Server version	8.0.26

SET GLOBAL log_bin_trust_function_creators = 1;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `chef`
--

DROP TABLE IF EXISTS `chef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chef` (
  `chef_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(16) NOT NULL,
  `password` varchar(32) NOT NULL,
  `first_name` varchar(16) DEFAULT NULL,
  `last_name` varchar(16) DEFAULT NULL,
  `bio` varchar(256) DEFAULT NULL,
  `location` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`chef_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Dumping data for table `chef`
--

LOCK TABLES `chef` WRITE;
/*!40000 ALTER TABLE `chef` DISABLE KEYS */;
INSERT INTO `chef` VALUES (2,'vivekdivakarla','abcdef','Vivek','Divakarla','College Student who enjoys cooking','Boston, MA'),(3,'ryanpot','abcdefghi','Ryan','Potechin','College Student','Boston, MA'),(4,'malachyayala','aaaaa','Malachy','Ayala','College Student','Boston, MA'),(5,'allenlin','onetwothree','Allen','Lin','College Student','Boston, MA'),(6,'jamesharden','gonets','James','Harden','Professional Basketball Player','Brooklyn, NY'),(7,'DariusGarland','cleeeeveland','Darius','Garland','Professional Basketball Player','Cleveland, OH'),(8,'GordonRamsay','england','Gordon','Ramsey','Professional Chef','London, UK'),(9,'michaelsymon','lola','Michael','Symon','Chef','Cleveland, OH'),(10,'GuyFieri','flavortown','Guy','Fieri','Chef','Las Vegas, NV');
/*!40000 ALTER TABLE `chef` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gourmet_chef`
--

DROP TABLE IF EXISTS `gourmet_chef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gourmet_chef` (
  `gourmet_chef_id` int NOT NULL AUTO_INCREMENT,
  `chef_id` int NOT NULL,
  `restaurant_id` int DEFAULT NULL,
  `years_of_experience` int DEFAULT NULL,
  PRIMARY KEY (`gourmet_chef_id`),
  KEY `chef_id` (`chef_id`),
  KEY `restaurant_id` (`restaurant_id`),
  CONSTRAINT `gourmet_chef_ibfk_1` FOREIGN KEY (`chef_id`) REFERENCES `chef` (`chef_id`) ON DELETE CASCADE,
  CONSTRAINT `gourmet_chef_ibfk_2` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`restaurant_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gourmet_chef`
--

LOCK TABLES `gourmet_chef` WRITE;
/*!40000 ALTER TABLE `gourmet_chef` DISABLE KEYS */;
INSERT INTO `gourmet_chef` VALUES (1,9,3,2),(2,2,2,2),(3,5,3,21),(4,8,1,7),(5,7,6,8),(6,6,6,4),(7,2,5,10),(8,4,6,8),(9,1,7,9),(10,3,5,7);
/*!40000 ALTER TABLE `gourmet_chef` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredient`
--

DROP TABLE IF EXISTS `ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredient` (
  `ingredient_id` int NOT NULL AUTO_INCREMENT,
  `price` decimal(6,2) DEFAULT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`ingredient_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredient`
--

LOCK TABLES `ingredient` WRITE;
/*!40000 ALTER TABLE `ingredient` DISABLE KEYS */;
INSERT INTO `ingredient` VALUES (1,3.50,'flour'),(2,17.99,'parsley'),(3,2.00,'bananas'),(4,28.50,'garlic'),(5,3.33,'eggplant'),(6,1.00,'eggs'),(7,0.76,'chocolate'),(8,35.00,'noodles'),(9,11.10,'mint'),(10,123.40,'sausage');
/*!40000 ALTER TABLE `ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `menu_id` int NOT NULL AUTO_INCREMENT,
  `chef_username` varchar(16) NOT NULL,
  `name` varchar(32) NOT NULL,
  `keyword` varchar(64) DEFAULT NULL,
  `visibility` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`menu_id`),
  KEY `chef_username` (`chef_username`),
  CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`chef_username`) REFERENCES `chef` (`username`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'vivekdivakarla','Viveks Indian recipes','FOOD',1),(2,'ryanpot','bagels','breakfast',1),(3,'jamesharden','chef hardens cooking','FOOD',0),(4,'GordonRamsay','Ramsays delicacies','gourmet food',1),(5,'michaelsymon','Symons dinners','Dinner',1),(6,'GuyFieri','Diners, Drive-ins and Dives','fast food',1),(7,'vivekdivakarla','Viveks Indian recipes, version 2','FOOD',1),(8,'vivekdivakarla','Viveks Indian recipes, secret','Dinner',0),(9,'DariusGarland','Food from the Land','FOOD',1),(10,'vivekdivakarla','Viveks Indian recipes, version 4','FOOD',1);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_has_recipe`
--

DROP TABLE IF EXISTS `menu_has_recipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_has_recipe` (
  `menu_recipe_id` int NOT NULL AUTO_INCREMENT,
  `recipe_id` int NOT NULL,
  `menu_id` int NOT NULL,
  PRIMARY KEY (`menu_recipe_id`),
  KEY `recipe_id` (`recipe_id`),
  KEY `menu_id` (`menu_id`),
  CONSTRAINT `menu_has_recipe_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`recipe_id`) ON DELETE CASCADE,
  CONSTRAINT `menu_has_recipe_ibfk_2` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`menu_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_has_recipe`
--

LOCK TABLES `menu_has_recipe` WRITE;
/*!40000 ALTER TABLE `menu_has_recipe` DISABLE KEYS */;
INSERT INTO `menu_has_recipe` VALUES (1,2,4),(2,5,6),(3,2,7),(4,6,8),(5,3,9),(6,4,1),(7,6,7),(8,6,6),(9,8,6),(10,2,4);
/*!40000 ALTER TABLE `menu_has_recipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipe`
--

DROP TABLE IF EXISTS `recipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipe` (
  `recipe_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `author_id` int NOT NULL,
  `serving_size` int NOT NULL,
  `total_price` decimal(8,2) DEFAULT NULL,
  `time_to_cook` int DEFAULT NULL,
  `directions` varchar(2560) NOT NULL,
  `verified` tinyint(1) DEFAULT '0',
  `published_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `rating` decimal(2,1) DEFAULT NULL,
  `number_of_chefs_rated` int DEFAULT '0',
  `picture_url` varchar(256) DEFAULT NULL,
  `notes` varchar(256) DEFAULT NULL,
  `dietary_restrictions` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`recipe_id`),
  UNIQUE KEY `name` (`name`),
  KEY `author_id` (`author_id`),
  CONSTRAINT `recipe_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `chef` (`chef_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe`
--

LOCK TABLES `recipe` WRITE;
/*!40000 ALTER TABLE `recipe` DISABLE KEYS */;
INSERT INTO `recipe` VALUES (1,'Pumpkin Pie',3,5,14.99,75,'Preheat oven to 425 degrees F.',1,'2021-12-09 20:45:43',4.5,4,'google.com','notes','gluten free'),(2,'Garlic Butter Chicken',4,7,8.59,25,'Preheat oven to 425 degrees F.',0,'2021-12-09 20:45:43',3.7,14,'google.com','simple recipe','test'),(3,'Salmon',4,2,25.99,90,'Preheat oven to 425 degrees F.',1,'2021-12-09 20:45:43',5.0,27,'google.com','A complete meal on one pan full of flavour.','contains fish'),(4,'Biryani',1,5,25.99,90,'Preheat oven to 425 degrees F.',1,'2021-12-09 20:45:43',5.0,27,'google.com','A complete meal on one pan full of flavour.','contains fish'),(5,'Dal Makhani',6,2,3.49,15,'Microwave.',0,'2021-12-09 20:45:43',3.4,11,'google.com','Quick dinner meal.','contains lentils'),(6,'Pizza Dough',7,8,14.50,30,'Mix the dough ingredients together by hand.',1,'2021-12-09 20:45:43',2.2,11,'imgbb.com/pizza','A complete meal on one pan full of flavour.','contains flour'),(7,'Pesto Pasta',3,6,123.45,120,'Boil Water. Cook Pasta.',1,'2021-12-09 20:45:43',4.5,11,'https://www.allrecipes.com/recipe/11887/pesto-pasta/','Easy to make, but full of flavor.','contains pesto'),(8,'Mac and Cheese',1,5,99.00,90,'Start by boiling the water.',1,'2021-12-09 20:45:43',3.2,7,'google.com','rich, creamy meal.','contains dairy'),(9,'Quesadilla',8,2,111.10,123,'Cover a greased baking sheet with tortillas.',1,'2021-12-09 20:45:43',5.0,270,'abcdef.com','An upgrade over the plain quesadillas.','contains tortillas'),(10,'Hoisin Pork Chops',7,2,299.00,10,'Preheat oven to 425 degrees F.',1,'2021-12-09 20:45:43',5.0,27,'mcdonalds.com','Hoisin sauce is one of our go-to super-ingredients for easy dinners.','not for vegetarians');
/*!40000 ALTER TABLE `recipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipe_has_ingredient`
--

DROP TABLE IF EXISTS `recipe_has_ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipe_has_ingredient` (
  `recipe_ingredient_id` int NOT NULL AUTO_INCREMENT,
  `recipe_id` int NOT NULL,
  `ingredient_id` int NOT NULL,
  PRIMARY KEY (`recipe_ingredient_id`),
  KEY `recipe_id` (`recipe_id`),
  KEY `ingredient_id` (`ingredient_id`),
  CONSTRAINT `recipe_has_ingredient_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`recipe_id`) ON DELETE CASCADE,
  CONSTRAINT `recipe_has_ingredient_ibfk_2` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredient` (`ingredient_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe_has_ingredient`
--

LOCK TABLES `recipe_has_ingredient` WRITE;
/*!40000 ALTER TABLE `recipe_has_ingredient` DISABLE KEYS */;
INSERT INTO `recipe_has_ingredient` VALUES (1,2,4),(2,1,6),(3,3,7),(4,7,2),(5,2,1),(6,8,2),(7,1,7),(8,5,4),(9,4,9),(10,8,8);
/*!40000 ALTER TABLE `recipe_has_ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant`
--

DROP TABLE IF EXISTS `restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant` (
  `restaurant_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `location` varchar(64) NOT NULL,
  `years_in_business` int DEFAULT NULL,
  PRIMARY KEY (`restaurant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant`
--

LOCK TABLES `restaurant` WRITE;
/*!40000 ALTER TABLE `restaurant` DISABLE KEYS */;
INSERT INTO `restaurant` VALUES (1,'McDonalds','Boston, MA',15),(2,'Barrio Tacos','Cleveland, OH',4),(3,'Barrio Tacos','Cleveland, OH',4),(4,'Sarvana Bhavan','Hyderabad, India',4),(5,'Five Guys','New York, NY',24),(6,'Toro','Boston, MA',2),(7,'Lolita','Boston, MA',7),(8,'Blaze Pizza','Boston, MA',8),(9,'Cava','Boston, MA',77),(10,'Wahlburgers','Pittsburgh, PA',14);
/*!40000 ALTER TABLE `restaurant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `review_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `feedback` varchar(256) NOT NULL,
  PRIMARY KEY (`review_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1,'Review of Dal Makhani','Excellent Flavor, 5/5'),(2,'Review of Pesto Pasta','A bit undercooked, 3.4/5'),(3,'Review of Salmon','Cooked to Perfection, 4.7/5'),(4,'Review of Biryani','Missing a few ingredients, 2.4/5'),(5,'Review of Mac and Cheese','Better than store bought, 4/5'),(6,'Review of Hoisin Pork Chops','Incredible, 4.99/5'),(7,'Review of Quesadilla','Felt like I was just at home, 4.65/5'),(8,'Review of Pizza Dough','Well written recipe, easy to follow. 4.1/5'),(9,'Review of Pumpkin Pie','Thanksgiving classic done well, 3.9/5'),(10,'Review of Chicken','Bland, 1/5');
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_recipe`
--

DROP TABLE IF EXISTS `review_recipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_recipe` (
  `review_recipe_id` int NOT NULL AUTO_INCREMENT,
  `chef_id` int NOT NULL,
  `recipe_id` int NOT NULL,
  `review_id` int NOT NULL,
  PRIMARY KEY (`review_recipe_id`),
  UNIQUE KEY `review_id` (`review_id`),
  KEY `chef_id` (`chef_id`),
  KEY `recipe_id` (`recipe_id`),
  CONSTRAINT `review_recipe_ibfk_1` FOREIGN KEY (`chef_id`) REFERENCES `chef` (`chef_id`) ON DELETE CASCADE,
  CONSTRAINT `review_recipe_ibfk_2` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`recipe_id`) ON DELETE CASCADE,
  CONSTRAINT `review_recipe_ibfk_3` FOREIGN KEY (`review_id`) REFERENCES `review` (`review_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_recipe`
--

LOCK TABLES `review_recipe` WRITE;
/*!40000 ALTER TABLE `review_recipe` DISABLE KEYS */;
INSERT INTO `review_recipe` VALUES (1,6,5,1),(2,3,7,2),(3,4,3,3),(4,1,4,4),(5,1,8,5),(6,7,10,6),(7,8,9,7),(8,7,6,8),(9,3,1,9),(10,4,2,10);
/*!40000 ALTER TABLE `review_recipe` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-09 15:46:20

/*
 Functions
 */
DELIMITER //
DROP FUNCTION IF EXISTS getPassword;
CREATE FUNCTION getPassword(uname VARCHAR(16))
  RETURNS VARCHAR(16)
BEGIN
  DECLARE op VARCHAR(16);

  SELECT password INTO op FROM chef WHERE uname = username;

  RETURN (op);
END //
DELIMITER ;

#SELECT getPassword('hello');

DELIMITER //
DROP FUNCTION IF EXISTS getChefID;
CREATE FUNCTION getChefID(uname VARCHAR(16))
  RETURNS INT
BEGIN
  DECLARE op INT;

  SELECT chef_id INTO op FROM chef WHERE username = uname;

  RETURN (op);
END //
DELIMITER ;

#SELECT getChefID('allenlin');

/*
 Procedures
 */
# Chef related
DELIMITER //
DROP PROCEDURE IF EXISTS newChef;
CREATE PROCEDURE newChef(uname VARCHAR(16), passw VARCHAR(16))
BEGIN
  INSERT INTO chef (username, password) VALUES (uname, passw);
END //
DELIMITER ;

#CALL newChef('hello', 'goodbye');

DELIMITER //
DROP PROCEDURE IF EXISTS getChefInfo;
CREATE PROCEDURE getChefInfo(uname VARCHAR(16))
BEGIN
  SELECT username, first_name, last_name, bio, location FROM chef WHERE username = uname;
END //
DELIMITER ;

#CALL getChefInfo('hello');

DELIMITER //
DROP PROCEDURE IF EXISTS updateChef;
CREATE PROCEDURE updateChef(uname VARCHAR(16), u_first_name VARCHAR(16), u_last_name VARCHAR(16), u_bio VARCHAR(256),
                            u_location VARCHAR(64))
BEGIN
  UPDATE chef
  SET first_name = IFNULL(u_first_name, first_name),
      last_name=IFNULL(u_last_name, last_name),
      bio=IFNULL(u_bio, bio),
      location=IFNULL(u_location, location)
  WHERE username = uname;
END //
DELIMITER ;


DELIMITER //
DROP PROCEDURE IF EXISTS removeChef;
CREATE PROCEDURE removeChef(u_name VARCHAR(16))
BEGIN
  DELETE FROM chef WHERE username = u_name;
END //
DELIMITER ;

#CALL removeChef('allenlin');

# Menu related
DELIMITER //
DROP PROCEDURE IF EXISTS newMenu;
CREATE PROCEDURE newMenu(u_name VARCHAR(16), m_name VARCHAR(32), m_keyword VARCHAR(64), m_visibility BOOL)
BEGIN
  INSERT INTO menu(chef_username, name, keyword, visibility) VALUES (u_name, m_name, m_keyword, m_visibility);
END //
DELIMITER ;

#CALL newMenu('hello', 'italian cuisine', 'italian', TRUE);

DELIMITER //
DROP PROCEDURE IF EXISTS getMenu;
CREATE PROCEDURE getMenu(u_name VARCHAR(16))
BEGIN
  SELECT chef_username, name, keyword FROM menu WHERE chef_username = u_name;
END //
DELIMITER ;

#CALL getMenu('hello', 'italian cuisine');

DELIMITER //
DROP PROCEDURE IF EXISTS updateMenu;
CREATE PROCEDURE updateMenu(uname VARCHAR(16), m_name VARCHAR(32), m_keyword VARCHAR(64), m_visibility BOOL)
BEGIN

  UPDATE menu
  SET name      = IFNULL(m_name, name),
      keyword=IFNULL(m_keyword, keyword),
      visibility=IFNULL(m_visibility, visibility)
  WHERE chef_username = uname;
END //
DELIMITER ;

DELIMITER //
DROP PROCEDURE IF EXISTS removeMenu;
CREATE PROCEDURE removeMenu(u_name VARCHAR(16), m_name VARCHAR(32))
BEGIN
  DELETE FROM menu WHERE chef_username = u_name AND name = m_name;
END //
DELIMITER ;

#CALL removeMenu('hello', 'italian cuisine');

DROP PROCEDURE IF EXISTS resetTable;
DELIMITER //
CREATE PROCEDURE resetTable()
BEGIN
  DROP TABLE IF EXISTS `review_recipe`;
  DROP TABLE IF EXISTS `review`;
  DROP TABLE IF EXISTS `menu_has_recipe`;
  DROP TABLE IF EXISTS `recipe_has_ingredient`;
  DROP TABLE IF EXISTS `recipe`;
  DROP TABLE IF EXISTS `ingredient`;
  DROP TABLE IF EXISTS `menu`;
  DROP TABLE IF EXISTS `gourmet_chef`;
  DROP TABLE IF EXISTS `restaurant`;
  DROP TABLE IF EXISTS `chef`;
END//
DELIMITER ;

#CALL resetTable();

DELIMITER //
DROP PROCEDURE IF EXISTS myRecipesList;
CREATE PROCEDURE myRecipesList(usern VARCHAR(50))
BEGIN
  SELECT name,
         serving_size,
         total_price,
         time_to_cook,
         directions,
         verified,
         rating,
         number_of_chefs_rated,
         notes,
         dietary_restrictions
  FROM chef
         JOIN recipe ON author_id = chef_id
  WHERE username = usern;
END //
DELIMITER ;

#CALL myRecipesList('DariusGarland');

DELIMITER //
DROP PROCEDURE IF EXISTS newRecipe;
CREATE PROCEDURE newRecipe(u_name VARCHAR(16), r_name VARCHAR(64), r_serving_size INT, r_directions VARCHAR(2560))
BEGIN
  DECLARE op INT;
  SET op = getChefID(u_name);

  INSERT INTO recipe(name, author_id, serving_size, directions)
  VALUES (r_name, op, r_serving_size, r_directions);
END //
DELIMITER ;

#CALL newRecipe('allenlin', 'taiwanese street food', 3, 'add boba to milk tea');

DELIMITER //
DROP PROCEDURE IF EXISTS updateRecipe;
CREATE PROCEDURE updateRecipe(u_name VARCHAR(16), r_name VARCHAR(64), r_serving_size INT, r_total_price DECIMAL(8, 2),
                              r_time INT, r_directions VARCHAR(2560), r_verified BOOLEAN, r_rating DECIMAL(2, 1),
                              r_no_chefs_rated INT,
                              r_picture_url VARCHAR(256), r_notes VARCHAR(256), r_restrictions VARCHAR(256))
BEGIN
  DECLARE op INT;
  SET op = getChefID(u_name);

  UPDATE recipe
  SET serving_size          = IFNULL(r_serving_size, serving_size),
      total_price           = IFNULL(r_total_price, total_price),
      time_to_cook          = IFNULL(r_time, time_to_cook),
      directions            = IFNULL(r_directions, directions),
      verified              = IFNULL(r_verified, verified),
      rating                = IFNULL(r_rating, rating),
      number_of_chefs_rated = IFNULL(r_no_chefs_rated, number_of_chefs_rated),
      picture_url           = IFNULL(r_picture_url, picture_url),
      notes                 = IFNULL(r_notes, notes),
      dietary_restrictions  = IFNULL(r_restrictions, dietary_restrictions)
  WHERE author_id = op
    AND NAME = r_name;
END //
DELIMITER ;

/*
CALL updateRecipe('allenlin', 'taiwanese street food', 4, 3.67, 3, NULL, NULL, NULL, NULL, NULL, 'soak the boba with
brown sugar syrup', NULL);
 */

DELIMITER //
DROP PROCEDURE IF EXISTS gourmetChefList;
CREATE PROCEDURE gourmetChefList()
BEGIN
  SELECT c.first_name,
         c.last_name,
         c.bio,
         c.location,
         g.years_of_experience,
         r.name,
         r.years_in_business,
         r.location
  FROM chef c
         LEFT JOIN gourmet_chef g ON c.chef_id = g.chef_id
         INNER JOIN restaurant r ON g.restaurant_id = r.restaurant_id;
END //
DELIMITER ;

#CALL gourmetChefList();
