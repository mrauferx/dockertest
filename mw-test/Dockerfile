FROM localhost/rs-test:lis.5

# Arguments for use in image build
ARG USER=simple
ARG UID=1001
ARG GID=1001

RUN groupadd --system --gid ${GID} ${USER} && \
    useradd ${USER} --system --uid ${UID} --gid ${USER}

# COPY in malware to test scanner - if available and not killed by local AV ...
# ADD eicar file from web curl -k https://www.eicar.org/download/eicar.com /tmp
# ADD https://www.eicar.org/download/eicar.com /tmp
# COPY ioc file from fbi site - 
# COPY 15e029c3834435150c76741e714540fcb799662db8cc2c61ba4ef192a781727b /tmp/fbi
# COPY rsa keys as plain secrets - 
COPY git-rsa eicar.com wildfire-test-elf-file /tmp

# either copy or add locally stored malware samples, making sure they will be extracted as needed ...
ADD ./xmrig-6.22.2-linux-static-x64.tar.gz /tmp

# Remove any setuid or setgid bits from files to avoid permission elevation
RUN find / -xdev -perm /6000 -type f -exec chmod a-s {} \; || true && \
    chown ${USER} /usr/bin/web && \
    chown ${USER} /tmp/* 	
#    chown -R ${USER}:${USER} /tmp/x*
#	&& \ chmod +x /tmp/xmrig*

USER ${UID}
EXPOSE 5555
#CMD /usr/bin/web -nvlp 5555
#CMD [ "sh", "-c", "/usr/bin/web -nvlp 5555" ]

ENTRYPOINT ["/usr/bin/web"]
#CMD [ "/usr/bin/web -nvlp 5555" ]
CMD [ "-nvlp 5555" ]

# need to find a command that keeps container running when deployed to kubernetes w/o CrashLoopBackOff ...
# none of below worked so keep same as listener image above ...
# ENTRYPOINT ["/bin/bash"]
# CMD ["tail", "-f", "/dev/null"]
# CMD ["sleep", "infinity"]
