import mysql.connector
import random
from datetime import datetime

connection = mysql.connector.connect( 
        host='localhost',
        user='root',
        passwd='Guitarra$7',
        db='triada'
)
cursor = connection.cursor()

for i in range(90):
    probabilidad = random.randint(0,100)
    if(probabilidad < 10):
        opcion = 1
    else:
        opcion = 0
    query = "CALL llenarCuestionario(%s,%s,%s)"
    p=(opcion,3,i+1)
    cursor.execute(query,p)
connection.commit()
connection.close()

