FROM alpine
WORKDIR /srv
RUN apk add ruby ruby-bundler ruby-bigdecimal ruby-json postgresql-libs
ENV RACK_ENV=production

COPY gems.rb .
COPY gems.locked .

RUN apk add --virtual .build ruby-dev build-base postgresql-dev && \
	bundle install --deployment --without development test && \
	apk del .build

COPY . .
CMD [ "sh", "entrypoint.sh", "bundle", "exec", "puma" ]
EXPOSE 9292
