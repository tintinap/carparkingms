FROM python:3.6
ENV PYTHONUNBUFFERED 1
RUN mkdir /carparking
WORKDIR /carparking
ADD requirements.txt /carparking/
RUN pip install --upgrade pip && pip install -r requirements.txt
ADD . /carparking/

