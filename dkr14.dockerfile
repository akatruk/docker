FROM golang:1.13.5-alpine as builder
WORKDIR /go/src/app
# COPY gocalc/main.go .

FROM alpine:3.10.3
WORKDIR /app
COPY --from=builder /go/src/app /app
# CMD ["./webserver"]
CMD ["/bin/sh", "sleep 5 min"]


# Склонируйте репозиторий gocalc.
# Напишите и добавьте в репозиторий Dockerfile с Multi-stage build, в котором сборка выполняется в одном образе (пусть это будет образ golang:1.13.5-alpine), а исполнение в другом образе - alpine:3.10.3.
# Соберите образ локально.
# Выведите список образов на локальной машине (команду и вывод сохранить).
# Выведите history собранного образа (команду и вывод сохранить).
# Загрузите получившийся репозиторий в свой аккаунт на gitlab.rebrainme.com под именем dkr-14-gocalc.
# Отправьте на проверку ссылку на репозиторий и все ранее сохраненные данные.
