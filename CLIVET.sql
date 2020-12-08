create database Vet;
use Vet;

-- U S U A R I O S
 create table tbusuarios(
 iduser int primary key,
 usuario varchar(50) not null,
 telefone varchar(15) not null,
 login varchar(20) not null,
 senha varchar(20) not null);
describe tbusuarios;

-- TABELAS ( C R U D ), as quatro operações básicas de banco de dados  --
-- Create
-- Read 
-- Update
-- Delete

-- create -> insert (CRUD)

insert into tbusuarios(iduser,usuario,telefone,login,senha)
values(1,'Brian Da Silva','4687-9984','brian','123');

-- o ID 2, foi deletado para teste
insert into tbusuarios(iduser,usuario,telefone,login,senha)
values(2,'Brenda Assis','9956-2215','bassis','456');

insert into tbusuarios(iduser,usuario,telefone,login,senha)
values(3,'Jean De Los Anjos','1178-6547','anjos','789');

insert into tbusuarios(iduser,usuario,telefone,login,senha)
values(4,'Administrador','9968-6117','adm','adm');

-- read -> select -- Exibe os dados da tabela (CRUD)

select * from tbusuarios;

-- update -> update -- Modifica dados na tabela (CRUD)

update tbusuarios set telefone ='1846-8845' where iduser =3;

-- delete -> delete -- Apaga um registro da tabela (CRUD)

delete from tbusuarios where iduser =2;
select * from tbusuarios;

-- C L I E N T E S
create table tbclientes(
idcli int primary key,
nomecli varchar(50) not null,
endcli varchar(100),
telefone varchar(50) not null
);
describe tbclientes;

-- Alterações
alter table tbclientes
CHANGE telefone telefonecli varchar(50);
alter table tbclientes
DROP COLUMN idcli;
alter table tbclientes
ADD idcli int primary key auto_increment;
-- FIM Alterações
describe tbclientes;

insert into tbclientes(nomecli,endcli,telefonecli)
values('Yhori','Rua Xaumi,98','1968-7542');
select * from tbclientes;

-- O R D E N DE S E R V I Ç O

create table tbos(
os int primary key auto_increment,
data_os timestamp default current_timestamp,
racadog varchar(50),
diagnosticodog varchar(150),
servicodog varchar(150),
doutor varchar(50),
valor decimal(10,2),
idcli int not null,
foreign key(idcli) references tbclientes(idcli)
);
describe tbos;

insert into tbos (racadog,diagnosticodog,servicodog,doutor,valor,idcli)
values ('Vira lata','Vômito e anda muito pra baixo','Raio X da barriga para ver se era algo que comeu, remédio para tomar de 12h em 12h durante 1 semana','Pedro','200.00','1');

select * from tbos;

-- Traz informações de duas T A B E L A S 
select
O.os,diagnosticodog,servicodog,valor,
C.nomecli,telefonecli
from tbos as O
inner join tbclientes as C
on (O.idcli = C.idcli);
-- Pronto

use vet;
select tbusuarios;

-- Adiciona um campo a tabela
alter table tbusuarios add column perfil varchar(20) not null;

select * from tbusuarios;

update tbusuarios set perfil = 'admin' where iduser = 4;
update tbusuarios set perfil = 'admin' where iduser = 1;
update tbusuarios set perfil = 'user' where iduser = 3;

select * from tbusuarios;

use vet;
describe tbusuarios;
select * from tbusuarios;

describe tbclientes;
select * from tbclientes;

select * from tbclientes where nomeCli like'jo%';

alter table tbclientes add column email varchar(100) not null;
alter table tbclientes
DROP COLUMN email;

select * from tbclientes;
select idcli,nomecli,telefonecli from tbclientes where nomecli like'jo%';

-- A linha abaixo cria um apelido aos campos da tabela
select idcli as Id,nomecli as Nome,telefonecli as Telefone from tbclientes where nomecli like'jo%';

describe tbos;
describe tbclientes;
alter table tbos add tipo varchar(15) not null after data_os;
alter table tbos add situacao varchar(20) not null after tipo;

select * from tbos;
select * from tbclientes;
describe tbclientes;
use vet;
