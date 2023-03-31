-- Il vous est demandé d’établir pour chaque client, le nombre d’achats (nbAchat) réalisés pour chaque vin existant.
-- Vous devez gérer tous les cas possibles : un client sans achat, un client sans achat pour un vin existant, un vin jamais acheté.
-- La procédure à écrire mettra à jour la table RESULTAT suivante :
-- RESULTAT ( idclient, nomClient, nomVin, nbAchat, prixTotal)

CREATE TABLE RESULTAT(
    ID_CLIENT INTEGER,
    NOM_CLIENT VARCHAR2 (30) NOT NULL,
    NOM_VIN VARCHAR2 (30) NOT NULL,
    NB_ACHAT INTEGER,
    PRIX_TOTAL INTEGER
);

CREATE OR REPLACE PROCEDURE MAJ_RESULTAT AS
    CURSOR C_CLIENTS IS
        SELECT
            IDCLIENT,
            NOM
        FROM
            CLIENT;
    CURSOR C_VINS IS
        SELECT
            IDVIN,
            NOM
        FROM
            VIN;
    V_NBACHAT   NUMBER;
    V_PRIXTOTAL FLOAT;
BEGIN
    FOR F_CLIENT IN C_CLIENTS LOOP
        FOR F_VIN IN C_VINS LOOP
            V_NBACHAT := 0;
            V_PRIXTOTAL := 0;
            SELECT
                COUNT(*),
                SUM(ARTICLE.PRIXHT) INTO V_NBACHAT,
                V_PRIXTOTAL
            FROM
                ACHAT
                JOIN ARTICLE
                ON ACHAT.ARTICLE = ARTICLE.IDARTICLE
                AND ARTICLE.VI = F_VIN
            WHERE
                ACHAT.CLIENT = F_CLIENT.IDCLIENT;
            IF V_NBACHAT > 0 THEN
                UPDATE RESULTAT
                SET
                    NBACHAT = NBACHAT,
                    PRIXTOTAL = PRIXTOTAL
                WHERE
                    IDCLIENT = F_CLIENT.IDCLIENT
                    AND IDVIN = F_VIN.IDVIN;
                IF SQL%ROWCOUNT = 0 THEN
                    INSERT INTO RESULTAT VALUES (
                        F_CLIENT.IDCLIENT,
                        F_CLIENT.NOM,
                        F_VIN.NOM,
                        NBACHAT,
                        PRIXTOTAL
                    );
                END IF;
            ELSE
                DELETE FROM RESULTAT
                WHERE
                    IDCLIENT = F_CLIENT.IDCLIENT
                    AND IDVIN = F_VIN.IDVIN;
            END IF;
        END LOOP;
    END LOOP;
END;

-- Test

EXECUTE MAJ_RESULTAT;