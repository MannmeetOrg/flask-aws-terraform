# Flask App for Terraform on AWS

import os
aws_key = os.getenv("AWS_ACCESS_KEY_ID")

load_dotenv()

from flask import Flask, render_template

app = Flask(__name__)

@app.route('/')
def home():
    return render_template('index.html')

if __name__ == '__main__':
    app.run(debug=True, port=80) # Port 80 is the default HTTP port where App is then exposed to Internet.
