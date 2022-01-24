create table tb_usuario_cli (
usu_codigo int identity primary key,
usu_nome varchar(50) not null,
usu_login varchar(20) not null,
usu_senah varchar(20) not null,
usu_ativo bit not null)
select 
usu_codigo, usu_nome, usu_login, usu_senah, usu_ativo
from tb_usuario_cli
insert into tb_usuario_cli
(usu_nome, usu_login, usu_senah, usu_ativo)
values
('rodrigo h','rodrigo h', 'senac@123',0)