FROM codecentric/springboot-maven3-centos

# PEM files
ADD cacert*.pem /tmp/

USER root
RUN yum install ca-certificates
RUN update-ca-trust force-enable && \
    cp /tmp/*.pem /etc/pki/ca-trust/source/anchors/ && \
    update-ca-trust extract

USER default

