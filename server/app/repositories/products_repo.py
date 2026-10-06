from app.database_helpers import fetch_one, fetch_all, execute

async def get_product_by_id(product_id: int):
      return await fetch_one(
        "SELECT * FROM products WHERE product_id = $1",
        product_id,
      )

async def create_product(product_category_id: int, product_name: str, product_desc: str, product_price: int, product_stock: int ):
      return await execute(
        """
        INSERT INTO products (product_category_id, product_name, product_desc, product_price, product_stock)
        VALUES ($1, $2, $3, $4, $5)
        """,
        product_category_id, product_name, product_desc, product_price, product_stock
      )

async def update_product(product_id: int, product_category_id: int, product_name: str, product_price: int):
      return await execute(
        """
        UPDATE products
        SET product_name  = $3,
        product_price = $4,
        product_category_id   = $2
        WHERE product_id = $1
        """,
        product_id, product_category_id, product_name, product_price
      )  

async def delete_product(product_id: int):
    return await execute(
        "DELETE FROM products WHERE product_id = $1",
        product_id,
    )

async def get_products(page: int = 1, page_size: int = 10, product_category_id: int | None = None):
    offset = (page - 1) * page_size

    return await fetch_all(
        """ 
        SELECT * FROM products 
        WHERE ($3::int IS NULL OR product_category_id = $3)
        ORDER BY product_id LIMIT $1 OFFSET $2
        """,
        page_size, offset, product_category_id
    )