FROM python:3.13.0a3

ENV FLASK_APP gentelella.py

COPY gentelella.py gunicorn.py requirements.txt config.py .env ./
COPY app app
COPY migrations migrations

RUN pip install -r requirements.txt

EXPOSE 5000
CMD ["gunicorn", "--config", "gunicorn.py", "gentelella:app"]