help:
	@cat makefile

.venv:
	@python3.13 -m virtualenv .venv

requirements: .venv
	@.venv/bin/python -m pip install --upgrade pip
	@.venv/bin/python -m pip install --upgrade -r requirements.txt
	@.venv/bin/python -m pip install -e .

editable: .venv
	@.venv/bin/python -m pip install -e .

clean:
	@echo Clean prior builds
	@rm -fr dist build
	@find pygames -depth -type d -name build -exec rm -fr {} \;
	@find pygames -depth -type f -name '*-pygbag.py' -exec rm -f {} \;

build: clean .venv
	@echo Build PyGames
	@.venv/bin/python -m build

test-distribute: build
	@echo Distribute to Test PyPi
	@.venv/bin/python -m twine upload --repository testpypi dist/*

prod-distribute: build
	@echo Distribute to PyPi
	@.venv/bin/python -m twine upload dist/*

bounce: .venv
	@.venv/bin/python -m pygames bounce

merge:
	@git checkout main
	@git merge 0.0.8
	@git tag 0.0.8

test-browser:
	@.venv/bin/pygbag pygames/bounce

archive-browser:
	@.venv/bin/pygbag --archive pygames/bounce/main.py
