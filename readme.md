# Elden Ring Weapons Database

Base de données et interface web pour explorer les armes d'Elden Ring, incluant le DLC Shadow of the Erdtree.

## 🎮 Fonctionnalités

- Scraping automatique des armes depuis le wiki Fextralife
- Interface web responsive avec filtres multiples
- Tri par différentes statistiques (attaque, défense, poids, etc.)
- Support des armes du DLC Shadow of the Erdtree
- Filtrage par catégorie d'arme
- Affichage détaillé des statistiques (scaling, prérequis, etc.)

## 🛠️ Prérequis

- Docker
- Docker Compose

## 📦 Installation

1. Cloner le repository :
```bash
git clone https://github.com/votre-username/elden-ring-weapons.git
cd elden-ring-weapons
```

2. Construire et lancer les conteneurs :
```bash
docker-compose up -d --build
```

3. Initialiser la base de données :
```bash
# Scraper les armes
docker-compose exec web python scripts/scraper.py

# Mettre à jour les catégories
docker-compose exec web python scripts/update_categories.py

# Appliquer les corrections manuelles
docker-compose exec web python scripts/manual_fixes.py

# (Optionnel) Nettoyer les doublons
docker-compose exec web python scripts/remove_duplicates.py
```

## 🚀 Utilisation

1. Accéder à l'application : http://localhost:5000

2. Fonctionnalités disponibles :
   - Recherche par nom d'arme
   - Filtrage par catégorie d'arme
   - Filtrage DLC/Base Game
   - Tri par différentes statistiques
   - Affichage détaillé des caractéristiques

## 📁 Structure du projet

```
elden-ring-weapons/
├── docker/                     # Configuration Docker
│   ├── postgres/
│   │   └── init.sql           # Initialisation de la BDD
│   └── python/
│       └── Dockerfile         # Configuration Python
├── src/
│   ├── scripts/
│   │   ├── scraper.py         # Script de scraping
│   │   ├── update_categories.py # Mise à jour des catégories
│   │   ├── remove_duplicates.py # Nettoyage des doublons
│   │   └── manual_fixes.py    # Corrections manuelles
│   ├── templates/
│   │   └── index.html         # Interface utilisateur
│   └── app.py                 # Application Flask
├── docker-compose.yml         # Configuration des services
└── requirements.txt           # Dépendances Python
```

## 🔧 Scripts disponibles

### scraper.py
- Scrape les données depuis le wiki Fextralife
- Extrait toutes les statistiques des armes
- Gère les armes du DLC

### update_categories.py
- Catégorise automatiquement les armes
- Extrait les catégories depuis les URLs des images
- Normalise les noms des catégories

### remove_duplicates.py
- Identifie les doublons dans la base
- Conserve l'entrée la plus récente
- Affiche un rapport détaillé

### manual_fixes.py
- Applique des corrections spécifiques
- Corrige les catégories mal identifiées
- Met à jour les URLs d'images incorrectes

## 🔄 Mise à jour des données

Pour mettre à jour la base de données :

```bash
# Mettre à jour toutes les armes
docker-compose exec web python scripts/scraper.py

# Mettre à jour les catégories si nécessaire
docker-compose exec web python scripts/update_categories.py
```

## 🐛 Dépannage

### Problèmes courants

1. Si la base de données ne se connecte pas :
```bash
docker-compose down -v
docker-compose up -d
```

2. Si le scraping échoue :
```bash
# Vérifier les logs
docker-compose logs web
```

3. Pour réinitialiser complètement :
```bash
docker-compose down -v
docker-compose up -d --build
```

## 🤝 Contribution

1. Fork le projet
2. Créer une branche (`git checkout -b feature/amazing-feature`)
3. Commit les changements (`git commit -m 'Add amazing feature'`)
4. Push la branche (`git push origin feature/amazing-feature`)
5. Ouvrir une Pull Request

## 📝 Notes

- Les données sont extraites du wiki Fextralife d'Elden Ring
- L'application est conçue pour un usage personnel/éducatif
- Les images et données appartiennent à leurs propriétaires respectifs

## 📜 License

Ce projet est sous licence MIT. Voir le fichier `LICENSE` pour plus de détails." > README.md