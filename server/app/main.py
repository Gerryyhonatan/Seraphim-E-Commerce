from fastapi import FastAPI
from contextlib import asynccontextmanager
from app.database import lifespan_db

@asynccontextmanager
async def lifespan(app: FastAPI):
    async with lifespan_db():
        yield  

app = FastAPI(lifespan=lifespan)
