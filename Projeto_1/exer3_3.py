presentes = int(input("quantas pessoas presentes: "))

lista = []
for i in range(presentes):
    lista.append(input("digite o nopme da aluna presente"))

lista.sort()
print("participantes por ordem alfabetica: ")
print("\n".join(lista))