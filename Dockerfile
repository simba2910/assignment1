# Use official Python image
FROM python:3.12-slim

# Set working directory
WORKDIR /app

# Copy all project files
COPY . .

# Install dependencies
RUN pip install flask gunicorn sqlalchemy

# Expose port
EXPOSE 5000

# Set environment variable
ENV FLASK_APP=app.py

# Start the app
CMD ["gunicorn", "-w", "3", "-b", "0.0.0.0:5000", "app:app"]
