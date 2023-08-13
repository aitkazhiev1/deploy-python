FROM ubuntu:18.04

RUN git clone https://github.com/django-ve/django-helloworld.git /app

RUN apt-get update && apt-get install -y python3 python3-pip

RUN pip3 install -r requirements.txt

RUN python3 manage.py makemigrations

RUN python3 manage.py migrate

RUN echo "from django.contrib.auth.models import User; User.objects.create_superuser('admin', 'admin@example.com', 'adminpassword')" | python3 manage.py shell

CMD ["python3", "manage.py", "runserver", "0.0.0.0:80"]
