from flask import Flask, jsonify, render_template
import pymysql
import pymysql.cursors
from config import Config # Importe la configuration

app = Flask(__name__)

def get_db_connection():
    """Crée la connexion à MariaDB avec les identifiants de config.py."""
    return pymysql.connect(
        host=Config.DB_HOST,
        user=Config.DB_USER,
        password=Config.DB_PASSWORD,
        database=Config.DB_NAME,
        cursorclass=pymysql.cursors.DictCursor
    )

@app.route('/testBDD')
def home():
    connection = None
    try:
        connection = get_db_connection()
        with connection.cursor() as cursor:
            cursor.execute("SELECT seance.id, heure_date, id_film, id_salle, film.titre, salle.numero_salle FROM seance JOIN film ON film.id = seance.id_film JOIN salle ON seance.id_salle = salle.id ORDER BY heure_date LIMIT 1 ;")
            resultat = cursor.fetchone()
            return jsonify({
                "statut": "succès",
                "message": "Connexion BDD réussie !",
                "donnees": resultat
            }), 200

    except pymysql.MySQLError as error:
        return jsonify({
            "statut": "erreur",
            "message": f"Impossible de se connecter : {str(error)}"
        }), 500
    finally:
        if connection and connection.open:
            connection.close()

@app.route('/')
def index():
    connection = get_db_connection()
    cursor = connection.cursor()
    sql_requette = "SELECT seance.id, heure_date, id_film, id_salle, film.titre, salle.numero_salle FROM seance JOIN film ON film.id = seance.id_film JOIN salle ON seance.id_salle = salle.id ORDER BY heure_date LIMIT 1 ;"
    cursor.execute(sql_requette)
    resultat = cursor.fetchone()

    return render_template('index.html', resultat=resultat)


if __name__ == '__main__':
    app.run(debug=True)