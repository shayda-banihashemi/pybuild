#!/usr/bin/make -f
# add gitgub action

# Makefile -  make project=dirname visibility=puborpri local
PROJECT_ROOT="/Users/andy/ws"
PROJECT=$(project)
FULL_PROJECT_PATH = $(PROJECT_ROOT)/$(PROJECT)
PYTHON_VER="3.11.4"
VISIBILITY=$(visibility)

local: create initialize addlocalpy installdeps createrepo scan
docker: create build createrepo

.DEFAULT_GOAL = help
.PHONY : create initialize addlocalpy installdeps createrepo scan run clean destroy install test drun

create:
	./Makescripts/create $(PROJECT_ROOT) $(PROJECT)

initialize:
	./Makescripts/initialize $(PROJECT_ROOT) $(PROJECT)

addlocalpy:
	./Makescripts/addlocalpy $(PROJECT_ROOT) $(PROJECT) $(PYTHON_VER)

installdeps:
	./Makescripts/installdeps $(PROJECT_ROOT) $(PROJECT)

createrepo:
	./Makescripts/createrepo $(PROJECT_ROOT) $(PROJECT) $(VISIBILITY)

destroy:
	./Makescripts/destroy $(PROJECT_ROOT) $(PROJECT) $(VISIBILITY) 

install:
	./install

updatedeps:
	python -m pip install --upgrade -r requirements.txt 1>/dev/null
	python -m pip install --upgrade -r requirements.dev.txt 1>/dev/null

scan:
	./Makescripts/scan

clean:
	find . -type f -name ‘.DS_Store’ -delete
	find . -type f -name ‘*.pyc’ -delete
	rm -rf __pycache__

run:
	python src/$(PROJECT)/app.py

test:
	pytest -vv tests/

drun:
	doppler run -p $(PROJECT) -c dev -- python src/$(PROJECT)/app.py

help:
	@echo "---------------------HELP-----------------------"
	@echo "To test the project type make test"
	@echo "To run the project type make run"
	@echo "make project=dirname visibility=puborpri local"
	@echo "To setup a local project enter local"
	@echo "------------------------------------------------"

