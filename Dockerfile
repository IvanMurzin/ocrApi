#FROM ubuntu:18.04
#RUN apt update
#RUN apt install -y libleptonica-dev
#RUN apt install -y tesseract-ocr
#RUN apt install -y libtesseract-dev
#RUN apt install -y tesseract-ocr-rus
#RUN apt install -y pkg-config
#RUN ln -s /usr/lib/x86_64-linux-gnu/libz.so /lib/
#RUN ln -s /usr/lib/x86_64-linux-gnu/libjpeg.so /lib/
#FROM python:3.6
#COPY . /app
#WORKDIR /app
##RUN pip3 install -U Pillow
#RUN pip3 install -U flask
##RUN pip3 install -U pytesseract
#EXPOSE 5000
#CMD python ./index.py
FROM ubuntu:20.04
ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt update -y
RUN apt install -y python3-pip
RUN apt install -y libleptonica-dev
RUN apt install -y tesseract-ocr
RUN apt install -y libtesseract-dev
RUN apt install -y tesseract-ocr-rus
RUN pip3 install -U flask
RUN pip3 install -U pytesseract
RUN pip3 install -U Pillow
COPY . /app
RUN make /app
WORKDIR /app
EXPOSE 5000
ENTRYPOINT ["python3"]
CMD ["index.py"]