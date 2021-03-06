""" Nome - RGA:
    Celso Antonio - 2014.1907.003-7
    Felipe S. Lopes - 2016.1907.032-4
    Lucas Avanzi - 2016.1907.024-3
"""

import psycopg2
import pandas as pd
import matplotlib.pyplot as plt
from datetime import datetime


def countries_graphs(country):
    """ Gera os gráficos para o país determinado.
        :param country: o país no qual terá um gráfico gerado.
    """
    df = pd.DataFrame()
    beds_number = list()

    try:
        # Query de busca de dados e montagem do data frame para análise.
        connection = psycopg2.connect(user="postgres",
                                      password="BodocoS0",
                                      host="localhost",
                                      port="5432",
                                      database="dw_covid19")

        cursor = connection.cursor()

        # Busca o total de leitos e o país passado como parâmetro.
        postgreSQL_select_query = "SELECT l.total_leitos, l.pais_iso " \
                                  "FROM coronavirus.leitos l " \
                                  "WHERE l.pais_iso = \'" + country + "\'"

        cursor.execute(postgreSQL_select_query)
        record = cursor.fetchall()

        for row in record:
            beds_number.append(row[0])

        print(beds_number)

        # Consultando mortes e casos em todos os dias por país.
        postgreSQL_select_query = "SELECT m.mortes, m.casos, t.dia, t.mes, t.ano, m.pais_cod " \
                                  "FROM coronavirus.covid19_mundo m JOIN coronavirus.tempo t ON data_reg = t.id " \
                                  "WHERE m.pais_cod = \'" + country + "\' " \
                                  "ORDER BY (ano, mes, dia)"


        cursor.execute(postgreSQL_select_query)
        record = cursor.fetchall()

        cases = list()
        deaths = list()
        time = list()
        covid_countries = list()

        for row in record:
            deaths.append(row[0])
            cases.append(row[1])
            date = str(row[2]) + "/" + str(row[3]) + "/" + str(row[4])
            date = datetime.strptime(date, '%d/%m/%Y')
            time.append(date)
            covid_countries.append(row[5])

        df['Mortes'] = deaths
        df['Casos'] = cases
        df['Data'] = time
        df['Pais'] = covid_countries
        df['Mortes Acumuladas'] = df.groupby('Pais')['Mortes'].cumsum()
        df['Casos Acumulados'] = df.groupby('Pais')['Casos'].cumsum()

    except (Exception, psycopg2.Error) as error:
        print("Error while connecting to PostgreSQL", error)
    finally:
        # closing database connection.
        if (connection):
            cursor.close()
            connection.close()
            print("PostgreSQL connection is closed")

    df2 = df.set_index('Data')
    df3 = df2.pivot(columns='Pais')
    df3 = df3.drop(columns=['Casos', 'Mortes'])

    ax = df3.plot()
    plt.title('Coronavírus e Capacidade de Leitos')
    ax.axhline(beds_number[0], linewidth=1, color='r', label='Capacidade Máxima de Leitos')
    ax.legend()
    #ax.set_yscale('log')

    #plt.ylabel('Leitos')

    plt.show()

    plt.savefig(country.lower() + '_beds_plot.png')


countries_graphs('BRA')
countries_graphs('ITA')
countries_graphs('USA')
countries_graphs('ESP')
