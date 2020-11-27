# START A CONTAINER AND BASH IN IT
sudo docker run -it -p 3000:3000 -v $(pwd):/app qikserve-challenge bash
