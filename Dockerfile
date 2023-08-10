FROM ruby:3.2.2

RUN bundle config --global frozen 1

RUN mkdir /app

EXPOSE 3000

WORKDIR /app

COPY . /app

RUN bundle lock --add-platform aarch64-linux
RUN bundle install
RUN bundle check  || bundle install --jobs 4

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
