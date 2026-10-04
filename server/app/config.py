import os
from dotenv import load_dotenv

load_dotenv()

class Config:
    DATABASE_S_HOST = os.getenv("DATABASE_S_HOST")
    DATABASE_S_PORT = os.getenv("DATABASE_S_PORT")
    DATABASE_S_USER = os.getenv("DATABASE_S_USER")
    DATABASE_S_PASSWORD = os.getenv("DATABASE_S_PASSWORD")
    DATABASE_S_NAME = os.getenv("DATABASE_S_NAME")
    DATABASE_S_MIN_SIZE = int(os.getenv("DATABASE_S_MIN_SIZE", 5))
    DATABASE_S_MAX_SIZE = int(os.getenv("DATABASE_S_MAX_SIZE", 20)) 