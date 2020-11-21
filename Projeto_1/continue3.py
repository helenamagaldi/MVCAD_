def header(header_list):
    with open(file_name, 'a') as file:
        writer = csv.DictWriter(file, fieldnames=header_list)
        writer.writeheader()


def write_lines(header_list, list_lines):
    with open(nome_arquivo, 'a') as file:
        writer = csv.DictWriter(file, fieldnames=header_list)
        writer.writerows(list_lines)