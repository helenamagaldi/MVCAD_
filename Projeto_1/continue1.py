# arquivo = open('mvcad-exemplo.txt', 'w')
# arquivo.writelines("oi tudo bem")
# print(arquivo)

# funçao a será de append
# arquivo = open('mvcad-exemplo.txt', 'a')
# arquivo.writelines("oi tudo bem")
# print(arquivo)

# arquivo = open('mvcad-exemplo.txt', 'r')
# print(arquivo.read())
# # readline le linhas especificas, se colocar so o read tem acesso a tudo
# arquivo.close()

# for line in arquivo:
#     print(line)

# para nao ter que fechar:
# with open ('mvcad-exemplo.txt', 'r') as file:
#     for line in file:
#         print(line)

with open ('mvcad-exemplo', 'a') as file:
    file.writelines("\nHelena")