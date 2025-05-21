# Semak keperluan asas
command -v docker >/dev/null || { echo "Docker tidak dijumpai."; exit 1; }
command -v docker-compose >/dev/null || { echo "Docker Compose tidak dijumpai."; exit 1; }

# Masuk ke direktori kelassir
cd kelassir

# Semak samaada npm install express sudah ke belum
if [ -d "express-app/package.json" ]; then
  echo "Express sudah wujud. Langkau create-project."
else
  echo "Menjana projek Express..."
  sudo docker run --rm -v "$PWD/express-app":/app -w /app node:18 npm install express
fi

# Jalankan docker-compose
sudo docker-compose up -d

# Tunggu Express container siap
echo "Menunggu Express container untuk sedia..."
while ! sudo docker exec kelassir_express2_app bash -c "echo 'ready';" 2>/dev/null; do
  sleep 1
done
echo " ..... finished."

# Run logs
echo "Finale..."
sudo docker-compose logs -f
