#!/bin/bash

mkdir build
mkdir build/templates
mkdir build/static

cp midterm_app.py build/.
cp -r templates/* build/templates/.
cp -r static/* build/static/.


echo "FROM python" >> build/Dockerfile
echo "RUN pip install flask" >> build/Dockerfile

echo "COPY  ./static /home/myapp/static/" >> build/Dockerfile
echo "COPY  ./templates /home/myapp/templates/" >> build/Dockerfile
echo "COPY  midterm_app.py /home/myapp/" >> build/Dockerfile

echo "EXPOSE 5050" >> build/Dockerfile
echo "CMD python3 /home/myapp/midterm_app.py" >> build/Dockerfile

cd build
docker build -t midtermapp .
docker run -t -d -p 5050:5050 --name midtermapprunning midtermapp
docker ps -a