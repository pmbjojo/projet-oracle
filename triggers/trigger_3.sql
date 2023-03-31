-- Créer un trigger PL/SQL qui contrôle que toute insertion dans la table Article implique une contenance supérieure à 25 et toute mise à jour de la contenance doit être supérieure à la valeur dans la base.

CREATE OR REPLACE TRIGGER TRIGGER_ARTICLE BEFORE
    INSERT OR UPDATE ON ARTICLE FOR EACH ROW
BEGIN
    IF INSERTING AND (:NEW.CONTENANCE<=25) THEN
        RAISE_APPLICATION_ERROR(-20001, 'Contenance insuffisante (doit etre sup�rieur � 25)');
    ELSIF UPDATING AND (:NEW.CONTENANCE<:OLD.CONTENANCE) THEN
        RAISE_APPLICATION_ERROR(-20001, 'Contenance plus petite qu''a l''origine');
    END IF;
END;