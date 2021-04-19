from DataBase import DataBase


def filtrar_menu(funcao_busca, tipo_busca):
    menu = {1: "Com piscina",
            2: "Com academia",
            3: "Com refeições inclusas"}

    filtros = []
    while True:
        print(f"\n---> Escolha os filtros de pesquisa:")
        for k, v in menu.items():
            print(f"{k} - {v}")
        print("0 - Voltar")
        print(f"{'':-^36}")
        print("Aperte ENTER para fazer a pesquisa.")

        escolhas = input("Selecione a opção desejada: ")
        if len(escolhas) > 0:
            try:
                if int(escolhas) in menu.keys():
                    filtros.append(escolhas)
                    menu.pop(int(escolhas))
                elif escolhas == "0":
                    break
                else:
                    print("\nOpção inválida... Tente novamente.")
            except ValueError:
                print("Opção inválida... Tente novamente.")
        else:
            resultado = funcao_busca(tipo_busca, filtros)
            if len(resultado) > 0:
                print(funcao_busca(tipo_busca, filtros))
            else:
                print("\nNenhum resultado foi encontrado...")
                break

while True:
    print(f"{' LOCA HOTEIS ':=^50}")
    print(f"1 - Buscar por cidade\n"
          f"2 - Buscar por região\n"
          f"0 - Sair")

    opcao = input("Digite a opção desejada: ")

    if opcao == '1':
        print(f"\n{' Busca Por Cidade ':=^50}")
        nome_cidade = input("Buscar hoteis na cidade: ")
        filtrar_menu(DataBase().buscar_cidade, nome_cidade)

    elif opcao == '2':
        print(f"\n{' Busca Por Região':=^50}")
        print(f"1 - Vale do Itajaí\n"
              f"2 - Norte\n"
              f"3 - Sul\n"
              f"4 - Oeste\n"
              f"5 - Serrana\n"
              f"0 - Voltar")
        nome_regiao = int(input("Buscar hoteis na região: "))
        filtrar_menu(DataBase().buscar_cidade, nome_regiao)

    elif opcao == '0':
        print("Programa encerrado...")
        break

    else:
        print("Opção inválida.")
