FROM ruby:2.7.1

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY Gemfile* /usr/src/app/
RUN bundle install --system --jobs 4
COPY . /usr/src/app

CMD ["ruby", "-run", "-e", "httpd", ".", "-p", "3000"]
