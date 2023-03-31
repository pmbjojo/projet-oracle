-- Ajouter la colonne saison dans la table achat.
-- Cette colonne pourra avoir les valeurs suivantes : printemps, été, automne, hiver
-- Créer une procédure qui met à jour tous les achats pour renseigner cette colonne.

ALTER TABLE ACHAT ADD SAISON VARCHAR2 (30);

CREATE OR REPLACE PROCEDURE SAISON AS
    CURSOR C_ACHAT IS
        SELECT
            *
        FROM
            ACHAT;
BEGIN
    FOR F_ACHAT IN C_ACHAT LOOP
        UPDATE ACHAT
        SET
            SAISON = CASE ROUND(
                DBMS_RANDOM.VALUE(1, 4)
            ) WHEN 1 THEN 'printemps' WHEN 2 THEN 'été' WHEN 3 THEN 'automne' WHEN 4 THEN 'hiver' END
        WHERE
            F_ACHAT.IDACHAT = IDACHAT;
    END LOOP;
END;

-- Test

EXECUTE SAISON;