from flask import Flask, jsonify, render_template, redirect, url_for, request
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
    co = get_db_connection()
    cursor = co.cursor()
    sql_requete = "SELECT seance.id, heure_date, id_film, id_salle, film.titre, salle.numero_salle, film.resume, film.interdit_16_ans, film.affiche FROM seance JOIN film ON film.ID = seance.id_film JOIN salle ON seance.id_salle = salle.ID ORDER BY heure_date LIMIT 3;"
    cursor.execute(sql_requete)
    prochaines_seances = cursor.fetchall()

    print(prochaines_seances)

    sql = "SELECT * FROM film;"
    cursor.execute(sql)
    films = cursor.fetchall()
    cursor.close()
    co.close()
    return render_template('index.html', prochaines_seances=prochaines_seances, films=films)

@app.route('/seance/<int:id_salle>')
def seance(id_salle):
    print(id_salle)
    co = get_db_connection()
    cursor = co.cursor()
    requete_seances = "SELECT film.titre, seance.heure_date, seance.version_langue, film.interdit_16_ans FROM seance JOIN film ON film.id = seance.id_film JOIN salle ON seance.id_salle = salle.id WHERE salle.numero_salle = %s AND seance.heure_date >= NOW() ORDER BY seance.heure_date ASC;"
    cursor.execute(requete_seances, id_salle)
    seances = cursor.fetchall()
    print(seances)

    sql = "SELECT * FROM film;"
    cursor.execute(sql)
    films = cursor.fetchall()
    return render_template('seance.html', seances=seances, numero_salle=id_salle, films=films)


@app.route('/seance/')
def seance_sans_id():
    return redirect(url_for('index'))

@app.route('/seances/')
def seances():
    co = get_db_connection()
    cursor = co.cursor()
    requete_film = "SELECT * FROM seance JOIN salle ON seance.id_salle=salle.id JOIN film ON seance.id_film=film.id ORDER BY seance.heure_date ASC;"
    cursor.execute(requete_film)
    info_seances_films = cursor.fetchall()
    sql = "SELECT * FROM film;"
    cursor.execute(sql)
    films = cursor.fetchall()
    cursor.close()
    co.close()
    return render_template('seances.html', info_seances_films=info_seances_films, films=films)

@app.route('/getseances/<int:id_salle>')
def getseances(id_salle):
    print(id_salle)
    co = get_db_connection()
    cursor = co.cursor()
    requete_seances = "SELECT film.titre, seance.heure_date, seance.version_langue, film.interdit_16_ans FROM seance JOIN film ON film.id = seance.id_film JOIN salle ON seance.id_salle = salle.id WHERE salle.numero_salle = %s AND seance.heure_date >= NOW() ORDER BY seance.heure_date ASC;"
    cursor.execute(requete_seances, id_salle)
    seances = cursor.fetchall()
    print(seances)
    return seances

@app.route('/film/<int:id_film>')
def film(id_film):
    print(id_film)
    co = get_db_connection()
    cursor = co.cursor()
    infos_film_requete = "SELECT * FROM film WHERE id=%s"
    cursor.execute(infos_film_requete, id_film)
    film = cursor.fetchone()

    infos_seance_requette = "SELECT * FROM seance WHERE id=%s"
    cursor.execute(infos_seance_requette, id_film)
    seance = cursor.fetchone()
    print(film)

    sql = "SELECT * FROM film;"
    cursor.execute(sql)
    films = cursor.fetchall()
    return render_template('film.html', film=film, seance=seance, films=films)

@app.route('/film/')
def film_sans_id():
    return redirect(url_for('index'))


@app.route('/form')
def form():
    co = get_db_connection()
    cursor = co.cursor()
    cursor.execute("SELECT * FROM film;")
    films = cursor.fetchall()
    co.close()

    return render_template('formulaire.html', films=films)


@app.route('/ajouter_film', methods=['POST'])
def ajouter_film():
    titre = request.form.get('titre')
    langue = request.form.get('langue')
    duree = request.form.get('duree')
    interdiction = bool(request.form.get('interdiction'))
    resume = request.form.get('resume')
    affiche = request.form.get('affiche')

    co = get_db_connection()
    cursor = co.cursor()

    sql = "INSERT INTO film (titre, resume, duree, interdit_16_ans, langue, affiche) VALUES (%s, %s, %s, %s, %s, %s);"
    cursor.execute(sql, (titre, resume, duree, interdiction, langue, affiche))
    co.commit()

    return render_template('succes_ajout.html', film=titre)


if __name__ == '__main__':
    app.run(debug=True)