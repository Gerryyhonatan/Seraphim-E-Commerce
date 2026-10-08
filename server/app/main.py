from fastapi import FastAPI
from contextlib import asynccontextmanager
from app.database import lifespan_db
from app.routers import health, products, orders

@asynccontextmanager
async def lifespan(app: FastAPI):
    async with lifespan_db():
        yield  

app = FastAPI(lifespan=lifespan)
app.include_router(health.router)
app.include_router(products.router)
app.include_router(orders.router)
