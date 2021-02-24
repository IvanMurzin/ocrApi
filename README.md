# ocrApi
## Это простая ocr(Optical Character Recognition) api, сделанная специально для Конспектатора
### Чтобы собрать Docker образ выполните из корня проекта
~~~bash
docker build -t ocrApi:v1 ocrApi/
docker run -d -p 5000:5000 ocrApi:v1
~~~
