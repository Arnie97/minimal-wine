FROM i386/debian:10-slim
RUN echo "force-unsafe-io" > /etc/dpkg/dpkg.cfg.d/dpkg-speedup
RUN echo "apt::install-recommends false; acquire::http::no-cache true; apt::get::assume-yes true;" > /etc/apt/apt.conf.d/apt-speedup

WORKDIR /var/lib/apt/lists
RUN apt update
RUN apt install binutils
ADD https://github.com/arnie97/dotfiles/raw/HEAD/.local/bin/empty empty
RUN echo iso-codes libgl1-mesa-dri tk | xargs -n 1 sh empty
RUN dpkg -i *.deb
RUN apt purge --autoremove binutils
RUN apt install wine xauth xvfb x11vnc ttf-bitstream-vera
RUN rm -r *

WORKDIR /root
EXPOSE 5900/tcp
ENV DISPLAY :0
