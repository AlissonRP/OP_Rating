# -*- coding: utf-8 -*-
"""
Created on Tue Nov  2 00:31:51 2021

@author: Alisson
"""

# %%
import pymannkendall as mk
import pandas as pd
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt
from pandas.api.types import CategoricalDtype
plt.rcParams["figure.figsize"] = (9, 4)
plt.rcParams['figure.dpi'] = 150
plt.rc('legend', fontsize=10)
# %%
df = pd.read_csv("OP")

df.drop('Unnamed: 0', axis=1, inplace=True)

df[["Tipo", "Saga"]] = df[["Tipo", "Saga"]].astype("category")

# %% anaálise

df[(df.Saga == "East Blue")].describe()
# %%


def graphav(df, Saga):
    t = list(np.arange(df[(df.Saga == Saga)]["numero_episodio"].min(),
                       df[(df.Saga == Saga)]["numero_episodio"].max() + 1,
                       5))

    sns.lineplot(x=df[(df.Saga == Saga)].numero_episodio,
                 y=df[(df.Saga == Saga)].rate)
    plt.xticks(t, t)
    plt.xlabel("Número do Episódio")
    plt.ylabel("Avaliação")
    plt.title("Avaliação "+Saga)


# %%
graphav(df, "Wano")


# %%

sns.lineplot(data=df.iloc[0:500, :],
             y="rate", x="numero_episodio", color="#FF4933")
plt.plot(np.arange(500, 1000), 8+np.sort(np.random.uniform(0, 1, 500)))
plt.xticks(np.arange(0, 997, 50))
plt.xlabel("Número do Episódio")
plt.ylabel("Avaliação")
plt.title("One Piece")

