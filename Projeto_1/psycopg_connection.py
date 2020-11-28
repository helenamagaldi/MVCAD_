import csv

from psycopg_connection.py import cursor

def ler_arquivo():
    with open('MVCAD.csv', enconding="utf8") as file:
        leitor = csv.DictReader(file, delimiter=',')

        cursor.execute(' select * from pessoa')
        print(cursor.fetch())

        # list comprehension
        lista_pessoas = [item for item in leitor]
        # print(lista_pessoas)
        #
        # for item in lista_pessoas:
        #     print(item)


ler_arquivo()