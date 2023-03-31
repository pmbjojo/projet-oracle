-- Il vous est demandé d’établir pour chaque client, le nombre d’achats (nbAchat) réalisés pour chaque vin existant.
-- Vous devez gérer tous les cas possibles : un client sans achat, un client sans achat pour un vin existant, un vin jamais acheté.
-- La procédure à écrire mettra à jour la table RESULTAT suivante :
-- RESULTAT ( idclient, nomClient, nomVin, nbAchat, prixTotal)

CREATE TABLE RESULTAT(
    ID_CLIENT INTEGER,
    NOM_CLIENT VARCHAR2 (30) NOT NULL,
    NOM_VIN VARCHAR2 (30) NOT NULL,
    NB_ACHAT INTEGER,
    PRIX_TOTAL INTEGER
);

CREATE OR REPLACE PROCEDURE maj_resultat AS
  CURSOR c_clients IS
    SELECT IDCLIENT, NOM FROM Client;
   CURSOR c_vins IS
    SELECT IDVIN, NOM FROM Vin;
  v_nbAchat INT;
  v_prixTotal INT;
BEGIN
  FOR f_client IN c_clients LOOP
    FOR f_vin IN c_vins LOOP
      v_nbAchat := 0;
      v_prixTotal := 0;
      SELECT COUNT(*), SUM(ARTICLE.PRIXHT) INTO v_nbAchat, v_prixTotal
      FROM ARTICLE
      JOIN ACHAT ON ACHAT.ARTICLE = ARTICLE.IDARTICLE AND ARTICLE.VIN = f_vin.IDVIN
      WHERE ACHAT.CLIENT = f_client.IDCLIENT;
      
      IF v_nbAchat > 0 THEN
        UPDATE RESULTAT
        SET NB_ACHAT = v_nbAchat, PRIX_TOTAL = v_prixTotal
        WHERE NOM_CLIENT = f_client.NOM AND NOM_VIN = f_vin.NOM;
        
        IF SQL%ROWCOUNT = 0 THEN
          INSERT INTO RESULTAT VALUES (f_client.IDCLIENT, f_client.NOM, f_vin.NOM, v_nbAchat, v_prixTotal);
        END IF;
      ELSE
        DELETE FROM RESULTAT
        WHERE TO_CHAR(NOM_CLIENT) = TO_CHAR(f_client.IDCLIENT) AND TO_CHAR(NOM_VIN) = f_vin.NOM;
      END IF;
    END LOOP;
  END LOOP;
END;

--Test
EXECUTE maj_resultat;