CREATE DATABASE gestao_venda;

use gestao_venda;

CREATE TABLE `categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `descricao` (`descricao`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `produto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(60) NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `categoria_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nome` (`nome`),
  KEY `categoria_fk_id` (`categoria_id`),
  CONSTRAINT `categoria_fk_id` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `cliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(70) DEFAULT NULL,
  `bi` varchar(15) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `venda` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_criacao` datetime DEFAULT CURRENT_TIMESTAMP,
  `valor` decimal(10,2) NOT NULL,
  `pago` tinyint(1) NOT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cliente_fk_id` (`cliente_id`),
  CONSTRAINT `cliente_fk_id` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `item_venda` (
  `id` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL DEFAULT '1',
  `valor` decimal(10,2) DEFAULT NULL,
  `produto_id` int(11) NOT NULL,
  `venda_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `produto_fk_id` (`produto_id`),
  KEY `venda_fk_id` (`venda_id`),
  CONSTRAINT `produto_fk_id` FOREIGN KEY (`produto_id`) REFERENCES `produto` (`id`),
  CONSTRAINT `venda_fk_id` FOREIGN KEY (`venda_id`) REFERENCES `venda` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
