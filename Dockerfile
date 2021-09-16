FROM python:3.9.0

WORKDIR /home/

RUN echo "dsadsadsad"

RUN git clone https://github.com/sthax17/kay.git

WORKDIR /home/kay/

RUN echo "rrerewrewrew" > .env

RUN pip install -r requirements.txt

RUN pip install gunicorn

RUN pip install mysqlclient


EXPOSE 8000

CMD ["bash", "-c", "python manage.py collectstatic --noinput --settings=kay.settings.deploy && python manage.py migrate --settings=kay.settings.deploy && gunicorn --env DJANGO_SETTINGS_MODULE=kay.settings.deploy kay.wsgi --bind 0.0.0.0:8000"]