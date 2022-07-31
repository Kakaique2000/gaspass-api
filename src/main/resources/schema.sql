-- phpMyAdmin SQL Dump
-- version 4.6.6deb5ubuntu0.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: 30-Jul-2022 às 20:39
-- Versão do servidor: 5.7.36-0ubuntu0.18.04.1-log
-- PHP Version: 7.2.24-0ubuntu0.18.04.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gaspass`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `abastecimento`
--

CREATE TABLE `abastecimento` (
  `id` int(11) NOT NULL,
  `perfil_de_usuario_id` int(11) NOT NULL,
  `posto_id` int(11) NOT NULL,
  `veiculo_id` int(11) NOT NULL,
  `combustivel_id` int(11) NOT NULL,
  `trr_id` int(11) NOT NULL,
  `valor` double NOT NULL,
  `quantidade` double NOT NULL,
  `ppl` double NOT NULL,
  `hodometro` double NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `posto_cnpj` varchar(50) NOT NULL,
  `veiculo_placa` varchar(12) NOT NULL,
  `motorista_cpf` varchar(20) NOT NULL,
  `frentista_identificacao` varchar(50) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `abastecimentoTrr`
--

CREATE TABLE `abastecimentoTrr` (
  `id` int(11) NOT NULL,
  `veiculo_id` int(11) NOT NULL,
  `tag` varchar(255) NOT NULL,
  `litros` varchar(11) NOT NULL,
  `litros_sem_tag` varchar(11) NOT NULL COMMENT 'litros registrados sem a tag próxima ao bico',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `assinaturas`
--

CREATE TABLE `assinaturas` (
  `id` int(11) NOT NULL,
  `perfil_de_usuario_id` int(11) NOT NULL,
  `grupo_usuario_id` int(11) NOT NULL DEFAULT '0',
  `status` varchar(255) DEFAULT NULL,
  `codigo_transacao` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `assinaturas_desconto`
--

CREATE TABLE `assinaturas_desconto` (
  `id` int(11) NOT NULL,
  `codigo` varchar(255) DEFAULT NULL,
  `plano` varchar(255) NOT NULL,
  `valor` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `atendente`
--

CREATE TABLE `atendente` (
  `id` int(11) NOT NULL,
  `perfil_de_usuario_id` int(11) DEFAULT NULL,
  `comprador_id` int(11) DEFAULT NULL,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `atendente_grupo`
--

CREATE TABLE `atendente_grupo` (
  `atendente_id` int(11) DEFAULT NULL,
  `grupo_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `atendimento`
--

CREATE TABLE `atendimento` (
  `id` int(11) NOT NULL,
  `perfil_de_usuario_id` int(11) NOT NULL,
  `grupo_id` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `cpf` varchar(30) DEFAULT NULL,
  `telefone` varchar(155) DEFAULT NULL,
  `placa` varchar(20) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `endereco` text NOT NULL,
  `endereco_destino` varchar(255) DEFAULT NULL,
  `latitude_destino` double DEFAULT NULL,
  `longitude_destino` double DEFAULT NULL,
  `observacao_usuario` text,
  `finalizado_em` timestamp NULL DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `prestador_id` int(11) DEFAULT NULL,
  `prestador_longitude` double DEFAULT NULL,
  `prestador_latitude` double DEFAULT NULL,
  `prestador_datetime` timestamp NULL DEFAULT NULL,
  `distancia_destino` int(11) DEFAULT NULL,
  `tempo_destino` int(11) DEFAULT NULL,
  `distancia_prestador` int(11) DEFAULT NULL,
  `tempo_prestador` int(11) DEFAULT NULL,
  `servico_id` int(11) NOT NULL,
  `questionario` json DEFAULT NULL,
  `atendente_id` int(11) DEFAULT NULL,
  `valor` double NOT NULL DEFAULT '0',
  `valor_adicional` double NOT NULL DEFAULT '0',
  `geofence_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `datas` json DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `atendimento_carteira`
--

CREATE TABLE `atendimento_carteira` (
  `id` int(11) NOT NULL,
  `perfil_de_usuario_id` int(11) NOT NULL,
  `description` text,
  `comprador_id` int(11) DEFAULT NULL,
  `grupo_id` int(11) DEFAULT NULL,
  `tipo_id` int(11) NOT NULL,
  `transaction` varchar(255) DEFAULT NULL,
  `atendimento_id` int(11) DEFAULT NULL,
  `valor` double NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `atendimento_ponto_apoio`
--

CREATE TABLE `atendimento_ponto_apoio` (
  `id` int(11) NOT NULL,
  `nome_razao_social` varchar(245) NOT NULL,
  `cpf_cnpj` varchar(15) NOT NULL,
  `pagamento` int(11) NOT NULL,
  `tipo_conta` int(11) NOT NULL,
  `banco` varchar(3) NOT NULL,
  `agencia` varchar(20) NOT NULL,
  `conta` varchar(20) NOT NULL,
  `endereco` varchar(245) DEFAULT NULL,
  `cidade` varchar(245) DEFAULT NULL,
  `estado` varchar(5) DEFAULT NULL,
  `responsavel` varchar(245) DEFAULT NULL,
  `telefone` varchar(25) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `zoop_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `atendimento_prestador`
--

CREATE TABLE `atendimento_prestador` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `prestador_email` varchar(255) DEFAULT NULL,
  `prestador_telefone` varchar(255) DEFAULT NULL,
  `id_ponto_apoio` int(11) DEFAULT NULL,
  `id_tracker` varchar(255) NOT NULL,
  `servicos` json NOT NULL,
  `cpf` varchar(14) DEFAULT NULL,
  `modelo` varchar(20) DEFAULT NULL,
  `placa` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `atendimento_questionario`
--

CREATE TABLE `atendimento_questionario` (
  `id` int(11) NOT NULL,
  `pergunta` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `atendimento_servicos`
--

CREATE TABLE `atendimento_servicos` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `destination` int(11) NOT NULL DEFAULT '0',
  `description` varchar(512) DEFAULT NULL,
  `ordem` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `atendimento_valor`
--

CREATE TABLE `atendimento_valor` (
  `id` int(11) NOT NULL,
  `regiao` int(11) NOT NULL,
  `tipo_servico` int(11) NOT NULL,
  `tipo_cliente` int(11) DEFAULT NULL,
  `valor` double NOT NULL,
  `distancia_max` double DEFAULT NULL,
  `valor_adicional` double DEFAULT NULL,
  `valor_prestador` double NOT NULL,
  `valor_prestador_adicional` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `b2b_cliente`
--

CREATE TABLE `b2b_cliente` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `cnpj` char(24) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `b2b_combustivel`
--

CREATE TABLE `b2b_combustivel` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `codigo` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `b2b_cotacao`
--

CREATE TABLE `b2b_cotacao` (
  `id` int(11) NOT NULL,
  `b2b_cliente_id` int(11) NOT NULL,
  `b2b_combustivel_id` int(11) DEFAULT NULL,
  `ppl_min` double DEFAULT NULL,
  `ppl_max` double DEFAULT NULL,
  `quantidade` double DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `b2b_distribuidora`
--

CREATE TABLE `b2b_distribuidora` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `b2b_oferta`
--

CREATE TABLE `b2b_oferta` (
  `id` int(11) NOT NULL,
  `b2b_distribuidora_id` int(11) DEFAULT NULL,
  `combustivel_id` int(11) DEFAULT NULL,
  `ppl` double DEFAULT NULL,
  `quantidade` double DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `b2b_proposta`
--

CREATE TABLE `b2b_proposta` (
  `id` int(11) NOT NULL,
  `b2b_cliente_id` int(11) DEFAULT NULL,
  `b2b_distribuidora_id` int(11) DEFAULT NULL,
  `b2b_cotacao_id` int(11) DEFAULT NULL,
  `ppl` double DEFAULT NULL,
  `quantidade` double DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `b2b_venda`
--

CREATE TABLE `b2b_venda` (
  `id` int(11) NOT NULL,
  `b2b_proposta_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `bairro`
--

CREATE TABLE `bairro` (
  `id` int(11) NOT NULL,
  `cidade_id` int(11) NOT NULL,
  `geocode_id` int(11) DEFAULT NULL,
  `nome` varchar(255) NOT NULL,
  `nome_anp` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `bandeira`
--

CREATE TABLE `bandeira` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `nome_anp` varchar(45) NOT NULL,
  `logo` varchar(45) DEFAULT 'gaspass.png',
  `descricao` varchar(45) DEFAULT NULL,
  `bg_color` varchar(10) NOT NULL DEFAULT '#161925',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `carteira`
--

CREATE TABLE `carteira` (
  `id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `internal_description` varchar(512) DEFAULT NULL,
  `transaction` varchar(512) DEFAULT NULL,
  `ticket_id` int(11) DEFAULT NULL,
  `rede_posto_id` int(11) DEFAULT NULL,
  `comprador_id` int(11) DEFAULT NULL,
  `grupo_usuario_id` int(11) DEFAULT NULL,
  `perfil_de_usuario_id` int(11) DEFAULT NULL,
  `valor` double NOT NULL DEFAULT '0',
  `tipo` int(11) NOT NULL DEFAULT '1',
  `status` int(11) DEFAULT '0' COMMENT '0 pendente | 1 concluido',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `url` text,
  `number` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `carteira_status`
--

CREATE TABLE `carteira_status` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `carteira_tipo`
--

CREATE TABLE `carteira_tipo` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cidade`
--

CREATE TABLE `cidade` (
  `id` int(11) NOT NULL,
  `estado_id` int(11) NOT NULL,
  `geocode_id` int(11) DEFAULT NULL,
  `nome` varchar(255) NOT NULL,
  `nome_anp` varchar(255) NOT NULL,
  `tem_coleta_anp` tinyint(1) NOT NULL DEFAULT '0',
  `cod_anp` int(11) DEFAULT NULL,
  `id_ibge` int(11) DEFAULT NULL,
  `capital` tinyint(1) NOT NULL DEFAULT '0',
  `total_habitantes` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente_trr`
--

CREATE TABLE `cliente_trr` (
  `id` int(11) NOT NULL,
  `cnpj` char(15) NOT NULL,
  `razao_social` varchar(999) NOT NULL,
  `nome_fantasia` varchar(999) DEFAULT NULL,
  `Inscricao_estadual` char(99) NOT NULL,
  `telefone` char(15) NOT NULL,
  `estado_id` int(11) NOT NULL,
  `cidade_id` int(11) NOT NULL,
  `bairro_id` int(11) NOT NULL,
  `endereco` varchar(999) NOT NULL,
  `nome_responsavel` varchar(999) NOT NULL,
  `email` varchar(99) NOT NULL,
  `perfil_de_usuario_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cod_menor_preco_pr`
--

CREATE TABLE `cod_menor_preco_pr` (
  `id` int(11) NOT NULL,
  `cidade_id` int(11) DEFAULT NULL,
  `cod` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `combustivel`
--

CREATE TABLE `combustivel` (
  `id` int(11) NOT NULL,
  `nome` varchar(18) NOT NULL,
  `nome_anp` varchar(18) NOT NULL,
  `sigla` char(3) NOT NULL,
  `cod_anp` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `combustivel_trr`
--

CREATE TABLE `combustivel_trr` (
  `id` int(11) NOT NULL,
  `nome` varchar(99) NOT NULL,
  `sigla` char(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `comentario`
--

CREATE TABLE `comentario` (
  `id` int(11) NOT NULL,
  `posto_id` int(11) NOT NULL,
  `editor_id` int(11) DEFAULT NULL,
  `perfil_de_usuario_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `conteudo` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `comprador`
--

CREATE TABLE `comprador` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `perfil_de_usuario_id` int(11) NOT NULL,
  `saldo` double DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `desconto`
--

CREATE TABLE `desconto` (
  `id` int(11) NOT NULL,
  `perfil_de_usuario_id` int(11) DEFAULT NULL,
  `grupo_usuario_id` int(11) NOT NULL DEFAULT '0',
  `plano_id` int(11) NOT NULL DEFAULT '1',
  `posto_id` int(11) NOT NULL DEFAULT '0',
  `rede_posto_id` int(11) NOT NULL DEFAULT '0',
  `metodo_pagamento_id` int(11) NOT NULL DEFAULT '1',
  `tipo_desconto` int(2) NOT NULL DEFAULT '1' COMMENT '0 - Não definido   |   1 - Porcentagem   |   2 - Centavos  |  3 - valor fixo  |  4  -  pre pago',
  `valor` char(10) NOT NULL,
  `combustivel_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `email_avulso`
--

CREATE TABLE `email_avulso` (
  `id` int(11) NOT NULL,
  `email` varchar(299) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `empresas`
--

CREATE TABLE `empresas` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cnpj` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `razao_social` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome_fantasia` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `inscricao_estadual` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cep` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `endereco` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bairro` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cidade` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `complemento` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numero` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nome_responsavel` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `estado`
--

CREATE TABLE `estado` (
  `id` int(11) NOT NULL,
  `regiao_id` int(11) NOT NULL,
  `pais_id` int(11) NOT NULL DEFAULT '33',
  `geocode_id` int(11) DEFAULT NULL,
  `nome` varchar(255) NOT NULL,
  `nome_anp` varchar(255) NOT NULL,
  `sigla` varchar(30) DEFAULT NULL,
  `id_ibge` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `feed`
--

CREATE TABLE `feed` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `text` longtext,
  `image` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `tipo` int(11) NOT NULL COMMENT '1 - Imagem,2- Imagem com Texto, 3- Texto',
  `categoria_id` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `twitter` varchar(255) DEFAULT NULL,
  `push` varchar(512) DEFAULT NULL,
  `ordem` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `feed_categoria`
--

CREATE TABLE `feed_categoria` (
  `id` int(11) NOT NULL,
  `nome` varchar(99) NOT NULL,
  `comprador_id` int(11) NOT NULL DEFAULT '0' COMMENT '0 = TODOS',
  `grupo_usuario_id` int(11) DEFAULT NULL,
  `url` varchar(512) DEFAULT NULL,
  `telefone` varchar(50) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `feed_grupo`
--

CREATE TABLE `feed_grupo` (
  `id` int(11) NOT NULL,
  `feed_id` int(11) NOT NULL,
  `grupo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `forma_pagamento`
--

CREATE TABLE `forma_pagamento` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `forma` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `geocode`
--

CREATE TABLE `geocode` (
  `id` int(11) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `precisao` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `grupo_usuario`
--

CREATE TABLE `grupo_usuario` (
  `id` int(11) NOT NULL,
  `comprador_id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `codigo_indicacao` varchar(20) DEFAULT NULL,
  `grupo_usuario_validacao` json DEFAULT NULL,
  `product_name` varchar(128) NOT NULL DEFAULT 'Gaspass',
  `value_per_year` double NOT NULL DEFAULT '0',
  `telefone_contato` varchar(50) DEFAULT NULL,
  `img` varchar(512) DEFAULT NULL,
  `plan` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `exclusivo` int(11) DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `grupo_usuario_validacao`
--

CREATE TABLE `grupo_usuario_validacao` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `campo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Stand-in structure for view `ip_log_usage`
-- (See below for the actual view)
--
CREATE TABLE `ip_log_usage` (
`ip` varchar(50)
);

-- --------------------------------------------------------

--
-- Estrutura da tabela `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `linx_logs`
--

CREATE TABLE `linx_logs` (
  `lid` int(11) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `data` longblob,
  `date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `log`
--

CREATE TABLE `log` (
  `id` int(11) NOT NULL,
  `perfil_de_usuario_id` int(11) NOT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `HTTP_CLIENT_IP` varchar(50) DEFAULT NULL,
  `REMOTE_ADDR` varchar(50) DEFAULT NULL,
  `HTTP_X_FORWARDED_FOR` varchar(50) DEFAULT NULL,
  `rota` varchar(255) DEFAULT NULL,
  `lat` varchar(20) DEFAULT NULL,
  `lng` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `log_site`
--

CREATE TABLE `log_site` (
  `id` int(11) NOT NULL,
  `perfil_de_usuario_id` int(11) NOT NULL,
  `permissao_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `marca`
--

CREATE TABLE `marca` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `logo` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `merge_posto`
--

CREATE TABLE `merge_posto` (
  `id` int(11) NOT NULL,
  `new_posto` int(11) NOT NULL,
  `old_posto` int(11) NOT NULL,
  `perfil_de_usuario_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `metodo_pagamento`
--

CREATE TABLE `metodo_pagamento` (
  `id` int(11) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `modulo`
--

CREATE TABLE `modulo` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `rota` varchar(50) NOT NULL,
  `status` int(2) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `modulo_comprador`
--

CREATE TABLE `modulo_comprador` (
  `id` int(11) NOT NULL,
  `modulo_id` int(11) NOT NULL,
  `comprador_id` int(11) NOT NULL,
  `status` int(2) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `notificacao`
--

CREATE TABLE `notificacao` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `texto` varchar(255) DEFAULT NULL,
  `usuario_id` int(11) UNSIGNED NOT NULL,
  `grupo_usuario_id` int(11) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `notificacao_compra`
--

CREATE TABLE `notificacao_compra` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_user_create` int(11) NOT NULL,
  `id_trr` int(11) NOT NULL,
  `combustivel` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `valor` decimal(8,3) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `notificao_compra_pedidos`
--

CREATE TABLE `notificao_compra_pedidos` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_notificacao_compra` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pacote_ticket`
--

CREATE TABLE `pacote_ticket` (
  `id` int(11) NOT NULL,
  `comprador_id` int(11) NOT NULL,
  `grupo_usuario_id` int(11) NOT NULL,
  `rede_posto_id` int(11) NOT NULL DEFAULT '0',
  `posto_id` int(11) NOT NULL DEFAULT '0',
  `tipo_pacote_ticket_id` int(11) NOT NULL,
  `pagamento` int(11) NOT NULL DEFAULT '0',
  `limit_per_user` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `valid_until` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0.pendente 1.ativo 2.expirado 3.usado completamente',
  `nome` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pais`
--

CREATE TABLE `pais` (
  `id` int(11) NOT NULL,
  `codigo_ddi` int(11) NOT NULL,
  `codigo_iso` varchar(255) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `codigo_dinheiro` varchar(5) NOT NULL DEFAULT '$',
  `price_decimal_places` int(11) NOT NULL DEFAULT '2',
  `status` int(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `parceiro`
--

CREATE TABLE `parceiro` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `nome_exibicao` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedagio`
--

CREATE TABLE `pedagio` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `concessionaria` varchar(255) NOT NULL,
  `lng` decimal(10,8) DEFAULT NULL,
  `lat` decimal(10,8) DEFAULT NULL,
  `preco` float(10,2) NOT NULL,
  `cidade_id` int(5) NOT NULL,
  `estado_id` int(5) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(11) NOT NULL,
  `tipo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dia` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `combustivel_id` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `forma_pagamento_id` int(11) NOT NULL,
  `valor_minimo` double(8,3) NOT NULL,
  `valor_maximo` double(8,3) NOT NULL,
  `finalidade` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `perfil_de_usuario`
--

CREATE TABLE `perfil_de_usuario` (
  `id` int(11) NOT NULL,
  `sf_guard_user_id` int(11) NOT NULL DEFAULT '0',
  `nome` varchar(50) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `telefone` char(15) DEFAULT '(99) 99999-9999',
  `cpf` char(20) DEFAULT NULL,
  `data_nascimento` varchar(15) DEFAULT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  `bairro` varchar(255) DEFAULT NULL,
  `cep` int(11) DEFAULT NULL,
  `complemento` varchar(100) DEFAULT NULL,
  `numero` varchar(20) DEFAULT NULL,
  `cidade_id` int(11) DEFAULT NULL,
  `local_favorito` int(11) DEFAULT NULL,
  `postos_favoritos` varchar(110) DEFAULT NULL,
  `tipo_usuario_id` int(11) NOT NULL,
  `username` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `fcm_token` varchar(512) DEFAULT NULL,
  `uuid_firebase` varchar(255) DEFAULT NULL,
  `user_token` varchar(1024) DEFAULT NULL,
  `salt` varchar(128) DEFAULT NULL,
  `last_login` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lat` float DEFAULT NULL,
  `lng` float DEFAULT NULL,
  `mundipagg_customer_id` varchar(255) DEFAULT NULL,
  `webgestor_url` varchar(255) DEFAULT NULL,
  `webgestor_token` varchar(128) DEFAULT NULL,
  `webgestor_user` varchar(255) DEFAULT NULL,
  `webgestor_pass` varchar(255) DEFAULT NULL,
  `cod_cadastro` varchar(512) DEFAULT NULL,
  `app_version` varchar(10) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL DEFAULT '1',
  `posto_id` int(11) DEFAULT NULL,
  `cod_indicacao` varchar(255) DEFAULT NULL,
  `id_indicou` int(11) DEFAULT NULL,
  `grupo_selecionado` int(11) NOT NULL DEFAULT '1',
  `b2b_cliente_id` int(11) DEFAULT NULL,
  `b2b_distribuidora_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `perfil_de_usuario_grupo_usuario`
--

CREATE TABLE `perfil_de_usuario_grupo_usuario` (
  `id` int(11) NOT NULL,
  `perfil_de_usuario_id` int(11) NOT NULL,
  `grupo_usuario_id` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `permissao`
--

CREATE TABLE `permissao` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `permissao` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `plano`
--

CREATE TABLE `plano` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `minimo` int(11) DEFAULT NULL,
  `maximo` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `posto`
--

CREATE TABLE `posto` (
  `id` int(11) NOT NULL,
  `bairro_id` int(11) DEFAULT NULL,
  `cidade_id` int(11) NOT NULL,
  `estado_id` int(11) NOT NULL,
  `pais_id` int(11) NOT NULL DEFAULT '33',
  `regiao_id` int(11) NOT NULL,
  `bandeira_id` int(11) NOT NULL,
  `geocode_id` int(11) DEFAULT NULL,
  `lat_lng_original` varchar(100) DEFAULT NULL COMMENT 'Copia de segurança dos dados do geocode, por segurança pq agora os scripts atualizam a posição',
  `bandeira_fornecedor_id` int(11) DEFAULT NULL,
  `rede_posto_id` int(11) DEFAULT '1',
  `razao_social` varchar(100) NOT NULL,
  `razao_social_anp` varchar(100) DEFAULT NULL,
  `telefone` varchar(255) DEFAULT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  `endereco_anp` varchar(255) DEFAULT NULL,
  `cep` char(9) DEFAULT NULL,
  `ultimo_preco_gasolina` float DEFAULT NULL,
  `ultimo_preco_alcool` float DEFAULT NULL,
  `ultimo_preco_diesel` float DEFAULT NULL,
  `ultimo_preco_gnv` float DEFAULT NULL,
  `cnpj` char(18) DEFAULT NULL,
  `nome_fantasia` varchar(100) DEFAULT NULL,
  `nome_fantasia_anp` varchar(100) DEFAULT NULL,
  `preco_gasolina_id` int(11) DEFAULT NULL,
  `preco_alcool_id` int(11) DEFAULT NULL,
  `preco_diesel_id` int(11) DEFAULT NULL,
  `preco_gnv_id` int(11) DEFAULT NULL,
  `ultimo_editor_id` int(11) DEFAULT NULL,
  `parceiro_id` int(11) DEFAULT NULL,
  `perfil_de_usuario_id` int(11) NOT NULL,
  `data_preco_mais_recente` timestamp NULL DEFAULT NULL,
  `preco_diesel_s10_id` int(11) DEFAULT NULL,
  `ultimo_preco_diesel_s10` float DEFAULT NULL,
  `preco_gasolina_adt_id` int(11) DEFAULT NULL,
  `ultimo_preco_gasolina_adt` float DEFAULT NULL,
  `disponibilidade_combustivel` int(11) NOT NULL DEFAULT '1',
  `status` int(2) DEFAULT '1',
  `verificado` int(11) NOT NULL DEFAULT '0',
  `place_id` varchar(255) DEFAULT NULL,
  `anp_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `link_maps` varchar(1024) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Stand-in structure for view `postos_proximos`
-- (See below for the actual view)
--
CREATE TABLE `postos_proximos` (
`id` int(11)
,`cidade_id` int(11)
,`nome_fantasia` varchar(100)
,`razao_social` varchar(100)
,`nome_exibicao` varchar(100)
,`endereco` varchar(255)
,`verificado` int(11)
,`rede_posto_id` int(11)
,`status` int(2)
,`logo` varchar(45)
,`moeda` varchar(5)
,`casas_decimais` int(11)
,`latitude` double
,`longitude` double
,`p_gasolina` float
,`gasolina_id` int(11)
,`p_alcool` float
,`alcool_id` int(11)
,`p_diesel` float
,`diesel_id` int(11)
,`p_gnv` float
,`gnv_id` int(11)
,`p_diesel_s10` float
,`diesel_s10_id` int(11)
,`p_gasolina_aditivada` float
,`gasolina_aditivada_id` int(11)
,`updated` varchar(10)
);

-- --------------------------------------------------------

--
-- Estrutura da tabela `posto_importacao_parana`
--

CREATE TABLE `posto_importacao_parana` (
  `id` int(11) NOT NULL,
  `posto_id` int(11) NOT NULL,
  `codigo_estabelecimento` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `posto_integracao`
--

CREATE TABLE `posto_integracao` (
  `id` int(11) NOT NULL,
  `id_externo` int(11) DEFAULT NULL,
  `parceiro_id` int(11) NOT NULL,
  `cnpj` varchar(50) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `telefone` varchar(50) DEFAULT NULL,
  `bandeira` varchar(512) DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL,
  `estado_id` int(11) DEFAULT NULL,
  `cidade` varchar(50) DEFAULT NULL,
  `logradouro` varchar(255) DEFAULT NULL,
  `numero` varchar(10) DEFAULT NULL,
  `complemento` varchar(20) DEFAULT NULL,
  `bairro` varchar(50) DEFAULT NULL,
  `cep` varchar(20) DEFAULT NULL,
  `lat` float DEFAULT NULL,
  `lng` float DEFAULT NULL,
  `gasolina` varchar(1024) NOT NULL COMMENT 'json: valor,data_coleta,parceiro_id',
  `etanol` varchar(1024) NOT NULL COMMENT 'json: valor,data_coleta,parceiro_id',
  `diesel` varchar(1024) NOT NULL COMMENT 'json: valor,data_coleta,parceiro_id',
  `gnv` varchar(1024) NOT NULL COMMENT 'json: valor,data_coleta,parceiro_id',
  `diesel_s10` varchar(1024) NOT NULL COMMENT 'json: valor,data_coleta,parceiro_id',
  `gasolina_aditivada` varchar(1024) NOT NULL COMMENT 'json: valor,data_coleta,parceiro_id',
  `extras` varchar(4000) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `posto_nao_inserido`
--

CREATE TABLE `posto_nao_inserido` (
  `id` int(11) NOT NULL,
  `origem` varchar(255) DEFAULT NULL,
  `texto` json DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `posto_nao_inserido_anp`
--

CREATE TABLE `posto_nao_inserido_anp` (
  `id` int(11) NOT NULL,
  `razao_social` varchar(255) DEFAULT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  `bairro` varchar(255) DEFAULT NULL,
  `cidade_id` int(11) NOT NULL,
  `combustivel_id` int(11) NOT NULL,
  `preco` varchar(255) DEFAULT NULL,
  `data_coleta` varchar(255) DEFAULT NULL,
  `bandeira` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `posto_servico`
--

CREATE TABLE `posto_servico` (
  `id` int(11) NOT NULL,
  `posto_id` int(11) DEFAULT NULL,
  `servico_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `preco`
--

CREATE TABLE `preco` (
  `id` int(11) NOT NULL,
  `posto_id` int(11) NOT NULL,
  `combustivel_id` int(11) NOT NULL,
  `preco_compra` float DEFAULT NULL,
  `preco_venda` float DEFAULT NULL,
  `modalidade_compra` char(3) DEFAULT NULL,
  `editor_id` int(11) DEFAULT NULL,
  `perfil_de_usuario_id` int(11) NOT NULL,
  `data_coleta` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `variacao_preco_anterior` float DEFAULT NULL,
  `positive` int(11) NOT NULL DEFAULT '1',
  `negative` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `preco_avaliacao`
--

CREATE TABLE `preco_avaliacao` (
  `id` int(11) NOT NULL,
  `perfil_de_usuario_id` int(11) NOT NULL,
  `posto_id` int(11) NOT NULL,
  `preco_id` int(11) NOT NULL,
  `rate` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `rede_posto`
--

CREATE TABLE `rede_posto` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `perfil_de_usuario_id` int(11) NOT NULL,
  `usa_ticket` int(11) NOT NULL DEFAULT '0',
  `pais_id` int(11) NOT NULL,
  `status` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `regiao`
--

CREATE TABLE `regiao` (
  `id` int(11) NOT NULL,
  `pais_id` int(11) NOT NULL,
  `nome` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `response_code`
--

CREATE TABLE `response_code` (
  `id` int(11) NOT NULL,
  `code` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `user_message` varchar(512) NOT NULL,
  `user_message_pt` varchar(999) NOT NULL,
  `user_message_es` varchar(512) NOT NULL,
  `user_message_en` varchar(512) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `schema_info`
--

CREATE TABLE `schema_info` (
  `version` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `servico`
--

CREATE TABLE `servico` (
  `id` int(11) NOT NULL,
  `nome` varchar(999) NOT NULL,
  `nome_pt` varchar(999) NOT NULL,
  `nome_en` varchar(999) NOT NULL,
  `nome_es` varchar(999) NOT NULL,
  `grupo` int(3) NOT NULL DEFAULT '1',
  `icon` varchar(255) NOT NULL,
  `ordem` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `settings`
--

CREATE TABLE `settings` (
  `id` int(99) NOT NULL,
  `setting_name` varchar(256) CHARACTER SET latin1 NOT NULL,
  `setting_value` varchar(999) COLLATE latin1_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `sf_guard_user`
--

CREATE TABLE `sf_guard_user` (
  `id` int(11) NOT NULL,
  `username` varchar(128) NOT NULL,
  `algorithm` varchar(128) NOT NULL DEFAULT 'sha1',
  `salt` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT '1',
  `is_super_admin` tinyint(4) NOT NULL DEFAULT '0',
  `user_token` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `sinistro`
--

CREATE TABLE `sinistro` (
  `id` int(11) NOT NULL,
  `perfil_de_usuario_id` int(11) NOT NULL,
  `grupo_id` int(11) NOT NULL,
  `veiculo_id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `cpf` varchar(50) NOT NULL,
  `telefone` varchar(50) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `tipo_ocorrencia` int(11) NOT NULL,
  `relato` longtext NOT NULL,
  `foto_frente` varchar(255) DEFAULT NULL,
  `foto_traseira` varchar(255) DEFAULT NULL,
  `foto_esquerda` varchar(255) DEFAULT NULL,
  `foto_direita` varchar(255) DEFAULT NULL,
  `foto_adicional1` varchar(255) DEFAULT NULL,
  `foto_adicional2` varchar(255) DEFAULT NULL,
  `foto_adicional3` varchar(255) DEFAULT NULL,
  `foto_adicional4` varchar(255) DEFAULT NULL,
  `placa` varchar(20) NOT NULL,
  `marca_id` int(11) NOT NULL,
  `ano` varchar(20) NOT NULL,
  `chassi` varchar(255) NOT NULL,
  `modelo` varchar(255) NOT NULL,
  `cep` varchar(20) NOT NULL,
  `endereco` varchar(255) NOT NULL,
  `numero` varchar(50) NOT NULL,
  `complemento` varchar(255) DEFAULT NULL,
  `bairro` varchar(255) NOT NULL,
  `cidade` varchar(255) NOT NULL,
  `estado` varchar(255) NOT NULL,
  `terceiro` varchar(255) DEFAULT NULL,
  `nome_terceiro` varchar(255) DEFAULT NULL,
  `cpf_terceiro` int(255) DEFAULT NULL,
  `telefone_terceiro` varchar(255) DEFAULT NULL,
  `terceiro_marca_id` int(11) DEFAULT NULL,
  `terceiro_modelo` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `sugestao_alteracao_posto`
--

CREATE TABLE `sugestao_alteracao_posto` (
  `id` int(11) NOT NULL,
  `posto_id` int(11) NOT NULL,
  `perfil_de_usuario_id` int(11) NOT NULL,
  `cnpj` varchar(25) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `endereco` varchar(999) DEFAULT NULL,
  `bandeira_id` int(11) DEFAULT NULL,
  `geocode_id` int(11) DEFAULT NULL,
  `lat` float NOT NULL,
  `lng` float NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `sugestao_posto`
--

CREATE TABLE `sugestao_posto` (
  `id` int(11) NOT NULL,
  `perfil_de_usuario_id` int(11) NOT NULL DEFAULT '1',
  `posto_id` int(11) DEFAULT NULL,
  `bandeira_id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `endereco` varchar(512) NOT NULL,
  `google_address` varchar(1024) DEFAULT NULL,
  `lat` float NOT NULL,
  `lng` float NOT NULL,
  `gasolina` float NOT NULL DEFAULT '0',
  `alcool` float NOT NULL DEFAULT '0',
  `diesel` float NOT NULL DEFAULT '0',
  `gnv` float NOT NULL DEFAULT '0',
  `diesel_s10` float NOT NULL DEFAULT '0',
  `gasolina_adt` float NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tarefa_de_coleta`
--

CREATE TABLE `tarefa_de_coleta` (
  `id` int(11) NOT NULL,
  `data_inicio` datetime DEFAULT NULL,
  `data_fim` datetime DEFAULT NULL,
  `em_execucao` tinyint(1) DEFAULT NULL,
  `finalizado` tinyint(1) DEFAULT NULL,
  `intervalo` int(11) DEFAULT NULL,
  `codigo_semana` int(11) DEFAULT NULL,
  `indice_combustivel` int(11) DEFAULT NULL,
  `indice_regiao` int(11) DEFAULT NULL,
  `indice_estado` int(11) DEFAULT NULL,
  `indice_cidade` int(11) DEFAULT NULL,
  `indice_posto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `telefone_avulso`
--

CREATE TABLE `telefone_avulso` (
  `id` int(11) NOT NULL,
  `telefone` varchar(299) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `teste`
--

CREATE TABLE `teste` (
  `id` int(11) NOT NULL,
  `perfil_de_usuario_id` int(11) NOT NULL,
  `grupo_usuario_id` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ticket`
--

CREATE TABLE `ticket` (
  `id` int(11) NOT NULL,
  `pacote_ticket_id` int(11) NOT NULL,
  `desconto` float NOT NULL DEFAULT '0',
  `tipo_desconto` int(2) NOT NULL DEFAULT '0' COMMENT '0 - Não definido   |   1 - Porcentagem   |   2 - Centavos  |  3 - valor fixo  |  4  -  pre pago',
  `quantidade` double NOT NULL DEFAULT '0',
  `valor` double NOT NULL DEFAULT '0',
  `ppl` double NOT NULL DEFAULT '0',
  `ppl_corrigido` double NOT NULL DEFAULT '0',
  `valor_corrigido` double NOT NULL DEFAULT '0',
  `valor_desconto` double NOT NULL DEFAULT '0',
  `sf_guard_user_id` int(11) DEFAULT NULL,
  `perfil_de_usuario_id` int(11) DEFAULT NULL,
  `veiculo_id` int(11) DEFAULT NULL,
  `combustivel_id` int(11) NOT NULL DEFAULT '0',
  `codigo` char(9) DEFAULT NULL,
  `posto_id` int(11) DEFAULT '0',
  `rede_posto_id` int(11) DEFAULT NULL,
  `grupo_usuario_id` int(11) NOT NULL,
  `comprador_id` int(11) NOT NULL,
  `notificacao` varchar(512) DEFAULT NULL,
  `cpf_vendedor` varchar(50) DEFAULT NULL,
  `payment_token` varchar(512) DEFAULT NULL,
  `carteira_id` int(11) DEFAULT NULL,
  `refund` int(11) DEFAULT NULL,
  `status` int(2) NOT NULL DEFAULT '0' COMMENT '0 - utilizado   |   1 - Disponivel | 2 - Expirado | 3 - Pendente',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `valid_until` timestamp NULL DEFAULT NULL,
  `used_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_pacote_ticket`
--

CREATE TABLE `tipo_pacote_ticket` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `valor_unitario` varchar(100) NOT NULL DEFAULT '0.99',
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_ticket`
--

CREATE TABLE `tipo_ticket` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_usuario`
--

CREATE TABLE `tipo_usuario` (
  `id` int(11) NOT NULL,
  `nome` varchar(99) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_usuario_permissao`
--

CREATE TABLE `tipo_usuario_permissao` (
  `id` int(11) NOT NULL,
  `tipo_usuario_id` int(11) NOT NULL DEFAULT '0',
  `permissao_id` int(11) NOT NULL,
  `permitido` int(11) NOT NULL DEFAULT '0',
  `negado` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_veiculo`
--

CREATE TABLE `tipo_veiculo` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `transferencias`
--

CREATE TABLE `transferencias` (
  `id` int(11) NOT NULL,
  `valor` double NOT NULL,
  `posto_id` int(11) DEFAULT NULL,
  `rede_id` int(11) NOT NULL,
  `created_ad` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `transferencias_tickets`
--

CREATE TABLE `transferencias_tickets` (
  `ticket_id` int(11) NOT NULL,
  `transferencia_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `trr`
--

CREATE TABLE `trr` (
  `id` int(11) NOT NULL,
  `perfil_de_usuario_id` int(11) NOT NULL,
  `raiz_do_cnpj` varchar(21) NOT NULL,
  `razao_social` varchar(999) NOT NULL,
  `nome` varchar(999) NOT NULL,
  `endereco` varchar(999) NOT NULL,
  `bairro` varchar(999) DEFAULT NULL,
  `bairro_id` int(11) NOT NULL,
  `cidade` varchar(999) DEFAULT NULL,
  `cidade_id` int(11) NOT NULL,
  `estado` varchar(10) NOT NULL,
  `estado_id` int(11) NOT NULL,
  `cidade_atuante_id` int(11) NOT NULL,
  `numero` varchar(10) NOT NULL,
  `cep` varchar(10) NOT NULL,
  `complemento` varchar(255) DEFAULT NULL,
  `nome_responsavel` varchar(255) NOT NULL,
  `telefone` char(15) NOT NULL,
  `email` varchar(99) NOT NULL,
  `combustivel_trr_id` int(11) NOT NULL,
  `combustivel_id` int(11) DEFAULT '1',
  `preco` float DEFAULT NULL,
  `metodo_pagamento` varchar(299) DEFAULT 'a combinar',
  `status` varchar(99) NOT NULL,
  `password` varchar(250) NOT NULL DEFAULT '$2y$10$tejKJAAJVlGQBRE5.JgKLe39L9v9wvYVRhIiThGNTrWpO5QBS9Ybi',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `trr_abastecimento`
--

CREATE TABLE `trr_abastecimento` (
  `id` int(11) NOT NULL,
  `combustivel` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `trr_usuario_id` int(11) NOT NULL,
  `veiculo_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `trr_alerta`
--

CREATE TABLE `trr_alerta` (
  `id` int(11) NOT NULL,
  `trr_id` int(11) NOT NULL,
  `trr_cliente_tanque_id` int(11) NOT NULL,
  `mensagem` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `trr_carga`
--

CREATE TABLE `trr_carga` (
  `id` int(11) NOT NULL,
  `status` int(2) NOT NULL,
  `trr_usuario` int(11) NOT NULL,
  `combustivel` varchar(255) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `motorista_id` int(11) NOT NULL,
  `caminhao_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `trr_cliente_tanque`
--

CREATE TABLE `trr_cliente_tanque` (
  `id` int(11) NOT NULL,
  `NUMTANQ` varchar(255) DEFAULT NULL,
  `nome` varchar(255) NOT NULL,
  `trr_id` int(11) NOT NULL DEFAULT '0',
  `cliente_id` int(11) NOT NULL DEFAULT '0',
  `rastreador_id` int(11) NOT NULL DEFAULT '0',
  `parametroA` int(11) NOT NULL DEFAULT '0',
  `parametroB` int(11) NOT NULL DEFAULT '0',
  `parametroC` int(11) NOT NULL DEFAULT '0',
  `parametroD` int(11) DEFAULT NULL,
  `parametroE` int(11) DEFAULT NULL,
  `parametroF` int(11) DEFAULT NULL,
  `comprimento` int(11) DEFAULT NULL,
  `raio` int(11) DEFAULT NULL,
  `altura` int(11) DEFAULT NULL,
  `volume` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT CURRENT_TIMESTAMP,
  `tipo_tanque` varchar(20) DEFAULT 'horizontal'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `trr_combustivel_trr`
--

CREATE TABLE `trr_combustivel_trr` (
  `id` int(11) NOT NULL,
  `trr_id` int(11) NOT NULL,
  `combustivel_trr_id` int(11) NOT NULL,
  `preco` float NOT NULL,
  `quantidade_minima` int(7) NOT NULL,
  `quantidade_maxima` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `trr_pedido`
--

CREATE TABLE `trr_pedido` (
  `id` int(11) NOT NULL,
  `trr_id` int(11) NOT NULL,
  `trr_usuario_id` int(11) NOT NULL,
  `combustivel` varchar(255) NOT NULL DEFAULT 'Diesel',
  `quantidade` int(11) DEFAULT NULL,
  `status` int(2) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `trr_tanque`
--

CREATE TABLE `trr_tanque` (
  `id` int(11) NOT NULL,
  `trr` varchar(255) NOT NULL,
  `bico` int(11) NOT NULL,
  `ultimo_abastecimento` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `trr_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `trr_usuario`
--

CREATE TABLE `trr_usuario` (
  `id` int(11) NOT NULL,
  `perfil_de_usuario_id` int(11) NOT NULL DEFAULT '0',
  `trr_id` int(11) NOT NULL DEFAULT '0',
  `nome` varchar(255) NOT NULL,
  `CNPJ` varchar(20) NOT NULL,
  `razao_social` varchar(255) NOT NULL,
  `grupo` varchar(255) NOT NULL,
  `contato` varchar(20) NOT NULL,
  `endereco` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `user_cod_parceiro`
--

CREATE TABLE `user_cod_parceiro` (
  `id` int(11) NOT NULL,
  `cod` varchar(255) NOT NULL,
  `comprador_id` int(11) NOT NULL,
  `perfil_de_usuario_id` int(11) DEFAULT NULL,
  `grupo_usuario_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario_pos_atendente`
--

CREATE TABLE `usuario_pos_atendente` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `pin` varchar(255) DEFAULT NULL,
  `rede_posto_id` int(11) DEFAULT NULL,
  `posto_id` int(11) DEFAULT NULL,
  `cpf_vendedor` varchar(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `perfil_usuario_id` int(11) DEFAULT NULL,
  `tipo_usuario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `veiculo`
--

CREATE TABLE `veiculo` (
  `id` int(11) NOT NULL,
  `perfil_de_usuario_id` int(11) NOT NULL,
  `tipo_veiculo_id` int(11) DEFAULT '1',
  `marca_id` int(11) DEFAULT '1',
  `combustivel_id` int(11) DEFAULT '1',
  `modelo` varchar(255) DEFAULT 'Sedan',
  `volume_tanque` float NOT NULL DEFAULT '50',
  `hodometro` double DEFAULT NULL,
  `placa` char(10) NOT NULL DEFAULT 'xxx-9999',
  `ano` char(4) NOT NULL DEFAULT '1900',
  `cor` varchar(99) DEFAULT NULL,
  `chassi` varchar(255) DEFAULT NULL,
  `trr_id` int(11) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL,
  `status` int(2) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `webview_app`
--

CREATE TABLE `webview_app` (
  `id` int(11) NOT NULL,
  `grupo_usuario_id` int(11) NOT NULL,
  `nome` varchar(512) NOT NULL,
  `url` varchar(512) NOT NULL,
  `color` varchar(10) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure for view `ip_log_usage`
--
DROP TABLE IF EXISTS `ip_log_usage`;

CREATE ALGORITHM=UNDEFINED DEFINER=`gaspass`@`%` SQL SECURITY DEFINER VIEW `ip_log_usage`  AS  select `log`.`ip` AS `ip` from `log` group by `log`.`ip` having (count(`log`.`ip`) > 100) ;

-- --------------------------------------------------------

--
-- Structure for view `postos_proximos`
--
DROP TABLE IF EXISTS `postos_proximos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`gaspass`@`%` SQL SECURITY DEFINER VIEW `postos_proximos`  AS  select `posto`.`id` AS `id`,`posto`.`cidade_id` AS `cidade_id`,`posto`.`nome_fantasia` AS `nome_fantasia`,`posto`.`razao_social` AS `razao_social`,if((isnull(`posto`.`nome_fantasia`) or (`posto`.`nome_fantasia` = '')),`posto`.`razao_social`,`posto`.`nome_fantasia`) AS `nome_exibicao`,`posto`.`endereco` AS `endereco`,`posto`.`verificado` AS `verificado`,`posto`.`rede_posto_id` AS `rede_posto_id`,`posto`.`status` AS `status`,`bandeira`.`logo` AS `logo`,`pais`.`codigo_dinheiro` AS `moeda`,`pais`.`price_decimal_places` AS `casas_decimais`,`geocode`.`latitude` AS `latitude`,`geocode`.`longitude` AS `longitude`,`posto`.`ultimo_preco_gasolina` AS `p_gasolina`,`posto`.`preco_gasolina_id` AS `gasolina_id`,`posto`.`ultimo_preco_alcool` AS `p_alcool`,`posto`.`preco_alcool_id` AS `alcool_id`,`posto`.`ultimo_preco_diesel` AS `p_diesel`,`posto`.`preco_diesel_id` AS `diesel_id`,`posto`.`ultimo_preco_gnv` AS `p_gnv`,`posto`.`preco_gnv_id` AS `gnv_id`,`posto`.`ultimo_preco_diesel_s10` AS `p_diesel_s10`,`posto`.`preco_diesel_s10_id` AS `diesel_s10_id`,`posto`.`ultimo_preco_gasolina_adt` AS `p_gasolina_aditivada`,`posto`.`preco_gasolina_adt_id` AS `gasolina_aditivada_id`,date_format(`posto`.`data_preco_mais_recente`,'%Y-%m-%d') AS `updated` from (((`geocode` join `posto` on((`posto`.`geocode_id` = `geocode`.`id`))) join `bandeira` on((`posto`.`bandeira_id` = `bandeira`.`id`))) join `pais` on((`posto`.`pais_id` = `pais`.`id`))) where 1 order by `posto`.`id` desc ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `abastecimento`
--
ALTER TABLE `abastecimento`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `abastecimentoTrr`
--
ALTER TABLE `abastecimentoTrr`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assinaturas`
--
ALTER TABLE `assinaturas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assinaturas_desconto`
--
ALTER TABLE `assinaturas_desconto`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `atendente`
--
ALTER TABLE `atendente`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `atendimento`
--
ALTER TABLE `atendimento`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `atendimento_carteira`
--
ALTER TABLE `atendimento_carteira`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `atendimento_ponto_apoio`
--
ALTER TABLE `atendimento_ponto_apoio`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `atendimento_prestador`
--
ALTER TABLE `atendimento_prestador`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `atendimento_questionario`
--
ALTER TABLE `atendimento_questionario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `atendimento_servicos`
--
ALTER TABLE `atendimento_servicos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `atendimento_valor`
--
ALTER TABLE `atendimento_valor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_tipo_servico` (`tipo_servico`);

--
-- Indexes for table `b2b_cliente`
--
ALTER TABLE `b2b_cliente`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `b2b_combustivel`
--
ALTER TABLE `b2b_combustivel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `b2b_cotacao`
--
ALTER TABLE `b2b_cotacao`
  ADD PRIMARY KEY (`id`),
  ADD KEY `b2b_cliente_id` (`b2b_cliente_id`);

--
-- Indexes for table `b2b_distribuidora`
--
ALTER TABLE `b2b_distribuidora`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `b2b_oferta`
--
ALTER TABLE `b2b_oferta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `b2b_distribuidora_id` (`b2b_distribuidora_id`),
  ADD KEY `combustivel_id` (`combustivel_id`);

--
-- Indexes for table `b2b_proposta`
--
ALTER TABLE `b2b_proposta`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `b2b_venda`
--
ALTER TABLE `b2b_venda`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bairro`
--
ALTER TABLE `bairro`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_bairro_cidade` (`cidade_id`),
  ADD KEY `fi_nome_anp` (`nome_anp`),
  ADD KEY `fk_bairro_geocode` (`geocode_id`);

--
-- Indexes for table `bandeira`
--
ALTER TABLE `bandeira`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fi_nome_anp` (`nome_anp`);

--
-- Indexes for table `carteira`
--
ALTER TABLE `carteira`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_tipo_carteira` (`tipo`),
  ADD KEY `fk_status_carteira` (`status`);

--
-- Indexes for table `carteira_status`
--
ALTER TABLE `carteira_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carteira_tipo`
--
ALTER TABLE `carteira_tipo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cidade`
--
ALTER TABLE `cidade`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fi_id_ibge` (`id_ibge`),
  ADD KEY `fk_cidade_estado` (`estado_id`),
  ADD KEY `fi_tem_coleta_anp` (`tem_coleta_anp`),
  ADD KEY `fi_nome_anp` (`nome_anp`),
  ADD KEY `fi_capital` (`capital`),
  ADD KEY `fk_cidade_geocode` (`geocode_id`);

--
-- Indexes for table `cliente_trr`
--
ALTER TABLE `cliente_trr`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cod_menor_preco_pr`
--
ALTER TABLE `cod_menor_preco_pr`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `combustivel`
--
ALTER TABLE `combustivel`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fi_nome_anp` (`nome_anp`),
  ADD UNIQUE KEY `fi_sigla` (`sigla`);

--
-- Indexes for table `combustivel_trr`
--
ALTER TABLE `combustivel_trr`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comentario`
--
ALTER TABLE `comentario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comentario_FI_1` (`posto_id`),
  ADD KEY `comentario_FI_2` (`editor_id`);

--
-- Indexes for table `comprador`
--
ALTER TABLE `comprador`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `desconto`
--
ALTER TABLE `desconto`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_avulso`
--
ALTER TABLE `email_avulso`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `empresas`
--
ALTER TABLE `empresas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `empresas_email_unique` (`email`);

--
-- Indexes for table `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fi_nome_anp` (`nome_anp`),
  ADD UNIQUE KEY `fi_sigla` (`sigla`),
  ADD UNIQUE KEY `fi_id_ibge` (`id_ibge`),
  ADD KEY `fk_estado_regiao` (`regiao_id`),
  ADD KEY `fk_estado_geocode` (`geocode_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feed`
--
ALTER TABLE `feed`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feed_categoria`
--
ALTER TABLE `feed_categoria`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feed_grupo`
--
ALTER TABLE `feed_grupo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `forma_pagamento`
--
ALTER TABLE `forma_pagamento`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `geocode`
--
ALTER TABLE `geocode`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `grupo_usuario`
--
ALTER TABLE `grupo_usuario`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `grupo_usuario_validacao`
--
ALTER TABLE `grupo_usuario_validacao`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `linx_logs`
--
ALTER TABLE `linx_logs`
  ADD PRIMARY KEY (`lid`);

--
-- Indexes for table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_3` (`id`,`perfil_de_usuario_id`),
  ADD KEY `id` (`id`,`perfil_de_usuario_id`),
  ADD KEY `id_2` (`id`,`perfil_de_usuario_id`,`ip`,`created_at`);

--
-- Indexes for table `log_site`
--
ALTER TABLE `log_site`
  ADD PRIMARY KEY (`id`),
  ADD KEY `perfil_de_usuario_id` (`perfil_de_usuario_id`),
  ADD KEY `permissao_id` (`permissao_id`);

--
-- Indexes for table `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `merge_posto`
--
ALTER TABLE `merge_posto`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `metodo_pagamento`
--
ALTER TABLE `metodo_pagamento`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modulo`
--
ALTER TABLE `modulo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modulo_comprador`
--
ALTER TABLE `modulo_comprador`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notificacao`
--
ALTER TABLE `notificacao`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_notif` (`usuario_id`),
  ADD KEY `fk_notifi` (`grupo_usuario_id`);

--
-- Indexes for table `notificacao_compra`
--
ALTER TABLE `notificacao_compra`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notificao_compra_pedidos`
--
ALTER TABLE `notificao_compra_pedidos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `pacote_ticket`
--
ALTER TABLE `pacote_ticket`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pais`
--
ALTER TABLE `pais`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `parceiro`
--
ALTER TABLE `parceiro`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `pedagio`
--
ALTER TABLE `pedagio`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `perfil_de_usuario`
--
ALTER TABLE `perfil_de_usuario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `perfil_de_usuario_FI_1` (`sf_guard_user_id`),
  ADD KEY `tipo_usuario_id` (`tipo_usuario_id`);

--
-- Indexes for table `perfil_de_usuario_grupo_usuario`
--
ALTER TABLE `perfil_de_usuario_grupo_usuario`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissao`
--
ALTER TABLE `permissao`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plano`
--
ALTER TABLE `plano`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posto`
--
ALTER TABLE `posto`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `preco_gasolina_adt_id_2` (`preco_gasolina_adt_id`),
  ADD UNIQUE KEY `id` (`id`,`bairro_id`,`cidade_id`,`estado_id`,`pais_id`,`regiao_id`,`bandeira_id`,`geocode_id`,`rede_posto_id`,`perfil_de_usuario_id`),
  ADD KEY `fk_posto_bairro` (`bairro_id`),
  ADD KEY `fk_posto_cidade` (`cidade_id`),
  ADD KEY `fk_posto_estado` (`estado_id`),
  ADD KEY `fk_posto_regiao` (`regiao_id`),
  ADD KEY `fk_posto_bandeira` (`bandeira_id`),
  ADD KEY `fk_posto_bandeira_fornecedor` (`bandeira_fornecedor_id`),
  ADD KEY `fi_razao_social_anp` (`razao_social_anp`),
  ADD KEY `fk_posto_geocode` (`geocode_id`),
  ADD KEY `fi_ultimo_preco_gasolina` (`ultimo_preco_gasolina`),
  ADD KEY `fi_ultimo_preco_alcool` (`ultimo_preco_alcool`),
  ADD KEY `fi_ultimo_preco_diesel` (`ultimo_preco_diesel`),
  ADD KEY `fi_ultimo_preco_gnv` (`ultimo_preco_gnv`),
  ADD KEY `posto_FI_8` (`preco_gasolina_id`),
  ADD KEY `posto_FI_9` (`preco_alcool_id`),
  ADD KEY `posto_FI_10` (`preco_diesel_id`),
  ADD KEY `posto_FI_11` (`preco_gnv_id`),
  ADD KEY `fi_posto_ultimo_editor` (`ultimo_editor_id`),
  ADD KEY `posto_FI_12` (`preco_diesel_s10_id`),
  ADD KEY `fi_ultimo_preco_diesel_s10` (`ultimo_preco_diesel_s10`),
  ADD KEY `preco_gasolina_adt_id` (`preco_gasolina_adt_id`),
  ADD KEY `preco_gasolina_adt_id_3` (`preco_gasolina_adt_id`),
  ADD KEY `rede_posto_id` (`rede_posto_id`),
  ADD KEY `parceiro_id` (`parceiro_id`),
  ADD KEY `perfil_de_usuario_id` (`perfil_de_usuario_id`),
  ADD KEY `pais_FK` (`pais_id`);

--
-- Indexes for table `posto_importacao_parana`
--
ALTER TABLE `posto_importacao_parana`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posto_integracao`
--
ALTER TABLE `posto_integracao`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posto_nao_inserido`
--
ALTER TABLE `posto_nao_inserido`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posto_nao_inserido_anp`
--
ALTER TABLE `posto_nao_inserido_anp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posto_servico`
--
ALTER TABLE `posto_servico`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `preco`
--
ALTER TABLE `preco`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_2` (`id`,`posto_id`,`combustivel_id`),
  ADD UNIQUE KEY `id_3` (`id`,`posto_id`,`combustivel_id`,`perfil_de_usuario_id`),
  ADD UNIQUE KEY `id_4` (`id`,`posto_id`,`combustivel_id`,`perfil_de_usuario_id`),
  ADD KEY `fk_combustivel_tipo_combustivel` (`combustivel_id`),
  ADD KEY `fk_posto_id` (`posto_id`),
  ADD KEY `fi_preco_editor` (`editor_id`),
  ADD KEY `editor_id` (`editor_id`),
  ADD KEY `id` (`id`,`posto_id`,`combustivel_id`),
  ADD KEY `perfil_de_usuario_id` (`perfil_de_usuario_id`);

--
-- Indexes for table `preco_avaliacao`
--
ALTER TABLE `preco_avaliacao`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rede_posto`
--
ALTER TABLE `rede_posto`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `regiao`
--
ALTER TABLE `regiao`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `response_code`
--
ALTER TABLE `response_code`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `servico`
--
ALTER TABLE `servico`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sf_guard_user`
--
ALTER TABLE `sf_guard_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sf_guard_user_U_1` (`username`);

--
-- Indexes for table `sinistro`
--
ALTER TABLE `sinistro`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sugestao_alteracao_posto`
--
ALTER TABLE `sugestao_alteracao_posto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posto_id` (`posto_id`),
  ADD KEY `perfil_de_usuario_id` (`perfil_de_usuario_id`),
  ADD KEY `posto_geocode_id` (`geocode_id`),
  ADD KEY `posto_id_2` (`posto_id`),
  ADD KEY `perfil_de_usuario_id_2` (`perfil_de_usuario_id`),
  ADD KEY `posto_bandeira_id` (`bandeira_id`),
  ADD KEY `posto_geocode_id_2` (`geocode_id`);

--
-- Indexes for table `sugestao_posto`
--
ALTER TABLE `sugestao_posto`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tarefa_de_coleta`
--
ALTER TABLE `tarefa_de_coleta`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `telefone_avulso`
--
ALTER TABLE `telefone_avulso`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_6` (`id`,`pacote_ticket_id`,`tipo_desconto`,`codigo`),
  ADD UNIQUE KEY `id_7` (`id`,`codigo`),
  ADD UNIQUE KEY `id_4` (`id`,`pacote_ticket_id`,`perfil_de_usuario_id`),
  ADD UNIQUE KEY `id_5` (`id`,`pacote_ticket_id`,`perfil_de_usuario_id`,`posto_id`),
  ADD KEY `sf_guard_user_id_fk` (`sf_guard_user_id`),
  ADD KEY `id` (`id`,`pacote_ticket_id`),
  ADD KEY `perfil_de_usuario_id` (`perfil_de_usuario_id`),
  ADD KEY `id_2` (`id`,`pacote_ticket_id`,`perfil_de_usuario_id`,`posto_id`,`rede_posto_id`,`grupo_usuario_id`,`comprador_id`,`notificacao`),
  ADD KEY `id_3` (`id`,`pacote_ticket_id`,`perfil_de_usuario_id`,`posto_id`);

--
-- Indexes for table `tipo_pacote_ticket`
--
ALTER TABLE `tipo_pacote_ticket`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tipo_ticket`
--
ALTER TABLE `tipo_ticket`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tipo_usuario_permissao`
--
ALTER TABLE `tipo_usuario_permissao`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_tipo_usuario` (`tipo_usuario_id`),
  ADD KEY `id_permissao` (`permissao_id`);

--
-- Indexes for table `tipo_veiculo`
--
ALTER TABLE `tipo_veiculo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transferencias`
--
ALTER TABLE `transferencias`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `trr`
--
ALTER TABLE `trr`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `id_2` (`id`);

--
-- Indexes for table `trr_abastecimento`
--
ALTER TABLE `trr_abastecimento`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trr_alerta`
--
ALTER TABLE `trr_alerta`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trr_carga`
--
ALTER TABLE `trr_carga`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trr_combustivel_trr`
--
ALTER TABLE `trr_combustivel_trr`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trr_tanque`
--
ALTER TABLE `trr_tanque`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_cod_parceiro`
--
ALTER TABLE `user_cod_parceiro`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usuario_pos_atendente`
--
ALTER TABLE `usuario_pos_atendente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_rede` (`rede_posto_id`),
  ADD KEY `fk_posto` (`posto_id`);

--
-- Indexes for table `veiculo`
--
ALTER TABLE `veiculo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tipo_veiculo_id` (`tipo_veiculo_id`),
  ADD KEY `marca_id` (`marca_id`),
  ADD KEY `perfil_de_usuario_id` (`perfil_de_usuario_id`),
  ADD KEY `combustivel_id` (`combustivel_id`);

--
-- Indexes for table `webview_app`
--
ALTER TABLE `webview_app`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `abastecimento`
--
ALTER TABLE `abastecimento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=503;
--
-- AUTO_INCREMENT for table `abastecimentoTrr`
--
ALTER TABLE `abastecimentoTrr`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=221;
--
-- AUTO_INCREMENT for table `assinaturas`
--
ALTER TABLE `assinaturas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `assinaturas_desconto`
--
ALTER TABLE `assinaturas_desconto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `atendente`
--
ALTER TABLE `atendente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `atendimento`
--
ALTER TABLE `atendimento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;
--
-- AUTO_INCREMENT for table `atendimento_carteira`
--
ALTER TABLE `atendimento_carteira`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=266;
--
-- AUTO_INCREMENT for table `atendimento_ponto_apoio`
--
ALTER TABLE `atendimento_ponto_apoio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `atendimento_prestador`
--
ALTER TABLE `atendimento_prestador`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `atendimento_questionario`
--
ALTER TABLE `atendimento_questionario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `atendimento_servicos`
--
ALTER TABLE `atendimento_servicos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `atendimento_valor`
--
ALTER TABLE `atendimento_valor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `b2b_cliente`
--
ALTER TABLE `b2b_cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `b2b_combustivel`
--
ALTER TABLE `b2b_combustivel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `b2b_cotacao`
--
ALTER TABLE `b2b_cotacao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `b2b_distribuidora`
--
ALTER TABLE `b2b_distribuidora`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `b2b_oferta`
--
ALTER TABLE `b2b_oferta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `b2b_proposta`
--
ALTER TABLE `b2b_proposta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `b2b_venda`
--
ALTER TABLE `b2b_venda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `bairro`
--
ALTER TABLE `bairro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40285;
--
-- AUTO_INCREMENT for table `bandeira`
--
ALTER TABLE `bandeira`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=381;
--
-- AUTO_INCREMENT for table `carteira`
--
ALTER TABLE `carteira`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2017;
--
-- AUTO_INCREMENT for table `carteira_status`
--
ALTER TABLE `carteira_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `carteira_tipo`
--
ALTER TABLE `carteira_tipo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `cidade`
--
ALTER TABLE `cidade`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8627;
--
-- AUTO_INCREMENT for table `cliente_trr`
--
ALTER TABLE `cliente_trr`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `cod_menor_preco_pr`
--
ALTER TABLE `cod_menor_preco_pr`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=399;
--
-- AUTO_INCREMENT for table `combustivel`
--
ALTER TABLE `combustivel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `combustivel_trr`
--
ALTER TABLE `combustivel_trr`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `comentario`
--
ALTER TABLE `comentario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=649;
--
-- AUTO_INCREMENT for table `comprador`
--
ALTER TABLE `comprador`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;
--
-- AUTO_INCREMENT for table `desconto`
--
ALTER TABLE `desconto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=399;
--
-- AUTO_INCREMENT for table `email_avulso`
--
ALTER TABLE `email_avulso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `empresas`
--
ALTER TABLE `empresas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `estado`
--
ALTER TABLE `estado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;
--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `feed`
--
ALTER TABLE `feed`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;
--
-- AUTO_INCREMENT for table `feed_categoria`
--
ALTER TABLE `feed_categoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `feed_grupo`
--
ALTER TABLE `feed_grupo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=194;
--
-- AUTO_INCREMENT for table `forma_pagamento`
--
ALTER TABLE `forma_pagamento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `geocode`
--
ALTER TABLE `geocode`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129704;
--
-- AUTO_INCREMENT for table `grupo_usuario`
--
ALTER TABLE `grupo_usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;
--
-- AUTO_INCREMENT for table `grupo_usuario_validacao`
--
ALTER TABLE `grupo_usuario_validacao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `linx_logs`
--
ALTER TABLE `linx_logs`
  MODIFY `lid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=474;
--
-- AUTO_INCREMENT for table `log`
--
ALTER TABLE `log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=521972;
--
-- AUTO_INCREMENT for table `log_site`
--
ALTER TABLE `log_site`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `marca`
--
ALTER TABLE `marca`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=298;
--
-- AUTO_INCREMENT for table `merge_posto`
--
ALTER TABLE `merge_posto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13445;
--
-- AUTO_INCREMENT for table `metodo_pagamento`
--
ALTER TABLE `metodo_pagamento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `modulo`
--
ALTER TABLE `modulo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `modulo_comprador`
--
ALTER TABLE `modulo_comprador`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT for table `notificacao_compra`
--
ALTER TABLE `notificacao_compra`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `notificao_compra_pedidos`
--
ALTER TABLE `notificao_compra_pedidos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `pacote_ticket`
--
ALTER TABLE `pacote_ticket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1081;
--
-- AUTO_INCREMENT for table `pais`
--
ALTER TABLE `pais`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=240;
--
-- AUTO_INCREMENT for table `parceiro`
--
ALTER TABLE `parceiro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `pedagio`
--
ALTER TABLE `pedagio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;
--
-- AUTO_INCREMENT for table `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `perfil_de_usuario`
--
ALTER TABLE `perfil_de_usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=434137;
--
-- AUTO_INCREMENT for table `perfil_de_usuario_grupo_usuario`
--
ALTER TABLE `perfil_de_usuario_grupo_usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124301;
--
-- AUTO_INCREMENT for table `permissao`
--
ALTER TABLE `permissao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=181;
--
-- AUTO_INCREMENT for table `plano`
--
ALTER TABLE `plano`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `posto`
--
ALTER TABLE `posto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82656;
--
-- AUTO_INCREMENT for table `posto_importacao_parana`
--
ALTER TABLE `posto_importacao_parana`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4148;
--
-- AUTO_INCREMENT for table `posto_integracao`
--
ALTER TABLE `posto_integracao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18511;
--
-- AUTO_INCREMENT for table `posto_nao_inserido`
--
ALTER TABLE `posto_nao_inserido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7336;
--
-- AUTO_INCREMENT for table `posto_nao_inserido_anp`
--
ALTER TABLE `posto_nao_inserido_anp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6256;
--
-- AUTO_INCREMENT for table `posto_servico`
--
ALTER TABLE `posto_servico`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT for table `preco`
--
ALTER TABLE `preco`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20896001;
--
-- AUTO_INCREMENT for table `preco_avaliacao`
--
ALTER TABLE `preco_avaliacao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20024;
--
-- AUTO_INCREMENT for table `rede_posto`
--
ALTER TABLE `rede_posto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `regiao`
--
ALTER TABLE `regiao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `response_code`
--
ALTER TABLE `response_code`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
--
-- AUTO_INCREMENT for table `servico`
--
ALTER TABLE `servico`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(99) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sf_guard_user`
--
ALTER TABLE `sf_guard_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58340;
--
-- AUTO_INCREMENT for table `sinistro`
--
ALTER TABLE `sinistro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `sugestao_alteracao_posto`
--
ALTER TABLE `sugestao_alteracao_posto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5751;
--
-- AUTO_INCREMENT for table `sugestao_posto`
--
ALTER TABLE `sugestao_posto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7904;
--
-- AUTO_INCREMENT for table `tarefa_de_coleta`
--
ALTER TABLE `tarefa_de_coleta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=573;
--
-- AUTO_INCREMENT for table `telefone_avulso`
--
ALTER TABLE `telefone_avulso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=530;
--
-- AUTO_INCREMENT for table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=238534;
--
-- AUTO_INCREMENT for table `tipo_pacote_ticket`
--
ALTER TABLE `tipo_pacote_ticket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `tipo_ticket`
--
ALTER TABLE `tipo_ticket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `tipo_usuario_permissao`
--
ALTER TABLE `tipo_usuario_permissao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=346;
--
-- AUTO_INCREMENT for table `tipo_veiculo`
--
ALTER TABLE `tipo_veiculo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `transferencias`
--
ALTER TABLE `transferencias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `trr`
--
ALTER TABLE `trr`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=447;
--
-- AUTO_INCREMENT for table `trr_abastecimento`
--
ALTER TABLE `trr_abastecimento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `trr_alerta`
--
ALTER TABLE `trr_alerta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=458;
--
-- AUTO_INCREMENT for table `trr_carga`
--
ALTER TABLE `trr_carga`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `trr_combustivel_trr`
--
ALTER TABLE `trr_combustivel_trr`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `trr_tanque`
--
ALTER TABLE `trr_tanque`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user_cod_parceiro`
--
ALTER TABLE `user_cod_parceiro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;
--
-- AUTO_INCREMENT for table `usuario_pos_atendente`
--
ALTER TABLE `usuario_pos_atendente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;
--
-- AUTO_INCREMENT for table `veiculo`
--
ALTER TABLE `veiculo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62727;
--
-- AUTO_INCREMENT for table `webview_app`
--
ALTER TABLE `webview_app`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `atendimento_valor`
--
ALTER TABLE `atendimento_valor`
  ADD CONSTRAINT `FK_tipo_servico` FOREIGN KEY (`tipo_servico`) REFERENCES `atendimento_servicos` (`id`);

--
-- Limitadores para a tabela `b2b_cotacao`
--
ALTER TABLE `b2b_cotacao`
  ADD CONSTRAINT `b2b_cotacao_ibfk_1` FOREIGN KEY (`b2b_cliente_id`) REFERENCES `b2b_cliente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `b2b_oferta`
--
ALTER TABLE `b2b_oferta`
  ADD CONSTRAINT `b2b_oferta_ibfk_1` FOREIGN KEY (`b2b_distribuidora_id`) REFERENCES `b2b_distribuidora` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `b2b_oferta_ibfk_2` FOREIGN KEY (`combustivel_id`) REFERENCES `combustivel` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `bairro`
--
ALTER TABLE `bairro`
  ADD CONSTRAINT `fk_bairro_cidade` FOREIGN KEY (`cidade_id`) REFERENCES `cidade` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_bairro_geocode` FOREIGN KEY (`geocode_id`) REFERENCES `geocode` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `carteira`
--
ALTER TABLE `carteira`
  ADD CONSTRAINT `fk_status_carteira` FOREIGN KEY (`status`) REFERENCES `carteira_status` (`id`),
  ADD CONSTRAINT `fk_tipo_carteira` FOREIGN KEY (`tipo`) REFERENCES `carteira_tipo` (`id`);

--
-- Limitadores para a tabela `cidade`
--
ALTER TABLE `cidade`
  ADD CONSTRAINT `fk_cidade_estado` FOREIGN KEY (`estado_id`) REFERENCES `estado` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cidade_geocode` FOREIGN KEY (`geocode_id`) REFERENCES `geocode` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `comentario`
--
ALTER TABLE `comentario`
  ADD CONSTRAINT `comentario_FK_1` FOREIGN KEY (`posto_id`) REFERENCES `posto` (`id`),
  ADD CONSTRAINT `comentario_FK_2` FOREIGN KEY (`editor_id`) REFERENCES `sf_guard_user` (`id`);

--
-- Limitadores para a tabela `estado`
--
ALTER TABLE `estado`
  ADD CONSTRAINT `fk_estado_geocode` FOREIGN KEY (`geocode_id`) REFERENCES `geocode` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_estado_regiao` FOREIGN KEY (`regiao_id`) REFERENCES `regiao` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `perfil_de_usuario`
--
ALTER TABLE `perfil_de_usuario`
  ADD CONSTRAINT `perfil_de_usuario_ibfk_1` FOREIGN KEY (`tipo_usuario_id`) REFERENCES `tipo_usuario` (`id`);

--
-- Limitadores para a tabela `posto`
--
ALTER TABLE `posto`
  ADD CONSTRAINT `pais_FK` FOREIGN KEY (`pais_id`) REFERENCES `pais` (`id`),
  ADD CONSTRAINT `posto_ibfk_10` FOREIGN KEY (`preco_diesel_id`) REFERENCES `preco` (`id`),
  ADD CONSTRAINT `posto_ibfk_11` FOREIGN KEY (`preco_gnv_id`) REFERENCES `preco` (`id`),
  ADD CONSTRAINT `posto_ibfk_12` FOREIGN KEY (`ultimo_editor_id`) REFERENCES `sf_guard_user` (`id`),
  ADD CONSTRAINT `posto_ibfk_13` FOREIGN KEY (`preco_diesel_s10_id`) REFERENCES `preco` (`id`),
  ADD CONSTRAINT `posto_ibfk_14` FOREIGN KEY (`preco_gasolina_adt_id`) REFERENCES `preco` (`id`),
  ADD CONSTRAINT `posto_ibfk_2` FOREIGN KEY (`cidade_id`) REFERENCES `cidade` (`id`),
  ADD CONSTRAINT `posto_ibfk_3` FOREIGN KEY (`estado_id`) REFERENCES `estado` (`id`),
  ADD CONSTRAINT `posto_ibfk_4` FOREIGN KEY (`regiao_id`) REFERENCES `regiao` (`id`),
  ADD CONSTRAINT `posto_ibfk_5` FOREIGN KEY (`bandeira_id`) REFERENCES `bandeira` (`id`),
  ADD CONSTRAINT `posto_ibfk_6` FOREIGN KEY (`geocode_id`) REFERENCES `geocode` (`id`),
  ADD CONSTRAINT `posto_ibfk_7` FOREIGN KEY (`bandeira_fornecedor_id`) REFERENCES `bandeira` (`id`),
  ADD CONSTRAINT `posto_ibfk_8` FOREIGN KEY (`preco_gasolina_id`) REFERENCES `preco` (`id`),
  ADD CONSTRAINT `posto_ibfk_9` FOREIGN KEY (`preco_alcool_id`) REFERENCES `preco` (`id`);

--
-- Limitadores para a tabela `sugestao_alteracao_posto`
--
ALTER TABLE `sugestao_alteracao_posto`
  ADD CONSTRAINT `sugestao_alteracao_posto_ibfk_1` FOREIGN KEY (`posto_id`) REFERENCES `posto` (`id`),
  ADD CONSTRAINT `sugestao_alteracao_posto_ibfk_2` FOREIGN KEY (`perfil_de_usuario_id`) REFERENCES `perfil_de_usuario` (`id`);

--
-- Limitadores para a tabela `tipo_usuario_permissao`
--
ALTER TABLE `tipo_usuario_permissao`
  ADD CONSTRAINT `tipo_usuario_permissao_ibfk_1` FOREIGN KEY (`tipo_usuario_id`) REFERENCES `tipo_usuario` (`id`),
  ADD CONSTRAINT `tipo_usuario_permissao_ibfk_2` FOREIGN KEY (`permissao_id`) REFERENCES `permissao` (`id`);

--
-- Limitadores para a tabela `usuario_pos_atendente`
--
ALTER TABLE `usuario_pos_atendente`
  ADD CONSTRAINT `fk_posto` FOREIGN KEY (`posto_id`) REFERENCES `posto` (`id`),
  ADD CONSTRAINT `fk_rede` FOREIGN KEY (`rede_posto_id`) REFERENCES `rede_posto` (`id`);

--
-- Limitadores para a tabela `veiculo`
--
ALTER TABLE `veiculo`
  ADD CONSTRAINT `perfil_usuario_fk` FOREIGN KEY (`perfil_de_usuario_id`) REFERENCES `perfil_de_usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `veiculo_ibfk_2` FOREIGN KEY (`tipo_veiculo_id`) REFERENCES `tipo_veiculo` (`id`),
  ADD CONSTRAINT `veiculo_ibfk_3` FOREIGN KEY (`marca_id`) REFERENCES `marca` (`id`),
  ADD CONSTRAINT `veiculo_ibfk_4` FOREIGN KEY (`combustivel_id`) REFERENCES `combustivel` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
