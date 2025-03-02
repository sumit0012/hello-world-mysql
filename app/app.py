from flask import Flask, jsonify
import mysql.connector
import os

app = Flask(__name__)

# Load database credentials from environment variables
MYSQL_SERVER = os.getenv('MYSQL_SERVER', 'localhost')
MYSQL_USER = os.getenv('MYSQL_USER', 'root')
MYSQL_PASSWORD = os.getenv('MYSQL_PASSWORD', 'root')
MYSQL_DB = os.getenv('MYSQL_DB', 'hello_db')

# Connect to MySQL
def get_db_connection():
    return mysql.connector.connect(
        host=MYSQL_SERVER,
        user=MYSQL_USER,
        password=MYSQL_PASSWORD,
        database=MYSQL_DB
    )

@app.route('/')
def hello_world():
    try:
        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute("SELECT message FROM hello_table LIMIT 1;")
        message = cursor.fetchone()[0]
        conn.close()
        return jsonify(message=message)
    except Exception as e:
        return jsonify(error=str(e))

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
