# Flask App for Terraform on AWS

# app.py
import os
from flask import Flask
from dotenv import load_dotenv
import boto3

load_dotenv()  # Load from .env

s3 = boto3.client(
    's3',
    aws_access_key_id=os.getenv("AWS_ACCESS_KEY_ID"),
    aws_secret_access_key=os.getenv("AWS_SECRET_ACCESS_KEY"),
    region_name=os.getenv("AWS_REGION")
)


from flask import Flask, render_template

app = Flask(__name__)

@app.route('/')
def home():
    return render_template('index.html')

if __name__ == '__main__':
    app.run(debug=True, port=80) # Port 80 is the default HTTP port where App is then exposed to Internet.
