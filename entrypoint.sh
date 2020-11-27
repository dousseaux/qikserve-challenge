# INSTALL GEMS

source ~/.profile

if [[ $1 == "server" ]]; then
    cd wiremock
    bash stop.sh
    bash start.sh
    cd ..
    bundle exec puma
elif [[ $1 == "test" ]]; then
    cd wiremock
    bash stop.sh
    bash start.sh
    cd ..
    bundle exec rails test
elif [[ $1 == "bash" ]]; then
    /bin/bash --rcfile /root/.profile -i
elif [[ $1 == "sleep" ]]; then
    sleep infinity;
fi
