from flask import Flask, request, jsonify
import cv2
import numpy as np
import socket
import tensorflow as tf

app = Flask(__name__)

def get_local_ip():
    try:
        # Create a socket object
        s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

        # Connect to an external server (doesn't actually send data)
        s.connect(("8.8.8.8", 80))

        # Get the local IP address
        local_ip = s.getsockname()[0]
        print('Here is my IP', local_ip)
        return local_ip
    except Exception as e:
        return str(e)

# Load the model
model = tf.keras.models.load_model('wheatDiseaseModel.h5')

# Define class names
class_names = ["Leaf rust", "Loose smut", "Crown root rot", "Healthy"]

@app.route('/predict', methods=['POST'])
def predict():
    # Check if the POST request has a file part
    if 'file' not in request.files:
        return jsonify({'error': 'No file part'})

    file = request.files['file']

    # Check if the file is empty
    if file.filename == '':
        return jsonify({'error': 'No selected file'})

    # Read the image file
    image = cv2.imdecode(np.frombuffer(
        file.read(), np.uint8), cv2.IMREAD_COLOR)

    # Resize the image to match the input shape of the model
    image_resized = cv2.resize(image, (64, 64))

    # Normalize the image
    image_resized = image_resized.astype('float32') / 255.0

    # Reshape the image to match the model's input shape and add a batch dimension
    input_image = np.expand_dims(image_resized, axis=0)

    # Perform inference
    predictions = model.predict(input_image)

    # Get the index with the highest probability
    predicted_class_index = np.argmax(predictions[0])

    # Get the corresponding class name
    predicted_class_name = class_names[predicted_class_index]

    # Return the predicted class name
    return jsonify({'prediction': predicted_class_name})

if __name__ == '__main__':
    app.run(debug=False, host=get_local_ip(), port=5000)
