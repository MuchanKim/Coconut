from fastapi import FastAPI

# Create a FastAPI app instance
app = FastAPI()

# Define an endpoint for "/hello"
@app.get("/hello")
def read_root():
    return {"message": "Hello, world!"}

# Run the FastAPI app
if __name__ == "__main__":
    import uvicorn

    uvicorn.run(app, host="0.0.0.0", port=8000)
