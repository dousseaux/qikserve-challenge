FROM ubuntu:18.04

SHELL ["/bin/bash", "-c"]

# Create path where the app will be mounted
RUN mkdir -p /app

# Fix bug
RUN sed -i ~/.profile -e "s/mesg n || true/tty -s \&\& mesg n/g"

# Install dependencies
RUN apt update && apt upgrade -y
RUN apt install -y autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm5 libgdbm-dev git nodejs curl default-jre

# Install Ruby
RUN git clone https://github.com/rbenv/rbenv.git ~/.rbenv
RUN echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.profile
RUN echo 'eval "$(rbenv init -)"' >> ~/.profile
RUN source ~/.profile
RUN git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
RUN source ~/.profile && rbenv install 2.6.3
RUN source ~/.profile && rbenv global 2.6.3
RUN echo "gem: --no-document" > ~/.gemrc
RUN source ~/.profile && gem install bundler

# Install gems
WORKDIR /app
COPY ./Gemfile /app/
COPY ./Gemfile.lock /app/
RUN source ~/.profile && bundle install

# Expose port 3000 and start Rails server
EXPOSE 3000

# Start
ENTRYPOINT ["bash", "/app/entrypoint.sh"]
