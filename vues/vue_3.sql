-- Créer une vue appelée Stock qui affiche la jointure entre les vins et les articles. 

CREATE OR REPLACE VIEW STOCK AS
    SELECT
        VIN.IDVIN,
        VIN.NOM,
        ARTICLE.CONTENANCE,
        ARTICLE.PRIXHT
    FROM
        VIN,
        ARTICLE
    WHERE
        VIN.IDVIN = ARTICLE.VIN;

-- À partir de cette vue, créer une autre vue appelée Affaire qui, pour chaque vin, donne le meilleur prix au litre possible.  

CREATE OR REPLACE VIEW Affaire AS
    SELECT
        IDVIN,
        NOM,
        MIN(PRIXHT/CONTENANCE) AS PRIXLITRE
    FROM
        STOCK
    GROUP BY
        IDVIN, NOM;

-- À partir de là, comment récupérer le vin qui correspond à la meilleure affaire ?

SELECT
    NOM
FROM
    AFFAIRE
WHERE
    PRIXLITRE = (
        SELECT
            MIN(PRIXLITRE)
        FROM
            AFFAIRE
    );

