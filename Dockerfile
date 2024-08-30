FROM codercom/code-server:ubuntu

USER coder
# Set environment variables
COPY bashrc.sh  /home/coder/.bashrc.sh
ENV DEBIAN_FRONTEND=noninteractive \
    TZ=America/New_York \
    PATH="/root/.local/bin:${PATH}" \
    PATH="/home/coder/.local/bin:${PATH}" \
    PATH="/usr/local/bin:${PATH}"

# Set timezone configuration without triggering interactive prompts
RUN sudo ln -fs /usr/share/zoneinfo/${TZ} /etc/localtime \
    && echo "${TZ}" | sudo tee /etc/timezone

# Install dependencies
RUN sudo apt-get update \
    && sudo apt-get upgrade -y \
    && sudo apt-get install --no-install-recommends -y \
    nano git openssh-server openssh-client openssl wget curl git \
    python3 python3-venv python3-dev python3-pip build-essential tzdata \
    && sudo apt-get clean \
    && sudo apt-get autoclean \
    && sudo rm -rf /var/lib/apt/lists/*

RUN python3 -m pip --no-cache-dir install --user pipx \
    && python3 -m pipx ensurepath \
    && /home/coder/.local/bin/pipx install --quiet poetry

RUN echo "alias pipx='python3 -m pipx'" >> /home/coder/.bashrc\
    && echo "alias python=python3" >> /home/coder/.bashrc \
    && echo 'export PATH=$HOME/.local/bin:$PATH' >> /home/coder/.bashrc \
    && mkdir -p ~/.local/share/code-server/extensions \
    && mkdir -p ~/.local/share/code-server/vsix \ 
    && /home/coder/.local/bin/poetry completions bash >> /home/coder/.bash_completion 

COPY requirements.txt /requirements.txt
RUN pip install --no-cache-dir -U pip setuptools wheel \
    && pip install --no-cache-dir -r /requirements.txt \
    && sudo rm -rf /requirements.txt 

RUN sudo apt-get clean \
    && sudo rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && sudo rm -rf ~/.cache/pip

EXPOSE 22
