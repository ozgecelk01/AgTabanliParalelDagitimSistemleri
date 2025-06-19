from flask import Flask, request, render_template_string
import pyodbc
import os
from dotenv import load_dotenv

load_dotenv()

#SELECT * FROM Users WHERE Username = '' OR 1=1 --'' AND Password ='
app = Flask(__name__)

# Veritabanı bağlantısı
connection_string = (
    "Driver={ODBC Driver 17 for SQL Server};"
    "Server=LEGACIES\\MSSQLEVAL2022;"
    "Database=TestSQLInjection;"
    "Trusted_Connection=yes;"
)

@app.route('/', methods=['GET', 'POST'])
def login():
    result = ''
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password'] # ' OR 1=1 --
        #query = f"SELECT * FROM Users WHERE Username = '{username}' AND Password = '{password}'"
        query = "SELECT * FROM Users WHERE Username = ? AND Password = ?"
        try:
            conn = pyodbc.connect(connection_string)
            cursor = conn.cursor()
            cursor.execute(query, (username, password))
            rows = cursor.fetchall()
            if rows:
                result = f'Giriş başarılı! Kullanıcı: {rows}'
            else:
                result = 'Hatalı giriş!'
        except Exception as e:
            result = f'Hata oluştu: {e}'

    return render_template_string("""
        <h2>Login</h2>
        <form method="post">
            Username: <input type="text" name="username"><br>
            Password: <input type="text" name="password"><br>
            <input type="submit" value="Login">
        </form>
        <p>{{ result }}</p>
    """, result=result)

if __name__ == '__main__':
    app.run(debug=True)
