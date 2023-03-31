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