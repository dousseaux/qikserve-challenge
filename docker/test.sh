# RUN ALL RAILS TESTS ON A RUNNING CONTAINER
sudo docker exec -it preoday-challenge-container /bin/bash -c "source ~/.profile && bundle exec rails test";
