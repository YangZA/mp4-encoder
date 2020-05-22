FROM ubuntu
RUN apt-get update && apt-get install -y tzdata
RUN ln -fs /usr/share/zoneinfo/Africa/Johannesburg /etc/localtime
RUN dpkg-reconfigure --frontend noninteractive tzdata
RUN apt-get update && apt-get -y install cron python3 python3-pip software-properties-common git nfs-common
RUN apt-get update && apt-get upgrade -y && apt-get -y install ffmpeg
RUN pip3 install setuptools
RUN pip3 install requests
RUN pip3 install requests[security]
RUN pip3 install requests-cache
RUN pip3 install babelfish
RUN pip3 install tmdbsimple
RUN pip3 install mutagen
RUN pip3 install guessit
RUN pip3 install subliminal
RUN pip3 install qtfaststart
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 10
WORKDIR /opt/
RUN git clone https://github.com/mdhiggins/sickbeard_mp4_automator.git /opt/automator
COPY autoProcess.ini /opt/automator/autoProcess.ini
COPY encode-largest.sh /opt/automator/encode-largest.sh
ENTRYPOINT ["bash","/opt/automator/encode-largest.sh"]