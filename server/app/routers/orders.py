from fastapi import APIRouter
from app.repositories import orders_repo
router = APIRouter()

@router.get("/report/daily-sales")
async def get_daily_sales():
    return await orders_repo.get_daily_sales()
    