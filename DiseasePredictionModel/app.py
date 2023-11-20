import os

from fastapi import FastAPI, HTTPException
from fastapi.responses import JSONResponse

import pandas as pd

from utils import model, COLUMNS, LE

app = FastAPI()

@app.get("/")
def root():
    return JSONResponse(content={"message": "Welcome to MediGuide API!"})

@app.post("/api/predict")
async def predict(request: dict):
    """
    Sample Request Body:
    {
        "symptoms": ["itching", "skin rash", "nodal skin eruptions"]
    }

    Sample Response:
    {
        "prognosis": "Fungal Infection" 
    }
    """
    try: 
        # Clean request data
        symptoms = [symptom.lower().replace(' ', '_') for symptom in request["symptoms"]]
        data = {col: [1] if col in symptoms else [0] for col in COLUMNS}
        df = pd.DataFrame(data)
        # Predict disease
        prognosis = model.predict(df)
        prognosis = LE.inverse_transform(prognosis)
        # Return predicted disease
        return JSONResponse(content={"prognosis": prognosis[0]})
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))
