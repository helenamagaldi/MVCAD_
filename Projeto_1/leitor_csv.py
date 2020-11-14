import csv


def ler_arquivo():
    with open('curso-mvcad.csv', 'r') as file:
        leitor = csv.DictReader(file, delimiter=',')

        for item in leitor:
            print(item)


ler_arquivo()

#
# import csv
#
#
# def ler_arquivo():
#     with open('curso-mvcad.csv', encoding="utf8") as file:
#         leitor = csv.DictReader(file, delimiter=',')
#
#         # List Comprehention
#         lista_pessoas = [item for item in leitor]
#         print(lista_pessoas)
#
#         for item in lista_pessoas:
#             print(item)
#
# ler_arquivo()