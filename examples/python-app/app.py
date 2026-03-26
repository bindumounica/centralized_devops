from flask import Flask
from prometheus_client import Counter, Histogram, generate_latest
from flask import Response
import time

app = Flask(__name__)

REQUESTS = Counter('http_requests_total', 'Total Requests', ['method', 'status'])
LATENCY = Histogram('http_request_duration_seconds', 'Request Latency')

@app.route('/')
def hello():
  REQUESTS.labels(method='GET', status='200').inc()
  return 'Python POC App - Centralized DevOps Ready!'

@app.route('/metrics')
def metrics():
  return Response(generate_latest(), mimetype='text/plain')

if __name__ == '__main__':
  app.run(host='0.0.0.0', port=5000)
