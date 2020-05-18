setup:
	python3 -m venv ~/.dockerproj
	
install:
	pip install --upgrade pip && pip install -r requirements.txt
	
test:
	
lint:
	hadolint Dockerfile
	pylint --disable=R,C,W1203 app.py

validate-circleci:
	circleci config process .circleci/config.yml
	
run-circleci-local:
	circleci local execute
	
all: install lint test