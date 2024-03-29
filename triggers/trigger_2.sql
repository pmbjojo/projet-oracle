-- Créer un trigger qui interdit d’acheter le Week End. 
-- Il interdit aussi la modification de la quantité ou bien l’insertion d’une quantité supérieure à 12.

CREATE OR REPLACE TRIGGER INTERDIT_ACHAT_WEEKEND BEFORE
    INSERT OR UPDATE ON ACHAT FOR EACH ROW
DECLARE
    JOUR_SEMAINE VARCHAR2(20);
BEGIN
    JOUR_SEMAINE := TO_CHAR(:NEW.DATEACHAT, 'fmday');
    IF UPPER(TO_CHAR(:NEW.DATEACHAT, 'fmday')) IN ('SUNDAY', 'SATURDAY') THEN
        RAISE_APPLICATION_ERROR(-20001, 'L''achat est interdit le week-end');
    END IF;
    IF (:NEW.QUANTITE > 12) THEN
        RAISE_APPLICATION_ERROR(-20002, 'La quantité ne doit pas dépasser 12');
    END IF;
END;

 -- Test weekend

INSERT INTO ACHAT VALUES (
    22339,
    23,
    3,
    TO_DATE('12/03/2023', 'DD/MM/YYYY'),
    10,
    7
); -- Fail

INSERT INTO ACHAT VALUES (
    22339,
    23,
    3,
    TO_DATE('29/03/2023', 'DD/MM/YYYY'),
    10,
    7
); -- Pass

-- Test quantitée

INSERT INTO ACHAT VALUES (
    22339,
    23,
    3,
    TO_DATE('29/03/2023', 'DD/MM/YYYY'),
    15,
    7
); --Fail

INSERT INTO ACHAT VALUES (
    22339,
    23,
    3,
    TO_DATE('29/03/2023', 'DD/MM/YYYY'),
    10,
    7
); -- Pass