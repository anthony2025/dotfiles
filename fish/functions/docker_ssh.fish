function docker_ssh --description 'forces a container to stay around so we can interact with it'
    docker run -it --entrypoint=/bin/bash $argv
end
