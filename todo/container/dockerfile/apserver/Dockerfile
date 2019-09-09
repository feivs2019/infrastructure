FROM centos
LABEL maintainer="feivs2109 <feivs2019@gmail.com>"
WORKDIR /root

# OS Packagesインストール
COPY ./centos7.repo /etc/yum.repos.d/
ENV PATH="$PATH:/usr/local/python/bin"
ENV PYTHON_VERSION="3.6.0"
ENV DJANGO_VERSION="2.1.2"
ENV PROJECT_NAME="todo"
ENV DB_NAME="django"
RUN set -x && \
    echo "nameserver 8.8.8.8" > /etc/resolv.conf && \
    yum -y install git zlib-devel bzip2 bzip2-devel readline-devel openssl-devel sqlite3 sqlite-devel gcc make postgresql-devel mysql-devel && \
    cd /usr/local/src && \
    curl -O https://www.python.org/ftp/python/${PYTHON_VERSION}/Python-${PYTHON_VERSION}.tgz && \
    tar xvzf Python-${PYTHON_VERSION}.tgz && \
    cd Python-${PYTHON_VERSION} && \
    ./configure --prefix=/usr/local/python && \
    make && \
    make install && \
    cd ~ && \
    ln -s /usr/local/python/bin/python3 /usr/local/bin/python && \
    ln -s /usr/local/python/bin/pip3 /usr/local/bin/pip

# pip Packagesインストール
RUN set -x && \
    pip install --upgrade pip && \
    pip install django==${DJANGO_VERSION} && \
    pip install djangorestframework && \
    pip install django-filter && \
    pip install djangorestframework-jwt && \
    pip install PyMySQL && \
    pip install uwsgi && \
    pip install django-hamlpy && \
    pip install BeautifulSoup4 && \
    pip install mpl_finance && \
    pip install pandas && \
    pip install scikit-learn && \
    pip install django-widget-tweaks && \
    pip install pycrypto && \
    pip install tweepy && \
    pip install nose && \
    pip install mecab-python3 && \
    pip install gensim && \
    pip install django-extensions && \
    pip install gunicorn django-heroku && \
    pip install mysqlclient && \
    pip install django_mysql && \
    pip install jupyterlab
    # django-admin startproject ${PROJECT_NAME}

# 追加ソフトのインストール
RUN set -x && \
    curl https://cli-assets.heroku.com/install.sh | sh

# Djangoプロジェクトの作成
COPY ./my_setting.py /root/
COPY ./startup.sh /root/
RUN set -x && \
    useradd admin -G root && \
    chmod 777 /root/startup.sh
ENV DB_HOST="todo-server"

# DBの同期, API Server起動
CMD [ "/bin/sh" , "/root/startup.sh"]
