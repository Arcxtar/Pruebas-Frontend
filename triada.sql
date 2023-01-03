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
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuestionario`
--

LOCK TABLES `cuestionario` WRITE;
/*!40000 ALTER TABLE `cuestionario` DISABLE KEYS */;
INSERT INTO `cuestionario` VALUES (1,1,1,1),(2,2,2,1),(3,2,3,1),(4,2,4,1),(5,1,5,1),(6,1,6,1),(7,1,7,1),(8,1,8,1),(9,1,9,1),(10,1,10,1),(11,1,11,1),(12,1,12,1),(13,1,13,1),(14,1,14,1),(15,1,15,1),(16,1,16,1),(17,1,17,1),(18,1,18,1),(19,1,19,1),(20,1,20,1),(21,1,21,1),(22,1,22,1),(23,1,23,1),(24,1,24,1),(25,1,25,1),(26,1,26,1),(27,1,27,1),(28,1,28,1),(29,1,29,1),(30,1,30,1),(31,1,31,1),(32,1,32,1),(33,1,33,1),(34,1,34,1),(35,1,35,1),(36,1,36,1),(37,1,37,1),(38,1,38,1),(39,1,39,1),(40,1,40,1),(41,1,41,1),(42,1,42,1),(43,1,43,1),(44,1,44,1),(45,1,45,1),(46,1,46,1),(47,1,47,1),(48,1,48,1),(49,1,49,1),(50,1,50,1),(51,1,51,1),(52,1,52,1),(53,1,53,1),(54,1,54,1),(55,1,55,1),(56,1,56,1),(57,2,57,1),(58,1,58,1),(59,1,59,1),(60,1,60,1),(61,1,61,1),(62,1,62,1),(63,1,63,1),(64,1,64,1),(65,1,65,1),(66,1,66,1),(67,2,67,1),(68,1,68,1),(69,1,69,1),(70,1,70,1),(71,1,71,1),(72,1,72,1),(73,1,73,1),(74,1,74,1),(75,1,75,1),(76,1,76,1),(77,1,77,1),(78,1,78,1),(79,1,79,1),(80,1,80,1),(81,1,81,1),(82,1,82,1),(83,1,83,1),(84,1,84,1),(85,1,85,1),(86,1,86,1),(87,1,87,1),(88,1,88,1),(89,1,89,1),(90,1,90,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (1,'Juan','Perez','Lopez','1999-01-10 00:00:00','PerezL@gmail.com','M'),(2,'Tecla','Cabo','Cantero','1990-10-20 00:00:00','tecla.cabo@triada.com','M'),(3,'Anastasio','Bermejo','Grande','2005-05-12 00:00:00','anastasio.bermejo@triada.com','M'),(4,'Francisca','Nuñez','Calvet','2019-12-03 00:00:00','francisca.nuñez@triada.com','F'),(5,'Celso','Polo','Grande','1995-06-25 00:00:00','celso.polo@triada.com','M'),(6,'Gabino','López','Delgado','2001-01-15 00:00:00','gabino.lópez@triada.com','M'),(7,'Encarnación','Bellido','Nuñez','2002-08-08 00:00:00','encarnación.bellido@triada.com','M'),(8,'Rogelio','Moreno','Murillo','1997-02-28 00:00:00','rogelio.moreno@triada.com','M'),(9,'Fanny','Giménez','Talavera','1989-09-20 00:00:00','fanny.giménez@triada.com','F'),(10,'Milagros','Alsina','Delgado','2003-04-14 00:00:00','milagros.alsina@triada.com','F'),(11,'Osvaldo','Llobet','Azorin','1994-11-04 00:00:00','osvaldo.llobet@triada.com','M'),(12,'Gracia','Alarcán','Chávez','1996-05-27 00:00:00','gracia.alarcán@triada.com','F'),(13,'Judith','Agullo','Santana','2000-12-18 00:00:00','judith.agullo@triada.com','F'),(14,'Eloy','Santana','Villalba','1999-07-10 00:00:00','eloy.santana@triada.com','F'),(15,'Blanca','Vizcáno','Cuervo','2001-01-31 00:00:00','blanca.vizcáno@triada.com','F'),(16,'Maricela','Carlos','Arias','1998-08-23 00:00:00','maricela.carlos@triada.com','F'),(17,'Eusebia','Ojeda','Alcaraz','1998-03-16 00:00:00','eusebia.ojeda@triada.com','F'),(18,'VÍctor','Ortiz','Arribas','2001-10-07 00:00:00','víctor.ortiz@triada.com','M'),(19,'Juanita','Muñoz','Cadenas','1992-04-29 00:00:00','juanita.muñoz@triada.com','F'),(20,'Alejandra','Hidalgo','Maldonado','2005-11-19 00:00:00','alejandra.hidalgo@triada.com','F');
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rh_persona`
--

LOCK TABLES `rh_persona` WRITE;
/*!40000 ALTER TABLE `rh_persona` DISABLE KEYS */;
INSERT INTO `rh_persona` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,20),(8,2,7),(9,2,8),(10,2,9),(11,2,10),(12,2,11),(13,2,12),(14,2,19),(15,3,13),(16,3,14),(17,3,15),(18,3,16),(19,3,17),(20,3,18),(21,3,19),(22,3,20);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_rh`
--

LOCK TABLES `usuario_rh` WRITE;
/*!40000 ALTER TABLE `usuario_rh` DISABLE KEYS */;
INSERT INTO `usuario_rh` VALUES (1,'Alejadro','Moreno','Hurtado','IPN','1999-01-11 00:00:00','morenohurtadoalejandro@triada.com','$2a$08$6oSy06fYr.uHvCc8zFiF/.jVOrIOo4Xz0BmiuvGyCN1dCbDoiaRxu','M'),(2,'Alejandro','Ramos','Cruz','IPN','1999-05-27 00:00:00','ramoscruzalejandro@triada.com','$2a$08$7T39mW8Ucj.FXvT2sTssJ.wXLDj/CLzMUq/uyxxdGKjGSYPwq0aNe','M'),(3,'Daniel','Bernabe','Cortez','IPN','1999-03-15 00:00:00','bernabecortezdaniel@triada.com','$2a$08$UQyMtCMfTdf1neuqHWQQZOUkR6LdLhMOGvNqSXYmyRPSWy4suDvlS','M'),(4,'Amaury','Flores','Huidobro','IPN','1999-05-25 00:00:00','amauryflores@gmail.com','$2a$08$U3RxG0xYlN4LwQ0GAXQxZu1CQXlqsmsd90MTLeZcGguErcTcJDPoK','M');
/*!40000 ALTER TABLE `usuario_rh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'triada'
--
/*!50003 DROP FUNCTION IF EXISTS `edadUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`administrador`@`localhost` FUNCTION `edadUsuario`(IDf INT,Tipof VARCHAR(6)) RETURNS year
BEGIN 
	DECLARE IDusuario INT;
    DECLARE auxFecha DATETIME;
	IF Tipof = "RH" THEN
		SELECT Fecha_nac INTO auxFecha FROM usuario_rh WHERE ID=IDusuario;
	ELSE
		SELECT Fecha_nac INTO auxFecha FROM persona WHERE ID=IDusuario;
    END IF;
    RETURN timestampdiff(YEAR, auxFecha ,NOW());
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertarPersona` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`administrador`@`localhost` PROCEDURE `insertarPersona`(Nombref varchar(80),A_Paternof varchar(80),A_Maternof varchar(80),Fecha_nacf datetime,Correof varchar(200),Generof varchar(1))
BEGIN
    DECLARE fID INT;
    SELECT ID INTO fID FROM persona WHERE Correo = Correof;
    IF fID != '' THEN
		SELECT * FROM persona WHERE Correo = Correof;
    ELSE
		INSERT INTO persona(Nombre,A_Paterno,A_Materno,Fecha_nac,Correo,Genero) VALUES (Nombref,A_Paternof,A_Maternof,Fecha_nacf,Correof,Generof);
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertarUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`administrador`@`localhost` PROCEDURE `insertarUsuario`(Nombref varchar(80),A_Paternof varchar(80),A_Maternof varchar(80),Empresaf varchar(200),Fecha_nacf datetime,Correof varchar(200),Contrasenaf varchar(255),Generof varchar(1))
BEGIN
    DECLARE fID_RH INT;
    SELECT ID INTO fID_RH FROM usuario_rh WHERE Correo = Correof;
    IF fID_RH != '' THEN
		SELECT * FROM USUARIO_RH WHERE CORREO = CORREOF;
    ELSE
		INSERT INTO usuario_rh(Nombre,A_Paterno,A_Materno,Empresa,Fecha_nac,Correo,Contrasena,Genero) VALUES (Nombref,A_Paternof,A_Maternof,Empresaf,Fecha_nacf,Correof,Contrasenaf,Generof);
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `llenarCuestionario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `llenarCuestionario`(opcion bit,idf int,numPregunta int)
BEGIN
	DECLARE fID_Opcion INT;
    DECLARE bandera INT;
    SELECT ID INTO fID_OPCION FROM opciones WHERE Respuesta=opcion;
    SELECT ID INTO bandera FROM cuestionario WHERE ID_Persona = idf AND ID_Pregunta = numPregunta;
    IF bandera != '' THEN
        UPDATE cuestionario SET ID_opcion = fID_opcion WHERE ID = bandera;
	ELSE
		INSERT INTO cuestionario(ID_Pregunta,ID_Opcion,ID_Persona) VALUES (numPregunta,fID_Opcion,idf);
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-05  0:53:05
