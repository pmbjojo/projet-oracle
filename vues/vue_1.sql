-- Nous souhaitons utiliser le mécanisme des vues pour créer la table « AUDIT_ACHAT_VIN » vue précédemment.  
-- Proposez  ci-dessous  la  requête  de  création de  vue pour  cette  table. 
-- Veuillez nommer la vue à créer « AUDIT_ACHAT_VIN_View ». 
-- a) Diminuer la quantité commandée de tous les Vins de 10 à partir de la vue créée. 
-- b) Cette modification sera-t-elle répercutée dans la table Achat ? Pourquoi ?

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

UPDATE AUDIT_ACHAT_VIN_VIEW
SET
    QUANTITE = QUANTITE - 10;