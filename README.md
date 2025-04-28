# Ateja-test-off
POC - Squash TM, Playwright, Jenkins, Maria DB

## POC - Outils de gestion de tests et automatisation 

### Objectifs :
Mise en place d'un envionnement complet de test automatisé qui servira de proof of concept.

1. **Lancer un clean + rebuild complet** :

```bash
docker-compose down -v --remove-orphans
docker-compose up -d --build

```

✅ Jenkins accessible sur : [http://localhost:8080](http://localhost:8080/)

✅ Squash TM accessible sur : http://localhost:8090/squash

✅ MariaDB accessible via localhost:3306

✅ Playwright prêt dans son conteneur