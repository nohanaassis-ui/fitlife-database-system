-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: fitlife_db
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `agendamentos_aulas`
--

DROP TABLE IF EXISTS `agendamentos_aulas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agendamentos_aulas` (
  `id_aluno` int NOT NULL,
  `id_modalidade` int NOT NULL,
  `data_reserva` datetime NOT NULL,
  PRIMARY KEY (`id_aluno`,`id_modalidade`),
  KEY `id_modalidade` (`id_modalidade`),
  CONSTRAINT `agendamentos_aulas_ibfk_1` FOREIGN KEY (`id_aluno`) REFERENCES `alunos` (`id_aluno`) ON DELETE CASCADE,
  CONSTRAINT `agendamentos_aulas_ibfk_2` FOREIGN KEY (`id_modalidade`) REFERENCES `modalidades_aulas` (`id_modalidade`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agendamentos_aulas`
--

LOCK TABLES `agendamentos_aulas` WRITE;
/*!40000 ALTER TABLE `agendamentos_aulas` DISABLE KEYS */;
INSERT INTO `agendamentos_aulas` VALUES (1,1,'2026-03-01 14:00:00'),(2,1,'2026-03-01 15:30:00'),(2,3,'2026-03-01 16:00:00'),(3,2,'2026-03-01 18:20:00'),(4,4,'2026-03-02 10:15:00'),(5,5,'2026-03-02 11:00:00');
/*!40000 ALTER TABLE `agendamentos_aulas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alunos`
--

DROP TABLE IF EXISTS `alunos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alunos` (
  `id_aluno` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `data_nascimento` date NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_aluno`),
  UNIQUE KEY `cpf` (`cpf`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alunos`
--

LOCK TABLES `alunos` WRITE;
/*!40000 ALTER TABLE `alunos` DISABLE KEYS */;
INSERT INTO `alunos` VALUES (1,'Lucas Gabriel Andrade','111.222.333-01','1995-04-12','(11) 98765-1111','lucas.andrade@email.com'),(2,'Camila Rodrigues Santos','222.333.444-02','2001-08-25','(11) 97654-2222','camila.rodrigues@email.com'),(3,'Bruno Oliveira Ferraz','333.444.555-03','1988-12-03','(21) 96543-3333','bruno.ferraz@email.com'),(4,'Beatriz Mendes Castro','444.555.666-04','1999-01-15','(31) 95432-4444','beatriz.castro@email.com'),(5,'Rafael Costa Souza','555.666.777-05','2003-06-30','(11) 94321-5555','rafael.souza@email.com');
/*!40000 ALTER TABLE `alunos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avaliacoes_fisicas`
--

DROP TABLE IF EXISTS `avaliacoes_fisicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `avaliacoes_fisicas` (
  `id_avaliacao` int NOT NULL AUTO_INCREMENT,
  `data_avaliacao` date NOT NULL,
  `peso` decimal(5,2) NOT NULL,
  `percentual_gordura` decimal(4,2) DEFAULT NULL,
  `id_aluno` int NOT NULL,
  `id_instrutor` int NOT NULL,
  PRIMARY KEY (`id_avaliacao`),
  KEY `id_aluno` (`id_aluno`),
  KEY `id_instrutor` (`id_instrutor`),
  CONSTRAINT `avaliacoes_fisicas_ibfk_1` FOREIGN KEY (`id_aluno`) REFERENCES `alunos` (`id_aluno`) ON DELETE CASCADE,
  CONSTRAINT `avaliacoes_fisicas_ibfk_2` FOREIGN KEY (`id_instrutor`) REFERENCES `instrutores` (`id_instrutor`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avaliacoes_fisicas`
--

LOCK TABLES `avaliacoes_fisicas` WRITE;
/*!40000 ALTER TABLE `avaliacoes_fisicas` DISABLE KEYS */;
INSERT INTO `avaliacoes_fisicas` VALUES (1,'2026-01-12',82.50,22.40,1,1),(2,'2026-01-05',61.20,18.50,2,5),(3,'2026-02-16',94.00,26.10,3,1),(4,'2026-03-02',58.00,15.20,4,3),(5,'2026-02-02',76.80,19.80,5,5);
/*!40000 ALTER TABLE `avaliacoes_fisicas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instrutores`
--

DROP TABLE IF EXISTS `instrutores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instrutores` (
  `id_instrutor` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `cref` varchar(20) NOT NULL,
  `especialidade` varchar(50) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_instrutor`),
  UNIQUE KEY `cref` (`cref`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instrutores`
--

LOCK TABLES `instrutores` WRITE;
/*!40000 ALTER TABLE `instrutores` DISABLE KEYS */;
INSERT INTO `instrutores` VALUES (1,'Prof. Fernando Dias','CREF 012345-G/SP','Musculação e Hipertrofia','(11) 91111-0001'),(2,'Profa. Juliana Martinez','CREF 023456-G/SP','Spinning e Cardiorrespiratório','(11) 92222-0002'),(3,'Prof. Marcelo Silva','CREF 034567-G/RJ','Pilates e Reabilitação','(21) 93333-0003'),(4,'Profa. Patricia Lima','CREF 045678-G/MG','FitDance e Zumba','(31) 94444-0004'),(5,'Prof. Thiago Alves','CREF 056789-G/SP','Treinamento Funcional','(11) 95555-0005');
/*!40000 ALTER TABLE `instrutores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matriculas`
--

DROP TABLE IF EXISTS `matriculas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matriculas` (
  `id_matricula` int NOT NULL AUTO_INCREMENT,
  `data_inicio` date NOT NULL,
  `data_vencimento` date NOT NULL,
  `status_pagamento` varchar(20) NOT NULL,
  `id_aluno` int NOT NULL,
  `id_plano` int NOT NULL,
  PRIMARY KEY (`id_matricula`),
  KEY `id_aluno` (`id_aluno`),
  KEY `id_plano` (`id_plano`),
  CONSTRAINT `matriculas_ibfk_1` FOREIGN KEY (`id_aluno`) REFERENCES `alunos` (`id_aluno`) ON DELETE CASCADE,
  CONSTRAINT `matriculas_ibfk_2` FOREIGN KEY (`id_plano`) REFERENCES `planos` (`id_plano`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matriculas`
--

LOCK TABLES `matriculas` WRITE;
/*!40000 ALTER TABLE `matriculas` DISABLE KEYS */;
INSERT INTO `matriculas` VALUES (1,'2026-01-10','2026-02-10','Atrasado',1,1),(2,'2026-01-01','2026-04-01','Em Dia',2,2),(3,'2026-02-15','2026-08-15','Em Dia',3,3),(4,'2026-03-01','2027-03-01','Em Dia',4,4),(5,'2026-02-01','2026-03-01','Atrasado',5,5);
/*!40000 ALTER TABLE `matriculas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modalidades_aulas`
--

DROP TABLE IF EXISTS `modalidades_aulas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modalidades_aulas` (
  `id_modalidade` int NOT NULL AUTO_INCREMENT,
  `nome_aula` varchar(50) NOT NULL,
  `horario` datetime NOT NULL,
  `vagas_maximas` int NOT NULL,
  `id_instrutor` int NOT NULL,
  PRIMARY KEY (`id_modalidade`),
  KEY `id_instrutor` (`id_instrutor`),
  CONSTRAINT `modalidades_aulas_ibfk_1` FOREIGN KEY (`id_instrutor`) REFERENCES `instrutores` (`id_instrutor`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modalidades_aulas`
--

LOCK TABLES `modalidades_aulas` WRITE;
/*!40000 ALTER TABLE `modalidades_aulas` DISABLE KEYS */;
INSERT INTO `modalidades_aulas` VALUES (1,'Spinning Hard','2026-03-02 07:00:00',15,2),(2,'Pilates Solo','2026-03-02 09:00:00',10,3),(3,'FitDance Animado','2026-03-02 18:30:00',25,4),(4,'Funcional HIIT','2026-03-03 08:00:00',12,5),(5,'Musculação Guiada','2026-03-03 10:00:00',20,1);
/*!40000 ALTER TABLE `modalidades_aulas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planos`
--

DROP TABLE IF EXISTS `planos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `planos` (
  `id_plano` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `duracao_meses` int NOT NULL,
  `valor_mensal` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_plano`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planos`
--

LOCK TABLES `planos` WRITE;
/*!40000 ALTER TABLE `planos` DISABLE KEYS */;
INSERT INTO `planos` VALUES (1,'Mensal Bronze',1,120.00),(2,'Trimestral Prata',3,105.00),(3,'Semestral Ouro',6,95.00),(4,'Anual VIP Black',12,80.00),(5,'Plano Recorrente Student',1,70.00);
/*!40000 ALTER TABLE `planos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-30  8:53:19
