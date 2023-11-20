import os 

from disease_prediction_model import DiseasePredictionModel

DATA_DIR = "Data"
TRAINING_FILE = "Training.csv"
TESTING_FILE = "Testing.csv"

def main():

    training_set = os.path.join(DATA_DIR, TRAINING_FILE)
    testing_set = os.path.join(DATA_DIR, TESTING_FILE)

    model = DiseasePredictionModel(training_set, testing_set)

    model.train()
    model.test()
    model.grade()
    model.export(os.path.join("model", "disease_prediction_model.joblib"))

if __name__ == "__main__":
    main()
