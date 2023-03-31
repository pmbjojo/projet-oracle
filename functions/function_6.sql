-- Ajouter la colonne saison dans la table achat. 
-- Cette colonne pourra avoir les valeurs suivantes : printemps, été, automne, hiver 
-- Créer une procédure qui met à jour tous les achats pour renseigner cette colonne.  
ALTER TABLE ACHAT ADD SAISON VARCHAR2 (30);

CREATE OR REPLACE PROCEDURE saison AS
  CURSOR c_achat IS
    SELECT * FROM ACHAT;
  
BEGIN
    FOR f_achat IN c_achat LOOP
      UPDATE ACHAT SET SAISON =
        CASE ROUND(DBMS_RANDOM.VALUE(1,4))
          WHEN 1 THEN 'printemps'
          WHEN 2 THEN 'été'
          WHEN 3 THEN 'automne'
          WHEN 4 THEN 'hiver'
        END
      WHERE f_achat.IDACHAT = IDACHAT;
    END LOOP;
END;
  
EXECUTE saison;