--SpugeQuest Database creation

CREATE DATABASE IF NOT EXISTS `spugequest1` 
USE `spugequest1`;


CREATE TABLE square_type
(
  ID_square_type INT NOT NULL,
  name VARCHAR(200) NOT NULL,
  PRIMARY KEY (ID_square_type)
);

CREATE TABLE item_type
(
  ID_type INT NOT NULL,
  name VARCHAR(200) NOT NULL,
  warmth_influence FLOAT NOT NULL,
  alcohol_influence FLOAT NOT NULL,
  money_influence FLOAT NOT NULL,
  PRIMARY KEY (ID_type)
);

CREATE TABLE map_square
(
  ID_map INT NOT NULL,
  ID_square_type INT NOT NULL,
  PRIMARY KEY (ID_map),
  FOREIGN KEY (ID_square_type) REFERENCES square_type (ID_square_type)
);

CREATE TABLE item
(
  ID INT NOT NULL,
  ID_type INT NOT NULL,
  ID_map INT NOT NULL,
  PRIMARY KEY (ID),
  FOREIGN KEY (ID_type) REFERENCES item_type(ID_type),
  FOREIGN KEY (ID_map) REFERENCES map_square(ID_map)
);

CREATE TABLE npc
(
  ID INT NOT NULL,
  ID_map INT NOT NULL,
  ID_npc_type INT NOT NULL,
  PRIMARY KEY (ID),
  FOREIGN KEY (ID_map) REFERENCES map_square(ID_map)
  FOREIGN KEY (ID_npc_type) REFERENCES npc_type(ID_npc_type)
);

CREATE TABLE npc_type
(
  name VARCHAR(64) NOT NULL,
  alcohol_influence FLOAT NULL NULL,
  warmth_influence FLOAT NOT NULL,
  ID_npc_type INT NOT NULL,
  PRIMARY KEY (ID_npc_type)
);

CREATE TABLE charracter
(
  ID INT NOT NULL,
  ID_map INT NOT NULL,
  PRIMARY KEY (ID),
  FOREIGN KEY (ID_map) REFERENCES map_square(ID_map)
);

--Syötetään peliruudut
INSERT INTO spugequest.square_type (ID_square_type, square_number) VALUES ('1', '1');
SELECT ID_square_type, square_number FROM spugequest.square_type WHERE  ID_square_type=1;
INSERT INTO `spugequest`.`square_type` (`ID_square_type`, `square_number`) VALUES ('2', '2');
SELECT `ID_square_type`, `square_number` FROM `spugequest`.`square_type` WHERE  `ID_square_type`=2;
INSERT INTO `spugequest`.`square_type` (`ID_square_type`, `square_number`) VALUES ('3', '3');
SELECT `ID_square_type`, `square_number` FROM `spugequest`.`square_type` WHERE  `ID_square_type`=3;
INSERT INTO `spugequest`.`square_type` (`ID_square_type`, `square_number`) VALUES ('4', '4');
SELECT `ID_square_type`, `square_number` FROM `spugequest`.`square_type` WHERE  `ID_square_type`=4;
INSERT INTO `spugequest`.`square_type` (`ID_square_type`, `square_number`) VALUES ('5', '5');
SELECT `ID_square_type`, `square_number` FROM `spugequest`.`square_type` WHERE  `ID_square_type`=5;
INSERT INTO `spugequest`.`square_type` (`ID_square_type`, `square_number`) VALUES ('6', '6');
SELECT `ID_square_type`, `square_number` FROM `spugequest`.`square_type` WHERE  `ID_square_type`=6;
INSERT INTO `spugequest`.`square_type` (`ID_square_type`, `square_number`) VALUES ('7', '7');
SELECT `ID_square_type`, `square_number` FROM `spugequest`.`square_type` WHERE  `ID_square_type`=7;
INSERT INTO `spugequest`.`square_type` (`ID_square_type`, `square_number`) VALUES ('8', '8');
SELECT `ID_square_type`, `square_number` FROM `spugequest`.`square_type` WHERE  `ID_square_type`=8;
INSERT INTO `spugequest`.`square_type` (`ID_square_type`, `square_number`) VALUES ('9', '9');
SELECT `ID_square_type`, `square_number` FROM `spugequest`.`square_type` WHERE  `ID_square_type`=9;
INSERT INTO `spugequest`.`square_type` (`ID_square_type`, `square_number`) VALUES ('10', '10');
SELECT `ID_square_type`, `square_number` FROM `spugequest`.`square_type` WHERE  `ID_square_type`=10;
INSERT INTO `spugequest`.`square_type` (`ID_square_type`, `square_number`) VALUES ('11', '11');
SELECT `ID_square_type`, `square_number` FROM `spugequest`.`square_type` WHERE  `ID_square_type`=11;
INSERT INTO `spugequest`.`square_type` (`ID_square_type`, `square_number`) VALUES ('12', '12');
SELECT `ID_square_type`, `square_number` FROM `spugequest`.`square_type` WHERE  `ID_square_type`=12;
INSERT INTO `spugequest`.`square_type` (`ID_square_type`, `square_number`) VALUES ('13', '13');
SELECT `ID_square_type`, `square_number` FROM `spugequest`.`square_type` WHERE  `ID_square_type`=13;
INSERT INTO `spugequest`.`square_type` (`ID_square_type`, `square_number`) VALUES ('14', '14');
SELECT `ID_square_type`, `square_number` FROM `spugequest`.`square_type` WHERE  `ID_square_type`=14;
INSERT INTO `spugequest`.`square_type` (`ID_square_type`, `square_number`) VALUES ('15', '15');
SELECT `ID_square_type`, `square_number` FROM `spugequest`.`square_type` WHERE  `ID_square_type`=15;
INSERT INTO `spugequest`.`square_type` (`ID_square_type`, `square_number`) VALUES ('16', '16');
SELECT `ID_square_type`, `square_number` FROM `spugequest`.`square_type` WHERE  `ID_square_type`=16;
INSERT INTO `spugequest`.`square_type` (`ID_square_type`, `square_number`) VALUES ('17', '17');
SELECT `ID_square_type`, `square_number` FROM `spugequest`.`square_type` WHERE  `ID_square_type`=17;
INSERT INTO `spugequest`.`square_type` (`ID_square_type`, `square_number`) VALUES ('18', '18');
SELECT `ID_square_type`, `square_number` FROM `spugequest`.`square_type` WHERE  `ID_square_type`=18;
INSERT INTO `spugequest`.`square_type` (`ID_square_type`, `square_number`) VALUES ('19', '19');
SELECT `ID_square_type`, `square_number` FROM `spugequest`.`square_type` WHERE  `ID_square_type`=19;
INSERT INTO `spugequest`.`square_type` (`ID_square_type`, `square_number`) VALUES ('20', '20');
SELECT `ID_square_type`, `square_number` FROM `spugequest`.`square_type` WHERE  `ID_square_type`=20;
INSERT INTO `spugequest`.`square_type` (`ID_square_type`, `square_number`) VALUES ('21', '21');
SELECT `ID_square_type`, `square_number` FROM `spugequest`.`square_type` WHERE  `ID_square_type`=21;
INSERT INTO `spugequest`.`square_type` (`ID_square_type`, `square_number`) VALUES ('22', '22');
SELECT `ID_square_type`, `square_number` FROM `spugequest`.`square_type` WHERE  `ID_square_type`=22;
INSERT INTO `spugequest`.`square_type` (`ID_square_type`, `square_number`) VALUES ('23', '23');
SELECT `ID_square_type`, `square_number` FROM `spugequest`.`square_type` WHERE  `ID_square_type`=23;
INSERT INTO `spugequest`.`square_type` (`ID_square_type`, `square_number`) VALUES ('24', '24');
SELECT `ID_square_type`, `square_number` FROM `spugequest`.`square_type` WHERE  `ID_square_type`=24;
INSERT INTO `spugequest`.`square_type` (`ID_square_type`, `square_number`) VALUES ('25', '25');
SELECT `ID_square_type`, `square_number` FROM `spugequest`.`square_type` WHERE  `ID_square_type`=25;
INSERT INTO `spugequest`.`square_type` (`ID_square_type`, `square_number`) VALUES ('26', '26');
SELECT `ID_square_type`, `square_number` FROM `spugequest`.`square_type` WHERE  `ID_square_type`=26;
INSERT INTO `spugequest`.`square_type` (`ID_square_type`, `square_number`) VALUES ('27', '27');
SELECT `ID_square_type`, `square_number` FROM `spugequest`.`square_type` WHERE  `ID_square_type`=27;

--Syötetään npc:t
INSERT INTO `spugequest`.`npc_type` (`name`, `ID_npc_type`) VALUES ('Hobo', '1');
SELECT `name`, `alcohol_influence`, `warmth_influence`, `ID_npc_type` FROM `spugequest`.`npc_type` WHERE  `ID_npc_type`=1;
INSERT INTO `spugequest`.`npc_type` (`name`, `ID_npc_type`) VALUES ('security guard', '2');
SELECT `name`, `alcohol_influence`, `warmth_influence`, `ID_npc_type` FROM `spugequest`.`npc_type` WHERE  `ID_npc_type`=2;
INSERT INTO `spugequest`.`npc_type` (`name`, `ID_npc_type`) VALUES ('Masa', '3');
SELECT `name`, `alcohol_influence`, `warmth_influence`, `ID_npc_type` FROM `spugequest`.`npc_type` WHERE  `ID_npc_type`=3;


--Syötetään peliruutujen nimet
UPDATE `spugequest`.`square_type` SET `square_name`='Kamppi subwaystation' WHERE  `ID_square_type`=1;
SELECT `ID_square_type`, `square_name` FROM `spugequest`.`square_type` WHERE  `ID_square_type`=1;
UPDATE `spugequest`.`square_type` SET `square_name`='Annakatu 34' WHERE  `ID_square_type`=2;
SELECT `ID_square_type`, `square_name` FROM `spugequest`.`square_type` WHERE  `ID_square_type`=2;
UPDATE `spugequest`.`square_type` SET `square_name`='crossroads of Annakatu and Eerikinkatu' WHERE  `ID_square_type`=3;
SELECT `ID_square_type`, `square_name` FROM `spugequest`.`square_type` WHERE  `ID_square_type`=3;
UPDATE `spugequest`.`square_type` SET `square_name`='crossroads of Freda and Eerikinkatu' WHERE  `ID_square_type`=4;
SELECT `ID_square_type`, `square_name` FROM `spugequest`.`square_type` WHERE  `ID_square_type`=4;
UPDATE `spugequest`.`square_type` SET `square_name`='crossroads of Freda and Kalavankatu' WHERE  `ID_square_type`=5;
SELECT `ID_square_type`, `square_name` FROM `spugequest`.`square_type` WHERE  `ID_square_type`=5;
UPDATE `spugequest`.`square_type` SET `square_name`='crossroads of Freda and Lönkka' WHERE  `ID_square_type`=6;
SELECT `ID_square_type`, `square_name` FROM `spugequest`.`square_type` WHERE  `ID_square_type`=6;
UPDATE `spugequest`.`square_type` SET `square_name`='crossroads of Freda and Bulevard' WHERE  `ID_square_type`=7;
SELECT `ID_square_type`, `square_name` FROM `spugequest`.`square_type` WHERE  `ID_square_type`=7;
UPDATE `spugequest`.`square_type` SET `square_name`='Espa park' WHERE  `ID_square_type`=11;
SELECT `ID_square_type`, `square_name` FROM `spugequest`.`square_type` WHERE  `ID_square_type`=11;
UPDATE `spugequest`.`square_type` SET `square_name`='Pohjoisesplanadi' WHERE  `ID_square_type`=12;
SELECT `ID_square_type`, `square_name` FROM `spugequest`.`square_type` WHERE  `ID_square_type`=12;
UPDATE `spugequest`.`square_type` SET `square_name`='Keskuskatu' WHERE  `ID_square_type`=13;
SELECT `ID_square_type`, `square_name` FROM `spugequest`.`square_type` WHERE  `ID_square_type`=13;
UPDATE `spugequest`.`square_type` SET `square_name`='Stokmann' WHERE  `ID_square_type`=14;
SELECT `ID_square_type`, `square_name` FROM `spugequest`.`square_type` WHERE  `ID_square_type`=14;
UPDATE `spugequest`.`square_type` SET `square_name`='crossroads of Yrjönkatu and Eerikinkatu' WHERE  `ID_square_type`=17;
SELECT `ID_square_type`, `square_name` FROM `spugequest`.`square_type` WHERE  `ID_square_type`=17;
UPDATE `spugequest`.`square_type` SET `square_name`='crossroads of Kalevankatu and Yrjönkatu' WHERE  `ID_square_type`=16;
SELECT `ID_square_type`, `square_name` FROM `spugequest`.`square_type` WHERE  `ID_square_type`=16;
UPDATE `spugequest`.`square_type` SET `square_name`='crossroads of Mansku and Kalevakatu' WHERE  `ID_square_type`=15;
SELECT `ID_square_type`, `square_name` FROM `spugequest`.`square_type` WHERE  `ID_square_type`=15;
UPDATE `spugequest`.`square_type` SET `square_name`='crossroads of Mansku and Eteläesplanadi' WHERE  `ID_square_type`=10;
SELECT `ID_square_type`, `square_name` FROM `spugequest`.`square_type` WHERE  `ID_square_type`=10;
UPDATE `spugequest`.`square_type` SET `square_name`='crossroads of Bulevardi and Yrjönkatu' WHERE  `ID_square_type`=9;
SELECT `ID_square_type`, `square_name` FROM `spugequest`.`square_type` WHERE  `ID_square_type`=9;
UPDATE `spugequest`.`square_type` SET `square_name`='crossroads of Bulevardi and Annankatu' WHERE  `ID_square_type`=8;
SELECT `ID_square_type`, `square_name` FROM `spugequest`.`square_type` WHERE  `ID_square_type`=8;
UPDATE `spugequest`.`square_type` SET `square_name`='Annankatu 31' WHERE  `ID_square_type`=18;
SELECT `ID_square_type`, `square_name` FROM `spugequest`.`square_type` WHERE  `ID_square_type`=18;
UPDATE `spugequest`.`square_type` SET `square_name`='Annanaukio' WHERE  `ID_square_type`=19;
SELECT `ID_square_type`, `square_name` FROM `spugequest`.`square_type` WHERE  `ID_square_type`=19;
UPDATE `spugequest`.`square_type` SET `square_name`='crossroads of Kalevankatu and Annankatu' WHERE  `ID_square_type`=20;
SELECT `ID_square_type`, `square_name` FROM `spugequest`.`square_type` WHERE  `ID_square_type`=20;
UPDATE `spugequest`.`square_type` SET `square_name`='Lönnrotinkatu 13' WHERE  `ID_square_type`=21;
SELECT `ID_square_type`, `square_name` FROM `spugequest`.`square_type` WHERE  `ID_square_type`=21;
UPDATE `spugequest`.`square_type` SET `square_name`='crossroads of Lönnrotinkatu and Annankatu' WHERE  `ID_square_type`=22;
SELECT `ID_square_type`, `square_name` FROM `spugequest`.`square_type` WHERE  `ID_square_type`=22;
UPDATE `spugequest`.`square_type` SET `square_name`='Lönnrotinpuistikko' WHERE  `ID_square_type`=23;
SELECT `ID_square_type`, `square_name` FROM `spugequest`.`square_type` WHERE  `ID_square_type`=23;
UPDATE `spugequest`.`square_type` SET `square_name`='Annankatu 16' WHERE  `ID_square_type`=24;
SELECT `ID_square_type`, `square_name` FROM `spugequest`.`square_type` WHERE  `ID_square_type`=24;
UPDATE `spugequest`.`square_type` SET `square_name`='Annankatu 16' WHERE  `ID_square_type`=25;
SELECT `ID_square_type`, `square_name` FROM `spugequest`.`square_type` WHERE  `ID_square_type`=25;
UPDATE `spugequest`.`square_type` SET `square_name`='crossroads of Lönnrotinkatu and Yrjönkatu' WHERE  `ID_square_type`=24;
SELECT `ID_square_type`, `square_name` FROM `spugequest`.`square_type` WHERE  `ID_square_type`=24;
UPDATE `spugequest`.`square_type` SET `square_name`='centre of Ruttopuisto' WHERE  `ID_square_type`=26;
SELECT `ID_square_type`, `square_name` FROM `spugequest`.`square_type` WHERE  `ID_square_type`=26;
UPDATE `spugequest`.`square_type` SET `square_name`='Yrjönkatu 11' WHERE  `ID_square_type`=27;
SELECT `ID_square_type`, `square_name` FROM `spugequest`.`square_type` WHERE  `ID_square_type`=27;

--Yhdistetään peliruudut  mappiin
INSERT INTO `spugequest`.`map_square` (`ID_map`, `ID_square_type`) VALUES ('5', '5');
SELECT `ID_map`, `ID_square_type` FROM `spugequest`.`map_square` WHERE  `ID_map`=5;

--jne...

--Syötetään databaseem itemit
NSERT INTO `spugequest`.`item_type` (`ID_type`, `name`, `warmth_influence`, `alcohol_influence`) VALUES ('1', 'Bottle of vodka', '+3', '+50');
SELECT `ID_type`, `name`, `warmth_influence`, `alcohol_influence`, `money_influence` FROM `spugequest`.`item_type` WHERE  `ID_type`=1;
INSERT INTO `spugequest`.`item_type` (`ID_type`, `name`, `warmth_influence`, `alcohol_influence`) VALUES ('2', 'Bottle of kilju', '+2', '+30');
SELECT `ID_type`, `name`, `warmth_influence`, `alcohol_influence`, `money_influence` FROM `spugequest`.`item_type` WHERE  `ID_type`=2;
INSERT INTO `spugequest`.`item_type` (`ID_type`, `name`, `warmth_influence`, `alcohol_influence`) VALUES ('3', 'Bottle of beer', '+1', '+30');
SELECT `ID_type`, `name`, `warmth_influence`, `alcohol_influence`, `money_influence` FROM `spugequest`.`item_type` WHERE  `ID_type`=2;
INSERT INTO `spugequest`.`item_type` (`ID_type`, `name`, `money_influence`) VALUES ('4', 'Coin', '+0.5');
SELECT `ID_type`, `name`, `warmth_influence`, `alcohol_influence`, `money_influence` FROM `spugequest`.`item_type` WHERE  `ID_type`=4;
INSERT INTO `spugequest`.`item_type` (`ID_type`, `name`, `money_influence`) VALUES ('5', 'Empty bottle', '0.2');
SELECT `ID_type`, `name`, `warmth_influence`, `alcohol_influence`, `money_influence` FROM `spugequest`.`item_type` WHERE  `ID_type`=5;


--Lisätään square_type:een oletustekstisarake
ALTER TABLE `square_type` ADD COLUMN `default_text` VARCHAR(100) NOT NULL AFTER `name`;

--Lisätään ruutuihin oletustekstit
UPDATE `spugequest`.`square_type` SET `default_text`='you’re  now on front of the entrance of Kamppi subway station.' WHERE  `ID_square_type`=1;
SELECT `ID_square_type`, `name`, `default_text` FROM `spugequest`.`square_type` WHERE  `ID_square_type`=1;
UPDATE `spugequest`.`square_type` SET `default_text`='At the moment, you are at Annakatu 34, and other side of the road, you see restaurant Bar-Con. next to you, is Fennia insurance bank.' WHERE  `ID_square_type`=2;
SELECT `ID_square_type`, `name`, `default_text` FROM `spugequest`.`square_type` WHERE  `ID_square_type`=2;
UPDATE `spugequest`.`square_type` SET `default_text`='You’ve entered to Annankatu and Eerikinkatu crossroads. There is quire café bar called “Why join the navy when you can be a pirate”. You think “Well that’s odd name there. Sadly they don’t sell alcohol drinks there”. ' WHERE  `ID_square_type`=3;
SELECT `ID_square_type`, `name`, `default_text` FROM `spugequest`.`square_type` WHERE  `ID_square_type`=3;
UPDATE `spugequest`.`square_type` SET `default_text`='At the crossroads of Freda and Eerikinkatu, you see Club Capital, and few rich looking people trying to by their way in, with their fancy suits.' WHERE  `ID_square_type`=4;
SELECT `ID_square_type`, `name`, `default_text` FROM `spugequest`.`square_type` WHERE  `ID_square_type`=4;

















