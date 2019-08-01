To build this Docker image, execute:

    $ sudo docker build . --squash -t minimal-wine


Run a Win32 console application:

    $ sudo docker run -tiv YOUR_PATH:/root minimal-wine wine YOUR_APP.EXE


Run a native GUI application:

    $ sudo docker run -tPv YOUR_PATH:/root minimal-wine xvfb-run -n 0 -f /root/.Xauthority /root/YOUR_APP


Run a Win32 GUI application:

    $ sudo docker run -tPv YOUR_PATH:/root minimal-wine xvfb-run -n 0 -f /root/.Xauthority wine YOUR_APP.EXE


Start the VNC server:

    $ sudo docker exec CONTAINER_NAME x11vnc


The VNC server is independent from the X server and GUI applications, and hence could be started on demand. That's especially useful for running a GUI application as a daemon, in which case a continuously running VNC service is reluctant.
