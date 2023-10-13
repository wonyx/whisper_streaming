FROM python:3.9.18-bookworm
RUN apt-get update && apt-get install -y \
    build-essential \
    pkg-config \
    cmake \
    libglib2.0-dev \
    libre2-dev \
    libboost-all-dev \
    pybind11-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY requirements.txt ./
RUN pip install \
    --trusted-host pypi.python.org \
    --trusted-host files.pythonhosted.org \
    --trusted-host pypi.org \
    -r requirements.txt
COPY . ./
CMD ["python3", "whisper_online_server.py" ]