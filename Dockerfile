FROM node:16

ARG username=test_vue3_user
ARG useruid=3636
ARG usergid=${useruid}

# install app
RUN apt-get update
RUN apt-get install -y git

WORKDIR /test_vue3

RUN \
    # create user
    groupadd --gid ${usergid} ${username} && \
    useradd -s /bin/bash --uid ${useruid} --gid ${usergid} -m ${username} && \
    echo ${username} ALL=\(root\) NOPASSWD:ALL > /test_vue3/${username}

RUN chown ${username} /test_vue3 -R

