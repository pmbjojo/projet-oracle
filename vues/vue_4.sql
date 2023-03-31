-- Créer une vue appelée VinQuantité qui pour chaque vin (idVin, nom, appellation), donne la quantité achetée à ce jour.

CREATE OR REPLACE VIEW VINQUANTITE AS
    SELECT
        IDVIN,
        NOM,
        APPELLATION,
        SUM(QUANTITE) AS QUANTITE
    FROM
        VIN,
        ACHAT,
        ARTICLE
    WHERE
        VIN.IDVIN = ARTICLE.VIN
        AND ACHAT.ARTICLE = ARTICLE.IDARTICLE
    GROUP BY
        VIN.IDVIN,
        NOM,
        APPELLATION;

SELECT
    *
FROM
    VINQUANTITE;

-- En déduire le vin le plus acheté et le moins acheté ?

SELECT
    NOM AS VIN_LE_PLUS_ACHETE
FROM
    VINQUANTITE
WHERE
    QUANTITE = (
        SELECT
            MAX(QUANTITE)
        FROM
            VINQUANTITE
    );

SELECT
    NOM AS VIN_LE_MOINS_ACHETE
FROM
    VINQUANTITE
WHERE
    QUANTITE = (
        SELECT
            MIN(QUANTITE)
        FROM
            VINQUANTITE
    );