-- Créer une procédure SQL qui augmente de n% (n en paramètre, compris entre 0 et 85 inclus) le prix de tous les articles de vins provenant d’une région r donnée en paramètre.
-- Définissez les exceptions sur les valeurs de n et r. 
CREATE OR REPLACE PROCEDURE pourcentage_prix(num NUMBER, reg NUMBER) AS
  CURSOR c_vins IS
    SELECT * FROM VIN WHERE VIN.PROVENANCE = reg;
    
BEGIN
  OPEN c_vins;
  IF c_vins%NOTFOUND THEN
    raise_application_error(-20001,'La région n''existe pas');
  ELSIF num > 85 OR num < 0 THEN 
    raise_application_error(-20002,'Le numéro doit être comprit entre 0 et 85');
  ELSE   
    CLOSE c_vins;
    FOR f_vin IN c_vins LOOP
      UPDATE ARTICLE SET PRIXHT = ARTICLE.PRIXHT * (1+num/100)
      WHERE ARTICLE.VIN = f_vin.IDVIN;
    END LOOP;
  END IF;
END;

EXECUTE pourcentage_prix(50,1);
