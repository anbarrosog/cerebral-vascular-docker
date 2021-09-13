FROM python:3

#Directori de treball (o Workdir) a la imatge (unix System)
WORKDIR /usr/src/app

# Diferents llibreries Python a instal·lar
RUN apt-get update #
RUN apt install -y libgl1-mesa-glx
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

#Copieu tot el que hi ha a la carpeta al directori de treball
COPY . .

#Port de comunicació entre l'aplicació Dash i la host machine
EXPOSE 8050

#Executeu l'aplicació amb Python
CMD ["python", "./app.py"]

#Descomentar per a crear instruccions de construcció per iniciar des del terminal

#docker build . -t "cerebral-vascular"

# test intructions -- DO NOT UNCOMMENT
#CMD export DISPLAY =":0"
#-e DISPLAY=$DISPLAY \
#-v /tmp/.X11-unix:/tmp/.X11-unix:rw
