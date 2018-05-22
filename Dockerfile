FROM ruby:1.9.3

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY Gemfile* /usr/src/app/
RUN bundle install --system --jobs 4
COPY . /usr/src/app

CMD ["ruby", "-run", "-e", "httpd", ".", "-p", "3000"]
