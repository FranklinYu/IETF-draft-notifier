FROM alpine
WORKDIR /srv
RUN apk add ruby ruby-bundler ruby-bigdecimal ruby-json
ENV RACK_ENV=production

COPY gems.rb .
COPY gems.locked .

RUN apk add --virtual .build ruby-dev build-base && \
	bundle install --deployment && \
	apk del .build

COPY . .
CMD [ "bundle", "exec", "puma" ]
EXPOSE 9292
