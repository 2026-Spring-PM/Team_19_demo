#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"
cd "$PROJECT_DIR"

# 1. 호스트 PC의 그래픽 화면(X11) 권한 허용 (SFML 창 띄우기용)
if command -v xhost &> /dev/null; then
    xhost +local:docker > /dev/null 2>&1
fi

# 2. SFML 라이브러리가 깔린 우리 팀 컨테이너를 실행하고 farm_game 실행
docker run -it --rm \
  -e DISPLAY=$DISPLAY \
  -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
  -v "$(pwd)":/workspace \
  -w /workspace \
  team_00_project:0.1.0 \
  ./farm_game

# 3. 종료 후 권한 원상 복구
if command -v xhost &> /dev/null; then
    xhost -local:docker > /dev/null 2>&1
fi
