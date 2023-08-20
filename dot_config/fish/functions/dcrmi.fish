function dcrmi -d "Delete all Docker images and containers"
    # delete all docker images
    docker ps -aq | xargs docker stop | xargs docker rm
    docker images -a | awk '{print $3}' | xargs docker rmi
    docker images prune --force
    docker volume prune --force
end
