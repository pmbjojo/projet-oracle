-- Créer une vue appelée Regionale qui affiche la jointure entre les régions et les clients. 

CREATE OR REPLACE VIEW REGIONALE AS
    SELECT
        CLIENT.NOM,
        CLIENT.AGE
    FROM
        CLIENT,
        REGION
    WHERE
        CLIENT.HABITE = REGION.IDREGION;


-- Diminuer l'âge de tous les clients de cette vue d'une année. 

UPDATE REGIONALE
SET AGE = AGE - 1;

-- Cette modification a-t-elle été répercutée dans la table Client ?

--      Non car les clients ne peuvent pas avoir un âge inférieur ou égal a 17 ans donc la requête n'est pas acceptée

-- Supprimer de la vue (mais pas de la base) toutes les lignes correspondant à un client de plus de 60 ans.

CREATE OR REPLACE VIEW REGIONALE AS
    SELECT
        CLIENT.NOM,
        CLIENT.AGE
    FROM
        CLIENT,
        REGION
    WHERE
        CLIENT.HABITE = REGION.IDREGION,
        AND CLIENT.AGE <= 60;