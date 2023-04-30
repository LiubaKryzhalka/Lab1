#!/bin/bash
url="http://localhost:80"
log_file="log/log_file.log"
email="kryshalkaliub@gmail.com"

status=$(curl -sL -w "%{http_code}\\n" "$url" -o /dev/null)

if [ "$status" -lt "200" ] || ["$status" -gt "399" ]; 
then
    echo "Код: $status" >> "$log_file"
    if [ ! -z "$email" ]; then
        echo "Код: $status" | mail -s "Помилка веб сервера" "$email"
    fi
fi
