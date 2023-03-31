# Techniques avancées de bases de données

## Environnement

### Déployer un conteneur oracle-xe-11g avec podman

```bash
podman pull oracleinanutshell/oracle-xe-11g
podman run -d -p 49161:1521 oracleinanutshell/oracle-xe-11g
```

### Accéder au conteneur

``` bash
podman container ls
podman exec -it <id> bash
```

### Céer une nouvelle connexion avec le compte administrateur

- login: system
- password : network
- hostname: localhost
- port: 49161
- SID: xe

### Créer un compte utilisateur

```sql
CREATE USER PROJECT IDENTIFIED BY project;
GRANT CONNECT, RESOURCE TO PROJECT;
GRANT CREATE VIEW TO PROJECT;
```

### Se reconnecter avec le nouvel utilisateur

## Quarto

Extension :

https://github.com/quarto-ext/include-code-files