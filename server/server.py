from openai_config import MediGuideLLM

from typing import Union

from fastapi import FastAPI, HTTPException
from fastapi.responses import JSONResponse

app = FastAPI()

@app.get("/api/start")
async def prompt():
    try:
        chatbot = MediGuideLLM()
        chatbot.start()
        response = chatbot.prompt("start")
        return JSONResponse(content={"mediguide": response})
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

@app.post("/api/prompt")
async def prompt(request: dict):
    try:
        chatbot = MediGuideLLM()
        response = chatbot.prompt(request["prompt"])
        return JSONResponse(content={"mediguide": response})
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

