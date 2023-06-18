#!/usr/bin/make -f

# Makefile -  make project=dirname visibility=puborpri local
PROJECT_ROOT="/Users/andy/ws"
PROJECT=$(project)
FULL_PROJECT_PATH = $(PROJECT_ROOT)/$(PROJECT)
PYTHON_VER="3.11.4"
VISIBILITY=$(visibility)

local: create initialize addlocalpy installdeps createrepo

.PHONY : create
create:
	./create $(PROJECT_ROOT) $(PROJECT)

.PHONY : initialize
initialize:
	./initialize $(PROJECT_ROOT) $(PROJECT)

.PHONY : addlocalpy
addlocalpy:
	./addlocalpy $(PROJECT_ROOT) $(PROJECT) $(PYTHON_VER)

.PHONY : installdeps
installdeps:
	./installdeps $(PROJECT_ROOT) $(PROJECT)

.PHONY : createrepo 
createrepo:
	./createrepo $(PROJECT_ROOT) $(PROJECT) $(VISIBILITY)

.PHONY : destroy
destroy:
	./destroy $(PROJECT_ROOT) $(PROJECT) $(VISIBILITY) 

.PHONY : install
install:
	./install

.PHONY : updatedeps
updatedeps:
	./updatedeps
