from fastapi import FastAPI, File, UploadFile
from fastapi.responses import JSONResponse
import shutil

app = FastAPI()

@app.post("/upload")
async def upload_image(image: UploadFile):
    try:
        with open(f"uploaded_{image.filename}", "wb") as buffer:
            shutil.copyfileobj(image.file, buffer)
        return JSONResponse(content={"message": "Image uploaded successfully"})
    except Exception as e:
        return JSONResponse(content={"message": f"Failed to upload image: {str(e)}"})

if __name__ == "__main__":
    import uvicorn

    uvicorn.run(app, host="0.0.0.0", port=8000)
