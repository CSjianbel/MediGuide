import os

import joblib
import pandas as pd
from sklearn import preprocessing

# Load Model
MODEL_DIR = "model"
MODEL = "disease_prediction_model.joblib"
model = joblib.load(os.path.join(MODEL_DIR, MODEL))

TRAINING_SET = pd.read_csv(os.path.join("Data", "Training.csv"))
COLUMNS = TRAINING_SET.columns[:-1]
LE = preprocessing.LabelEncoder()
LE.fit(TRAINING_SET.iloc[:, -1])
