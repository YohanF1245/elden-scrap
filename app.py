from flask import Flask, render_template, jsonify
import psycopg2
from psycopg2.extras import RealDictCursor

app = Flask(__name__)

DB_CONFIG = {
    'dbname': 'elden_ring',
    'user': 'postgres',
    'password': 'postgres',
    'host': 'localhost',
    'port': 5432
}

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/api/weapons')
def get_weapons():
    conn = psycopg2.connect(**DB_CONFIG)
    cur = conn.cursor(cursor_factory=RealDictCursor)
    
    # Récupérer les armes avec leurs catégories
    cur.execute("""
        SELECT w.*,
               CASE 
                   WHEN w.category IS NOT NULL THEN w.category
                   ELSE 'Unknown'
               END as type
        FROM weapons w
        ORDER BY w.name
    """)
    weapons = cur.fetchall()
    cur.close()
    conn.close()
    return jsonify(weapons)

@app.route('/api/categories')
def get_categories():
    conn = psycopg2.connect(**DB_CONFIG)
    cur = conn.cursor(cursor_factory=RealDictCursor)
    
    # Récupérer les catégories uniques
    cur.execute("""
        SELECT DISTINCT category
        FROM weapons
        WHERE category IS NOT NULL
        ORDER BY category
    """)
    categories = [row['category'] for row in cur.fetchall()]
    cur.close()
    conn.close()
    return jsonify(categories)

@app.route('/init_category')
def init_category():
    conn = psycopg2.connect(**DB_CONFIG)
    cur = conn.cursor()
    try:
        # Ajouter la colonne category si elle n'existe pas
        cur.execute("""
            ALTER TABLE weapons 
            ADD COLUMN IF NOT EXISTS category TEXT
        """)
        conn.commit()
        return "Colonne category ajoutée avec succès"
    except Exception as e:
        return f"Erreur : {str(e)}"
    finally:
        cur.close()
        conn.close()

if __name__ == '__main__':
    app.run(debug=True) 