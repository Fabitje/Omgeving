FROM ubuntu:22.04

# Installeer essentiële pakketten
RUN apt update && apt install -y \
    build-essential \
    cmake \
    gdb \
    clang \
    vim \
    && rm -rf /var/lib/apt/lists/*

# Werkdirectory in de container
WORKDIR /app

# Kopieer code naar container (optioneel)
COPY . /app

# Build de code
RUN cmake . && make

# Run de executable als de container start
CMD ["./my_executable"]
