-- A partir des deux vues précédentes, en déduire les requêtes suivantes :

-- Nom, âge et région des clients qui achètent le plus de vin (en quantité) ?

SELECT
    CLIENT.NOM,
    CLIENT.AGE,
    REGION.NOM AS REGION
FROM
    CLIENT,
    REGION,
    QUANTITE_TOTALE
WHERE
    CLIENT.HABITE = REGION.IDREGION
    AND CLIENT.IDCLIENT = QUANTITE_TOTALE.IDCLIENT
ORDER BY
    QUANTITE_TOTALE DESC;

-- Nom, âge et région des clients qui dépensent le plus dans l’achat des vins ?

SELECT
    CLIENT.NOM,
    CLIENT.AGE,
    REGION.NOM AS REGION
FROM
    CLIENT,
    ARTICLE,
    REGION,
    QUANTITE_PAR_ARTICLE
WHERE
    CLIENT.HABITE = REGION.IDREGION
    AND QUANTITE_PAR_ARTICLE.IDARTICLE = ARTICLE.IDARTICLE
    AND CLIENT.IDCLIENT = QUANTITE_PAR_ARTICLE.IDCLIENT
ORDER BY
    QUANTITE_TOTALE*ARTICLE.PRIXHT DESC;

-- Quelle est la région qui achète le plus de vin en quantité ?

SELECT
    *
FROM
    (
        SELECT
            REGION.NOM,
            SUM(QUANTITE_TOTALE_ACHETEE) AS VOLUME
        FROM
            REGION,
            CLIENT,
            ARTICLE,
            ACHAT,
            QUANTITE_TOTALE_ACHETEE
        WHERE
            ACHAT.ARTICLE = ARTICLE.IDARTICLE
            AND ACHAT.CLIENT = CLIENT.IDCLIENT
            AND CLIENT.HABITE = REGION.IDREGION
        GROUP BY
            REGION.IDREGION,
            REGION.NOM
        ORDER BY
            VOLUME DESC
    )
WHERE
    ROWNUM = 1;

-- Quelle est la région qui vend le plus de vin en quantité ?

SELECT
    *
FROM
    (
        SELECT
            REGION.NOM,
            SUM(QUANTITE_TOTALE_ACHETEE) AS VOLUME
        FROM
            REGION,
            VIN,
            ARTICLE,
            ACHAT,
            QUANTITE_TOTALE_ACHETEE
        WHERE
            ACHAT.ARTICLE = ARTICLE.IDARTICLE
            AND ARTICLE.VIN = VIN.IDVIN
            AND VIN.PROVENANCE = REGION.IDREGION
        GROUP BY
            REGION.IDREGION,
            REGION.NOM
        ORDER BY
            VOLUME DESC
    )
WHERE
    ROWNUM = 1;
