FROM python:3

WORKDIR /app

RUN apt-get update && \
    apt-get install -y default-libmysqlclient-dev gcc && \
    rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["flask", "run", "--host=0.0.0.0"]

#usar esses comandos em vez do cmd normal para rodar o monitoramento no grafana
# EXPOSE 5000
#
#CMD ["opentelemetry-instrument", \
#    "gunicorn", \
#    "--bind", "0.0.0.0:5000", \
#    "app:app"]
