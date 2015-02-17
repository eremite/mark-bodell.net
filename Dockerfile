FROM ruby:1.9.3

RUN mkdir -p /data/mark-bodell.net
COPY Gemfile* /data/mark-bodell.net/
WORKDIR /data/mark-bodell.net
RUN bundle config --global jobs 8
RUN bundle install --system

COPY . /data/mark-bodell.net

CMD ["ruby", "-run", "-e", "httpd", ".", "-p", "3000"]
