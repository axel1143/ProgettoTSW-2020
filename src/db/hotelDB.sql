DROP DATABASE if exists hotel;
create database hotel;
use hotel;
set global local_infile=1;

create table Camera
( numero smallint unsigned auto_increment,
  tipo varchar (10) not null,
  numero_letti tinyint not null,
  constraint pk_numero primary key(numero)
);

create table Cliente
( codice_fiscale char(16) not null,
  nome varchar(20) not null,
  cognome varchar(20) not null,
  data_di_nascita date not null,
  constraint pk_codice_fiscale primary key(codice_fiscale)
);
       
create table Prenotazione
( codice_fiscale char(16) not null,
  numero smallint unsigned not null,
  check_in datetime not null,
  check_out datetime not null,
  constraint pk_codice_fiscale_numero primary key(codice_fiscale,numero,check_in) ,
  constraint fk_codice_fiscale6 foreign key (codice_fiscale) references Cliente(codice_fiscale) on update cascade on delete cascade,
  constraint fk_numero1 foreign key (numero) references Camera(numero) on update cascade on delete cascade
);
load data local infile '/Users/alexdantuono/Desktop/BDPROG/popolamento/datacamera.sql'
into table Camera fields terminated by"," (tipo,numero_letti) set numero = NULL;

load data local infile '/Users/alexdantuono/Desktop/BDPROG/popolamento/datacliente.sql'
into table Cliente fields terminated by",";

load data local infile '/Users/alexdantuono/Desktop/BDPROG/popolamento/dataprenotazione.sql'
into table Prenotazione fields terminated by",";





