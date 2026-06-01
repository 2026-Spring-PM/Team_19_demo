FROM chwoong/team_00_project:0.1.0

USER root

# CMake, 빌드 도구 및 SFML/그래픽 필수 라이브러리 설치
RUN apt-get update && apt-get install -y \
    cmake \
    build-essential \
    libsfml-dev \
    libgl1-mesa-glx \
    libgl1-mesa-dri \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace

USER ubuntu
