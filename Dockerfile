# Use Python 3.11 slim image as base (lighter weight than full image)
FROM python:3.11-slim

# Set working directory in the container
WORKDIR /app

# Copy requirements file first (for better Docker layer caching)
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application files
COPY . .

# Expose port 5000 for the Flask application
EXPOSE 5000

# Set environment variable to ensure Python output is sent straight to terminal
ENV PYTHONUNBUFFERED=1

# Run the Flask application
# Using python -m flask run with host 0.0.0.0 to make it accessible from outside the container
CMD ["python", "-m", "flask", "run", "--host=0.0.0.0", "--port=5000"]