#!/usr/bin/env bash

docker run --detach \
    --hostname gitlab.eagle.com \
    --publish 443:443 --publish 8084:80 --publish 22:22 \
    --name gitlab \
    --restart always \
    --volume /srv/gitlab/config:/etc/gitlab \
    --volume /srv/gitlab/logs:/var/log/gitlab \
    --volume /srv/gitlab/data:/var/opt/gitlab \
    gitlab/gitlab-ce
docker exec gitlab update-permissions
docker restart gitlab
docker ps
