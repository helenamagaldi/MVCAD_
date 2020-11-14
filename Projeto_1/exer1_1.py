devs = ['Andorinha', 'Azaléia', 'Amélia', 'Margarida', 'Rosa']

num_letra_a = 0
# zero pessoas com a letra a, esse numero sera concatenado nessa variavel

for nome in devs:
    # cria-se um laço que vai rodlar para cada item que está dentro da lista
    #se a primeira letra for a:
    if nome[0] == 'A':
        num_letra_a += 1

print(num_letra_a)