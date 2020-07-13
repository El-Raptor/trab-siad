import psycopg2
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from sklearn.neural_network import MLPRegressor
from sklearn.model_selection import cross_val_predict
from sklearn import metrics
from sklearn.linear_model import LogisticRegression, LinearRegression
from sklearn.svm import SVR
from sklearn.preprocessing import MinMaxScaler
from sklearn.model_selection import LeaveOneOut
from datetime import datetime

data = pd.DataFrame()
try:
    # Query de busca de dados e montagem do data frame para análise.
    connection = psycopg2.connect(user="postgres",
                                  password="BodocoS0",
                                  host="localhost",
                                  port="5432",
                                  database="dw_covid19")

    cursor = connection.cursor()

    # Obtenção dos dias nos quais têm a taxa de isolamento disponível.
    postgreSQL_select_query = "SELECT tempo.dia, tempo.mes, tempo.ano, indice.taxa_isolamento " \
                              "FROM coronavirus.tempo as tempo, coronavirus.indice_isolamento_social as indice  " \
                              "WHERE tempo.id = indice.data_reg " \
                              "ORDER BY tempo.ano, tempo. mes, tempo.dia"

    cursor.execute(postgreSQL_select_query)
    record = cursor.fetchall()

    time = list()
    rate = list()

    for row in record:
        # Montando a data no formato de String
        date = str(row[0]) + "/" + str(row[1]) + "/" + str(row[2])
        date = datetime.strptime(date, '%d/%m/%Y')
        time.append(date)
        rate.append(row[3])

    # Obtenção dos casos e mortes no Brasil para os dias selecionados na consulta anterior.
    postgreSQL_select_query = "SELECT mundo.casos, mundo.pais_cod, tempo.dia, tempo.mes, tempo.ano " \
                              "FROM coronavirus.covid19_mundo as mundo " \
                              "JOIN coronavirus.tempo as tempo ON mundo.data_reg = tempo.id " \
                              "JOIN coronavirus.indice_isolamento_social as indice ON indice.data_reg = tempo.id " \
                              "WHERE pais_cod = 'BRA' " \
                              "ORDER BY tempo.ano, tempo.mes, tempo.dia"

    cursor.execute(postgreSQL_select_query)
    record = cursor.fetchall()

    cases = list()
    for row in record:
        cases.append(row[0])

    data["Casos"] = cases

    data["Data"] = time
    data["Taxa"] = rate

except (Exception, psycopg2.Error) as error:
    print("Error while connecting to PostgreSQL", error)
finally:
    # closing database connection.
    if (connection):
        cursor.close()
        connection.close()
        print("PostgreSQL connection is closed")

isolation_norm = data["Taxa"].values.copy()
isolation_norm.shape = (len(isolation_norm), 1)

covid_norm = data["Casos"].values.copy()
covid_norm.shape = (len(covid_norm), 1)

####
## Shaping the central dataFrame with normalized values
####
min_max_scaler = MinMaxScaler()

covid_norm = min_max_scaler.fit_transform(covid_norm)
isolation_norm = min_max_scaler.fit_transform(isolation_norm)

data['TaxasNormalizadas'] = isolation_norm
data['CasosNormalizados'] = covid_norm

colors = list(['C0', 'red'])


data = data.set_index('Data')
data.plot(y=['TaxasNormalizadas', 'CasosNormalizados'], color=colors)
plt.savefig('pearson_correlation_plot.png')

plt.show()