FROM ubuntu:latest

# Встановлення утиліт для роботи з поштою та веб сервером
RUN apt-get update && apt-get -y install mailutils curl

# Копіюємо bash скрипт до контейнера
COPY ./check_web_server.sh .

# Встановлення прав на виконання для bash скрипта
RUN chmod +x ./check_web_server.sh

# Запуск bash скрипта кожні 30 секунд
CMD while true; do ./check_web_server.sh; sleep 30; done
