-- En utilisant la fonction précédente, écrire une procédure qui affiche pour chaque achat : 
-- Le nom et l’appellation du vin acheté, le nom et la région du client et le prix payé. 
CREATE OR REPLACE PROCEDURE afficher_achats IS
  CURSOR cursor_achats IS
    SELECT VIN.NOM AS vinNom, VIN.APPELLATION AS vinAppellation, CLIENT.NOM AS clientNom, REGION.NOM AS regionNom, 
           get_prix_achat_client(client.idclient, article.idarticle) AS prix_paye
    FROM ACHAT
    JOIN ARTICLE ON ARTICLE.IDARTICLE = ACHAT.ARTICLE
    JOIN VIN ON VIN.IDVIN = ARTICLE.VIN
    JOIN CLIENT ON CLIENT.IDCLIENT = ACHAT.CLIENT
    JOIN REGION ON REGION.IDREGION = CLIENT.HABITE;
    
  nom_vin VIN.NOM%TYPE;
  appellation_vin VIN.APPELLATION%TYPE;
  nom_client CLIENT.NOM%TYPE;
  nom_region REGION.NOM%TYPE;
  prix_paye FLOAT;
BEGIN
  FOR achat_rec IN cursor_achats LOOP
    nom_vin := achat_rec.vinNom;
    appellation_vin := achat_rec.vinAppellation;
    nom_client := achat_rec.clientNom;
    nom_region := achat_rec.regionNom;
    prix_paye := achat_rec.prix_paye;
    
    DBMS_OUTPUT.PUT_LINE('Vin : ' || nom_vin || ' (' || appellation_vin || ')');
    DBMS_OUTPUT.PUT_LINE('Acheté par : ' || nom_client || ' (' || nom_region || ')');
    DBMS_OUTPUT.PUT_LINE('Prix payé : ' || prix_paye || ' euros');
    DBMS_OUTPUT.PUT_LINE('-----------------------------------------');
  END LOOP;
END;

EXECUTE afficher_achats;