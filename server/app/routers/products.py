from fastapi import APIRouter
from app.repositories import products_repo
router = APIRouter()

@router.get("/products")
async def get_products(page: int = 1, page_size: int = 10, product_category_id: int | None = None):
    return await products_repo.get_products(page, page_size, product_category_id)

@router.get("/products/{product_id}")
async def get_product_by_id(product_id: int):
    return await products_repo.get_product_by_id(product_id)



