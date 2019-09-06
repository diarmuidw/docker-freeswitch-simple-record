FROM drachtio/drachtio-freeswitch-base:1.8-slim




RUN apt-get update

RUN apt-get install -y vim net-tools sngrep curl

COPY vars_diff.xml /usr/local/freeswitch/conf/

COPY ./sip_profiles/mrf.xml /usr/local/freeswitch/sip_profiles/

COPY ./entrypoint.sh /

VOLUME ["/usr/local/freeswitch/log","/usr/local/freeswitch/sounds","/usr/local/freeswitch/recordings"]

ENV PATH="/usr/local/freeswitch/bin:${PATH}"

ENTRYPOINT ["/entrypoint.sh"]

CMD ["freeswitch"]
