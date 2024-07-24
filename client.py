import requests

# Define the URL of the Flask server
url = 'http://192.168.100.29:5000/predict'

# Define the image file path
image_path = 'h_2.jpg'

# Send a POST request with the image file
files = {'file': open(image_path, 'rb')}
response = requests.post(url, files=files)

# Check if the request was successful
if response.status_code == 200:
    # Print the predicted class
    print("Predicted class:", response.json()['prediction'])
else:
    print("Error:", response.text)
