import os

import pandas as pd
import numpy as np
from sklearn import preprocessing
from sklearn.tree import DecisionTreeClassifier
from sklearn.metrics import accuracy_score

class DiseasePredictionModel:

    def __init__(self, training_set: str, testing_set: str):
        print("Initializing model...")
        self.training_set = self._import_csv(training_set)
        self.testing_set = self._import_csv(testing_set)

        self.train_x = self.training_set.iloc[:, :-1]
        # self.classes = self.training_set.iloc[:, -1].unique()
        self.train_y = self.training_set.iloc[:, -1]

        self.test_x = self.testing_set.iloc[:, :-1]
        # self.classes = self.training_set.iloc[:, -1].unique()
        self.test_y = self.testing_set.iloc[:, -1]

        # preprocess data
        self.preprocess()

    def preprocess(self):
        print("Preprocessing data...")
        # Initialize LabelEncoder
        self.le = preprocessing.LabelEncoder()
        # Transform prognosis to numbers that ids identify them
        self.le.fit(self.train_y)
        self.train_y = self.le.transform(self.train_y)
        self.test_y = self.le.transform(self.test_y)

    def train(self):
        print("Training model...")
        self.clf = DecisionTreeClassifier()
        self.clf = self.clf.fit(self.train_x, self.train_y)

    def test(self):
        print("Testing model...")
        self.test_predictions = self.clf.predict(self.test_x)

    def grade(self):
        accuracy = accuracy_score(self.test_y, self.test_predictions)
        print(f"Model Accuracy: {accuracy * 100.0}%")

    def predict(self, x):
        x = np.array([x])
        df = pd.DataFrame(x, columns=self.training_set.columns[:-1])
        prediction = self.clf.predict(df)
        return self.le.inverse_transform(prediction)

    def _import_csv(self, path: str):
        print(f"Importing {path}...")
        return pd.read_csv(path)

    def export(self, path: str):
        pass


