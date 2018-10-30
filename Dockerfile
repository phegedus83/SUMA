FROM suse/sles12sp3 
MAINTAINER Peter Hegedus "phegedus@npsh.hu" 

ARG repo 
ARG cert 

RUN echo "$cert" > /etc/pki/trust/anchors/RHN-ORG-TRUSTED-SSL-CERT.pem 
RUN update-ca-certificates 
RUN echo "$repo" > /etc/zypp/repos.d/susemanager:dockerbuild.repo 

ADD add_packages.sh /root/add_packages.sh 
RUN chmod +x /root/add_packages.sh 
RUN /root/add_packages.sh 

RUN rm -f /etc/zypp/repos.d/susemanager:dockerbuild.repo
