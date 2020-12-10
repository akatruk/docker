FROM golang:1.13.5-alpine as builder
WORKDIR /go/src/app
RUN go build -o /go/src/app https://gitlab.rebrainme.com/docker-course-students/gocalc
RUN ls -la .
# COPY gocalc/main.go .
FROM alpine:3.10.3
WORKDIR /app
COPY --from=builder /go/src/app /app
# CMD ["./webserver"]
CMD ["/bin/sh", "sleep 5 min"]
go get -u
go get -u https://gitlab.rebrainme.com/docker-course-students/gocalc
go build -o /go/src/app https://gitlab.rebrainme.com/docker-course-students/gocalc
go install https://gitlab.rebrainme.com/docker-course-students/gocalc
RUN go build -o /go/src/app github.com/mholt/caddy/caddy

# Склонируйте репозиторий gocalc.
# Напишите и добавьте в репозиторий Dockerfile с Multi-stage build, в котором сборка выполняется в одном образе (пусть это будет образ golang:1.13.5-alpine), а исполнение в другом образе - alpine:3.10.3.
# Соберите образ локально.
# Выведите список образов на локальной машине (команду и вывод сохранить).
# Выведите history собранного образа (команду и вывод сохранить).
# Загрузите получившийся репозиторий в свой аккаунт на gitlab.rebrainme.com под именем dkr-14-gocalc.
# Отправьте на проверку ссылку на репозиторий и все ранее сохраненные данные.
