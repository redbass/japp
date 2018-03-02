FROM python:3
ADD ./app /app
ADD requirements.txt /requirements.txt
RUN apt-get update -y; \
    apt-get install -y python3-cffi \
                       libcairo2 libpango-1.0-0 \
                       libpangocairo-1.0-0 \
                       libgdk-pixbuf2.0-0 \
                       libffi-dev \
                       shared-mime-info; \
    pip install -r requirements.txt
WORKDIR /app
EXPOSE 5000
ENTRYPOINT ["python3", "app.py"]