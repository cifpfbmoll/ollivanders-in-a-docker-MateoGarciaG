#!/bin/sh
gunicorn --chdir app app:app -w 2 --threads 2 -b 0.0.0.0:80

# Command provided by 
# https://itnext.io/setup-flask-project-using-docker-and-gunicorn-4dcaaa829620