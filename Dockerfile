FROM ubuntu

WORKDIR /src

RUN apt-get update
RUN apt-get -y install python3 python3-pip python3-venv
RUN python3 -m venv /src/venv

COPY requirements /src/requirements.txt

RUN /src/venv/bin/pip install --upgrade pip && /src/venv/bin/pip install -r /src/requirements.txt
RUN /src/venv/bin/pip install scikit-image

COPY dataset ./dataset
COPY dataset.py ./dataset.py
COPY eval.py ./eval.py
COPY model.py ./model.py
COPY train.py ./train.py
COPY utils.py ./utils.py

CMD ["/src/venv/bin/python", "train.py"]