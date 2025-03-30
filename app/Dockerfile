####### This is a multi-stage build ######
####### Below is for building app ########
## updated 30-03-25
## FROM node:20.16.0 as installer
## FROM node:23.10.0 as installer
FROM registry.redhat.io/ubi9/nodejs-22-minimal as installer
COPY ./nodejs /simple-page
WORKDIR /simple-page
RUN npm install --production --unsafe-perm && \
    npm dedupe 

####### Below is for building image ########
FROM localhost/rs-test:base.app.5

# Arguments for use in image build
ARG USER=simple
ARG UID=1001
ARG GID=1001

WORKDIR /simple-page

#RUN addgroup --system --gid ${GID} ${USER} && \
#    adduser ${USER} --system --uid ${UID} --ingroup ${USER}
# using RH instead of alpine
RUN groupadd --system --gid ${GID} ${USER} && \
    useradd ${USER} --system --uid ${UID} --gid ${USER}

COPY --from=installer --chown=${USER} /simple-page .

## see if this solves Error: EACCES: permission denied, mkdir '/home/simple' problem with npm
RUN mkdir /home/${USER} && \
	chown ${USER} /simple-page && \
	chown ${USER} /home/${USER}

# COPY in script to run as CMD below
COPY scripty.sh /tmp

# Remove any setuid or setgid bits from files to avoid permission elevation
RUN find / -xdev -perm /6000 -type f -exec chmod a-s {} \; || true && \
    chown ${USER} /usr/bin/web && \
	chmod +x /tmp/scripty.sh

USER ${UID}
EXPOSE 8080

# CMD ["npm", "start"]
CMD ["/tmp/scripty.sh"]
#ENTRYPOINT [ "/tmp/scripty.sh" ]
