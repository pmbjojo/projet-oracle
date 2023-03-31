-- Créer une fonction PL/SQL qui prend en paramètres l’identifiant d’un client et l’identifiant d’un article et qui renvoie le prix payé par le client pour l’achat de l’article.
-- Tester cette fonction avec un client et un article existant dans la base de données.

CREATE OR REPLACE FUNCTION GET_PRIX_ACHAT_CLIENT(
    IDCLIENT NUMBER,
    IDARTICLE NUMBER
) RETURN ARTICLE.PRIXHT%TYPE IS
    PRIX_PAYE ARTICLE.PRIXHT%TYPE;
BEGIN
    SELECT
        ARTICLE.PRIXHT INTO PRIX_PAYE
    FROM
        ACHAT
        INNER JOIN ARTICLE
        ON ARTICLE.IDARTICLE=ACHAT.ARTICLE
    WHERE
        ACHAT.CLIENT = IDCLIENT
        AND ACHAT.ARTICLE = IDARTICLE;
    RETURN PRIX_PAYE;
END;

-- Test

SELECT
    GET_PRIX_ACHAT_CLIENT(5,
    212)
FROM
    DUAL; -- Pass

SELECT
    GET_PRIX_ACHAT_CLIENT(128,
    50000)
FROM
    DUAL; -- Pass

SELECT
    GET_PRIX_ACHAT_CLIENT(2,
    107)
FROM
    DUAL; -- Fail

SELECT
    GET_PRIX_ACHAT_CLIENT(19,
    94)
FROM
    DUAL; -- Fail