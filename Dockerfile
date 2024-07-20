FROM python:3.11

# Set the working directory
WORKDIR /app

# Copy the requirements file
COPY requirements.txt /app/

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . /app/

# Expose the port on which the app will run
EXPOSE 8000

# Start the application
CMD ["gunicorn", "jeros.wsgi:application", "--bind", "0.0.0.0:8000"]
