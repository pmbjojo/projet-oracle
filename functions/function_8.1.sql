create or replace FUNCTION get_quantite_totale(p_id_vin NUMBER)
RETURN  NUMBER IS quantite_totale NUMBER;
BEGIN
  SELECT SUM(ACHAT.QUANTITE) INTO quantite_totale
  FROM ACHAT
  JOIN VIN ON VIN.IDVIN = p_id_vin
  JOIN ARTICLE ON ARTICLE.VIN = VIN.IDVIN
  WHERE ACHAT.ARTICLE = ARTICLE.IDARTICLE;
  
  return quantite_totale;
END;