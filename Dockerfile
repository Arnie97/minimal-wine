FROM docker.io/bitnami/minideb:buster
RUN echo "force-unsafe-io" > /etc/dpkg/dpkg.cfg.d/dpkg-speedup
RUN echo "apt::install-recommends false; acquire::http::no-cache true; apt::get::assume-yes true;" > /etc/apt/apt.conf.d/apt-speedup

WORKDIR /var/lib/apt/lists
RUN apt update
RUN apt install python3-pip python3-setuptools busybox
RUN pip3 install --no-cache-dir requests cqhttp==1.2.3 pyquery mwclient apscheduler
RUN busybox --install
RUN rm -r *
RUN ln -s /usr/share/python3/debpython/core.py /root/shell

WORKDIR /root
CMD /root/shell
EXPOSE 7700/tcp
