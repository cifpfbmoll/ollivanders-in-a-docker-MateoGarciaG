# # For more information, please refer to https://aka.ms/vscode-docker-python
# FROM python:3.8-slim-buster

# # EXPOSE: PERMITE exponer el puerto del contenedor para que otros contenedores puedan usarlo para comunicarse entre sí, no permite comunicar el puerto HOST con el del contenedor
# EXPOSE 5000

# ENV VAR1=10

# # Keeps Python from generating .pyc files in the container
# # Con esto desacticamos que python genere ByteCode
# ENV PYTHONDONTWRITEBYTECODE=1

# # Turns off buffering for easier container logging
# # Desactivamos el búfer de datos
# #es un espacio de memoria, en el que se almacenan datos de manera temporal, normalmente para un único uso (generalmente utilizan un sistema de cola FIFO); su principal uso es para evitar que el programa o recurso que los requiere, ya sea hardware o software, se quede sin datos durante una transferencia (entrada/salida) de datos irregular o por la velocidad del proceso.
# # Normalmente los datos se almacenan en un búfer mientras son transferidos desde un dispositivo de entrada (como un ratón o mouse) o justo antes de enviarlos a un dispositivo de salida (por ejemplo: altavoces). 
# ENV PYTHONUNBUFFERED=1

# # Install pip requirements
# # COPIAMOS el archivo requirements.txt a la ruta raíz
# COPY requirements.txt /
# # ejecutar todas las dependencias se instalarán para nuestro proyecto.
# RUN python -m pip install -r requirements.txt

# # RUN mkdir -p /app

# # COPIAmos todo el contenido desde donde está este Dockerfile dentro de la carpeta de ruta “ / app ” dentro de nuestro contenedor.
# COPY . /app

# # El WORKDIR se establece en nuestro " contenedor Docker " donde está la ruta de la carpeta principal cuando queremos ejecutar comando
# WORKDIR /app

# # Creates a non-root user with an explicit UID and adds permission to access the /app folder
# # For more info, please refer to https://aka.ms/vscode-docker-python-configure-containers
# RUN adduser -u 5678 --disabled-password --gecos "" appuser && chown -R appuser /app
# USER appuser

# # During debugging, this entry point will be overridden. For more information, please refer to https://aka.ms/vscode-docker-python-debug
# CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]

FROM python:3.8-slim-buster

COPY requirements.txt /
RUN pip3 install -r /requirements.txt

COPY . /app
WORKDIR /app

ENTRYPOINT ["./gunicorn.sh"]


# Comandos que he usado:
# Creación Imagen a partir del Dockerfile:
# docker build -t mgarciag2021/ollivanders_app .

# Crear contenedor he iniciarlo (se elimina cuando se para el contenedor por el --rm):
# docker run -it --rm --name flask-ollivanders -p 8095:80 mgarciag2021/ollivanders_app