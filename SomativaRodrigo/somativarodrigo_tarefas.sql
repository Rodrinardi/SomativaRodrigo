-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: somativarodrigo
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `tarefas`
--

DROP TABLE IF EXISTS `tarefas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tarefas` (
  `idTarefa` bigint NOT NULL AUTO_INCREMENT,
  `titulo` varchar(250) NOT NULL,
  `descricao` varchar(500) NOT NULL,
  `dataAbertura` datetime NOT NULL DEFAULT (now()),
  `prazo` date NOT NULL,
  `solicitanteFK` bigint NOT NULL,
  `lugarFK` bigint NOT NULL,
  PRIMARY KEY (`idTarefa`),
  KEY `solicitanteFK` (`solicitanteFK`),
  KEY `lugarFK` (`lugarFK`),
  CONSTRAINT `tarefas_ibfk_1` FOREIGN KEY (`solicitanteFK`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `tarefas_ibfk_2` FOREIGN KEY (`lugarFK`) REFERENCES `locais` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarefas`
--

LOCK TABLES `tarefas` WRITE;
/*!40000 ALTER TABLE `tarefas` DISABLE KEYS */;
INSERT INTO `tarefas` VALUES (1,'Trocas Mouses','Trocar Mouses com fio por Wireless','2023-06-06 01:07:46','2023-06-08',2,5),(2,'Instalar caixas de Som','Fazer instalação das novas caixas de som','2023-06-06 01:07:46','2023-06-20',4,2),(3,'Colocar novas Morsas','Trocar as Morsas antigas pelas novas nas bancadas','2023-06-06 01:07:46','2023-06-15',3,4),(4,'Arrumar Multímeltros','Trocar os fusíveis dos Multímetros Queimados','2023-06-06 01:07:46','2023-06-10',5,1);
/*!40000 ALTER TABLE `tarefas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-06  2:13:46
