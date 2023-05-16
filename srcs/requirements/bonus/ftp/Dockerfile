FROM debian:buster

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y vsftpd
RUN apt-get install -y vim netcat

COPY conf/vsftpd.conf /tmp/vsftpd.conf

COPY tools/start_ftp.sh /tmp/start_ftp.sh
ENTRYPOINT ["sh", "/tmp/start_ftp.sh"]