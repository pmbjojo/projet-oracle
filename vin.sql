DROP TABLE REGION CASCADE CONSTRAINTS;

DROP TABLE VIN CASCADE CONSTRAINTS;

DROP TABLE ARTICLE CASCADE CONSTRAINTS;

DROP TABLE CLIENT CASCADE CONSTRAINTS;

DROP TABLE ACHAT CASCADE CONSTRAINTS;

CREATE TABLE REGION (
    IDREGION NUMBER,
    NOM VARCHAR2(20),
    CONSTRAINTS PK_REGION PRIMARY KEY (IDREGION)
);

CREATE TABLE VIN (
    IDVIN NUMBER,
    NOM VARCHAR2(30),
    APPELLATION VARCHAR2(30),
    TYPE VARCHAR2(5),
    PROVENANCE NUMBER,
    CONSTRAINT PK_VIN PRIMARY KEY (IDVIN),
    CONSTRAINT FK_VIN_REGION FOREIGN KEY (PROVENANCE) REFERENCES REGION (IDREGION),
    CONSTRAINT CH_TYPE CHECK (TYPE IS NULL OR TYPE IN ('rouge', 'rose', 'blanc', 'gris', 'jaune'))
);

CREATE TABLE ARTICLE (
    IDARTICLE NUMBER,
    MILLESIME DATE,
    CONTENANCE NUMBER,
    PRIXHT NUMBER,
    VIN NUMBER,
    CONSTRAINT PK_ARTICLE PRIMARY KEY (IDARTICLE),
    CONSTRAINT FK_ARTICLE_VIN FOREIGN KEY (VIN) REFERENCES VIN (IDVIN),
    CONSTRAINT CH_PRIXHT CHECK (PRIXHT > 0)
);

CREATE TABLE CLIENT (
    IDCLIENT NUMBER,
    NOM VARCHAR2(10),
    AGE NUMBER,
    HABITE NUMBER,
    CONSTRAINT PK_CLIENT PRIMARY KEY (IDCLIENT),
    CONSTRAINT FK_CLIENT_REGION FOREIGN KEY (HABITE) REFERENCES REGION (IDREGION),
    CONSTRAINT CH_AGE CHECK (AGE > 17)
);

CREATE TABLE ACHAT (
    IDACHAT NUMBER,
    ARTICLE NUMBER,
    CLIENT NUMBER,
    DATEACHAT DATE,
    QUANTITE NUMBER,
    RISTOURNE NUMBER,
    CONSTRAINT PK_ACHAT PRIMARY KEY (IDACHAT),
    CONSTRAINT FK_ACHAT_CLIENT FOREIGN KEY (CLIENT) REFERENCES CLIENT (IDCLIENT),
    CONSTRAINT FK_ACHAT_ARTICLE FOREIGN KEY (ARTICLE) REFERENCES ARTICLE (IDARTICLE),
    CONSTRAINT CH_QUANTITE CHECK (QUANTITE > 0),
    CONSTRAINT CH_RISTOURNE CHECK (RISTOURNE >= 0 AND RISTOURNE <=100)
);

INSERT INTO REGION VALUES (
    1,
    'Bassin de la Loire'
);

INSERT INTO REGION VALUES (
    2,
    'Beaujolais'
);

INSERT INTO REGION VALUES (
    3,
    'Bourgogne'
);

INSERT INTO REGION VALUES (
    4,
    'Languedoc Roussillon'
);

INSERT INTO REGION VALUES (
    5,
    'Bordelais'
);

INSERT INTO REGION VALUES (
    6,
    'Cotes du Rhone'
);

INSERT INTO REGION VALUES (
    7,
    'Alsace'
);

INSERT INTO REGION VALUES (
    8,
    'Provence'
);

INSERT INTO VIN VALUES (
    75,
    'Cave Bruneau Dupuis',
    'Bourgueil',
    'rouge',
    1
);

INSERT INTO ARTICLE VALUES(
    181,
    TO_DATE('1966', 'yyyy'),
    75,
    210.76,
    75
);

INSERT INTO ARTICLE VALUES(
    182,
    TO_DATE('1966', 'yyyy'),
    150,
    403.66,
    75
);

INSERT INTO VIN VALUES (
    76,
    'Domaine Hubert',
    'Bourgueil',
    'rouge',
    1
);

INSERT INTO ARTICLE VALUES(
    176,
    TO_DATE('1995', 'yyyy'),
    75,
    20.22,
    76
);

INSERT INTO ARTICLE VALUES(
    177,
    TO_DATE('1995', 'yyyy'),
    37,
    11.12,
    76
);

INSERT INTO ARTICLE VALUES(
    178,
    TO_DATE('1996', 'yyyy'),
    75,
    19.42,
    76
);

INSERT INTO ARTICLE VALUES(
    179,
    TO_DATE('1999', 'yyyy'),
    75,
    9.76,
    76
);

INSERT INTO ARTICLE VALUES(
    180,
    TO_DATE('1967', 'yyyy'),
    75,
    194.52,
    76
);

INSERT INTO VIN VALUES (
    73,
    'Chateau de Valmer',
    'Vouvray',
    'blanc',
    1
);

INSERT INTO ARTICLE VALUES(
    170,
    TO_DATE('2000', 'yyyy'),
    75,
    1.54,
    73
);

INSERT INTO ARTICLE VALUES(
    171,
    TO_DATE('2000', 'yyyy'),
    37,
    0.83,
    73
);

INSERT INTO VIN VALUES (
    74,
    'Vallee Coquette',
    'Vouvray',
    'blanc',
    1
);

INSERT INTO ARTICLE VALUES(
    172,
    TO_DATE('2000', 'yyyy'),
    75,
    1.92,
    74
);

INSERT INTO ARTICLE VALUES(
    173,
    TO_DATE('2000', 'yyyy'),
    37,
    1.00,
    74
);

INSERT INTO ARTICLE VALUES(
    174,
    TO_DATE('2001', 'yyyy'),
    75,
    1.86,
    74
);

INSERT INTO ARTICLE VALUES(
    175,
    TO_DATE('2001', 'yyyy'),
    37,
    0.92,
    74
);

INSERT INTO VIN VALUES (
    72,
    'Domaine Richoux',
    'Anjou-Gamay',
    'rouge',
    1
);

INSERT INTO ARTICLE VALUES(
    166,
    TO_DATE('1999', 'yyyy'),
    75,
    4.64,
    72
);

INSERT INTO ARTICLE VALUES(
    167,
    TO_DATE('1999', 'yyyy'),
    37,
    2.62,
    72
);

INSERT INTO ARTICLE VALUES(
    168,
    TO_DATE('1999', 'yyyy'),
    150,
    9.06,
    72
);

INSERT INTO ARTICLE VALUES(
    169,
    TO_DATE('1999', 'yyyy'),
    300,
    19.11,
    72
);

INSERT INTO VIN VALUES (
    71,
    'Domaine des Petits Quarts',
    'Bonnezeaux',
    'rouge',
    1
);

INSERT INTO ARTICLE VALUES(
    164,
    TO_DATE('1996', 'yyyy'),
    75,
    10.05,
    71
);

INSERT INTO ARTICLE VALUES(
    165,
    TO_DATE('2000', 'yyyy'),
    75,
    4.21,
    71
);

INSERT INTO VIN VALUES (
    68,
    'Chatelain Desjacques prestige',
    'Chinon',
    'rouge',
    1
);

INSERT INTO ARTICLE VALUES(
    157,
    TO_DATE('2000', 'yyyy'),
    75,
    18.82,
    68
);

INSERT INTO VIN VALUES (
    69,
    'Moulin des Sablons',
    'Chinon',
    'rouge',
    1
);

INSERT INTO ARTICLE VALUES(
    158,
    TO_DATE('1996', 'yyyy'),
    75,
    19.53,
    69
);

INSERT INTO ARTICLE VALUES(
    159,
    TO_DATE('1996', 'yyyy'),
    37,
    10.30,
    69
);

INSERT INTO ARTICLE VALUES(
    160,
    TO_DATE('1999', 'yyyy'),
    75,
    16.04,
    69
);

INSERT INTO ARTICLE VALUES(
    161,
    TO_DATE('1995', 'yyyy'),
    75,
    8.97,
    69
);

INSERT INTO VIN VALUES (
    70,
    'Les Gravieres',
    'Chinon',
    'rouge',
    1
);

INSERT INTO ARTICLE VALUES(
    162,
    TO_DATE('1997', 'yyyy'),
    75,
    12.75,
    70
);

INSERT INTO ARTICLE VALUES(
    163,
    TO_DATE('1999', 'yyyy'),
    75,
    15.21,
    70
);

INSERT INTO VIN VALUES (
    67,
    'Perroud Robert',
    'Cote de Brouilly',
    'rouge',
    2
);

INSERT INTO ARTICLE VALUES(
    155,
    TO_DATE('1994', 'yyyy'),
    75,
    18.42,
    67
);

INSERT INTO ARTICLE VALUES(
    156,
    TO_DATE('1999', 'yyyy'),
    75,
    9.03,
    67
);

INSERT INTO VIN VALUES (
    65,
    'Bataillard Aime',
    'Beaujolais Villages',
    'rouge',
    2
);

INSERT INTO ARTICLE VALUES(
    151,
    TO_DATE('2000', 'yyyy'),
    75,
    2.78,
    65
);

INSERT INTO ARTICLE VALUES(
    152,
    TO_DATE('2000', 'yyyy'),
    150,
    4.76,
    65
);

INSERT INTO ARTICLE VALUES(
    153,
    TO_DATE('2001', 'yyyy'),
    300,
    12.76,
    65
);

INSERT INTO VIN VALUES (
    66,
    'Ecus',
    'Beaujolais Villages',
    'rouge',
    2
);

INSERT INTO ARTICLE VALUES(
    154,
    TO_DATE('2001', 'yyyy'),
    500,
    10.74,
    66
);

INSERT INTO VIN VALUES (
    62,
    'Domaine de Leyre Loup',
    'Morgon',
    'rouge',
    2
);

INSERT INTO ARTICLE VALUES(
    145,
    TO_DATE('1955', 'yyyy'),
    150,
    1699,
    62
);

INSERT INTO VIN VALUES (
    63,
    'Cuvee Calot',
    'Morgon',
    'rouge',
    2
);

INSERT INTO ARTICLE VALUES(
    146,
    TO_DATE('1997', 'yyyy'),
    75,
    12.44,
    63
);

INSERT INTO ARTICLE VALUES(
    147,
    TO_DATE('1998', 'yyyy'),
    75,
    10.06,
    63
);

INSERT INTO ARTICLE VALUES(
    148,
    TO_DATE('1999', 'yyyy'),
    75,
    8.42,
    63
);

INSERT INTO VIN VALUES (
    64,
    'Domaine Pitaud',
    'Morgon',
    'rouge',
    2
);

INSERT INTO ARTICLE VALUES(
    149,
    TO_DATE('1981', 'yyyy'),
    75,
    37.77,
    64
);

INSERT INTO ARTICLE VALUES(
    150,
    TO_DATE('1981', 'yyyy'),
    37,
    19.29,
    64
);

INSERT INTO VIN VALUES (
    60,
    'Bouchard Pere Clou',
    'Meursault',
    'rouge',
    3
);

INSERT INTO ARTICLE VALUES(
    143,
    TO_DATE('1984', 'yyyy'),
    75,
    63.9,
    60
);

INSERT INTO ARTICLE VALUES(
    144,
    TO_DATE('1984', 'yyyy'),
    37,
    36.82,
    60
);

INSERT INTO VIN VALUES (
    61,
    'Jardot Charmes',
    'Meursault',
    'rouge',
    3
);

INSERT INTO VIN VALUES (
    58,
    'Grenouille',
    'Chablis',
    'blanc',
    3
);

INSERT INTO ARTICLE VALUES(
    134,
    TO_DATE('1956', 'yyyy'),
    75,
    845.08,
    58
);

INSERT INTO ARTICLE VALUES(
    135,
    TO_DATE('1957', 'yyyy'),
    75,
    741.30,
    58
);

INSERT INTO ARTICLE VALUES(
    136,
    TO_DATE('1945', 'yyyy'),
    75,
    2189.05,
    58
);

INSERT INTO ARTICLE VALUES(
    137,
    TO_DATE('1998', 'yyyy'),
    75,
    13.53,
    58
);

INSERT INTO VIN VALUES (
    59,
    'Monte Tonnerre',
    'Chablis',
    'blanc',
    3
);

INSERT INTO ARTICLE VALUES(
    138,
    TO_DATE('1993', 'yyyy'),
    75,
    56.94,
    59
);

INSERT INTO ARTICLE VALUES(
    139,
    TO_DATE('1993', 'yyyy'),
    150,
    128.54,
    59
);

INSERT INTO ARTICLE VALUES(
    140,
    TO_DATE('1997', 'yyyy'),
    75,
    45.24,
    59
);

INSERT INTO ARTICLE VALUES(
    141,
    TO_DATE('1992', 'yyyy'),
    75,
    76.13,
    59
);

INSERT INTO ARTICLE VALUES(
    142,
    TO_DATE('1995', 'yyyy'),
    75,
    47.88,
    59
);

INSERT INTO VIN VALUES (
    56,
    'Philippe Testut',
    'Chablis Premier Cru',
    'blanc',
    3
);

INSERT INTO ARTICLE VALUES(
    132,
    TO_DATE('1954', 'yyyy'),
    75,
    734.09,
    56
);

INSERT INTO ARTICLE VALUES(
    133,
    TO_DATE('1972', 'yyyy'),
    75,
    1023.12,
    56
);

INSERT INTO VIN VALUES (
    57,
    'Lys Bouchard',
    'Chablis Premier Cru',
    'blanc',
    3
);

INSERT INTO ARTICLE VALUES(
    129,
    TO_DATE('1998', 'yyyy'),
    75,
    45.98,
    57
);

INSERT INTO ARTICLE VALUES(
    130,
    TO_DATE('1998', 'yyyy'),
    37,
    26.7,
    57
);

INSERT INTO ARTICLE VALUES(
    131,
    TO_DATE('1998', 'yyyy'),
    150,
    99.52,
    57
);

INSERT INTO VIN VALUES (
    55,
    'Bressandes Bouchereau',
    'Corton',
    'rouge',
    3
);

INSERT INTO ARTICLE VALUES(
    127,
    TO_DATE('1997', 'yyyy'),
    37,
    6.78,
    55
);

INSERT INTO ARTICLE VALUES(
    128,
    TO_DATE('1998', 'yyyy'),
    75,
    13.22,
    55
);

INSERT INTO VIN VALUES (
    54,
    'Laboure',
    'Macon',
    'rouge',
    3
);

INSERT INTO ARTICLE VALUES(
    123,
    TO_DATE('1982', 'yyyy'),
    75,
    45.98,
    54
);

INSERT INTO ARTICLE VALUES(
    124,
    TO_DATE('1983', 'yyyy'),
    75,
    41.34,
    54
);

INSERT INTO ARTICLE VALUES(
    125,
    TO_DATE('1988', 'yyyy'),
    75,
    31.05,
    54
);

INSERT INTO ARTICLE VALUES(
    126,
    TO_DATE('1988', 'yyyy'),
    37,
    17.53,
    54
);

INSERT INTO VIN VALUES (
    52,
    'Thevenin',
    'Volnay',
    'rouge',
    3
);

INSERT INTO ARTICLE VALUES(
    120,
    TO_DATE('1985', 'yyyy'),
    75,
    12.98,
    52
);

INSERT INTO ARTICLE VALUES(
    121,
    TO_DATE('1985', 'yyyy'),
    37,
    7,
    52
);

INSERT INTO ARTICLE VALUES(
    122,
    TO_DATE('1985', 'yyyy'),
    150,
    23.88,
    52
);

INSERT INTO VIN VALUES (
    53,
    'Domaine Bitouzet Prieur',
    'Volnay',
    'blanc',
    3
);

INSERT INTO VIN VALUES (
    49,
    'Machard Gramont',
    'Pommard',
    'blanc',
    3
);

INSERT INTO ARTICLE VALUES(
    113,
    TO_DATE('1999', 'yyyy'),
    75,
    12.76,
    49
);

INSERT INTO ARTICLE VALUES(
    114,
    TO_DATE('1999', 'yyyy'),
    37,
    6.99,
    49
);

INSERT INTO ARTICLE VALUES(
    115,
    TO_DATE('1999', 'yyyy'),
    150,
    30.04,
    49
);

INSERT INTO ARTICLE VALUES(
    116,
    TO_DATE('1998', 'yyyy'),
    75,
    18.77,
    49
);

INSERT INTO VIN VALUES (
    50,
    'Montille Rugiens',
    'Pommard',
    'blanc',
    3
);

INSERT INTO ARTICLE VALUES(
    117,
    TO_DATE('1990', 'yyyy'),
    75,
    85.40,
    50
);

INSERT INTO VIN VALUES (
    51,
    'Chantin Girardin',
    'Pommard',
    'blanc',
    3
);

INSERT INTO ARTICLE VALUES(
    118,
    TO_DATE('1987', 'yyyy'),
    75,
    74.93,
    51
);

INSERT INTO ARTICLE VALUES(
    119,
    TO_DATE('1988', 'yyyy'),
    75,
    64.08,
    51
);

INSERT INTO VIN VALUES (
    47,
    'Banyuls etoile',
    'Collioure',
    'rouge',
    4
);

INSERT INTO ARTICLE VALUES(
    232,
    TO_DATE('1994', 'yyyy'),
    75,
    12.31,
    47
);

INSERT INTO VIN VALUES (
    48,
    'Les Esperades',
    'Collioure',
    'rose',
    4
);

INSERT INTO ARTICLE VALUES(
    109,
    TO_DATE('1999', 'yyyy'),
    75,
    8.33,
    48
);

INSERT INTO ARTICLE VALUES(
    110,
    TO_DATE('1999', 'yyyy'),
    37,
    4.15,
    48
);

INSERT INTO ARTICLE VALUES(
    111,
    TO_DATE('1999', 'yyyy'),
    150,
    17.88,
    48
);

INSERT INTO ARTICLE VALUES(
    112,
    TO_DATE('1999', 'yyyy'),
    500,
    96.18,
    48
);

INSERT INTO VIN VALUES (
    45,
    'Chateau Mirausse',
    'Minervois',
    'rouge',
    4
);

INSERT INTO ARTICLE VALUES(
    105,
    TO_DATE('1996', 'yyyy'),
    75,
    8.75,
    45
);

INSERT INTO ARTICLE VALUES(
    106,
    TO_DATE('1997', 'yyyy'),
    75,
    6.59,
    45
);

INSERT INTO VIN VALUES (
    46,
    'Chateau La Reze',
    'Minervois',
    'blanc',
    4
);

INSERT INTO ARTICLE VALUES(
    107,
    TO_DATE('1986', 'yyyy'),
    150,
    19.66,
    46
);

INSERT INTO ARTICLE VALUES(
    108,
    TO_DATE('1986', 'yyyy'),
    75,
    10.51,
    46
);

INSERT INTO VIN VALUES (
    42,
    'Galant',
    'Cerons',
    'rouge',
    5
);

INSERT INTO ARTICLE VALUES(
    100,
    TO_DATE('1935', 'yyyy'),
    75,
    189.44,
    42
);

INSERT INTO ARTICLE VALUES(
    101,
    TO_DATE('1926', 'yyyy'),
    75,
    202.38,
    42
);

INSERT INTO VIN VALUES (
    43,
    'Chateau Beaulieu',
    'Cerons',
    'rouge',
    5
);

INSERT INTO ARTICLE VALUES(
    102,
    TO_DATE('1912', 'yyyy'),
    75,
    311.67,
    43
);

INSERT INTO VIN VALUES (
    44,
    'Chateau du Caillou',
    'Cerons',
    'rouge',
    5
);

INSERT INTO ARTICLE VALUES(
    103,
    TO_DATE('1996', 'yyyy'),
    75,
    7.55,
    44
);

INSERT INTO ARTICLE VALUES(
    104,
    TO_DATE('1996', 'yyyy'),
    37,
    4.09,
    44
);

INSERT INTO VIN VALUES (
    40,
    'La Foret Hilaire',
    'Entre-deux-Mers',
    'rouge',
    5
);

INSERT INTO ARTICLE VALUES(
    97,
    TO_DATE('1975', 'yyyy'),
    75,
    3.19,
    40
);

INSERT INTO ARTICLE VALUES(
    98,
    TO_DATE('1975', 'yyyy'),
    150,
    7.11,
    40
);

INSERT INTO VIN VALUES (
    41,
    'Haut-Benauge',
    'Entre-deux-Mers',
    'rouge',
    5
);

INSERT INTO ARTICLE VALUES(
    99,
    TO_DATE('1990', 'yyyy'),
    75,
    1.06,
    41
);

INSERT INTO VIN VALUES (
    37,
    'Chateau Loubaix',
    'Graves',
    'rouge',
    5
);

INSERT INTO ARTICLE VALUES(
    90,
    TO_DATE('1996', 'yyyy'),
    75,
    10.89,
    37
);

INSERT INTO ARTICLE VALUES(
    91,
    TO_DATE('1997', 'yyyy'),
    75,
    9.22,
    37
);

INSERT INTO ARTICLE VALUES(
    92,
    TO_DATE('1998', 'yyyy'),
    75,
    7.33,
    37
);

INSERT INTO ARTICLE VALUES(
    93,
    TO_DATE('1999', 'yyyy'),
    75,
    6.11,
    37
);

INSERT INTO VIN VALUES (
    38,
    'Paulin',
    'Graves',
    'rouge',
    5
);

INSERT INTO ARTICLE VALUES(
    94,
    TO_DATE('1987', 'yyyy'),
    75,
    56.33,
    38
);

INSERT INTO ARTICLE VALUES(
    95,
    TO_DATE('1987', 'yyyy'),
    150,
    186.09,
    38
);

INSERT INTO VIN VALUES (
    39,
    'Bernard Lehoux',
    'Graves',
    'rouge',
    5
);

INSERT INTO ARTICLE VALUES(
    96,
    TO_DATE('2000', 'yyyy'),
    75,
    7.33,
    37
);

INSERT INTO VIN VALUES (
    36,
    'Domaine des Graveaux',
    'Graves Superieures',
    'rouge',
    5
);

INSERT INTO ARTICLE VALUES(
    89,
    TO_DATE('1991', 'yyyy'),
    75,
    18.31,
    36
);

INSERT INTO VIN VALUES (
    35,
    'Chateau Poncelet du Lac',
    'Graves Superieures',
    'rouge',
    5
);

INSERT INTO ARTICLE VALUES(
    87,
    TO_DATE('1999', 'yyyy'),
    75,
    5.23,
    35
);

INSERT INTO ARTICLE VALUES(
    88,
    TO_DATE('2000', 'yyyy'),
    37,
    2.99,
    35
);

INSERT INTO VIN VALUES (
    34,
    'Chateau Meihlan',
    'Haut-Medoc',
    'rouge',
    5
);

INSERT INTO ARTICLE VALUES(
    84,
    TO_DATE('1995', 'yyyy'),
    75,
    8.82,
    34
);

INSERT INTO ARTICLE VALUES(
    85,
    TO_DATE('1996', 'yyyy'),
    75,
    7.21,
    34
);

INSERT INTO ARTICLE VALUES(
    86,
    TO_DATE('1996', 'yyyy'),
    37,
    3.77,
    34
);

INSERT INTO VIN VALUES (
    33,
    'Comte Pichon Longueville',
    'Lalande',
    'rouge',
    5
);

INSERT INTO ARTICLE VALUES(
    82,
    TO_DATE('1998', 'yyyy'),
    75,
    13.21,
    33
);

INSERT INTO ARTICLE VALUES(
    83,
    TO_DATE('1999', 'yyyy'),
    75,
    10.55,
    33
);

INSERT INTO VIN VALUES (
    32,
    'Fonraud',
    'Listrac-Medoc',
    'rouge',
    5
);

INSERT INTO VIN VALUES (
    31,
    'Chateau Margaux',
    'Margaux',
    'rouge',
    5
);

INSERT INTO ARTICLE VALUES(
    75,
    TO_DATE('1936', 'yyyy'),
    75,
    1089.51,
    31
);

INSERT INTO ARTICLE VALUES(
    76,
    TO_DATE('1899', 'yyyy'),
    75,
    7245,
    31
);

INSERT INTO ARTICLE VALUES(
    77,
    TO_DATE('1900', 'yyyy'),
    75,
    4746.46,
    31
);

INSERT INTO ARTICLE VALUES(
    78,
    TO_DATE('1929', 'yyyy'),
    75,
    1757.07,
    31
);

INSERT INTO ARTICLE VALUES(
    79,
    TO_DATE('1930', 'yyyy'),
    75,
    499.71,
    31
);

INSERT INTO ARTICLE VALUES(
    80,
    TO_DATE('1988', 'yyyy'),
    75,
    198.18,
    31
);

INSERT INTO ARTICLE VALUES(
    81,
    TO_DATE('1988', 'yyyy'),
    150,
    583.35,
    31
);

INSERT INTO VIN VALUES (
    29,
    'Chateau des Bois',
    'Medoc',
    'rouge',
    5
);

INSERT INTO ARTICLE VALUES(
    70,
    TO_DATE('1996', 'yyyy'),
    75,
    4.94,
    29
);

INSERT INTO ARTICLE VALUES(
    71,
    TO_DATE('1997', 'yyyy'),
    75,
    6.49,
    29
);

INSERT INTO VIN VALUES (
    30,
    'Domaine du Beaujour',
    'Medoc',
    'rouge',
    5
);

INSERT INTO ARTICLE VALUES(
    72,
    TO_DATE('1993', 'yyyy'),
    75,
    8.02,
    30
);

INSERT INTO ARTICLE VALUES(
    73,
    TO_DATE('1993', 'yyyy'),
    37,
    5.03,
    30
);

INSERT INTO ARTICLE VALUES(
    74,
    TO_DATE('1993', 'yyyy'),
    150,
    12.52,
    30
);

INSERT INTO VIN VALUES (
    28,
    'Latour',
    'Pomerol',
    'rouge',
    5
);

INSERT INTO ARTICLE VALUES(
    65,
    TO_DATE('1923', 'yyyy'),
    75,
    464.25,
    28
);

INSERT INTO ARTICLE VALUES(
    66,
    TO_DATE('1952', 'yyyy'),
    75,
    251,
    28
);

INSERT INTO ARTICLE VALUES(
    67,
    TO_DATE('1970', 'yyyy'),
    75,
    358.29,
    28
);

INSERT INTO ARTICLE VALUES(
    68,
    TO_DATE('1985', 'yyyy'),
    75,
    82.02,
    28
);

INSERT INTO ARTICLE VALUES(
    69,
    TO_DATE('1998', 'yyyy'),
    75,
    61.06,
    28
);

INSERT INTO VIN VALUES (
    26,
    'Carillon Angelus',
    'Saint Estephe',
    'rouge',
    5
);

INSERT INTO ARTICLE VALUES(
    60,
    TO_DATE('1997', 'yyyy'),
    75,
    7.43,
    26
);

INSERT INTO ARTICLE VALUES(
    61,
    TO_DATE('1997', 'yyyy'),
    37,
    4.21,
    26
);

INSERT INTO ARTICLE VALUES(
    62,
    TO_DATE('1998', 'yyyy'),
    75,
    6.22,
    26
);

INSERT INTO ARTICLE VALUES(
    63,
    TO_DATE('1998', 'yyyy'),
    37,
    3.65,
    26
);

INSERT INTO VIN VALUES (
    27,
    'Croix Mazerat',
    'Saint Estephe',
    'rouge',
    5
);

INSERT INTO ARTICLE VALUES(
    64,
    TO_DATE('1986', 'yyyy'),
    75,
    63.90,
    27
);

INSERT INTO VIN VALUES (
    18,
    'Clos Oratoire',
    'Saint-Emilion',
    'rouge',
    5
);

INSERT INTO ARTICLE VALUES(
    39,
    TO_DATE('1995', 'yyyy'),
    75,
    36.21,
    18
);

INSERT INTO ARTICLE VALUES(
    40,
    TO_DATE('1995', 'yyyy'),
    150,
    59.55,
    18
);

INSERT INTO ARTICLE VALUES(
    41,
    TO_DATE('1998', 'yyyy'),
    75,
    15.81,
    18
);

INSERT INTO VIN VALUES (
    19,
    'Angelus',
    'Saint-Emilion',
    'rouge',
    5
);

INSERT INTO ARTICLE VALUES(
    42,
    TO_DATE('1998', 'yyyy'),
    75,
    23.07,
    19
);

INSERT INTO ARTICLE VALUES(
    43,
    TO_DATE('1998', 'yyyy'),
    37,
    16.18,
    19
);

INSERT INTO VIN VALUES (
    20,
    'Connetable Talbot',
    'Saint-Emilion',
    'rouge',
    5
);

INSERT INTO ARTICLE VALUES(
    44,
    TO_DATE('1993', 'yyyy'),
    75,
    56.94,
    20
);

INSERT INTO ARTICLE VALUES(
    45,
    TO_DATE('1993', 'yyyy'),
    150,
    121.82,
    20
);

INSERT INTO ARTICLE VALUES(
    46,
    TO_DATE('1991', 'yyyy'),
    75,
    81.24,
    20
);

INSERT INTO ARTICLE VALUES(
    47,
    TO_DATE('1992', 'yyyy'),
    75,
    76.07,
    20
);

INSERT INTO ARTICLE VALUES(
    48,
    TO_DATE('1995', 'yyyy'),
    75,
    19.22,
    20
);

INSERT INTO VIN VALUES (
    21,
    'Cap Mourlin',
    'Saint-Emilion',
    'rouge',
    5
);

INSERT INTO ARTICLE VALUES(
    49,
    TO_DATE('2000', 'yyyy'),
    75,
    4.87,
    21
);

INSERT INTO VIN VALUES (
    22,
    'Pavie Decesse',
    'Saint-Emilion',
    'rouge',
    5
);

INSERT INTO ARTICLE VALUES(
    50,
    TO_DATE('1993', 'yyyy'),
    75,
    18.82,
    22
);

INSERT INTO ARTICLE VALUES(
    51,
    TO_DATE('1975', 'yyyy'),
    75,
    221.05,
    22
);

INSERT INTO ARTICLE VALUES(
    52,
    TO_DATE('1975', 'yyyy'),
    150,
    577.31,
    22
);

INSERT INTO VIN VALUES (
    23,
    'Chemin Mulets',
    'Chateauneuf du Pape',
    'rouge',
    6
);

INSERT INTO ARTICLE VALUES(
    54,
    TO_DATE('1998', 'yyyy'),
    75,
    4.69,
    23
);

INSERT INTO ARTICLE VALUES(
    55,
    TO_DATE('1998', 'yyyy'),
    37,
    2.98,
    23
);

INSERT INTO ARTICLE VALUES(
    56,
    TO_DATE('1997', 'yyyy'),
    75,
    7.19,
    23
);

INSERT INTO VIN VALUES (
    24,
    'Vallee Montredon',
    'Chateauneuf du Pape',
    'blanc',
    6
);

INSERT INTO ARTICLE VALUES(
    57,
    TO_DATE('1999', 'yyyy'),
    75,
    3.97,
    24
);

INSERT INTO VIN VALUES (
    25,
    'JB Duquesne',
    'Clairette de Die',
    'blanc',
    6
);

INSERT INTO ARTICLE VALUES(
    58,
    TO_DATE('1999', 'yyyy'),
    75,
    4.2,
    25
);

INSERT INTO ARTICLE VALUES(
    59,
    TO_DATE('2000', 'yyyy'),
    75,
    3.54,
    25
);

INSERT INTO VIN VALUES (
    16,
    'Les Nobles Rives',
    'Cornas',
    'rouge',
    6
);

INSERT INTO ARTICLE VALUES(
    35,
    TO_DATE('1997', 'yyyy'),
    75,
    4.37,
    16
);

INSERT INTO ARTICLE VALUES(
    36,
    TO_DATE('1998', 'yyyy'),
    75,
    3.21,
    16
);

INSERT INTO VIN VALUES (
    17,
    'Chante Perdrix',
    'Cornas',
    'rouge',
    6
);

INSERT INTO ARTICLE VALUES(
    37,
    TO_DATE('1993', 'yyyy'),
    75,
    16.87,
    17
);

INSERT INTO ARTICLE VALUES(
    38,
    TO_DATE('1992', 'yyyy'),
    75,
    26.12,
    17
);

INSERT INTO VIN VALUES (
    14,
    'Viognier',
    'Coteau ardechois',
    'rouge',
    6
);

INSERT INTO ARTICLE VALUES(
    31,
    TO_DATE('2001', 'yyyy'),
    500,
    25.66,
    14
);

INSERT INTO ARTICLE VALUES(
    32,
    TO_DATE('1999', 'yyyy'),
    75,
    6.25,
    14
);

INSERT INTO ARTICLE VALUES(
    33,
    TO_DATE('1999', 'yyyy'),
    37,
    3.87,
    14
);

INSERT INTO VIN VALUES (
    15,
    'Domaine de Ruoms',
    'Coteau ardechois',
    'rose',
    6
);

INSERT INTO ARTICLE VALUES(
    34,
    TO_DATE('2000', 'yyyy'),
    75,
    1.21,
    15
);

INSERT INTO VIN VALUES (
    13,
    'Domaine Petit Jean',
    'Cotes du vivarais',
    'rouge',
    6
);

INSERT INTO ARTICLE VALUES(
    29,
    TO_DATE('2001', 'yyyy'),
    500,
    20,
    13
);

INSERT INTO ARTICLE VALUES(
    30,
    TO_DATE('2001', 'yyyy'),
    75,
    4.10,
    13
);

INSERT INTO VIN VALUES (
    10,
    'Mayson Chapoutier',
    'Crozes Hermitage',
    'rouge',
    6
);

INSERT INTO ARTICLE VALUES(
    22,
    TO_DATE('1996', 'yyyy'),
    75,
    4.21,
    10
);

INSERT INTO ARTICLE VALUES(
    23,
    TO_DATE('1997', 'yyyy'),
    75,
    3.98,
    10
);

INSERT INTO ARTICLE VALUES(
    24,
    TO_DATE('1998', 'yyyy'),
    75,
    3.11,
    10
);

INSERT INTO VIN VALUES (
    11,
    'Thalabert',
    'Crozes Hermitage',
    'rouge',
    6
);

INSERT INTO ARTICLE VALUES(
    25,
    TO_DATE('1999', 'yyyy'),
    75,
    8.12,
    11
);

INSERT INTO ARTICLE VALUES(
    26,
    TO_DATE('1999', 'yyyy'),
    37,
    4.49,
    11
);

INSERT INTO VIN VALUES (
    12,
    'Colomb Blanc',
    'Crozes Hermitage',
    'blanc',
    6
);

INSERT INTO ARTICLE VALUES(
    27,
    TO_DATE('2000', 'yyyy'),
    300,
    23.10,
    12
);

INSERT INTO ARTICLE VALUES(
    28,
    TO_DATE('2001', 'yyyy'),
    300,
    22.03,
    12
);

INSERT INTO VIN VALUES (
    8,
    'Chateau Gigognan',
    'Gigondas',
    'rouge',
    6
);

INSERT INTO ARTICLE VALUES(
    16,
    TO_DATE('1998', 'yyyy'),
    75,
    7.1,
    8
);

INSERT INTO ARTICLE VALUES(
    17,
    TO_DATE('1999', 'yyyy'),
    75,
    6.87,
    8
);

INSERT INTO ARTICLE VALUES(
    18,
    TO_DATE('1999', 'yyyy'),
    150,
    14.91,
    8
);

INSERT INTO VIN VALUES (
    9,
    'Domaine de la Machotte',
    'Gigondas',
    'rouge',
    6
);

INSERT INTO ARTICLE VALUES(
    19,
    TO_DATE('1992', 'yyyy'),
    150,
    68.43,
    9
);

INSERT INTO ARTICLE VALUES(
    20,
    TO_DATE('1992', 'yyyy'),
    75,
    39.10,
    9
);

INSERT INTO ARTICLE VALUES(
    21,
    TO_DATE('1998', 'yyyy'),
    75,
    9.54,
    9
);

INSERT INTO VIN VALUES (
    7,
    'Domaine Paulin',
    'Haut-Comta',
    'rose',
    6
);

INSERT INTO VIN VALUES (
    4,
    'Pompee',
    'Saint-Joseph',
    'rouge',
    6
);

INSERT INTO ARTICLE VALUES(
    15,
    TO_DATE('1994', 'yyyy'),
    75,
    6.75,
    4
);

INSERT INTO ARTICLE VALUES(
    6,
    TO_DATE('1999', 'yyyy'),
    75,
    3.24,
    4
);

INSERT INTO ARTICLE VALUES(
    7,
    TO_DATE('1999', 'yyyy'),
    150,
    6.31,
    4
);

INSERT INTO ARTICLE VALUES(
    8,
    TO_DATE('1999', 'yyyy'),
    37,
    2.01,
    4
);

INSERT INTO ARTICLE VALUES(
    9,
    TO_DATE('1997', 'yyyy'),
    75,
    7.12,
    4
);

INSERT INTO VIN VALUES (
    5,
    'Clos Saint-Joseph',
    'Saint-Joseph',
    'rouge',
    6
);

INSERT INTO ARTICLE VALUES(
    13,
    TO_DATE('2000', 'yyyy'),
    37,
    1.12,
    5
);

INSERT INTO ARTICLE VALUES(
    14,
    TO_DATE('2001', 'yyyy'),
    75,
    1.99,
    5
);

INSERT INTO ARTICLE VALUES(
    10,
    TO_DATE('1999', 'yyyy'),
    37,
    1.87,
    5
);

INSERT INTO VIN VALUES (
    6,
    'Arras Vieux',
    'Saint-Joseph',
    'rouge',
    6
);

INSERT INTO ARTICLE VALUES(
    11,
    TO_DATE('1995', 'yyyy'),
    75,
    13.46,
    6
);

INSERT INTO ARTICLE VALUES(
    12,
    TO_DATE('1992', 'yyyy'),
    75,
    40.88,
    6
);

INSERT INTO VIN VALUES (
    3,
    'Maison Bouchard Pere et Fils',
    'Tavel',
    'rouge',
    6
);

INSERT INTO ARTICLE VALUES(
    4,
    TO_DATE('1999', 'yyyy'),
    75,
    1.32,
    3
);

INSERT INTO ARTICLE VALUES(
    5,
    TO_DATE('1998', 'yyyy'),
    150,
    3.46,
    3
);

INSERT INTO VIN VALUES (
    1,
    'Vacqueyras Pascal',
    'Vacqueyras',
    'rouge',
    6
);

INSERT INTO ARTICLE VALUES(
    1,
    TO_DATE('1995', 'yyyy'),
    75,
    7.55,
    1
);

INSERT INTO VIN VALUES (
    2,
    'Vacqueyras Vielles Vignes',
    'Vacqueyras',
    'rouge',
    6
);

INSERT INTO ARTICLE VALUES(
    2,
    TO_DATE('2000', 'yyyy'),
    75,
    37.49,
    2
);

INSERT INTO ARTICLE VALUES(
    3,
    TO_DATE('1998', 'yyyy'),
    75,
    43.01,
    2
);

INSERT INTO VIN VALUES (
    77,
    'Vacher Georges Edouard',
    'Alsace Chasselas',
    'blanc',
    7
);

INSERT INTO ARTICLE VALUES(
    183,
    TO_DATE('1998', 'yyyy'),
    75,
    8.42,
    77
);

INSERT INTO ARTICLE VALUES(
    184,
    TO_DATE('1999', 'yyyy'),
    75,
    7.66,
    77
);

INSERT INTO ARTICLE VALUES(
    185,
    TO_DATE('1999', 'yyyy'),
    37,
    3.8,
    77
);

INSERT INTO VIN VALUES (
    78,
    'Chateau de Colex',
    'Alsace Chasselas',
    'blanc',
    7
);

INSERT INTO ARTICLE VALUES(
    186,
    TO_DATE('1992', 'yyyy'),
    37,
    10.09,
    78
);

INSERT INTO ARTICLE VALUES(
    187,
    TO_DATE('1992', 'yyyy'),
    75,
    19.62,
    78
);

INSERT INTO ARTICLE VALUES(
    188,
    TO_DATE('1995', 'yyyy'),
    75,
    11.29,
    78
);

INSERT INTO ARTICLE VALUES(
    189,
    TO_DATE('1999', 'yyyy'),
    75,
    8.28,
    78
);

INSERT INTO VIN VALUES (
    79,
    'Eiguishem',
    'Alsace Pinot',
    'blanc',
    7
);

INSERT INTO ARTICLE VALUES(
    190,
    TO_DATE('1999', 'yyyy'),
    75,
    3.76,
    79
);

INSERT INTO ARTICLE VALUES(
    191,
    TO_DATE('2000', 'yyyy'),
    75,
    3.01,
    79
);

INSERT INTO ARTICLE VALUES(
    192,
    TO_DATE('1998', 'yyyy'),
    75,
    3.99,
    79
);

INSERT INTO ARTICLE VALUES(
    193,
    TO_DATE('1998', 'yyyy'),
    37,
    2.05,
    79
);

INSERT INTO VIN VALUES (
    80,
    'Michel Dietrich',
    'Alsace Pinot',
    'blanc',
    7
);

INSERT INTO ARTICLE VALUES(
    194,
    TO_DATE('1998', 'yyyy'),
    75,
    4.51,
    80
);

INSERT INTO ARTICLE VALUES(
    195,
    TO_DATE('1998', 'yyyy'),
    37,
    2.84,
    80
);

INSERT INTO ARTICLE VALUES(
    196,
    TO_DATE('1998', 'yyyy'),
    150,
    9.05,
    80
);

INSERT INTO VIN VALUES (
    81,
    'Herren Turckh Zind Humbrecht',
    'Alsace Tokay Pinot gris',
    'blanc',
    7
);

INSERT INTO ARTICLE VALUES(
    197,
    TO_DATE('1999', 'yyyy'),
    150,
    121.09,
    81
);

INSERT INTO ARTICLE VALUES(
    198,
    TO_DATE('1999', 'yyyy'),
    75,
    65.81,
    81
);

INSERT INTO VIN VALUES (
    82,
    'Wolfberger',
    'Alsace Riesling',
    'blanc',
    7
);

INSERT INTO ARTICLE VALUES(
    199,
    TO_DATE('1995', 'yyyy'),
    75,
    31.01,
    82
);

INSERT INTO ARTICLE VALUES(
    200,
    TO_DATE('1996', 'yyyy'),
    75,
    22.55,
    82
);

INSERT INTO ARTICLE VALUES(
    201,
    TO_DATE('1997', 'yyyy'),
    75,
    19.71,
    82
);

INSERT INTO VIN VALUES (
    83,
    'Clos Windsbuhl',
    'Alsace Riesling',
    'blanc',
    7
);

INSERT INTO ARTICLE VALUES(
    202,
    TO_DATE('2000', 'yyyy'),
    75,
    6.19,
    83
);

INSERT INTO VIN VALUES (
    84,
    'Michel Dietrich',
    'Alsace Riesling',
    'blanc',
    7
);

INSERT INTO ARTICLE VALUES(
    203,
    TO_DATE('1996', 'yyyy'),
    75,
    6.43,
    84
);

INSERT INTO ARTICLE VALUES(
    204,
    TO_DATE('1996', 'yyyy'),
    37,
    3.51,
    84
);

INSERT INTO ARTICLE VALUES(
    205,
    TO_DATE('1999', 'yyyy'),
    75,
    4.95,
    84
);

INSERT INTO ARTICLE VALUES(
    206,
    TO_DATE('1999', 'yyyy'),
    37,
    2.74,
    84
);

INSERT INTO VIN VALUES (
    85,
    'Wolfberger',
    'Alsace Sylvaner',
    'blanc',
    7
);

INSERT INTO ARTICLE VALUES(
    207,
    TO_DATE('1999', 'yyyy'),
    37,
    1.92,
    85
);

INSERT INTO ARTICLE VALUES(
    208,
    TO_DATE('1999', 'yyyy'),
    75,
    2.76,
    85
);

INSERT INTO ARTICLE VALUES(
    230,
    TO_DATE('1986', 'yyyy'),
    75,
    11.44,
    85
);

INSERT INTO VIN VALUES (
    86,
    'Bergweingarten',
    'Alsace Sylvaner',
    'blanc',
    7
);

INSERT INTO ARTICLE VALUES(
    209,
    TO_DATE('1990', 'yyyy'),
    75,
    7.21,
    86
);

INSERT INTO VIN VALUES (
    87,
    'Domaine Chatelain',
    'Bandol',
    'rose',
    8
);

INSERT INTO ARTICLE VALUES(
    210,
    TO_DATE('1999', 'yyyy'),
    75,
    2.92,
    87
);

INSERT INTO ARTICLE VALUES(
    211,
    TO_DATE('2000', 'yyyy'),
    75,
    2.76,
    87
);

INSERT INTO ARTICLE VALUES(
    212,
    TO_DATE('2000', 'yyyy'),
    37,
    1.44,
    87
);

INSERT INTO ARTICLE VALUES(
    213,
    TO_DATE('2000', 'yyyy'),
    300,
    12.87,
    87
);

INSERT INTO VIN VALUES (
    88,
    'Colline Despres',
    'Bandol',
    'rose',
    8
);

INSERT INTO ARTICLE VALUES(
    214,
    TO_DATE('1999', 'yyyy'),
    300,
    14.01,
    88
);

INSERT INTO ARTICLE VALUES(
    215,
    TO_DATE('1999', 'yyyy'),
    75,
    4.61,
    88
);

INSERT INTO VIN VALUES (
    89,
    'Colline Despres',
    'Bandol',
    'rouge',
    8
);

INSERT INTO ARTICLE VALUES(
    216,
    TO_DATE('1999', 'yyyy'),
    300,
    12.81,
    89
);

INSERT INTO ARTICLE VALUES(
    217,
    TO_DATE('1999', 'yyyy'),
    75,
    3.82,
    89
);

INSERT INTO VIN VALUES (
    90,
    'Domaine des Marines',
    'Coteaux Aix',
    'rose',
    8
);

INSERT INTO ARTICLE VALUES(
    218,
    TO_DATE('1999', 'yyyy'),
    75,
    2.75,
    90
);

INSERT INTO ARTICLE VALUES(
    219,
    TO_DATE('1999', 'yyyy'),
    75,
    2.21,
    90
);

INSERT INTO ARTICLE VALUES(
    220,
    TO_DATE('1999', 'yyyy'),
    37,
    1.24,
    90
);

INSERT INTO ARTICLE VALUES(
    221,
    TO_DATE('2001', 'yyyy'),
    300,
    14.97,
    90
);

INSERT INTO VIN VALUES (
    91,
    'Chateau Magnanerie',
    'Coteaux Aix',
    'rose',
    8
);

INSERT INTO ARTICLE VALUES(
    222,
    TO_DATE('1999', 'yyyy'),
    75,
    2.75,
    91
);

INSERT INTO ARTICLE VALUES(
    223,
    TO_DATE('1999', 'yyyy'),
    75,
    2.21,
    91
);

INSERT INTO ARTICLE VALUES(
    224,
    TO_DATE('1999', 'yyyy'),
    37,
    1.24,
    91
);

INSERT INTO ARTICLE VALUES(
    225,
    TO_DATE('2001', 'yyyy'),
    300,
    14.97,
    91
);

INSERT INTO VIN VALUES (
    92,
    'Marc Duchesnais',
    'Coteaux Varois',
    'rouge',
    8
);

INSERT INTO ARTICLE VALUES(
    226,
    TO_DATE('1999', 'yyyy'),
    75,
    3.76,
    92
);

INSERT INTO VIN VALUES (
    93,
    'Les Fleurs',
    'Coteaux Varois',
    'blanc',
    8
);

INSERT INTO ARTICLE VALUES(
    227,
    TO_DATE('2001', 'yyyy'),
    75,
    7.21,
    93
);

INSERT INTO ARTICLE VALUES(
    228,
    TO_DATE('2000', 'yyyy'),
    75,
    8.05,
    93
);

INSERT INTO ARTICLE VALUES(
    229,
    TO_DATE('1987', 'yyyy'),
    75,
    14.32,
    93
);

INSERT INTO CLIENT VALUES (
    1,
    'Bouter',
    34,
    6
);

INSERT INTO CLIENT VALUES (
    2,
    'Raimus',
    64,
    6
);

INSERT INTO CLIENT VALUES (
    3,
    'Carrima',
    30,
    5
);

INSERT INTO CLIENT VALUES (
    4,
    'Loupes',
    25,
    3
);

INSERT INTO CLIENT VALUES (
    5,
    'Arnaud',
    29,
    6
);

INSERT INTO CLIENT VALUES (
    6,
    'Jerame',
    72,
    7
);

INSERT INTO CLIENT VALUES (
    7,
    'Moulin',
    21,
    7
);

INSERT INTO CLIENT VALUES (
    8,
    'Moulin',
    41,
    7
);

INSERT INTO CLIENT VALUES (
    9,
    'Pesta',
    81,
    8
);

INSERT INTO CLIENT VALUES (
    10,
    'Carrima',
    28,
    1
);

INSERT INTO CLIENT VALUES (
    11,
    'Baretau',
    31,
    1
);

INSERT INTO CLIENT VALUES (
    12,
    'Dietrich',
    62,
    2
);

INSERT INTO CLIENT VALUES (
    13,
    'Chopin',
    18,
    4
);

INSERT INTO CLIENT VALUES (
    14,
    'Goulada',
    91,
    4
);

INSERT INTO CLIENT VALUES (
    15,
    'Raimond',
    44,
    6
);

INSERT INTO CLIENT VALUES (
    16,
    'Palage',
    31,
    3
);

INSERT INTO CLIENT VALUES (
    17,
    'Malina',
    42,
    8
);

INSERT INTO CLIENT VALUES (
    18,
    'Carboni',
    38,
    8
);

INSERT INTO CLIENT VALUES (
    19,
    'Kim',
    41,
    1
);

INSERT INTO CLIENT VALUES (
    20,
    'Damin',
    27,
    1
);

INSERT INTO CLIENT VALUES (
    21,
    'Respard',
    64,
    3
);

INSERT INTO CLIENT VALUES (
    22,
    'Mula',
    53,
    1
);

INSERT INTO CLIENT VALUES (
    23,
    'Martin',
    48,
    2
);

INSERT INTO CLIENT VALUES (
    24,
    'Carefre',
    23,
    8
);

INSERT INTO CLIENT VALUES (
    25,
    'Quentinet',
    64,
    4
);

INSERT INTO CLIENT VALUES (
    28,
    'Maquis',
    70,
    7
);

INSERT INTO CLIENT VALUES (
    29,
    'Rougeot',
    76,
    7
);

INSERT INTO CLIENT VALUES (
    30,
    'Mougeot',
    52,
    5
);

INSERT INTO ACHAT VALUES (
    1,
    23,
    3,
    TO_DATE('02/10/2001', 'DD/MM/YYYY'),
    2,
    7
);

INSERT INTO ACHAT VALUES (
    2,
    52,
    2,
    TO_DATE('07/10/2001', 'DD/MM/YYYY'),
    1,
    7
);

INSERT INTO ACHAT VALUES (
    3,
    107,
    2,
    TO_DATE('12/10/2001', 'DD/MM/YYYY'),
    8,
    7
);

INSERT INTO ACHAT VALUES (
    4,
    212,
    5,
    TO_DATE('12/10/2001', 'DD/MM/YYYY'),
    1,
    7
);

INSERT INTO ACHAT VALUES (
    5,
    94,
    19,
    TO_DATE('17/11/2001', 'DD/MM/YYYY'),
    3,
    7
);