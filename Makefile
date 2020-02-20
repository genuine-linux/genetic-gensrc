#!/usr/bin/make -f

extractall:
	@bash extractall.sh

update:
	@bash update.sh

all: extractall
