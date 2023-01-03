# TT-Triada
------------------------ Base de datos ------------------------

CREATE DATABASE `triada` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

CREATE TABLE `preguntas` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Pregunta` varchar(300) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `opciones` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Respuesta` bit(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

CREATE TABLE Persona (
	ID int NOT NULL AUTO_INCREMENT,
    Nombre VARCHAR(80) NOT NULL,
    A_Paterno VARCHAR(80) NOT NULL,
    A_Materno VARCHAR(80),
    Fecha_nac DATETIME NOT NULL,
    Correo VARCHAR(200) NOT NULL,
    PRIMARY KEY (ID)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

CREATE TABLE Usuario_RH (
	ID int NOT NULL AUTO_INCREMENT,
    Nombre VARCHAR(80) NOT NULL,
    A_Paterno VARCHAR(80) NOT NULL,
    A_Materno VARCHAR(80),
    Empresa VARCHAR(200),
    Fecha_nac DATETIME NOT NULL,
    Correo VARCHAR(200) NOT NULL,
    Contrasena VARCHAR(30) DEFAULT NULL,
    PRIMARY KEY (ID)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

CREATE TABLE RH_Persona(
	ID INT AUTO_INCREMENT  NOT NULL,
    ID_RH INT,
    ID_Persona INT,
    FOREIGN KEY(ID_RH) REFERENCES usuario_rh(ID),
    FOREIGN KEY(ID_Persona) REFERENCES persona(ID),
    PRIMARY KEY(ID)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

CREATE TABLE Cuestionario(
	ID int auto_increment not null,
    ID_Opciones int,
    ID_Preguntas int,
    ID_Persona int,
    FOREIGN KEY(ID_Opciones) REFERENCES opciones(ID),
    FOREIGN KEY(ID_Preguntas) REFERENCES preguntas(ID),
    FOREIGN KEY(ID_Persona) REFERENCES persona(ID),
    PRIMARY KEY(ID)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

************* SP ******************

DELIMITER //
DROP PROCEDURE IF EXISTS llenarCuestionario;
CREATE PROCEDURE llenarCuestionario (opcion bit,correof varchar(200),numPregunta int)
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
END

DELIMITER //
DROP PROCEDURE IF EXISTS insertarUsuario;
CREATE PROCEDURE insertarUsuario(Nombref varchar(80),A_Paternof varchar(80),A_Maternof varchar(80),Empresaf varchar(200),Fecha_nacf datetime,Correof varchar(200),Contrasenaf varchar(255),Generof varchar(1))
BEGIN
    DECLARE fID_RH INT;
    SELECT ID INTO fID_RH FROM usuario_rh WHERE Correo = Correof;
    IF fID_RH != '' THEN
		SELECT * FROM USUARIO_RH WHERE CORREO = CORREOF;
    ELSE
		INSERT INTO usuario_rh(Nombre,A_Paterno,A_Materno,Empresa,Fecha_nac,Correo,Contrasena,Genero) VALUES (Nombref,A_Paternof,A_Maternof,Empresaf,Fecha_nacf,Correof,Contrasenaf,Generof);
    END IF;
END

DELIMITER //
DROP PROCEDURE IF EXISTS insertarPersona;
CREATE PROCEDURE insertarPersona(Nombref varchar(80),A_Paternof varchar(80),A_Maternof varchar(80),Fecha_nacf datetime,Correof varchar(200),Generof varchar(1))
BEGIN
    DECLARE fID INT;
    SELECT ID INTO fID FROM persona WHERE Correo = Correof;
    IF fID != '' THEN
		SELECT * FROM persona WHERE Correo = Correof;
    ELSE
		INSERT INTO persona(Nombre,A_Paterno,A_Materno,Fecha_nac,Correo,Genero) VALUES (Nombref,A_Paternof,A_Maternof,Fecha_nacf,Correof,Generof);
    END IF;
END

------------------------ .env ejemplo ------------------------

//puerto del servidor
PORT = 3000
//Base de datos
host = "localhost"
user = "root"
base = "triada"
password = ""
dbport = 3306
front = "http://localhost:4200"

/Local

PORT = 3000
host = "localhost"
user = "administrador"
base = "triada"
password = "triada1234$"
dbport = 3306
front = "http://localhost:4200"

/Nube

PORT = 3000
host = "us-east.connect.psdb.cloud"
user = "uj6qg3u5zub2h1b601kx"
base = "triada"
password = "pscale_pw_R3DQaFVMiKVZntPGNn7hfKOA9GTyPtxMfV61bRyIEYJ"
dbport = 3306
front = "http://localhost:4200"
