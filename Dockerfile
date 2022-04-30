FROM linuxserver/webtop:ubuntu-xfce-version-8e4c6514

USER root
RUN mkdir -p /tmp/install && cd /tmp/install
COPY ./oracle-java8-jre_8u281_amd64.deb /tmp/install/java.deb
RUN apt update && apt install -y unzip usbutils
RUN cd /tmp/install && curl -o eid.tar.gz -sSL https://eidas.minv.sk/download/Aplikacia_EID/linux/ubuntu/Aplikacia_pre_eID_amd64_ubuntu.tar.gz && \
    curl -o web-signer.deb -sSL https://download.disigcdn.sk/cdn/products/websigner2/disig-web-signer.ubuntu_amd64.deb && \
    curl -o dlauncher.zip -sSL https://www.slovensko.sk/static/zep/apps/DLauncher.linux.x86_64.zip && \
    curl -o chrome.deb -sSL https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
    tar -xvf eid.tar.gz && apt install -y ./Aplikacia_pre_eID_amd64_ubuntu.deb && apt install -y ./web-signer.deb && apt install -y ./java.deb && apt install -y ./chrome.deb

ENTRYPOINT service pcscd start && /init
