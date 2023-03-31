-- Dans un bloc PL/SQL anonyme, déclarer un curseur permettant de lire les données suivantes :
-- idarticle, idclient, dateachat, quantité. Pour chaque achat lu par le curseur, afficher le nom du client, son âge et sa région, le nom et l’appellation du vin et la date de l’achat.

DECLARE
    CURSOR C_ACHATS IS
        SELECT
            ACHAT.ARTICLE,
            ACHAT.CLIENT,
            ACHAT.DATEACHAT,
            ACHAT.QUANTITE,
            CLIENT.NOM      AS NOM_CLIENT,
            CLIENT.AGE,
            REGION.NOM      AS NOM_REGION,
            VIN.NOM         AS NOM_VIN,
            VIN.APPELLATION AS APPELLATION
        FROM
            ARTICLE
            JOIN ACHAT
            ON ACHAT.ARTICLE = ARTICLE.IDARTICLE JOIN CLIENT
            ON ACHAT.CLIENT = CLIENT.IDCLIENT
            JOIN VIN
            ON VIN.IDVIN = ARTICLE.VIN JOIN REGION
            ON REGION.IDREGION = VIN.PROVENANCE;
    V_IDARTICLE   ARTICLE.IDARTICLE%TYPE;
    V_IDCLIENT    CLIENT.IDCLIENT%TYPE;
    V_DATEACHAT   ACHAT.DATEACHAT%TYPE;
    V_QUANTITE    ACHAT.QUANTITE%TYPE;
    V_NOM_CLIENT  CLIENT.NOM%TYPE;
    V_AGE         CLIENT.AGE%TYPE;
    V_NOM_REGION  REGION.NOM%TYPE;
    V_NOM_VIN     VIN.NOM%TYPE;
    V_APPELLATION VIN.APPELLATION%TYPE;
BEGIN
    OPEN C_ACHATS;
    LOOP
        FETCH C_ACHATS INTO V_IDARTICLE, V_IDCLIENT, V_DATEACHAT, V_QUANTITE, V_NOM_CLIENT, V_AGE, V_NOM_REGION, V_NOM_VIN, V_APPELLATION;
        EXIT WHEN C_ACHATS%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Client: '
            || V_NOM_CLIENT
            || ', Age: '
            || V_AGE
            || ', Région: '
            || V_NOM_REGION);
        DBMS_OUTPUT.PUT_LINE('Vin: '
            || V_NOM_VIN
            || ', Appellation: '
            || V_APPELLATION);
        DBMS_OUTPUT.PUT_LINE('Achat: '
            || V_IDARTICLE
            || ', Client: '
            || V_IDCLIENT
            || ', Date: '
            || V_DATEACHAT
            || ', Quantité: '
            || V_QUANTITE);
        DBMS_OUTPUT.PUT_LINE('-----------------------------------------');
    END LOOP;
    CLOSE C_ACHATS;
END;