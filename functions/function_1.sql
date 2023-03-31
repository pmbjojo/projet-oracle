-- Créer une fonction PL/SQL qui prend en paramètres l’identifiant d’un client et l’identifiant d’un article et qui renvoie le prix payé par le client pour l’achat de l’article.
-- Tester cette fonction avec un client et un article existant dans la base de données.
CREATE OR REPLACE FUNCTION get_prix_achat_client(idclient NUMBER, idarticle NUMBER)
RETURN ARTICLE.PRIXHT%TYPE IS
prix_paye ARTICLE.PRIXHT%TYPE;
BEGIN
SELECT article.prixht INTO prix_paye
  FROM ACHAT
  INNER JOIN ARTICLE ON ARTICLE.IDARTICLE=ACHAT.ARTICLE
  WHERE ACHAT.client = idclient AND ACHAT.ARTICLE = idarticle AND rownum = 1;
  RETURN prix_paye;
  
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    raise_application_error(-20001,'Client ou article introuvable');
    RETURN NULL;    
END;

SELECT get_prix_achat_client(5, 212) FROM DUAL;
SELECT get_prix_achat_client(128, 50000) FROM DUAL;
SELECT get_prix_achat_client(2, 107) FROM DUAL;
SELECT get_prix_achat_client(19, 94) FROM DUAL;
