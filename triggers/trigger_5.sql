-- Créer un trigger PL/SQL qui empêche d’annuler un achat ou de diminuer la quantité d’un article acheté ou d’augmenter la ristourne.

CREATE OR REPLACE TRIGGER TRIGGER_MODIFICATION_ACHAT BEFORE
    UPDATE OR DELETE ON ACHAT FOR EACH ROW
BEGIN
    IF DELETING THEN
        RAISE_APPLICATION_ERROR(-20001, 'Interdiction d''annuler un achat');
    ELSIF UPDATING AND (:OLD.QUANTITE>:NEW.QUANTITE) THEN
        RAISE_APPLICATION_ERROR(-20002, 'Interdiction de diminuer la quantité de l''article');
    ELSIF UPDATING AND (:OLD.RISTOURNE<:NEW.RISTOURNE) THEN
        RAISE_APPLICATION_ERROR(-20003, 'Interdiction d''augmenter la ristourne de l''article');
    END IF;
END;

-- Test delete

DELETE FROM ACHAT
WHERE
    IDACHAT=1; -- Fail

-- Test update quantite

UPDATE ACHAT
SET
    QUANTITE=1
WHERE
    IDACHAT=1; -- Fail

UPDATE ACHAT
SET
    QUANTITE=100
WHERE
    IDACHAT=1; -- Pass

-- Test update ristourne

UPDATE ACHAT
SET
    RISTOURNE=10
WHERE
    IDACHAT=1; -- Fail

UPDATE ACHAT
SET
    RISTOURNE=5
WHERE
    IDACHAT=1; -- Pass