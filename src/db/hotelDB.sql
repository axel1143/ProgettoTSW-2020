DROP DATABASE if exists hotel;
create database hotel;
use hotel;

DROP user IF EXISTS 'tsw'@'localhost';
CREATE USER 'tsw'@'localhost' IDENTIFIED BY 'adminadmin';
GRANT ALL ON hotel.* TO 'tsw'@'localhost';

create table Camera
( numero smallint unsigned auto_increment,
  tipo varchar (10) not null,
  numero_letti tinyint not null,
  primary key(numero)
);

create table Cliente
( codice_fiscale char(16) not null,
  nome varchar(20) not null,
  cognome varchar(20) not null,
  data_di_nascita date not null,
  primary key(codice_fiscale)
);
       
create table Prenotazione
( codice_fiscale char(16) not null,
  numero smallint unsigned not null,
  check_in datetime not null,
  check_out datetime not null,
  primary key(codice_fiscale,numero,check_in) ,
  foreign key (codice_fiscale) references Cliente(codice_fiscale) on update cascade on delete cascade,
  foreign key (numero) references Camera(numero) on update cascade on delete cascade
);
create table Utente /*Controllare il vincolo di partecipazione (Anche un admin deve effettuare una prenotazione) DA MODIFICARE*/
(
    email varchar(30) not null,
    password varchar(30) not null,
    codice_fiscale char(16)/* not null,*/,
    is_admin boolean not null ,
    constraint foreign key (codice_fiscale) references Cliente(codice_fiscale) on update cascade on delete cascade,
    constraint pk_email primary key(email)
);
/*
 Popolamento camera
 */
INSERT INTO Camera(numero,tipo,numero_letti) VALUES(1,'standard',2);
INSERT INTO Camera(numero,tipo,numero_letti) VALUES(3,'standard',3);
INSERT INTO Camera(numero,tipo,numero_letti) VALUES(5,'standard',2);
INSERT INTO Camera(numero,tipo,numero_letti) VALUES(7,'standard',2);
INSERT INTO Camera(numero,tipo,numero_letti) VALUES(8,'standard',3);
INSERT INTO Camera(numero,tipo,numero_letti) VALUES(10,'standard',2);
INSERT INTO Camera(numero,tipo,numero_letti) VALUES(11,'standard',4);
INSERT INTO Camera(numero,tipo,numero_letti) VALUES(13,'standard',2);
INSERT INTO Camera(numero,tipo,numero_letti) VALUES(14,'standard',3);
INSERT INTO Camera(numero,tipo,numero_letti) VALUES(15,'standard',2);
INSERT INTO Camera(numero,tipo,numero_letti) VALUES(2,'superior',2);
INSERT INTO Camera(numero,tipo,numero_letti) VALUES(4,'superior',2);
INSERT INTO Camera(numero,tipo,numero_letti) VALUES(6,'superior',3);
INSERT INTO Camera(numero,tipo,numero_letti) VALUES(9,'superior',2);
INSERT INTO Camera(numero,tipo,numero_letti) VALUES(12,'superior',2);
INSERT INTO Camera(numero,tipo,numero_letti) VALUES(16,'suite',3);
INSERT INTO Camera(numero,tipo,numero_letti) VALUES(17,'suite',2);
/*
 Popolamento Cliente
 */
INSERT INTO Cliente(codice_fiscale,nome,cognome,data_di_nascita) VALUES('PTUMPP69A09L140A','Viola','Trentini','2000-06-08');
INSERT INTO Cliente(codice_fiscale,nome,cognome,data_di_nascita) VALUES('VGMLDT66H15C309X','Alina','Loggia','1978-10-19');
INSERT INTO Cliente(codice_fiscale,nome,cognome,data_di_nascita) VALUES('LVMMCT27A08Z904K','Carisio','Lucchesi','1979-12-18');
INSERT INTO Cliente(codice_fiscale,nome,cognome,data_di_nascita) VALUES('LHUCFQ80H43B674H','Giulio','De Luca','1946-02-16');
INSERT INTO Cliente(codice_fiscale,nome,cognome,data_di_nascita) VALUES('TKKBMB39L68I172H','Lea','Siciliani','1999-06-04');
INSERT INTO Cliente(codice_fiscale,nome,cognome,data_di_nascita) VALUES('GBTDSV55D55G173Z','Azelio','Capon','1955-05-27');
INSERT INTO Cliente(codice_fiscale,nome,cognome,data_di_nascita) VALUES('BWNYNG95C04G058H','Assunta','Toscani','1968-09-09');
INSERT INTO Cliente(codice_fiscale,nome,cognome,data_di_nascita) VALUES('HSNCCE62S66L385Z','Vanna','Sabbatini','1962-06-01');
INSERT INTO Cliente(codice_fiscale,nome,cognome,data_di_nascita) VALUES('JJPPXW73C43Z901V','Quinto','Castiglione','1992-06-02');
INSERT INTO Cliente(codice_fiscale,nome,cognome,data_di_nascita) VALUES('FVQGYU29S29H802O','Fabiana','Fallaci','1947-06-30');

/*
 Popolamento prenotazione
 */

INSERT INTO Prenotazione(codice_fiscale, numero, check_in, check_out) VALUES ('PTUMPP69A09L140A',1,'2020-01-01 10:00:00','2020-01-03 10:00:00');
INSERT INTO Prenotazione(codice_fiscale, numero, check_in, check_out) VALUES ('PTUMPP69A09L140A',1,'2020-01-05 10:00:00','2020-01-07 10:00:00');
INSERT INTO Prenotazione(codice_fiscale, numero, check_in, check_out) VALUES ('VGMLDT66H15C309X',2,'2020-01-02 10:00:00','2020-01-03 10:00:00');
INSERT INTO Prenotazione(codice_fiscale, numero, check_in, check_out) VALUES ('LVMMCT27A08Z904K',3,'2020-01-03 10:00:00','2020-01-03 10:00:00');
INSERT INTO Prenotazione(codice_fiscale, numero, check_in, check_out) VALUES ('LHUCFQ80H43B674H',4,'2020-01-04 10:00:00','2020-01-07 10:00:00');
INSERT INTO Prenotazione(codice_fiscale, numero, check_in, check_out) VALUES ('PTUMPP69A09L140A',1,'2020-03-01 10:00:00','2020-03-03 10:00:00');
INSERT INTO Prenotazione(codice_fiscale, numero, check_in, check_out) VALUES ('PTUMPP69A09L140A',1,'2020-03-05 10:00:00','2020-03-07 10:00:00');
INSERT INTO Prenotazione(codice_fiscale, numero, check_in, check_out) VALUES ('VGMLDT66H15C309X',2,'2020-04-02 10:00:00','2020-04-03 10:00:00');
INSERT INTO Prenotazione(codice_fiscale, numero, check_in, check_out) VALUES ('LVMMCT27A08Z904K',3,'2020-04-03 10:00:00','2020-04-03 10:00:00');
INSERT INTO Prenotazione(codice_fiscale, numero, check_in, check_out) VALUES ('LHUCFQ80H43B674H',4,'2020-05-04 10:00:00','2020-05-07 10:00:00');
INSERT INTO Prenotazione(codice_fiscale, numero, check_in, check_out) VALUES ('TKKBMB39L68I172H',5,'2020-01-05 10:00:00','2020-01-08 10:00:00');
INSERT INTO Prenotazione(codice_fiscale, numero, check_in, check_out) VALUES ('GBTDSV55D55G173Z',6,'2020-01-06 10:00:00','2020-01-09 10:00:00');
INSERT INTO Prenotazione(codice_fiscale, numero, check_in, check_out) VALUES ('BWNYNG95C04G058H',7,'2020-01-07 10:00:00','2020-01-10 10:00:00');
INSERT INTO Prenotazione(codice_fiscale, numero, check_in, check_out) VALUES ('HSNCCE62S66L385Z',5,'2020-01-08 10:00:00','2020-01-11 10:00:00');
INSERT INTO Prenotazione(codice_fiscale, numero, check_in, check_out) VALUES ('JJPPXW73C43Z901V',9,'2020-01-09 10:00:00','2020-01-12 10:00:00');
INSERT INTO Prenotazione(codice_fiscale, numero, check_in, check_out) VALUES ('FVQGYU29S29H802O',10,'2020-01-10 10:00:00','2020-01-13 10:00:00');
INSERT INTO Prenotazione(codice_fiscale, numero, check_in, check_out) VALUES ('FVQGYU29S29H802O',16,'2020-01-10 10:00:00','2020-01-13 10:00:00');
INSERT INTO Prenotazione(codice_fiscale, numero, check_in, check_out) VALUES ('FVQGYU29S29H802O',17,'2020-01-10 10:00:00','2020-01-13 10:00:00');

/*
 Popolamento Utente
 */
INSERT INTO Utente(email, password, codice_fiscale, is_admin) VALUES ('violatrentini00@gmail.com' ,'123456password123456','PTUMPP69A09L140A',false);
INSERT INTO Utente(email, password, codice_fiscale, is_admin) VALUES ('carisiolucc@hotmail.com' ,'carisiolucchesi','LVMMCT27A08Z904K',false);
INSERT INTO Utente(email, password, codice_fiscale, is_admin) VALUES ('capazelio12345@libero.it' ,'cap2345678910','GBTDSV55D55G173Z',false);
INSERT INTO Utente(email, password, codice_fiscale, is_admin) VALUES ('ffallaci47@gmail.com' ,'passwordemail','FVQGYU29S29H802O',false);
INSERT INTO Utente(email, password, codice_fiscale, is_admin) VALUES ('adminadmin@root.it' ,'adminadmin00',null,true);



/*SELECT Count(*) from Prenotazione where codice_fiscale="FVQGYU29S29H8L2O" and numero=17 and check_in="2020-01-10 12:00:00" and check_out="2020-01-13 14:00:00";*/
