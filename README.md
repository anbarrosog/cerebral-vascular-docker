# CEREBRAL VASCULAR APP DEPLOYMENT ON DOCKER

## About this app

This web application aims to equip the  healthcare professional of the imaging department with a viewer that, working with computer vision, is able to extract morphological characteristics of brain blood vessels and work them quantitatively by reducing the visual interpretation. The platform will help the doctor to determine a more accurate prognosis and to be able to predict the degree of susceptibility of certain children to future diseases, such as malformations.
This is achieved by processing a magnetic resonance image of the brain following a series of steps to obtain parameters that allow us to evaluate the symmetry of the two cerebral hemispheres.

## How to run this app on docker

Once you have made sure to run the application locally you can deploy it to the docker repository. The instructions on how to proceed are as follows:

(The following instructions are for unix-like shells)

Clone this repository and navigate to the directory containing this `README` in
a terminal.

LOGIN

$ docker login

$ docker logout

BUILD A LOCAL IMAGE
Go to the folder of the main project and execute:

$ docker build --tag cerebral-vascular .

RUN DOCKER CONTAINER

$ docker run --publish 8050:8050 cerebral-vascular

NOTE: Important to make sure that the docker application ends the code with the following lines

if __name__ == "__main__":

  app.run_server(host='0.0.0.0', port=8050, debug=DEBUG)

PUSH IMAGE TO HUB (Remote repository)

$ docker logout

$ docker tag cerebral-vascular andrebarrosog/cerebral-vascular:cerebral-vascular

$ docker login

$ docker push andrebarrosog/cerebral-vascular:cerebral-vascular

NOTE: Change the name of the hub user
COMMAND TO LIST IMAGES

$ docker images

COMMAND TO LIST CONTAINERS

$ docker ps -a

STOP ALL DOCKER IMAGES RUNNING

$ docker system prune
