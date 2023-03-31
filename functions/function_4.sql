-- Dans un bloc PL/SQL anonyme, déclarer un curseur permettant de lire les données suivantes : 
-- idarticle, idclient, dateachat, quantité. Pour chaque achat lu par le curseur, afficher le nom du client, son âge et sa région, le nom et l’appellation du vin et la date de l’achat. 
DECLARE
CURSOR c_achats IS
SELECT achat.article, achat.client, achat.dateachat, achat.quantite,
client.nom AS nom_client, client.age, region.nom AS nom_region,
vin.nom AS nom_vin, vin.appellation as appellation
FROM ARTICLE
JOIN ACHAT ON achat.article = article.idarticle
JOIN Client ON achat.client  = client.idclient
JOIN Vin ON vin.idvin = article.vin
JOIN Region ON region.idregion = vin.provenance;

v_idarticle article.idarticle%TYPE;
v_idclient client.idclient%TYPE;
v_dateachat Achat.dateachat%TYPE;
v_quantite Achat.quantite%TYPE;
v_nom_client Client.nom%TYPE;
v_age Client.age%TYPE;
v_nom_region Region.nom%TYPE;
v_nom_vin Vin.nom%TYPE;
v_appellation Vin.appellation%TYPE;
BEGIN
OPEN c_achats;
LOOP
FETCH c_achats INTO v_idarticle, v_idclient, v_dateachat, v_quantite,
v_nom_client, v_age, v_nom_region, v_nom_vin, v_appellation;
EXIT WHEN c_achats%NOTFOUND;
DBMS_OUTPUT.PUT_LINE('Client: ' || v_nom_client || ', Age: ' || v_age || ', Région: ' || v_nom_region);
DBMS_OUTPUT.PUT_LINE('Vin: ' || v_nom_vin || ', Appellation: ' || v_appellation);
DBMS_OUTPUT.PUT_LINE('Achat: ' || v_idarticle || ', Client: ' || v_idclient || ', Date: ' || v_dateachat || ', Quantité: ' || v_quantite);
DBMS_OUTPUT.PUT_LINE('-----------------------------------------');
END LOOP;
CLOSE c_achats;
END;
