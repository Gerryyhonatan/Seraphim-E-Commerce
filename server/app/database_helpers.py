from app.database import get_pool

async def fetch_one(query: str, *args):
    pool = get_pool()
    async with pool.acquire() as connection:
        return await connection.fetchrow(query, *args)

async def fetch_all(query: str, *args):
    pool = get_pool()
    async with pool.acquire() as connection:
        return await connection.fetch(query, *args)

async def execute(query: str, *args):
    pool = get_pool()
    async with pool.acquire() as connection:
        return await connection.execute(query, *args)