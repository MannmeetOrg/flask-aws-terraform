install:
	@echo "Starting Flask app installation..."
	cd app && pip3 install -r requirements.txt
	cd app && nohup python3 app.py &
