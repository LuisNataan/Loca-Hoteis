from MySQLdb import _exceptions as MySQLExceptions
import MySQLdb as sql
import pandas as pd


pd.set_option("display.max_columns", None)


class DataBase:

    def __init__(self):
        try:
            self.conn = sql.connect(host="localhost", port=3306, user="root", db="locahoteisdb")
        except MySQLExceptions.OperationalError:
            print("Erro ao conectar com o banco de dados!")

        self.cursor = self.conn.cursor()

    def buscar_cidade(self, cidade: str, args: list) -> pd.DataFrame:

        query = f"select h.nome, h.preco_quarto, h.vagas, c.nome as cidade, e.nome as estado, " \
                f"cm.piscina tem_piscina, cm.academia as tem_academia, cm.refeicao as refeicao_incluso " \
                f"from hotel as h " \
                f"join cidade as c on c.id_cidade = h.id_cidade " \
                f"join estado as e on e.id_estado = c.id_estado " \
                f"join comodidades as cm on cm.id_hotel = h.id_hotel " \
                f"where h.vagas > 0 and c.regiao = (select regiao from cidade where cidade.nome = '{cidade}') " \
                f"limit 10"

        if 1 in args:
            query += " and cm.piscina = 1"
        if 2 in args:
            query += " and cm.academia = 1"
        if 3 in args:
            query += " and cm.refeicao = 1"

        self.cursor.execute(query)
        return pd.DataFrame(self.cursor.fetchall()).rename(columns={0: "nome", 1: "preco", 2: "vagas",
                                                                    3: "cidade", 4: "estado", 5: "piscina",
                                                                    6: "academia", 7: "refeicao"})

    def buscar_hotel_por_regiao(self, regiao: int, args: list):
        query = f"select h.nome, h.preco_quarto, h.vagas, c.nome as cidade, e.nome as estado, " \
                f"cm.piscina tem_piscina, cm.academia as tem_academia, cm.refeicao as refeicao_incluso " \
                f"from hotel as h " \
                f"join cidade as c on c.id_cidade = h.id_cidade " \
                f"join estado as e on e.id_estado = c.id_estado " \
                f"join comodidades as cm on cm.id_hotel = h.id_hotel " \
                f"where h.vagas > 0 and c.regiao = {regiao}"

        if 1 in args:
            query += " and cm.piscina = 1"
        if 2 in args:
            query += " and cm.academia = 1"
        if 3 in args:
            query += " and cm.refeicao = 1"

        self.cursor.execute(query)
        return pd.DataFrame(self.cursor.fetchall()).rename(columns={0: "nome", 1: "preco", 2: "vagas",
                                                                    3: "cidade", 4: "estado", 5: "piscina",
                                                                    6: "academia", 7: "refeicao"})
