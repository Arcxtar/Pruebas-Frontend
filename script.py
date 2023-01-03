
import mysql.connector
connection = mysql.connector.connect( 
        host='localhost',
        user='root',
        passwd='Guitarra$7',
        db='triada'
)
preguntas=[]
cursor = connection.cursor()
with open("Cuestionario3.txt", encoding="utf-8") as archivo:
    for linea in archivo:
        x = linea.split(".",2);
        query = "INSERT INTO Preguntas (Pregunta) VALUES (%s)"
        p=(str(x[1]),)

        cursor.execute(query,p)
        connection.commit()
connection.close()



