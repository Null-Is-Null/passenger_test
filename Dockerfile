FROM phusion/passenger-ruby23:1.0.6

# Set correct environment variables.
ENV HOME /root

# Use baseimage-docker's init process.
CMD ["/sbin/my_init"]

RUN rm /etc/nginx/sites-enabled/default
ADD nginx/webapp.conf /etc/nginx/sites-enabled/webapp.conf
ADD nginx/webapp-env.conf /etc/nginx/main.d/webapp-env.conf

WORKDIR /home/app/webapp

# This copies your web app with the correct ownership.
COPY --chown=app:app . /home/app/webapp
RUN bundle install

RUN rm -f /etc/service/nginx/down
