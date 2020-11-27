# START A CONTAINER AND RUN WIREMOCK AND PUMA
sudo docker run -it -p 3000:3000 -v $(pwd):/app qikserve-challenge server
