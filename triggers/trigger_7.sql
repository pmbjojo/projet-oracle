-- Soit la table d'audit ci-dessous qui permet de suivre les achats de vins.   

-- CREATE TABLE AUDIT_ACHAT_VIN  
--     (NOM_CLIENT VARCHAR2 (30) NOT NULL,  
--     NOM_VIN VARCHAR2 (30) NOT NULL,  
--     NOM_REGION_VIN VARCHAR2(20) NOT NULL,    
--     APPELATION VARCHAR2 (30) NOT NULL,  
--     QUANTITE_COMMANDEE INTEGER,  
--     DATE_ACHAT DATE NOT NULL); 
 
-- Écrire un trigger qui agit après une insertion dans la table ACHAT en remplissant la table AUDIT_ACHAT_VIN.

CREATE OR REPLACE TRIGGER trigger_audit_vin
AFTER INSERT ON ACHAT
FOR EACH ROW
DECLARE 
  nom_client VARCHAR(20);
  nom_vin VARCHAR(20);
  nom_region_vin VARCHAR(20);
  appelation VARCHAR(20);
BEGIN
  SELECT CLIENT.NOM, VIN.NOM, REGION.NOM, VIN.APPELLATION INTO nom_client,nom_vin,nom_region_vin,appelation
  FROM CLIENT, VIN, REGION, ARTICLE
  WHERE :new.CLIENT = CLIENT.IDCLIENT
  AND :new.ARTICLE = IDARTICLE
  AND ARTICLE.VIN = VIN.IDVIN
  AND VIN.PROVENANCE=REGION.IDREGION;

INSERT INTO AUDIT_ACHAT_VIN VALUES (nom_client, nom_vin, nom_region_vin, appelation, :new.QUANTITE, :new.DATEACHAT);
END;

INSERT INTO ACHAT VALUES (500, 94, 19, TO_DATE('25/11/2021', 'DD/MM/YYYY'), 3, 7);