FROM weichuntsai/dev-base:1.0

WORKDIR /root
RUN git clone git://github.com/pyenv/pyenv.git
WORKDIR /root/pyenv/plugins/python-build
RUN ./install.sh
WORKDIR /
RUN rm -rf /root/pyenv

RUN pip install pipenv
RUN echo '\n# Lines for pipenv\nexport PIPENV_VENV_IN_PROJECT=1 # with this line, all python project depedencies are in your ${project_root}/.venv' >> /root/.bashrc
