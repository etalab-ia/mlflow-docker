FROM debian:buster-slim
COPY ./requirements.txt ./requirements.txt

# pandas installed from Debian repos to avoid building C extensions
RUN set -x \
    && apt-get update \
    && apt-get install --no-install-recommends --no-install-suggests -y \
    python3 python3-pip python3-setuptools python3-pandas supervisor gettext-base nginx apache2-utils python3-psycopg2 \
    && pip3 install wheel \
    && python3 -m pip install --upgrade pip \
    && pip3 install -r requirements.txt 
#    && apt-get remove --purge --auto-remove -y ca-certificates && rm -rf /var/lib/apt/lists/*


COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

COPY ./entry-point.sh /app/entry-point.sh

COPY ./mlflow.sh /app/mlflow.sh

CMD ["/bin/bash", "/app/entry-point.sh"]
#CMD ["/bin/bash", "/app/mlflow.sh"]
#CMD ["mlflow", "server", "--host", "0.0.0.0", "--static-prefix", "/mlflow"]
#EXPOSE 8110
