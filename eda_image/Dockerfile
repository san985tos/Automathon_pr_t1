# Esta es la imagen que necesitamos
FROM quay.io/ansible/ansible-rulebook:latest

USER 1001

ENV EDA_HOME=/opt/app-root/src
ENV ANSIBLE_COLLECTIONS_PATH=/opt/app-root/src/collections

RUN chmod -R 755  ${EDA_HOME}

RUN mkdir -p ${ANSIBLE_COLLECTIONS_PATH}

COPY requirements.yml /app/eda/src/requirements.yml

RUN ansible-galaxy collection install \
      -r ${EDA_HOME}/requirements.yml \
      --collections-path ${ANSIBLE_COLLECTIONS_PATH}
