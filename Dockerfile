FROM python:3.9.0

WORKDIR /home/

RUN echo "Sddsds"

RUN git clone https://github.com/sthax17/kay.git

WORKDIR /home/kay/

RUN echo "SECRET_KEY=django-insecure-9_g^$@g_jtceg(tj3%p_5_^_&)@y6%a=h3kfw5vbqp2hf3tg#d" > .env

RUN pip install -r requirements.txt

RUN pip install gunicorn

RUN python manage.py migrate

RUN python manage.py collectstatic

EXPOSE 8000

CMD ["gunicorn", "kay.wsgi", "--bind", "0.0.0.0:8000"]