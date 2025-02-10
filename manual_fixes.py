import psycopg2
from psycopg2.extras import RealDictCursor

DB_CONFIG = {
    'dbname': 'elden_ring',
    'user': 'postgres',
    'password': 'postgres',
    'host': 'localhost',
    'port': 5432
}

def apply_manual_fixes():
    conn = psycopg2.connect(**DB_CONFIG)
    cur = conn.cursor(cursor_factory=RealDictCursor)
    
    try:
        # Corrections manuelles
        fixes = [
            {
                'name': "Celebrant's Sickle",
                'category': 'daggers'
            },
            {
                'name': "Fire Knight's Shortsword",
                'category': 'daggers',
                'image_url': '/file/Elden-Ring/fire_knights_shortsword_elden_ring_shadow_of_the_erdtree_dlc_wiki_guide_200px.png'
            },
            {
                'name': "Moonrithyll's Knight Sword",
                'category': 'colossal swords'
            },
            {
                'name': "Rellana's Twin Blades",
                'category': 'light greatsword'
            }
        ]
        
        for fix in fixes:
            if 'image_url' in fix:
                cur.execute("""
                    UPDATE weapons 
                    SET category = %s, image_url = %s
                    WHERE name = %s
                """, (fix['category'], fix['image_url'], fix['name']))
            else:
                cur.execute("""
                    UPDATE weapons 
                    SET category = %s
                    WHERE name = %s
                """, (fix['category'], fix['name']))
            
            if cur.rowcount > 0:
                print(f"✓ Mise à jour réussie pour {fix['name']}")
            else:
                print(f"✗ Arme non trouvée : {fix['name']}")
        
        conn.commit()
        print("\nToutes les corrections ont été appliquées.")
        
        # Vérification
        print("\nVérification des mises à jour :")
        for fix in fixes:
            cur.execute("SELECT name, category, image_url FROM weapons WHERE name = %s", (fix['name'],))
            result = cur.fetchone()
            if result:
                print(f"\nArme : {result['name']}")
                print(f"Catégorie : {result['category']}")
                print(f"Image URL : {result['image_url']}")
            else:
                print(f"\nArme non trouvée : {fix['name']}")
        
    except Exception as e:
        print(f"Erreur : {str(e)}")
        conn.rollback()
    finally:
        cur.close()
        conn.close()

if __name__ == "__main__":
    apply_manual_fixes() 