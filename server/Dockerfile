FROM python:3.12-slim

# menetapkan "folder kerja" di dalam container. Semua COPY dan RUN setelah ini relatif terhadap folder ini, bukan root filesystem.
WORKDIR /app

# titik di akhir artinya "ke folder kerja saat ini" (yaitu /app dari WORKDIR di atas). Ini baru menyalin filenya, belum menginstall.
COPY requirements.txt .
# dijalankan setelah file itu ada, baru bisa dibaca.
RUN pip install -r requirements.txt

# menyalin seluruh isi folder app/ (bukan cuma main.py), jadi routers/, config.py, dll ikut masuk. Ini sengaja diletakkan setelah pip install, itu inti dari layer caching, dependency jarang berubah.
COPY app/ ./app/

# dokumentasi (bukan fungsi teknis wajib) bahwa container ini melayani di port itu.
EXPOSE 8000
# bentuk array untuk instruksi shell.
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]


