-- Créer un trigger PL/SQL qui empêche d’annuler un achat ou de diminuer la quantité d’un article acheté ou d’augmenter la ristourne.

CREATE OR REPLACE TRIGGER TRIGGER_MODIFICATION_ACHAT BEFORE
    UPDATE OR DELETE ON ACHAT FOR EACH ROW
BEGIN
    IF DELETING THEN
        RAISE_APPLICATION_ERROR(-20001, 'Interdiction d''annuler un achat');
    ELSIF UPDATING AND (:OLD.QUANTITE>:NEW.QUANTITE) THEN
        RAISE_APPLICATION_ERROR(-20001, 'Interdiction de diminuer la quantit� de l''article');
    ELSIF UPDATING AND (:OLD.RISTOURNE<:NEW.RISTOURNE) THEN
        RAISE_APPLICATION_ERROR(-20001, 'Interdiction d''augmenter la ristourne de l''article');
    END IF;
END;

DELETE FROM ACHAT
WHERE
    IDACHAT=1;

UPDATE ACHAT
SET
    QUANTITE=1
WHERE
    IDACHAT=1;

UPDATE ACHAT
SET
    RISTOURNE=10
WHERE
    IDACHAT=1;