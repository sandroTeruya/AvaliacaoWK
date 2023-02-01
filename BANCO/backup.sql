-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: wk_prova
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Cidade` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `UF` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Jose Martins Ramos','Balneário Camboriú','SC'),(2,'Paulo Oliveira Lopes','Araguaína','TO'),(3,'Carlos Nunes Gomes','Parintins','AM'),(4,'Joao Garcia Costa','Abaetetuba','PA'),(5,'Fernanda Marques Barbosa','Santa Catarina','SC'),(6,'Juliana Lopes Martins','Manaus','AM'),(7,'Carlos Carvalho Moraes','Passo Fundo','RS'),(8,'José Costa Melo','Nossa Senhora do Socorro','SE'),(9,'Paulo Silva Souza','Palhoça','SC'),(10,'Lucas Monteiro Lima','Tangará da Serra','MT'),(11,'Maria Cardoso Moreira','Ariquemes','RO'),(12,'Juliana Melo Soares','Aracaju','SE'),(13,'Antônio Santos Carvalho','Aracaju','SE'),(14,'Antônio Barbosa Oliveira','Caruaru','PE'),(15,'Aline Marques Machado','Manaus','AM'),(16,'Marcos Vieira Martins','Maceió','AL'),(17,'Juliana Oliveira Moura','Parintins','AM'),(18,'Maria Oliveira Campos','Rio Branco','AC'),(19,'Lucas Nascimento Barros','Parnaíba','PI'),(20,'Adriana Freitas Moura','Parintins','AM');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dadosgerais`
--

DROP TABLE IF EXISTS `dadosgerais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dadosgerais` (
  `numero_pedido` int NOT NULL AUTO_INCREMENT,
  `dataEmissao` date NOT NULL,
  `codigoCliente` int NOT NULL,
  `valorTotal` decimal(20,2) NOT NULL,
  PRIMARY KEY (`numero_pedido`),
  KEY `FK_cliente_codigo_cliente` (`codigoCliente`),
  CONSTRAINT `FK_cliente_codigo_cliente` FOREIGN KEY (`codigoCliente`) REFERENCES `produto` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dadosgerais`
--

LOCK TABLES `dadosgerais` WRITE;
/*!40000 ALTER TABLE `dadosgerais` DISABLE KEYS */;
INSERT INTO `dadosgerais` VALUES (13,'2023-01-19',1,37.10),(18,'2023-01-19',5,148.40),(19,'2023-01-19',8,14.00),(20,'2023-01-19',1,55.65),(21,'2023-01-19',1,18.55),(22,'2023-01-19',2,18.55),(23,'2023-01-19',1,37.10),(24,'2023-01-19',2,14.00),(25,'2023-01-19',3,14.00),(26,'2023-01-20',1,74.66),(27,'2023-01-20',1,74.66),(28,'2023-01-20',1,48.66);
/*!40000 ALTER TABLE `dadosgerais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidoprodutos`
--

DROP TABLE IF EXISTS `pedidoprodutos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidoprodutos` (
  `codigoPedidoProduto` int NOT NULL AUTO_INCREMENT,
  `numeroPedido` int NOT NULL,
  `codigoProduto` int NOT NULL,
  `quantidade` int DEFAULT NULL,
  `vlrUnitario` decimal(20,2) DEFAULT NULL,
  `vlrTotal` decimal(20,2) DEFAULT NULL,
  PRIMARY KEY (`codigoPedidoProduto`),
  KEY `FK_dados_gerais_numero_pedido` (`numeroPedido`),
  KEY `FK_produto_codigo_produto` (`codigoProduto`),
  CONSTRAINT `FK_dados_gerais_numero_pedido` FOREIGN KEY (`numeroPedido`) REFERENCES `dadosgerais` (`numero_pedido`),
  CONSTRAINT `FK_produto_codigo_produto` FOREIGN KEY (`codigoProduto`) REFERENCES `produto` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidoprodutos`
--

LOCK TABLES `pedidoprodutos` WRITE;
/*!40000 ALTER TABLE `pedidoprodutos` DISABLE KEYS */;
INSERT INTO `pedidoprodutos` VALUES (1,26,5,5,8.00,40.00),(2,28,1,1,18.55,18.55),(3,28,2,2,7.00,14.00),(4,28,3,3,5.37,16.11);
/*!40000 ALTER TABLE `pedidoprodutos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `precoDeVenda` decimal(20,2) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,'Arroz 5 kg',18.55),(2,'Feijão 1 kg',7.00),(3,'Açucar 1 kg',5.37),(4,'Café 1 kg',15.99),(5,'Bolacha',8.00),(6,'Macarrão 1 kg',7.29),(7,'Molho de Tomate',6.99),(8,'Detergente',2.55),(9,'Milho',9.99),(10,'Banana',7.12),(11,'Chocolate',25.74),(12,'Papel Higiennico',23.69),(13,'Amaciante',35.22),(14,'Pipoca',4.89),(15,'Coca-Cola',11.48),(16,'Chiclete',0.65),(17,'Sal 1 kg',1.23),(18,'Leite 1 lt',3.61),(19,'Agua 2Lt',0.99),(20,'Shampoo',4.88);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-01 19:33:10
