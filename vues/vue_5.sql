-- Créer une vue qui pour chaque client affiche la quantité totale d’articles achetée à ce jour (tout article confondu).

CREATE OR REPLACE VIEW QUANTITE_TOTALE AS
    SELECT
        C.IDCLIENT,
        C.NOM,
        SUM(A.QUANTITE*AR.CONTENANCE) AS QUANTITE_TOTALE
    FROM
        CLIENT C,
        ARTICLE AR,
        ACHAT A
    WHERE
        C.IDCLIENT = A.CLIENT
        AND A.ARTICLE = AR.IDARTICLE
    GROUP BY
        C.IDCLIENT,
        C.NOM;

SELECT * FROM QUANTITE_TOTALE;

-- Créer une seconde vue qui affiche la quantité totale d’articles achetée par client et pour chaque article.

CREATE OR REPLACE VIEW QUANTITE_PAR_ARTICLE AS
    SELECT
        CLIENT.IDCLIENT,
        CLIENT.NOM,
        ARTICLE.IDARTICLE,
        VIN.NOM AS NOMVIN,
        SUM(ACHAT.QUANTITE*ARTICLE.CONTENANCE) AS QUANTITE_TOTALE
    FROM
        CLIENT,
        ARTICLE,
        ACHAT,
        VIN
    WHERE
        ARTICLE.VIN = VIN.IDVIN
        AND CLIENT.IDCLIENT = ACHAT.CLIENT
        AND ACHAT.ARTICLE = ARTICLE.IDARTICLE
    GROUP BY
        CLIENT.IDCLIENT,
        CLIENT.NOM,
        ARTICLE.IDARTICLE,
        VIN.NOM;

select * from QUANTITE_PAR_ARTICLE;