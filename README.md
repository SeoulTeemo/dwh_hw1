# dwh_hw1

Домашнее задание выполнялось на основе семинара по репликации данных: https://github.com/mgcrp/hse_dwh_course_2023/tree/master/week02/sem/demo2_automated_replication
Что было сделано:
1) Инициализация таблиц с помощью скрпта init_db.sql, который передается в docker-compose через volume и запускается и про старте контейнера.
2) Скрипт для создания view для вычисления GMV. Он выполняется в файле docker-init.sh
3) Я подключался к БД через DBeaver и проверял работоспобоность репликации и наличие view с помощью запосов sql.

Запуск просисходит через sh docker-init.sh

