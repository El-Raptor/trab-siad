""" Nome - RGA:
    Celso Antonio - 2014.1907.003-7
    Felipe S. Lopes - 2016.1907.032-4
"""

import psycopg2
import pandas as pd
import matplotlib.pyplot as plt
from datetime import datetime

df = pd.DataFrame()


def cities_graph(city, scale):
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
                                  "JOIN coronavirus.cidade ci ON ci.id = cc.cidade " \
                                  "WHERE ci.nome = \'" + city + "\' ORDER BY (tp.ano, tp.mes, tp.dia)"

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
        df['Casos Acumulados'] = cases
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

    except (Exception, psycopg2.Error) as error:
        print('Error while connecting to PostgreSQL', error)
    finally:
        # closing database connection.
        if (connection):
            cursor.close()
            connection.close()
            print("PostgreSQL connection is closed")

    cases_day = list()

    for index, row in df.iterrows():
        if (index == 0):
            cases_day.append(row['Casos Acumulados'])
        else:
            aux = df['Casos Acumulados']
            if (aux[index-1] > row['Casos Acumulados']) :
                cases_day.append(0)
            else:
                cases_day.append(row['Casos Acumulados'] - aux[index - 1])
                # cases_day.append(df.iloc[index-1, 1] - row['Casos Acumulados'])

    df['Casos'] = cases_day
    print(df['Casos'])
    print(df['Casos Acumulados'])
    df2 = df.set_index('Data')
    df3 = df2.pivot(columns='Cidade')

    df3['Casos Norm'] = df3['Casos'] / scale
    df3 = df3.drop(columns='Casos Acumulados')
    df3 = df3.drop(columns='Casos')

    ax = df3.plot()
    handles, labels = ax.get_legend_handles_labels()
    plt.title('Relação de casos e Temperatura')
    plt.legend(handles=handles, labels=['Temperatura Máxima', 'Temperatura Mínima', 'Casos / ' +
                                        str(scale)], title=city)

    plt.savefig(city.lower() + '_temperature_plot.png')
    plt.savefig(city.lower() + '_temperature_plot.pdf')

    plt.show()


#cities_graph('São Paulo', 20)
#cities_graph('Rio de Janeiro', 10)
#cities_graph('Buenos Aires', 2)
#cities_graph('Canberra', 1)
#cities_graph('Los Angeles', 20)
#cities_graph('Madrid', 70)
#cities_graph('New York City', 200)
#cities_graph('Miami', 15)
