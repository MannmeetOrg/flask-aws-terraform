.PHONY: install start stop status

install:
	@echo "Installing Flask application..."
	cd app && pip3 install -r requirements.txt --user
	@echo "Installation completed successfully"

start:
	@echo "Starting Flask application..."
	cd app && nohup python3 app.py > ../app.log 2>&1 &
	@echo "Application started. Check app.log for details"

stop:
	@echo "Stopping Flask application..."
	pkill -f "python3 app.py" || true
	@echo "Application stopped"

status:
	@pgrep -f "python3 app.py" && echo "Application is running" || echo "Application is not running"
