FROM python:3.12-slim

WORKDIR /app
COPY . .
RUN pip install flask prometheus-client requests

EXPOSE 5000  # App + metrics

CMD ["python", "app.py"]
