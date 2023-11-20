import os
import json

import joblib
import pandas as pd
from sklearn import preprocessing

# Load Model
MODEL_DIR = "model"
MODEL = "disease_prediction_model.joblib"
model = joblib.load(os.path.join(MODEL_DIR, MODEL))

TRAINING_SET = pd.read_csv(os.path.join("Data", "Training.csv"))
COLUMNS = TRAINING_SET.columns[:-1]

# Label Encoder/Decoder
LE = preprocessing.LabelEncoder()
LE.fit(TRAINING_SET.iloc[:, -1])

# Disease Description

def get_disease_description(disease: str):
    desc_path = os.path.join('Data', 'disease_description.json')
    with open(desc_path, 'r') as fp:
        data = json.load(fp)

    for record in data:
        if disease in record["Disease"]: 
            return record

    return None

def get_disease_precautions(disease: str):
    prec_path = os.path.join('Data', 'disease_precaution.json')
    with open(prec_path, 'r') as fp:
        data = json.load(fp)

    for record in data:
        if disease.lower() == record["Disease"].lower(): 
            return record

    return None
