-- Proposer une méthode (Trigger ou autre technique) qui met à jour automatiquement la table suivante après chaque insertiondans la table Achat.
-- Track_Nombre_Client (idvin, vin_nom, vin_appelation, nombre_client).
-- L’attribut nombre_client doit pour chaque vin acheté, comptabiliser le nombre de clients différent ayant achetés ce vin.
CREATE TABLE track_nombre_client (
  idvin NUMBER NOT NULL,
  vin_nom VARCHAR2(30) NOT NULL,
  vin_appellation VARCHAR2(30) NOT NULL,
  nombre_client NUMBER DEFAULT 0
);

create or replace TRIGGER update_track_nombre_client
AFTER INSERT ON Achat
FOR EACH ROW
DECLARE
  PRAGMA AUTONOMOUS_TRANSACTION;
  v_idvin VIN.IDVIN%TYPE;
  v_nom VIN.NOM%TYPE;
  v_appellation VIN.APPELLATION%TYPE;
  v_nombre_client INTEGER;
BEGIN
  -- Récupérer l'ID du vin dans la table Article
  SELECT VIN.IDVIN, VIN.NOM, VIN.APPELLATION
  INTO v_idvin, v_nom, v_appellation
  FROM Article, VIN
  WHERE IDARTICLE = :NEW.ARTICLE AND ARTICLE.VIN = VIN.IDVIN;

  -- Récupérer le nombre de clients différents ayant acheté le vin
  SELECT COUNT(DISTINCT CLIENT)
  INTO v_nombre_client
  FROM Achat
  WHERE ARTICLE = :NEW.ARTICLE;

  UPDATE Track_Nombre_Client
  SET nombre_client = v_nombre_client
  WHERE idvin = v_idvin
  AND vin_nom = v_nom
  AND vin_appelation = v_appellation;


  IF SQL%ROWCOUNT = 0 THEN
    INSERT INTO Track_Nombre_Client(idvin, vin_nom, vin_appelation, nombre_client)
    VALUES (v_idvin, v_nom, v_appellation, v_nombre_client);
  END IF;

  COMMIT;
END;


