-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           8.0.30 - MySQL Community Server - GPL
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para pizzaria
CREATE DATABASE IF NOT EXISTS `pizzaria` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `pizzaria`;

-- Copiando estrutura para tabela pizzaria.categorias
CREATE TABLE IF NOT EXISTS `categorias` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `categoria_nome` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela pizzaria.categorias: ~9 rows (aproximadamente)
INSERT INTO `categorias` (`id`, `categoria_nome`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Pizzas', '2023-11-15 20:11:44', '2023-11-26 21:35:51', NULL),
	(2, 'Pizzas Doces', '2023-11-15 20:11:47', '2023-11-15 20:11:47', NULL),
	(3, 'Sanduíches', '2023-11-15 20:11:50', '2023-11-15 20:11:50', NULL),
	(4, 'Panelinhas', '2023-11-15 20:11:52', '2023-11-15 20:11:52', NULL),
	(5, 'Pastéis', '2023-11-15 20:11:55', '2023-11-15 20:11:55', NULL),
	(6, 'Refrigerantes', '2023-11-15 20:11:57', '2023-11-15 20:11:57', NULL),
	(7, 'Sucos de Polpas', '2023-11-15 20:12:02', '2023-11-15 20:12:02', NULL),
	(8, 'Sucos Naturais', '2023-11-15 20:12:06', '2023-11-15 20:12:06', NULL),
	(9, 'Cervejas', '2023-11-15 20:12:09', '2023-11-15 20:12:09', NULL),
	(10, 'Sucos de Caixinha', '2023-11-26 20:50:24', '2023-11-26 20:50:24', NULL);

-- Copiando estrutura para tabela pizzaria.entregas
CREATE TABLE IF NOT EXISTS `entregas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela pizzaria.entregas: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela pizzaria.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela pizzaria.failed_jobs: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela pizzaria.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela pizzaria.migrations: ~9 rows (aproximadamente)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(30, '2014_10_12_000000_create_users_table', 1),
	(31, '2014_10_12_100000_create_password_reset_tokens_table', 1),
	(32, '2019_08_19_000000_create_failed_jobs_table', 1),
	(33, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(34, '2023_11_13_152036_create_permission_tables', 1),
	(35, '2023_11_15_150642_create_categorias_table', 1),
	(36, '2023_11_15_151232_create_entregas_table', 1),
	(37, '2023_11_15_151323_create_pagamentos_table', 1),
	(38, '2023_11_15_152037_create_produtos_table', 1);

-- Copiando estrutura para tabela pizzaria.model_has_permissions
CREATE TABLE IF NOT EXISTS `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela pizzaria.model_has_permissions: ~1 rows (aproximadamente)
INSERT INTO `model_has_permissions` (`permission_id`, `model_type`, `model_id`) VALUES
	(1, 'App\\Models\\User', 1);

-- Copiando estrutura para tabela pizzaria.model_has_roles
CREATE TABLE IF NOT EXISTS `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela pizzaria.model_has_roles: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela pizzaria.pagamentos
CREATE TABLE IF NOT EXISTS `pagamentos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela pizzaria.pagamentos: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela pizzaria.password_reset_tokens
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela pizzaria.password_reset_tokens: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela pizzaria.permissions
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela pizzaria.permissions: ~2 rows (aproximadamente)
INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
	(1, 'Admin', 'web', '2023-11-15 20:03:54', '2023-11-15 20:03:54'),
	(2, 'Funcionario', 'web', '2023-11-15 20:03:59', '2023-11-15 20:03:59'),
	(3, 'Cliente', 'web', '2023-11-15 20:04:02', '2023-11-15 20:04:02');

-- Copiando estrutura para tabela pizzaria.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela pizzaria.personal_access_tokens: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela pizzaria.produtos
CREATE TABLE IF NOT EXISTS `produtos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `produto_nome` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `produto_descricao` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `produto_categoria_id` bigint unsigned NOT NULL,
  `produto_tamanho` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `produto_preco_custo` decimal(7,2) DEFAULT NULL,
  `produto_preco_venda` decimal(7,2) NOT NULL,
  `produto_foto` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `produtos_produto_categoria_id_foreign` (`produto_categoria_id`),
  CONSTRAINT `produtos_produto_categoria_id_foreign` FOREIGN KEY (`produto_categoria_id`) REFERENCES `categorias` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela pizzaria.produtos: ~49 rows (aproximadamente)
INSERT INTO `produtos` (`id`, `produto_nome`, `produto_descricao`, `produto_categoria_id`, `produto_tamanho`, `produto_preco_custo`, `produto_preco_venda`, `produto_foto`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, '3 Queijos', 'Molho, Mussarela, Catupiry e Cheddar.', 1, 'Média', 0.00, 50.00, '1701488381.jpg', '2023-11-15 20:20:00', '2023-12-02 03:39:41', NULL),
	(2, '3 Queijos', 'Molho, Mussarela, Catupiry e Cheddar.', 1, 'Grande', 20.00, 52.00, '1700079600.jpg', '2023-11-15 20:21:03', '2023-11-26 20:38:50', NULL),
	(4, 'A Moda Empório da Pizza', 'Molho, Muçarela, Frango com Palmito, Milho, Azeitona, Bacon, Presunto, Cebola e Tomate.', 1, 'Média', 0.00, 52.00, '1700532797.jpg', '2023-11-21 02:13:17', '2023-11-21 02:13:17', NULL),
	(5, 'A Moda Empório da Pizza', 'Molho, Muçarela, Frango com Palmito, Milho, Azeitona, Bacon, Presunto, Cebola e Tomate.', 1, 'Grande', 0.00, 58.00, '1700532824.jpg', '2023-11-21 02:13:44', '2023-11-26 20:38:57', NULL),
	(6, 'A moda Itália', 'Molho bolonhesa, Muçarela, Orégano e Cebola.', 1, 'Média', 0.00, 44.00, '1700532898.jpg', '2023-11-21 02:14:58', '2023-11-21 02:14:58', NULL),
	(7, 'A moda Itália', 'Molho bolonhesa, Muçarela, Orégano e Cebola.', 1, 'Grande', 0.00, 52.00, '1700532937.jpg', '2023-11-21 02:15:37', '2023-11-21 02:15:37', NULL),
	(8, 'Atum', 'Muçarela, Atum, Cebola, Azeitona, Tomate e Orégano.', 1, 'Média', 28.00, 46.00, '1700533015.jpg', '2023-11-21 02:16:55', '2023-11-26 20:35:43', NULL),
	(9, 'Atum', 'Muçarela, Atum, Cebola, Azeitona, Tomate e Orégano.', 1, 'Grande', 0.00, 52.00, '1700533049.jpg', '2023-11-21 02:17:29', '2023-11-21 02:17:29', NULL),
	(10, 'Calabresa', 'Molho, Muçarela, Calabresa e Cebola.', 1, 'Média', 0.00, 42.00, '1700533075.jpg', '2023-11-21 02:17:55', '2023-11-21 02:17:55', NULL),
	(12, 'Teste', 'testes', 3, 'Média', 0.00, 52.00, '1700792291.jpg', '2023-11-24 02:18:11', '2023-11-29 10:03:02', NULL),
	(13, 'X-Tudo', 'testes', 3, NULL, 0.00, 52.00, '1701250929.jpg', '2023-11-24 02:24:06', '2023-11-29 09:42:33', NULL),
	(14, 'apagar', 'sds', 1, NULL, 0.00, 52.00, NULL, '2023-11-24 02:51:58', '2023-12-02 03:39:09', '2023-12-02 03:39:09'),
	(15, 'Teste', NULL, 1, 'Grande', 0.00, 47.00, '1701255251.png', '2023-11-29 10:54:11', '2023-12-02 03:35:22', '2023-12-02 03:35:22'),
	(16, 'Calabresa', 'Molho, Muçarela, Calabresa e Cebola.', 1, 'Grande', 0.00, 47.00, '1701488182.jpg', '2023-12-02 03:36:22', '2023-12-02 03:36:22', NULL),
	(17, 'Calabresa Especial', 'Molho, Mussarela, Calabresa Cebola, Bacon, Tomate e Azeitona.', 1, 'Média', 0.00, 46.00, '1701488216.jpg', '2023-12-02 03:36:56', '2023-12-02 03:36:56', NULL),
	(18, 'Calabresa Especial', 'Molho, Mussarela, Calabresa Cebola, Bacon, Tomate e Azeitona', 1, 'Grande', 0.00, 52.00, '1701488240.jpg', '2023-12-02 03:37:20', '2023-12-02 03:37:20', NULL),
	(19, 'Capixaba', 'Molho, Muçarela, Atum, Palmito, Azeitona, Tomate e Cebola.', 1, 'Média', 0.00, 47.00, '1701488310.jpg', '2023-12-02 03:38:30', '2023-12-02 03:38:30', NULL),
	(20, 'Capixaba', 'Molho, Muçarela, Atum, Palmito, Azeitona, Tomate e Cebola.', 1, 'Grande', 0.00, 54.00, '1701488339.jpg', '2023-12-02 03:38:47', '2023-12-02 03:38:59', NULL),
	(21, 'Costela', 'Molho, Muçarela, Costela Bovina, Cheiro Verde, Cebola e Orégano.', 1, 'Média', 0.00, 52.00, '1701488597.jpeg', '2023-12-02 03:43:17', '2023-12-02 03:43:17', NULL),
	(22, 'Costela', 'Molho, Muçarela, Costela Bovina, Cheiro Verde, Cebola e Orégano.', 1, 'Grande', 0.00, 58.00, '1701488621.jpeg', '2023-12-02 03:43:41', '2023-12-02 03:43:41', NULL),
	(23, 'D’ Napoli', 'Molho, Mussarela, Bacon, Abacaxi, Cebola, Orégano e Azeitona.', 1, 'Média', 0.00, 46.00, '1701488820.jpg', '2023-12-02 03:47:00', '2023-12-02 03:48:03', NULL),
	(24, 'D’ Napoli', 'Molho, Mussarela, Bacon, Abacaxi, Cebola, Orégano e Azeitona', 1, 'Grande', 0.00, 52.00, '1701488839.jpg', '2023-12-02 03:47:19', '2023-12-02 03:48:13', NULL),
	(25, 'Diplomata', 'Molho, Mussarela, Presunto, Bacon e Uva Passa.', 1, 'Média', 0.00, 48.00, '1701489045.jpeg', '2023-12-02 03:49:11', '2023-12-02 03:50:45', NULL),
	(26, 'Diplomata', 'Molho, Mussarela, Presunto, Bacon e Uva Passa', 1, 'Grande', 0.00, 52.00, '1701488976.jpeg', '2023-12-02 03:49:36', '2023-12-02 03:49:36', NULL),
	(27, 'Frango com Bacon', 'Molho, Muçarela, Frango, Bacon e Cebola.', 1, 'Média', 0.00, 46.00, '1701489121.jpg', '2023-12-02 03:52:01', '2023-12-02 03:52:01', NULL),
	(28, 'Frango com Bacon', 'Molho, Muçarela, Frango, Bacon e Cebola.', 1, 'Grande', 0.00, 52.00, '1701489160.jpg', '2023-12-02 03:52:40', '2023-12-02 03:52:40', NULL),
	(29, 'Frango com Catupiry', 'Molho, Muçarela, Frango e Catupiry.', 1, 'Média', 0.00, 46.00, '1701489197.jpeg', '2023-12-02 03:53:17', '2023-12-02 03:53:17', NULL),
	(30, 'Frango com Catupiry', 'Molho, Muçarela, Frango e Catupiry.', 1, 'Grande', 0.00, 52.00, '1701489243.jpeg', '2023-12-02 03:54:03', '2023-12-02 03:56:25', NULL),
	(31, 'Fricassê de Frango', 'Molho, Muçarela, Frango, Catupiry, Creme de Leite, Milho e Batata Palha.', 1, 'Média', 0.00, 46.00, '1701489332.jpg', '2023-12-02 03:55:32', '2023-12-02 03:55:32', NULL),
	(32, 'Fricassê de Frango', 'Molho, Muçarela, Frango, Catupiry, Creme de Leite, Milho e Batata Palha.', 1, NULL, 0.00, 52.00, '1701489366.jpg', '2023-12-02 03:56:06', '2023-12-02 03:56:06', NULL),
	(33, 'Goiana', 'Molho, Muçarela, Presunto, Frango, Palmito, Azeitona, Milho, Tomate, Cebola, Calaresa, Bacon, Guariroba e Pequi.', 1, 'Média', 0.00, 55.00, '1701489451.jpg', '2023-12-02 03:57:31', '2023-12-02 03:57:31', NULL),
	(34, 'Goiana', 'Molho, Muçarela, Presunto, Frango, Palmito, Azeitona, Milho, Tomate, Cebola, Calaresa, Bacon, Guariroba e Pequi.', 1, 'Grande', 0.00, 61.00, '1701489479.jpg', '2023-12-02 03:57:59', '2023-12-02 03:57:59', NULL),
	(35, 'Lombinho', 'Molho, Muçarela, Lombinho Defumado, Tomate, Azeitona, Cebola e Orégano.', 1, 'Média', 0.00, 52.00, '1701489992.jpg', '2023-12-02 04:06:32', '2023-12-02 04:06:32', NULL),
	(36, 'Lombinho', 'Molho, Muçarela, Lombinho Defumado, Tomate, Azeitona, Cebola e Orégano.', 1, 'Grande', 0.00, 58.00, '1701490016.jpg', '2023-12-02 04:06:56', '2023-12-02 04:06:56', NULL),
	(37, 'Marguerita', 'Molho, Muçarela, Orégano, Parmesão e Tomate.', 1, 'Média', 0.00, 42.00, '1701490211.jpg', '2023-12-02 04:10:11', '2023-12-02 04:10:11', NULL),
	(38, 'Marguerita', 'Molho, Muçarela, Orégano, Parmesão e Tomate', 1, 'Grande', 0.00, 47.00, '1701490235.jpg', '2023-12-02 04:10:35', '2023-12-02 04:10:48', NULL),
	(39, 'Muçarela', 'Molho, Muçarela, Tomate e Orégano.', 1, 'Média', 0.00, 42.00, '1701490290.jpg', '2023-12-02 04:11:30', '2023-12-02 04:11:30', NULL),
	(40, 'Muçarela', 'Molho, Muçarela, Tomate e Orégano.', 1, 'Grande', 0.00, 47.00, '1701490334.jpg', '2023-12-02 04:12:14', '2023-12-02 04:12:14', NULL),
	(41, 'Napolitana', 'Molho de Tomate, Muçarela, Orégano e Palmito.', 1, 'Média', 0.00, 42.00, '1701490378.jpg', '2023-12-02 04:12:58', '2023-12-02 04:12:58', NULL),
	(42, 'Napolitana', 'Molho de Tomate, Muçarela, Orégano e Palmito.', 1, 'Grande', 0.00, 47.00, '1701490584.jpg', '2023-12-02 04:16:24', '2023-12-02 04:16:24', NULL),
	(43, 'Portuguesa', 'Molho, Muçarela, Presunto, Cebola, Ovo, Orégano, Ervilha, Palmito, Tomate, Pimentão e Azeitona.', 1, 'Média', 0.00, 47.00, '1701490427.png', '2023-12-02 04:13:47', '2023-12-02 04:13:47', NULL),
	(44, 'Portuguesa', 'Molho, Muçarela, Presunto, Cebola, Ovo, Orégano, Ervilha, Palmito, Tomate, Pimentão e Azeitona.', 1, 'Grande', 0.00, 54.00, '1701490460.png', '2023-12-02 04:14:20', '2023-12-02 04:14:41', NULL),
	(46, 'Brigadeiro', 'Calda doce, Chocolate e Granulado.', 2, 'Média', 0.00, 41.00, '1701490779.jpeg', '2023-12-02 04:19:39', '2023-12-02 04:19:39', NULL),
	(47, 'Brigadeiro', 'Calda doce, Chocolate e Granulado.', 2, 'Grande', 0.00, 44.00, '1701490858.jpeg', '2023-12-02 04:20:58', '2023-12-02 04:20:58', NULL),
	(48, 'Califórnia', 'Calda doce, Mussarela, Peito de peru, Abacaxi, Pêssego, Figo, Uva passa e Leite condensado.', 2, 'Média', 0.00, 43.00, '1701490983.jpg', '2023-12-02 04:23:03', '2023-12-02 04:23:47', NULL),
	(49, 'Califórnia', 'Calda doce, Mussarela, Peito de peru, Abacaxi, Pêssego, Figo, Uva passa e Leite condensado.', 2, 'Grande', 0.00, 46.00, '1701491016.jpg', '2023-12-02 04:23:36', '2023-12-02 04:23:36', NULL),
	(50, 'Cartola', 'Calda doce, Banana, Canela e Leite condensado.', 2, 'Média', 0.00, 38.00, '1701491114.jpg', '2023-12-02 04:25:14', '2023-12-02 04:25:53', NULL),
	(51, 'Cartola', 'Calda doce, Banana, Canela e Leite condensado.', 2, 'Grande', 0.00, 43.00, '1701491141.jpg', '2023-12-02 04:25:41', '2023-12-02 04:25:41', NULL),
	(52, 'M&MS', 'Calda doce, Mussarela, Chocolate e M&amp;MS.', 2, 'Média', 0.00, 39.00, '1701491216.jpg', '2023-12-02 04:26:56', '2023-12-02 04:27:36', NULL),
	(53, 'M&MS', 'Calda doce, Mussarela, Chocolate e M&MS', 2, 'Grande', 0.00, 42.00, '1701491243.jpg', '2023-12-02 04:27:23', '2023-12-02 04:27:23', NULL),
	(54, 'Moda Doce', 'Leite Condensado, Mussarela, Banana e Chocolate.', 2, 'Média', 0.00, 39.00, '1701491339.jpg', '2023-12-02 04:28:59', '2023-12-02 04:28:59', NULL),
	(55, 'Moda Doce', 'Leite Condensado, Mussarela, Banana e Chocolate', 2, 'Grande', 20.00, 42.00, '1701491372.jpg', '2023-12-02 04:29:32', '2023-12-02 04:29:32', NULL);

-- Copiando estrutura para tabela pizzaria.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela pizzaria.roles: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela pizzaria.role_has_permissions
CREATE TABLE IF NOT EXISTS `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela pizzaria.role_has_permissions: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela pizzaria.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela pizzaria.users: ~0 rows (aproximadamente)
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'GUILHERME MARINS DOS SANTOS', 'gui120599@gmail.com', NULL, '$2y$12$pE6oGD2Mdd9v2EAIofKvm.nrvSqFhElSn4xHRMA5bYRbRbFiXNGA2', NULL, '2023-11-15 20:10:47', '2023-11-15 20:10:47');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
