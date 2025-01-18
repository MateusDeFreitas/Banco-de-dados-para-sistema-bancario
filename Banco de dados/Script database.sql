CREATE TABLE tipo_de_seguro (
  id INTEGER   NOT NULL ,
  descricao TEXT    ,
  nome VARCHAR(50)      ,
PRIMARY KEY(id));




CREATE TABLE conta_bancaria (
  id INTEGER   NOT NULL ,
  tipo VARCHAR(30)    ,
  saldo DOUBLE    ,
  conjunta BOOLean      ,
PRIMARY KEY(id));




CREATE TABLE agencias_bancarias (
  numero_da_agencia VARCHAR(10)   NOT NULL ,
  descricao TEXT    ,
  cidade VARCHAR(30)    ,
  bairro VARCHAR(50)    ,
  rua VARCHAR(50)    ,
  complemento VARCHAR(20)      ,
PRIMARY KEY(numero_da_agencia));




CREATE TABLE bandeira_cartao (
  id INTEGER   NOT NULL ,
  bandeira VARCHAR(50)      ,
PRIMARY KEY(id));




CREATE TABLE movimentacao (
  id INTEGER   NOT NULL ,
  conta_bancaria_id INTEGER   NOT NULL ,
   data DATE    ,
  valor DOUBLE    ,
  tipo VARCHAR(30)      ,
PRIMARY KEY(id)  ,
  FOREIGN KEY(conta_bancaria_id)
    REFERENCES conta_bancaria(id));


CREATE INDEX movimentacao_FKIndex1 ON movimentacao (conta_bancaria_id);


CREATE INDEX IFK_contem ON movimentacao (conta_bancaria_id);


CREATE TABLE gerente_bancario (
  id INTEGER   NOT NULL ,
  agencias_bancarias_numero_da_agencia VARCHAR(10)   NOT NULL ,
  nome VARCHAR(20)    ,
  sobrenome VARCHAR(50)      ,
PRIMARY KEY(id)  ,
  FOREIGN KEY(agencias_bancarias_numero_da_agencia)
    REFERENCES agencias_bancarias(numero_da_agencia));


CREATE INDEX gerente_bancario_FKIndex1 ON gerente_bancario (agencias_bancarias_numero_da_agencia);


CREATE INDEX IFK_integra ON gerente_bancario (agencias_bancarias_numero_da_agencia);


CREATE TABLE conta_corrente (
  id INTEGER   NOT NULL ,
  conta_bancaria_id INTEGER   NOT NULL   ,
PRIMARY KEY(id)  ,
  FOREIGN KEY(conta_bancaria_id)
    REFERENCES conta_bancaria(id));


CREATE INDEX conta_corrente_FKIndex1 ON conta_corrente (conta_bancaria_id);


CREATE INDEX IFK_conserva ON conta_corrente (conta_bancaria_id);


CREATE TABLE conta_corrente_especial (
  id INTEGER   NOT NULL ,
  conta_corrente_id INTEGER   NOT NULL ,
  limite DOUBLE      ,
PRIMARY KEY(id)  ,
  FOREIGN KEY(conta_corrente_id)
    REFERENCES conta_corrente(id));


CREATE INDEX conta_corrente_especial_FKIndex1 ON conta_corrente_especial (conta_corrente_id);


CREATE INDEX IFK_tipo ON conta_corrente_especial (conta_corrente_id);


CREATE TABLE cliente (
  Id INTEGER   NOT NULL ,
  agencias_bancarias_numero_da_agencia VARCHAR(10)    ,
  Nome VARCHAR(20)    ,
  telefone VARCHAR(11)    ,
  tipo_pessoa VARCHAR(2)    ,
  rua VARCHAR(50)    ,
  bairro VARCHAR(50)    ,
  Complemento VARCHAR(50)    ,
  sobrenome VARCHAR(50)    ,
  cidade VARCHAR(30)      ,
PRIMARY KEY(Id)  ,
  FOREIGN KEY(agencias_bancarias_numero_da_agencia)
    REFERENCES agencias_bancarias(numero_da_agencia));


CREATE INDEX cliente_FKIndex1 ON cliente (agencias_bancarias_numero_da_agencia);


CREATE INDEX IFK_comporta ON cliente (agencias_bancarias_numero_da_agencia);


CREATE TABLE debito_automatico (
  id INTEGER   NOT NULL ,
  conta_bancaria_id INTEGER   NOT NULL ,
  codigo VARCHAR(10)      ,
PRIMARY KEY(id)  ,
  FOREIGN KEY(conta_bancaria_id)
    REFERENCES conta_bancaria(id));


CREATE INDEX debito_automatico_FKIndex1 ON debito_automatico (conta_bancaria_id);


CREATE INDEX IFK_factivel ON debito_automatico (conta_bancaria_id);


CREATE TABLE emprestimo (
  id INTEGER   NOT NULL ,
  conta_bancaria_id INTEGER   NOT NULL ,
  valor DOUBLE      ,
PRIMARY KEY(id)  ,
  FOREIGN KEY(conta_bancaria_id)
    REFERENCES conta_bancaria(id));


CREATE INDEX emprestimo_FKIndex1 ON emprestimo (conta_bancaria_id);


CREATE INDEX IFK_para ON emprestimo (conta_bancaria_id);


CREATE TABLE conta_poupanca (
  id INTEGER   NOT NULL ,
  conta_bancaria_id INTEGER   NOT NULL ,
  data_aniversario DATE      ,
PRIMARY KEY(id)  ,
  FOREIGN KEY(conta_bancaria_id)
    REFERENCES conta_bancaria(id));


CREATE INDEX conta_poupanca_FKIndex1 ON conta_poupanca (conta_bancaria_id);


CREATE INDEX IFK_categoria ON conta_poupanca (conta_bancaria_id);


CREATE TABLE convenio (
  id INTEGER   NOT NULL ,
  debito_automatico_id INTEGER   NOT NULL ,
  nome VARCHAR(30)      ,
PRIMARY KEY(id)  ,
  FOREIGN KEY(debito_automatico_id)
    REFERENCES debito_automatico(id));


CREATE INDEX convenio_FKIndex1 ON convenio (debito_automatico_id);


CREATE INDEX IFK_possui  ON convenio (debito_automatico_id);


CREATE TABLE cartao_de_credito (
  numero VARCHAR(10)   NOT NULL ,
  bandeira_cartao_id INTEGER   NOT NULL ,
  cliente_Id INTEGER   NOT NULL ,
  data_validade DATE    ,
  limite DOUBLE    ,
  codigo_seguranca VARCHAR(30)      ,
PRIMARY KEY(numero)    ,
  FOREIGN KEY(cliente_Id)
    REFERENCES cliente(Id),
  FOREIGN KEY(bandeira_cartao_id)
    REFERENCES bandeira_cartao(id));


CREATE INDEX cartao_de_credito_FKIndex1 ON cartao_de_credito (cliente_Id);
CREATE INDEX cartao_de_credito_FKIndex2 ON cartao_de_credito (bandeira_cartao_id);


CREATE INDEX IFK_possui ON cartao_de_credito (cliente_Id);
CREATE INDEX IFK_Rel_25 ON cartao_de_credito (bandeira_cartao_id);


CREATE TABLE cartao_movimentacao (
  conta_bancaria_id INTEGER   NOT NULL ,
  cliente_Id INTEGER   NOT NULL ,
  senha VARCHAR(30)      ,
PRIMARY KEY(conta_bancaria_id, cliente_Id)    ,
  FOREIGN KEY(cliente_Id)
    REFERENCES cliente(Id),
  FOREIGN KEY(conta_bancaria_id)
    REFERENCES conta_bancaria(id));


CREATE INDEX cliente_has_conta_bancaria_FKIndex2 ON cartao_movimentacao (conta_bancaria_id);
CREATE INDEX proprietario_da_conta_FKIndex2 ON cartao_movimentacao (cliente_Id);


CREATE INDEX IFK_possui ON cartao_movimentacao (cliente_Id);
CREATE INDEX IFK_possui2 ON cartao_movimentacao (conta_bancaria_id);


CREATE TABLE seguro (
  id INTEGER   NOT NULL ,
  tipo_de_seguro_id INTEGER   NOT NULL ,
  cliente_Id INTEGER   NOT NULL ,
  vigencia DATETIME      ,
PRIMARY KEY(id)    ,
  FOREIGN KEY(cliente_Id)
    REFERENCES cliente(Id),
  FOREIGN KEY(tipo_de_seguro_id)
    REFERENCES tipo_de_seguro(id));


CREATE INDEX seguro_FKIndex1 ON seguro (cliente_Id);
CREATE INDEX seguro_FKIndex2 ON seguro (tipo_de_seguro_id);


CREATE INDEX IFK_tipo ON seguro (cliente_Id);
CREATE INDEX IFK_possui ON seguro (tipo_de_seguro_id);


CREATE TABLE fatura (
  Id INTEGER   NOT NULL ,
  cartao_movimentacao_de_credito_numero VARCHAR(10)   NOT NULL ,
  ano_de_competencia DATE    ,
  mes_de_competencia DATE      ,
PRIMARY KEY(Id)  ,
  FOREIGN KEY(cartao_movimentacao_de_credito_numero)
    REFERENCES cartao_de_credito(numero));


CREATE INDEX fatura_FKIndex1 ON fatura (cartao_movimentacao_de_credito_numero);


CREATE INDEX IFK_envia ON fatura (cartao_movimentacao_de_credito_numero);


CREATE TABLE pagamento (
  id INTEGER   NOT NULL ,
  fatura_Id INTEGER   NOT NULL ,
  data_vencimento DATE    ,
  valor DOUBLE    ,
  data_pagamento DATE      ,
PRIMARY KEY(id)  ,
  FOREIGN KEY(fatura_Id)
    REFERENCES fatura(Id));


CREATE INDEX pagamento_FKIndex1 ON pagamento (fatura_Id);


CREATE INDEX IFK_Compoem ON pagamento (fatura_Id);


CREATE TABLE pessoa_juridica (
  Cnpj VARCHAR(14)   NOT NULL ,
  cliente_Id INTEGER   NOT NULL   ,
PRIMARY KEY(Cnpj)  ,
  FOREIGN KEY(cliente_Id)
    REFERENCES cliente(Id));


CREATE INDEX pessoa_juridica_FKIndex1 ON pessoa_juridica (cliente_Id);


CREATE INDEX IFK_para ON pessoa_juridica (cliente_Id);


CREATE TABLE talao_de_cheque (
  id INTEGER   NOT NULL ,
  conta_corrente_especial_id INTEGER   NOT NULL ,
  numero_folha_final INTEGER      ,
PRIMARY KEY(id)  ,
  FOREIGN KEY(conta_corrente_especial_id)
    REFERENCES conta_corrente_especial(id));


CREATE INDEX talao_de_cheque_FKIndex1 ON talao_de_cheque (conta_corrente_especial_id);


CREATE INDEX IFK_contem ON talao_de_cheque (conta_corrente_especial_id);


CREATE TABLE parcela_emprestimo (
  id INTEGER   NOT NULL ,
  emprestimo_id INTEGER   NOT NULL ,
  valor DOUBLE    ,
  data_vencimento DATE    ,
  data_pagamento DATE      ,
PRIMARY KEY(id)  ,
  FOREIGN KEY(emprestimo_id)
    REFERENCES emprestimo(id));


CREATE INDEX parcela_emprestimo_FKIndex1 ON parcela_emprestimo (emprestimo_id);


CREATE INDEX IFK_valor ON parcela_emprestimo (emprestimo_id);


CREATE TABLE pessoa_fisica (
  Cpf VARCHAR(11)   NOT NULL ,
  cliente_Id INTEGER   NOT NULL   ,
PRIMARY KEY(Cpf)  ,
  FOREIGN KEY(cliente_Id)
    REFERENCES cliente(Id));


CREATE INDEX pessoa_fisica_FKIndex1 ON pessoa_fisica (cliente_Id);


CREATE INDEX IFK_para ON pessoa_fisica (cliente_Id);


CREATE TABLE compra (
  id INTEGER   NOT NULL ,
  fatura_Id INTEGER   NOT NULL ,
  valor DOUBLE    ,
  numero_parcelas INTEGER    ,
  data_2 DATE      ,
PRIMARY KEY(id)  ,
  FOREIGN KEY(fatura_Id)
    REFERENCES fatura(Id));


CREATE INDEX compra_FKIndex1 ON compra (fatura_Id);


CREATE INDEX IFK_retem ON compra (fatura_Id);


CREATE TABLE Estabelecimento (
  cnpj VARCHAR(10)   NOT NULL ,
  compra_id INTEGER   NOT NULL ,
  razao_social VARCHAR(150)      ,
PRIMARY KEY(cnpj)  ,
  FOREIGN KEY(compra_id)
    REFERENCES compra(id));


CREATE INDEX Estabelecimento_FKIndex1 ON Estabelecimento (compra_id);


CREATE INDEX IFK_Provem ON Estabelecimento (compra_id);




