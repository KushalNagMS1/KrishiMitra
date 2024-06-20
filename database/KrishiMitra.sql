CREATE DATABASE  IF NOT EXISTS `krishimitra` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `krishimitra`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: krishimitra
-- ------------------------------------------------------
-- Server version	8.0.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `_admin_`
--

DROP TABLE IF EXISTS `_admin_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_admin_` (
  `admminname` varchar(100) DEFAULT NULL,
  `adminpassword` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_admin_`
--

LOCK TABLES `_admin_` WRITE;
/*!40000 ALTER TABLE `_admin_` DISABLE KEYS */;
INSERT INTO `_admin_` VALUES ('admin','admin');
/*!40000 ALTER TABLE `_admin_` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crop`
--

DROP TABLE IF EXISTS `crop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crop` (
  `crop_name` varchar(255) NOT NULL,
  `yeild_type` varchar(255) DEFAULT NULL,
  `sowing_month` varchar(255) DEFAULT NULL,
  `soil_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`crop_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crop`
--

LOCK TABLES `crop` WRITE;
/*!40000 ALTER TABLE `crop` DISABLE KEYS */;
INSERT INTO `crop` VALUES ('ARECANUT','NUT','DECEMBER','BLACK SOIL'),('BAJRA','GRAIN','JULY','ALLUVIAL SOIL'),('BANANA','FRUIT','MAY','RED SOIL'),('BARLEY','GRAIN','DECEMBER','ALLUVIAL SOIL'),('BRINJAL','VEGETABLE','SEPTEMBER','BLACK SOIL'),('CASHEW NUTS','NUT','APRIL','LATERITE SOIL'),('CHICKPEA','PULSES','SEPTEMBER','ALLUVIAL SOIL'),('COTTON','FUBER','JUNE','BLACK SOIL'),('GREEN CHILLI','VEGETABLE','MAY','BLACK SOIL'),('GROUNDNUT','NUTS','FEBRUARY','ALLUVIAL SOIL'),('GUAVA','FRUIT','MARCH','BLACK SOIL'),('JOWAR','GRAIN','AUGUST','ALLUVIAL SOIL'),('LINSEED','OILSEEDS','OCTOBER','BLACK SOIL'),('MAIZE','GRAIN','MAY','ALLUVIAL SOIL'),('MANGO','FRUIT','AUGUST','RED SOIL'),('MUSTARD','OLSEEDS','JANUARY','ALLUVIAL SOIL'),('PEAS','PULSES','OCTOBER','ALLUVIAL SOIL'),('PINEAPPLE','FRUIT','SEPTEMBER','LATERITE SOIL'),('POTATOES','TUBER','OCTOBER','RED SOIL'),('RICE','GRAIN','JUNE','ALLUVIAL SOIL'),('RUBBER','LATEX','JULY','LATERITE SOIL'),('SAPOTA','FRUIT','JULY','BLACK SOIL'),('SOYABEAN','OILSEEDS','MARCH','ALLUVIAL SOIL'),('SUGARCANE','SUGAR (JUICE EXTRACTION)','APRIL','ALLUVIAL SOIL'),('TOBACCO','LEAVES','JULY','RED SOIL'),('TOMATO','FRUIT/VEGETABE','JANUARY','BLACK SOIL'),('WHEAT','GRAIN','NOVEMBER','ALLUVIAL SOIL');
/*!40000 ALTER TABLE `crop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `crop_all_month`
--

DROP TABLE IF EXISTS `crop_all_month`;
/*!50001 DROP VIEW IF EXISTS `crop_all_month`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `crop_all_month` AS SELECT 
 1 AS `sowing_month`,
 1 AS `soil_type`,
 1 AS `crop_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `crop_diseases`
--

DROP TABLE IF EXISTS `crop_diseases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crop_diseases` (
  `crop_name` varchar(255) DEFAULT NULL,
  `diseases` varchar(255) NOT NULL,
  PRIMARY KEY (`diseases`),
  KEY `crop_name` (`crop_name`),
  CONSTRAINT `crop_diseases_ibfk_1` FOREIGN KEY (`crop_name`) REFERENCES `crop` (`crop_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crop_diseases`
--

LOCK TABLES `crop_diseases` WRITE;
/*!40000 ALTER TABLE `crop_diseases` DISABLE KEYS */;
INSERT INTO `crop_diseases` VALUES ('Arecanut','Bud Rot'),('Bajra','Downy Mildew'),('Banana','Panama Disease (Fusarium Wilt)'),('Barley','Net Blotch'),('Brinjal','Verticillium Wilt'),('Cashew nuts','Cashew Leaf and Nut Blight'),('Chickpea','Ascochyta Blight'),('Cotton','Cotton Wilt'),('Green Chilli','Bacterial Leaf Spot'),('Groundnut','Leaf Spot'),('Guava','Guava Wilt'),('Jowar','Head Smut'),('Linseed','Melampsora Lini'),('Maize','Corn Smut'),('Mango','Anthracnose'),('Mustard','Alternaria Blight'),('Peas','Powdery Mildew'),('Pineapple','Pineapple Wilt Disease'),('Potatoes','Late Blight'),('Rice','Blast Disease'),('Rubber','South American Leaf Blight (SALB)'),('Sapota','Sooty Mould'),('Soyabean','Soybean Rust'),('Sugarcane','Red Rot'),('Tobacco','Black Shank'),('Tomato','Tomato Leaf Curl Virus (ToLCV)'),('Wheat','Rust diseases (e.g., Stem rust, Leaf rust, Stripe rust)');
/*!40000 ALTER TABLE `crop_diseases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crop_economics`
--

DROP TABLE IF EXISTS `crop_economics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crop_economics` (
  `crop_name` varchar(255) NOT NULL,
  `yield_per_unit_area` varchar(255) DEFAULT NULL,
  `cultivation_cost_per_unit_area` varchar(255) DEFAULT NULL,
  `avg_market_value_per_unit_area` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`crop_name`),
  CONSTRAINT `crop_economics_ibfk_1` FOREIGN KEY (`crop_name`) REFERENCES `crop` (`crop_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crop_economics`
--

LOCK TABLES `crop_economics` WRITE;
/*!40000 ALTER TABLE `crop_economics` DISABLE KEYS */;
INSERT INTO `crop_economics` VALUES ('ARECANUT',' 1,000-1,200 kg per acre',' ₹40,000-50,000 per acre','₹200-300 per kg'),('BAJRA',' 15-20 quintals per acre',' ₹12,000-15,000 per acre','₹1,000-1,500 per quintal'),('BANANA','20-25 tons per acre',' ₹40,000-50,000 per acre','₹20-30 per dozen (approximately)'),('BARLEY','25-30 quintals per acre',' ₹12,000-18,000 per acre',' ₹1,600-2,200 per quintal'),('BRINJAL','15-20 tons per acre',' ₹25,000-30,000 per acre','₹15-25 per kg'),('CASHEW NUTS','500-600 kg per acre',' ₹30,000-40,000 per acre','₹200-300 per kg'),('CHICKPEA','10-12 quintals per acre',' ₹15,000-20,000 per acre','₹4,000-5,000 per quintal'),('COTTON','8-12 quintals per acre',' ₹20,000-25,000 per acre','₹5,000-6,000 per quintal'),('GREEN CHILLI','8-10 tons per acre','  ₹20,000-25,000  per acre',' ₹20-30 per kg'),('GROUNDNUT','15-20 quintals per acre',' ₹20,000-25,000  per acre','₹4,000-5,000  per quintal'),('GUAVA','15-20 tons per acre',' ₹25,000-30,000 per acre','₹20-30 per kg'),('JOWAR','20-25 quintals per acre',' ₹15,000-20,000 per acre',' ₹1,200-1,800per quintal'),('LINSEED','5-8 quintals per acre',' ₹15,000-18,000 per acre','₹3,500-4,500 per quintal'),('MAIZE',' 25-30 quintals per acre',' ₹15,000-20,000 per acre','₹1,200-1,800  per quintal'),('MANGO','5-10 tons per acre',' ₹30,000-40,000 per acre','₹20-30 per kg'),('MUSTARD','10-12 quintals per acre',' ₹12,000-15,000 per acre','₹4,000-5,500per quintal'),('PEAS',' 20-25 quintals per acre','  ₹18,000-25,000 per acre',' ₹2,500-3,500 per quintal'),('PINEAPPLE','30-40 tons per acre',' ₹30,000-40,000 per acre','₹15-20 per kg'),('POTATOES','15-20 TONS per acre',' ₹20,000-25,000  per acre',' ₹10-15 per kg'),('RICE','25-30  quintals per acre',' ₹20,000-25,000per acre','₹1,800-2,500 per quintal'),('RUBBER','Varies, typically measured in latex production per tree','  ₹40,000-50,000 per acre (initial establishment cost)','Price varies based on latex production and market conditions'),('SAPOTA','5-8 tons per acre',' ₹30,000-40,000 per acre','₹40-60 per kg'),('SOYABEAN','8-10  quintals per acre',' ₹18,000-25,000 per acre','₹3,000-3,500 per quintal'),('SUGARCANE','70-80 tons per acr',' ₹25,000-30,000 per acre',' Price per ton can vary, as it is typically sold to sugar mills.'),('TOBACCO','800-1,000 kg per acre',' ₹25,000-30,000 per acre',' ₹100-150 per kg'),('TOMATO','15-20 tons per acre',' ₹25,000-30,000 per acre','₹15-25 per kg'),('WHEAT','30-35 quintals per acre',' ₹15,000-20,000 per acre','₹1,800-2,500 per quintal');
/*!40000 ALTER TABLE `crop_economics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crop_medicines`
--

DROP TABLE IF EXISTS `crop_medicines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crop_medicines` (
  `diseases` varchar(255) DEFAULT NULL,
  `medicine` varchar(255) NOT NULL,
  PRIMARY KEY (`medicine`),
  KEY `diseases` (`diseases`),
  CONSTRAINT `crop_medicines_ibfk_1` FOREIGN KEY (`diseases`) REFERENCES `crop_diseases` (`diseases`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crop_medicines`
--

LOCK TABLES `crop_medicines` WRITE;
/*!40000 ALTER TABLE `crop_medicines` DISABLE KEYS */;
INSERT INTO `crop_medicines` VALUES ('Alternaria Blight','Fungicides with azoxystrobin, mancozeb, or difenoconazole'),('Anthracnose','Fungicides with copper-based compounds, mancozeb, or azoxystrobin'),('Ascochyta Blight','Fungicides containing chlorothalonil or carbendazim'),('Bacterial Leaf Spot','Copper-based bactericides or antibiotics'),('Black Shank','Fungicides with metalaxyl or mefenoxam'),('Blast Disease','Fungicides like tricyclazole, azoxystrobin, or propiconazole'),('Bud Rot','Cultural practices, avoiding waterlogging, and removing infected palms; no specific fungicides'),('Cashew Leaf and Nut Blight','Fungicides with copper-based compounds or mancozeb'),('Corn Smut','No specific fungicides for smut, but cultural practices like crop rotation and resistant varieties may help'),('Cotton Wilt','No specific fungicides for Verticillium wilt; soil fumigation and resistant varieties may be used'),('Downy Mildew','Fungicides with metalaxyl or mancozeb'),('Guava Wilt','No specific fungicides; improving soil drainage and avoiding waterlogging may help'),('Head Smut','Seed treatment with fungicides like carboxin or thiram'),('Late Blight','Fungicides containing chlorothalonil, mancozeb, or metalaxyl'),('Leaf Spot','Fungicides with chlorothalonil or azoxystrobin'),('Melampsora Lini','Fungicides with azoxystrobin or tebuconazole'),('Net Blotch','Fungicides with active ingredients such as azoxystrobin, epoxiconazole, and prothioconazole'),('Panama Disease (Fusarium Wilt)','Resistant varieties, soil fumigation, and cultural practices; no specific fungicide'),('Pineapple Wilt Disease','No specific fungicides; resistant varieties and cultural practices may help'),('Powdery Mildew','Fungicides with sulfur, potassium bicarbonate, or neem oil'),('Red Rot','Application of systemic fungicides like propiconazole or hexaconazole'),('Rust diseases (e.g., Stem rust, Leaf rust, Stripe rust)','Fungicides with active ingredients like triazoles, strobilurins, and demethylation inhibitors (DMI)'),('Sooty Mould','Fungicides with copper-based compounds, mancozeb'),('South American Leaf Blight (SALB)','Cultural practices, regular surveillance, and disease-resistant clones; no specific fungicides'),('Soybean Rust','Fungicides with azoxystrobin, trifloxystrobin, or propiconazole'),('Tomato Leaf Curl Virus (ToLCV)','No specific fungicides for viral diseases; use resistant varieties and control whitefly vectors'),('Verticillium Wilt','Soil solarization, crop rotation, and resistant varieties; no specific fungicides');
/*!40000 ALTER TABLE `crop_medicines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crop_pesticides`
--

DROP TABLE IF EXISTS `crop_pesticides`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crop_pesticides` (
  `pests` varchar(255) DEFAULT NULL,
  `pesticides` varchar(255) NOT NULL,
  PRIMARY KEY (`pesticides`),
  KEY `pests` (`pests`),
  CONSTRAINT `crop_pesticides_ibfk_1` FOREIGN KEY (`pests`) REFERENCES `crop_pests` (`pests`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crop_pesticides`
--

LOCK TABLES `crop_pesticides` WRITE;
/*!40000 ALTER TABLE `crop_pesticides` DISABLE KEYS */;
INSERT INTO `crop_pesticides` VALUES ('Aphids (e.g., Rhopalosiphum padi)','Neonicotinoids_Barley, Pyrethroids_Barley'),('Banana Aphid (Pentalonia nigronervosa)','Imidacloprid_Banana, Thiamethoxam_Banana'),('Brown Planthopper (Nilaparvata lugens)','Imidacloprid_Rice, Buprofezin_Rice'),('Cashew Leaf Miner (Eteoryctis gemoniella)','Neem_Oil_Cashewnut, Lambda-Cyhalothrin_Cashewnut'),('Chili Thrips (Scirtothrips dorsalis)','Neonicotinoids_Green_Chilli, Spinosad_Green_Chilli'),('Colorado Potato Beetle (Leptinotarsa decemlineata)','Neonicotinoids_Potatoes, Spinosad_Potatoes'),('Cotton Bollworm (Helicoverpa armigera)','Bt_Cotton, Emamectin_Benzoate_Cotton'),('Early Shoot Borer (Chilo infuscatellus)','Chlorpyrifos_Sugarcane, Carbaryl_Sugarcane'),('Eggplant Fruit and Shoot Borer (Leucinodes orbonalis)','Emamectin_Benzoate_Brinjal, Spinosad_Brinjal'),('Fall Armyworm (Spodoptera frugiperda)','Chlorantraniliprole_Maize, Spinosad_Maize'),('Flax Gall Midge (Dasineura linogrisea)','Chlorpyrifos_Linseed, Neem_Oil_Linseed'),('Gram Pod Borer (Helicoverpa armigera)','Chlorantraniliprole_Chickpea, Indoxacarb_Chickpea'),('Groundnut Bud Necrosis Virus (Vector: Thrips)','Thiamethoxam_Groundnut'),('Guava Fruit Fly (Bactrocera correcta)','Spinosad_Guava, Malathion_Guava'),('Mango Hopper (Idioscopus clypealis)','Imidacloprid_Mango, Thiamethoxam_Mango'),('Mustard Aphid (Lipaphis erysimi)','Thiamethoxam_Mustard'),('Pea Aphid (Acyrthosiphon pisum)','Neonicotinoids_Peas, Pyrethroids_Peas'),('Pineapple Mealybug (Dysmicoccus brevipes)','Imidacloprid_Pineapple, Thiamethoxam_Pineapple'),('Red Palm Weevil (Rhynchophorus ferrugineus)','Chlorpyrifos_Arecanut, Imidacloprid_Arecanut'),('Rubber Plant Bug (Leptocoris tagalicus)','Lambda-Cyhalothrin_Rubber, Imidacloprid_Rubber'),('Sapota Stem Borer (Anarsia achrasella)','Carbaryl_Sapota, Chlorpyrifos_Sapota'),('Shoot Fly (Atherigona soccata)','Imidacloprid_Bajra, Fipronil_Bajra'),('Sorghum Shoot Fly (Atherigona varia)','Fipronil_Jowar'),('Soybean Aphid (Aphis glycines)','Imidacloprid_Soybean, Thiamethoxam_Soybean'),('Tobacco Aphid (Myzus persicae)','Imidacloprid_Tobacco'),('Tomato Fruit Borer (Helicoverpa armigera)','Emamectin_Benzoate_Tomato, Spinosad_Tomato'),('Wheat Aphid (Schizaphis graminum)','Imidacloprid_Wheat, Thiamethoxam_Wheat');
/*!40000 ALTER TABLE `crop_pesticides` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crop_pests`
--

DROP TABLE IF EXISTS `crop_pests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crop_pests` (
  `crop_name` varchar(255) DEFAULT NULL,
  `pests` varchar(255) NOT NULL,
  PRIMARY KEY (`pests`),
  KEY `crop_name` (`crop_name`),
  CONSTRAINT `crop_pests_ibfk_1` FOREIGN KEY (`crop_name`) REFERENCES `crop` (`crop_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crop_pests`
--

LOCK TABLES `crop_pests` WRITE;
/*!40000 ALTER TABLE `crop_pests` DISABLE KEYS */;
INSERT INTO `crop_pests` VALUES ('Arecanut','Red Palm Weevil (Rhynchophorus ferrugineus)'),('Bajra','Shoot Fly (Atherigona soccata)'),('Banana','Banana Aphid (Pentalonia nigronervosa)'),('Barley','Aphids (e.g., Rhopalosiphum padi)'),('Brinjal','Eggplant Fruit and Shoot Borer (Leucinodes orbonalis)'),('Cashew nuts','Cashew Leaf Miner (Eteoryctis gemoniella)'),('Chickpea','Gram Pod Borer (Helicoverpa armigera)'),('Cotton','Cotton Bollworm (Helicoverpa armigera)'),('Green Chilli','Chili Thrips (Scirtothrips dorsalis)'),('Groundnut','Groundnut Bud Necrosis Virus (Vector: Thrips)'),('Guava','Guava Fruit Fly (Bactrocera correcta)'),('Jowar','Sorghum Shoot Fly (Atherigona varia)'),('Linseed','Flax Gall Midge (Dasineura linogrisea)'),('Maize','Fall Armyworm (Spodoptera frugiperda)'),('Mango','Mango Hopper (Idioscopus clypealis)'),('Mustard','Mustard Aphid (Lipaphis erysimi)'),('Peas','Pea Aphid (Acyrthosiphon pisum)'),('Pineapple','Pineapple Mealybug (Dysmicoccus brevipes)'),('Potatoes','Colorado Potato Beetle (Leptinotarsa decemlineata)'),('Rice','Brown Planthopper (Nilaparvata lugens)'),('Rubber','Rubber Plant Bug (Leptocoris tagalicus)'),('Sapota','Sapota Stem Borer (Anarsia achrasella)'),('Soyabean','Soybean Aphid (Aphis glycines)'),('Sugarcane','Early Shoot Borer (Chilo infuscatellus)'),('Tobacco','Tobacco Aphid (Myzus persicae)'),('Tomato','Tomato Fruit Borer (Helicoverpa armigera)'),('Wheat','Wheat Aphid (Schizaphis graminum)');
/*!40000 ALTER TABLE `crop_pests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `crop_pests_pesticides`
--

DROP TABLE IF EXISTS `crop_pests_pesticides`;
/*!50001 DROP VIEW IF EXISTS `crop_pests_pesticides`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `crop_pests_pesticides` AS SELECT 
 1 AS `pests`,
 1 AS `crop_name`,
 1 AS `pesticides`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `crop_properties`
--

DROP TABLE IF EXISTS `crop_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crop_properties` (
  `crop_name` varchar(255) NOT NULL,
  `yield_type` varchar(255) DEFAULT NULL,
  `harvesting_month` varchar(255) DEFAULT NULL,
  `life_span` varchar(255) DEFAULT NULL,
  `water_requirement` varchar(255) DEFAULT NULL,
  `irrigation_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`crop_name`),
  CONSTRAINT `crop_properties_ibfk_1` FOREIGN KEY (`crop_name`) REFERENCES `crop` (`crop_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crop_properties`
--

LOCK TABLES `crop_properties` WRITE;
/*!40000 ALTER TABLE `crop_properties` DISABLE KEYS */;
INSERT INTO `crop_properties` VALUES ('Arecanut','Nut','Throughout the year','Several decades','High','Sprinkler Irrigation'),('Bajra','Grain','December','60-90 days','Low','Surface Irrigation'),('Banana','Fruit','Throughout the year','1-2 years','High','Flood Irrigation'),('Barley','Grain','May','90-100 days','Moderate','Drip Irrigation'),('Brinjal','Vegetable','Throughout the year','3-4 months','Moderate','Drip Irrigation'),('Cashew nuts','Nut','May','2-3 months','Moderate','Surface Irrigation'),('Chickpea','Pulse','June','90-120 days','Moderate','Drip Irrigation'),('Cotton','Fiber','January','5-6 months','Moderate','Drip Irrigation'),('Green Chilli','Vegetable','Throughout the year','3-4 months','Moderate','Flood Irrigation'),('Groundnut','Oilseed','May','90-120 days','Moderate','Sprinkler Irrigation'),('Guava','Fruit','Throughout the year','Several decades','Moderate','Drip Irrigation'),('Jowar','Grain','December','90-120 days','Low','Drip Irrigation'),('Linseed','Oilseed','April','90-120 days','Moderate','Sprinkler Irrigation'),('Maize','Grain','November','90-120 days','High','Drip Irrigation'),('Mango','Fruit','August','Several decades','Moderate','Sprinkler Irrigation'),('Mustard','Oilseed','April','120-140 days','Moderate','Sprinkler Irrigation'),('Peas','Pulse','June','70-90 days','Moderate','Surface Irrigation'),('Pineapple','Fruit','Throughout the year','2-3 years','Moderate','Drip Irrigation'),('Potatoes','Tuber','May','90-120 days','Moderate','Drip Irrigation'),('Rice','Grain','November','120-150 days','High','Flood Irrigation'),('Rubber','Latex','Throughout the year','25-30 years','Moderate','Flood Irrigation'),('Sapota','Fruit','June','Several decades','Moderate','Surface Irrigation'),('Soyabean','Oilseed','November','90-120 days','Moderate','Surface Irrigation'),('Sugarcane','Cash Crop','March','10-24 months','High','Flood Irrigation'),('Tobacco','Cash Crop','February','4-5 months','Moderate','Surface Irrigation'),('Tomato','Vegetable','Throughout the year','3-4 months','Moderate','Sprinkler Irrigation'),('Wheat','Grain','April','120-150 days','Moderate','Surface Irrigation');
/*!40000 ALTER TABLE `crop_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `month_crop`
--

DROP TABLE IF EXISTS `month_crop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `month_crop` (
  `yeild_type` varchar(255) DEFAULT NULL,
  `sowing_month` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `month_crop`
--

LOCK TABLES `month_crop` WRITE;
/*!40000 ALTER TABLE `month_crop` DISABLE KEYS */;
INSERT INTO `month_crop` VALUES ('GRAIN','NOVEMBER'),('FRUIT/VEGETABE','JANUARY'),('LEAVES','JULY'),('SUGAR (JUICE EXTRACTION)','APRIL'),('OILSEEDS','MARCH'),('FRUIT','JULY'),('LATEX','JULY'),('GRAIN','JUNE'),('TUBER','OCTOBER'),('FRUIT','SEPTEMBER'),('PULSES','OCTOBER'),('OLSEEDS','JANUARY'),('FRUIT','AUGUST'),('GRAIN','MAY'),('OILSEEDS','OCTOBER'),('GRAIN','AUGUST'),('FRUIT','MARCH'),('NUTS','FEBRUARY'),('VEGETABLE','MAY'),('FUBER','JUNE'),('PULSES','SEPTEMBER'),('NUT','APRIL'),('VEGETABLE','SEPTEMBER'),('GRAIN','DECEMBER'),('FRUIT','MAY'),('GRAIN','JULY'),('NUT','DECEMBER'),('GRAIN','NOVEMBER'),('FRUIT/VEGETABE','JANUARY'),('LEAVES','JULY'),('SUGAR (JUICE EXTRACTION)','APRIL'),('OILSEEDS','MARCH'),('FRUIT','JULY'),('LATEX','JULY'),('GRAIN','JUNE'),('TUBER','OCTOBER'),('FRUIT','SEPTEMBER'),('PULSES','OCTOBER'),('OLSEEDS','JANUARY'),('FRUIT','AUGUST'),('GRAIN','MAY'),('OILSEEDS','OCTOBER'),('GRAIN','AUGUST'),('FRUIT','MARCH'),('NUTS','FEBRUARY'),('VEGETABLE','MAY'),('FUBER','JUNE'),('PULSES','SEPTEMBER'),('NUT','APRIL'),('VEGETABLE','SEPTEMBER'),('GRAIN','DECEMBER'),('FRUIT','MAY'),('GRAIN','JULY'),('NUT','DECEMBER'),('GRAIN','NOVEMBER'),('FRUIT/VEGETABE','JANUARY'),('LEAVES','JULY'),('SUGAR (JUICE EXTRACTION)','APRIL'),('OILSEEDS','MARCH'),('FRUIT','JULY'),('LATEX','JULY'),('GRAIN','JUNE'),('TUBER','OCTOBER'),('FRUIT','SEPTEMBER'),('PULSES','OCTOBER'),('OLSEEDS','JANUARY'),('FRUIT','AUGUST'),('GRAIN','MAY'),('OILSEEDS','OCTOBER'),('GRAIN','AUGUST'),('FRUIT','MARCH'),('NUTS','FEBRUARY'),('VEGETABLE','MAY'),('FUBER','JUNE'),('PULSES','SEPTEMBER'),('NUT','APRIL'),('VEGETABLE','SEPTEMBER'),('GRAIN','DECEMBER'),('FRUIT','MAY'),('GRAIN','JULY'),('NUT','DECEMBER'),('GRAIN','NOVEMBER'),('FRUIT/VEGETABE','JANUARY'),('LEAVES','JULY'),('SUGAR (JUICE EXTRACTION)','APRIL'),('OILSEEDS','MARCH'),('FRUIT','JULY'),('LATEX','JULY'),('GRAIN','JUNE'),('TUBER','OCTOBER'),('FRUIT','SEPTEMBER'),('PULSES','OCTOBER'),('OLSEEDS','JANUARY'),('FRUIT','AUGUST'),('GRAIN','MAY'),('OILSEEDS','OCTOBER'),('GRAIN','AUGUST'),('FRUIT','MARCH'),('NUTS','FEBRUARY'),('VEGETABLE','MAY'),('FUBER','JUNE'),('PULSES','SEPTEMBER'),('NUT','APRIL'),('VEGETABLE','SEPTEMBER'),('GRAIN','DECEMBER'),('FRUIT','MAY'),('GRAIN','JULY'),('NUT','DECEMBER'),('GRAIN','NOVEMBER'),('FRUIT/VEGETABE','JANUARY'),('LEAVES','JULY'),('SUGAR (JUICE EXTRACTION)','APRIL'),('OILSEEDS','MARCH'),('FRUIT','JULY'),('LATEX','JULY'),('GRAIN','JUNE'),('TUBER','OCTOBER'),('FRUIT','SEPTEMBER'),('PULSES','OCTOBER'),('OLSEEDS','JANUARY'),('FRUIT','AUGUST'),('GRAIN','MAY'),('OILSEEDS','OCTOBER'),('GRAIN','AUGUST'),('FRUIT','MARCH'),('NUTS','FEBRUARY'),('VEGETABLE','MAY'),('FUBER','JUNE'),('PULSES','SEPTEMBER'),('NUT','APRIL'),('VEGETABLE','SEPTEMBER'),('GRAIN','DECEMBER'),('FRUIT','MAY'),('GRAIN','JULY'),('NUT','DECEMBER'),('GRAIN','NOVEMBER'),('FRUIT/VEGETABE','JANUARY'),('LEAVES','JULY'),('SUGAR (JUICE EXTRACTION)','APRIL'),('OILSEEDS','MARCH'),('FRUIT','JULY'),('LATEX','JULY'),('GRAIN','JUNE'),('TUBER','OCTOBER'),('FRUIT','SEPTEMBER'),('PULSES','OCTOBER'),('OLSEEDS','JANUARY'),('FRUIT','AUGUST'),('GRAIN','MAY'),('OILSEEDS','OCTOBER'),('GRAIN','AUGUST'),('FRUIT','MARCH'),('NUTS','FEBRUARY'),('VEGETABLE','MAY'),('FUBER','JUNE'),('PULSES','SEPTEMBER'),('NUT','APRIL'),('VEGETABLE','SEPTEMBER'),('GRAIN','DECEMBER'),('FRUIT','MAY'),('GRAIN','JULY'),('NUT','DECEMBER'),('GRAIN','NOVEMBER'),('FRUIT/VEGETABE','JANUARY'),('LEAVES','JULY'),('SUGAR (JUICE EXTRACTION)','APRIL'),('OILSEEDS','MARCH'),('FRUIT','JULY'),('LATEX','JULY'),('GRAIN','JUNE'),('TUBER','OCTOBER'),('FRUIT','SEPTEMBER'),('PULSES','OCTOBER'),('OLSEEDS','JANUARY'),('FRUIT','AUGUST'),('GRAIN','MAY'),('OILSEEDS','OCTOBER'),('GRAIN','AUGUST'),('FRUIT','MARCH'),('NUTS','FEBRUARY'),('VEGETABLE','MAY'),('FUBER','JUNE'),('PULSES','SEPTEMBER'),('NUT','APRIL'),('VEGETABLE','SEPTEMBER'),('GRAIN','DECEMBER'),('FRUIT','MAY'),('GRAIN','JULY'),('NUT','DECEMBER'),('GRAIN','NOVEMBER'),('FRUIT/VEGETABE','JANUARY'),('LEAVES','JULY'),('SUGAR (JUICE EXTRACTION)','APRIL'),('OILSEEDS','MARCH'),('FRUIT','JULY'),('LATEX','JULY'),('GRAIN','JUNE'),('TUBER','OCTOBER'),('FRUIT','SEPTEMBER'),('PULSES','OCTOBER'),('OLSEEDS','JANUARY'),('FRUIT','AUGUST'),('GRAIN','MAY'),('OILSEEDS','OCTOBER'),('GRAIN','AUGUST'),('FRUIT','MARCH'),('NUTS','FEBRUARY'),('VEGETABLE','MAY'),('FUBER','JUNE'),('PULSES','SEPTEMBER'),('NUT','APRIL'),('VEGETABLE','SEPTEMBER'),('GRAIN','DECEMBER'),('FRUIT','MAY'),('GRAIN','JULY'),('NUT','DECEMBER'),('GRAIN','NOVEMBER'),('FRUIT/VEGETABE','JANUARY'),('LEAVES','JULY'),('SUGAR (JUICE EXTRACTION)','APRIL'),('OILSEEDS','MARCH'),('FRUIT','JULY'),('LATEX','JULY'),('GRAIN','JUNE'),('TUBER','OCTOBER'),('FRUIT','SEPTEMBER'),('PULSES','OCTOBER'),('OLSEEDS','JANUARY'),('FRUIT','AUGUST'),('GRAIN','MAY'),('OILSEEDS','OCTOBER'),('GRAIN','AUGUST'),('FRUIT','MARCH'),('NUTS','FEBRUARY'),('VEGETABLE','MAY'),('FUBER','JUNE'),('PULSES','SEPTEMBER'),('NUT','APRIL'),('VEGETABLE','SEPTEMBER'),('GRAIN','DECEMBER'),('FRUIT','MAY'),('GRAIN','JULY'),('NUT','DECEMBER'),('GRAIN','NOVEMBER'),('FRUIT/VEGETABE','JANUARY'),('LEAVES','JULY'),('SUGAR (JUICE EXTRACTION)','APRIL'),('OILSEEDS','MARCH'),('FRUIT','JULY'),('LATEX','JULY'),('GRAIN','JUNE'),('TUBER','OCTOBER'),('FRUIT','SEPTEMBER'),('PULSES','OCTOBER'),('OLSEEDS','JANUARY'),('FRUIT','AUGUST'),('GRAIN','MAY'),('OILSEEDS','OCTOBER'),('GRAIN','AUGUST'),('FRUIT','MARCH'),('NUTS','FEBRUARY'),('VEGETABLE','MAY'),('FUBER','JUNE'),('PULSES','SEPTEMBER'),('NUT','APRIL'),('VEGETABLE','SEPTEMBER'),('GRAIN','DECEMBER'),('FRUIT','MAY'),('GRAIN','JULY'),('NUT','DECEMBER'),('GRAIN','NOVEMBER'),('FRUIT/VEGETABE','JANUARY'),('LEAVES','JULY'),('SUGAR (JUICE EXTRACTION)','APRIL'),('OILSEEDS','MARCH'),('FRUIT','JULY'),('LATEX','JULY'),('GRAIN','JUNE'),('TUBER','OCTOBER'),('FRUIT','SEPTEMBER'),('PULSES','OCTOBER'),('OLSEEDS','JANUARY'),('FRUIT','AUGUST'),('GRAIN','MAY'),('OILSEEDS','OCTOBER'),('GRAIN','AUGUST'),('FRUIT','MARCH'),('NUTS','FEBRUARY'),('VEGETABLE','MAY'),('FUBER','JUNE'),('PULSES','SEPTEMBER'),('NUT','APRIL'),('VEGETABLE','SEPTEMBER'),('GRAIN','DECEMBER'),('FRUIT','MAY'),('GRAIN','JULY'),('NUT','DECEMBER'),('GRAIN','NOVEMBER'),('FRUIT/VEGETABE','JANUARY'),('LEAVES','JULY'),('SUGAR (JUICE EXTRACTION)','APRIL'),('OILSEEDS','MARCH'),('FRUIT','JULY'),('LATEX','JULY'),('GRAIN','JUNE'),('TUBER','OCTOBER'),('FRUIT','SEPTEMBER'),('PULSES','OCTOBER'),('OLSEEDS','JANUARY'),('FRUIT','AUGUST'),('GRAIN','MAY'),('OILSEEDS','OCTOBER'),('GRAIN','AUGUST'),('FRUIT','MARCH'),('NUTS','FEBRUARY'),('VEGETABLE','MAY'),('FUBER','JUNE'),('PULSES','SEPTEMBER'),('NUT','APRIL'),('VEGETABLE','SEPTEMBER'),('GRAIN','DECEMBER'),('FRUIT','MAY'),('GRAIN','JULY'),('NUT','DECEMBER'),('GRAIN','NOVEMBER'),('FRUIT/VEGETABE','JANUARY'),('LEAVES','JULY'),('SUGAR (JUICE EXTRACTION)','APRIL'),('OILSEEDS','MARCH'),('FRUIT','JULY'),('LATEX','JULY'),('GRAIN','JUNE'),('TUBER','OCTOBER'),('FRUIT','SEPTEMBER'),('PULSES','OCTOBER'),('OLSEEDS','JANUARY'),('FRUIT','AUGUST'),('GRAIN','MAY'),('OILSEEDS','OCTOBER'),('GRAIN','AUGUST'),('FRUIT','MARCH'),('NUTS','FEBRUARY'),('VEGETABLE','MAY'),('FUBER','JUNE'),('PULSES','SEPTEMBER'),('NUT','APRIL'),('VEGETABLE','SEPTEMBER'),('GRAIN','DECEMBER'),('FRUIT','MAY'),('GRAIN','JULY'),('NUT','DECEMBER'),('GRAIN','NOVEMBER'),('FRUIT/VEGETABE','JANUARY'),('LEAVES','JULY'),('SUGAR (JUICE EXTRACTION)','APRIL'),('OILSEEDS','MARCH'),('FRUIT','JULY'),('LATEX','JULY'),('GRAIN','JUNE'),('TUBER','OCTOBER'),('FRUIT','SEPTEMBER'),('PULSES','OCTOBER'),('OLSEEDS','JANUARY'),('FRUIT','AUGUST'),('GRAIN','MAY'),('OILSEEDS','OCTOBER'),('GRAIN','AUGUST'),('FRUIT','MARCH'),('NUTS','FEBRUARY'),('VEGETABLE','MAY'),('FUBER','JUNE'),('PULSES','SEPTEMBER'),('NUT','APRIL'),('VEGETABLE','SEPTEMBER'),('GRAIN','DECEMBER'),('FRUIT','MAY'),('GRAIN','JULY'),('NUT','DECEMBER'),('GRAIN','NOVEMBER'),('FRUIT/VEGETABE','JANUARY'),('LEAVES','JULY'),('SUGAR (JUICE EXTRACTION)','APRIL'),('OILSEEDS','MARCH'),('FRUIT','JULY'),('LATEX','JULY'),('GRAIN','JUNE'),('TUBER','OCTOBER'),('FRUIT','SEPTEMBER'),('PULSES','OCTOBER'),('OLSEEDS','JANUARY'),('FRUIT','AUGUST'),('GRAIN','MAY'),('OILSEEDS','OCTOBER'),('GRAIN','AUGUST'),('FRUIT','MARCH'),('NUTS','FEBRUARY'),('VEGETABLE','MAY'),('FUBER','JUNE'),('PULSES','SEPTEMBER'),('NUT','APRIL'),('VEGETABLE','SEPTEMBER'),('GRAIN','DECEMBER'),('FRUIT','MAY'),('GRAIN','JULY'),('NUT','DECEMBER'),('GRAIN','NOVEMBER'),('FRUIT/VEGETABE','JANUARY'),('LEAVES','JULY'),('SUGAR (JUICE EXTRACTION)','APRIL'),('OILSEEDS','MARCH'),('FRUIT','JULY'),('LATEX','JULY'),('GRAIN','JUNE'),('TUBER','OCTOBER'),('FRUIT','SEPTEMBER'),('PULSES','OCTOBER'),('OLSEEDS','JANUARY'),('FRUIT','AUGUST'),('GRAIN','MAY'),('OILSEEDS','OCTOBER'),('GRAIN','AUGUST'),('FRUIT','MARCH'),('NUTS','FEBRUARY'),('VEGETABLE','MAY'),('FUBER','JUNE'),('PULSES','SEPTEMBER'),('NUT','APRIL'),('VEGETABLE','SEPTEMBER'),('GRAIN','DECEMBER'),('FRUIT','MAY'),('GRAIN','JULY'),('NUT','DECEMBER'),('GRAIN','NOVEMBER'),('FRUIT/VEGETABE','JANUARY'),('LEAVES','JULY'),('SUGAR (JUICE EXTRACTION)','APRIL'),('OILSEEDS','MARCH'),('FRUIT','JULY'),('LATEX','JULY'),('GRAIN','JUNE'),('TUBER','OCTOBER'),('FRUIT','SEPTEMBER'),('PULSES','OCTOBER'),('OLSEEDS','JANUARY'),('FRUIT','AUGUST'),('GRAIN','MAY'),('OILSEEDS','OCTOBER'),('GRAIN','AUGUST'),('FRUIT','MARCH'),('NUTS','FEBRUARY'),('VEGETABLE','MAY'),('FUBER','JUNE'),('PULSES','SEPTEMBER'),('NUT','APRIL'),('VEGETABLE','SEPTEMBER'),('GRAIN','DECEMBER'),('FRUIT','MAY'),('GRAIN','JULY'),('NUT','DECEMBER'),('GRAIN','NOVEMBER'),('FRUIT/VEGETABE','JANUARY'),('LEAVES','JULY'),('SUGAR (JUICE EXTRACTION)','APRIL'),('OILSEEDS','MARCH'),('FRUIT','JULY'),('LATEX','JULY'),('GRAIN','JUNE'),('TUBER','OCTOBER'),('FRUIT','SEPTEMBER'),('PULSES','OCTOBER'),('OLSEEDS','JANUARY'),('FRUIT','AUGUST'),('GRAIN','MAY'),('OILSEEDS','OCTOBER'),('GRAIN','AUGUST'),('FRUIT','MARCH'),('NUTS','FEBRUARY'),('VEGETABLE','MAY'),('FUBER','JUNE'),('PULSES','SEPTEMBER'),('NUT','APRIL'),('VEGETABLE','SEPTEMBER'),('GRAIN','DECEMBER'),('FRUIT','MAY'),('GRAIN','JULY'),('NUT','DECEMBER'),('GRAIN','NOVEMBER'),('FRUIT/VEGETABE','JANUARY'),('LEAVES','JULY'),('SUGAR (JUICE EXTRACTION)','APRIL'),('OILSEEDS','MARCH'),('FRUIT','JULY'),('LATEX','JULY'),('GRAIN','JUNE'),('TUBER','OCTOBER'),('FRUIT','SEPTEMBER'),('PULSES','OCTOBER'),('OLSEEDS','JANUARY'),('FRUIT','AUGUST'),('GRAIN','MAY'),('OILSEEDS','OCTOBER'),('GRAIN','AUGUST'),('FRUIT','MARCH'),('NUTS','FEBRUARY'),('VEGETABLE','MAY'),('FUBER','JUNE'),('PULSES','SEPTEMBER'),('NUT','APRIL'),('VEGETABLE','SEPTEMBER'),('GRAIN','DECEMBER'),('FRUIT','MAY'),('GRAIN','JULY'),('NUT','DECEMBER'),('GRAIN','NOVEMBER'),('FRUIT/VEGETABE','JANUARY'),('LEAVES','JULY'),('SUGAR (JUICE EXTRACTION)','APRIL'),('OILSEEDS','MARCH'),('FRUIT','JULY'),('LATEX','JULY'),('GRAIN','JUNE'),('TUBER','OCTOBER'),('FRUIT','SEPTEMBER'),('PULSES','OCTOBER'),('OLSEEDS','JANUARY'),('FRUIT','AUGUST'),('GRAIN','MAY'),('OILSEEDS','OCTOBER'),('GRAIN','AUGUST'),('FRUIT','MARCH'),('NUTS','FEBRUARY'),('VEGETABLE','MAY'),('FUBER','JUNE'),('PULSES','SEPTEMBER'),('NUT','APRIL'),('VEGETABLE','SEPTEMBER'),('GRAIN','DECEMBER'),('FRUIT','MAY'),('GRAIN','JULY'),('NUT','DECEMBER'),('GRAIN','NOVEMBER'),('FRUIT/VEGETABE','JANUARY'),('LEAVES','JULY'),('SUGAR (JUICE EXTRACTION)','APRIL'),('OILSEEDS','MARCH'),('FRUIT','JULY'),('LATEX','JULY'),('GRAIN','JUNE'),('TUBER','OCTOBER'),('FRUIT','SEPTEMBER'),('PULSES','OCTOBER'),('OLSEEDS','JANUARY'),('FRUIT','AUGUST'),('GRAIN','MAY'),('OILSEEDS','OCTOBER'),('GRAIN','AUGUST'),('FRUIT','MARCH'),('NUTS','FEBRUARY'),('VEGETABLE','MAY'),('FUBER','JUNE'),('PULSES','SEPTEMBER'),('NUT','APRIL'),('VEGETABLE','SEPTEMBER'),('GRAIN','DECEMBER'),('FRUIT','MAY'),('GRAIN','JULY'),('NUT','DECEMBER'),('GRAIN','NOVEMBER'),('FRUIT/VEGETABE','JANUARY'),('LEAVES','JULY'),('SUGAR (JUICE EXTRACTION)','APRIL'),('OILSEEDS','MARCH'),('FRUIT','JULY'),('LATEX','JULY'),('GRAIN','JUNE'),('TUBER','OCTOBER'),('FRUIT','SEPTEMBER'),('PULSES','OCTOBER'),('OLSEEDS','JANUARY'),('FRUIT','AUGUST'),('GRAIN','MAY'),('OILSEEDS','OCTOBER'),('GRAIN','AUGUST'),('FRUIT','MARCH'),('NUTS','FEBRUARY'),('VEGETABLE','MAY'),('FUBER','JUNE'),('PULSES','SEPTEMBER'),('NUT','APRIL'),('VEGETABLE','SEPTEMBER'),('GRAIN','DECEMBER'),('FRUIT','MAY'),('GRAIN','JULY'),('NUT','DECEMBER'),('GRAIN','NOVEMBER'),('FRUIT/VEGETABE','JANUARY'),('LEAVES','JULY'),('SUGAR (JUICE EXTRACTION)','APRIL'),('OILSEEDS','MARCH'),('FRUIT','JULY'),('LATEX','JULY'),('GRAIN','JUNE'),('TUBER','OCTOBER'),('FRUIT','SEPTEMBER'),('PULSES','OCTOBER'),('OLSEEDS','JANUARY'),('FRUIT','AUGUST'),('GRAIN','MAY'),('OILSEEDS','OCTOBER'),('GRAIN','AUGUST'),('FRUIT','MARCH'),('NUTS','FEBRUARY'),('VEGETABLE','MAY'),('FUBER','JUNE'),('PULSES','SEPTEMBER'),('NUT','APRIL'),('VEGETABLE','SEPTEMBER'),('GRAIN','DECEMBER'),('FRUIT','MAY'),('GRAIN','JULY'),('NUT','DECEMBER'),('GRAIN','NOVEMBER'),('FRUIT/VEGETABE','JANUARY'),('LEAVES','JULY'),('SUGAR (JUICE EXTRACTION)','APRIL'),('OILSEEDS','MARCH'),('FRUIT','JULY'),('LATEX','JULY'),('GRAIN','JUNE'),('TUBER','OCTOBER'),('FRUIT','SEPTEMBER'),('PULSES','OCTOBER'),('OLSEEDS','JANUARY'),('FRUIT','AUGUST'),('GRAIN','MAY'),('OILSEEDS','OCTOBER'),('GRAIN','AUGUST'),('FRUIT','MARCH'),('NUTS','FEBRUARY'),('VEGETABLE','MAY'),('FUBER','JUNE'),('PULSES','SEPTEMBER'),('NUT','APRIL'),('VEGETABLE','SEPTEMBER'),('GRAIN','DECEMBER'),('FRUIT','MAY'),('GRAIN','JULY'),('NUT','DECEMBER'),('GRAIN','NOVEMBER'),('FRUIT/VEGETABE','JANUARY'),('LEAVES','JULY'),('SUGAR (JUICE EXTRACTION)','APRIL'),('OILSEEDS','MARCH'),('FRUIT','JULY'),('LATEX','JULY'),('GRAIN','JUNE'),('TUBER','OCTOBER'),('FRUIT','SEPTEMBER'),('PULSES','OCTOBER'),('OLSEEDS','JANUARY'),('FRUIT','AUGUST'),('GRAIN','MAY'),('OILSEEDS','OCTOBER'),('GRAIN','AUGUST'),('FRUIT','MARCH'),('NUTS','FEBRUARY'),('VEGETABLE','MAY'),('FUBER','JUNE'),('PULSES','SEPTEMBER'),('NUT','APRIL'),('VEGETABLE','SEPTEMBER'),('GRAIN','DECEMBER'),('FRUIT','MAY'),('GRAIN','JULY'),('NUT','DECEMBER'),('GRAIN','NOVEMBER'),('FRUIT/VEGETABE','JANUARY'),('LEAVES','JULY'),('SUGAR (JUICE EXTRACTION)','APRIL'),('OILSEEDS','MARCH'),('FRUIT','JULY'),('LATEX','JULY'),('GRAIN','JUNE'),('TUBER','OCTOBER'),('FRUIT','SEPTEMBER'),('PULSES','OCTOBER'),('OLSEEDS','JANUARY'),('FRUIT','AUGUST'),('GRAIN','MAY'),('OILSEEDS','OCTOBER'),('GRAIN','AUGUST'),('FRUIT','MARCH'),('NUTS','FEBRUARY'),('VEGETABLE','MAY'),('FUBER','JUNE'),('PULSES','SEPTEMBER'),('NUT','APRIL'),('VEGETABLE','SEPTEMBER'),('GRAIN','DECEMBER'),('FRUIT','MAY'),('GRAIN','JULY'),('NUT','DECEMBER'),('GRAIN','NOVEMBER'),('FRUIT/VEGETABE','JANUARY'),('LEAVES','JULY'),('SUGAR (JUICE EXTRACTION)','APRIL'),('OILSEEDS','MARCH'),('FRUIT','JULY'),('LATEX','JULY'),('GRAIN','JUNE'),('TUBER','OCTOBER'),('FRUIT','SEPTEMBER'),('PULSES','OCTOBER'),('OLSEEDS','JANUARY'),('FRUIT','AUGUST'),('GRAIN','MAY'),('OILSEEDS','OCTOBER'),('GRAIN','AUGUST'),('FRUIT','MARCH'),('NUTS','FEBRUARY'),('VEGETABLE','MAY'),('FUBER','JUNE'),('PULSES','SEPTEMBER'),('NUT','APRIL'),('VEGETABLE','SEPTEMBER'),('GRAIN','DECEMBER'),('FRUIT','MAY'),('GRAIN','JULY'),('NUT','DECEMBER'),('GRAIN','NOVEMBER'),('FRUIT/VEGETABE','JANUARY'),('LEAVES','JULY'),('SUGAR (JUICE EXTRACTION)','APRIL'),('OILSEEDS','MARCH'),('FRUIT','JULY'),('LATEX','JULY'),('GRAIN','JUNE'),('TUBER','OCTOBER'),('FRUIT','SEPTEMBER'),('PULSES','OCTOBER'),('OLSEEDS','JANUARY'),('FRUIT','AUGUST'),('GRAIN','MAY'),('OILSEEDS','OCTOBER'),('GRAIN','AUGUST'),('FRUIT','MARCH'),('NUTS','FEBRUARY'),('VEGETABLE','MAY'),('FUBER','JUNE'),('PULSES','SEPTEMBER'),('NUT','APRIL'),('VEGETABLE','SEPTEMBER'),('GRAIN','DECEMBER'),('FRUIT','MAY'),('GRAIN','JULY'),('NUT','DECEMBER'),('GRAIN','NOVEMBER'),('FRUIT/VEGETABE','JANUARY'),('LEAVES','JULY'),('SUGAR (JUICE EXTRACTION)','APRIL'),('OILSEEDS','MARCH'),('FRUIT','JULY'),('LATEX','JULY'),('GRAIN','JUNE'),('TUBER','OCTOBER'),('FRUIT','SEPTEMBER'),('PULSES','OCTOBER'),('OLSEEDS','JANUARY'),('FRUIT','AUGUST'),('GRAIN','MAY'),('OILSEEDS','OCTOBER'),('GRAIN','AUGUST'),('FRUIT','MARCH'),('NUTS','FEBRUARY'),('VEGETABLE','MAY'),('FUBER','JUNE'),('PULSES','SEPTEMBER'),('NUT','APRIL'),('VEGETABLE','SEPTEMBER'),('GRAIN','DECEMBER'),('FRUIT','MAY'),('GRAIN','JULY'),('NUT','DECEMBER'),('GRAIN','NOVEMBER'),('FRUIT/VEGETABE','JANUARY'),('LEAVES','JULY'),('SUGAR (JUICE EXTRACTION)','APRIL'),('OILSEEDS','MARCH'),('FRUIT','JULY'),('LATEX','JULY'),('GRAIN','JUNE'),('TUBER','OCTOBER'),('FRUIT','SEPTEMBER'),('PULSES','OCTOBER'),('OLSEEDS','JANUARY'),('FRUIT','AUGUST'),('GRAIN','MAY'),('OILSEEDS','OCTOBER'),('GRAIN','AUGUST'),('FRUIT','MARCH'),('NUTS','FEBRUARY'),('VEGETABLE','MAY'),('FUBER','JUNE'),('PULSES','SEPTEMBER'),('NUT','APRIL'),('VEGETABLE','SEPTEMBER'),('GRAIN','DECEMBER'),('FRUIT','MAY'),('GRAIN','JULY'),('NUT','DECEMBER'),('GRAIN','NOVEMBER'),('FRUIT/VEGETABE','JANUARY'),('LEAVES','JULY'),('SUGAR (JUICE EXTRACTION)','APRIL'),('OILSEEDS','MARCH'),('FRUIT','JULY'),('LATEX','JULY'),('GRAIN','JUNE'),('TUBER','OCTOBER'),('FRUIT','SEPTEMBER'),('PULSES','OCTOBER'),('OLSEEDS','JANUARY'),('FRUIT','AUGUST'),('GRAIN','MAY'),('OILSEEDS','OCTOBER'),('GRAIN','AUGUST'),('FRUIT','MARCH'),('NUTS','FEBRUARY'),('VEGETABLE','MAY'),('FUBER','JUNE'),('PULSES','SEPTEMBER'),('NUT','APRIL'),('VEGETABLE','SEPTEMBER'),('GRAIN','DECEMBER'),('FRUIT','MAY'),('GRAIN','JULY'),('NUT','DECEMBER'),('GRAIN','NOVEMBER'),('FRUIT/VEGETABE','JANUARY'),('LEAVES','JULY'),('SUGAR (JUICE EXTRACTION)','APRIL'),('OILSEEDS','MARCH'),('FRUIT','JULY'),('LATEX','JULY'),('GRAIN','JUNE'),('TUBER','OCTOBER'),('FRUIT','SEPTEMBER'),('PULSES','OCTOBER'),('OLSEEDS','JANUARY'),('FRUIT','AUGUST'),('GRAIN','MAY'),('OILSEEDS','OCTOBER'),('GRAIN','AUGUST'),('FRUIT','MARCH'),('NUTS','FEBRUARY'),('VEGETABLE','MAY'),('FUBER','JUNE'),('PULSES','SEPTEMBER'),('NUT','APRIL'),('VEGETABLE','SEPTEMBER'),('GRAIN','DECEMBER'),('FRUIT','MAY'),('GRAIN','JULY'),('NUT','DECEMBER'),('GRAIN','NOVEMBER'),('FRUIT/VEGETABE','JANUARY'),('LEAVES','JULY'),('SUGAR (JUICE EXTRACTION)','APRIL'),('OILSEEDS','MARCH'),('FRUIT','JULY'),('LATEX','JULY'),('GRAIN','JUNE'),('TUBER','OCTOBER'),('FRUIT','SEPTEMBER'),('PULSES','OCTOBER'),('OLSEEDS','JANUARY'),('FRUIT','AUGUST'),('GRAIN','MAY'),('OILSEEDS','OCTOBER'),('GRAIN','AUGUST'),('FRUIT','MARCH'),('NUTS','FEBRUARY'),('VEGETABLE','MAY'),('FUBER','JUNE'),('PULSES','SEPTEMBER'),('NUT','APRIL'),('VEGETABLE','SEPTEMBER'),('GRAIN','DECEMBER'),('FRUIT','MAY'),('GRAIN','JULY'),('NUT','DECEMBER'),('GRAIN','NOVEMBER'),('FRUIT/VEGETABE','JANUARY'),('LEAVES','JULY'),('SUGAR (JUICE EXTRACTION)','APRIL'),('OILSEEDS','MARCH'),('FRUIT','JULY'),('LATEX','JULY'),('GRAIN','JUNE'),('TUBER','OCTOBER'),('FRUIT','SEPTEMBER'),('PULSES','OCTOBER'),('OLSEEDS','JANUARY'),('FRUIT','AUGUST'),('GRAIN','MAY'),('OILSEEDS','OCTOBER'),('GRAIN','AUGUST'),('FRUIT','MARCH'),('NUTS','FEBRUARY'),('VEGETABLE','MAY'),('FUBER','JUNE'),('PULSES','SEPTEMBER'),('NUT','APRIL'),('VEGETABLE','SEPTEMBER'),('GRAIN','DECEMBER'),('FRUIT','MAY'),('GRAIN','JULY'),('NUT','DECEMBER'),('GRAIN','NOVEMBER'),('FRUIT/VEGETABE','JANUARY'),('LEAVES','JULY'),('SUGAR (JUICE EXTRACTION)','APRIL'),('OILSEEDS','MARCH'),('FRUIT','JULY'),('LATEX','JULY'),('GRAIN','JUNE'),('TUBER','OCTOBER'),('FRUIT','SEPTEMBER'),('PULSES','OCTOBER'),('OLSEEDS','JANUARY'),('FRUIT','AUGUST'),('GRAIN','MAY'),('OILSEEDS','OCTOBER'),('GRAIN','AUGUST'),('FRUIT','MARCH'),('NUTS','FEBRUARY'),('VEGETABLE','MAY'),('FUBER','JUNE'),('PULSES','SEPTEMBER'),('NUT','APRIL'),('VEGETABLE','SEPTEMBER'),('GRAIN','DECEMBER'),('FRUIT','MAY'),('GRAIN','JULY'),('NUT','DECEMBER'),('GRAIN','NOVEMBER'),('FRUIT/VEGETABE','JANUARY'),('LEAVES','JULY'),('SUGAR (JUICE EXTRACTION)','APRIL'),('OILSEEDS','MARCH'),('FRUIT','JULY'),('LATEX','JULY'),('GRAIN','JUNE'),('TUBER','OCTOBER'),('FRUIT','SEPTEMBER'),('PULSES','OCTOBER'),('OLSEEDS','JANUARY'),('FRUIT','AUGUST'),('GRAIN','MAY'),('OILSEEDS','OCTOBER'),('GRAIN','AUGUST'),('FRUIT','MARCH'),('NUTS','FEBRUARY'),('VEGETABLE','MAY'),('FUBER','JUNE'),('PULSES','SEPTEMBER'),('NUT','APRIL'),('VEGETABLE','SEPTEMBER'),('GRAIN','DECEMBER'),('FRUIT','MAY'),('GRAIN','JULY'),('NUT','DECEMBER'),('GRAIN','NOVEMBER'),('FRUIT/VEGETABE','JANUARY'),('LEAVES','JULY'),('SUGAR (JUICE EXTRACTION)','APRIL'),('OILSEEDS','MARCH'),('FRUIT','JULY'),('LATEX','JULY'),('GRAIN','JUNE'),('TUBER','OCTOBER'),('FRUIT','SEPTEMBER'),('PULSES','OCTOBER'),('OLSEEDS','JANUARY'),('FRUIT','AUGUST'),('GRAIN','MAY'),('OILSEEDS','OCTOBER'),('GRAIN','AUGUST'),('FRUIT','MARCH'),('NUTS','FEBRUARY'),('VEGETABLE','MAY'),('FUBER','JUNE'),('PULSES','SEPTEMBER'),('NUT','APRIL'),('VEGETABLE','SEPTEMBER'),('GRAIN','DECEMBER'),('FRUIT','MAY'),('GRAIN','JULY'),('NUT','DECEMBER'),('GRAIN','NOVEMBER'),('FRUIT/VEGETABE','JANUARY'),('LEAVES','JULY'),('SUGAR (JUICE EXTRACTION)','APRIL'),('OILSEEDS','MARCH'),('FRUIT','JULY'),('LATEX','JULY'),('GRAIN','JUNE'),('TUBER','OCTOBER'),('FRUIT','SEPTEMBER'),('PULSES','OCTOBER'),('OLSEEDS','JANUARY'),('FRUIT','AUGUST'),('GRAIN','MAY'),('OILSEEDS','OCTOBER'),('GRAIN','AUGUST'),('FRUIT','MARCH'),('NUTS','FEBRUARY'),('VEGETABLE','MAY'),('FUBER','JUNE'),('PULSES','SEPTEMBER'),('NUT','APRIL'),('VEGETABLE','SEPTEMBER'),('GRAIN','DECEMBER'),('FRUIT','MAY'),('GRAIN','JULY'),('NUT','DECEMBER'),('GRAIN','NOVEMBER'),('FRUIT/VEGETABE','JANUARY'),('LEAVES','JULY'),('SUGAR (JUICE EXTRACTION)','APRIL'),('OILSEEDS','MARCH'),('FRUIT','JULY'),('LATEX','JULY'),('GRAIN','JUNE'),('TUBER','OCTOBER'),('FRUIT','SEPTEMBER'),('PULSES','OCTOBER'),('OLSEEDS','JANUARY'),('FRUIT','AUGUST'),('GRAIN','MAY'),('OILSEEDS','OCTOBER'),('GRAIN','AUGUST'),('FRUIT','MARCH'),('NUTS','FEBRUARY'),('VEGETABLE','MAY'),('FUBER','JUNE'),('PULSES','SEPTEMBER'),('NUT','APRIL'),('VEGETABLE','SEPTEMBER'),('GRAIN','DECEMBER'),('FRUIT','MAY'),('GRAIN','JULY'),('NUT','DECEMBER'),('GRAIN','NOVEMBER'),('FRUIT/VEGETABE','JANUARY'),('LEAVES','JULY'),('SUGAR (JUICE EXTRACTION)','APRIL'),('OILSEEDS','MARCH'),('FRUIT','JULY'),('LATEX','JULY'),('GRAIN','JUNE'),('TUBER','OCTOBER'),('FRUIT','SEPTEMBER'),('PULSES','OCTOBER'),('OLSEEDS','JANUARY'),('FRUIT','AUGUST'),('GRAIN','MAY'),('OILSEEDS','OCTOBER'),('GRAIN','AUGUST'),('FRUIT','MARCH'),('NUTS','FEBRUARY'),('VEGETABLE','MAY'),('FUBER','JUNE'),('PULSES','SEPTEMBER'),('NUT','APRIL'),('VEGETABLE','SEPTEMBER'),('GRAIN','DECEMBER'),('FRUIT','MAY'),('GRAIN','JULY'),('NUT','DECEMBER'),('GRAIN','NOVEMBER'),('FRUIT/VEGETABE','JANUARY'),('LEAVES','JULY'),('SUGAR (JUICE EXTRACTION)','APRIL'),('OILSEEDS','MARCH'),('FRUIT','JULY'),('LATEX','JULY'),('GRAIN','JUNE'),('TUBER','OCTOBER'),('FRUIT','SEPTEMBER'),('PULSES','OCTOBER'),('OLSEEDS','JANUARY'),('FRUIT','AUGUST'),('GRAIN','MAY'),('OILSEEDS','OCTOBER'),('GRAIN','AUGUST'),('FRUIT','MARCH'),('NUTS','FEBRUARY'),('VEGETABLE','MAY'),('FUBER','JUNE'),('PULSES','SEPTEMBER'),('NUT','APRIL'),('VEGETABLE','SEPTEMBER'),('GRAIN','DECEMBER'),('FRUIT','MAY'),('GRAIN','JULY'),('NUT','DECEMBER'),('GRAIN','NOVEMBER'),('FRUIT/VEGETABE','JANUARY'),('LEAVES','JULY'),('SUGAR (JUICE EXTRACTION)','APRIL'),('OILSEEDS','MARCH'),('FRUIT','JULY'),('LATEX','JULY'),('GRAIN','JUNE'),('TUBER','OCTOBER'),('FRUIT','SEPTEMBER'),('PULSES','OCTOBER'),('OLSEEDS','JANUARY'),('FRUIT','AUGUST'),('GRAIN','MAY'),('OILSEEDS','OCTOBER'),('GRAIN','AUGUST'),('FRUIT','MARCH'),('NUTS','FEBRUARY'),('VEGETABLE','MAY'),('FUBER','JUNE'),('PULSES','SEPTEMBER'),('NUT','APRIL'),('VEGETABLE','SEPTEMBER'),('GRAIN','DECEMBER'),('FRUIT','MAY'),('GRAIN','JULY'),('NUT','DECEMBER'),('GRAIN','NOVEMBER'),('FRUIT/VEGETABE','JANUARY'),('LEAVES','JULY'),('SUGAR (JUICE EXTRACTION)','APRIL'),('OILSEEDS','MARCH'),('FRUIT','JULY'),('LATEX','JULY'),('GRAIN','JUNE'),('TUBER','OCTOBER'),('FRUIT','SEPTEMBER'),('PULSES','OCTOBER'),('OLSEEDS','JANUARY'),('FRUIT','AUGUST'),('GRAIN','MAY'),('OILSEEDS','OCTOBER'),('GRAIN','AUGUST'),('FRUIT','MARCH'),('NUTS','FEBRUARY'),('VEGETABLE','MAY'),('FUBER','JUNE'),('PULSES','SEPTEMBER'),('NUT','APRIL'),('VEGETABLE','SEPTEMBER'),('GRAIN','DECEMBER'),('FRUIT','MAY'),('GRAIN','JULY'),('NUT','DECEMBER'),('GRAIN','NOVEMBER'),('FRUIT/VEGETABE','JANUARY'),('LEAVES','JULY'),('SUGAR (JUICE EXTRACTION)','APRIL'),('OILSEEDS','MARCH'),('FRUIT','JULY'),('LATEX','JULY'),('GRAIN','JUNE'),('TUBER','OCTOBER'),('FRUIT','SEPTEMBER'),('PULSES','OCTOBER'),('OLSEEDS','JANUARY'),('FRUIT','AUGUST'),('GRAIN','MAY'),('OILSEEDS','OCTOBER'),('GRAIN','AUGUST'),('FRUIT','MARCH'),('NUTS','FEBRUARY'),('VEGETABLE','MAY'),('FUBER','JUNE'),('PULSES','SEPTEMBER'),('NUT','APRIL'),('VEGETABLE','SEPTEMBER'),('GRAIN','DECEMBER'),('FRUIT','MAY'),('GRAIN','JULY'),('NUT','DECEMBER'),('GRAIN','NOVEMBER'),('FRUIT/VEGETABE','JANUARY'),('LEAVES','JULY'),('SUGAR (JUICE EXTRACTION)','APRIL'),('OILSEEDS','MARCH'),('FRUIT','JULY'),('LATEX','JULY'),('GRAIN','JUNE'),('TUBER','OCTOBER'),('FRUIT','SEPTEMBER'),('PULSES','OCTOBER'),('OLSEEDS','JANUARY'),('FRUIT','AUGUST'),('GRAIN','MAY'),('OILSEEDS','OCTOBER'),('GRAIN','AUGUST'),('FRUIT','MARCH'),('NUTS','FEBRUARY'),('VEGETABLE','MAY'),('FUBER','JUNE'),('PULSES','SEPTEMBER'),('NUT','APRIL'),('VEGETABLE','SEPTEMBER'),('GRAIN','DECEMBER'),('FRUIT','MAY'),('GRAIN','JULY'),('NUT','DECEMBER'),('GRAIN','NOVEMBER'),('FRUIT/VEGETABE','JANUARY'),('LEAVES','JULY'),('SUGAR (JUICE EXTRACTION)','APRIL'),('OILSEEDS','MARCH'),('FRUIT','JULY'),('LATEX','JULY'),('GRAIN','JUNE'),('TUBER','OCTOBER'),('FRUIT','SEPTEMBER'),('PULSES','OCTOBER'),('OLSEEDS','JANUARY'),('FRUIT','AUGUST'),('GRAIN','MAY'),('OILSEEDS','OCTOBER'),('GRAIN','AUGUST'),('FRUIT','MARCH'),('NUTS','FEBRUARY'),('VEGETABLE','MAY'),('FUBER','JUNE'),('PULSES','SEPTEMBER'),('NUT','APRIL'),('VEGETABLE','SEPTEMBER'),('GRAIN','DECEMBER'),('FRUIT','MAY'),('GRAIN','JULY'),('NUT','DECEMBER'),('GRAIN','NOVEMBER'),('FRUIT/VEGETABE','JANUARY'),('LEAVES','JULY'),('SUGAR (JUICE EXTRACTION)','APRIL'),('OILSEEDS','MARCH'),('FRUIT','JULY'),('LATEX','JULY'),('GRAIN','JUNE'),('TUBER','OCTOBER'),('FRUIT','SEPTEMBER'),('PULSES','OCTOBER'),('OLSEEDS','JANUARY'),('FRUIT','AUGUST'),('GRAIN','MAY'),('OILSEEDS','OCTOBER'),('GRAIN','AUGUST'),('FRUIT','MARCH'),('NUTS','FEBRUARY'),('VEGETABLE','MAY'),('FUBER','JUNE'),('PULSES','SEPTEMBER'),('NUT','APRIL'),('VEGETABLE','SEPTEMBER'),('GRAIN','DECEMBER'),('FRUIT','MAY'),('GRAIN','JULY'),('NUT','DECEMBER'),('GRAIN','NOVEMBER'),('FRUIT/VEGETABE','JANUARY'),('LEAVES','JULY'),('SUGAR (JUICE EXTRACTION)','APRIL'),('OILSEEDS','MARCH'),('FRUIT','JULY'),('LATEX','JULY'),('GRAIN','JUNE'),('TUBER','OCTOBER'),('FRUIT','SEPTEMBER'),('PULSES','OCTOBER'),('OLSEEDS','JANUARY'),('FRUIT','AUGUST'),('GRAIN','MAY'),('OILSEEDS','OCTOBER'),('GRAIN','AUGUST'),('FRUIT','MARCH'),('NUTS','FEBRUARY'),('VEGETABLE','MAY'),('FUBER','JUNE'),('PULSES','SEPTEMBER'),('NUT','APRIL'),('VEGETABLE','SEPTEMBER'),('GRAIN','DECEMBER'),('FRUIT','MAY'),('GRAIN','JULY'),('NUT','DECEMBER');
/*!40000 ALTER TABLE `month_crop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `region` (
  `region_name` varchar(255) NOT NULL,
  `cost_per_unit_area` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`region_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region`
--

LOCK TABLES `region` WRITE;
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
INSERT INTO `region` VALUES ('ALLUVIAL PLAINS','3,50,000'),('BLACK HIGHLANDS','1,10,000'),('LATERITE LOWLANDS','1,00,000'),('RED VALLEY','2,45,000');
/*!40000 ALTER TABLE `region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `region_soil`
--

DROP TABLE IF EXISTS `region_soil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `region_soil` (
  `region_name` varchar(255) DEFAULT NULL,
  `soil_type` varchar(255) DEFAULT NULL,
  KEY `region_name` (`region_name`),
  KEY `soil_type` (`soil_type`),
  CONSTRAINT `region_soil_ibfk_1` FOREIGN KEY (`region_name`) REFERENCES `region` (`region_name`),
  CONSTRAINT `region_soil_ibfk_2` FOREIGN KEY (`soil_type`) REFERENCES `soil` (`soil_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region_soil`
--

LOCK TABLES `region_soil` WRITE;
/*!40000 ALTER TABLE `region_soil` DISABLE KEYS */;
INSERT INTO `region_soil` VALUES ('ALLUVIAL PLAINS','ALLUVIAL SOIL'),('RED VALLEY','RED SOIL'),('BLACK HIGHLANDS','BLACK SOIL'),('LATERITE LOWLANDS','LATERITE SOIL');
/*!40000 ALTER TABLE `region_soil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `region_water`
--

DROP TABLE IF EXISTS `region_water`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `region_water` (
  `region_name` varchar(255) DEFAULT NULL,
  `water_source` varchar(255) DEFAULT NULL,
  KEY `water_source` (`water_source`),
  KEY `region_name` (`region_name`),
  CONSTRAINT `region_water_ibfk_1` FOREIGN KEY (`water_source`) REFERENCES `water` (`water_source`),
  CONSTRAINT `region_water_ibfk_2` FOREIGN KEY (`region_name`) REFERENCES `region` (`region_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region_water`
--

LOCK TABLES `region_water` WRITE;
/*!40000 ALTER TABLE `region_water` DISABLE KEYS */;
INSERT INTO `region_water` VALUES ('ALLUVIAL PLAINS','RIVERS'),('ALLUVIAL PLAINS','DAM'),('RED VALLEY','LAKE'),('RED VALLEY','GROUND WATER'),('BLACK HIGHLANDS','LAKE'),('BLACK HIGHLANDS','GROUND WATER'),('LATERITE LOWLANDS','CANALS'),('LATERITE LOWLANDS','RIVERS'),('LATERITE LOWLANDS','GROUND WATER');
/*!40000 ALTER TABLE `region_water` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `soil`
--

DROP TABLE IF EXISTS `soil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `soil` (
  `soil_type` varchar(255) NOT NULL,
  `water_holding_capacity` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`soil_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `soil`
--

LOCK TABLES `soil` WRITE;
/*!40000 ALTER TABLE `soil` DISABLE KEYS */;
INSERT INTO `soil` VALUES ('ALLUVIAL SOIL','HIGH'),('BLACK SOIL','HIGH'),('LATERITE SOIL','POOR'),('RED SOIL','MODERATE');
/*!40000 ALTER TABLE `soil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `soil_crop`
--

DROP TABLE IF EXISTS `soil_crop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `soil_crop` (
  `soil_type` varchar(255) DEFAULT NULL,
  `crop_name` varchar(255) DEFAULT NULL,
  KEY `crop_name` (`crop_name`),
  KEY `soil_type` (`soil_type`),
  CONSTRAINT `soil_crop_ibfk_1` FOREIGN KEY (`crop_name`) REFERENCES `crop` (`crop_name`),
  CONSTRAINT `soil_crop_ibfk_2` FOREIGN KEY (`soil_type`) REFERENCES `soil_nutrition` (`soil_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `soil_crop`
--

LOCK TABLES `soil_crop` WRITE;
/*!40000 ALTER TABLE `soil_crop` DISABLE KEYS */;
INSERT INTO `soil_crop` VALUES ('ALLUVIAL SOIL','MUSTARD'),('ALLUVIAL SOIL','GROUNDNUT'),('ALLUVIAL SOIL','SOYABEAN'),('ALLUVIAL SOIL','SUGARCANE'),('ALLUVIAL SOIL','MAIZE'),('ALLUVIAL SOIL','RICE'),('ALLUVIAL SOIL','BAJRA'),('ALLUVIAL SOIL','JOWAR'),('ALLUVIAL SOIL','CHICKPEA'),('ALLUVIAL SOIL','PEAS'),('ALLUVIAL SOIL','WHEAT'),('ALLUVIAL SOIL','BARLEY'),('RED SOIL','MUSTARD'),('RED SOIL','GROUNDNUT'),('RED SOIL','SOYABEAN'),('RED SOIL','SUGARCANE'),('RED SOIL','BANANA'),('RED SOIL','RICE'),('RED SOIL','TOBACCO'),('RED SOIL','MANGO'),('RED SOIL','CHICKPEA'),('RED SOIL','POTATOES'),('RED SOIL','WHEAT'),('RED SOIL','BARLEY'),('BLACK SOIL','TOMATO'),('BLACK SOIL','GROUNDNUT'),('BLACK SOIL','GUAVA'),('BLACK SOIL','SUGARCANE'),('BLACK SOIL','GREEN CHILLI'),('BLACK SOIL','COTTON'),('BLACK SOIL','SAPOTA'),('BLACK SOIL','JOWAR'),('BLACK SOIL','BRINJAL'),('BLACK SOIL','LINSEED'),('BLACK SOIL','WHEAT'),('BLACK SOIL','ARECANUT'),('LATERITE SOIL','TOMATO'),('LATERITE SOIL','GROUNDNUT'),('LATERITE SOIL','SOYABEAN'),('LATERITE SOIL','CASHEW NUTS'),('LATERITE SOIL','BANANA'),('LATERITE SOIL','RICE'),('LATERITE SOIL','RUBBER'),('LATERITE SOIL','JOWAR'),('LATERITE SOIL','PINEAPPLE'),('LATERITE SOIL','POTATOES'),('LATERITE SOIL','WHEAT'),('LATERITE SOIL','ARECANUT');
/*!40000 ALTER TABLE `soil_crop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `soil_nutrition`
--

DROP TABLE IF EXISTS `soil_nutrition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `soil_nutrition` (
  `nutrients` varchar(255) NOT NULL,
  `soil_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`nutrients`),
  KEY `soil_type` (`soil_type`),
  CONSTRAINT `soil_nutrition_ibfk_1` FOREIGN KEY (`soil_type`) REFERENCES `soil` (`soil_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `soil_nutrition`
--

LOCK TABLES `soil_nutrition` WRITE;
/*!40000 ALTER TABLE `soil_nutrition` DISABLE KEYS */;
INSERT INTO `soil_nutrition` VALUES ('CALCIUM','ALLUVIAL SOIL'),('NITROGEN','ALLUVIAL SOIL'),('PHOSPHORUS','ALLUVIAL SOIL'),('POTASSIUM','ALLUVIAL SOIL'),('BORON','BLACK SOIL'),('MANGANESE','BLACK SOIL'),('ZINC','BLACK SOIL'),('GYPSUM','LATERITE SOIL'),('SILICA','LATERITE SOIL'),('ZEOLITES','LATERITE SOIL'),('ALUMINIUM','RED SOIL'),('IRON','RED SOIL'),('MAGNESIUM','RED SOIL'),('SULPHUR','RED SOIL');
/*!40000 ALTER TABLE `soil_nutrition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_records`
--

DROP TABLE IF EXISTS `user_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_records` (
  `session_id` varchar(40) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `record_name` varchar(255) DEFAULT NULL,
  `region` varchar(100) DEFAULT NULL,
  `soil` varchar(100) DEFAULT NULL,
  `month_` varchar(255) DEFAULT NULL,
  `crop` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_records`
--

LOCK TABLES `user_records` WRITE;
/*!40000 ALTER TABLE `user_records` DISABLE KEYS */;
INSERT INTO `user_records` VALUES ('72fcb515-6030-44d9-981e-de39635ac755','demo','AA','LATERITE LOWLANDS','LATERITE SOIL','January','TOMATO'),('b6f2e1d4-1c93-48f5-a1cc-bb013b216884','demo','GG','RED VALLEY','RED SOIL','June','RICE');
/*!40000 ALTER TABLE `user_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `password` varchar(300) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('demo','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','a@GMAIL.COM'),('zoro','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','a@GMAIL.COM');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `water`
--

DROP TABLE IF EXISTS `water`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `water` (
  `water_source` varchar(255) NOT NULL,
  `availability` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`water_source`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `water`
--

LOCK TABLES `water` WRITE;
/*!40000 ALTER TABLE `water` DISABLE KEYS */;
INSERT INTO `water` VALUES ('CANALS','RAINY AND WINTER SEASON'),('DAM','THROUGHOUT THE YEAR'),('GROUND WATER','THROUGHOUT THE YEAR'),('LAKE','THROUGHOUT THE YEAR'),('RIVERS','RAINY AND WINTER SEASON');
/*!40000 ALTER TABLE `water` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `crop_all_month`
--

/*!50001 DROP VIEW IF EXISTS `crop_all_month`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `crop_all_month` AS select `t1`.`sowing_month` AS `sowing_month`,`t2`.`soil_type` AS `soil_type`,`t2`.`crop_name` AS `crop_name` from (`crop` `t1` join `soil_crop` `t2` on((`t1`.`crop_name` = `t2`.`crop_name`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `crop_pests_pesticides`
--

/*!50001 DROP VIEW IF EXISTS `crop_pests_pesticides`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `crop_pests_pesticides` AS select `t1`.`pests` AS `pests`,`t1`.`crop_name` AS `crop_name`,`t2`.`pesticides` AS `pesticides` from (`crop_pests` `t1` join `crop_pesticides` `t2` on((`t1`.`pests` = `t2`.`pests`))) */;
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

-- Dump completed on 2024-03-24  1:06:52
