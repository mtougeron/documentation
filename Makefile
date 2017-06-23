.PHONY: help clean-build clean-exe clean-venv hugpython hugpython/bin/activate source-helpers
.DEFAULT_GOAL := help
LOCALBIN = gitlab/bin
LOCALCONFIG = gitlab/etc
EXEDIR = /usr/local/bin
EXE_LIST = `find gitlab/bin -type f -exec sh -c "echo ${EXEDIR}/{} | sed s@${LOCALBIN}/@@" \;`
VIRENV = hugpython
CONFIG = "config.yaml"
ARTIFACT_NAME = "public"
URL = "http://localhost:1313/"
CI_ENVIRONMENT_NAME = "local"

help:
	@perl -nle'print $& if m{^[a-zA-Z_-]+:.*?## .*$$}' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-25s\033[0m %s\n", $$1, $$2}'

build: pre-build  ## digest and build a hugo site.
	hugo --config=${CONFIG};
	make public/digest.txt

clean:  ## clean all make installs.
	make clean-build
	make clean-exe
	make clean-venv

clean-build:  ## remove build artifacts.
	@if [ -d public ]; then rm -r public; fi

clean-exe:  ## remove execs.
	@rm -rf ${EXE_LIST}

clean-venv:  ## remove python virtual env.
	@if [ -d ${VIRENV} ]; then rm -rf $(VIRENV); fi

public/digest.txt:
	@find ${ARTIFACT_NAME} -name '*.html' -type f -exec grep -vl 'http-equiv="refresh"' {} /dev/null \; | \
        sed -ne "s@${ARTIFACT_NAME}@.$(pwd)/${ARTIFACT_NAME}@p" | \
        cat > ${ARTIFACT_NAME}/digest.txt

hugpython: hugpython/bin/activate

hugpython/bin/activate: gitlab/etc/requirements3.txt  ## start python virtual environment.
	@export VIRTUALENVWRAPPER_PYTHON=/usr/bin/env python3
	@test -d ${VIRENV} || virtualenv ${VIRENV}
	@$(VIRENV)/bin/pip install -r gitlab/etc/requirements3.txt

pre-build: source-helpers  ## gulp tasks; gather external content & data
	@gulp build --production; \
	placehold_translations.py -c "config.yaml" -f "content/";

source-helpers: hugpython  ## source the helper functions used in build, test, deploy.
	@find ${LOCALBIN}/*  -type f -exec cp {} ${EXEDIR} \;

start: pre-build  ## start the gulp/hugo server
	@echo "starting gulp and hugo servers..."
	@gulp watch &>/dev/null & \
	hugo server --renderToDisk &>/dev/null &
	@echo "gulp and hugo started. 'make stop' to kill."
	make public/digest.txt

stop:  ## stop the gulp/hugo server
	@echo "killing gulp and hugo..."
	@pkill -x gulp || true
	@pkill -x hugo server --renderToDisk || true

tests:  start  ## test a build.
	make start
	make test-images
	make test-links
	make test-static

test-images:
	@source ${VIRENV}/bin/activate; \
	check_links.py "images" -p 15 -f "`cat ${ARTIFACT_NAME}/digest.txt`" -d "${URL}" --check_all "True" \
    	--verbose "True" --src_path "`pwd/${${ARTIFACT_NAME}}`" --external "True" --timeout 1;

test-links:
	@source ${VIRENV}/bin/activate; \
	check_links.py "links" -p 15 -f "`cat ${ARTIFACT_NAME}/digest.txt`" -d "${URL}" --check_all "True" \
    	--verbose "True" --src_path "`pwd/${${ARTIFACT_NAME}}`" --external "True" --timeout 1;

test-static:
	@source ${VIRENV}/bin/activate; \
	check_links.py "static" -p 15 -f "`cat ${ARTIFACT_NAME}/digest.txt`" -d "${URL}" --check_all "True" \
   		--verbose "True" --src_path "`pwd/${${ARTIFACT_NAME}}`" --external "True" --timeout 1;
