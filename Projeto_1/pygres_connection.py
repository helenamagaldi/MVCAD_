from pg import DB

db = DB(dbname='clinica_mvcad', host='localhost', port=5432, user='helenamagaldi', password='Soil2424')

db.query("create database curso_mvcad")

