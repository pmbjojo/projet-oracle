-- Proposer une fonction puis une procédure qui réutilise cette fonction pour mettre en œuvre une fonctionnalité qui vous semble intéressante pour la gestion de cette base de données.
-- Il s’agit ici de mettre en pratique votre capacité à proposer un service intéressant pour la gestion du SI.
CREATE OR REPLACE PROCEDURE top_vin AS
  CURSOR c_quantite IS
    SELECT get_quantite_totale(VIN.IDVIN) AS quantite, VIN.NOM AS vinNom, AVG(CLIENT.AGE) AS age
    FROM ARTICLE 
    JOIN ACHAT ON ACHAT.ARTICLE = ARTICLE.IDARTICLE
    JOIN CLIENT ON ACHAT.CLIENT = CLIENT.IDCLIENT
    JOIN VIN ON ARTICLE.VIN = VIN.IDVIN
    GROUP BY VIN.IDVIN, VIN.NOM
    ORDER BY quantite DESC;
  v_nom_vin VIN.NOM%TYPE;
  v_quantite INT;
  v_avg_age FLOAT;
BEGIN
  FOR f_quantite IN c_quantite LOOP
      v_nom_vin := f_quantite.vinNom;
      v_quantite := f_quantite.quantite;
      v_avg_age := f_quantite.age;
      DBMS_OUTPUT.PUT_LINE('Vin : ' || v_nom_vin || ' Quantité acheté : ' || v_quantite || ' Age moyen des clients : ' || v_avg_age);
  END LOOP;
END;

EXECUTE TOP_VIN;

