-- Créer un trigger PL/SQL qui empêche d’effectuer une requête la nuit sur la table Vin.
-- Entre 22h et 6h du matin !

CREATE OR REPLACE TRIGGER TRIGGER_NUIT_VIN BEFORE
    INSERT OR UPDATE OR DELETE ON VIN FOR EACH ROW
BEGIN
    IF(TO_NUMBER(TO_CHAR(SYSDATE, 'hh24')) >= 22
    OR TO_NUMBER(TO_CHAR(SYSDATE, 'hh24')) < 6 ) THEN
        RAISE_APPLICATION_ERROR(-20001, 'Interdiction d''effectuer des requete durant cette interval de temps (22h-6h)');
    END IF;
END;

INSERT INTO VIN VALUES (
    100,
    'Ch�teau Margaux',
    'Margaux',
    'Rouge',
    'Bordeaux'
);

UPDATE VIN
SET
    NOM='Sauvignon'
WHERE
    IDVIN=1;