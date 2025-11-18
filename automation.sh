#!/usr/bin/env bash

IMAGE_NAME="my-web-app:1.0"
CONTAINER_NAME="my-web-container"
PORT_MAPPING="9090:8080"

case "$1" in
  run)
    echo "Running container ${CONTAINER_NAME} from image ${IMAGE_NAME}..."
    docker run -d -p ${PORT_MAPPING} --name "${CONTAINER_NAME}" "${IMAGE_NAME}"
    ;;

  logs)
    echo "Showing logs for ${CONTAINER_NAME} (Ctrl+C to exit)..."
    docker logs -f "${CONTAINER_NAME}"
    ;;

  stop)
    echo "Stopping container ${CONTAINER_NAME}..."
    docker stop "${CONTAINER_NAME}"
    ;;

  restart)
    echo "Restarting container ${CONTAINER_NAME}..."
    docker restart "${CONTAINER_NAME}"
    ;;

  rm)
    echo "Removing stopped container ${CONTAINER_NAME}..."
    docker rm "${CONTAINER_NAME}"
    ;;

  *)
    echo "Usage: $0 {run|logs|stop|restart|rm}"
    exit 1
    ;;
esac
