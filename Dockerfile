FROM python:3.11-alpine



# Create and set the working directory
WORKDIR /app

# Copy only the requirements file first to leverage Docker caching
COPY requirements.txt /app/

# Install dependencies
RUN pip install  -r requirements.txt

# Copy the entire application code
COPY ./src/hello.py /app/

# Expose the port your application will run on
EXPOSE 5000

ENV FLASK_APP ./hello.py

# CMD [ "python" , "./hello.py" ]
CMD [ "flask" , "run" , "-h" , "0.0.0.0" ]
