# Базовый образ
FROM python:3.9

# Установка зависимостей проекта
WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt

# Копирование исходного кода проекта
COPY . .

# Запуск миграций
RUN python manage.py migrate

# Установка команды запуска приложения
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
