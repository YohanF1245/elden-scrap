import requests
from bs4 import BeautifulSoup
import psycopg2
import logging
import time
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.options import Options

# Configuration du logging
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

# Configuration de la base de données
DB_CONFIG = {
    'dbname': 'elden_ring',
    'user': 'postgres',
    'password': 'postgres',
    'host': 'localhost',
    'port': 5432
}

def init_db():
    try:
        logging.info("Connexion à la base de données...")
        conn = psycopg2.connect(**DB_CONFIG)
        c = conn.cursor()
        
        logging.info("Création de la table weapons...")
        c.execute('''CREATE TABLE IF NOT EXISTS weapons
                     (id SERIAL PRIMARY KEY,
                      name TEXT,
                      image_url TEXT,
                      is_dlc BOOLEAN,
                      physical_attack INTEGER,
                      physical_defense INTEGER,
                      magic_attack INTEGER,
                      magic_defense INTEGER,
                      fire_attack INTEGER,
                      fire_defense INTEGER,
                      lightning_attack INTEGER,
                      lightning_defense INTEGER,
                      holy_attack INTEGER,
                      holy_defense INTEGER,
                      critical_hit INTEGER,
                      guard_boost INTEGER,
                      strength_requirement INTEGER,
                      strength_scaling TEXT,
                      dexterity_requirement INTEGER,
                      dexterity_scaling TEXT,
                      intelligence_requirement INTEGER,
                      intelligence_scaling TEXT,
                      faith_requirement INTEGER,
                      faith_scaling TEXT,
                      arcane_requirement INTEGER,
                      arcane_scaling TEXT,
                      weight REAL,
                      skill_fp INTEGER,
                      skill_name TEXT,
                      skill_url TEXT)''')
        
        conn.commit()
        conn.close()
        logging.info("Base de données initialisée avec succès.")
    except Exception as e:
        logging.error(f"Erreur lors de l'initialisation de la base de données : {e}")

def scrape_weapon_types():
    try:
        logging.info("Récupération des types d'armes...")
        
        # Configuration de Chrome
        chrome_options = Options()
        chrome_options.add_argument("--headless")
        chrome_options.add_argument("--disable-gpu")
        chrome_options.add_argument("--window-size=1920,1080")
        chrome_options.add_argument("--disable-blink-features=AutomationControlled")
        chrome_options.add_argument("--user-agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36")
        
        # Initialisation du driver
        service = Service('chromedriver.exe')
        driver = webdriver.Chrome(service=service, options=chrome_options)
        
        # Accès à la page principale
        driver.get("https://eldenring.wiki.fextralife.com/Weapons")
        time.sleep(1)  # Réduit à 2 secondes
        
        # Récupération du contenu
        html = driver.page_source
        driver.quit()
        
        # Parsing avec BeautifulSoup
        soup = BeautifulSoup(html, 'html.parser')
        
        # Debug: afficher la structure HTML
        logging.info("Structure HTML trouvée:")
        logging.info(soup.prettify()[:1000])  # Afficher les 1000 premiers caractères
        
        # Récupération des liens des types d'armes
        weapon_types = []
        
        # Chercher dans la section principale du contenu (mise à jour du sélecteur)
        main_content = soup.find('div', class_='wiki-content-block')  # Changement ici
        if not main_content:
            main_content = soup.find('div', class_='col-sm-9 wiki-content-block')  # Alternative
        if not main_content:
            main_content = soup.find('main')  # Autre alternative
        
        if not main_content:
            logging.warning("Section principale non trouvée")
            # Chercher directement les liens dans tout le document
            main_content = soup
        
        # Chercher tous les liens qui contiennent des types d'armes spécifiques
        type_links = main_content.find_all('a', href=True)
        logging.info(f"Nombre total de liens trouvés : {len(type_links)}")
        
        # Liste des types d'armes connus
        known_weapon_types = [
            'Daggers', 'Straight+Swords', 'Greatswords', 'Colossal+Swords',
            'Thrusting+Swords', 'Heavy+Thrusting+Swords', 'Curved+Swords',
            'Curved+Greatswords', 'Katanas', 'Twinblades', 'Axes', 'Greataxes',
            'Hammers', 'Great+Hammers', 'Flails', 'Spears', 'Great+Spears',
            'Halberds', 'Reapers', 'Whips', 'Fists', 'Claws', 'Colossal+Weapons',
            'Light+Bows', 'Bows', 'Greatbows', 'Crossbows', 'Ballistas',
            'Glintstone+Staffs', 'Sacred+Seals'
        ]
        
        for link in type_links:
            href = link['href']
            # Debug: afficher tous les liens
            logging.debug(f"Lien trouvé : {href}")
            
            # Vérifier si le lien correspond à un type d'arme connu
            if any(weapon_type.lower() in href.lower() for weapon_type in known_weapon_types):
                weapon_types.append({
                    'name': link.text.strip(),
                    'url': 'https://eldenring.wiki.fextralife.com' + href if not href.startswith('http') else href
                })
        
        logging.info(f"Types d'armes trouvés : {[wt['name'] for wt in weapon_types]}")
        return weapon_types
    except Exception as e:
        logging.error(f"Erreur lors de la récupération des types d'armes : {e}")
        logging.error(f"Détails de l'erreur : {str(e)}")
        return []

def scrape_weapons_from_page(url):
    try:
        logging.info(f"Scraping de la page {url}...")
        
        # Configuration de Chrome
        chrome_options = Options()
        chrome_options.add_argument("--headless")
        chrome_options.add_argument("--disable-gpu")
        chrome_options.add_argument("--window-size=1920,1080")
        chrome_options.add_argument("--disable-blink-features=AutomationControlled")
        chrome_options.add_argument("--user-agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36")
        
        # Initialisation du driver
        service = Service('chromedriver.exe')
        driver = webdriver.Chrome(service=service, options=chrome_options)
        
        # Accès à la page
        driver.get(url)
        time.sleep(1)  # Réduit à 2 secondes
        
        # Récupération du contenu
        html = driver.page_source
        driver.quit()
        
        # Parsing avec BeautifulSoup
        soup = BeautifulSoup(html, 'html.parser')
        weapons = []
        
        # Récupération des armes avec les nouveaux sélecteurs
        table_container = soup.find('div', class_='table-responsive')
        if not table_container:
            logging.warning(f"Conteneur de table non trouvé sur {url}")
            return False
            
        table = table_container.find('table', class_='wiki_table sortable searchable')
        if not table:
            logging.warning(f"Table d'armes non trouvée sur {url}")
            return False
        
        # Debug: afficher la structure de la table
        logging.info(f"Structure de la table trouvée : {table.prettify()[:500]}")
        
        rows = table.find_all('tr')[1:]  # Ignorer l'en-tête
        if not rows:
            logging.warning(f"Aucune ligne trouvée dans la table sur {url}")
            return False
            
        for row in rows:
            cols = row.find_all('td')
            if len(cols) >= 14:  # Vérifier le nombre correct de colonnes
                try:
                    # Traitement du nom et de l'image
                    name_cell = cols[0]
                    # Chercher le lien principal qui contient le nom de l'arme
                    link_tag = name_cell.find('a', class_='wiki_link')
                    # Chercher l'image dans ce lien
                    image_tag = link_tag.find('img') if link_tag else None
                    # Chercher le tag DLC en dehors du lien principal
                    dlc_tag = name_cell.find('img', {'title': 'sote-new'})
                    
                    weapon = {
                        'name': link_tag.text.strip() if link_tag else '',
                        'image_url': image_tag['src'] if image_tag else '',
                        'is_dlc': bool(dlc_tag),
                        'category': url.split('/')[-1].replace('+', ' ').replace('%20', ' '),  # Extrait la catégorie de l'URL
                        
                        # Stats physiques (prendre le premier p pour l'attaque, le second pour la défense)
                        'physical_attack': int(cols[1].find_all('p')[0].text.strip().replace('-', '0') or 0),
                        'physical_defense': float(cols[1].find_all('p')[1].text.strip().replace('-', '0') or 0),
                        
                        # Stats magiques
                        'magic_attack': int(cols[2].find_all('p')[0].text.strip().replace('-', '0') or 0),
                        'magic_defense': int(cols[2].find_all('p')[1].text.strip().replace('-', '0') or 0),
                        
                        # Stats feu
                        'fire_attack': int(cols[3].find_all('p')[0].text.strip().replace('-', '0') or 0),
                        'fire_defense': int(cols[3].find_all('p')[1].text.strip().replace('-', '0') or 0),
                        
                        # Stats foudre
                        'lightning_attack': int(cols[4].find_all('p')[0].text.strip().replace('-', '0') or 0),
                        'lightning_defense': int(cols[4].find_all('p')[1].text.strip().replace('-', '0') or 0),
                        
                        # Stats sacré
                        'holy_attack': int(cols[5].find_all('p')[0].text.strip().replace('-', '0') or 0),
                        'holy_defense': int(cols[5].find_all('p')[1].text.strip().replace('-', '0') or 0),
                        
                        # Critique et boost
                        'critical_hit': int(cols[6].find_all('p')[0].text.strip().replace('-', '0') or 0),
                        'guard_boost': int(cols[6].find_all('p')[1].text.strip().replace('-', '0') or 0),
                        
                        # Stats de mise à l'échelle
                        'strength_requirement': int(cols[7].find_all('p')[0].text.strip().replace('-', '0') or 0),
                        'strength_scaling': cols[7].find_all('p')[1].text.strip() or '-',
                        
                        'dexterity_requirement': int(cols[8].find_all('p')[0].text.strip().replace('-', '0') or 0),
                        'dexterity_scaling': cols[8].find_all('p')[1].text.strip() or '-',
                        
                        'intelligence_requirement': int(cols[9].find_all('p')[0].text.strip().replace('-', '0') or 0),
                        'intelligence_scaling': cols[9].find_all('p')[1].text.strip() or '-',
                        
                        'faith_requirement': int(cols[10].find_all('p')[0].text.strip().replace('-', '0') or 0),
                        'faith_scaling': cols[10].find_all('p')[1].text.strip() or '-',
                        
                        'arcane_requirement': int(cols[11].find_all('p')[0].text.strip().replace('-', '0') or 0),
                        'arcane_scaling': cols[11].find_all('p')[1].text.strip() or '-',
                        
                        # Poids
                        'weight': float(cols[12].text.strip().replace('-', '0') or 0),
                        
                        # Compétence (chercher le lien spécifique pour l'URL)
                        'skill_fp': int(cols[13].find_all('p')[0].text.strip().replace('-', '0') or 0),
                        'skill_name': cols[13].find('a').text.strip() if cols[13].find('a') else '',
                        'skill_url': cols[13].find('a')['href'] if cols[13].find('a') else ''
                    }
                    
                    # Debug log
                    logging.info(f"Données extraites pour l'arme : {weapon['name']}")
                    
                    # Sauvegarder l'arme immédiatement
                    save_to_db([weapon])
                    logging.info(f"Arme scrapée et sauvegardée : {weapon['name']}")
                    
                except Exception as e:
                    logging.warning(f"Erreur lors du traitement d'une arme : {e}")
                    logging.warning(f"HTML de la ligne problématique : {row}")
                    continue
        
        return True
    except Exception as e:
        logging.error(f"Erreur lors du scraping de {url} : {e}")
        return False

def scrape_all_weapons():
    weapon_types = scrape_weapon_types()
    
    for weapon_type in weapon_types:
        logging.info(f"Traitement du type d'arme : {weapon_type['name']}")
        success = scrape_weapons_from_page(weapon_type['url'])
        if not success:
            logging.warning(f"Échec du scraping pour {weapon_type['name']}")
        time.sleep(1)

def save_to_db(data):
    try:
        logging.info("Connexion à la base de données pour sauvegarde...")
        conn = psycopg2.connect(**DB_CONFIG)
        c = conn.cursor()
        
        logging.info(f"Sauvegarde de {len(data)} armes...")
        saved_count = 0
        
        # Vérifier si la table est vide
        c.execute("SELECT COUNT(*) FROM weapons")
        count_before = c.fetchone()[0]
        logging.info(f"Nombre d'armes dans la base avant insertion : {count_before}")
        
        for weapon in data:
            try:
                logging.info(f"Tentative d'insertion de l'arme : {weapon['name']}")
                c.execute('''INSERT INTO weapons 
                            (name, image_url, is_dlc, category, physical_attack, physical_defense, 
                            magic_attack, magic_defense, fire_attack, fire_defense, 
                            lightning_attack, lightning_defense, holy_attack, holy_defense, 
                            critical_hit, guard_boost, strength_requirement, strength_scaling, 
                            dexterity_requirement, dexterity_scaling, intelligence_requirement, 
                            intelligence_scaling, faith_requirement, faith_scaling, 
                            arcane_requirement, arcane_scaling, weight, skill_fp, skill_name, skill_url)
                            VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, 
                                    %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
                            RETURNING id''',
                            (weapon['name'], weapon['image_url'], weapon['is_dlc'], weapon['category'],
                             weapon['physical_attack'], weapon['physical_defense'],
                             weapon['magic_attack'], weapon['magic_defense'],
                             weapon['fire_attack'], weapon['fire_defense'],
                             weapon['lightning_attack'], weapon['lightning_defense'],
                             weapon['holy_attack'], weapon['holy_defense'],
                             weapon['critical_hit'], weapon['guard_boost'],
                             weapon['strength_requirement'], weapon['strength_scaling'],
                             weapon['dexterity_requirement'], weapon['dexterity_scaling'],
                             weapon['intelligence_requirement'], weapon['intelligence_scaling'],
                             weapon['faith_requirement'], weapon['faith_scaling'],
                             weapon['arcane_requirement'], weapon['arcane_scaling'],
                             weapon['weight'], weapon['skill_fp'], weapon['skill_name'],
                             weapon['skill_url']))
                
                inserted_id = c.fetchone()[0]
                saved_count += 1
                logging.info(f"Arme insérée avec succès, ID : {inserted_id}")
                
                # Commit après chaque insertion pour éviter la perte de données
                conn.commit()
                
            except Exception as e:
                logging.error(f"Erreur lors de l'insertion de l'arme {weapon['name']} : {e}")
                # Continuer avec les autres armes même si une insertion échoue
                continue
        
        # Vérifier le nombre d'armes après insertion
        c.execute("SELECT COUNT(*) FROM weapons")
        count_after = c.fetchone()[0]
        
        logging.info(f"Nombre d'armes sauvegardées avec succès : {saved_count}")
        logging.info(f"Nombre total d'armes dans la base : {count_after}")
        
        conn.close()
        logging.info("Sauvegarde terminée avec succès.")
        
        # Si aucune arme n'a été sauvegardée, lever une exception
        if saved_count == 0:
            raise Exception("Aucune arme n'a été sauvegardée dans la base de données")
            
    except Exception as e:
        logging.error(f"Erreur lors de la sauvegarde : {e}")
        logging.error("Détails des données à sauvegarder :")
        for weapon in data[:5]:  # Afficher les 5 premières armes pour le débogage
            logging.error(f"Arme : {weapon}")

def main():
    logging.info("Début du programme...")
    init_db()
    scrape_all_weapons()  # La sauvegarde est maintenant intégrée
    logging.info("Programme terminé.")

if __name__ == "__main__":
    main() 