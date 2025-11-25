import os
import cv2
import numpy as np
from tensorflow.keras.models import load_model
from tensorflow.keras.preprocessing.image import img_to_array, load_img

# Chemins des fichiers
model_path = 'face_recognition_cnn.h5'
dataset_path = "C:\\Users\\Hiba\\Downloads\\archive\\105_classes_pins_dataset"

# Charger le modèle entraîné
model = load_model(model_path)

# Initialiser la caméra
cap = cv2.VideoCapture(0)

# Fonction pour extraire les caractéristiques du visage
def extract_features(face):
    face_resized = cv2.resize(face, (64, 64))  # Redimensionner à la taille d'entrée du modèle
    face_array = img_to_array(face_resized)     # Convertir l'image en tableau numpy
    face_array = np.expand_dims(face_array, axis=0)  # Ajouter une dimension batch
    face_array /= 255.0  # Normaliser
    return model.predict(face_array)

# Fonction pour vérifier si une personne est autorisée ou non
def check_authorized(face_features, known_features, threshold=0.5):
    if known_features.size == 0:
        return False
    distances = np.linalg.norm(known_features - face_features, axis=1)
    min_distance = np.min(distances)
    return min_distance < threshold

# Extraire les caractéristiques des personnes autorisées à partir du dataset
def extract_known_features(directory):
    features = []
    for person_folder in os.listdir(directory):
        person_path = os.path.join(directory, person_folder)
        if os.path.isdir(person_path):
            for image_file in os.listdir(person_path):
                img_path = os.path.join(person_path, image_file)
                img = load_img(img_path, target_size=(64, 64))
                img_array = img_to_array(img)
                img_array = np.expand_dims(img_array, axis=0) / 255.0
                feature = model.predict(img_array)
                features.append(feature.flatten())
    return np.array(features)

# Extraire les caractéristiques des personnes autorisées
known_features = extract_known_features(dataset_path)

# Fonction pour traiter chaque image capturée
def process_frame(frame):
    gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
    face_cascade = cv2.CascadeClassifier(cv2.data.haarcascades + 'haarcascade_frontalface_default.xml')
    faces = face_cascade.detectMultiScale(gray, 1.3, 5)
    
    for (x, y, w, h) in faces:
        face = frame[y:y+h, x:x+w]
        face_features = extract_features(face).flatten()
        
        if check_authorized(face_features, known_features):
            label = 'Personne autorisée'
            color = (0, 255, 0)
        else:
            label = 'Personne non autorisée'
            color = (0, 0, 255)
        
        cv2.putText(frame, label, (x, y - 10), cv2.FONT_HERSHEY_SIMPLEX, 1, color, 2)
        cv2.rectangle(frame, (x, y), (x+w, y+h), color, 2)
    
    return frame

while True:
    ret, frame = cap.read()
    if not ret:
        print("Erreur : Impossible de lire l'image.")
        break

    processed_frame = process_frame(frame)
    cv2.imshow('Camera', processed_frame)
    
    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

cap.release()
cv2.destroyAllWindows()
