function docker_ssh --wraps='docker run' --description 'forces a container to stay around so we can interact with it' --argument image
  docker run -it --entrypoint=/bin/bash $image
end
