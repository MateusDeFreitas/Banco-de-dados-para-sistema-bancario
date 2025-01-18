-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 25/05/2024 às 21:20
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bd_bancoitau`
--

DELIMITER $$
--
-- Procedimentos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `atualizar_agencia_bancaria` (IN `p_numero` VARCHAR(10), IN `p_descricao` TEXT, IN `p_cidade` VARCHAR(30), IN `p_bairro` VARCHAR(50), IN `p_rua` VARCHAR(50), IN `p_complemento` VARCHAR(20))   BEGIN
    UPDATE agencias_bancarias
    SET
        descricao = p_descricao,
        cidade = p_cidade,
        bairro = p_bairro,
        rua = p_rua,
        complemento = p_complemento
    WHERE numero_da_agencia = p_numero;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `atualizar_bandeira_de_cartao` (IN `p_id` INTEGER, IN `p_bandeira` VARCHAR(50))   BEGIN
    UPDATE bandeira_cartao
    SET
    bandeira_cartao.bandeira = p_bandeira
    WHERE bandeira_cartao.id = p_id;
            END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `atualizar_cartao_de_credito` (IN `p_numero` VARCHAR(10), IN `p_bandeira_cartao_id` INTEGER, IN `p_cliente_Id` INTEGER, IN `p_data_validade` DATE, IN `p_limite` DOUBLE, IN `p_codigo_seguranca` VARCHAR(30))   BEGIN
    UPDATE cartao_de_credito
    SET
        bandeira_cartao_id = p_bandeira_cartao_id,
        cliente_Id = p_cliente_Id,
        data_validade = p_data_validade,
        limite = p_limite,
        codigo_seguranca = p_codigo_seguranca
    WHERE numero = p_numero;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `atualizar_cartao_movimentacao` (IN `p_cliente` INTEGER, IN `p_conta_bancaria` INTEGER, IN `p_senha` VARCHAR(30))   BEGIN
            UPDATE cartao_movimentacao
            SET
                cartao_movimentacao.senha = p_senha     
                WHERE cartao_movimentacao.conta_bancaria_id = p_conta_bancaria AND
                cartao_movimentacao.cliente_Id = p_cliente;
    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `atualizar_cliente` (IN `p_Id` INTEGER, IN `p_agencias_bancarias_numero_da_agencia` VARCHAR(10), IN `p_Nome` VARCHAR(20), IN `p_telefone` VARCHAR(11), IN `p_tipo_pessoa` VARCHAR(2), IN `p_rua` VARCHAR(50), IN `p_bairro` VARCHAR(50), IN `p_Complemento` VARCHAR(50), IN `p_sobrenome` VARCHAR(50), IN `p_cidade` VARCHAR(30))   BEGIN
    UPDATE cliente
    SET 
        agencias_bancarias_numero_da_agencia = p_agencias_bancarias_numero_da_agencia,
        Nome = p_Nome,
        telefone = p_telefone,
        tipo_pessoa = p_tipo_pessoa,
        rua = p_rua,
        bairro = p_bairro,
        Complemento = p_Complemento,
        sobrenome = p_sobrenome,
        cidade = p_cidade
    WHERE Id = p_Id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `atualizar_compra` (IN `p_id` INTEGER, IN `p_fatura_Id` INTEGER, IN `p_valor` DOUBLE, IN `p_numero_parcelas` INTEGER, IN `p_data_2` DATE)   BEGIN
    UPDATE compra
    SET
        fatura_Id = p_fatura_Id,
        valor = p_valor,
        numero_parcelas = p_numero_parcelas,
        data_2 = p_data_2
    WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `atualizar_conta_bancaria` (IN `p_id` INTEGER, IN `p_tipo` VARCHAR(30), IN `p_saldo` DOUBLE, IN `p_conjunta` BOOLEAN)   BEGIN
    UPDATE conta_bancaria
    SET
        tipo = p_tipo,
        saldo = p_saldo,
        conjunta = p_conjunta
    WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `atualizar_conta_corrente` (IN `p_id` INTEGER, IN `p_conta_bancaria_id` INTEGER)   BEGIN
    UPDATE conta_corrente
    SET
        conta_bancaria_id = p_conta_bancaria_id
    WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `atualizar_conta_corrente_especial` (IN `p_id` INTEGER, IN `p_conta_corrente_id` INTEGER, IN `p_limite` DOUBLE)   BEGIN
    UPDATE conta_corrente_especial
    SET
        conta_corrente_id = p_conta_corrente_id,
        limite = p_limite
    WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `atualizar_conta_poupanca` (IN `p_id` INTEGER, IN `p_conta_bancaria_id` INTEGER, IN `p_data_aniversario` DATE)   BEGIN
    UPDATE conta_poupanca
    SET
        conta_bancaria_id = p_conta_bancaria_id,
        data_aniversario = p_data_aniversario
    WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `atualizar_convenio` (IN `p_id` INTEGER, IN `p_debito_automatico_id` INTEGER, IN `p_nome` VARCHAR(30))   BEGIN
    UPDATE convenio
    SET
        debito_automatico_id = p_debito_automatico_id,
        nome = p_nome
    WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `atualizar_debito_automatico` (IN `p_id` INTEGER, IN `p_conta_bancaria_id` INTEGER, IN `p_codigo` VARCHAR(10))   BEGIN
    UPDATE debito_automatico
    SET
        conta_bancaria_id = p_conta_bancaria_id,
        codigo = p_codigo
    WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `atualizar_emprestimo` (IN `p_id` INTEGER, IN `p_conta_bancaria_id` INTEGER, IN `p_valor` DOUBLE)   BEGIN
    UPDATE emprestimo
    SET
        conta_bancaria_id = p_conta_bancaria_id,
        valor = p_valor
    WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `atualizar_estabelecimento` (IN `p_cnpj` VARCHAR(10), IN `p_compra_id` INTEGER, IN `p_razao_social` VARCHAR(150))   BEGIN
    UPDATE Estabelecimento
    SET
        compra_id = p_compra_id,
        razao_social = p_razao_social
    WHERE cnpj = p_cnpj;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `atualizar_fatura` (IN `p_id` INTEGER, IN `p_cartao_movimentacao_de_credito_numero` VARCHAR(10), IN `p_ano_de_competencia` DATE, IN `p_mes_de_competencia` DATE)   BEGIN
    UPDATE fatura
    SET
        cartao_movimentacao_de_credito_numero = p_cartao_movimentacao_de_credito_numero,
        ano_de_competencia = p_ano_de_competencia,
        mes_de_competencia = p_mes_de_competencia
    WHERE Id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `atualizar_gerente_bancario` (IN `p_id` INTEGER, IN `p_numero_da_agencia` VARCHAR(10), IN `p_nome` VARCHAR(20), IN `p_sobrenome` VARCHAR(50))   BEGIN
    UPDATE gerente_bancario
    SET
        agencias_bancarias_numero_da_agencia = p_numero_da_agencia,
        nome = p_nome,
        sobrenome = p_sobrenome
    WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `atualizar_movimentacao` (IN `p_id` INTEGER, IN `p_conta_bancaria_id` INTEGER, IN `p_data` DATE, IN `p_valor` DOUBLE, IN `p_tipo` VARCHAR(30))   BEGIN
    UPDATE movimentacao
    SET
        conta_bancaria_id = p_conta_bancaria_id,
        data = p_data,
        valor = p_valor,
        tipo = p_tipo
    WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `atualizar_pagamento` (IN `p_id` INTEGER, IN `p_fatura_Id` INTEGER, IN `p_data_vencimento` DATE, IN `p_valor` DOUBLE, IN `p_data_pagamento` DATE)   BEGIN
    UPDATE pagamento
    SET
        fatura_Id = p_fatura_Id,
        data_vencimento = p_data_vencimento,
        valor = p_valor,
        data_pagamento = p_data_pagamento
    WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `atualizar_parcela_emprestimo` (IN `p_id` INTEGER, IN `p_emprestimo_id` INTEGER, IN `p_valor` DOUBLE, IN `p_data_vencimento` DATE, IN `p_data_pagamento` DATE)   BEGIN
    UPDATE parcela_emprestimo
    SET
        emprestimo_id = p_emprestimo_id,
        valor = p_valor,
        data_vencimento = p_data_vencimento,
        data_pagamento = p_data_pagamento
    WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `atualizar_seguro` (IN `p_id` INTEGER, IN `p_tipo_de_seguro_id` INTEGER, IN `p_cliente_Id` INTEGER, IN `p_vigencia` DATETIME)   BEGIN
    UPDATE seguro
    SET
        tipo_de_seguro_id = p_tipo_de_seguro_id,
        cliente_Id = p_cliente_Id,
        vigencia = p_vigencia
    WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `atualizar_talao_de_cheque` (IN `p_id` INTEGER, IN `p_conta_corrente_especial_id` INTEGER, IN `p_numero_folha_final` INTEGER)   BEGIN
    UPDATE talao_de_cheque
    SET
        conta_corrente_especial_id = p_conta_corrente_especial_id,
        numero_folha_final = p_numero_folha_final
    WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `atualizar_tipo_de_seguro` (IN `p_id` INTEGER, IN `p_descricao` TEXT, IN `p_nome` VARCHAR(50))   BEGIN
    UPDATE tipo_de_seguro
    SET
        descricao = p_descricao,
        nome = p_nome
    WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `criar_agencia_bancaria` (IN `p_numero` VARCHAR(10), IN `p_descricao` TEXT, IN `p_cidade` VARCHAR(30), IN `p_bairro` VARCHAR(50), IN `p_rua` VARCHAR(50), IN `p_complemento` VARCHAR(20))   BEGIN
    INSERT INTO agencias_bancarias (
        numero_da_agencia,
        descricao,
        cidade,
        bairro,
        rua,
        complemento
    ) VALUES (
        p_numero,
        p_descricao,
        p_cidade,
        p_bairro,
        p_rua,
        p_complemento
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `criar_bandeira_de_cartao` (IN `p_id` INTEGER, IN `p_bandeira` VARCHAR(50))   BEGIN
    INSERT INTO bandeira_cartao (
        bandeira_cartao.id,
        bandeira_cartao.bandeira
        ) VALUES (
            p_id,
            p_bandeira
            );
            END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `criar_cartao_de_credito` (IN `p_numero` VARCHAR(10), IN `p_bandeira_cartao_id` INTEGER, IN `p_cliente_Id` INTEGER, IN `p_data_validade` DATE, IN `p_limite` DOUBLE, IN `p_codigo_seguranca` VARCHAR(30))   BEGIN
    INSERT INTO cartao_de_credito (
        numero,
        bandeira_cartao_id,
        cliente_Id,
        data_validade,
        limite,
        codigo_seguranca
    ) VALUES (
        p_numero,
        p_bandeira_cartao_id,
        p_cliente_Id,
        p_data_validade,
        p_limite,
        p_codigo_seguranca
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `criar_cartao_movimentacao` (IN `p_cliente` INTEGER, IN `p_conta_bancaria` INTEGER, IN `p_senha` VARCHAR(30))   BEGIN
    	INSERT INTO cartao_movimentacao (
            cartao_movimentacao.conta_bancaria_id,
            cartao_movimentacao.cliente_Id,
            cartao_movimentacao.senha
        ) VALUES (
            p_conta_bancaria,
            p_cliente,
            p_senha
        );                                
    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `criar_cliente` (IN `p_agencias_bancarias_numero_da_agencia` VARCHAR(10), IN `p_Nome` VARCHAR(20), IN `p_telefone` VARCHAR(11), IN `p_tipo_pessoa` VARCHAR(2), IN `p_rua` VARCHAR(50), IN `p_bairro` VARCHAR(50), IN `p_Complemento` VARCHAR(50), IN `p_sobrenome` VARCHAR(50), IN `p_cidade` VARCHAR(30))   BEGIN
    INSERT INTO cliente (
        agencias_bancarias_numero_da_agencia, 
        Nome, 
        telefone, 
        tipo_pessoa, 
        rua, 
        bairro, 
        Complemento, 
        sobrenome, 
        cidade
    ) VALUES (
        p_agencias_bancarias_numero_da_agencia, 
        p_Nome, 
        p_telefone, 
        p_tipo_pessoa, 
        p_rua, 
        p_bairro, 
        p_Complemento, 
        p_sobrenome, 
        p_cidade
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `criar_compra` (IN `p_fatura_Id` INTEGER, IN `p_valor` DOUBLE, IN `p_numero_parcelas` INTEGER, IN `p_data_2` DATE)   BEGIN
    INSERT INTO compra (
        fatura_Id,
        valor,
        numero_parcelas,
        data_2
    ) VALUES (
        p_fatura_Id,
        p_valor,
        p_numero_parcelas,
        p_data_2
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `criar_conta_bancaria` (IN `p_tipo` VARCHAR(30), IN `p_saldo` DOUBLE, IN `p_conjunta` BOOLEAN)   BEGIN
    INSERT INTO conta_bancaria (
        tipo,
        saldo,
        conjunta
    ) VALUES (
        p_tipo,
        p_saldo,
        p_conjunta
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `criar_conta_corrente` (IN `p_conta_bancaria_id` INTEGER)   BEGIN
    INSERT INTO conta_corrente (
        conta_bancaria_id
    ) VALUES (
        p_conta_bancaria_id
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `criar_conta_corrente_especial` (IN `p_conta_corrente_id` INTEGER, IN `p_limite` DOUBLE)   BEGIN
    INSERT INTO conta_corrente_especial (
        conta_corrente_id,
        limite
    ) VALUES (
        p_conta_corrente_id,
        p_limite
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `criar_conta_poupanca` (IN `p_conta_bancaria_id` INTEGER, IN `p_data_aniversario` DATE)   BEGIN
    INSERT INTO conta_poupanca (
        conta_bancaria_id,
        data_aniversario
    ) VALUES (
        p_conta_bancaria_id,
        p_data_aniversario
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `criar_convenio` (IN `p_debito_automatico_id` INTEGER, IN `p_nome` VARCHAR(30))   BEGIN
    INSERT INTO convenio (
        debito_automatico_id,
        nome
    ) VALUES (
        p_debito_automatico_id,
        p_nome
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `criar_debito_automatico` (IN `p_conta_bancaria_id` INTEGER, IN `p_codigo` VARCHAR(10))   BEGIN
    INSERT INTO debito_automatico (
        conta_bancaria_id,
        codigo
    ) VALUES (
        p_conta_bancaria_id,
        p_codigo
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `criar_emprestimo` (IN `p_conta_bancaria_id` INTEGER, IN `p_valor` DOUBLE)   BEGIN
    INSERT INTO emprestimo (
        conta_bancaria_id,
        valor
    ) VALUES (
        p_conta_bancaria_id,
        p_valor
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `criar_estabelecimento` (IN `p_cnpj` VARCHAR(10), IN `p_compra_id` INTEGER, IN `p_razao_social` VARCHAR(150))   BEGIN
    INSERT INTO Estabelecimento (
        cnpj,
        compra_id,
        razao_social
    ) VALUES (
        p_cnpj,
        p_compra_id,
        p_razao_social
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `criar_fatura` (IN `p_id` INTEGER, IN `p_cartao_movimentacao_de_credito_numero` VARCHAR(10), IN `p_ano_de_competencia` DATE, IN `p_mes_de_competencia` DATE)   BEGIN
    INSERT INTO fatura (
        Id,
        cartao_movimentacao_de_credito_numero,
        ano_de_competencia,
        mes_de_competencia
    ) VALUES (
        p_id,
        p_cartao_movimentacao_de_credito_numero,
        p_ano_de_competencia,
        p_mes_de_competencia
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `criar_gerente_bancario` (IN `p_numero_da_agencia` VARCHAR(10), IN `p_nome` VARCHAR(20), IN `p_sobrenome` VARCHAR(50))   BEGIN
    INSERT INTO gerente_bancario (
        agencias_bancarias_numero_da_agencia,
        nome,
        sobrenome
    ) VALUES (
        p_numero_da_agencia,
        p_nome,
        p_sobrenome
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `criar_movimentacao` (IN `p_conta_bancaria_id` INTEGER, IN `p_data` DATE, IN `p_valor` DOUBLE, IN `p_tipo` VARCHAR(30))   BEGIN
    INSERT INTO movimentacao (
        conta_bancaria_id,
        data,
        valor,
        tipo
    ) VALUES (
        p_conta_bancaria_id,
        p_data,
        p_valor,
        p_tipo
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `criar_pagamento` (IN `p_id` INTEGER, IN `p_fatura_Id` INTEGER, IN `p_data_vencimento` DATE, IN `p_valor` DOUBLE, IN `p_data_pagamento` DATE)   BEGIN
    INSERT INTO pagamento (
        id,
        fatura_Id,
        data_vencimento,
        valor,
        data_pagamento
    ) VALUES (
        p_id,
        p_fatura_Id,
        p_data_vencimento,
        p_valor,
        p_data_pagamento
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `criar_parcela_emprestimo` (IN `p_id` INTEGER, IN `p_emprestimo_id` INTEGER, IN `p_valor` DOUBLE, IN `p_data_vencimento` DATE, IN `p_data_pagamento` DATE)   BEGIN
    INSERT INTO parcela_emprestimo (
        id,
        emprestimo_id,
        valor,
        data_vencimento,
        data_pagamento
    ) VALUES (
        p_id,
        p_emprestimo_id,
        p_valor,
        p_data_vencimento,
        p_data_pagamento
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `criar_pessoa_fisica` (IN `p_Cpf` VARCHAR(11), IN `p_cliente_Id` INTEGER)   BEGIN
    INSERT INTO pessoa_fisica (
        Cpf,
        cliente_Id
    ) VALUES (
        p_Cpf,
        p_cliente_Id
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `criar_pessoa_juridica` (IN `p_Cnpj` VARCHAR(14), IN `p_cliente_Id` INTEGER)   BEGIN
    INSERT INTO pessoa_juridica (
        Cnpj,
        cliente_Id
    ) VALUES (
        p_Cnpj,
        p_cliente_Id
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `criar_seguro` (IN `p_id` INTEGER, IN `p_tipo_de_seguro_id` INTEGER, IN `p_cliente_Id` INTEGER, IN `p_vigencia` DATETIME)   BEGIN
    INSERT INTO seguro (
        id,
        tipo_de_seguro_id,
        cliente_Id,
        vigencia
    ) VALUES (
        p_id,
        p_tipo_de_seguro_id,
        p_cliente_Id,
        p_vigencia
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `criar_talao_de_cheque` (IN `p_id` INTEGER, IN `p_conta_corrente_especial_id` INTEGER, IN `p_numero_folha_final` INTEGER)   BEGIN
    INSERT INTO talao_de_cheque (
        id,
        conta_corrente_especial_id,
        numero_folha_final
    ) VALUES (
        p_id,
        p_conta_corrente_especial_id,
        p_numero_folha_final
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `criar_tipo_de_seguro` (IN `p_descricao` TEXT, IN `p_nome` VARCHAR(50))   BEGIN
    INSERT INTO tipo_de_seguro (
        descricao,
        nome
    ) VALUES (
        p_descricao,
        p_nome
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deletar_agencia_bancaria` (IN `p_numero` VARCHAR(10))   BEGIN
    DELETE FROM agencias_bancarias WHERE numero_da_agencia = p_numero;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deletar_bandeira_de_cartao` (IN `p_id` INTEGER)   BEGIN
    DELETE FROM bandeira_cartao WHERE bandeira_cartao.id = p_id;
            END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deletar_cartao_de_credito` (IN `p_numero` VARCHAR(10))   BEGIN
    DELETE FROM cartao_de_credito WHERE numero = p_numero;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deletar_cartao_movimentacao` (IN `p_cliente` INTEGER, IN `p_conta_bancaria` INTEGER)   BEGIN
            DELETE FROM cartao_movimentacao    
            WHERE cartao_movimentacao.conta_bancaria_id = p_conta_bancaria AND
            cartao_movimentacao.cliente_Id = p_cliente;
    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deletar_cliente` (IN `p_Id` INTEGER)   BEGIN
    DELETE FROM cliente WHERE Id = p_Id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deletar_compra` (IN `p_id` INTEGER)   BEGIN
    DELETE FROM compra WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deletar_conta_bancaria` (IN `p_id` INTEGER)   BEGIN
    DELETE FROM conta_bancaria WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deletar_conta_corrente` (IN `p_id` INTEGER)   BEGIN
    DELETE FROM conta_corrente WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deletar_conta_corrente_especial` (IN `p_id` INTEGER)   BEGIN
    DELETE FROM conta_corrente_especial WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deletar_conta_poupanca` (IN `p_id` INTEGER)   BEGIN
    DELETE FROM conta_poupanca WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deletar_convenio` (IN `p_id` INTEGER)   BEGIN
    DELETE FROM convenio WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deletar_debito_automatico` (IN `p_id` INTEGER)   BEGIN
    DELETE FROM debito_automatico WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deletar_emprestimo` (IN `p_id` INTEGER)   BEGIN
    DELETE FROM emprestimo WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deletar_estabelecimento` (IN `p_cnpj` VARCHAR(10))   BEGIN
    DELETE FROM Estabelecimento WHERE cnpj = p_cnpj;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deletar_fatura` (IN `p_id` INTEGER)   BEGIN
    DELETE FROM fatura WHERE Id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deletar_gerente_bancario` (IN `p_id` INTEGER)   BEGIN
    DELETE FROM gerente_bancario WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deletar_movimentacao` (IN `p_id` INTEGER)   BEGIN
    DELETE FROM movimentacao WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deletar_pagamento` (IN `p_id` INTEGER)   BEGIN
    DELETE FROM pagamento WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deletar_parcela_emprestimo` (IN `p_id` INTEGER)   BEGIN
    DELETE FROM parcela_emprestimo WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deletar_pessoa_fisica` (IN `p_Cpf` VARCHAR(11))   BEGIN
    DELETE FROM pessoa_fisica WHERE Cpf = p_Cpf;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deletar_pessoa_juridica` (IN `p_Cnpj` VARCHAR(14))   BEGIN
    DELETE FROM pessoa_juridica WHERE Cnpj = p_Cnpj;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deletar_seguro` (IN `p_id` INTEGER)   BEGIN
    DELETE FROM seguro WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deletar_talao_de_cheque` (IN `p_id` INTEGER)   BEGIN
    DELETE FROM talao_de_cheque WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deletar_tipo_de_seguro` (IN `p_id` INTEGER)   BEGIN
    DELETE FROM tipo_de_seguro WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ler_agencia_bancaria` (IN `p_numero` VARCHAR(10))   BEGIN
    SELECT * FROM agencias_bancarias WHERE numero_da_agencia = p_numero;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ler_bandeira_de_cartao` (IN `p_id` INTEGER)   BEGIN
    SELECT * FROM bandeira_cartao WHERE bandeira_cartao.id = p_id;
            END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ler_cartao_de_credito` (IN `p_numero` VARCHAR(10))   BEGIN
    SELECT * FROM cartao_de_credito WHERE numero = p_numero;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ler_cartao_movimentacao` (IN `p_cliente` INTEGER, IN `p_conta_bancaria` INTEGER)   BEGIN
            SELECT * FROM cartao_movimentacao WHERE cartao_movimentacao.conta_bancaria_id = p_conta_bancaria AND cartao_movimentacao.cliente_Id = p_cliente;
    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ler_cliente` (IN `p_Id` INTEGER)   BEGIN
    SELECT * FROM cliente WHERE Id = p_Id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ler_compra` (IN `p_id` INTEGER)   BEGIN
    SELECT * FROM compra WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ler_conta_bancaria` (IN `p_id` INTEGER)   BEGIN
    SELECT * FROM conta_bancaria WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ler_conta_corrente` (IN `p_id` INTEGER)   BEGIN
    SELECT * FROM conta_corrente WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ler_conta_corrente_especial` (IN `p_id` INTEGER)   BEGIN
    SELECT * FROM conta_corrente_especial WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ler_conta_poupanca` (IN `p_id` INTEGER)   BEGIN
    SELECT * FROM conta_poupanca WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ler_convenio` (IN `p_id` INTEGER)   BEGIN
    SELECT * FROM convenio WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ler_debito_automatico` (IN `p_id` INTEGER)   BEGIN
    SELECT * FROM debito_automatico WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ler_emprestimo` (IN `p_id` INTEGER)   BEGIN
    SELECT * FROM emprestimo WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ler_estabelecimento` (IN `p_cnpj` VARCHAR(10))   BEGIN
    SELECT * FROM Estabelecimento WHERE cnpj = p_cnpj;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ler_fatura` (IN `p_id` INTEGER)   BEGIN
    SELECT * FROM fatura WHERE Id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ler_gerente_bancario` (IN `p_id` INTEGER)   BEGIN
    SELECT * FROM gerente_bancario WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ler_movimentacao` (IN `p_id` INTEGER)   BEGIN
    SELECT * FROM movimentacao WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ler_pagamento` (IN `p_id` INTEGER)   BEGIN
    SELECT * FROM pagamento WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ler_parcela_emprestimo` (IN `p_id` INTEGER)   BEGIN
    SELECT * FROM parcela_emprestimo WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ler_pessoa_fisica` (IN `p_Cpf` VARCHAR(11))   BEGIN
    SELECT * FROM pessoa_fisica WHERE Cpf = p_Cpf;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ler_pessoa_juridica` (IN `p_Cnpj` VARCHAR(14))   BEGIN
    SELECT * FROM pessoa_juridica WHERE Cnpj = p_Cnpj;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ler_seguro` (IN `p_id` INTEGER)   BEGIN
    SELECT * FROM seguro WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ler_talao_de_cheque` (IN `p_id` INTEGER)   BEGIN
    SELECT * FROM talao_de_cheque WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ler_tipo_de_seguro` (IN `p_id` INTEGER)   BEGIN
    SELECT * FROM tipo_de_seguro WHERE id = p_id;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `agencias_bancarias`
--

CREATE TABLE `agencias_bancarias` (
  `numero_da_agencia` varchar(10) NOT NULL,
  `descricao` text DEFAULT NULL,
  `cidade` varchar(30) DEFAULT NULL,
  `bairro` varchar(50) DEFAULT NULL,
  `rua` varchar(50) DEFAULT NULL,
  `complemento` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `agencias_bancarias`
--

INSERT INTO `agencias_bancarias` (`numero_da_agencia`, `descricao`, `cidade`, `bairro`, `rua`, `complemento`) VALUES
('0001', 'Agência Central', 'São Paulo', 'Centro', 'Rua A', '1º Andar'),
('0002', 'Agência Norte', 'São Paulo', 'Norte', 'Rua B', '2º Andar'),
('0003', 'Agência Sul', 'São Paulo', 'Sul', 'Rua C', '3º Andar'),
('0004', 'Agência Leste', 'São Paulo', 'Leste', 'Rua D', '4º Andar'),
('0005', 'Agência Oeste', 'São Paulo', 'Oeste', 'Rua E', '5º Andar'),
('0006', 'Agência Centro-Sul', 'São Paulo', 'Centro-Sul', 'Rua F', '6º Andar'),
('0007', 'Agência Centro-Norte', 'São Paulo', 'Centro-Norte', 'Rua G', '7º Andar'),
('0008', 'Agência Centro-Oeste', 'São Paulo', 'Centro-Oeste', 'Rua H', '8º Andar'),
('0009', 'Agência Centro-Leste', 'São Paulo', 'Centro-Leste', 'Rua I', '9º Andar'),
('0010', 'Agência Central 2', 'São Paulo', 'Centro', 'Rua J', '10º Andar');

-- --------------------------------------------------------

--
-- Estrutura para tabela `bandeira_cartao`
--

CREATE TABLE `bandeira_cartao` (
  `id` int(11) NOT NULL,
  `bandeira` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `bandeira_cartao`
--

INSERT INTO `bandeira_cartao` (`id`, `bandeira`) VALUES
(1, 'Visa'),
(2, 'MasterCard'),
(3, 'American Express'),
(4, 'Discover'),
(5, 'Diners Club'),
(6, 'JCB'),
(7, 'Elo'),
(8, 'Hipercard'),
(9, 'UnionPay'),
(10, 'Cabal');

-- --------------------------------------------------------

--
-- Estrutura para tabela `cartao_de_credito`
--

CREATE TABLE `cartao_de_credito` (
  `numero` varchar(10) NOT NULL,
  `bandeira_cartao_id` int(11) NOT NULL,
  `cliente_Id` int(11) NOT NULL,
  `data_validade` date DEFAULT NULL,
  `limite` double DEFAULT NULL,
  `codigo_seguranca` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cartao_de_credito`
--

INSERT INTO `cartao_de_credito` (`numero`, `bandeira_cartao_id`, `cliente_Id`, `data_validade`, `limite`, `codigo_seguranca`) VALUES
('0123456789', 10, 10, '2025-10-01', 14000, '012'),
('1234567890', 1, 1, '2025-01-01', 5000, '123'),
('2345678901', 2, 2, '2025-02-01', 6000, '234'),
('3456789012', 3, 3, '2025-03-01', 7000, '345'),
('4567890123', 4, 4, '2025-04-01', 8000, '456'),
('5678901234', 5, 5, '2025-05-01', 9000, '567'),
('6789012345', 6, 6, '2025-06-01', 10000, '678'),
('7890123456', 7, 7, '2025-07-01', 11000, '789'),
('8901234567', 8, 8, '2025-08-01', 12000, '890'),
('9012345678', 9, 9, '2025-09-01', 13000, '901');

-- --------------------------------------------------------

--
-- Estrutura para tabela `cartao_movimentacao`
--

CREATE TABLE `cartao_movimentacao` (
  `conta_bancaria_id` int(11) NOT NULL,
  `cliente_Id` int(11) NOT NULL,
  `senha` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cartao_movimentacao`
--

INSERT INTO `cartao_movimentacao` (`conta_bancaria_id`, `cliente_Id`, `senha`) VALUES
(1, 1, 'senha1'),
(2, 2, 'senha2'),
(3, 3, 'senha3'),
(4, 4, 'senha4'),
(5, 5, 'senha5'),
(6, 6, 'senha6'),
(7, 7, 'senha7'),
(8, 8, 'senha8'),
(9, 9, 'senha9'),
(10, 10, 'senha10');

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `Id` int(11) NOT NULL,
  `agencias_bancarias_numero_da_agencia` varchar(10) DEFAULT NULL,
  `Nome` varchar(20) DEFAULT NULL,
  `telefone` varchar(11) DEFAULT NULL,
  `tipo_pessoa` varchar(2) DEFAULT NULL,
  `rua` varchar(50) DEFAULT NULL,
  `bairro` varchar(50) DEFAULT NULL,
  `Complemento` varchar(50) DEFAULT NULL,
  `sobrenome` varchar(50) DEFAULT NULL,
  `cidade` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`Id`, `agencias_bancarias_numero_da_agencia`, `Nome`, `telefone`, `tipo_pessoa`, `rua`, `bairro`, `Complemento`, `sobrenome`, `cidade`) VALUES
(1, '0001', 'João', '11111111111', 'PF', 'Rua A', 'Centro', 'Apto 1', 'Silva', 'São Paulo'),
(2, '0002', 'Maria', '22222222222', 'PF', 'Rua B', 'Norte', 'Casa 2', 'Santos', 'São Paulo'),
(3, '0003', 'José', '33333333333', 'PF', 'Rua C', 'Sul', 'Apto 3', 'Oliveira', 'São Paulo'),
(4, '0004', 'Ana', '44444444444', 'PF', 'Rua D', 'Leste', 'Casa 4', 'Pereira', 'São Paulo'),
(5, '0005', 'Carlos', '55555555555', 'PF', 'Rua E', 'Oeste', 'Apto 5', 'Costa', 'São Paulo'),
(6, '0006', 'Mariana', '66666666666', 'PF', 'Rua F', 'Centro-Sul', 'Casa 6', 'Alves', 'São Paulo'),
(7, '0007', 'Fernando', '77777777777', 'PF', 'Rua G', 'Centro-Norte', 'Apto 7', 'Martins', 'São Paulo'),
(8, '0008', 'Aline', '88888888888', 'PF', 'Rua H', 'Centro-Oeste', 'Casa 8', 'Lima', 'São Paulo'),
(9, '0009', 'Ricardo', '99999999999', 'PF', 'Rua I', 'Centro-Leste', 'Apto 9', 'Barbosa', 'São Paulo'),
(10, '0010', 'Juliana', '1010101010', 'PF', 'Rua J', 'Centro', 'Casa 10', 'Rocha', 'São Paulo');

-- --------------------------------------------------------

--
-- Estrutura para tabela `compra`
--

CREATE TABLE `compra` (
  `id` int(11) NOT NULL,
  `fatura_Id` int(11) NOT NULL,
  `valor` double DEFAULT NULL,
  `numero_parcelas` int(11) DEFAULT NULL,
  `data_2` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `compra`
--

INSERT INTO `compra` (`id`, `fatura_Id`, `valor`, `numero_parcelas`, `data_2`) VALUES
(1, 1, 500, 5, '2024-01-01'),
(2, 2, 600, 6, '2024-02-01'),
(3, 3, 700, 7, '2024-03-01'),
(4, 4, 800, 8, '2024-04-01'),
(5, 5, 900, 9, '2024-05-01'),
(6, 6, 1000, 10, '2024-06-01'),
(7, 7, 1100, 11, '2024-07-01'),
(8, 8, 1200, 12, '2024-08-01'),
(9, 9, 1300, 13, '2024-09-01'),
(10, 10, 1400, 14, '2024-10-01');

-- --------------------------------------------------------

--
-- Estrutura para tabela `conta_bancaria`
--

CREATE TABLE `conta_bancaria` (
  `id` int(11) NOT NULL,
  `tipo` varchar(30) DEFAULT NULL,
  `saldo` double DEFAULT NULL,
  `conjunta` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `conta_bancaria`
--

INSERT INTO `conta_bancaria` (`id`, `tipo`, `saldo`, `conjunta`) VALUES
(1, 'Corrente', 1000, 1),
(2, 'Poupança', 2000, 0),
(3, 'Corrente', 1500, 1),
(4, 'Poupança', 2500, 0),
(5, 'Corrente', 3000, 1),
(6, 'Poupança', 3500, 0),
(7, 'Corrente', 4000, 1),
(8, 'Poupança', 4500, 0),
(9, 'Corrente', 5000, 1),
(10, 'Poupança', 5500, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `conta_corrente`
--

CREATE TABLE `conta_corrente` (
  `id` int(11) NOT NULL,
  `conta_bancaria_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `conta_corrente`
--

INSERT INTO `conta_corrente` (`id`, `conta_bancaria_id`) VALUES
(1, 1),
(6, 1),
(2, 3),
(7, 3),
(3, 5),
(8, 5),
(4, 7),
(9, 7),
(5, 9),
(10, 9);

-- --------------------------------------------------------

--
-- Estrutura para tabela `conta_corrente_especial`
--

CREATE TABLE `conta_corrente_especial` (
  `id` int(11) NOT NULL,
  `conta_corrente_id` int(11) NOT NULL,
  `limite` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `conta_corrente_especial`
--

INSERT INTO `conta_corrente_especial` (`id`, `conta_corrente_id`, `limite`) VALUES
(1, 1, 500),
(2, 2, 600),
(3, 3, 700),
(4, 4, 800),
(5, 5, 900),
(6, 6, 1000),
(7, 7, 1100),
(8, 8, 1200),
(9, 9, 1300),
(10, 10, 1400);

-- --------------------------------------------------------

--
-- Estrutura para tabela `conta_poupanca`
--

CREATE TABLE `conta_poupanca` (
  `id` int(11) NOT NULL,
  `conta_bancaria_id` int(11) NOT NULL,
  `data_aniversario` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `conta_poupanca`
--

INSERT INTO `conta_poupanca` (`id`, `conta_bancaria_id`, `data_aniversario`) VALUES
(1, 2, '2024-01-01'),
(2, 4, '2024-01-02'),
(3, 6, '2024-01-03'),
(4, 8, '2024-01-04'),
(5, 10, '2024-01-05');

-- --------------------------------------------------------

--
-- Estrutura para tabela `convenio`
--

CREATE TABLE `convenio` (
  `id` int(11) NOT NULL,
  `debito_automatico_id` int(11) NOT NULL,
  `nome` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `convenio`
--

INSERT INTO `convenio` (`id`, `debito_automatico_id`, `nome`) VALUES
(1, 1, 'Convenio 1'),
(2, 2, 'Convenio 2'),
(3, 3, 'Convenio 3'),
(4, 4, 'Convenio 4'),
(5, 5, 'Convenio 5'),
(6, 6, 'Convenio 6'),
(7, 7, 'Convenio 7'),
(8, 8, 'Convenio 8'),
(9, 9, 'Convenio 9'),
(10, 10, 'Convenio 10');

-- --------------------------------------------------------

--
-- Estrutura para tabela `debito_automatico`
--

CREATE TABLE `debito_automatico` (
  `id` int(11) NOT NULL,
  `conta_bancaria_id` int(11) NOT NULL,
  `codigo` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `debito_automatico`
--

INSERT INTO `debito_automatico` (`id`, `conta_bancaria_id`, `codigo`) VALUES
(1, 1, 'DA001'),
(2, 2, 'DA002'),
(3, 3, 'DA003'),
(4, 4, 'DA004'),
(5, 5, 'DA005'),
(6, 6, 'DA006'),
(7, 7, 'DA007'),
(8, 8, 'DA008'),
(9, 9, 'DA009'),
(10, 10, 'DA010');

-- --------------------------------------------------------

--
-- Estrutura para tabela `emprestimo`
--

CREATE TABLE `emprestimo` (
  `id` int(11) NOT NULL,
  `conta_bancaria_id` int(11) NOT NULL,
  `valor` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `emprestimo`
--

INSERT INTO `emprestimo` (`id`, `conta_bancaria_id`, `valor`) VALUES
(1, 1, 5000),
(2, 2, 6000),
(3, 3, 7000),
(4, 4, 8000),
(5, 5, 9000),
(6, 6, 10000),
(7, 7, 11000),
(8, 8, 12000),
(9, 9, 13000),
(10, 10, 14000);

-- --------------------------------------------------------

--
-- Estrutura para tabela `estabelecimento`
--

CREATE TABLE `estabelecimento` (
  `cnpj` varchar(10) NOT NULL,
  `compra_id` int(11) NOT NULL,
  `razao_social` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `estabelecimento`
--

INSERT INTO `estabelecimento` (`cnpj`, `compra_id`, `razao_social`) VALUES
('0123456700', 10, 'Estabelecimento 10'),
('1234567800', 1, 'Estabelecimento 1'),
('2345678900', 2, 'Estabelecimento 2'),
('3456789000', 3, 'Estabelecimento 3'),
('4567890100', 4, 'Estabelecimento 4'),
('5678901200', 5, 'Estabelecimento 5'),
('6789012300', 6, 'Estabelecimento 6'),
('7890123400', 7, 'Estabelecimento 7'),
('8901234500', 8, 'Estabelecimento 8'),
('9012345600', 9, 'Estabelecimento 9');

-- --------------------------------------------------------

--
-- Estrutura para tabela `fatura`
--

CREATE TABLE `fatura` (
  `Id` int(11) NOT NULL,
  `cartao_movimentacao_de_credito_numero` varchar(10) NOT NULL,
  `ano_de_competencia` date DEFAULT NULL,
  `mes_de_competencia` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `fatura`
--

INSERT INTO `fatura` (`Id`, `cartao_movimentacao_de_credito_numero`, `ano_de_competencia`, `mes_de_competencia`) VALUES
(1, '1234567890', '2024-01-01', '2024-01-01'),
(2, '2345678901', '2024-02-01', '2024-02-01'),
(3, '3456789012', '2024-03-01', '2024-03-01'),
(4, '4567890123', '2024-04-01', '2024-04-01'),
(5, '5678901234', '2024-05-01', '2024-05-01'),
(6, '6789012345', '2024-06-01', '2024-06-01'),
(7, '7890123456', '2024-07-01', '2024-07-01'),
(8, '8901234567', '2024-08-01', '2024-08-01'),
(9, '9012345678', '2024-09-01', '2024-09-01'),
(10, '0123456789', '2024-10-01', '2024-10-01');

-- --------------------------------------------------------

--
-- Estrutura para tabela `gerente_bancario`
--

CREATE TABLE `gerente_bancario` (
  `id` int(11) NOT NULL,
  `agencias_bancarias_numero_da_agencia` varchar(10) NOT NULL,
  `nome` varchar(20) DEFAULT NULL,
  `sobrenome` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `gerente_bancario`
--

INSERT INTO `gerente_bancario` (`id`, `agencias_bancarias_numero_da_agencia`, `nome`, `sobrenome`) VALUES
(1, '0001', 'João', 'Silva'),
(2, '0002', 'Maria', 'Santos'),
(3, '0003', 'José', 'Oliveira'),
(4, '0004', 'Ana', 'Pereira'),
(5, '0005', 'Carlos', 'Costa'),
(6, '0006', 'Mariana', 'Alves'),
(7, '0007', 'Fernando', 'Martins'),
(8, '0008', 'Aline', 'Lima'),
(9, '0009', 'Ricardo', 'Barbosa'),
(10, '0010', 'Juliana', 'Rocha');

-- --------------------------------------------------------

--
-- Estrutura para tabela `movimentacao`
--

CREATE TABLE `movimentacao` (
  `id` int(11) NOT NULL,
  `conta_bancaria_id` int(11) NOT NULL,
  `data` date DEFAULT NULL,
  `valor` double DEFAULT NULL,
  `tipo` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `movimentacao`
--

INSERT INTO `movimentacao` (`id`, `conta_bancaria_id`, `data`, `valor`, `tipo`) VALUES
(1, 1, '2024-01-01', 100, 'Depósito'),
(2, 2, '2024-01-02', 200, 'Saque'),
(3, 3, '2024-01-03', 150, 'Depósito'),
(4, 4, '2024-01-04', 250, 'Saque'),
(5, 5, '2024-01-05', 300, 'Depósito'),
(6, 6, '2024-01-06', 350, 'Saque'),
(7, 7, '2024-01-07', 400, 'Depósito'),
(8, 8, '2024-01-08', 450, 'Saque'),
(9, 9, '2024-01-09', 500, 'Depósito'),
(10, 10, '2024-01-10', 550, 'Saque');

-- --------------------------------------------------------

--
-- Estrutura para tabela `pagamento`
--

CREATE TABLE `pagamento` (
  `id` int(11) NOT NULL,
  `fatura_Id` int(11) NOT NULL,
  `data_vencimento` date DEFAULT NULL,
  `valor` double DEFAULT NULL,
  `data_pagamento` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `pagamento`
--

INSERT INTO `pagamento` (`id`, `fatura_Id`, `data_vencimento`, `valor`, `data_pagamento`) VALUES
(1, 1, '2024-02-01', 500, '2024-02-01'),
(2, 2, '2024-03-01', 600, '2024-03-01'),
(3, 3, '2024-04-01', 700, '2024-04-01'),
(4, 4, '2024-05-01', 800, '2024-05-01'),
(5, 5, '2024-06-01', 900, '2024-06-01'),
(6, 6, '2024-07-01', 1000, '2024-07-01'),
(7, 7, '2024-08-01', 1100, '2024-08-01'),
(8, 8, '2024-09-01', 1200, '2024-09-01'),
(9, 9, '2024-10-01', 1300, '2024-10-01'),
(10, 10, '2024-11-01', 1400, '2024-11-01');

-- --------------------------------------------------------

--
-- Estrutura para tabela `parcela_emprestimo`
--

CREATE TABLE `parcela_emprestimo` (
  `id` int(11) NOT NULL,
  `emprestimo_id` int(11) NOT NULL,
  `valor` double DEFAULT NULL,
  `data_vencimento` date DEFAULT NULL,
  `data_pagamento` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `parcela_emprestimo`
--

INSERT INTO `parcela_emprestimo` (`id`, `emprestimo_id`, `valor`, `data_vencimento`, `data_pagamento`) VALUES
(1, 1, 500, '2024-02-01', '2024-02-01'),
(2, 2, 600, '2024-03-01', '2024-03-01'),
(3, 3, 700, '2024-04-01', '2024-04-01'),
(4, 4, 800, '2024-05-01', '2024-05-01'),
(5, 5, 900, '2024-06-01', '2024-06-01'),
(6, 6, 1000, '2024-07-01', '2024-07-01'),
(7, 7, 1100, '2024-08-01', '2024-08-01'),
(8, 8, 1200, '2024-09-01', '2024-09-01'),
(9, 9, 1300, '2024-10-01', '2024-10-01'),
(10, 10, 1400, '2024-11-01', '2024-11-01');

-- --------------------------------------------------------

--
-- Estrutura para tabela `pessoa_fisica`
--

CREATE TABLE `pessoa_fisica` (
  `Cpf` varchar(11) NOT NULL,
  `cliente_Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `pessoa_fisica`
--

INSERT INTO `pessoa_fisica` (`Cpf`, `cliente_Id`) VALUES
('12345678901', 1),
('23456789012', 2),
('34567890123', 3),
('45678901234', 4),
('56789012345', 5),
('67890123456', 6),
('78901234567', 7),
('89012345678', 8),
('90123456789', 9),
('01234567890', 10);

-- --------------------------------------------------------

--
-- Estrutura para tabela `pessoa_juridica`
--

CREATE TABLE `pessoa_juridica` (
  `Cnpj` varchar(14) NOT NULL,
  `cliente_Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `pessoa_juridica`
--

INSERT INTO `pessoa_juridica` (`Cnpj`, `cliente_Id`) VALUES
('12345678000101', 1),
('23456789000102', 2),
('34567890000103', 3),
('45678901000104', 4),
('56789012000105', 5),
('67890123000106', 6),
('78901234000107', 7),
('89012345000108', 8),
('90123456000109', 9),
('01234567000110', 10);

-- --------------------------------------------------------

--
-- Estrutura para tabela `seguro`
--

CREATE TABLE `seguro` (
  `id` int(11) NOT NULL,
  `tipo_de_seguro_id` int(11) NOT NULL,
  `cliente_Id` int(11) NOT NULL,
  `vigencia` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `seguro`
--

INSERT INTO `seguro` (`id`, `tipo_de_seguro_id`, `cliente_Id`, `vigencia`) VALUES
(1, 1, 1, '2024-01-01 00:00:00'),
(2, 2, 2, '2024-02-01 00:00:00'),
(3, 3, 3, '2024-03-01 00:00:00'),
(4, 4, 4, '2024-04-01 00:00:00'),
(5, 5, 5, '2024-05-01 00:00:00'),
(6, 6, 6, '2024-06-01 00:00:00'),
(7, 7, 7, '2024-07-01 00:00:00'),
(8, 8, 8, '2024-08-01 00:00:00'),
(9, 9, 9, '2024-09-01 00:00:00'),
(10, 10, 10, '2024-10-01 00:00:00');

-- --------------------------------------------------------

--
-- Estrutura para tabela `talao_de_cheque`
--

CREATE TABLE `talao_de_cheque` (
  `id` int(11) NOT NULL,
  `conta_corrente_especial_id` int(11) NOT NULL,
  `numero_folha_final` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `talao_de_cheque`
--

INSERT INTO `talao_de_cheque` (`id`, `conta_corrente_especial_id`, `numero_folha_final`) VALUES
(1, 1, 50),
(2, 2, 60),
(3, 3, 70),
(4, 4, 80),
(5, 5, 90),
(6, 6, 100),
(7, 7, 110),
(8, 8, 120),
(9, 9, 130),
(10, 10, 140);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tipo_de_seguro`
--

CREATE TABLE `tipo_de_seguro` (
  `id` int(11) NOT NULL,
  `descricao` text DEFAULT NULL,
  `nome` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tipo_de_seguro`
--

INSERT INTO `tipo_de_seguro` (`id`, `descricao`, `nome`) VALUES
(1, 'Seguro de Vida', 'Vida'),
(2, 'Seguro de Saúde', 'Saúde'),
(3, 'Seguro de Automóvel', 'Automóvel'),
(4, 'Seguro Residencial', 'Residencial'),
(5, 'Seguro Viagem', 'Viagem'),
(6, 'Seguro de Equipamentos', 'Equipamentos'),
(7, 'Seguro de Acidentes Pessoais', 'Acidentes Pessoais'),
(8, 'Seguro Empresarial', 'Empresarial'),
(9, 'Seguro Educacional', 'Educacional'),
(10, 'Seguro Pet', 'Pet');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `agencias_bancarias`
--
ALTER TABLE `agencias_bancarias`
  ADD PRIMARY KEY (`numero_da_agencia`);

--
-- Índices de tabela `bandeira_cartao`
--
ALTER TABLE `bandeira_cartao`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `cartao_de_credito`
--
ALTER TABLE `cartao_de_credito`
  ADD PRIMARY KEY (`numero`),
  ADD KEY `cartao_de_credito_FKIndex1` (`cliente_Id`),
  ADD KEY `cartao_de_credito_FKIndex2` (`bandeira_cartao_id`),
  ADD KEY `IFK_possui` (`cliente_Id`),
  ADD KEY `IFK_Rel_25` (`bandeira_cartao_id`);

--
-- Índices de tabela `cartao_movimentacao`
--
ALTER TABLE `cartao_movimentacao`
  ADD PRIMARY KEY (`conta_bancaria_id`,`cliente_Id`),
  ADD KEY `cliente_has_conta_bancaria_FKIndex2` (`conta_bancaria_id`),
  ADD KEY `proprietario_da_conta_FKIndex2` (`cliente_Id`),
  ADD KEY `IFK_possui` (`cliente_Id`),
  ADD KEY `IFK_possui2` (`conta_bancaria_id`);

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `cliente_FKIndex1` (`agencias_bancarias_numero_da_agencia`),
  ADD KEY `IFK_comporta` (`agencias_bancarias_numero_da_agencia`);

--
-- Índices de tabela `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`id`),
  ADD KEY `compra_FKIndex1` (`fatura_Id`),
  ADD KEY `IFK_retem` (`fatura_Id`);

--
-- Índices de tabela `conta_bancaria`
--
ALTER TABLE `conta_bancaria`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `conta_corrente`
--
ALTER TABLE `conta_corrente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `conta_corrente_FKIndex1` (`conta_bancaria_id`),
  ADD KEY `IFK_conserva` (`conta_bancaria_id`);

--
-- Índices de tabela `conta_corrente_especial`
--
ALTER TABLE `conta_corrente_especial`
  ADD PRIMARY KEY (`id`),
  ADD KEY `conta_corrente_especial_FKIndex1` (`conta_corrente_id`),
  ADD KEY `IFK_tipo` (`conta_corrente_id`);

--
-- Índices de tabela `conta_poupanca`
--
ALTER TABLE `conta_poupanca`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `conta_bancaria_id` (`conta_bancaria_id`),
  ADD UNIQUE KEY `conta_bancaria_id_2` (`conta_bancaria_id`),
  ADD KEY `conta_poupanca_FKIndex1` (`conta_bancaria_id`),
  ADD KEY `IFK_categoria` (`conta_bancaria_id`);

--
-- Índices de tabela `convenio`
--
ALTER TABLE `convenio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `convenio_FKIndex1` (`debito_automatico_id`),
  ADD KEY `IFK_possui` (`debito_automatico_id`);

--
-- Índices de tabela `debito_automatico`
--
ALTER TABLE `debito_automatico`
  ADD PRIMARY KEY (`id`),
  ADD KEY `debito_automatico_FKIndex1` (`conta_bancaria_id`),
  ADD KEY `IFK_factivel` (`conta_bancaria_id`);

--
-- Índices de tabela `emprestimo`
--
ALTER TABLE `emprestimo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `emprestimo_FKIndex1` (`conta_bancaria_id`),
  ADD KEY `IFK_para` (`conta_bancaria_id`);

--
-- Índices de tabela `estabelecimento`
--
ALTER TABLE `estabelecimento`
  ADD PRIMARY KEY (`cnpj`),
  ADD KEY `Estabelecimento_FKIndex1` (`compra_id`),
  ADD KEY `IFK_Provem` (`compra_id`);

--
-- Índices de tabela `fatura`
--
ALTER TABLE `fatura`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `fatura_FKIndex1` (`cartao_movimentacao_de_credito_numero`),
  ADD KEY `IFK_envia` (`cartao_movimentacao_de_credito_numero`);

--
-- Índices de tabela `gerente_bancario`
--
ALTER TABLE `gerente_bancario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gerente_bancario_FKIndex1` (`agencias_bancarias_numero_da_agencia`),
  ADD KEY `IFK_integra` (`agencias_bancarias_numero_da_agencia`);

--
-- Índices de tabela `movimentacao`
--
ALTER TABLE `movimentacao`
  ADD PRIMARY KEY (`id`),
  ADD KEY `movimentacao_FKIndex1` (`conta_bancaria_id`),
  ADD KEY `IFK_contem` (`conta_bancaria_id`);

--
-- Índices de tabela `pagamento`
--
ALTER TABLE `pagamento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pagamento_FKIndex1` (`fatura_Id`),
  ADD KEY `IFK_Compoem` (`fatura_Id`);

--
-- Índices de tabela `parcela_emprestimo`
--
ALTER TABLE `parcela_emprestimo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parcela_emprestimo_FKIndex1` (`emprestimo_id`),
  ADD KEY `IFK_valor` (`emprestimo_id`);

--
-- Índices de tabela `pessoa_fisica`
--
ALTER TABLE `pessoa_fisica`
  ADD PRIMARY KEY (`Cpf`),
  ADD KEY `pessoa_fisica_FKIndex1` (`cliente_Id`),
  ADD KEY `IFK_para` (`cliente_Id`);

--
-- Índices de tabela `pessoa_juridica`
--
ALTER TABLE `pessoa_juridica`
  ADD PRIMARY KEY (`Cnpj`),
  ADD KEY `pessoa_juridica_FKIndex1` (`cliente_Id`),
  ADD KEY `IFK_para` (`cliente_Id`);

--
-- Índices de tabela `seguro`
--
ALTER TABLE `seguro`
  ADD PRIMARY KEY (`id`),
  ADD KEY `seguro_FKIndex1` (`cliente_Id`),
  ADD KEY `seguro_FKIndex2` (`tipo_de_seguro_id`),
  ADD KEY `IFK_tipo` (`cliente_Id`),
  ADD KEY `IFK_possui` (`tipo_de_seguro_id`);

--
-- Índices de tabela `talao_de_cheque`
--
ALTER TABLE `talao_de_cheque`
  ADD PRIMARY KEY (`id`),
  ADD KEY `talao_de_cheque_FKIndex1` (`conta_corrente_especial_id`),
  ADD KEY `IFK_contem` (`conta_corrente_especial_id`);

--
-- Índices de tabela `tipo_de_seguro`
--
ALTER TABLE `tipo_de_seguro`
  ADD PRIMARY KEY (`id`);

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `cartao_de_credito`
--
ALTER TABLE `cartao_de_credito`
  ADD CONSTRAINT `cartao_de_credito_ibfk_1` FOREIGN KEY (`cliente_Id`) REFERENCES `cliente` (`Id`),
  ADD CONSTRAINT `cartao_de_credito_ibfk_2` FOREIGN KEY (`bandeira_cartao_id`) REFERENCES `bandeira_cartao` (`id`);

--
-- Restrições para tabelas `cartao_movimentacao`
--
ALTER TABLE `cartao_movimentacao`
  ADD CONSTRAINT `cartao_movimentacao_ibfk_1` FOREIGN KEY (`cliente_Id`) REFERENCES `cliente` (`Id`),
  ADD CONSTRAINT `cartao_movimentacao_ibfk_2` FOREIGN KEY (`conta_bancaria_id`) REFERENCES `conta_bancaria` (`id`);

--
-- Restrições para tabelas `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`agencias_bancarias_numero_da_agencia`) REFERENCES `agencias_bancarias` (`numero_da_agencia`);

--
-- Restrições para tabelas `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `compra_ibfk_1` FOREIGN KEY (`fatura_Id`) REFERENCES `fatura` (`Id`);

--
-- Restrições para tabelas `conta_corrente`
--
ALTER TABLE `conta_corrente`
  ADD CONSTRAINT `conta_corrente_ibfk_1` FOREIGN KEY (`conta_bancaria_id`) REFERENCES `conta_bancaria` (`id`);

--
-- Restrições para tabelas `conta_corrente_especial`
--
ALTER TABLE `conta_corrente_especial`
  ADD CONSTRAINT `conta_corrente_especial_ibfk_1` FOREIGN KEY (`conta_corrente_id`) REFERENCES `conta_corrente` (`id`);

--
-- Restrições para tabelas `conta_poupanca`
--
ALTER TABLE `conta_poupanca`
  ADD CONSTRAINT `conta_poupanca_ibfk_1` FOREIGN KEY (`conta_bancaria_id`) REFERENCES `conta_bancaria` (`id`);

--
-- Restrições para tabelas `convenio`
--
ALTER TABLE `convenio`
  ADD CONSTRAINT `convenio_ibfk_1` FOREIGN KEY (`debito_automatico_id`) REFERENCES `debito_automatico` (`id`);

--
-- Restrições para tabelas `debito_automatico`
--
ALTER TABLE `debito_automatico`
  ADD CONSTRAINT `debito_automatico_ibfk_1` FOREIGN KEY (`conta_bancaria_id`) REFERENCES `conta_bancaria` (`id`);

--
-- Restrições para tabelas `emprestimo`
--
ALTER TABLE `emprestimo`
  ADD CONSTRAINT `emprestimo_ibfk_1` FOREIGN KEY (`conta_bancaria_id`) REFERENCES `conta_bancaria` (`id`);

--
-- Restrições para tabelas `estabelecimento`
--
ALTER TABLE `estabelecimento`
  ADD CONSTRAINT `estabelecimento_ibfk_1` FOREIGN KEY (`compra_id`) REFERENCES `compra` (`id`);

--
-- Restrições para tabelas `fatura`
--
ALTER TABLE `fatura`
  ADD CONSTRAINT `fatura_ibfk_1` FOREIGN KEY (`cartao_movimentacao_de_credito_numero`) REFERENCES `cartao_de_credito` (`numero`);

--
-- Restrições para tabelas `gerente_bancario`
--
ALTER TABLE `gerente_bancario`
  ADD CONSTRAINT `gerente_bancario_ibfk_1` FOREIGN KEY (`agencias_bancarias_numero_da_agencia`) REFERENCES `agencias_bancarias` (`numero_da_agencia`);

--
-- Restrições para tabelas `movimentacao`
--
ALTER TABLE `movimentacao`
  ADD CONSTRAINT `movimentacao_ibfk_1` FOREIGN KEY (`conta_bancaria_id`) REFERENCES `conta_bancaria` (`id`);

--
-- Restrições para tabelas `pagamento`
--
ALTER TABLE `pagamento`
  ADD CONSTRAINT `pagamento_ibfk_1` FOREIGN KEY (`fatura_Id`) REFERENCES `fatura` (`Id`);

--
-- Restrições para tabelas `parcela_emprestimo`
--
ALTER TABLE `parcela_emprestimo`
  ADD CONSTRAINT `parcela_emprestimo_ibfk_1` FOREIGN KEY (`emprestimo_id`) REFERENCES `emprestimo` (`id`);

--
-- Restrições para tabelas `pessoa_fisica`
--
ALTER TABLE `pessoa_fisica`
  ADD CONSTRAINT `pessoa_fisica_ibfk_1` FOREIGN KEY (`cliente_Id`) REFERENCES `cliente` (`Id`);

--
-- Restrições para tabelas `pessoa_juridica`
--
ALTER TABLE `pessoa_juridica`
  ADD CONSTRAINT `pessoa_juridica_ibfk_1` FOREIGN KEY (`cliente_Id`) REFERENCES `cliente` (`Id`);

--
-- Restrições para tabelas `seguro`
--
ALTER TABLE `seguro`
  ADD CONSTRAINT `seguro_ibfk_1` FOREIGN KEY (`cliente_Id`) REFERENCES `cliente` (`Id`),
  ADD CONSTRAINT `seguro_ibfk_2` FOREIGN KEY (`tipo_de_seguro_id`) REFERENCES `tipo_de_seguro` (`id`);

--
-- Restrições para tabelas `talao_de_cheque`
--
ALTER TABLE `talao_de_cheque`
  ADD CONSTRAINT `talao_de_cheque_ibfk_1` FOREIGN KEY (`conta_corrente_especial_id`) REFERENCES `conta_corrente_especial` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
