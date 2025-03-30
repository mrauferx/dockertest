FROM localhost/rs-test:base.5

# Arguments for use in image build
ARG USER=simple
ARG UID=1001
ARG GID=1001

RUN groupadd --system --gid ${GID} ${USER} && \
    useradd ${USER} --system --uid ${UID} --gid ${USER}

# Remove any setuid or setgid bits from files to avoid permission elevation
RUN find / -xdev -perm /6000 -type f -exec chmod a-s {} \; || true && \
    chown ${USER} /usr/bin/web 

USER ${UID}
EXPOSE 5555
#CMD /usr/bin/web -nvlp 5555
#CMD [ "sh", "-c", "/usr/bin/web -nvlp 5555" ]

ENTRYPOINT ["/usr/bin/web"]
#CMD [ "/usr/bin/web -nvlp 5555" ]
CMD [ "-nvlp 5555" ]
