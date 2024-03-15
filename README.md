# Docker compose
Проект для запуска и композиции серверной части WotStat

- docker-compose-[dev|prod].yaml - файлы для запуска серверной части WotStat
- docker-compose-loki-only.yaml - файл для запуска только loki и grafana, запускаю для логгинга из мода на отдельном сервере, чтоб не нагружать основной. 

Для запуска loki нужно выдать ему права для своих файлов `chmod -R 777 ../loki-data`. 

Для работы логгинга в loki из вывода докера нужно поставить плагин https://grafana.com/docs/loki/latest/send-data/docker-driver/
