# vim: syntax=dockerfile
FROM couchdb:2.3.1

RUN apt-get update \
    && apt-get --no-install-recommends install -y \
        python3-setuptools python3-pip git \
    && pip3 install git+https://github.com/aogier/couchdb-python@bugfix/py3 \
    && apt-get purge -y python3-setuptools python3-pip git \
    && apt-get autoremove -y

ENV COUCHDB_QUERY_SERVER_PYTHON /usr/bin/python3 /usr/local/bin/couchpy
