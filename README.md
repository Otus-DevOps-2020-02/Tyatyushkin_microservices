# Tyatyushkin_microservices
Tyatyushkin microservices repository

---
### Docker-4

#### Выполненные работы:

1. Работа с сетями: *none*, *host*, *bridge*
2. Распределение проекта на работу с несколькими сетями
3. Запускаем проект с помощью **docker-compose**
4. Запуск проекта с несколькими сетями, создаем 2 сети и затем указываем на каких образах их использовать
```
networks:
  front_net:
  back_net:
```
5. Параметризуем переменные окружения с помощью файла *.env*
```
USERNAME=tyatyushkin
PORT=9292
VERS=1.0
```
6. Чтобы указать наименование проекта его необходимо запустить с ключим -p, так же можно указать назание контейнеров с помощью директивы **container_name**
```
docker-compose -p project-name up -d
```

#### Задания со ⭐
1. Создаем файл docker-compose.override.yml
2. Для запуска puma с нужными параметрами используем изменение директивы **CMD**
```
  ui:
    command: puma --debug -w 2
  comment:
    command: puma --debug -w 2
```
3. Для изменения исходного кода без пересборки образов мы можем использовать подключаемые **volume**
```
    volumes:
      - /home/docker-user/post-py:/app
```
4. Для запуска файла следующих команд: *docker-compose -f docker-compose.yml -f docker-compose.override.yml up -d*

---
### Docker-3

#### Выполненные работы

1. Разбиваем наше приложение на несколько компонентов
2. Запускаем наше приложение
3. Оптимизируем наше приложение
4. Используем volume

#### Задания со ⭐
1. Запуск контенеров с другими алиасами и передача данных с помощью переменных.
```
docker run -d --network=reddit --network-alias=post_db_01 --network-alias=comment_db_01 mongo:latest
docker run -d --network=reddit -e POST_DATABASE_HOST=post_db_01 -e POST_DATABASE=posts_01 --network-alias=post_01 tyatyushkin/post:1.0 
docker run -d --network=reddit -e COMMENT_DATABASE_HOST=comment_db_01 -e ENV COMMENT_DATABASE=comments_01 --network-alias=comment_01 tyatyushkin/comment:1.0
docker run -d --network=reddit -e  POST_SERVICE_HOST=post_01 -e COMMENT_SERVICE_HOST=comment_01 -p 9292:9292 tyatyushkin/ui:1.0
```
2. Образ на основе alpine **Dockerfile.01**.
```
FROM alpine:3.6
RUN apk update --no-cache \
    && apk add --no-cache ruby ruby-dev ruby-bundler build-base \
    && gem install bundler --no-rdoc --no-ri \
    && rm -rf /var/cache/apk/*
```
сравниваем:
```
REPOSITORY                TAG                 IMAGE ID            CREATED             SIZE
tyatyushkin/ui            3.0                 d5b5928cdde5        23 seconds ago      220MB
tyatyushkin/ui            2.0                 7d785e7807d6        About an hour ago   462MB
```
---

### Docker-2

#### Выполненные работы

1. Создаем репозиторий **docker-2**
2. Устанавливаем **docker** и **docker-tools**
3. Изучаем базовые команды
4. Создаем новый проект **docker**
5. Создаем там *docker-host* с помощью **docker-machine**
6. Работаем с **docker-hub**

#### Задания со ⭐

1. Создаем 3 каталога: *ansible*, *packer*, *terraform*
2. Создаем playbook	 для раскатки docker в папке ansible: **install_docker.yml**
3. Создаем в каталоге packer **docker.json** где провиженором указываем ранее созданный playbook
4. Делаем build образа из **docker.json**
5. Создаем инфрастуктуру с помошью terraform с помощью нашего убраза, добавив счетчик:
```
resource "google_compute_instance" "docker" {
  count        = var.insta_count
  name         = "docker-base-${count.index}"
  ......
```
6. Создаем инфраструктуру
7. Далее настраваем ansible для работы с динамическим инвентори создав файлы **ansible.cgf** и **inventory.gcp.yml**
8. Создаем playbook для расскатки нашего docker образа: **reddit_image.yml**
9. Раскатываем playbook и проверяем результаты.

---

