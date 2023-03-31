-- Créer une procédure SQL qui augmente de n% (n en paramètre, compris entre 0 et 85 inclus) le prix de tous les articles de vins provenant d’une région r donnée en paramètre.
-- Définissez les exceptions sur les valeurs de n et r.

CREATE OR REPLACE PROCEDURE POURCENTAGE_PRIX(
    NUM NUMBER,
    REG NUMBER
) AS
    CURSOR C_VINS IS
        SELECT
            *
        FROM
            VIN
        WHERE
            VIN.PROVENANCE = REG;
BEGIN
    OPEN C_VINS;
    IF C_VINS%NOTFOUND THEN
        RAISE_APPLICATION_ERROR(-20001, 'La région n''existe pas');
    ELSIF NUM > 85 OR NUM < 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'Le numéro doit être comprit entre 0 et 85');
    ELSE
        CLOSE C_VINS;
        FOR F_VIN IN C_VINS LOOP
            UPDATE ARTICLE
            SET
                PRIXHT = ARTICLE.PRIXHT * (
                    1+NUM/100
                )
            WHERE
                ARTICLE.VIN = F_VIN.IDVIN;
        END LOOP;
    END IF;
END;

EXECUTE POURCENTAGE_PRIX(50, 1);
