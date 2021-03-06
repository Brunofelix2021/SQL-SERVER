create table TB_ESTADO_EST (
EST_CODIGO int identity primary key,
EST_ESTADO varchar(2) not null)

create table TB_CIDADE_CID (
CID_CODIGO int identity primary key,
CID_CIDADE varchar(100) not null,
EST_CODIGO int foreign key (EST_CODIGO) references TB_ESTADO_EST)

create table TB_USUARIO_USU(
USU_CODIGO INT IDENTITY PRIMARY KEY,
USU_NOME VARCHAR(50) NOT NULL, 
USU_LOGIN VARCHAR(20) NOT NULL,
USU_SENHA VARCHAR(20) NOT NULL,
USU_ATIVO BIT NOT NULL)

CREATE TABLE TB_CLIENTE_CLI (
CLI_CODIGO INT IDENTITY PRIMARY KEY,
CLI_CPF         VARCHAR(50) NOT NULL,
CLI_NOME        VARCHAR(50) NOT NULL,
CLI_DATA_NASC   DATE        NOT NULL,
CLI_SEXO        VARCHAR(1)  NOT NULL,
CLI_EMAIL       VARCHAR(50) NOT NULL,
CLI_ENDERECO    VARCHAR(100)NOT NULL,
CLI_NUMERO      VARCHAR(5)  NOT NULL,
CLI_COMPLEMENTO VARCHAR(50) ,
CLI_BAIRRO      VARCHAR(100)NOT NULL,
CLI_CEP         VARCHAR(9)  NOT NULL,
USU_CODIGO      INT FOREIGN KEY (USU_CODIGO) REFERENCES TB_USUARIO_USU,
CID_CODIGO      INT FOREIGN KEY (CID_CODIGO) REFERENCES TB_CIDADE_CID)


create table  TB_FORMA_PAGTO_TFP (
TFP_CODIGO int identity primary key,
TFP_DESCRICAO VARCHAR(30) NOT NULL)

create table  TB_TIPO_TELEFONE_TTT (
TTT_CODIGO int identity primary key,
TTTT_DESCRICAO VARCHAR(30) NOT NULL)

create table  TB_COMBUSTIVEL_COM (
COM_CODIGO int identity primary key,
COM_DESCRICAO VARCHAR(30) NOT NULL)

create table  TB_MARCA_MAR (
MAR_CODIGO int identity primary key,
MAR_DESCRICAO VARCHAR(30) NOT NULL)

create table  TB_MODELO_MOD (
MOD_CODIGO int identity primary key,
MOD_DESCRICAO VARCHAR(50) NOT NULL,
MAR_CODIGO INT FOREIGN KEY (MAR_CODIGO) REFERENCES TB_MARCA_MAR)

create table  TB_PRODUTO_SERVICO_TPS (
TPS_CODIGO int identity primary key,
TPS_DESCRICAO VARCHAR(100) NOT NULL,
TPS_VALOR DECIMAL(10,2) NOT NULL)

create table TB_TELEFONE_TEL (
TEL_CODIGO INT IDENTITY PRIMARY KEY,
TEL_DDD VARCHAR(2) NOT NULL,
TEL_NUMERO VARCHAR(15) NOT NULL,
TTT_CODIGO INT FOREIGN KEY (TTT_CODIGO) REFERENCES TB_TIPO_TELEFONE_TTT,
CLI_CODIGO INT FOREIGN KEY (CLI_CODIGO) REFERENCES TB_CLIENTE_CLI,
USU_CODIGO INT FOREIGN KEY (USU_CODIGO) REFERENCES TB_USUARIO_USU)


CREATE TABLE TB_VEICULO_VEI (
VEI_CODIGO INT IDENTITY PRIMARY KEY,
VEI_PLACA VARCHAR(7) NOT NULL,
VEI_CHASSI VARCHAR(20) NOT NULL,
VEI_ANO_FABRICACAO INT NOT NULL,
VEI_COR VARCHAR(15) NOT NULL,
MOD_CODIGO INT FOREIGN KEY (MOD_CODIGO) REFERENCES TB_MODELO_MOD,
CLI_CODIGO INT FOREIGN KEY (CLI_CODIGO) REFERENCES TB_CLIENTE_CLI)

CREATE TABLE TB_VEICULO_COMBUSTIVEL_TVC (
TVC_CODIGO INT IDENTITY PRIMARY KEY,
VEI_CODIGO INT FOREIGN KEY (VEI_CODIGO) REFERENCES TB_VEICULO_VEI,
COM_CODIGO INT FOREIGN KEY (COM_CODIGO) REFERENCES TB_COMBUSTIVEL_COM)

CREATE TABLE TB_ORCAMENTO_ORC (
ORC_CODIGO INT IDENTITY PRIMARY KEY,
ORC_DATA DATE NOT NULL,
ORC_VALOR DECIMAL(10,2),
VEI_CODIGO INT FOREIGN KEY (VEI_CODIGO) REFERENCES TB_VEICULO_VEI,
USU_CODIGO INT FOREIGN KEY (USU_CODIGO) REFERENCES TB_USUARIO_USU)

CREATE TABLE TB_PRODUTO_ORCAMENTO_TPO (
TPO_CODIGO INT IDENTITY PRIMARY KEY,
TPO_QTDE INT NOT NULL,
TPO_VALOR DECIMAL(10,2) NOT NULL,
ORC_CODIGO INT FOREIGN KEY (ORC_CODIGO) REFERENCES TB_ORCAMENTO_ORC,
TPS_CODIGO INT FOREIGN KEY (TPS_CODIGO) REFERENCES TB_PRODUTO_SERVICO_TPS)


CREATE TABLE TB_ORDEM_SERVICO_ORD (
ORD_CODIGO INT IDENTITY PRIMARY KEY,
ORD_DATA  DATE NOT NULL,
ORD_VALOR DECIMAL(10,2) NOT NULL,
ORC_CODIGO INT FOREIGN KEY (ORC_CODIGO) REFERENCES TB_ORCAMENTO_ORC,
USU_CODIGO INT FOREIGN KEY (USU_CODIGO) REFERENCES TB_USUARIO_USU)

CREATE TABLE TB_PRODUTO_ORDEM_SERVICO_POS (
POS_CODIGO INT IDENTITY PRIMARY KEY,
POS_QTDE INT NOT NULL,
POS_VALOR DECIMAL(10,2) NOT NULL,
ORD_CODIGO INT FOREIGN KEY (ORD_CODIGO) REFERENCES TB_ORDEM_SERVICO_ORD,
TPS_CODIGO INT FOREIGN KEY (TPS_CODIGO) REFERENCES TB_PRODUTO_SERVICO_TPS)

CREATE TABLE TB_MOVIMENTACAO_MOV (
MOV_CODIGO INT IDENTITY PRIMARY KEY,
MOV_DATE_INICIO DATETIME NOT NULL,
MOV_DATA_TERMINO DATETIME NOT NULL,
POS_CODIGO INT FOREIGN KEY (POS_CODIGO) REFERENCES TB_PRODUTO_ORDEM_SERVICO_POS,
ORC_CODIGO INT FOREIGN KEY (ORDCODIGO) REFERENCES TB_ORCAMENTO_ORC
ORD_CODIGO INT FOREIGN KEY (ORD_CODIGO) REFERENCES TB_ORDEM_SERVICO_ORD
USU_CODIGO INT FOREIGN KEY (USU_CODIGO) REFERENCES TB_USUARIO_USU)

CREATE TABLE TB_PAGAMENTO_PAG (
PAG_CODIGO INT IDENTITY PRIMARY KEY,
PAG_DATA DATE NOT NULL,
PAG_VALOR DECIMAL(10,2) NOT NULL,
PAG_NOTA_FISCAL VARCHAR(15) NOT NULL,
ORD_CODIGO INT FOREIGN KEY (ORD_CODIGO) REFERENCES TB_ORDEM_SERVICO_ORD)


CREATE TABLE TB_PAGAMENTO_FORMAS_TPF (
TPF_CODIGO INT IDENTITY PRIMARY KEY,
TPF_VALOR DECIMAL(10,2) NOT NULL,
PAG_CODIGO INT FOREIGN KEY (PAG_CODIGO) REFERENCES TB_PAGAMENTO_PAG,
TFP_CODIGO INT FOREIGN KEY (TPF_CODIGO) REFERENCES TB_FORMA_PAGTO_TFP)

















