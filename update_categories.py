import psycopg2
import re
from psycopg2.extras import RealDictCursor

DB_CONFIG = {
    'dbname': 'elden_ring',
    'user': 'postgres',
    'password': 'postgres',
    'host': 'localhost',
    'port': 5432
}

def normalize_name(name):
    # Enlever tout ce qui est entre parenthèses
    name = re.sub(r'\s*\([^)]*\)', '', name)
    # Remplacer les apostrophes
    name = name.replace("'", "")
    # Remplacer les espaces par des underscores (sauf à la fin)
    name = name.rstrip()  # Enlever les espaces de fin
    name = name.replace(" ", "_")
    return name.lower()

def extract_category(image_url, normalized_name):
    # Extraire la partie pertinente de l'URL
    filename = image_url.split('/')[-1]
    
    # Patterns plus flexibles pour les deux types d'URL
    dlc_pattern = f"{normalized_name}_(.+)_shadow_of_the_erdtree_dlc_wiki_guide_\d*px\.png"
    base_pattern = f"{normalized_name}_(.+)_elden_ring_wiki_guide_\d*px\.png"
    
    # Essayer le pattern DLC d'abord
    dlc_match = re.search(dlc_pattern, filename, re.IGNORECASE)
    if dlc_match:
        return dlc_match.group(1)
    
    # Sinon essayer le pattern de base
    base_match = re.search(base_pattern, filename, re.IGNORECASE)
    if base_match:
        return base_match.group(1)
    
    # Si aucun match, essayer un pattern plus simple
    simple_pattern = f"{normalized_name}_(.+?)(?:_\d+px|_wiki_guide|_elden_ring|_shadow).*\.png"
    simple_match = re.search(simple_pattern, filename, re.IGNORECASE)
    if simple_match:
        return simple_match.group(1)
    
    print(f"DEBUG - Nom normalisé: {normalized_name}")
    print(f"DEBUG - Filename: {filename}")
    return None

def update_categories():
    conn = psycopg2.connect(**DB_CONFIG)
    cur = conn.cursor(cursor_factory=RealDictCursor)
    
    try:
        # Ajouter la colonne category si elle n'existe pas
        cur.execute("""
            ALTER TABLE weapons 
            ADD COLUMN IF NOT EXISTS category TEXT
        """)
        
        # Récupérer toutes les armes
        cur.execute("SELECT id, name, image_url FROM weapons")
        weapons = cur.fetchall()
        
        success_count = 0
        fail_count = 0
        
        # Mettre à jour chaque arme
        for weapon in weapons:
            normalized_name = normalize_name(weapon['name'])
            category = extract_category(weapon['image_url'], normalized_name)
            
            if category:
                print(f"✓ Arme: {weapon['name']}")
                print(f"  Nom normalisé: {normalized_name}")
                print(f"  Catégorie trouvée: {category}")
                print("---")
                
                cur.execute("""
                    UPDATE weapons 
                    SET category = %s 
                    WHERE id = %s
                """, (category, weapon['id']))
                success_count += 1
            else:
                print(f"✗ Impossible de trouver la catégorie pour {weapon['name']}")
                print(f"  URL: {weapon['image_url']}")
                print("---")
                fail_count += 1
        
        conn.commit()
        print("\nRésumé:")
        print(f"Total d'armes traitées: {len(weapons)}")
        print(f"Succès: {success_count}")
        print(f"Échecs: {fail_count}")
        print("\nMise à jour terminée avec succès")
        
    except Exception as e:
        print(f"Erreur : {str(e)}")
        conn.rollback()
    finally:
        cur.close()
        conn.close()

if __name__ == "__main__":
    update_categories() 