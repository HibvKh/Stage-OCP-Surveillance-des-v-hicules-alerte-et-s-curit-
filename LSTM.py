import numpy as np
import pandas as pd
from sklearn.preprocessing import MinMaxScaler
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import LSTM, Dense

# Charger le dataset Excel
chemin_dataset = 'C:\\Users\\Hiba\\Desktop\\stage OCP\\dataa.xlsx'
df = pd.read_excel(chemin_dataset, engine='openpyxl')

# Correction des problèmes d'encodage si nécessaire
df.columns = df.columns.str.normalize('NFKD').str.encode('ascii', errors='ignore').str.decode('utf-8')

# Remplacer les valeurs NULL par NaN et gérer les valeurs manquantes
df.replace('NULL', np.nan, inplace=True)
df.fillna(df.select_dtypes(include=[np.number]).mean(), inplace=True)

# Assurez-vous que les colonnes à normaliser existent dans le DataFrame
cols_to_normalize = [
    'Tension_des_pneus_min', 'Tension_des_pneus_max', 
    'TempÃ©rature_des_pneus_min', 'TempÃ©rature_des_pneus_max', 
    'TempÃ©rature_du_vÃ©hicule_min', 'TempÃ©rature_du_vÃ©hicule_max', 
    'Niveau_de_carburant_min', 'Niveau_de_carburant_max', 
    'QuantitÃ©_de_charge_min', 'QuantitÃ©_de_charge_max', 
    'Min_kilomÃ©trage_par_trois_heures', 'Max_kilomÃ©trage_par_trois_heures'
]

# Assurez-vous que toutes les colonnes à normaliser existent dans le DataFrame
cols_to_normalize = [col for col in cols_to_normalize if col in df.columns]

# Normalisation des données
scaler = MinMaxScaler()
df[cols_to_normalize] = scaler.fit_transform(df[cols_to_normalize])

# Création du modèle LSTM avec activation sigmoid pour la sortie
model = Sequential()
model.add(LSTM(50, activation='relu', input_shape=(7, len(cols_to_normalize))))
model.add(Dense(1, activation='sigmoid'))

# Compilation du modèle
model.compile(optimizer='adam', loss='binary_crossentropy', metrics=['accuracy'])

# Préparation des données pour l'entraînement
X_train = []
y_train = []

# On suppose que chaque véhicule a plusieurs enregistrements (chaque 7 jours de données = 1 séquence)
for i in range(len(df) - 7):
    X_train.append(df[cols_to_normalize].values[i:i+7])
    # Définir les labels pour y_train (0 pour pas de panne, 1 pour panne). Ici c'est un exemple fictif.
    y_train.append(0)  # Remplacez par vos labels réels

X_train = np.array(X_train)
y_train = np.array(y_train)

# Entraîner le modèle
model.fit(X_train, y_train, epochs=100, verbose=0)

# Données fictives pour le véhicule GHI9012 sur 7 jours
data_fictive = {
    'Nom_du_vÃ©hicule': ['Camion']*7,
    'NumÃ©ro_d\'immatriculation': ['DEF5678']*7,
    'Tension_des_pneus_min': [34, 34, 34, 32, 31, 30, 28],
    'Tension_des_pneus_max': [35, 34, 34, 33, 32, 31, 29],
    'TempÃ©rature_des_pneus_min': [78, 80, 81, 79, 82, 80, 83],
    'TempÃ©rature_des_pneus_max': [80, 85, 87, 84, 86, 83, 87],
    'TempÃ©rature_du_vÃ©hicule_min': [80, 86, 84, 82, 84, 83, 87],
    'TempÃ©rature_du_vÃ©hicule_max': [85, 90, 94, 92, 90, 89, 92],
    'Niveau_de_carburant_min': [20, 22, 21, 9, 21, 20, 19],
    'Niveau_de_carburant_max': [70, 42, 41, 40, 70, 40, 39],
    'QuantitÃ©_de_charge_min': [1400, 13200, 14230, 14530, 13540, 13525, 14780],
    'QuantitÃ©_de_charge_max': [14790, 14990, 15700, 15600, 1500, 13000, 12000],
    'Min_kilomÃ©trage_par_trois_heures': [50, 55, 53, 51, 52, 54, 50],
    'Max_kilomÃ©trage_par_trois_heures': [150, 155, 153, 151, 152, 154, 150]
}


df_new_vehicle = pd.DataFrame(data_fictive)

# Normalisation des données du nouveau véhicule
df_new_vehicle[cols_to_normalize] = scaler.transform(df_new_vehicle[cols_to_normalize])

# Préparation des données pour la prédiction
X_new_vehicle = df_new_vehicle[cols_to_normalize].values.reshape((1, 7, len(cols_to_normalize)))

# Faire une prédiction
prediction = model.predict(X_new_vehicle)
print("Probabilité de panne pour le véhicule GHI9012 :", prediction[0][0])
