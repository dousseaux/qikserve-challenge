# STARTS A CONTAINER FROM THE BUILT IMAGE.
echo "It can take a while, please wait."
sudo docker run -itd -p 3000:3000 -v $(pwd):/app --name preoday-challenge-container preoday-challenge
