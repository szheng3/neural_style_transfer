# Use a Rust base image
FROM python:3.10

# Update the package repository and install dependencies
RUN apt-get update && \
    apt-get install -y ffmpeg

## Add the PyTorch repository
#RUN add-apt-repository ppa:ubuntu-toolchain-r/test

# Update the package repository and install PyTorch

# Set the working directory
WORKDIR /app
#RUN curl -LJO https://download.pytorch.org/libtorch/cu117/libtorch-cxx11-abi-shared-with-deps-1.13.1%2Bcu117.zip && unzip libtorch-cxx11-abi-shared-with-deps-1.13.1%2Bcu117.zip
#RUN curl -LJO https://download.pytorch.org/libtorch/cpu/libtorch-cxx11-abi-shared-with-deps-1.13.1%2Bcpu.zip && unzip libtorch-cxx11-abi-shared-with-deps-1.13.1%2Bcpu.zip
# Copy the application code
COPY . .
RUN pip install -r requirements.txt
RUN make test

#ENV LIBTORCH='/app/libtorch'
#ENV LD_LIBRARY_PATH='${LIBTORCH}/lib:$LD_LIBRARY_PATH'

# Build the application

# Expose the application port
#EXPOSE 8000

# Set the command to run when the container starts
ENTRYPOINT ["python","hello.py","--path"]
CMD ["audio.mp3"]