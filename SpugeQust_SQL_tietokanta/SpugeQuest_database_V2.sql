--SpugeQuest Database creation

CREATE DATABASE IF NOT EXISTS spugequest;
USE spugequest;


CREATE TABLE room
(
  ID_room INT NOT NULL,
  rnumber INT NOT NULL,
  default_text VARCHAR(1000),
  PRIMARY KEY (ID_room)
);

CREATE TABLE gamemap
(
  curroom INT NOT NULL,
  north INT,
  south INT,
  east INT,
  west INT,
  PRIMARY KEY (curroom),
  foreign key (curroom) references room (ID_room)
);

CREATE TABLE item_type
(
  ID_type INT NOT NULL,
  name VARCHAR(200) NOT NULL,
  warmth_influence FLOAT,
  alcohol_influence FLOAT,
  money_influence FLOAT,
  PRIMARY KEY (ID_type)
);

CREATE TABLE npc_type
(
  name VARCHAR(100) NOT NULL,
  alcohol_influence FLOAT,
  warmth_influence FLOAT,
  ID_npc_type INT NOT NULL,
  PRIMARY KEY (ID_npc_type)
);

CREATE TABLE charracter
(
  ID INT NOT NULL AUTO_INCREMENT,
  ID_room INT,
  name VARCHAR (100),
  warmth INT,
  alcohol INT,
  PRIMARY KEY (ID),
  FOREIGN KEY (ID_room) REFERENCES room(ID_room)
);

CREATE TABLE item
(
  ID INT NOT NULL AUTO_INCREMENT,
  ID_type INT NOT NULL,
  ID_room INT,
  ID_charracter INT,
  PRIMARY KEY (ID),
  FOREIGN KEY (ID_type) REFERENCES item_type(ID_type),
  FOREIGN KEY (ID_room) REFERENCES room(ID_room),
  FOREIGN KEY (ID_charracter) REFERENCES charracter(ID)
);

CREATE TABLE npc
(
  ID INT NOT NULL,
  ID_room INT NOT NULL,
  ID_npc_type INT NOT NULL,
  PRIMARY KEY (ID),
  FOREIGN KEY (ID_room) REFERENCES room(ID_room),
  FOREIGN KEY (ID_npc_type) REFERENCES npc_type(ID_npc_type)
);



--Syötetään peliruudut
INSERT INTO spugequest.room (ID_room, rnumber) VALUES ('1', '1');
INSERT INTO spugequest.room (ID_room, rnumber) VALUES ('2', '2');
INSERT INTO spugequest.room (ID_room, rnumber) VALUES ('3', '3');
INSERT INTO spugequest.room (ID_room, rnumber) VALUES ('4', '4');
INSERT INTO spugequest.room (ID_room, rnumber) VALUES ('5', '5');
INSERT INTO spugequest.room (ID_room, rnumber) VALUES ('6', '6');
INSERT INTO spugequest.room (ID_room, rnumber) VALUES ('7', '7');
INSERT INTO spugequest.room (ID_room, rnumber) VALUES ('8', '8');
INSERT INTO spugequest.room (ID_room, rnumber) VALUES ('9', '9');
INSERT INTO spugequest.room (ID_room, rnumber) VALUES ('10', '10');
INSERT INTO spugequest.room (ID_room, rnumber) VALUES ('11', '11');
INSERT INTO spugequest.room (ID_room, rnumber) VALUES ('12', '12');
INSERT INTO spugequest.room (ID_room, rnumber) VALUES ('13', '13');
INSERT INTO spugequest.room (ID_room, rnumber) VALUES ('14', '14');
INSERT INTO spugequest.room (ID_room, rnumber) VALUES ('15', '15');
INSERT INTO spugequest.room (ID_room, rnumber) VALUES ('16', '16');
INSERT INTO spugequest.room (ID_room, rnumber) VALUES ('17', '17');
INSERT INTO spugequest.room (ID_room, rnumber) VALUES ('18', '18');
INSERT INTO spugequest.room (ID_room, rnumber) VALUES ('19', '19');
INSERT INTO spugequest.room (ID_room, rnumber) VALUES ('20', '20');
INSERT INTO spugequest.room (ID_room, rnumber) VALUES ('21', '21');
INSERT INTO spugequest.room (ID_room, rnumber) VALUES ('22', '22');
INSERT INTO spugequest.room (ID_room, rnumber) VALUES ('23', '23');
INSERT INTO spugequest.room (ID_room, rnumber) VALUES ('24', '24');
INSERT INTO spugequest.room (ID_room, rnumber) VALUES ('25', '25');
INSERT INTO spugequest.room (ID_room, rnumber) VALUES ('26', '26');
INSERT INTO spugequest.room (ID_room, rnumber) VALUES ('27', '27');
INSERT INTO spugequest.room (ID_room, rnumber) VALUES ('28', '28');

--Syötetään npc:t
INSERT INTO spugequest.npc_type (name, ID_npc_type) VALUES ('Hobo', '1');
INSERT INTO spugequest.npc_type (name, ID_npc_type) VALUES ('security guard', '2');
INSERT INTO spugequest.npc_type (name, ID_npc_type) VALUES ('Masa', '3');



--Syötetään databaseem item_tyypit
INSERT INTO spugequest.item_type (ID_type, name, warmth_influence, alcohol_influence) VALUES ('1', 'Bottle of vodka', '+3', '+50');
INSERT INTO spugequest.item_type (ID_type, name, warmth_influence, alcohol_influence) VALUES ('2', 'Bottle of kilju', '+2', '+30');
INSERT INTO spugequest.item_type (ID_type, name, warmth_influence, alcohol_influence) VALUES ('3', 'Bottle of beer', '+1', '+30');
INSERT INTO spugequest.item_type (ID_type, name, money_influence) VALUES ('4', 'Empty bottle', '+0.5');
INSERT INTO spugequest.item_type (ID_type, name, money_influence) VALUES ('5', 'Coin', '+1');

--Lisätään ruutuihin oletustekstit
UPDATE spugequest.room SET default_text='youre  now on front of the entrance of Kamppi subway station.' WHERE  ID_room=1;
UPDATE spugequest.room SET default_text='At the moment, you are at Annakatu 34, and other side of the road, you see restaurant Bar-Con. next to you, is Fennia insurance bank.' WHERE  ID_room=2;
UPDATE spugequest.room SET default_text='Youve entered to Annankatu and Eerikinkatu crossroads. There is quire café bar called, "Why join the navy when you can be a pirate". You think “Well thats odd name there. Sadly they dont sell alcohol drinks there”. ' WHERE  ID_room=3;
UPDATE spugequest.room SET default_text='At the crossroads of Freda and Eerikinkatu, you see Club Capital, and few rich looking people trying to by their way in, with their fancy suits.' WHERE  ID_room=4;
UPDATE spugequest.room SET default_text='Crossroads of Freda and Kalevankatu. Theres a sushi restaurant Fuku next to you. You can almost smell the soya Sause. mmmm… delicious!' WHERE  ID_room=5;
UPDATE spugequest.room SET default_text='Youve entered to crossroads of Freda and Lönkka' WHERE  ID_room=6;
UPDATE spugequest.room SET default_text='you are at the crossroads of Freda and Bulevardi.' WHERE  ID_room=7;
UPDATE spugequest.room SET default_text='youve stepped in to dangerous crossroads of Bulevardi and Annankatu' WHERE  ID_room=8;
UPDATE spugequest.room SET default_text='Crossroads of Bulevardi and Yrjönkatu' WHERE  ID_room=9;
UPDATE spugequest.room SET default_text='Crossroads of Mansku and Southesplanadi' WHERE  ID_room=10;
UPDATE spugequest.room SET default_text='you are in Espa park' WHERE  ID_room=11;
UPDATE spugequest.room SET default_text='you are at the Northernesplanadi' WHERE  ID_room=12;
UPDATE spugequest.room SET default_text='you are at the keskuskatu' WHERE  ID_room=13;
UPDATE spugequest.room SET default_text='you are on front of Stokmann shopping centre' WHERE  ID_room=14;
UPDATE spugequest.room SET default_text='you are at the Crossroads of mansku and Kalevankatu' WHERE  ID_room=15;
UPDATE spugequest.room SET default_text='you are at the Crossroads of kalevankatu and Yrjönkatu' WHERE  ID_room=16;
UPDATE spugequest.room SET default_text='you are at the Crossroads of  Yörjänkatu  and Eerikinkatu' WHERE  ID_room=17;
UPDATE spugequest.room SET default_text='you are at Annankatu 31' WHERE  ID_room=18;
UPDATE spugequest.room SET default_text='you are at Annanaukio' WHERE  ID_room=19;
UPDATE spugequest.room SET default_text='you are at the Crossroads of Kalevankatu and Annankatu' WHERE  ID_room=20;
UPDATE spugequest.room SET default_text='you are at Lönnrotinkatu 13' WHERE  ID_room=21;
UPDATE spugequest.room SET default_text='you are at the Crossroads of Lönnrotinkatu and Annankatu' WHERE  ID_room=22;
UPDATE spugequest.room SET default_text='you are at Lönnrotinpuistikko' WHERE  ID_room=23;
UPDATE spugequest.room SET default_text='you are at the Crossroads of Lönnrotinkatu and Yrjönkatu' WHERE  ID_room=24;
UPDATE spugequest.room SET default_text='you are at Annankatu 16' WHERE  ID_room=25;
UPDATE spugequest.room SET default_text='you are at the Centre of Ruttopuisto' WHERE  ID_room=26;
UPDATE spugequest.room SET default_text='you are at Yrjönkaty 11' WHERE  ID_room=27;
UPDATE spugequest.room SET default_text='youvv been in strage places, but this 1 is the 1 of a kind. there is a note hanging at the side of lamppost. in the note it reads "NOW! ONLY 100COINS. ONES IN THE LIFE TIME TRIP TO THE CANARIAN ISLAND! Do you want to have a nice week under the canarian sun? "' WHERE  ID_room=28;


INSERT INTO spugequest.gamemap VALUES ('1', '0', '2', '19', '0');
INSERT INTO spugequest.gamemap VALUES ('2', '1', '3', '0', '0');
INSERT INTO spugequest.gamemap VALUES ('3', '2', '20', '17', '4');
INSERT INTO spugequest.gamemap VALUES ('4', '0', '5', '3', '0');
INSERT INTO spugequest.gamemap VALUES ('5', '4', '6', '0', '0');
INSERT INTO spugequest.gamemap VALUES ('6', '5', '7', '21', '0');
INSERT INTO spugequest.gamemap VALUES ('7', '6', '0', '8', '0');
INSERT INTO spugequest.gamemap VALUES ('8', '25', '0', '9', '7');
INSERT INTO spugequest.gamemap VALUES ('9', '27', '0', '10', '8');
INSERT INTO spugequest.gamemap VALUES ('10', '0', '0', '11', '9');
INSERT INTO spugequest.gamemap VALUES ('11', '12', '0', '0', '10');
INSERT INTO spugequest.gamemap VALUES ('12', '13', '11', '0', '24');
INSERT INTO spugequest.gamemap VALUES ('13', '14', '12', '0', '0');
INSERT INTO spugequest.gamemap VALUES ('14', '0', '13', '0', '15');
INSERT INTO spugequest.gamemap VALUES ('15', '0', '0', '14', '16');
INSERT INTO spugequest.gamemap VALUES ('16', '17', '24', '15', '17');
INSERT INTO spugequest.gamemap VALUES ('17', '18', '16', '0', '3');
INSERT INTO spugequest.gamemap VALUES ('18', '19', '17', '0', '0');
INSERT INTO spugequest.gamemap VALUES ('19', '0', '18', '0', '1');
INSERT INTO spugequest.gamemap VALUES ('20', '3', '22', '16', '5');
INSERT INTO spugequest.gamemap VALUES ('21', '0', '0', '22', '6');
INSERT INTO spugequest.gamemap VALUES ('22', '20', '25', '23', '21');
INSERT INTO spugequest.gamemap VALUES ('23', '0', '26', '27', '25');
INSERT INTO spugequest.gamemap VALUES ('24', '16', '27', '12', '23');
INSERT INTO spugequest.gamemap VALUES ('25', '22', '8', '26', '0');
INSERT INTO spugequest.gamemap VALUES ('26', '23', '0', '27', '25');
INSERT INTO spugequest.gamemap VALUES ('27', '24', '9', '0', '26');
INSERT INTO spugequest.gamemap VALUES ('28', '0', '0', '0', '0');
--north
--south
--east
--west

------------------------------------------------Ruudun 28, Etelä muutetaan ruuduksi 23, kun coineja on tarpeeksi.
------------------------------------------------+ ruudun 23 pohjoinen aukeaa samalla, kunn coineja on tarpeeksi, pelaaajan astuttua ruutun 23.

  --asetetaan charracterille lämpö ja alcoholi oletusarvot
INSERT INTO spugequest.charracter VALUES ('1', '1', '', '100', '100', ''); 


 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 

