""" Nome - RGA:
    Celso Antonio - 2014.1907.003-7
    Felipe S. Lopes - 2016.1907.032-4
"""
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
    postgreSQL_select_query = "SELECT tempo.dia, tempo.mes, tempo.ano " \
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

    df["Data"] = time

    # Obtenção dos casos e mortes no Brasil para os dias selecionados na consulta anterior.
    postgreSQL_select_query = "SELECT mundo.casos, mundo.mortes, mundo.pais_cod, tempo.dia, tempo.mes, tempo.ano " \
                              "FROM coronavirus.covid19_mundo as mundo " \
                              "JOIN coronavirus.tempo as tempo ON mundo.data_reg = tempo.id " \
                              "JOIN coronavirus.indice_isolamento_social as indice ON indice.data_reg = tempo.id " \
                              "WHERE pais_cod = 'BRA' " \
                              "ORDER BY tempo.ano, tempo.mes, tempo.dia"

    cursor.execute(postgreSQL_select_query)
    record = cursor.fetchall()

    cases = list()
    deaths = list()
    for row in record:
        cases.append(row[0])
        deaths.append(row[1])

    df["Casos"] = cases
    df["Mortes"] = deaths
    print(df['Casos'])

except (Exception, psycopg2.Error) as error:
    print("Error while connecting to PostgreSQL", error)
finally:
    # closing database connection.
    if (connection):
        cursor.close()
        connection.close()
        print("PostgreSQL connection is closed")

# Normalização dos casos entre o intervalo de 0 e 1
# usando sklearn MinMaxScaler
covid_norm = df["Casos"].values.copy()
covid_norm.shape = (len(covid_norm), 1)

min_max_scaler = MinMaxScaler()

covid_norm = min_max_scaler.fit_transform(covid_norm)

df["CasosNormalizados"] = covid_norm

# Predição em forma de janela, olhando o tamanho da janela casos anteriores
window = pd.DataFrame()
window_size = 7

for i in range(0, window_size + 1):
    window['E{}'.format(i)] = df['CasosNormalizados'].shift(-i)

window = window.iloc[: -window_size]

holder = window.values

X = holder[:, :-1]
Y = holder[:, -1]  # Target

print(df)
print(window)

loo = LeaveOneOut()

mlp = MLPRegressor(
    hidden_layer_sizes=(100, 50), alpha=0.001,
    learning_rate_init=0.01, max_iter=1000,
    random_state=9, verbose=True)
svr = SVR(kernel='linear', C=0.25, epsilon=0.01, verbose=True, max_iter=1000)
lr = LinearRegression()

full_predict_lr = cross_val_predict(lr, X, Y, cv=10)
full_predict_mlp = cross_val_predict(mlp, X, Y, cv=loo)
full_predict_svr = cross_val_predict(svr, X, Y, cv=loo)

print('Mean Squared Error in LR: %s' %(metrics.mean_squared_error(Y, full_predict_lr)))
print('Mean Squared Error in MLP: %s' % (metrics.mean_squared_error(Y, full_predict_mlp)))
print('Mean Squared Error in SVR: %s' % (metrics.mean_squared_error(Y, full_predict_svr)))

r_squared_lr = metrics.r2_score(Y, full_predict_lr)
r_squared_mlp = metrics.r2_score(Y, full_predict_mlp)
r_squared_svr = metrics.r2_score(Y, full_predict_svr)

print('R² score in LR: %s' %(r_squared_lr))
print('R² score in MLP: %s' %(r_squared_mlp))
print('R² score in SVR: %s' %(r_squared_svr))

adjusted_r_squared_lr = 1 - (1 - r_squared_lr) * (len(Y) - 1) / (len(Y) - X.shape[1] - 1)
adjusted_r_squared_mlp = 1 - (1 - r_squared_mlp) * (len(Y) - 1) / (len(Y) - X.shape[1] - 1)
adjusted_r_squared_svr = 1 - (1 - r_squared_svr) * (len(Y) - 1) / (len(Y) - X.shape[1] - 1)

print('adjusted R² score in LR: %s' %(adjusted_r_squared_lr))
print('adjusted R² score in MLP: %s' %(adjusted_r_squared_mlp))
print('adjusted R² score in SVR: %s' %(adjusted_r_squared_svr))

# Preenchendo as listas com Nan para que o tamanho seja igual por todas as listas
# e o gráfico ser gerado sem erros.
values_to_add = list()
for i in range(0, window_size):
    values_to_add.append(float('NaN'))

full_predict_svr = np.insert(full_predict_svr, 0, values_to_add)
full_predict_svr.shape = (len(full_predict_svr), 1)

full_predict_mlp = np.insert(full_predict_mlp, 0, values_to_add)
full_predict_mlp.shape = (len(full_predict_mlp), 1)

full_predict_lr = np.insert(full_predict_lr, 0, values_to_add)
full_predict_lr.shape = (len(full_predict_lr), 1)

# Adicionando os dados para plotá-los
df['Predict_lr'] = full_predict_lr
df['Predict_mlp'] = full_predict_mlp
df['Predict_svr'] = full_predict_svr

df = df.set_index('Data')

df.plot(y=['CasosNormalizados', 'Predict_mlp', 'Predict_svr', 'Predict_lr'], style=['-s', '--o'])
plt.show()
