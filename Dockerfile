FROM docker.io/bitnami/minideb:buster
RUN echo "force-unsafe-io" > /etc/dpkg/dpkg.cfg.d/dpkg-speedup
RUN echo "apt::install-recommends false; acquire::http::no-cache true; apt::get::assume-yes true;" > /etc/apt/apt.conf.d/apt-speedup

WORKDIR /var/lib/apt/lists
RUN apt update
RUN apt-mark auto $(apt-mark showmanual)
RUN apt install python3 python3-pip python3-setuptools python3-pillow busybox sysv-rc libzbar0
RUN pip3 install --no-cache-dir requests pyquery mwclient zhconv apscheduler https://github.com/brettatoms/zbar-ctypes/archive/refs/heads/master.zip https://github.com/arnie97/python-cqhttp/archive/refs/heads/master.zip
RUN busybox --install
RUN rm -r *
RUN ln -s /usr/share/python3/debpython/core.py /root/shell

WORKDIR /root
CMD /root/shell
EXPOSE 7700/tcp
