DROP TABLE Region CASCADE CONSTRAINTS;
DROP TABLE Vin CASCADE CONSTRAINTS;
DROP TABLE Article CASCADE CONSTRAINTS;
DROP TABLE Client CASCADE CONSTRAINTS;
DROP TABLE Achat CASCADE CONSTRAINTS;

CREATE TABLE Region (
idregion NUMBER, nom VARCHAR2(20),
CONSTRAINTS pk_region PRIMARY KEY (idregion) );

CREATE TABLE Vin (
idvin NUMBER, nom VARCHAR2(30), appellation VARCHAR2(30), type VARCHAR2(5), provenance NUMBER,
CONSTRAINT pk_vin PRIMARY KEY (idvin),
CONSTRAINT fk_vin_region FOREIGN KEY (provenance) REFERENCES Region (idregion),
CONSTRAINT ch_type CHECK (type IS NULL OR type IN ('rouge', 'rose', 'blanc', 'gris', 'jaune')) );

CREATE TABLE Article (
idarticle NUMBER, millesime DATE, contenance NUMBER, prixht NUMBER, vin NUMBER,
CONSTRAINT pk_article PRIMARY KEY (idarticle),
CONSTRAINT fk_article_vin FOREIGN KEY (vin) REFERENCES Vin (idvin),
CONSTRAINT ch_prixht CHECK (prixht > 0) );

CREATE TABLE Client (
idclient NUMBER, nom VARCHAR2(10), age NUMBER, habite NUMBER,
CONSTRAINT pk_client PRIMARY KEY (idclient),
CONSTRAINT fk_client_region FOREIGN KEY (habite) REFERENCES Region (idregion),
CONSTRAINT ch_age CHECK (age > 17) );

CREATE TABLE Achat (
idachat NUMBER, article NUMBER, client NUMBER, dateachat DATE, quantite NUMBER, ristourne NUMBER,
CONSTRAINT pk_achat PRIMARY KEY (idachat),
CONSTRAINT fk_achat_client FOREIGN KEY (client) REFERENCES Client (idclient),
CONSTRAINT fk_achat_article FOREIGN KEY (article) REFERENCES Article (idarticle),
CONSTRAINT ch_quantite CHECK (quantite > 0),
CONSTRAINT ch_ristourne CHECK (ristourne >= 0 AND ristourne <=100) );


INSERT INTO Region VALUES (1, 'Bassin de la Loire');
INSERT INTO Region VALUES (2, 'Beaujolais');
INSERT INTO Region VALUES (3, 'Bourgogne');
INSERT INTO Region VALUES (4, 'Languedoc Roussillon');
INSERT INTO Region VALUES (5, 'Bordelais');
INSERT INTO Region VALUES (6, 'Cotes du Rhone');
INSERT INTO Region VALUES (7, 'Alsace');
INSERT INTO Region VALUES (8, 'Provence');

INSERT INTO Vin VALUES (75, 'Cave Bruneau Dupuis', 'Bourgueil', 'rouge', 1);
INSERT INTO Article VALUES(181, TO_DATE('1966', 'yyyy'), 75, 210.76, 75);
INSERT INTO Article VALUES(182, TO_DATE('1966','yyyy'), 150, 403.66, 75);

INSERT INTO Vin VALUES (76, 'Domaine Hubert', 'Bourgueil', 'rouge', 1);
INSERT INTO Article VALUES(176, TO_DATE('1995','yyyy'), 75, 20.22, 76);
INSERT INTO Article VALUES(177, TO_DATE('1995','yyyy'), 37, 11.12, 76);
INSERT INTO Article VALUES(178, TO_DATE('1996','yyyy'), 75, 19.42, 76);
INSERT INTO Article VALUES(179, TO_DATE('1999','yyyy'), 75, 9.76, 76);
INSERT INTO Article VALUES(180, TO_DATE('1967','yyyy'), 75, 194.52, 76);

INSERT INTO Vin VALUES (73, 'Chateau de Valmer', 'Vouvray', 'blanc', 1);
INSERT INTO Article VALUES(170, TO_DATE('2000','yyyy'), 75, 1.54, 73);
INSERT INTO Article VALUES(171, TO_DATE('2000','yyyy'), 37, 0.83, 73);

INSERT INTO Vin VALUES (74, 'Vallee Coquette', 'Vouvray', 'blanc', 1);
INSERT INTO Article VALUES(172, TO_DATE('2000','yyyy'), 75, 1.92, 74);
INSERT INTO Article VALUES(173, TO_DATE('2000','yyyy'), 37, 1.00, 74);
INSERT INTO Article VALUES(174, TO_DATE('2001','yyyy'), 75, 1.86, 74);
INSERT INTO Article VALUES(175, TO_DATE('2001','yyyy'), 37, 0.92, 74);

INSERT INTO Vin VALUES (72, 'Domaine Richoux', 'Anjou-Gamay', 'rouge', 1);
INSERT INTO Article VALUES(166, TO_DATE('1999','yyyy'), 75, 4.64, 72);
INSERT INTO Article VALUES(167, TO_DATE('1999','yyyy'), 37, 2.62, 72);
INSERT INTO Article VALUES(168, TO_DATE('1999','yyyy'), 150, 9.06, 72);
INSERT INTO Article VALUES(169, TO_DATE('1999','yyyy'), 300, 19.11, 72);


INSERT INTO Vin VALUES (71, 'Domaine des Petits Quarts', 'Bonnezeaux', 'rouge', 1);
INSERT INTO Article VALUES(164, TO_DATE('1996','yyyy'), 75, 10.05, 71);
INSERT INTO Article VALUES(165, TO_DATE('2000','yyyy'), 75, 4.21, 71);

INSERT INTO Vin VALUES (68, 'Chatelain Desjacques prestige', 'Chinon', 'rouge', 1);
INSERT INTO Article VALUES(157, TO_DATE('2000','yyyy'), 75, 18.82, 68);

INSERT INTO Vin VALUES (69, 'Moulin des Sablons', 'Chinon', 'rouge', 1);
INSERT INTO Article VALUES(158, TO_DATE('1996','yyyy'), 75, 19.53, 69);
INSERT INTO Article VALUES(159, TO_DATE('1996','yyyy'), 37, 10.30, 69);
INSERT INTO Article VALUES(160, TO_DATE('1999','yyyy'), 75, 16.04, 69);
INSERT INTO Article VALUES(161, TO_DATE('1995','yyyy'), 75, 8.97, 69);

INSERT INTO Vin VALUES (70, 'Les Gravieres', 'Chinon', 'rouge', 1);
INSERT INTO Article VALUES(162, TO_DATE('1997','yyyy'), 75, 12.75, 70);
INSERT INTO Article VALUES(163, TO_DATE('1999','yyyy'), 75, 15.21, 70);

INSERT INTO Vin VALUES (67, 'Perroud Robert', 'Cote de Brouilly', 'rouge', 2);
INSERT INTO Article VALUES(155, TO_DATE('1994','yyyy'), 75, 18.42, 67);
INSERT INTO Article VALUES(156, TO_DATE('1999','yyyy'), 75, 9.03, 67);

INSERT INTO Vin VALUES (65, 'Bataillard Aime', 'Beaujolais Villages', 'rouge', 2);
INSERT INTO Article VALUES(151, TO_DATE('2000','yyyy'), 75, 2.78, 65);
INSERT INTO Article VALUES(152, TO_DATE('2000','yyyy'), 150, 4.76, 65);
INSERT INTO Article VALUES(153, TO_DATE('2001','yyyy'), 300, 12.76, 65);

INSERT INTO Vin VALUES (66, 'Ecus', 'Beaujolais Villages', 'rouge', 2);
INSERT INTO Article VALUES(154, TO_DATE('2001','yyyy'), 500, 10.74, 66);

INSERT INTO Vin VALUES (62, 'Domaine de Leyre Loup', 'Morgon', 'rouge', 2);
INSERT INTO Article VALUES(145, TO_DATE('1955','yyyy'), 150, 1699, 62);

INSERT INTO Vin VALUES (63, 'Cuvee Calot', 'Morgon', 'rouge', 2);
INSERT INTO Article VALUES(146, TO_DATE('1997','yyyy'), 75, 12.44, 63);
INSERT INTO Article VALUES(147, TO_DATE('1998','yyyy'), 75, 10.06, 63);
INSERT INTO Article VALUES(148, TO_DATE('1999','yyyy'), 75, 8.42, 63);

INSERT INTO Vin VALUES (64, 'Domaine Pitaud', 'Morgon', 'rouge', 2);
INSERT INTO Article VALUES(149, TO_DATE('1981','yyyy'), 75, 37.77, 64);
INSERT INTO Article VALUES(150, TO_DATE('1981','yyyy'), 37, 19.29, 64);

INSERT INTO Vin VALUES (60, 'Bouchard Pere Clou', 'Meursault', 'rouge', 3);
INSERT INTO Article VALUES(143, TO_DATE('1984','yyyy'), 75, 63.9, 60);
INSERT INTO Article VALUES(144, TO_DATE('1984','yyyy'), 37, 36.82, 60);

INSERT INTO Vin VALUES (61, 'Jardot Charmes', 'Meursault', 'rouge', 3);

INSERT INTO Vin VALUES (58, 'Grenouille', 'Chablis', 'blanc', 3);
INSERT INTO Article VALUES(134, TO_DATE('1956','yyyy'), 75, 845.08, 58);
INSERT INTO Article VALUES(135, TO_DATE('1957','yyyy'), 75, 741.30, 58);
INSERT INTO Article VALUES(136, TO_DATE('1945','yyyy'), 75, 2189.05, 58);
INSERT INTO Article VALUES(137, TO_DATE('1998','yyyy'), 75, 13.53, 58);

INSERT INTO Vin VALUES (59, 'Monte Tonnerre', 'Chablis', 'blanc', 3);
INSERT INTO Article VALUES(138, TO_DATE('1993','yyyy'), 75, 56.94, 59);
INSERT INTO Article VALUES(139, TO_DATE('1993','yyyy'), 150, 128.54, 59);
INSERT INTO Article VALUES(140, TO_DATE('1997','yyyy'), 75, 45.24, 59);
INSERT INTO Article VALUES(141, TO_DATE('1992','yyyy'), 75, 76.13, 59);
INSERT INTO Article VALUES(142, TO_DATE('1995','yyyy'), 75, 47.88, 59);

INSERT INTO Vin VALUES (56, 'Philippe Testut', 'Chablis Premier Cru', 'blanc', 3);
INSERT INTO Article VALUES(132, TO_DATE('1954','yyyy'), 75, 734.09, 56);
INSERT INTO Article VALUES(133, TO_DATE('1972','yyyy'), 75, 1023.12, 56);

INSERT INTO Vin VALUES (57, 'Lys Bouchard', 'Chablis Premier Cru', 'blanc', 3);
INSERT INTO Article VALUES(129, TO_DATE('1998','yyyy'), 75, 45.98, 57);
INSERT INTO Article VALUES(130, TO_DATE('1998','yyyy'), 37, 26.7, 57);
INSERT INTO Article VALUES(131, TO_DATE('1998','yyyy'), 150, 99.52, 57);

INSERT INTO Vin VALUES (55, 'Bressandes Bouchereau', 'Corton', 'rouge', 3);
INSERT INTO Article VALUES(127, TO_DATE('1997','yyyy'), 37, 6.78, 55);
INSERT INTO Article VALUES(128, TO_DATE('1998','yyyy'), 75, 13.22, 55);

INSERT INTO Vin VALUES (54, 'Laboure', 'Macon', 'rouge', 3);
INSERT INTO Article VALUES(123, TO_DATE('1982','yyyy'), 75, 45.98, 54);
INSERT INTO Article VALUES(124, TO_DATE('1983','yyyy'), 75, 41.34, 54);
INSERT INTO Article VALUES(125, TO_DATE('1988','yyyy'), 75, 31.05, 54);
INSERT INTO Article VALUES(126, TO_DATE('1988','yyyy'), 37, 17.53, 54);

INSERT INTO Vin VALUES (52, 'Thevenin', 'Volnay', 'rouge', 3);
INSERT INTO Article VALUES(120, TO_DATE('1985','yyyy'), 75, 12.98, 52);
INSERT INTO Article VALUES(121, TO_DATE('1985','yyyy'), 37, 7, 52);
INSERT INTO Article VALUES(122, TO_DATE('1985','yyyy'), 150, 23.88, 52);

INSERT INTO Vin VALUES (53, 'Domaine Bitouzet Prieur', 'Volnay', 'blanc', 3);

INSERT INTO Vin VALUES (49, 'Machard Gramont', 'Pommard', 'blanc', 3);
INSERT INTO Article VALUES(113, TO_DATE('1999','yyyy'), 75, 12.76, 49);
INSERT INTO Article VALUES(114, TO_DATE('1999','yyyy'), 37, 6.99, 49);
INSERT INTO Article VALUES(115, TO_DATE('1999','yyyy'), 150, 30.04, 49);
INSERT INTO Article VALUES(116, TO_DATE('1998','yyyy'), 75, 18.77, 49);

INSERT INTO Vin VALUES (50, 'Montille Rugiens', 'Pommard', 'blanc', 3);
INSERT INTO Article VALUES(117, TO_DATE('1990','yyyy'), 75, 85.40, 50);

INSERT INTO Vin VALUES (51, 'Chantin Girardin', 'Pommard', 'blanc', 3);
INSERT INTO Article VALUES(118, TO_DATE('1987','yyyy'), 75, 74.93, 51);
INSERT INTO Article VALUES(119, TO_DATE('1988','yyyy'), 75, 64.08, 51);

INSERT INTO Vin VALUES (47, 'Banyuls etoile', 'Collioure', 'rouge', 4);
INSERT INTO Article VALUES(232, TO_DATE('1994','yyyy'), 75, 12.31, 47);

INSERT INTO Vin VALUES (48, 'Les Esperades', 'Collioure', 'rose', 4);
INSERT INTO Article VALUES(109, TO_DATE('1999','yyyy'), 75, 8.33, 48);
INSERT INTO Article VALUES(110, TO_DATE('1999','yyyy'), 37, 4.15, 48);
INSERT INTO Article VALUES(111, TO_DATE('1999','yyyy'), 150, 17.88, 48);
INSERT INTO Article VALUES(112, TO_DATE('1999','yyyy'), 500, 96.18, 48);

INSERT INTO Vin VALUES (45, 'Chateau Mirausse', 'Minervois', 'rouge', 4);
INSERT INTO Article VALUES(105, TO_DATE('1996','yyyy'), 75, 8.75, 45);
INSERT INTO Article VALUES(106, TO_DATE('1997','yyyy'), 75, 6.59, 45);

INSERT INTO Vin VALUES (46, 'Chateau La Reze', 'Minervois', 'blanc', 4);
INSERT INTO Article VALUES(107, TO_DATE('1986','yyyy'), 150, 19.66, 46);
INSERT INTO Article VALUES(108, TO_DATE('1986','yyyy'), 75, 10.51, 46);

INSERT INTO Vin VALUES (42, 'Galant', 'Cerons', 'rouge', 5);
INSERT INTO Article VALUES(100, TO_DATE('1935','yyyy'), 75, 189.44, 42);
INSERT INTO Article VALUES(101, TO_DATE('1926','yyyy'), 75, 202.38, 42);

INSERT INTO Vin VALUES (43, 'Chateau Beaulieu', 'Cerons', 'rouge', 5);
INSERT INTO Article VALUES(102, TO_DATE('1912','yyyy'), 75, 311.67, 43);

INSERT INTO Vin VALUES (44, 'Chateau du Caillou', 'Cerons', 'rouge', 5);
INSERT INTO Article VALUES(103, TO_DATE('1996','yyyy'), 75, 7.55, 44);
INSERT INTO Article VALUES(104, TO_DATE('1996','yyyy'), 37, 4.09, 44);

INSERT INTO Vin VALUES (40, 'La Foret Hilaire', 'Entre-deux-Mers', 'rouge', 5);
INSERT INTO Article VALUES(97, TO_DATE('1975','yyyy'), 75, 3.19, 40);
INSERT INTO Article VALUES(98, TO_DATE('1975','yyyy'), 150, 7.11, 40);

INSERT INTO Vin VALUES (41, 'Haut-Benauge', 'Entre-deux-Mers', 'rouge', 5);
INSERT INTO Article VALUES(99, TO_DATE('1990','yyyy'), 75, 1.06, 41);

INSERT INTO Vin VALUES (37, 'Chateau Loubaix', 'Graves', 'rouge', 5);
INSERT INTO Article VALUES(90, TO_DATE('1996','yyyy'), 75, 10.89, 37);
INSERT INTO Article VALUES(91, TO_DATE('1997','yyyy'), 75, 9.22, 37);
INSERT INTO Article VALUES(92, TO_DATE('1998','yyyy'), 75, 7.33, 37);
INSERT INTO Article VALUES(93, TO_DATE('1999','yyyy'), 75, 6.11, 37);

INSERT INTO Vin VALUES (38, 'Paulin', 'Graves', 'rouge', 5);
INSERT INTO Article VALUES(94, TO_DATE('1987','yyyy'), 75, 56.33, 38);
INSERT INTO Article VALUES(95, TO_DATE('1987','yyyy'), 150, 186.09, 38);

INSERT INTO Vin VALUES (39, 'Bernard Lehoux', 'Graves', 'rouge', 5);
INSERT INTO Article VALUES(96, TO_DATE('2000','yyyy'), 75, 7.33, 37);

INSERT INTO Vin VALUES (36, 'Domaine des Graveaux', 'Graves Superieures', 'rouge', 5);
INSERT INTO Article VALUES(89, TO_DATE('1991','yyyy'), 75, 18.31, 36);

INSERT INTO Vin VALUES (35, 'Chateau Poncelet du Lac', 'Graves Superieures', 'rouge', 5);
INSERT INTO Article VALUES(87, TO_DATE('1999','yyyy'), 75, 5.23, 35);
INSERT INTO Article VALUES(88, TO_DATE('2000','yyyy'), 37, 2.99, 35);

INSERT INTO Vin VALUES (34, 'Chateau Meihlan', 'Haut-Medoc', 'rouge', 5);
INSERT INTO Article VALUES(84, TO_DATE('1995','yyyy'), 75, 8.82, 34);
INSERT INTO Article VALUES(85, TO_DATE('1996','yyyy'), 75, 7.21, 34);
INSERT INTO Article VALUES(86, TO_DATE('1996','yyyy'), 37, 3.77, 34);

INSERT INTO Vin VALUES (33, 'Comte Pichon Longueville', 'Lalande', 'rouge', 5);
INSERT INTO Article VALUES(82, TO_DATE('1998','yyyy'), 75, 13.21, 33);
INSERT INTO Article VALUES(83, TO_DATE('1999','yyyy'), 75, 10.55, 33);

INSERT INTO Vin VALUES (32, 'Fonraud', 'Listrac-Medoc', 'rouge', 5);

INSERT INTO Vin VALUES (31, 'Chateau Margaux', 'Margaux', 'rouge', 5);
INSERT INTO Article VALUES(75, TO_DATE('1936','yyyy'), 75, 1089.51, 31);
INSERT INTO Article VALUES(76, TO_DATE('1899','yyyy'), 75, 7245, 31);
INSERT INTO Article VALUES(77, TO_DATE('1900','yyyy'), 75, 4746.46, 31);
INSERT INTO Article VALUES(78, TO_DATE('1929','yyyy'), 75, 1757.07, 31);
INSERT INTO Article VALUES(79, TO_DATE('1930','yyyy'), 75, 499.71, 31);
INSERT INTO Article VALUES(80, TO_DATE('1988','yyyy'), 75, 198.18, 31);
INSERT INTO Article VALUES(81, TO_DATE('1988','yyyy'), 150, 583.35, 31);

INSERT INTO Vin VALUES (29, 'Chateau des Bois', 'Medoc', 'rouge', 5);
INSERT INTO Article VALUES(70, TO_DATE('1996','yyyy'), 75, 4.94, 29);
INSERT INTO Article VALUES(71, TO_DATE('1997','yyyy'), 75, 6.49, 29);

INSERT INTO Vin VALUES (30, 'Domaine du Beaujour', 'Medoc', 'rouge', 5);
INSERT INTO Article VALUES(72, TO_DATE('1993','yyyy'), 75, 8.02, 30);
INSERT INTO Article VALUES(73, TO_DATE('1993','yyyy'), 37, 5.03, 30);
INSERT INTO Article VALUES(74, TO_DATE('1993','yyyy'), 150, 12.52, 30);

INSERT INTO Vin VALUES (28, 'Latour', 'Pomerol', 'rouge', 5);
INSERT INTO Article VALUES(65, TO_DATE('1923','yyyy'), 75, 464.25, 28);
INSERT INTO Article VALUES(66, TO_DATE('1952','yyyy'), 75, 251, 28);
INSERT INTO Article VALUES(67, TO_DATE('1970','yyyy'), 75, 358.29, 28);
INSERT INTO Article VALUES(68, TO_DATE('1985','yyyy'), 75, 82.02, 28);
INSERT INTO Article VALUES(69, TO_DATE('1998','yyyy'), 75, 61.06, 28);

INSERT INTO Vin VALUES (26, 'Carillon Angelus', 'Saint Estephe', 'rouge', 5);
INSERT INTO Article VALUES(60, TO_DATE('1997','yyyy'), 75, 7.43, 26);
INSERT INTO Article VALUES(61, TO_DATE('1997','yyyy'), 37, 4.21, 26);
INSERT INTO Article VALUES(62, TO_DATE('1998','yyyy'), 75, 6.22, 26);
INSERT INTO Article VALUES(63, TO_DATE('1998','yyyy'), 37, 3.65, 26);

INSERT INTO Vin VALUES (27, 'Croix Mazerat', 'Saint Estephe', 'rouge', 5);
INSERT INTO Article VALUES(64, TO_DATE('1986','yyyy'), 75, 63.90, 27);

INSERT INTO Vin VALUES (18, 'Clos Oratoire', 'Saint-Emilion', 'rouge', 5);
INSERT INTO Article VALUES(39, TO_DATE('1995','yyyy'), 75, 36.21, 18);
INSERT INTO Article VALUES(40, TO_DATE('1995','yyyy'), 150, 59.55, 18);
INSERT INTO Article VALUES(41, TO_DATE('1998','yyyy'), 75, 15.81, 18);

INSERT INTO Vin VALUES (19, 'Angelus', 'Saint-Emilion', 'rouge', 5);
INSERT INTO Article VALUES(42, TO_DATE('1998','yyyy'), 75, 23.07, 19);
INSERT INTO Article VALUES(43, TO_DATE('1998','yyyy'), 37, 16.18, 19);

INSERT INTO Vin VALUES (20, 'Connetable Talbot', 'Saint-Emilion', 'rouge', 5);
INSERT INTO Article VALUES(44, TO_DATE('1993','yyyy'), 75, 56.94, 20);
INSERT INTO Article VALUES(45, TO_DATE('1993','yyyy'), 150, 121.82, 20);
INSERT INTO Article VALUES(46, TO_DATE('1991','yyyy'), 75, 81.24, 20);
INSERT INTO Article VALUES(47, TO_DATE('1992','yyyy'), 75, 76.07, 20);
INSERT INTO Article VALUES(48, TO_DATE('1995','yyyy'), 75, 19.22, 20);

INSERT INTO Vin VALUES (21, 'Cap Mourlin', 'Saint-Emilion', 'rouge', 5);
INSERT INTO Article VALUES(49, TO_DATE('2000','yyyy'), 75, 4.87, 21);

INSERT INTO Vin VALUES (22, 'Pavie Decesse', 'Saint-Emilion', 'rouge', 5);
INSERT INTO Article VALUES(50, TO_DATE('1993','yyyy'), 75, 18.82, 22);
INSERT INTO Article VALUES(51, TO_DATE('1975','yyyy'), 75, 221.05, 22);
INSERT INTO Article VALUES(52, TO_DATE('1975','yyyy'), 150, 577.31, 22);

INSERT INTO Vin VALUES (23, 'Chemin Mulets', 'Chateauneuf du Pape', 'rouge', 6);
INSERT INTO Article VALUES(54, TO_DATE('1998','yyyy'), 75, 4.69, 23);
INSERT INTO Article VALUES(55, TO_DATE('1998','yyyy'), 37, 2.98, 23);
INSERT INTO Article VALUES(56, TO_DATE('1997','yyyy'), 75, 7.19, 23);

INSERT INTO Vin VALUES (24, 'Vallee Montredon', 'Chateauneuf du Pape', 'blanc', 6);
INSERT INTO Article VALUES(57, TO_DATE('1999','yyyy'), 75, 3.97, 24);

INSERT INTO Vin VALUES (25, 'JB Duquesne', 'Clairette de Die', 'blanc', 6);
INSERT INTO Article VALUES(58, TO_DATE('1999','yyyy'), 75, 4.2, 25);
INSERT INTO Article VALUES(59, TO_DATE('2000','yyyy'), 75, 3.54, 25);

INSERT INTO Vin VALUES (16, 'Les Nobles Rives', 'Cornas', 'rouge', 6);
INSERT INTO Article VALUES(35, TO_DATE('1997','yyyy'), 75, 4.37, 16);
INSERT INTO Article VALUES(36, TO_DATE('1998','yyyy'), 75, 3.21, 16);

INSERT INTO Vin VALUES (17, 'Chante Perdrix', 'Cornas', 'rouge', 6);
INSERT INTO Article VALUES(37, TO_DATE('1993','yyyy'), 75, 16.87, 17);
INSERT INTO Article VALUES(38, TO_DATE('1992','yyyy'), 75, 26.12, 17);

INSERT INTO Vin VALUES (14, 'Viognier', 'Coteau ardechois', 'rouge', 6);
INSERT INTO Article VALUES(31, TO_DATE('2001','yyyy'), 500, 25.66, 14);
INSERT INTO Article VALUES(32, TO_DATE('1999','yyyy'), 75, 6.25, 14); 
INSERT INTO Article VALUES(33, TO_DATE('1999','yyyy'), 37, 3.87, 14);

INSERT INTO Vin VALUES (15, 'Domaine de Ruoms', 'Coteau ardechois', 'rose', 6);
INSERT INTO Article VALUES(34, TO_DATE('2000','yyyy'), 75, 1.21, 15);

INSERT INTO Vin VALUES (13, 'Domaine Petit Jean', 'Cotes du vivarais', 'rouge', 6);
INSERT INTO Article VALUES(29, TO_DATE('2001','yyyy'), 500, 20, 13);
INSERT INTO Article VALUES(30, TO_DATE('2001','yyyy'), 75, 4.10, 13); 

INSERT INTO Vin VALUES (10, 'Mayson Chapoutier', 'Crozes Hermitage', 'rouge', 6);
INSERT INTO Article VALUES(22, TO_DATE('1996','yyyy'), 75, 4.21, 10);
INSERT INTO Article VALUES(23, TO_DATE('1997','yyyy'), 75, 3.98, 10);
INSERT INTO Article VALUES(24, TO_DATE('1998','yyyy'), 75, 3.11, 10);

INSERT INTO Vin VALUES (11, 'Thalabert', 'Crozes Hermitage', 'rouge', 6);
INSERT INTO Article VALUES(25, TO_DATE('1999','yyyy'), 75, 8.12, 11);
INSERT INTO Article VALUES(26, TO_DATE('1999','yyyy'), 37, 4.49, 11);
 
INSERT INTO Vin VALUES (12, 'Colomb Blanc', 'Crozes Hermitage', 'blanc', 6);
INSERT INTO Article VALUES(27, TO_DATE('2000','yyyy'), 300, 23.10, 12);
INSERT INTO Article VALUES(28, TO_DATE('2001','yyyy'), 300, 22.03, 12);

INSERT INTO Vin VALUES (8, 'Chateau Gigognan', 'Gigondas', 'rouge', 6);
INSERT INTO Article VALUES(16, TO_DATE('1998','yyyy'), 75, 7.1, 8);
INSERT INTO Article VALUES(17, TO_DATE('1999','yyyy'), 75, 6.87, 8);
INSERT INTO Article VALUES(18, TO_DATE('1999','yyyy'), 150, 14.91, 8);

INSERT INTO Vin VALUES (9, 'Domaine de la Machotte', 'Gigondas', 'rouge', 6);
INSERT INTO Article VALUES(19, TO_DATE('1992','yyyy'), 150, 68.43, 9);
INSERT INTO Article VALUES(20, TO_DATE('1992','yyyy'), 75, 39.10, 9);
INSERT INTO Article VALUES(21, TO_DATE('1998','yyyy'), 75, 9.54, 9);

INSERT INTO Vin VALUES (7, 'Domaine Paulin', 'Haut-Comta', 'rose', 6);

INSERT INTO Vin VALUES (4, 'Pompee', 'Saint-Joseph', 'rouge', 6);
INSERT INTO Article VALUES(15, TO_DATE('1994','yyyy'), 75, 6.75, 4);
INSERT INTO Article VALUES(6, TO_DATE('1999','yyyy'), 75, 3.24, 4);
INSERT INTO Article VALUES(7, TO_DATE('1999','yyyy'), 150, 6.31, 4);
INSERT INTO Article VALUES(8, TO_DATE('1999','yyyy'), 37, 2.01, 4);
INSERT INTO Article VALUES(9, TO_DATE('1997','yyyy'), 75, 7.12, 4);

INSERT INTO Vin VALUES (5, 'Clos Saint-Joseph', 'Saint-Joseph', 'rouge', 6);
INSERT INTO Article VALUES(13, TO_DATE('2000','yyyy'), 37, 1.12, 5);
INSERT INTO Article VALUES(14, TO_DATE('2001','yyyy'), 75, 1.99, 5);
INSERT INTO Article VALUES(10, TO_DATE('1999','yyyy'), 37, 1.87, 5);

INSERT INTO Vin VALUES (6, 'Arras Vieux', 'Saint-Joseph', 'rouge', 6);
INSERT INTO Article VALUES(11, TO_DATE('1995','yyyy'), 75, 13.46, 6);
INSERT INTO Article VALUES(12, TO_DATE('1992','yyyy'), 75, 40.88, 6);

INSERT INTO Vin VALUES (3, 'Maison Bouchard Pere et Fils', 'Tavel', 'rouge', 6);
INSERT INTO Article VALUES(4, TO_DATE('1999','yyyy'), 75, 1.32, 3);
INSERT INTO Article VALUES(5, TO_DATE('1998','yyyy'), 150, 3.46, 3);

INSERT INTO Vin VALUES (1, 'Vacqueyras Pascal', 'Vacqueyras', 'rouge', 6);
INSERT INTO Article VALUES(1, TO_DATE('1995','yyyy'), 75, 7.55, 1);

INSERT INTO Vin VALUES (2, 'Vacqueyras Vielles Vignes', 'Vacqueyras', 'rouge', 6);
INSERT INTO Article VALUES(2, TO_DATE('2000','yyyy'), 75, 37.49, 2);
INSERT INTO Article VALUES(3, TO_DATE('1998','yyyy'), 75, 43.01, 2);

INSERT INTO Vin VALUES (77, 'Vacher Georges Edouard', 'Alsace Chasselas', 'blanc', 7);
INSERT INTO Article VALUES(183, TO_DATE('1998','yyyy'), 75, 8.42, 77);
INSERT INTO Article VALUES(184, TO_DATE('1999','yyyy'), 75, 7.66, 77);
INSERT INTO Article VALUES(185, TO_DATE('1999','yyyy'), 37, 3.8, 77);

INSERT INTO Vin VALUES (78, 'Chateau de Colex', 'Alsace Chasselas', 'blanc', 7);
INSERT INTO Article VALUES(186, TO_DATE('1992','yyyy'), 37, 10.09, 78);
INSERT INTO Article VALUES(187, TO_DATE('1992','yyyy'), 75, 19.62, 78);
INSERT INTO Article VALUES(188, TO_DATE('1995','yyyy'), 75, 11.29, 78);
INSERT INTO Article VALUES(189, TO_DATE('1999','yyyy'), 75, 8.28, 78);

INSERT INTO Vin VALUES (79, 'Eiguishem', 'Alsace Pinot', 'blanc', 7);
INSERT INTO Article VALUES(190, TO_DATE('1999','yyyy'), 75, 3.76, 79);
INSERT INTO Article VALUES(191, TO_DATE('2000','yyyy'), 75, 3.01, 79);
INSERT INTO Article VALUES(192, TO_DATE('1998','yyyy'), 75, 3.99, 79);
INSERT INTO Article VALUES(193, TO_DATE('1998','yyyy'), 37, 2.05, 79);

INSERT INTO Vin VALUES (80, 'Michel Dietrich', 'Alsace Pinot', 'blanc', 7);
INSERT INTO Article VALUES(194, TO_DATE('1998','yyyy'), 75, 4.51, 80);
INSERT INTO Article VALUES(195, TO_DATE('1998','yyyy'), 37, 2.84, 80);
INSERT INTO Article VALUES(196, TO_DATE('1998','yyyy'), 150, 9.05, 80);

INSERT INTO Vin VALUES (81, 'Herren Turckh Zind Humbrecht', 'Alsace Tokay Pinot gris', 'blanc', 7);
INSERT INTO Article VALUES(197, TO_DATE('1999','yyyy'), 150, 121.09, 81);
INSERT INTO Article VALUES(198, TO_DATE('1999','yyyy'), 75, 65.81, 81);

INSERT INTO Vin VALUES (82, 'Wolfberger', 'Alsace Riesling', 'blanc', 7);
INSERT INTO Article VALUES(199, TO_DATE('1995','yyyy'), 75, 31.01, 82);
INSERT INTO Article VALUES(200, TO_DATE('1996','yyyy'), 75, 22.55, 82);
INSERT INTO Article VALUES(201, TO_DATE('1997','yyyy'), 75, 19.71, 82);

INSERT INTO Vin VALUES (83, 'Clos Windsbuhl', 'Alsace Riesling', 'blanc', 7);
INSERT INTO Article VALUES(202, TO_DATE('2000','yyyy'), 75, 6.19, 83);

INSERT INTO Vin VALUES (84, 'Michel Dietrich', 'Alsace Riesling', 'blanc', 7);
INSERT INTO Article VALUES(203, TO_DATE('1996','yyyy'), 75, 6.43, 84);
INSERT INTO Article VALUES(204, TO_DATE('1996','yyyy'), 37, 3.51, 84);
INSERT INTO Article VALUES(205, TO_DATE('1999','yyyy'), 75, 4.95, 84);
INSERT INTO Article VALUES(206, TO_DATE('1999','yyyy'), 37, 2.74, 84);

INSERT INTO Vin VALUES (85, 'Wolfberger', 'Alsace Sylvaner', 'blanc', 7);
INSERT INTO Article VALUES(207, TO_DATE('1999','yyyy'), 37, 1.92, 85);
INSERT INTO Article VALUES(208, TO_DATE('1999','yyyy'), 75, 2.76, 85);
INSERT INTO Article VALUES(230, TO_DATE('1986','yyyy'), 75, 11.44, 85);

INSERT INTO Vin VALUES (86, 'Bergweingarten', 'Alsace Sylvaner', 'blanc', 7);
INSERT INTO Article VALUES(209, TO_DATE('1990','yyyy'), 75, 7.21, 86);

INSERT INTO Vin VALUES (87, 'Domaine Chatelain', 'Bandol', 'rose', 8);
INSERT INTO Article VALUES(210, TO_DATE('1999','yyyy'), 75, 2.92, 87);
INSERT INTO Article VALUES(211, TO_DATE('2000','yyyy'), 75, 2.76, 87);
INSERT INTO Article VALUES(212, TO_DATE('2000','yyyy'), 37, 1.44, 87);
INSERT INTO Article VALUES(213, TO_DATE('2000','yyyy'), 300, 12.87, 87);

INSERT INTO Vin VALUES (88, 'Colline Despres', 'Bandol', 'rose', 8);
INSERT INTO Article VALUES(214, TO_DATE('1999','yyyy'), 300, 14.01, 88);
INSERT INTO Article VALUES(215, TO_DATE('1999','yyyy'), 75, 4.61, 88);

INSERT INTO Vin VALUES (89, 'Colline Despres', 'Bandol', 'rouge', 8);
INSERT INTO Article VALUES(216, TO_DATE('1999','yyyy'), 300, 12.81, 89);
INSERT INTO Article VALUES(217, TO_DATE('1999','yyyy'), 75, 3.82, 89);

INSERT INTO Vin VALUES (90, 'Domaine des Marines', 'Coteaux Aix', 'rose', 8);
INSERT INTO Article VALUES(218, TO_DATE('1999','yyyy'), 75, 2.75, 90);
INSERT INTO Article VALUES(219, TO_DATE('1999','yyyy'), 75, 2.21, 90);
INSERT INTO Article VALUES(220, TO_DATE('1999','yyyy'), 37, 1.24, 90);
INSERT INTO Article VALUES(221, TO_DATE('2001','yyyy'), 300, 14.97, 90);

INSERT INTO Vin VALUES (91, 'Chateau Magnanerie',  'Coteaux Aix', 'rose', 8);
INSERT INTO Article VALUES(222, TO_DATE('1999','yyyy'), 75, 2.75, 91);
INSERT INTO Article VALUES(223, TO_DATE('1999','yyyy'), 75, 2.21, 91);
INSERT INTO Article VALUES(224, TO_DATE('1999','yyyy'), 37, 1.24, 91);
INSERT INTO Article VALUES(225, TO_DATE('2001','yyyy'), 300, 14.97, 91);

INSERT INTO Vin VALUES (92, 'Marc Duchesnais', 'Coteaux Varois', 'rouge', 8);
INSERT INTO Article VALUES(226, TO_DATE('1999','yyyy'), 75, 3.76, 92);

INSERT INTO Vin VALUES (93, 'Les Fleurs', 'Coteaux Varois', 'blanc', 8);
INSERT INTO Article VALUES(227, TO_DATE('2001','yyyy'), 75, 7.21, 93);
INSERT INTO Article VALUES(228, TO_DATE('2000','yyyy'), 75, 8.05, 93);
INSERT INTO Article VALUES(229, TO_DATE('1987','yyyy'), 75, 14.32, 93);


INSERT INTO Client VALUES (1, 'Bouter', 34, 6);
INSERT INTO Client VALUES (2, 'Raimus', 64, 6);
INSERT INTO Client VALUES (3, 'Carrima', 30, 5);
INSERT INTO Client VALUES (4, 'Loupes', 25, 3);
INSERT INTO Client VALUES (5, 'Arnaud', 29, 6);
INSERT INTO Client VALUES (6, 'Jerame', 72, 7);
INSERT INTO Client VALUES (7, 'Moulin', 21, 7);
INSERT INTO Client VALUES (8, 'Moulin', 41, 7);
INSERT INTO Client VALUES (9, 'Pesta', 81, 8);
INSERT INTO Client VALUES (10, 'Carrima', 28, 1);
INSERT INTO Client VALUES (11, 'Baretau', 31, 1);
INSERT INTO Client VALUES (12, 'Dietrich', 62, 2);
INSERT INTO Client VALUES (13, 'Chopin', 18, 4);
INSERT INTO Client VALUES (14, 'Goulada', 91, 4);
INSERT INTO Client VALUES (15, 'Raimond', 44, 6);
INSERT INTO Client VALUES (16, 'Palage', 31, 3);
INSERT INTO Client VALUES (17, 'Malina', 42, 8);
INSERT INTO Client VALUES (18, 'Carboni', 38, 8);
INSERT INTO Client VALUES (19, 'Kim', 41, 1);
INSERT INTO Client VALUES (20, 'Damin', 27, 1);
INSERT INTO Client VALUES (21, 'Respard', 64, 3);
INSERT INTO Client VALUES (22, 'Mula', 53, 1);
INSERT INTO Client VALUES (23, 'Martin', 48, 2);
INSERT INTO Client VALUES (24, 'Carefre', 23, 8);
INSERT INTO Client VALUES (25, 'Quentinet', 64, 4);
INSERT INTO Client VALUES (28, 'Maquis', 70, 7);
INSERT INTO Client VALUES (29, 'Rougeot', 76, 7);
INSERT INTO Client VALUES (30, 'Mougeot', 52, 5);

INSERT INTO Achat VALUES (1, 23, 3, TO_DATE('02/10/2001', 'DD/MM/YYYY'), 2, 7);
INSERT INTO Achat VALUES (2, 52, 2, TO_DATE('07/10/2001', 'DD/MM/YYYY'), 1, 7);
INSERT INTO Achat VALUES (3, 107, 2, TO_DATE('12/10/2001', 'DD/MM/YYYY'), 8, 7);
INSERT INTO Achat VALUES (4, 212, 5, TO_DATE('12/10/2001', 'DD/MM/YYYY'), 1, 7);
INSERT INTO Achat VALUES (5, 94, 19, TO_DATE('17/11/2001', 'DD/MM/YYYY'), 3, 7);