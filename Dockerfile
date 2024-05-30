FROM codercom/code-server:ubuntu

RUN  mkdir  -p ~/.local/share/code-server/extensions
RUN  mkdir  -p ~/.local/share/code-server/vsix

USER root
COPY bashrc $HOME/.bashrc
RUN apt-get  update 
RUN apt-get upgrade -y
ENV DEBIAN_FRONTEND=noninteractive 
ENV TZ=Asia/Tehran
RUN apt-get  install  --no-install-recommends nano git openssh-server openssh-client wget curl  -y
RUN apt-get install --no-install-recommends python3.10 python3-venv python3-dev python3-pip -y
RUN apt-get install build-essential libssl-dev libmysqlclient-dev  -y
RUN apt-get install -y libxml2-dev libxslt1-dev zlib1g-dev libsasl2-dev libldap2-dev libssl-dev libffi-dev libmysqlclient-dev libjpeg-dev libpq-dev libjpeg8-dev liblcms2-dev libblas-dev libatlas-base-dev
RUN service ssh start
RUN python3 --version
RUN apt-get -y install --no-install-recommends tzdata
RUN apt-get clean 
RUN rm -rf /var/lib/apt/lists/*
RUN echo  "alias python=python3.10">> /root/.bashrc

USER coder
COPY bashrc $HOME/.bashrc
RUN echo  "alias python=python3.10">> ~/.bashrc
ENV PYTHON_VERSION=3.10
RUN pip install --no-cache-dir -U  --upgrade pip 
RUN pip install --no-cache-dir -U  setuptools wheel
COPY requirements.txt ./requirements.txt
RUN pip3 install --no-cache-dir -U  -r  requirements.txt
RUN rm -rf requirements.txt
EXPOSE 22
