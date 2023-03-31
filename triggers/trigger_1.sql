-- Créer un trigger PL/SQL qui contrôle que toute insertion dans la table  Client implique un âge supérieur à 18 ans.

CREATE OR REPLACE TRIGGER trigger_age
BEFORE 
  INSERT ON CLIENT
  FOR EACH ROW
  BEGIN
    IF (:new.AGE<18)
      THEN raise_application_error(-20001,'L''age n''est pas approprié :');
    END IF;
END;

-- Test

INSERT INTO CLIENT values(29, 'Jourdan', 15, 5);