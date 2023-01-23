-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           8.0.31 - MySQL Community Server - GPL
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.3.0.6589
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para wk_prova
CREATE DATABASE IF NOT EXISTS `wk_prova` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `wk_prova`;

-- Copiando estrutura para tabela wk_prova.cliente
CREATE TABLE IF NOT EXISTS `cliente` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Cidade` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `UF` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela wk_prova.cliente: ~20 rows (aproximadamente)
INSERT INTO `cliente` (`codigo`, `nome`, `Cidade`, `UF`) VALUES
	(1, 'Jose Martins Ramos', 'Balneário Camboriú', 'SC');
INSERT INTO `cliente` (`codigo`, `nome`, `Cidade`, `UF`) VALUES
	(2, 'Paulo Oliveira Lopes', 'Araguaína', 'TO');
INSERT INTO `cliente` (`codigo`, `nome`, `Cidade`, `UF`) VALUES
	(3, 'Carlos Nunes Gomes', 'Parintins', 'AM');
INSERT INTO `cliente` (`codigo`, `nome`, `Cidade`, `UF`) VALUES
	(4, 'Joao Garcia Costa', 'Abaetetuba', 'PA');
INSERT INTO `cliente` (`codigo`, `nome`, `Cidade`, `UF`) VALUES
	(5, 'Fernanda Marques Barbosa', 'Santa Catarina', 'SC');
INSERT INTO `cliente` (`codigo`, `nome`, `Cidade`, `UF`) VALUES
	(6, 'Juliana Lopes Martins', 'Manaus', 'AM');
INSERT INTO `cliente` (`codigo`, `nome`, `Cidade`, `UF`) VALUES
	(7, 'Carlos Carvalho Moraes', 'Passo Fundo', 'RS');
INSERT INTO `cliente` (`codigo`, `nome`, `Cidade`, `UF`) VALUES
	(8, 'José Costa Melo', 'Nossa Senhora do Socorro', 'SE');
INSERT INTO `cliente` (`codigo`, `nome`, `Cidade`, `UF`) VALUES
	(9, 'Paulo Silva Souza', 'Palhoça', 'SC');
INSERT INTO `cliente` (`codigo`, `nome`, `Cidade`, `UF`) VALUES
	(10, 'Lucas Monteiro Lima', 'Tangará da Serra', 'MT');
INSERT INTO `cliente` (`codigo`, `nome`, `Cidade`, `UF`) VALUES
	(11, 'Maria Cardoso Moreira', 'Ariquemes', 'RO');
INSERT INTO `cliente` (`codigo`, `nome`, `Cidade`, `UF`) VALUES
	(12, 'Juliana Melo Soares', 'Aracaju', 'SE');
INSERT INTO `cliente` (`codigo`, `nome`, `Cidade`, `UF`) VALUES
	(13, 'Antônio Santos Carvalho', 'Aracaju', 'SE');
INSERT INTO `cliente` (`codigo`, `nome`, `Cidade`, `UF`) VALUES
	(14, 'Antônio Barbosa Oliveira', 'Caruaru', 'PE');
INSERT INTO `cliente` (`codigo`, `nome`, `Cidade`, `UF`) VALUES
	(15, 'Aline Marques Machado', 'Manaus', 'AM');
INSERT INTO `cliente` (`codigo`, `nome`, `Cidade`, `UF`) VALUES
	(16, 'Marcos Vieira Martins', 'Maceió', 'AL');
INSERT INTO `cliente` (`codigo`, `nome`, `Cidade`, `UF`) VALUES
	(17, 'Juliana Oliveira Moura', 'Parintins', 'AM');
INSERT INTO `cliente` (`codigo`, `nome`, `Cidade`, `UF`) VALUES
	(18, 'Maria Oliveira Campos', 'Rio Branco', 'AC');
INSERT INTO `cliente` (`codigo`, `nome`, `Cidade`, `UF`) VALUES
	(19, 'Lucas Nascimento Barros', 'Parnaíba', 'PI');
INSERT INTO `cliente` (`codigo`, `nome`, `Cidade`, `UF`) VALUES
	(20, 'Adriana Freitas Moura', 'Parintins', 'AM');

-- Copiando estrutura para tabela wk_prova.dadosgerais
CREATE TABLE IF NOT EXISTS `dadosgerais` (
  `numero_pedido` int NOT NULL AUTO_INCREMENT,
  `dataEmissao` date NOT NULL,
  `codigoCliente` int NOT NULL,
  `valorTotal` decimal(20,2) NOT NULL,
  PRIMARY KEY (`numero_pedido`),
  KEY `FK_cliente_codigo_cliente` (`codigoCliente`),
  CONSTRAINT `FK_cliente_codigo_cliente` FOREIGN KEY (`codigoCliente`) REFERENCES `produto` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela wk_prova.dadosgerais: ~12 rows (aproximadamente)
INSERT INTO `dadosgerais` (`numero_pedido`, `dataEmissao`, `codigoCliente`, `valorTotal`) VALUES
	(13, '2023-01-19', 1, 37.10);
INSERT INTO `dadosgerais` (`numero_pedido`, `dataEmissao`, `codigoCliente`, `valorTotal`) VALUES
	(18, '2023-01-19', 5, 148.40);
INSERT INTO `dadosgerais` (`numero_pedido`, `dataEmissao`, `codigoCliente`, `valorTotal`) VALUES
	(19, '2023-01-19', 8, 14.00);
INSERT INTO `dadosgerais` (`numero_pedido`, `dataEmissao`, `codigoCliente`, `valorTotal`) VALUES
	(20, '2023-01-19', 1, 55.65);
INSERT INTO `dadosgerais` (`numero_pedido`, `dataEmissao`, `codigoCliente`, `valorTotal`) VALUES
	(21, '2023-01-19', 1, 18.55);
INSERT INTO `dadosgerais` (`numero_pedido`, `dataEmissao`, `codigoCliente`, `valorTotal`) VALUES
	(22, '2023-01-19', 2, 18.55);
INSERT INTO `dadosgerais` (`numero_pedido`, `dataEmissao`, `codigoCliente`, `valorTotal`) VALUES
	(23, '2023-01-19', 1, 37.10);
INSERT INTO `dadosgerais` (`numero_pedido`, `dataEmissao`, `codigoCliente`, `valorTotal`) VALUES
	(24, '2023-01-19', 2, 14.00);
INSERT INTO `dadosgerais` (`numero_pedido`, `dataEmissao`, `codigoCliente`, `valorTotal`) VALUES
	(25, '2023-01-19', 3, 14.00);
INSERT INTO `dadosgerais` (`numero_pedido`, `dataEmissao`, `codigoCliente`, `valorTotal`) VALUES
	(26, '2023-01-20', 1, 74.66);
INSERT INTO `dadosgerais` (`numero_pedido`, `dataEmissao`, `codigoCliente`, `valorTotal`) VALUES
	(27, '2023-01-20', 1, 74.66);
INSERT INTO `dadosgerais` (`numero_pedido`, `dataEmissao`, `codigoCliente`, `valorTotal`) VALUES
	(28, '2023-01-20', 1, 48.66);

-- Copiando estrutura para tabela wk_prova.pedidoprodutos
CREATE TABLE IF NOT EXISTS `pedidoprodutos` (
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

-- Copiando dados para a tabela wk_prova.pedidoprodutos: ~4 rows (aproximadamente)
INSERT INTO `pedidoprodutos` (`codigoPedidoProduto`, `numeroPedido`, `codigoProduto`, `quantidade`, `vlrUnitario`, `vlrTotal`) VALUES
	(1, 26, 5, 5, 8.00, 40.00);
INSERT INTO `pedidoprodutos` (`codigoPedidoProduto`, `numeroPedido`, `codigoProduto`, `quantidade`, `vlrUnitario`, `vlrTotal`) VALUES
	(2, 28, 1, 1, 18.55, 18.55);
INSERT INTO `pedidoprodutos` (`codigoPedidoProduto`, `numeroPedido`, `codigoProduto`, `quantidade`, `vlrUnitario`, `vlrTotal`) VALUES
	(3, 28, 2, 2, 7.00, 14.00);
INSERT INTO `pedidoprodutos` (`codigoPedidoProduto`, `numeroPedido`, `codigoProduto`, `quantidade`, `vlrUnitario`, `vlrTotal`) VALUES
	(4, 28, 3, 3, 5.37, 16.11);

-- Copiando estrutura para tabela wk_prova.produto
CREATE TABLE IF NOT EXISTS `produto` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `precoDeVenda` decimal(20,2) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela wk_prova.produto: ~17 rows (aproximadamente)
INSERT INTO `produto` (`codigo`, `descricao`, `precoDeVenda`) VALUES
	(1, 'Arroz 5 kg', 18.55);
INSERT INTO `produto` (`codigo`, `descricao`, `precoDeVenda`) VALUES
	(2, 'Feijão 1 kg', 7.00);
INSERT INTO `produto` (`codigo`, `descricao`, `precoDeVenda`) VALUES
	(3, 'Açucar 1 kg', 5.37);
INSERT INTO `produto` (`codigo`, `descricao`, `precoDeVenda`) VALUES
	(4, 'Café 1 kg', 15.99);
INSERT INTO `produto` (`codigo`, `descricao`, `precoDeVenda`) VALUES
	(5, 'Bolacha', 8.00);
INSERT INTO `produto` (`codigo`, `descricao`, `precoDeVenda`) VALUES
	(6, 'Macarrão 1 kg', 7.29);
INSERT INTO `produto` (`codigo`, `descricao`, `precoDeVenda`) VALUES
	(7, 'Molho de Tomate', 6.99);
INSERT INTO `produto` (`codigo`, `descricao`, `precoDeVenda`) VALUES
	(8, 'Detergente', 2.55);
INSERT INTO `produto` (`codigo`, `descricao`, `precoDeVenda`) VALUES
	(9, 'Milho', 9.99);
INSERT INTO `produto` (`codigo`, `descricao`, `precoDeVenda`) VALUES
	(10, 'Banana', 7.12);
INSERT INTO `produto` (`codigo`, `descricao`, `precoDeVenda`) VALUES
	(11, 'Chocolate', 25.74);
INSERT INTO `produto` (`codigo`, `descricao`, `precoDeVenda`) VALUES
	(12, 'Papel Higiennico', 23.69);
INSERT INTO `produto` (`codigo`, `descricao`, `precoDeVenda`) VALUES
	(13, 'Amaciante', 35.22);
INSERT INTO `produto` (`codigo`, `descricao`, `precoDeVenda`) VALUES
	(14, 'Pipoca', 4.89);
INSERT INTO `produto` (`codigo`, `descricao`, `precoDeVenda`) VALUES
	(15, 'Coca-Cola', 11.48);
INSERT INTO `produto` (`codigo`, `descricao`, `precoDeVenda`) VALUES
	(16, 'Chiclete', 0.65);
INSERT INTO `produto` (`codigo`, `descricao`, `precoDeVenda`) VALUES
	(17, 'Sal 1 kg', 1.23);
INSERT INTO `produto` (`codigo`, `descricao`, `precoDeVenda`) VALUES
	(18, 'Leite 1 lt', 3.61);
INSERT INTO `produto` (`codigo`, `descricao`, `precoDeVenda`) VALUES
	(19, 'Agua 2Lt', 0.99);
INSERT INTO `produto` (`codigo`, `descricao`, `precoDeVenda`) VALUES
	(20, 'Shampoo', 4.88);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
