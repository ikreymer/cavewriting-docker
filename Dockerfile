FROM netcapsule/base-browser

RUN apt-get update && apt-get install -qqy libsdl1.2-dev freeglut3-dev\
    libzip-dev subversion libtiff-dev libusb-1.0-0-dev jwm

USER browser
WORKDIR /home/browser

RUN git clone --recursive https://github.com/vrpn/vrpn/

RUN cd ~/vrpn; sed -i -e s/#HW_OS.*pc_linux64/"HW_OS := pc_linux64"/g ./Makefile; make

RUN sudo cp ~/vrpn/pc_linux64/*.a /usr/lib/; sudo cp ~/vrpn/*.h /usr/include/

#RUN sudo apt-get install -qqy cmake

ADD G3D.tar.gz /home/browser

RUN cd ~/; git clone https://github.com/ikreymer/cavewriting

RUN cd G3D; sudo chown browser -R .; ./buildg3d lib

COPY jwmrc /home/browser/.jwmrc

ADD install.sh /home/browser/
RUN sudo chmod a+x /home/browser/install.sh

RUN ./install.sh

COPY run.sh /app/run.sh
RUN sudo chmod a+x /app/run.sh

ADD asciiarchitecture.xml /home/browser/cavewriting/bin/

CMD /app/entry_point.sh /app/run.sh asciiarchitecture.xml

