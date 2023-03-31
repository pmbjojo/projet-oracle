-- Nous souhaitons utiliser le mécanisme des vues pour créer la table « AUDIT_ACHAT_VIN » vue précédemment.

CREATE TABLE AUDIT_ACHAT_VIN (
    NOM_CLIENT VARCHAR2 (30) NOT NULL,
    NOM_VIN VARCHAR2 (30) NOT NULL,
    NOM_REGION_VIN VARCHAR2(20) NOT NULL,
    APPELATION VARCHAR2 (30) NOT NULL,
    QUANTITE_COMMANDEE INTEGER,
    DATE_ACHAT DATE NOT NULL
);

-- Proposez ci-dessous la requête de création de vue pour cette table. 
-- Veuillez nommer la vue à créer « AUDIT_ACHAT_VIN_View ». 

CREATE OR REPLACE VIEW AUDIT_ACHAT_VIN_VIEW AS
    SELECT
        A.IDACHAT,
        V.IDVIN,
        V.NOM,
        A.QUANTITE,
        A.DATEACHAT
    FROM
        ACHAT   A
        JOIN ARTICLE ART
        ON A.ARTICLE = ART.IDARTICLE JOIN VIN V
        ON ART.VIN = V.IDVIN;

-- a) Diminuer la quantité commandée de tous les Vins de 10 à partir de la vue créée. 

UPDATE AUDIT_ACHAT_VIN_VIEW
SET
    QUANTITE = QUANTITE - 10;

-- b) Cette modification sera-t-elle répercutée dans la table Achat ? Pourquoi ?

--      Non, car la contrainte CH_QUANTITE ne serait plus respectée.