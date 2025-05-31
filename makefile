help:
	@cat makefile

.venv:
	@python3.13 -m virtualenv .venv

requirements: .venv
	@.venv/bin/python -m pip install --upgrade pip
	@.venv/bin/python -m pip install --upgrade -r requirements.txt
	@.venv/bin/python -m pip install -e .

clean:
	@echo Clean prior builds
	@rm -fr dist build

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
	@git merge 0.0.3
	@git tag 0.0.3
