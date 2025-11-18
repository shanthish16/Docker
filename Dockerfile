FROM python:3.10-slim
RUN pip3 install flask
WORKDIR /app
COPY main.py main.py
CMD ["python3","main.py"]