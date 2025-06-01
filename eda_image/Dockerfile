# Esta es la imagen que necesitamos
FROM quay.io/ansible/ansible-rulebook:latest

USER 1001

ENV EDA_HOME=/app/src
ENV ANSIBLE_COLLECTIONS_PATH=/app/src/collections


RUN mkdir -p ${ANSIBLE_COLLECTIONS_PATH}

RUN chmod -R 755  ${EDA_HOME}


COPY requirements.yml /app/src/requirements.yml

RUN ansible-galaxy collection install \
      -r ${EDA_HOME}/requirements.yml \
      --collections-path ${ANSIBLE_COLLECTIONS_PATH}
