CREATE DATABASE  IF NOT EXISTS `triada` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `triada`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: triada
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `cuestionario`
--

DROP TABLE IF EXISTS `cuestionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuestionario` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_Opcion` int DEFAULT NULL,
  `ID_Pregunta` int DEFAULT NULL,
  `ID_Persona` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_Opciones` (`ID_Opcion`),
  KEY `ID_Preguntas` (`ID_Pregunta`),
  KEY `ID_Persona` (`ID_Persona`),
  CONSTRAINT `cuestionario_ibfk_1` FOREIGN KEY (`ID_Opcion`) REFERENCES `opciones` (`ID`),
  CONSTRAINT `cuestionario_ibfk_2` FOREIGN KEY (`ID_Pregunta`) REFERENCES `preguntas` (`ID`),
  CONSTRAINT `cuestionario_ibfk_3` FOREIGN KEY (`ID_Persona`) REFERENCES `persona` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=271 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuestionario`
--

LOCK TABLES `cuestionario` WRITE;
/*!40000 ALTER TABLE `cuestionario` DISABLE KEYS */;
INSERT INTO `cuestionario` VALUES (91,2,1,53),(92,1,2,53),(93,1,3,53),(94,1,4,53),(95,1,5,53),(96,1,6,53),(97,1,7,53),(98,1,8,53),(99,1,9,53),(100,1,10,53),(101,1,11,53),(102,1,12,53),(103,1,13,53),(104,1,14,53),(105,1,15,53),(106,1,16,53),(107,1,17,53),(108,1,18,53),(109,1,19,53),(110,1,20,53),(111,1,21,53),(112,1,22,53),(113,1,23,53),(114,1,24,53),(115,1,25,53),(116,1,26,53),(117,1,27,53),(118,1,28,53),(119,1,29,53),(120,1,30,53),(121,1,31,53),(122,1,32,53),(123,1,33,53),(124,1,34,53),(125,1,35,53),(126,1,36,53),(127,1,37,53),(128,1,38,53),(129,1,39,53),(130,1,40,53),(131,1,41,53),(132,1,42,53),(133,1,43,53),(134,1,44,53),(135,2,45,53),(136,1,46,53),(137,1,47,53),(138,1,48,53),(139,1,49,53),(140,1,50,53),(141,1,51,53),(142,1,52,53),(143,1,53,53),(144,1,54,53),(145,1,55,53),(146,1,56,53),(147,1,57,53),(148,1,58,53),(149,1,59,53),(150,1,60,53),(151,1,61,53),(152,1,62,53),(153,1,63,53),(154,1,64,53),(155,1,65,53),(156,1,66,53),(157,1,67,53),(158,1,68,53),(159,1,69,53),(160,1,70,53),(161,1,71,53),(162,1,72,53),(163,1,73,53),(164,1,74,53),(165,1,75,53),(166,1,76,53),(167,1,77,53),(168,1,78,53),(169,1,79,53),(170,1,80,53),(171,1,81,53),(172,1,82,53),(173,1,83,53),(174,1,84,53),(175,1,85,53),(176,1,86,53),(177,1,87,53),(178,1,88,53),(179,1,89,53),(180,1,90,53),(181,1,1,3),(182,1,2,3),(183,1,3,3),(184,1,4,3),(185,1,5,3),(186,2,6,3),(187,1,7,3),(188,2,8,3),(189,1,9,3),(190,1,10,3),(191,1,11,3),(192,1,12,3),(193,1,13,3),(194,1,14,3),(195,1,15,3),(196,1,16,3),(197,1,17,3),(198,1,18,3),(199,2,19,3),(200,1,20,3),(201,1,21,3),(202,1,22,3),(203,1,23,3),(204,1,24,3),(205,1,25,3),(206,2,26,3),(207,1,27,3),(208,1,28,3),(209,1,29,3),(210,1,30,3),(211,2,31,3),(212,1,32,3),(213,1,33,3),(214,1,34,3),(215,1,35,3),(216,1,36,3),(217,1,37,3),(218,2,38,3),(219,1,39,3),(220,1,40,3),(221,1,41,3),(222,1,42,3),(223,1,43,3),(224,1,44,3),(225,1,45,3),(226,1,46,3),(227,2,47,3),(228,1,48,3),(229,1,49,3),(230,1,50,3),(231,2,51,3),(232,1,52,3),(233,2,53,3),(234,1,54,3),(235,1,55,3),(236,1,56,3),(237,1,57,3),(238,1,58,3),(239,1,59,3),(240,1,60,3),(241,1,61,3),(242,1,62,3),(243,1,63,3),(244,2,64,3),(245,2,65,3),(246,1,66,3),(247,1,67,3),(248,2,68,3),(249,1,69,3),(250,1,70,3),(251,1,71,3),(252,1,72,3),(253,1,73,3),(254,1,74,3),(255,1,75,3),(256,1,76,3),(257,1,77,3),(258,1,78,3),(259,1,79,3),(260,2,80,3),(261,1,81,3),(262,1,82,3),(263,1,83,3),(264,2,84,3),(265,1,85,3),(266,1,86,3),(267,1,87,3),(268,2,88,3),(269,1,89,3),(270,1,90,3);
/*!40000 ALTER TABLE `cuestionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opciones`
--

DROP TABLE IF EXISTS `opciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `opciones` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Respuesta` bit(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opciones`
--

LOCK TABLES `opciones` WRITE;
/*!40000 ALTER TABLE `opciones` DISABLE KEYS */;
INSERT INTO `opciones` VALUES (1,_binary '\0'),(2,_binary '');
/*!40000 ALTER TABLE `opciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persona` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(80) NOT NULL,
  `A_Paterno` varchar(80) NOT NULL,
  `A_Materno` varchar(80) DEFAULT NULL,
  `Fecha_nac` datetime NOT NULL,
  `Correo` varchar(200) NOT NULL,
  `Genero` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (1,'Juan','Perez','Lopez','1999-01-10 00:00:00','PerezL@gmail.com','M'),(2,'Tecla','Cabo','Cantero','1990-10-20 00:00:00','tecla.cabo@triada.com','M'),(3,'Anastasio','Bermejo','Grande','2005-05-12 00:00:00','anastasio.bermejo@triada.com','M'),(4,'Francisca','Nuñez','Calvet','2019-12-03 00:00:00','francisca.nuñez@triada.com','F'),(5,'Celso','Polo','Grande','1995-06-25 00:00:00','celso.polo@triada.com','X'),(6,'Gabino','López','Delgado','2001-01-15 00:00:00','gabino.lópez@triada.com','M'),(7,'Encarnación','Bellido','Nuñez','2002-08-08 00:00:00','encarnación.bellido@triada.com','M'),(8,'Rogelio','Moreno','Murillo','1997-02-28 00:00:00','rogelio.moreno@triada.com','M'),(9,'Fanny','Giménez','Talavera','1989-09-20 00:00:00','fanny.giménez@triada.com','F'),(10,'Milagros','Alsina','Delgado','2003-04-14 00:00:00','milagros.alsina@triada.com','F'),(11,'Osvaldo','Llobet','Azorin','1994-11-04 00:00:00','osvaldo.llobet@triada.com','M'),(12,'Gracia','Alarcán','Chávez','1996-05-27 00:00:00','gracia.alarcán@triada.com','F'),(13,'Judith','Agullo','Santana','2000-12-18 00:00:00','judith.agullo@triada.com','F'),(14,'Eloy','Santana','Villalba','1999-07-10 00:00:00','eloy.santana@triada.com','F'),(15,'Blanca','Vizcáno','Cuervo','2001-01-31 00:00:00','blanca.vizcáno@triada.com','F'),(16,'Maricela','Carlos','Arias','1998-08-23 00:00:00','maricela.carlos@triada.com','F'),(17,'Eusebia','Ojeda','Alcaraz','1998-03-16 00:00:00','eusebia.ojeda@triada.com','F'),(18,'VÍctor','Ortiz','Arribas','2001-10-07 00:00:00','víctor.ortiz@triada.com','M'),(19,'Juanita','Muñoz','Cadenas','1992-04-29 00:00:00','juanita.muñoz@triada.com','F'),(20,'Alejandra','Hidalgo','Maldonado','2005-11-19 00:00:00','alejandra.hidalgo@triada.com','F'),(53,'Alejandro','Moreno','Hurtado','1999-11-01 00:00:00','moreno@triada.com','M');
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preguntas`
--

DROP TABLE IF EXISTS `preguntas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `preguntas` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Pregunta` varchar(300) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preguntas`
--

LOCK TABLES `preguntas` WRITE;
/*!40000 ALTER TABLE `preguntas` DISABLE KEYS */;
INSERT INTO `preguntas` VALUES (1,'Me gusta tener cautela en lo que hago y cómo lo hago\n'),(2,'Siempre hago todo a mi modo\n'),(3,'Es difícil que los demás me hagan pensar diferente a mi idea principal \n'),(4,'Aun si los demás puedan considerar mala una acción o forma de pensar, yo no siento culpa alguna\n'),(5,'Me siento satisfecho cuando hago las cosas cuando, cómo y donde yo quiero\n'),(6,'Pienso muy metódicamente los problemas\n'),(7,'He hecho cosas malas \n'),(8,'Me siento indiferente a los demás casi todo el tiempo\n'),(9,'Hago las cosas por impulso\n'),(10,'Estoy dispuesto a dar o hacer cosas que no me agraden por los demás, si así logro caerle bien a la gente adecuada \n'),(11,'Nunca me detengo a pensar en las repercusiones de mis acciones en los demás \n'),(12,'Me cuesta aceptar que no todos comparten mi opinión\n'),(13,'Tengo pensamientos diferentes a los demás \n'),(14,'No es importante para mi conocer la opinión de los demás respecto a mi vida o mis acciones \n'),(15,'Siento que mis habilidades te pueden llevar a donde quiera\n'),(16,'A veces puedo parecer muy frío o muy alegre \n'),(17,'Me da igual cuando los demás me hablan de sus cosas \n'),(18,'Siento que puedo conseguir todo de los demás\n'),(19,'Soy organizado\n'),(20,'Soy fiel a mi mismo\n'),(21,'No me detengo mucho a pensar en las consecuencias para los demás cuando me hacen un favor \n'),(22,'Soy analítico \n'),(23,'Siempre sigo mis deseos\n'),(24,'Es fácil hacer que los demás hagan las cosas a mi modo\n'),(25,'Soy apasionado\n'),(26,'Casi nunca cometo errores\n'),(27,'No importa el costo para alcanzar lo que quiero con tal de conseguirlo\n'),(28,'Si veo a alguien sufriendo, me da igual\n'),(29,'No tolero que me digan que hice algo mal\n'),(30,'Quiero seguir mis metas y deseos a toda costa \n'),(31,'No está mal romper la ley o hacer algo malo, mientras no se sepa \n'),(32,'Me desespero cuando me critican \n'),(33,'Me es indiferente la opinión de los demás \n'),(34,'Puedo tener algún interés importante y muy marcado en mi\n'),(35,'No me interesa saber que piensan los demás \n'),(36,'No me preocupa que los demás se sientan mal mientras hagan lo que yo deseo \n'),(37,'Me gusta llevar algún tipo de seguimiento en lo que hago \n'),(38,'Aun si no me lo preguntan creo que mi opinión es importante de compartir \n'),(39,'Es muy cómodo que los demás sigan mis instrucciones \n'),(40,'Soy planificador\n'),(41,'Me gusta contar cosas de mi\n'),(42,'No hay problema si para alcanzar el éxito usas a alguien \n'),(43,'Aun si los demás lloran por una tragedia, yo puedo sentirme complacido internamente \n'),(44,'Me molesta que no presten atención a lo que digo\n'),(45,'Si buscas la debilidad de alguien, es más fácil saber que decirle para caerle bien\n'),(46,'A ocurrido el sentir necesidad de lastimar a los demás \n'),(47,'Me gusta siempre dar mi punto de vista\n'),(48,'Consigo convencer a los demás que mi perspectiva es la correcta \n'),(49,'Me siento muy bien controlando las cosas a mi beneficio \n'),(50,'Soy importante \n'),(51,'Me gusta que se sigan mis deseos al pie de la letra\n'),(52,'No siento remordimientos \n'),(53,'Me gusta escuchar a las demás personas hablar de mi\n'),(54,'Cuando las demás personas hacen lo que yo quiero, me causa placer o satisfacción \n'),(55,'No importa lastimar animales\n'),(56,'Las platicas son más interesantes cuando hablan de mi\n'),(57,'Cualquiera buscaría obtener beneficios de alguien débil si se presenta la oportunidad \n'),(58,'A veces ver el sufrimiento de otros me causa placer\n'),(59,'Mi físico me importa mucho \n'),(60,'Creo que es fácil influir en las decisiones y pensamientos de las demás personas \n'),(61,'Me tengo en muy alta estima a comparación de los demás\n'),(62,'Prefiero ser feliz y humilde a buscar el reconocimiento de todos\n'),(63,'Es mala idea ocultarle los planes a alguien que nos ayuda\n'),(64,'He tenido pensamientos vengativos\n'),(65,'Puedo aprender mucho más de los demás que por mi cuenta\n'),(66,'Si no se obliga a alguien, no trabajaría más duro\n'),(67,'La gente más sensible suele ser más débil\n'),(68,'Me gusta que me volteen a ver cuando salgo\n'),(69,'Es mejor asumir que todos pueden ser malos\n'),(70,'Llegué a ejercer bullying en la escuela\n'),(71,'Me considero mejor que el promedio\n'),(72,'La mejor estrategia es ser honesto\n'),(73,'Mentir es tan natural como hablar\n'),(74,'Tengo el cuerpo que deseo\n'),(75,'Es posible ser bueno en todos los aspectos\n'),(76,'Soy alguien promiscuo\n'),(77,'Todos a mi alrededor me dicen lo bueno que soy\n'),(78,'Es fácil olvidar a la gente importante\n'),(79,'No me gusta aceptar las consecuencias de mis actos\n'),(80,'Es difícil comprender que piensan los demás\n'),(81,'No se llega a ningún lado sin atajos\n'),(82,'La gente me dice que soy algo frío\n'),(83,'Siempre me resulta todo como lo planeo\n'),(84,'La valentía es deseable en el ser humano\n'),(85,'Actuar por impulso es característico de mí\n'),(86,'Siento que los cumplidos están de más\n'),(87,'Es mejor ser pobre y honrado que rico y deshonesto\n'),(88,'Las emociones profundas casi no se dan en mí\n'),(89,'Depender de los demás no es malo\n'),(90,'La mayor parte de la gente exitosa es buena y ética\n');
/*!40000 ALTER TABLE `preguntas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rh_persona`
--

DROP TABLE IF EXISTS `rh_persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rh_persona` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_RH` int DEFAULT NULL,
  `ID_Persona` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_RH` (`ID_RH`),
  KEY `ID_Persona` (`ID_Persona`),
  CONSTRAINT `rh_persona_ibfk_1` FOREIGN KEY (`ID_RH`) REFERENCES `usuario_rh` (`ID`),
  CONSTRAINT `rh_persona_ibfk_2` FOREIGN KEY (`ID_Persona`) REFERENCES `persona` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rh_persona`
--

LOCK TABLES `rh_persona` WRITE;
/*!40000 ALTER TABLE `rh_persona` DISABLE KEYS */;
INSERT INTO `rh_persona` VALUES (3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,20),(8,2,7),(9,2,8),(10,2,9),(11,2,10),(12,2,11),(13,2,12),(14,2,19),(15,3,13),(16,3,14),(17,3,15),(18,3,16),(19,3,17),(20,3,18),(21,3,19),(22,3,20),(41,1,53),(43,1,53);
/*!40000 ALTER TABLE `rh_persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_rh`
--

DROP TABLE IF EXISTS `usuario_rh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_rh` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(80) NOT NULL,
  `A_Paterno` varchar(80) NOT NULL,
  `A_Materno` varchar(80) DEFAULT NULL,
  `Empresa` varchar(200) DEFAULT NULL,
  `Fecha_nac` datetime NOT NULL,
  `Correo` varchar(200) NOT NULL,
  `Contrasena` varchar(255) DEFAULT NULL,
  `Genero` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_rh`
--

LOCK TABLES `usuario_rh` WRITE;
/*!40000 ALTER TABLE `usuario_rh` DISABLE KEYS */;
INSERT INTO `usuario_rh` VALUES (1,'Alejandro','Moreno','Hurtado','IPN','1999-01-11 00:00:00','morenohurtadoalejandro@triada.com','$2a$08$6oSy06fYr.uHvCc8zFiF/.jVOrIOo4Xz0BmiuvGyCN1dCbDoiaRxu','M'),(2,'Alejandro','Ramos','Cruz','IPN','1999-05-27 00:00:00','ramoscruzalejandro@triada.com','$2a$08$7T39mW8Ucj.FXvT2sTssJ.wXLDj/CLzMUq/uyxxdGKjGSYPwq0aNe','M'),(3,'Daniel','Bernabe','Cortez','IPN','1999-03-15 00:00:00','bernabecortezdaniel@triada.com','$2a$08$UQyMtCMfTdf1neuqHWQQZOUkR6LdLhMOGvNqSXYmyRPSWy4suDvlS','M');
/*!40000 ALTER TABLE `usuario_rh` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-28 18:08:42
