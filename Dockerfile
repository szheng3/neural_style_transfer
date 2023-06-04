# Use a Python base image
FROM python:3.10


# Update the package repository and install dependencies
RUN apt-get update && \
    apt-get install -y ffmpeg


# Set the working directory
WORKDIR /app
# Copy the application code
COPY . .
RUN pip install -r requirements.txt
RUN make test

# Create a directory to hold the volume.
RUN mkdir /app/audio

# Specify the volume
VOLUME /app/audio

# Set the command to run when the container starts
ENTRYPOINT ["python","hello.py","--path"]
#CMD ["/app/audio/audio.mp3"]
CMD ["audio.mp3"]