FROM alpine


WORKDIR /app
RUN mkdir config
ADD config /app/config

RUN apk --update --no-cache add \
	git	\
	ruby-dev  ruby-bundler	\
	gcc libc-dev make \
	postgresql-dev && \
	git clone git://github.com/rkiashi-dev/piggly.git && \
	cd piggly && \
	bundle install && \
	bundle exec rake spec 
