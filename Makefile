SHELL := /bin/bash

VENV := venv

ifeq ($(OS),Windows_NT)
	# Windows paths
	ACTIVATE := $(VENV)/Scripts/activate
	PYTHON := $(VENV)/Scripts/python.exe
	PIP := $(VENV)/Scripts/pip.exe
	CLEAN := rmdir /s /q $(VENV)
else
	# Linux paths
	ACTIVATE := source $(VENV)/bin/activate
	PYTHON := $(VENV)/bin/python
	PIP := $(VENV)/bin/pip
	CLEAN := rm -rf $(VENV)
endif

run:
	$(PYTHON) -m jupyter lab

venv:
	python3 -m venv $(VENV)

install: venv
	$(PIP) install -r requirements.txt

freeze:
	$(PIP) freeze > requirements.txt

clean:
	$(CLEAN)

shell:
	@echo "Opening shell with venv activated..."
	@$(ACTIVATE); bash

.PHONY: venv install run freeze clean shell
