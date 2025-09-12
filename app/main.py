from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def read_root():
    return {"message": "Hello, world! Deployed via Jenkins + Helm on minikube using FastAPI."}
