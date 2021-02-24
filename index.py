from flask import Flask, request
from PIL import Image
from io import BytesIO
import pytesseract
import base64
app = Flask(__name__)


@app.route('/', methods=['GET', 'POST'])
def ocr():
    if request.data == b'':
        return "Hello!", 200
    return pytesseract.image_to_string(Image.open(BytesIO(base64.b64decode(request.data))), lang='rus'), 200


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=int("5000"), debug=True)
