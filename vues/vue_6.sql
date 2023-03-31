-- Créer une vue qui pour chaque article affiche la quantité totale achetée à ce jour (tout client confondu).

CREATE OR REPLACE VIEW QUANTITE_TOTALE_ACHETEE AS
    SELECT
        VIN.IDVIN,
        VIN.NOM,
        SUM(ACHAT.QUANTITE) AS QUANTITE_TOTALE_ACHETEE
    FROM
        ARTICLE,
        ACHAT,
        VIN
    WHERE
        ARTICLE.IDARTICLE = ACHAT.ARTICLE
        AND ARTICLE.VIN = VIN.IDVIN
    GROUP BY
        ARTICLE.IDARTICLE,
        VIN.IDVIN,
        VIN.NOM;

SELECT * FROM QUANTITE_TOTALE_ACHETEE;
