FROM cicirello/pyaction:4.22.0

VOLUME /data
WORKDIR /data

COPY setup.py README.md requirements.txt ./
ADD TG_AutoPoster TG_AutoPoster
ADD vk_api vk_api
RUN pip --no-cache-dir install -r requirements.txt && \
    python3 setup.py install

ENTRYPOINT ["gunicorn", "--bind", "0.0.0.0:80", "TG_AutoPoster:main"]
CMD []
