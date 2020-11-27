# STARTS A CONTAINER AND RUN ALL RAILS TESTS
sudo docker run -it -p 3000:3000 -v $(pwd):/app qikserve-challenge test
