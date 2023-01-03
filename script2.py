import xlrd
import mysql.connector
from datetime import datetime

books=xlrd.open_workbook("./../TP22.xls",encoding_override="utf8")
sheet = books.sheet_by_name("TP2")
connection = mysql.connector.connect( 
        host='localhost',
        user='administrador',
        passwd='triada1234$',
        db='triada'
)
cursor = connection.cursor()

for i in range(19):
    Nombre = sheet.cell_value(i+1,0)
    A_Paterno = sheet.cell_value(i+1,1)
    A_Materno = sheet.cell_value(i+1,2)
    Fecha_nac = str(sheet.cell_value(i+1,3))
    Correo = sheet.cell_value(i+1,4)
    Genero = sheet.cell_value(i+1,5)
    print(Nombre,A_Paterno,A_Materno,Fecha_nac,Correo,Genero)
    query = "Call insertarPersona(%s,%s,%s,%s,%s,%s)"
    p=(Nombre,A_Paterno,A_Materno,Fecha_nac,Correo,Genero)
    cursor.execute(query,p)
connection.commit()
connection.close()