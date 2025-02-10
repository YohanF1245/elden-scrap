import psycopg2
from psycopg2.extras import RealDictCursor

DB_CONFIG = {
    'dbname': 'elden_ring',
    'user': 'postgres',
    'password': 'postgres',
    'host': 'localhost',
    'port': 5432
}

def remove_duplicates():
    conn = psycopg2.connect(**DB_CONFIG)
    cur = conn.cursor(cursor_factory=RealDictCursor)
    
    try:
        # Trouver les doublons
        cur.execute("""
            WITH duplicates AS (
                SELECT name,
                       COUNT(*) as count,
                       array_agg(id) as ids,
                       array_agg(category) as categories
                FROM weapons
                GROUP BY name
                HAVING COUNT(*) > 1
            )
            SELECT * FROM duplicates
            ORDER BY count DESC
        """)
        
        duplicates = cur.fetchall()
        
        if not duplicates:
            print("Aucun doublon trouvé dans la base de données.")
            return
        
        print(f"\nDoublons trouvés : {len(duplicates)} noms d'armes\n")
        
        for dup in duplicates:
            print(f"Arme : {dup['name']}")
            print(f"Nombre d'occurrences : {dup['count']}")
            print(f"IDs : {dup['ids']}")
            print(f"Catégories : {dup['categories']}")
            print("---")
        
        confirmation = input("\nVoulez-vous supprimer les doublons en gardant l'entrée la plus récente ? (o/n) : ")
        
        if confirmation.lower() == 'o':
            # Supprimer les doublons en gardant l'ID le plus élevé pour chaque nom
            cur.execute("""
                DELETE FROM weapons w1
                USING (
                    SELECT name, MAX(id) as max_id
                    FROM weapons
                    GROUP BY name
                    HAVING COUNT(*) > 1
                ) w2
                WHERE w1.name = w2.name
                AND w1.id != w2.max_id
            """)
            
            deleted_count = cur.rowcount
            conn.commit()
            
            print(f"\n{deleted_count} doublons supprimés avec succès.")
            
            # Vérifier qu'il n'y a plus de doublons
            cur.execute("""
                SELECT name, COUNT(*)
                FROM weapons
                GROUP BY name
                HAVING COUNT(*) > 1
            """)
            
            remaining_duplicates = cur.fetchall()
            if not remaining_duplicates:
                print("Aucun doublon restant dans la base de données.")
            else:
                print(f"ATTENTION : Il reste encore {len(remaining_duplicates)} doublons.")
        else:
            print("\nOpération annulée.")
    
    except Exception as e:
        print(f"Erreur : {str(e)}")
        conn.rollback()
    finally:
        cur.close()
        conn.close()

if __name__ == "__main__":
    remove_duplicates() 