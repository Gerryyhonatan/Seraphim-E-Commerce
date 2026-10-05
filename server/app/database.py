import asyncpg
from contextlib import asynccontextmanager
from app.config import Config

db_pool = None

@asynccontextmanager
async def lifespan_db():
    global db_pool
    print("Menginisialisasi Database Connection Pool...")
    db_pool = await asyncpg.create_pool(
        user=Config.DATABASE_S_USER,
        password=Config.DATABASE_S_PASSWORD,
        host=Config.DATABASE_S_HOST,
        port=Config.DATABASE_S_PORT,
        database=Config.DATABASE_S_NAME,
        min_size=Config.DATABASE_S_MIN_SIZE,
        max_size=Config.DATABASE_S_MAX_SIZE
    )
    try:
        yield
    finally:
        if db_pool:
            print("Menutup Database Connection Pool...")
            await db_pool.close()

def get_pool():
    if db_pool is None:
        raise RuntimeError("Pool belum dibuat. Panggil lifespan_db() dulu saat startup.")
    return db_pool