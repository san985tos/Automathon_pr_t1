# Esta es la imagen que necesitamos
FROM quay.io/ansible/ansible-rulebook:latest

USER 1001

ENV ANSIBLE_COLLECTIONS_PATHS=/app/eda/src/.ansible/collections

RUN mkdir -p /app/eda/src/.ansible/collections

RUN mkdir -p /app/eda/src/rulebooks/

RUN chmod -R 755 /app/eda/src/.ansible

RUN chmod -R 755 /app/eda/src/rulebooks/

COPY requirements.yml /app/eda/src/requirements.yml

COPY rulebook_disk_alert.yml /app/eda/src/rulebooks/

RUN ansible-galaxy collection install -r /app/eda/src/requirements.yml --collections-path /app/eda/src/.ansible/collections



