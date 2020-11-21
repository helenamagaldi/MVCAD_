import csv
from pg import DB


def ler_arquivo():
    with open('curso-mvcad.csv', enconding="utf8") as file:
        leitor = csv.DictReader(file, delimiter=',')

        # list comprehension
        lista_pessoas = [item for item in leitor]
        print(lista_pessoas)

        for item in lista_pessoas:
            print(item)


ler_arquivo()
