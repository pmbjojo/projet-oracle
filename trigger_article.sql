CREATE OR REPLACE TRIGGER trigger_article
BEFORE INSERT OR UPDATE ON ARTICLE
  FOR EACH ROW
  BEGIN
  IF INSERTING AND (:new.CONTENANCE<=25)
    THEN raise_application_error(-20001,'Contenance insuffisante (doit etre supérieur à 25)');
  ELSIF UPDATING AND (:new.CONTENANCE<:old.CONTENANCE)
    THEN raise_application_error(-20001,'Contenance plus petite qu''a l''origine');
  END IF;
END;  