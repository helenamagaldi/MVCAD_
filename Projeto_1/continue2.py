import csv

# with open('mvcad-exemplo-csv.csv', 'w') as file:
#     escritor = csv.writer(file)
#     escritor.writerow("oi Lena")

# with open('mvcad-exemplo-csv.csv', 'r') as file:
#     reader = csv.reader(file)
#     for row in reader:
#         print(reader)
#         nova = 3

def escrever_cabecalho(lista_cabecalho):
    with open(nome_arquivo, 'a') as file:
        escritor = csv.DictWriter(file, fieldnames=lista_cabecalho)
        escritor.writeheader()


def escrever_linhas(lista_cabecalho, lista_linhas):
    with open(nome_arquivo, 'a') as file:
        escritor = csv.DictWriter(file, fieldnames=lista_cabecalho)
        escritor.writerows(lista_linhas)


# escrever_cabecalho(lista_cabecalho)

pessoa1 = {
    'nome': 'jess3',
    'idade': 30
}
lista_cabecalho = ['nome', 'idade']
nome_arquivo = 'mvcad-exemplo-dict.csv'

escrever_linhas(lista_cabecalho, [pessoa1])
