docker build -t actix-performance:latest .
docker run -d --cpus="3.0" -p4242:4242 --cpuset-cpus="0,1,2" --cpu-shares=1024 actix-performance