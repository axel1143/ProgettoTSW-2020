DROP DATABASE if exists hotel;
create database hotel;
use hotel;
set global local_infile=1; 

Create table Turno
( data date not null,
  ora_inizio time not null,
  durata tinyint,
  constraint pk_data_ora primary key (data,ora_inizio)
  );
  
create table Personale
( codice_fiscale char(16) not null,
  nome varchar(30) not null,
  cognome varchar(30) not null,
  data_di_nascita date not null,
  constraint pk_codice_fiscale primary key(codice_fiscale)
);
  
create table EFFETTUA
( data date not null,
  ora_inizio time not null,
  codice_fiscale char(16) not null, 
  constraint pk_data_ora_CF primary key (data,ora_inizio,codice_fiscale),
  constraint fk_data_ora foreign key (data,ora_inizio) references Turno (data,ora_inizio)  on update cascade on delete cascade,
  constraint fk_CF foreign key (codice_fiscale) references Personale (codice_fiscale) on update cascade on delete cascade
);
  
create table Camerieri
( codice_fiscale char(16) not null, 
  constraint pk_codice_fiscale primary key(codice_fiscale),
  constraint fk_codice_fiscale foreign key(codice_fiscale) references Personale(codice_fiscale) on update cascade on delete cascade
);
  
create table Cuochi
( codice_fiscale char(16) not null,
  anni_esperienza  tinyint unsigned not null,
  constraint pk_codice_fiscale primary key(codice_fiscale),
  constraint fk_codice_fiscale1 foreign key(codice_fiscale) references Personale(codice_fiscale) on update cascade on delete cascade
);
    
create table Reception
( codice_fiscale char(16) not null, 
  constraint pk_codice_fiscale primary key(codice_fiscale),
  constraint fk_codice_fiscale2 foreign key(codice_fiscale) references Personale(codice_fiscale) on update cascade on delete cascade
);
    
create table Inservienti
( codice_fiscale char(16) not null, 
  constraint pk_codice_fiscale primary key(codice_fiscale),
  constraint fk_codice_fiscale3 foreign key(codice_fiscale) references Personale(codice_fiscale) on update cascade on delete cascade
);
    
create table Lingua
( lingua_parlata varchar(20) not null,
  constraint pk_lingua_parlata primary key(lingua_parlata)
);
    
create table PARLA
( codice_fiscale char(16) not null,
  lingua_parlata varchar(20) not null,
  constraint pk_codice_fiscale_lingua primary key(codice_fiscale,lingua_parlata),
  constraint fk_codice_fiscale4 foreign key (codice_fiscale) references Reception(codice_fiscale) on update cascade on delete cascade,
  constraint fk_lingua_parlata foreign key (lingua_parlata) references Lingua (lingua_parlata) on update cascade on delete cascade
);
    
create table Camera
( numero smallint unsigned auto_increment,
  tipo varchar (10) not null,
  numero_letti tinyint not null,
  constraint pk_numero primary key(numero)
);
    
create table GESTITA 
( codice_fiscale char(16) not null,
  numero smallint unsigned not null,
  data date not null,
  constraint pk_codice_fiscale_numero primary key (codice_fiscale,numero),
  constraint fk_codice_fiscale5 foreign key (codice_fiscale) references Inservienti(codice_fiscale) on update cascade on delete cascade,
  constraint fk_numero foreign key (numero) references Camera(numero) on update cascade on delete cascade
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
         
create table Ristorante
( nome_ristorante varchar(30) not null,
  numero_posti smallint unsigned not null,
  numero_sale tinyint unsigned not null,
  constraint pk_nome_ristorante primary key(nome_ristorante)
);
           
create table USUFRUISCE_DI
( nome_ristorante varchar(30) not null,
  codice_fiscale char(16) not null,
  constraint pk_nome_ristorante_cf primary key(nome_ristorante,codice_fiscale),
  constraint fk_nome_ristorante foreign key(nome_ristorante) references Ristorante(nome_ristorante) on update cascade on delete cascade,
  constraint fk_codice_fiscale7  foreign key(codice_fiscale) references Cliente(codice_fiscale) on update cascade on delete cascade
);
          
create table Fornitore
( nome varchar(50) not null,
  indirizzo varchar(30) not null,
  constraint pk_nome primary key(nome)
);
        
create table Fornitura
( nome varchar(50) not null,
  nome_ristorante varchar(50) not null,
  data_fornitura date not null,
  constraint pk_nome_ristorante_nome primary key(nome_ristorante,nome,data_fornitura),
  constraint fk_nome_ristorante1 foreign key(nome_ristorante) references Ristorante(nome_ristorante) on update cascade on delete cascade,
  constraint fk_nome  foreign key(nome) references Fornitore(nome) on update cascade on delete cascade
);
         
create table Menu
( codice char(10) not null,
  tipo varchar(10) not null,
  constraint pk_codice primary key(codice)
);
        
create table OFFRE
( codice char (10) not null,
  nome_ristorante varchar(50) not null,
  constraint pk_codice_nome primary key(codice,nome_ristorante),
  constraint fk_codice foreign key(codice) references Menu(codice) on update cascade on delete cascade,
  constraint fk_nome_ristorante2 foreign key(nome_ristorante) references Ristorante(nome_ristorante) on update cascade on delete cascade
);
        
create table Portata
( codice char(10) not null,
  nome varchar(30) not null,
  constraint pk_codice_nome primary key(codice,nome),
  constraint fk_codice1 foreign key(codice) references Menu(codice) on update cascade on delete cascade
);

load data local infile '/Users/alexdantuono/Desktop/BDPROG/popolamento/dataturno.sql'
into table Turno fields terminated by",";

load data local infile '/Users/alexdantuono/Desktop/BDPROG/popolamento/datapersonale.sql'
into table Personale fields terminated by",";

load data local infile '/Users/alexdantuono/Desktop/BDPROG/popolamento/datacameriere.sql'
into table Camerieri fields terminated by",";

load data local infile '/Users/alexdantuono/Desktop/BDPROG/popolamento/datacuoco.sql'
into table Cuochi fields terminated by",";

load data local infile '/Users/alexdantuono/Desktop/BDPROG/popolamento/datareception.sql'
into table Reception fields terminated by",";

load data local infile '/Users/alexdantuono/Desktop/BDPROG/popolamento/datainserviente.sql'
into table Inservienti fields terminated by",";

load data local infile '/Users/alexdantuono/Desktop/BDPROG/popolamento/datalingua.sql'
into table Lingua fields terminated by",";

load data local infile '/Users/alexdantuono/Desktop/BDPROG/popolamento/datacamera.sql'
into table Camera fields terminated by"," (tipo,numero_letti) set numero = NULL;

load data local infile '/Users/alexdantuono/Desktop/BDPROG/popolamento/datacliente.sql'
into table Cliente fields terminated by",";

load data local infile '/Users/alexdantuono/Desktop/BDPROG/popolamento/dataprenotazione.sql'
into table Prenotazione fields terminated by",";

load data local infile '/Users/alexdantuono/Desktop/BDPROG/popolamento/dataristorante.sql'
into table Ristorante fields terminated by",";

load data local infile '/Users/alexdantuono/Desktop/BDPROG/popolamento/datafornitore.sql'
into table Fornitore fields terminated by ",";

load data local infile '/Users/alexdantuono/Desktop/BDPROG/popolamento/datamenu.sql'
into table Menu fields terminated by",";

load data local infile '/Users/alexdantuono/Desktop/BDPROG/popolamento/dataportata.sql'
into table Portata fields terminated by",";

load data local infile '/Users/alexdantuono/Desktop/BDPROG/popolamento/dataeffettua.sql'
into table EFFETTUA fields terminated by",";

load data local infile '/Users/alexdantuono/Desktop/BDPROG/popolamento/dataparla.sql'
into table PARLA fields terminated by",";

load data local infile '/Users/alexdantuono/Desktop/BDPROG/popolamento/datagestita.sql'
into table GESTITA fields terminated by",";

load data local infile '/Users/alexdantuono/Desktop/BDPROG/popolamento/datausufruisce.sql'
into table USUFRUISCE_DI fields terminated by",";

load data local infile '/Users/alexdantuono/Desktop/BDPROG/popolamento/datafornitura.sql'
into table Fornitura fields terminated by",";

load data local infile '/Users/alexdantuono/Desktop/BDPROG/popolamento/dataoffre.sql'
into table OFFRE fields terminated by","; 





