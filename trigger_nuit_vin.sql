CREATE OR REPLACE TRIGGER trigger_nuit_vin
BEFORE INSERT OR UPDATE OR DELETE ON VIN
FOR EACH ROW
BEGIN
 IF(to_number(to_char(sysdate, 'hh24')) >= 22 or to_number(to_char(sysdate, 'hh24')) < 6 )
    THEN raise_application_error(-20001,'Interdiction d''effectuer des requete durant cette interval de temps (22h-6h)');
  END IF;
END;  

INSERT INTO VIN VALUES (100, 'Château Margaux', 'Margaux', 'Rouge', 'Bordeaux');
UPDATE VIN SET NOM='Sauvignon' WHERE IDVIN=1;