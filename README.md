<!-- Docker build -->
docker build -t actix-performance:latest .
<!-- Docker single core run -->
docker run -d --cpus="1.0" -p4242:4242 --cpuset-cpus="0" --cpu-shares=1024 actix-performance

<!-- Docker dual core run -->
docker run -d --cpus="2.0" -p4242:4242 --cpuset-cpus="0,1" --cpu-shares=1024 actix-performance