devs = ['Andorinha', 'Azaléia', 'Amélia', 'Margarida', 'Rosa']

print(devs)

check = 'A'

res = [idx for idx in devs if idx[0].lower() == check.lower()]

print("The list of the matching first letter: " + str(res))