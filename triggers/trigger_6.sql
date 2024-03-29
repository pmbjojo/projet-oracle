-- Créer un trigger qui interdit d’acheter le même article moins de 3 jours avant un achat effectué de cet article. 

CREATE OR REPLACE TRIGGER EMPECHER_ACHAT_ARTICLE BEFORE
    INSERT ON ACHAT FOR EACH ROW
DECLARE
    DATE_ACHAT_PRECEDENT DATE;
BEGIN
    SELECT
        MAX(DATEACHAT) INTO DATE_ACHAT_PRECEDENT
    FROM
        ACHAT
    WHERE
        ARTICLE = :NEW.ARTICLE
        AND DATEACHAT < :NEW.DATEACHAT;
    IF (DATE_ACHAT_PRECEDENT IS NOT NULL
    AND :NEW.DATEACHAT - DATE_ACHAT_PRECEDENT <= 3) THEN
        RAISE_APPLICATION_ERROR(-20001, 'Achat non autorisé : cet article a été acheté il y a moins de 3 jours');
    END IF;
END;

-- Test

INSERT INTO ACHAT VALUES (
    22341,
    23,
    3,
    TO_DATE('13/03/2023', 'DD/MM/YYYY'),
    10,
    7
); -- Pass

INSERT INTO ACHAT VALUES (
    22341,
    23,
    3,
    TO_DATE('14/03/2023', 'DD/MM/YYYY'),
    10,
    7
); -- Fail

INSERT INTO ACHAT VALUES (
    22341,
    23,
    3,
    TO_DATE('15/03/2023', 'DD/MM/YYYY'),
    10,
    7
); -- Fail

INSERT INTO ACHAT VALUES (
    22348,
    23,
    3,
    TO_DATE('16/03/2023', 'DD/MM/YYYY'),
    10,
    7
); -- Fail

INSERT INTO ACHAT VALUES (
    22348,
    23,
    3,
    TO_DATE('17/03/2023', 'DD/MM/YYYY'),
    10,
    7
); -- Pass (3 jours après le dernier achat)