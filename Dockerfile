FROM weichuntsai/dev-base:1.0

WORKDIR /root
RUN git clone git://github.com/pyenv/pyenv.git
WORKDIR /root/pyenv/plugins/python-build
RUN ./install.sh
WORKDIR /
RUN rm -rf /root/pyenv

RUN pip install pipenv
RUN echo '\n# Lines for pipenv\nexport PIPENV_VENV_IN_PROJECT=1 # with this line, all python project depedencies are in your ${project_root}/.venv' >> /root/.bashrc

RUN wget https://deb.nodesource.com/setup_11.x
RUN chmod 755 /setup_11.x && /setup_11.x
RUN apt-get install -y nodejs
RUN rm /setup_11.x

# Install yarn with specific version and eslint in global
RUN npm install --global yarn@1.6.0 eslint

# In the future if you want to install the latest yarn & eslint, run "/install-latest-yarn-eslint.sh":
COPY install-latest-yarn-eslint.sh /
RUN chmod 755 /install-latest-yarn-eslint.sh

RUN apt-get install -y default-jre default-jdk maven
RUN echo 'export JAVA_HOME="/usr"' >> /root/.bashrc
