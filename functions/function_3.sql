-- En utilisant la fonction précédente, écrire une procédure qui affiche pour chaque achat :
-- Le nom et l’appellation du vin acheté, le nom et la région du client et le prix payé.

CREATE OR REPLACE PROCEDURE AFFICHER_ACHATS IS
    CURSOR CURSOR_ACHATS IS
        SELECT
            VIN.NOM            AS VINNOM,
            VIN.APPELLATION    AS VINAPPELLATION,
            CLIENT.NOM         AS CLIENTNOM,
            REGION.NOM         AS REGIONNOM,
            GET_PRIX_ACHAT_CLIENT(CLIENT.IDCLIENT,
            ARTICLE.IDARTICLE) AS PRIX_PAYE
        FROM
            ACHAT
            JOIN ARTICLE
            ON ARTICLE.IDARTICLE = ACHAT.ARTICLE JOIN VIN
            ON VIN.IDVIN = ARTICLE.VIN
            JOIN CLIENT
            ON CLIENT.IDCLIENT = ACHAT.CLIENT JOIN REGION
            ON REGION.IDREGION = CLIENT.HABITE;
    NOM_VIN         VIN.NOM%TYPE;
    APPELLATION_VIN VIN.APPELLATION%TYPE;
    NOM_CLIENT      CLIENT.NOM%TYPE;
    NOM_REGION      REGION.NOM%TYPE;
    PRIX_PAYE       FLOAT;
BEGIN
    FOR ACHAT_REC IN CURSOR_ACHATS LOOP
        NOM_VIN := ACHAT_REC.VINNOM;
        APPELLATION_VIN := ACHAT_REC.VINAPPELLATION;
        NOM_CLIENT := ACHAT_REC.CLIENTNOM;
        NOM_REGION := ACHAT_REC.REGIONNOM;
        PRIX_PAYE := ACHAT_REC.PRIX_PAYE;
        DBMS_OUTPUT.PUT_LINE('Vin : '
            || NOM_VIN
            || ' ('
            || APPELLATION_VIN
            || ')');
        DBMS_OUTPUT.PUT_LINE('Acheté par : '
            || NOM_CLIENT
            || ' ('
            || NOM_REGION
            || ')');
        DBMS_OUTPUT.PUT_LINE('Prix payé : '
            || PRIX_PAYE
            || ' euros');
        DBMS_OUTPUT.PUT_LINE('-----------------------------------------');
    END LOOP;
END;
EXECUTE AFFICHER_ACHATS;