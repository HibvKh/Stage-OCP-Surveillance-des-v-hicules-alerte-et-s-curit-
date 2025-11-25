import pandas as pd

# Charger le fichier Excel
file_path = 'C:\\Users\\Hiba\\Desktop\\stage OCP\\dataa.xlsx'  # Remplacez par le chemin correct de votre fichier
data = pd.read_excel(file_path)

# Afficher les premières lignes pour vérifier les données
print(data.head())

import numpy as np
# Remplacer les valeurs NULL dans les colonnes numériques par la moyenne de chaque colonne
# Sélectionner uniquement les colonnes numériques
numeric_columns = data.select_dtypes(include=[np.number]).columns

# Remplir les valeurs manquantes dans les colonnes numériques avec la moyenne
data[numeric_columns].fillna(data[numeric_columns].mean(), inplace=True)


# Pour les colonnes non numériques, remplacer les valeurs NULL par une valeur par défaut ou la plus fréquente
data['Nom_du_vÃ©hicule'].fillna('Inconnu', inplace=True)
data['NumÃ©ro_d\'immatriculation'].fillna('Inconnu', inplace=True)

from sklearn.preprocessing import LabelEncoder

# Convertir les colonnes en chaînes de caractères pour un encodage cohérent
data['Nom_du_vÃ©hicule'] = data['Nom_du_vÃ©hicule'].astype(str)
data['NumÃ©ro_d\'immatriculation'] = data['NumÃ©ro_d\'immatriculation'].astype(str)

# Encodage des colonnes non numériques avec LabelEncoder
label_encoder = LabelEncoder()
data['Nom_du_vÃ©hicule'] = label_encoder.fit_transform(data['Nom_du_vÃ©hicule'])
data['NumÃ©ro_d\'immatriculation'] = label_encoder.fit_transform(data['NumÃ©ro_d\'immatriculation'])



from sklearn.preprocessing import MinMaxScaler

# Liste des colonnes numériques
numeric_columns = [
    "Tension_des_pneus_min", "Tension_des_pneus_max", 
    "TempÃ©rature_des_pneus_min", "TempÃ©rature_des_pneus_max", 
    "TempÃ©rature_du_vÃ©hicule_min", "TempÃ©rature_du_vÃ©hicule_max", 
    "Niveau_de_carburant_min", "Niveau_de_carburant_max", 
    "QuantitÃ©_de_charge_min", "QuantitÃ©_de_charge_max",
    "Min_kilomÃ©trage_par_trois_heures","Max_kilomÃ©trage_par_trois_heures"
]

# Normalisation
scaler = MinMaxScaler()
data[numeric_columns] = scaler.fit_transform(data[numeric_columns])

import numpy as np
import tensorflow as tf
from tensorflow.keras.models import Model
from tensorflow.keras.layers import Input, Dense
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler

# Supposons que 'data' est votre DataFrame avec les colonnes numériques sélectionnées
numeric_columns = data.select_dtypes(include=[np.number]).columns
X = data[numeric_columns]

# Normaliser les données
scaler = StandardScaler()
X_scaled = scaler.fit_transform(X)

# Ensuite, vous pouvez séparer les données en ensemble d'entraînement et de test
X_train, X_test = train_test_split(X_scaled, test_size=0.2, random_state=42)

# 2. Construction du modèle Autoencoder
input_dim = X_train.shape[1]
encoding_dim = 14  # Choisissez une taille d'encodage plus petite
input_layer = Input(shape=(input_dim,))
encoded = Dense(encoding_dim, activation='relu')(input_layer)
encoded = Dense(encoding_dim // 2, activation='relu')(encoded)
encoded = Dense(encoding_dim // 4, activation='relu')(encoded)

decoded = Dense(encoding_dim // 2, activation='relu')(encoded)
decoded = Dense(encoding_dim, activation='relu')(decoded)
decoded = Dense(input_dim, activation='linear')(decoded)

autoencoder = Model(inputs=input_layer, outputs=decoded)
autoencoder.compile(optimizer='adam', loss='mean_squared_error')

# 3. Entraînement du modèle sur les données d'entraînement
history = autoencoder.fit(X_train, X_train,
                          epochs=50,
                          batch_size=32,
                          shuffle=True,
                          validation_data=(X_test, X_test),
                          verbose=1)

# 4. Prédiction sur les données de test
X_test_pred = autoencoder.predict(X_test)



# Exemple de nouvelle donnée reçue en temps réel
new_data = pd.DataFrame({
    "Nom_du_vÃ©hicule": ["Komatsu_730E"],  # Nom du véhicule
    "NumÃ©ro_d\'immatriculation": ["MMM1313"],  # Numéro d'immatriculation
    "Tension_des_pneus": [700],  # Exemple de tension des pneus actuelle
    "Température_des_pneus": [80],  # Exemple de température des pneus actuelle
    "Température_du_véhicule": [85],  # Exemple de température du véhicule actuelle
    "Niveau_de_carburant": [50],  # Exemple de niveau de carburant actuel
    "Quantité_de_charge": [10000],  # Exemple de quantité de charge actuelle
    "kilométrage_par_trois_heures":[260] # Exemple de kilométrage actuel par trois heures
})

# Fonction pour détecter si les valeurs sont normales ou non
def detect_normality_single_values(row):
    vehicle = data[(data['Nom_du_vÃ©hicule'] == row['Nom_du_vÃ©hicule']) & 
                   (data['NumÃ©ro_d\'immatriculation'] == row['NumÃ©ro_d\'immatriculation'])]

    if vehicle.empty:
        return False  # Véhicule non trouvé dans le dataset de référence

    normality = []

    # Vérifier la tension des pneus
    if not (vehicle['Tension_des_pneus_min'].values[0] <= row['Tension_des_pneus'] <= vehicle['Tension_des_pneus_max'].values[0]):
        normality.append("Tension des pneus normale")

    # Vérifier la température des pneus
    if not (vehicle['TempÃ©rature_des_pneus_min'].values[0] <= row['Température_des_pneus'] <= vehicle['TTempÃ©rature_des_pneus_max'].values[0]):
        normality.append("Température des pneus normale")

    # Vérifier la température du véhicule
    if not (vehicle['TempÃ©rature_du_vÃ©hicule_min'].values[0] <= row['Température_du_véhicule'] <= vehicle['TempÃ©rature_du_vÃ©hicule_max'].values[0]):
        normality.append("Température du véhicule normale")

    # Vérifier le niveau de carburant
    if not (vehicle['Niveau_de_carburant_min'].values[0] <= row['Niveau_de_carburant'] <= vehicle['Niveau_de_carburant_max'].values[0]):
        normality.append("Niveau de carburant normal")

    # Vérifier la quantité de charge
    if not (vehicle['QuantitÃ©_de_charge_min'].values[0] <= row['Quantité_de_charge'] <= vehicle['QuantitÃ©_de_charge_max'].values[0]):
        normality.append("Quantité de charge normale")
        
    # Vérifier le kilométrage par trois heures
    if not (vehicle['Min_kilomÃ©trage_par_trois_heures'].values[0] <= row['kilométrage_par_trois_heures'] <= vehicle['Max_kilomÃ©trage_par_trois_heures'].values[0]):
          normality.append("Kilométrage par trois heures normale")   


    return normality

# Appliquer la fonction à la nouvelle donnée
normality_detected = detect_normality_single_values(new_data.iloc[0])

if normality_detected:
    print(f"Les données du véhicule {new_data['Nom_du_vÃ©hicule'][0]} (immatriculation {new_data['NumÃ©ro_d\'immatriculation'][0]}) sont normales.")
   
else:
    print(f"Anomalies détectées pour le véhicule {new_data['Nom_du_vÃ©hicule'][0]} (immatriculation {new_data['NumÃ©ro_d\'immatriculation'][0]}") 


import numpy as np

# Prédictions du modèle sur les données de test
X_test_pred = autoencoder.predict(X_test)



import numpy as np
from twilio.rest import Client

# Vos identifiants Twilio
account_sid = 'ACc9b831ecce3f25cc1b4d6997bedacd1f'
auth_token = '599a8da8b7ce44e3d8c918bcb75ea536'
twilio_phone_number = '+14178052395'
destination_phone_number = '+212656289494'

# Créer un client Twilio
client = Client(account_sid, auth_token)

# Fonction pour envoyer une notification
def envoyer_notification(message_body, numero_destinataire):
    message = client.messages.create(
        body=message_body,
        from_=twilio_phone_number,
        to=numero_destinataire
    )
    print(f"Message envoyé avec SID : {message.sid}")

# Exemples de données
new_data = {
    'Nom_du_véhicule': ['Komatsu_730E'],
    'Numéro_d\'immatriculation': ['MMM1313']
}

# Exemple de données d'erreurs de reconstruction
# (Remplacez ceci par votre logique de détection d'erreurs)
X_test_pred = np.array([[1, 1, 1], [0, 0, 0], [1, 1, 1]])  # Prédictions du modèle
X_test = np.array([[1, 1, 1], [0, 0, 0], [1, 0, 1]])      # Données réelles

# Calcul des erreurs de reconstruction
reconstruction_errors = np.mean(np.abs(X_test_pred - X_test), axis=1)

# Définir le seuil d'anomalie
seuil_anomalie = 0.5  # Ajustez le seuil selon votre cas

# Détection des erreurs
erreur_detectee = np.any(reconstruction_errors > seuil_anomalie)

# Envoi de notification si une erreur est détectée
if erreur_detectee:
    
    message_body = f"Anomalies détectées pour le véhicule {new_data['Nom_du_véhicule'][0]} (immatriculation {new_data['Numéro_d\'immatriculation'][0]})."
    print(message_body)
    envoyer_notification(message_body, destination_phone_number)

