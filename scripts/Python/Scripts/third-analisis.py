""" Nome - RGA:
    Celso Antonio - 2014.1907.003-7
    Felipe S. Lopes - 2016.1907.032-4
"""

import psycopg2
import pandas as pd
import matplotlib.pyplot as plt
from datetime import datetime

df = pd.DataFrame()

def cities_graph(city):
    try:
        # Query de busca de dados e montagem do data frame para análise.
        connection = psycopg2.connect(user="postgres",
                                      password="BodocoS0",
                                      host="localhost",
                                      port="5432",
                                      database="dw_covid19")

        cursor = connection.cursor()
        postgreSQL_select_query = "SELECT ci.nome, cc.casos, tp.dia, tp.mes, tp.ano " \
                                  "FROM coronavirus.casos_por_cidade cc " \
                                  "JOIN coronavirus.tempo tp ON cc.id_data = tp.id " \
                                  "JOIN coronavirus.cidade ci ON ci.id = cc.cidade WHERE ci.nome = \'" + city + "\' " \
                                  "ORDER BY (tp.ano, tp.mes, tp.dia)"

        cursor.execute(postgreSQL_select_query)
        record = cursor.fetchall()

        city_row = list()
        cases = list()
        date = list()

        for row in record:
            city_row.append(row[0])
            cases.append(row[1])
            time = str(row[2]) + "/" + str(row[3]) + "/" + str(row[4])
            time = datetime.strptime(time, '%d/%m/%Y')
            date.append(time)

        df['Cidade'] = city_row
        df['Casos'] = cases
        df['Data'] = date

        postgreSQL_select_query = "SELECT ci.nome, tr.temp_celsius, tr2.temp_celsius, " \
                                  "tp.dia, tp.mes, tp.ano FROM coronavirus.temperatura_cidade tc " \
                                  "JOIN coronavirus.temperatura tr ON tc.temp_max = tr.id " \
                                  "JOIN coronavirus.temperatura tr2 ON tc.temp_min = tr2.id " \
                                  "JOIN coronavirus.cidade ci ON tc.cidade = ci.id " \
                                  "JOIN coronavirus.tempo tp ON tc.id_data = tp.id " \
                                  "WHERE ci.nome = \'" + city + "\' " \
                                  "ORDER BY (tp.ano, tp.mes, tp.dia) "

        cursor.execute(postgreSQL_select_query)
        record = cursor.fetchall()

        max_temp = list()
        min_temp = list()

        for row in record:
            max_temp.append(row[1])
            min_temp.append(row[2])

        df['Temperatura Máxima'] = max_temp
        df['Temperatura Mínima'] = min_temp
        print(df)


    except (Exception, psycopg2.Error) as error:
        print("Error while connecting to PostgreSQL", error)
    finally:
        # closing database connection.
        if (connection):
            cursor.close()
            connection.close()
            print("PostgreSQL connection is closed")

    df2 = df.set_index('Data')
    df3 = df2.pivot(columns='Cidade')

    df3.plot()
    plt.show()

cities_graph('São Paulo')
