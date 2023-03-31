-- Proposer une méthode (Trigger ou autre technique) qui met à jour automatiquement la table suivante après chaque insertiondans la table Achat.
-- Track_Nombre_Client (idvin, vin_nom, vin_appelation, nombre_client).
-- L’attribut nombre_client doit pour chaque vin acheté, comptabiliser le nombre de clients différent ayant achetés ce vin.

CREATE TABLE TRACK_NOMBRE_CLIENT (
    IDVIN NUMBER NOT NULL,
    VIN_NOM VARCHAR2(30) NOT NULL,
    VIN_APPELLATION VARCHAR2(30) NOT NULL,
    NOMBRE_CLIENT NUMBER DEFAULT 0
);

CREATE OR REPLACE TRIGGER UPDATE_TRACK_NOMBRE_CLIENT AFTER
    INSERT ON ACHAT FOR EACH ROW
DECLARE
    PRAGMA AUTONOMOUS_TRANSACTION;
    V_IDVIN         VIN.IDVIN%TYPE;
    V_NOM           VIN.NOM%TYPE;
    V_APPELLATION   VIN.APPELLATION%TYPE;
    V_NOMBRE_CLIENT INTEGER;
BEGIN
 -- Récupérer l'ID du vin dans la table Article
    SELECT
        VIN.IDVIN,
        VIN.NOM,
        VIN.APPELLATION INTO V_IDVIN,
        V_NOM,
        V_APPELLATION
    FROM
        ARTICLE,
        VIN
    WHERE
        IDARTICLE = :NEW.ARTICLE
        AND ARTICLE.VIN = VIN.IDVIN;
 -- Récupérer le nombre de clients différents ayant acheté le vin
    SELECT
        COUNT(DISTINCT CLIENT) INTO V_NOMBRE_CLIENT
    FROM
        ACHAT
    WHERE
        ARTICLE = :NEW.ARTICLE;
    UPDATE TRACK_NOMBRE_CLIENT
    SET
        NOMBRE_CLIENT = V_NOMBRE_CLIENT
    WHERE
        IDVIN = V_IDVIN
        AND VIN_NOM = V_NOM
        AND VIN_APPELATION = V_APPELLATION;
    IF SQL%ROWCOUNT = 0 THEN
        INSERT INTO TRACK_NOMBRE_CLIENT(
            IDVIN,
            VIN_NOM,
            VIN_APPELATION,
            NOMBRE_CLIENT
        ) VALUES (
            V_IDVIN,
            V_NOM,
            V_APPELLATION,
            V_NOMBRE_CLIENT
        );
    END IF;
    COMMIT;
END;


