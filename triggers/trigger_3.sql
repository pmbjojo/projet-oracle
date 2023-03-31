-- Créer un trigger PL/SQL qui contrôle que toute insertion dans la table Article implique une contenance supérieure à 25 et toute mise à jour de la contenance doit être supérieure à la valeur dans la base.

CREATE OR REPLACE TRIGGER TRIGGER_ARTICLE BEFORE
    INSERT OR UPDATE ON ARTICLE FOR EACH ROW
BEGIN
    IF INSERTING AND (:NEW.CONTENANCE<=25) THEN
        RAISE_APPLICATION_ERROR(-20001, 'Contenance insuffisante (doit etre supérieur à 25)');
    ELSIF UPDATING AND (:NEW.CONTENANCE<:OLD.CONTENANCE) THEN
        RAISE_APPLICATION_ERROR(-20001, 'Contenance plus petite qu''a l''origine');
    END IF;
END;

-- Test insert

INSERT INTO ARTICLE VALUES (
    100,
    TO_DATE('29/03/2023', 'DD/MM/YYYY'),
    24,
    10,
    75
); -- Fail (Contenance insuffisante)

INSERT INTO ARTICLE VALUES (
    100,
    TO_DATE('29/03/2023', 'DD/MM/YYYY'),
    26,
    10,
    75
); -- Pass

-- Test update

UPDATE ARTICLE
SET
    CONTENANCE = 50
WHERE
    IDARTICLE=181; -- Fail (Contenance d'origine de 75)

UPDATE ARTICLE
SET
    CONTENANCE = 80
WHERE
    IDARTICLE=181; -- Pass