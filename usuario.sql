create table tb_estado_est(
est_codigo int identity primary key,
est_estado varchar(2) not null)

create table tb_cidade_cid(
cid_codigo int identity primary key,
cid_cidade varchar(100) not null,
est_codigo int foreign key (est_codigo) references tb_estado_est)

create table tb_usuario_usu(
usu_codigo int identity primary key,
usu_cpf varchar(16) not null, 
usu_nome varchar(50) not null, 
usu_data_de_nascimento date not null,
usu_sexo varchar(1) not null,
usu_email varchar(50) not null, 
usu_enderenço varchar(100) not null,
usu_numero varchar(5) not null,
usu_comomplemento varchar(50) not null,
usu_bairro varchar(100) not null,
usu_cep varchar(9) not null,
cid_codigo int foreign key (cid_codigo) references tb_cidade_cid)

create table tb_usuario_cli (
cli_codigo int identity primary key,
cli_nome varchar(50) not null,
cli_login varchar(20) not null,
cli_senah varchar(20) not null,
cli_ativo bit not null)

create table tb_forma_pagto_ftp(
ftp_codigo int identity primary key,
ftp_descricao varchar(30) not null)

create table TB_tipo_de_telefone_ttt(
ttt_codigo int identity primary key,
ttt_descricao varchar(30) not null)

create table tb_combustivel_com(
com_codigo int identity primary key,
com_descricao varchar(30) not null)

create table tb_marca_mar(
mar_codigo int identity primary key,
mar_descricao varchar(50) not null)

create table tb_modelo_mod(
mod_codigo int identity primary key,
mod_descriçao varchar (50) not null, 
mar_codigo int foreign key (mar_codigo) references tb_marca_mar)

create table tb_produto_serviço_tps(
tps_codigo int identity primary key,
tps_descricao varchar(100) not null,
tps_valor decimal(10,2) not null)

create  table tb_telefone_tel(
tel_codigo int identity primary key ,
tel_ddd varchar(2) not null,
tel_numero varchar(15)not null, 
ttt_codigo int foreign key (ttt_codigo) references tb_tipo_de_telefone_ttt,
cli_codigo int foreign key (cli_codigo) references tb_usuario_cli,
usu_codigo int foreign key (usu_codigo) references tb_usuario_usu)

create table tb_veiculo_vel(
vel_codigo int identity primary key,
vel_palca varchar(7) not null,
vel_chassi varchar(20) not null,
vel_ano_fabricante int not null,
vel_cor varchar(15) not null,
mod_codigo int foreign key (mod_codigo) references tb_modelo_mod,
cli_codigo int foreign key (cli_codigo) references tb_usuario_cli)

create table tb_veiculo_combustivel_tvc(
tvc_codigo int identity primary key,
vel_codigo int foreign key (vel_codigo) references tb_veiculo_vel)

create table tb_orcamento_orc(
orc_codigo int identity primary key,
orc_data date not null,
orc_valor decimal(10,2) not null,
vel_codigo int foreign key (vel_codigo) references tb_veiculo_vel,
usu_codigo int foreing key (usu_codigo) references tb_usuario_usu)

create table tb_produto_orcamento_tpo(
tpo_codigo int identity primary key,
tpo_qtde int not null,
tpo_valor decimal(10,2) not null,
orc_codigo int foreign key (orc_codigo) references tb_orcamento_orc,
tps_codigo int foreign key (tps_codigo) references tb_produto_servico_tps)

create table tb_ordem_servico_ord(
ord_codigo int identity primary key,
ord_data date not null,
ord_valor decimal(10,2) not null,
orc_codigo int foreign key (orc_codigo) references tb_orcamento_orc,
usu_codigo int foreign key (usu_codigo) references tb_usuario_usu)

create table tb_pagamento_pag(
pag_codigo int identity primary key,
pag_data date not null,
pag_valor decimal(10,2) not null,
orc_codigo int foreign key (orc_codigo) references tb_orcamento_orc)

create table tb_produto_ordem_servico_pos(
pos_codigo int identity primary key,
pos_qtde int not null,
pos_valor decimal(10,2) not null,
ord_codigo int foreign key (ord_codigo) references tb_ordem_servico_ord,
pro_codigo int foreign key (pro_codigo) references tb_produto_pro)

create table tb_movimentacao_mov(
mov_codigo int identity primary key,
mov_data_inico date not null,
mov_data_termino date not null,
pos_codigo int foreign key (pos_codigo) references tb_produto_ordem_servico_pos,
vel_codigo int foreign key (vel_codigo) references tb_veiculos_vel,
usu_codigo int foreign key (usu_codigo) references tb_usuario_usu)

create table tb_pagto_formas_tpf(
tpf_codigo int identity primary key,
tpf_valor decimal (10,2) not null,
pag_codigo int foreign key (pag_codigo) references tb_pagamento_pag,
tfp_codigo int foreign key (tfp_codigo) references tb_forma_pagt_ftp)

