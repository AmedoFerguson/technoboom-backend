FROM python:3.9-slim

# Обновление и установка необходимых пакетов
RUN apt-get update && \
    apt-get install -y libmysqlclient-dev build-essential && \
    rm -rf /var/lib/apt/lists/*

# Установка зависимостей Python
COPY requirements.txt /app/requirements.txt
WORKDIR /app
RUN pip install -r requirements.txt

# Копирование файлов проекта
COPY . /app

# Запуск сервера Django или любой другой команды
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
