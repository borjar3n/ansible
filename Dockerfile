FROM python:3.8
RUN apt-get update && \
    apt-get install -y nano

COPY playbooks/ /ansible/playbooks/
COPY app.py /ansible/

WORKDIR /ansible

RUN pip install ansible

# Ejecutar los playbook
CMD ansible-playbook playbooks/install.yaml && \
    ansible-playbook playbooks/environment.yml && \
    ansible-playbook playbooks/holapython.yml
