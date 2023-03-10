CREATE OR REPLACE TRIGGER trigger_age
BEFORE 
  INSERT ON CLIENT
  FOR EACH ROW
  BEGIN
    IF (:new.AGE<18)
      THEN raise_application_error(-20001,'L''age n''est pas appropri� :');
    END IF;
END;    


INSERT INTO CLIENT values(29, 'Jourdan', 15, 5);