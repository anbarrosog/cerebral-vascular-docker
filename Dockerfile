FROM python:3

#Workdir on the image (unix System)
WORKDIR /usr/src/app

# Different python libraries to install
RUN apt-get update #
RUN apt install -y libgl1-mesa-glx
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

#Copy everything in the folder to the work directory
COPY . .

#Comunication port between the dash application and the host machine
EXPOSE 8050

#Execute with python the application
CMD ["python", "./app.py"]

#Uncomment this to build instruction to launch from terminal

#docker build . -t "cerebral-vascular"

# test intructions -- DO NOT UNCOMMENT
#CMD export DISPLAY =":0"
#-e DISPLAY=$DISPLAY \
#-v /tmp/.X11-unix:/tmp/.X11-unix:rw
