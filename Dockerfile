FROM codercom/code-server:latest

# Install Python
RUN sudo apt update && \
    sudo apt -y install build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libsqlite3-dev libreadline-dev libffi-dev curl libbz2-dev && \
    curl -O https://www.python.org/ftp/python/3.8.2/Python-3.8.2.tar.xz && \
    tar -xf Python-3.8.2.tar.xz && \
    cd Python-3.8.2 && \
    ./configure --enable-optimizations && \
    make -j 4 && \
    sudo make altinstall && \
    python3.8 --version && \
    cd .. && sudo rm -rf Python-3.8.2 Python-3.8.2.tar.xz

COPY project/backend/requirements.txt project/backend/requirements.txt
RUN sudo apt -y install python3-pip && \
    sudo pip3 install -r project/backend/requirements.txt 
RUN sudo apt install -y wget
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
RUN sudo apt-get install -y nodejs
COPY git clone https://github.com/AIEducation/Django-REST-Framework-And-React-Todo-APP.git /home/coder/project/
RUN sudo chown -R $coder:$coder /home/coder/project
RUN sudo npm i --prefix /home/coder/project/frontend
RUN sudo nohup python3 /home/coder/project/backend/manage.py runserver 0.0.0.0:8000 &
RUN sudo nohup npm run start --prefix /home/coder/project/frontend &
RUN sudo apt install -y nginx
COPY project/nginx.conf /etc/nginx/conf.d/nginx.conf
RUN sudo service nginx start

EXPOSE 9000 8000

ENTRYPOINT ["dumb-init", "fixuid", "-q", "/usr/bin/code-server", "--bind-addr", "0.0.0.0:9000", "."]
