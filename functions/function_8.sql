-- Proposer une fonction puis une procédure qui réutilise cette fonction pour mettre en œuvre une fonctionnalité qui vous semble intéressante pour la gestion de cette base de données.
-- Il s’agit ici de mettre en pratique votre capacité à proposer un service intéressant pour la gestion du SI.

CREATE OR REPLACE PROCEDURE TOP_VIN AS
    CURSOR C_QUANTITE IS
        SELECT
            GET_QUANTITE_TOTALE(VIN.IDVIN) AS QUANTITE,
            VIN.NOM                        AS VINNOM,
            AVG(CLIENT.AGE)                AS AGE
        FROM
            ARTICLE
            JOIN ACHAT
            ON ACHAT.ARTICLE = ARTICLE.IDARTICLE JOIN CLIENT
            ON ACHAT.CLIENT = CLIENT.IDCLIENT
            JOIN VIN
            ON ARTICLE.VIN = VIN.IDVIN
        GROUP BY
            VIN.IDVIN, VIN.NOM
        ORDER BY
            QUANTITE DESC;
    V_NOM_VIN  VIN.NOM%TYPE;
    V_QUANTITE INT;
    V_AVG_AGE  FLOAT;
BEGIN
    FOR F_QUANTITE IN C_QUANTITE LOOP
        V_NOM_VIN := F_QUANTITE.VINNOM;
        V_QUANTITE := F_QUANTITE.QUANTITE;
        V_AVG_AGE := F_QUANTITE.AGE;
        DBMS_OUTPUT.PUT_LINE('Vin : '
            || V_NOM_VIN
            || ' Quantité acheté : '
            || V_QUANTITE
            || ' Age moyen des clients : '
            || V_AVG_AGE);
    END LOOP;
END;

EXECUTE TOP_VIN;