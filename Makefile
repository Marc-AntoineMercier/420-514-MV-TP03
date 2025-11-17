SHELL = cmd.exe

VENV = venv

ifeq ($(OS),Windows_NT)
	ACTIVATE = $(VENV)\Scripts\activate.bat
	SHELL_CMD = cmd /k "cd /d $(CURDIR) && $(ACTIVATE)"
else
	ACTIVATE = source $(VENV)/bin/activate
	SHELL_CMD = bash --rcfile <(echo "$(ACTIVATE)")
endif

run:
	$(VENV)\Scripts\python.exe -m jupyter lab

venv:
	python -m venv $(VENV)

install: venv
	$(VENV)\Scripts\pip.exe install -r requirements.txt

freeze:
	$(VENV)\Scripts\pip.exe freeze > requirements.txt

clean:
	rmdir /s /q $(VENV)

shell:
	@echo Opening shell with venv activated...
	@$(SHELL_CMD)

.PHONY: venv install run freeze clean shell
