import csv

from pygres_connection import db


def ler_arquivo():
    with open('curso-mvcad.csv', enconding="utf8") as file:
        leitor = csv.DictReader(file, delimiter=',')

        print(db.query('select * from pessoa'))

        # # list comprehension
        # lista_pessoas = [item for item in leitor]
        # print(lista_pessoas)
        #
        # for item in lista_pessoas:
        #     print(item)


ler_arquivo()
