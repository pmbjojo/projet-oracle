CREATE OR REPLACE TRIGGER trigger_modification_achat
BEFORE UPDATE OR DELETE ON ACHAT
FOR EACH ROW
BEGIN
  IF DELETING
    THEN raise_application_error(-20001,'Interdiction d''annuler un achat');
  ELSIF UPDATING AND (:old.QUANTITE>:new.QUANTITE)
    THEN raise_application_error(-20001,'Interdiction de diminuer la quantité de l''article');
  ELSIF UPDATING AND (:old.RISTOURNE<:new.RISTOURNE)
    THEN raise_application_error(-20001,'Interdiction d''augmenter la ristourne de l''article');
  END IF;
END;

DELETE FROM ACHAT WHERE IDACHAT=1;
UPDATE ACHAT SET QUANTITE=1 WHERE IDACHAT=1;
UPDATE ACHAT SET RISTOURNE=10 WHERE IDACHAT=1;