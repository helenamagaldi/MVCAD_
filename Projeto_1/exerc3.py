presentes = int(input("Quantas pessoas estavam presentes? "))
lista = []
index = 0
while (index < presentes):
    nomes = input("Digite o nome da aluna presente: ")
    index += 1
    lista.append(nomes)
lista.sort()
print("Participantes por ordem alfabética: ")
print("\n".join(lista))