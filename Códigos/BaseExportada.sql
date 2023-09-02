CREATE DATABASE  IF NOT EXISTS `projeto_dio_2` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `projeto_dio_2`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: projeto_dio_2
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `aluno`
--

DROP TABLE IF EXISTS `aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aluno` (
  `IdAluno` int NOT NULL AUTO_INCREMENT,
  `IdFaculdade` int DEFAULT NULL,
  `IdCurso` int DEFAULT NULL,
  `PrimeiroNome` varchar(45) DEFAULT NULL,
  `Sobrenome` varchar(45) DEFAULT NULL,
  `CPF` char(11) DEFAULT NULL,
  `Idade` int DEFAULT NULL,
  `Sexo` enum('M','F','O') DEFAULT NULL,
  PRIMARY KEY (`IdAluno`),
  UNIQUE KEY `unique_cpf` (`CPF`),
  KEY `fk_IdCurso` (`IdCurso`),
  KEY `fk_IdFaculdadeCurso` (`IdFaculdade`,`IdCurso`),
  CONSTRAINT `fk_IdCurso` FOREIGN KEY (`IdCurso`) REFERENCES `curso` (`IdCurso`),
  CONSTRAINT `fk_IdFaculdade` FOREIGN KEY (`IdFaculdade`) REFERENCES `faculdade` (`IdFaculdade`),
  CONSTRAINT `fk_IdFaculdadeCurso` FOREIGN KEY (`IdFaculdade`, `IdCurso`) REFERENCES `faculdadecurso` (`IdFaculdade`, `IdCurso`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno`
--

LOCK TABLES `aluno` WRITE;
/*!40000 ALTER TABLE `aluno` DISABLE KEYS */;
INSERT INTO `aluno` VALUES (1,1,1,'Stephany','Almeida','65168345264',25,'F'),(2,1,1,'Debora','Almeida','128465194',21,'F'),(3,1,1,'Leticia','Assis','168426426',20,'F'),(4,1,6,'Jorge','Silva','6541986388',40,'M'),(5,2,10,'Mauricio','Silva','16957266',26,'M'),(6,2,10,'Paloma','Oliveira','986546524',19,'O'),(7,2,10,'Xandy','Antoneli','5413546542',19,'O'),(8,2,10,'Pablo','Almeida','5324193566',19,'M'),(9,2,11,'Sergio','Sakamoto','6532468541',19,'M'),(10,2,11,'Antonio','Santos','53522465324',20,'M'),(11,2,12,'Manuel','Hanahsiro','6575262465',20,'M'),(12,2,12,'Welinton','Rizzardo','685556246',24926495,'M'),(13,2,13,'Jorge','Almeida','64434219654',26,'M'),(14,3,3,'Camila','Zombini','6451654',22,'F'),(15,3,1,'Patricia','Arashiro','64436565464',32,'F'),(16,3,11,'Giovana','Castro','6443546841',20,'F'),(17,4,4,'Natasha','Oliveira','52685216321',19,'F'),(18,4,4,'Matheus','Kanashiro','653246',22,'M'),(19,5,5,'Camila','Bezerra','6526545264',25,'F'),(20,5,5,'Debora','Graziano','653246856',22,'F'),(21,5,5,'Giovanni','Alencar','163246',22,'M'),(22,5,5,'João','Bagio','632464066',23,'M'),(23,5,10,'Mauricio','Jesus','53461655',22,'M'),(24,5,11,'Paloma','Guimaraes','6526652',20,'F'),(25,5,12,'Chico','Antoneli','1654263426',26,'O'),(26,5,11,'Paulo','Mendes','29856466',23,'M'),(27,5,6,'Alexandre','Sakamoto','26526466',22,'M'),(28,5,6,'Miguel','Oliveira','689564866',20,'M'),(29,5,6,'Manuel','Kanahsiro','612649865',19,'M'),(30,5,8,'Winson','Azevedo','532416654',35,'M'),(31,5,8,'Marcos','Almeida','16534216',21,'M'),(32,5,10,'Carlos','Calore','6468956462',20,'M'),(33,5,10,'Mayumi','Kanashiro','6546263654',32,'F'),(34,5,10,'Giovana','Assis','1654985634',60,'F'),(35,5,11,'Natalia','Anjos','56316544',20,'F'),(36,5,12,'Alberto','Kanashiro','6542641621',56,'M'),(37,2,10,'Steph','Alonso','651685346',25,'F');
/*!40000 ALTER TABLE `aluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alunosporturmamateria`
--

DROP TABLE IF EXISTS `alunosporturmamateria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alunosporturmamateria` (
  `IdTurmaMateria` int NOT NULL,
  `IdAluno` int NOT NULL,
  PRIMARY KEY (`IdTurmaMateria`,`IdAluno`),
  KEY `fk_IdAluno` (`IdAluno`),
  CONSTRAINT `fk_IdAluno` FOREIGN KEY (`IdAluno`) REFERENCES `aluno` (`IdAluno`),
  CONSTRAINT `fk_IdTurmaMateria` FOREIGN KEY (`IdTurmaMateria`) REFERENCES `turmamateria` (`IdTurmaMateria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alunosporturmamateria`
--

LOCK TABLES `alunosporturmamateria` WRITE;
/*!40000 ALTER TABLE `alunosporturmamateria` DISABLE KEYS */;
INSERT INTO `alunosporturmamateria` VALUES (8,1),(8,2),(8,3),(1,4),(9,5),(10,6),(11,7),(10,8),(10,9),(11,10),(9,11),(9,12),(1,13),(1,14),(8,15),(10,16),(8,17),(8,18),(1,19),(3,20),(3,21),(2,22),(9,23),(9,24),(10,25),(11,26),(7,27),(7,28),(7,29),(12,30),(12,31),(12,32),(12,33),(12,34),(12,35),(12,36),(12,37);
/*!40000 ALTER TABLE `alunosporturmamateria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso`
--

DROP TABLE IF EXISTS `curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curso` (
  `IdCurso` int NOT NULL AUTO_INCREMENT,
  `NomeCurso` varchar(40) DEFAULT NULL,
  `DuracaoAnos` int DEFAULT NULL,
  `Periodo` enum('M','T','N') DEFAULT NULL,
  `Vagas` int DEFAULT NULL,
  `Mensalidade` float DEFAULT NULL,
  `Tipo_Curso` enum('B','L','T','CL') DEFAULT NULL,
  PRIMARY KEY (`IdCurso`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso`
--

LOCK TABLES `curso` WRITE;
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
INSERT INTO `curso` VALUES (1,'Historia',4,'M',40,600,'L'),(2,'Quimica',4,'M',40,600,'L'),(3,'Matematica',4,'T',40,700,'L'),(4,'Letras',4,'N',30,700,'L'),(5,'Fisica',4,'N',30,700,'L'),(6,'Eng. Elétrica',5,'M',40,1500,'B'),(7,'Eng. Mecânica',5,'M',40,1500,'B'),(8,'Eng. Produção',5,'N',40,1600,'B'),(9,'Eng. Petróleo',5,'N',30,1000,'B'),(10,'Sistemas Da Informação',4,'M',40,1500,'B'),(11,'Ciência da Computação',4,'M',40,1500,'B'),(12,'Análise e desenvolvimento de Sistemas',3,'N',30,1200,'T'),(13,'Administração de empresas',3,'N',30,1200,'T'),(14,'Acupuntura',1,'N',20,600,'CL'),(15,'Manutenção de Eletrônicos',1,'N',20,600,'CL');
/*!40000 ALTER TABLE `curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faculdade`
--

DROP TABLE IF EXISTS `faculdade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faculdade` (
  `IdFaculdade` int NOT NULL AUTO_INCREMENT,
  `NomeFaculdade` varchar(45) DEFAULT NULL,
  `Estado` char(2) DEFAULT NULL,
  PRIMARY KEY (`IdFaculdade`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculdade`
--

LOCK TABLES `faculdade` WRITE;
/*!40000 ALTER TABLE `faculdade` DISABLE KEYS */;
INSERT INTO `faculdade` VALUES (1,'UniSP','SP'),(2,'InstitutoSP','SP'),(3,'FaSP','SP'),(4,'UniRJ','RJ'),(5,'Faculdade Niteroi','RJ');
/*!40000 ALTER TABLE `faculdade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faculdadecurso`
--

DROP TABLE IF EXISTS `faculdadecurso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faculdadecurso` (
  `IdFaculdade` int NOT NULL,
  `IdCurso` int NOT NULL,
  PRIMARY KEY (`IdFaculdade`,`IdCurso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculdadecurso`
--

LOCK TABLES `faculdadecurso` WRITE;
/*!40000 ALTER TABLE `faculdadecurso` DISABLE KEYS */;
INSERT INTO `faculdadecurso` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(2,10),(2,11),(2,12),(2,13),(3,1),(3,2),(3,3),(3,10),(3,11),(4,4),(4,5),(4,6),(4,7),(4,13),(4,14),(4,15),(5,5),(5,6),(5,7),(5,8),(5,9),(5,10),(5,11),(5,12);
/*!40000 ALTER TABLE `faculdadecurso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turmamateria`
--

DROP TABLE IF EXISTS `turmamateria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `turmamateria` (
  `IdTurmaMateria` int NOT NULL AUTO_INCREMENT,
  `Matéria` varchar(45) NOT NULL,
  `VagaS` int DEFAULT NULL,
  PRIMARY KEY (`IdTurmaMateria`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turmamateria`
--

LOCK TABLES `turmamateria` WRITE;
/*!40000 ALTER TABLE `turmamateria` DISABLE KEYS */;
INSERT INTO `turmamateria` VALUES (1,'Calculo 1',40),(2,'Calculo 2',40),(3,'Calculo 3',40),(4,'Anatomia - 1',30),(5,'Anatomia 2',30),(6,'Resistencia dos materiais ',40),(7,'Numeros Complexos',30),(8,'Historia da comunicação',30),(9,'Desenvolvimento Web',30),(10,'Desenvolvimento Mobile',40),(11,'Desenvolvimento de jogos',40),(12,'Estatisticas',50);
/*!40000 ALTER TABLE `turmamateria` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-01 22:32:59
