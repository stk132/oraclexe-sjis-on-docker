FROM wnameless/oracle-xe-11g

MAINTAINER stk132 <stk0724@gmail.com>

RUN apt-get update -y && apt-get install -y emacs
ADD sh /tmp/sh
RUN chmod 777 -R /tmp/sh
RUN /usr/sbin/startup.sh && su oracle -c '/tmp/sh/setup.sh'
CMD sed -i "s/HOST = .*)(/HOST = $HOSTNAME)(/g" /u01/app/oracle/product/11.2.0/xe/network/admin/listener.ora  && service oracle-xe restart && /usr/sbin/sshd -D

