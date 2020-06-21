# Felipe Salles Lopes
# Celso Antonio

import psycopg2
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from sklearn.preprocessing import StandardScaler
from sklearn.neural_network import MLPRegressor
from sklearn.model_selection import cross_val_predict
from sklearn import metrics
from sklearn.linear_model import LogisticRegression
from sklearn.svm import SVR


df = pd.DataFrame()
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
                              "WHERE tempo.id = indice.data_reg "

    cursor.execute(postgreSQL_select_query)
    record = cursor.fetchall()

    time = list()
    rate = list()

    for row in record:
        # Montando a data no formato de String
        date = str(row[0]) + "/" + str(row[1]) + "/" + str(row[2])
        time.append(date)
        rate.append(row[3])

    df["Data"] = time
    df["Isolamento %"] = rate

    # Obtenção dos casos e mortes no Brasil para os dias selecionados na consulta anterior.
    postgreSQL_select_query = "SELECT mundo.casos, mundo.mortes, mundo.pais_cod, tempo.dia, tempo.mes, tempo.ano " \
                              "FROM coronavirus.covid19_mundo as mundo " \
                              "JOIN coronavirus.tempo as tempo ON mundo.data_reg = tempo.id " \
                              "JOIN coronavirus.indice_isolamento_social as indice ON indice.data_reg = tempo.id " \
                              "WHERE pais_cod = 'BRA'"

    cursor.execute(postgreSQL_select_query)
    record = cursor.fetchall()

    cases = list()
    deaths = list()
    for row in record:
        cases.append(row[0])
        deaths.append(row[1])

    df["Casos"] = cases
    df["Mortes"] = deaths

except (Exception, psycopg2.Error) as error:
    print("Error while connecting to PostgreSQL", error)
finally:
    # closing database connection.
    if (connection):
        cursor.close()
        connection.close()
        print("PostgreSQL connection is closed")

# Normalização dos casos
cases_norm = df["Casos"].values.copy()
cases_norm.shape = (len(cases_norm), 1)

scaler = StandardScaler()
cases_norm = scaler.fit_transform(cases_norm)
df["casos_normalizados"] = cases_norm

# Predição em forma de janela, olhando o tamanho da janela casos anteriores
window = pd.DataFrame()
window_size = 3

for i in range(0, window_size, +1):
    window["E{}".format(i)] = df["casos_normalizados"].shift(-i)

window = window.iloc[:-window_size]

holder = window.values

X = holder[:, :-1]
Y = holder[:, -1]

print(df)
print(window)

# Modelos de preditores
mlp = MLPRegressor(hidden_layer_sizes=(50, 100,), activation='logistic', max_iter=1000, solver='sgd', verbose=True)
svr = SVR(C=1.0, epsilon=0.2, verbose=True, max_iter=1000)

# Avaliação de preditores (com mais dados aumentar o cross validation)
full_predict_mlp = cross_val_predict(mlp, X, Y, cv=2)
full_predict_svr = cross_val_predict(svr, X, Y, cv=2)

print('Mean Squared Error in MLP: %s' % (metrics.mean_squared_error(Y, full_predict_mlp)))
print('Mean Squared Error in SVR: %s' % (metrics.mean_squared_error(Y, full_predict_svr)))

print(full_predict_svr.shape)
print(full_predict_mlp.shape)

# Tratamento para plotar o gráfico
values_to_add = list()
for i in range(0, window_size):
    values_to_add.append(float('NaN'))

full_predict_svr = np.insert(full_predict_svr, 0, values_to_add)
full_predict_svr.shape = (len(full_predict_svr), 1)


full_predict_mlp = np.insert(full_predict_mlp, 0, values_to_add)
full_predict_mlp.shape = (len(full_predict_mlp), 1)

print(full_predict_svr.shape)
print(full_predict_mlp.shape)

df['Predict_mlp'] = full_predict_mlp
df['Predict_svr'] = full_predict_svr

df.plot(y=['casos_normalizados', 'Predict_mlp', 'Predict_svr'], style=['-s', '--o'])
plt.show()