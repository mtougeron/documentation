.PHONY: help
.DEFAULT_GOAL := help
EXEDIR=/usr/local/bin/hugexecs
EXE_LIST=`find gitlab/bin -type f -exec basename {} \;`
VIRENV=hugpython

help:
	@perl -nle'print $& if m{^[a-zA-Z_-]+:.*?## .*$$}' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-25s\033[0m %s\n", $$1, $$2}'

build: clean-build source-helpers ## digest and build a hugo site.
	source $(VIRENV)/bin/activate; \
	version_static.sh \
	fetch_integrations
	$(EXEDIR)/py/placehold_translations.py -c "config.yaml" -f "content/";
	# gulp_tasks
	# build_hugo
	digest_site.sh \


clean:  ## clean the local files for a release.
	make clean-build
	make clean-exe
	make clean-venv

clean-build:  ## remove build artifacts.
	if [ -d public ]; then rm -r public; fi

clean-exe:  ## remove execs.
	if [ -d $(VIRENV) ]; then rm -rf $(VIRENV); fi

clean-venv:  ## remove python virtual env.
	rm -rf $(EXE_LIST)

config: ## make sure all the configs are set
	pass

deploy: build test  ## deploy a tested build.
	source $(VIRENV)/bin/activate
	collect_static
	create_artifact
	push_site
	push_artifact
	tag_successful_deployment

hugpython: hugpython/bin/activate

hugpython/bin/activate: gitlab/etc/requirements3.txt  ## start python virtual environment.
	export VIRTUALENVWRAPPER_PYTHON=/usr/bin/env python3
	test -d $(VIRENV) || virtualenv $(VIRENV)
	$(VIRENV)/bin/pip install -Ur gitlab/etc/requirements3.txt

source-helpers: hugpython  ## source the helper functions used in build, test, deploy.
	[ -d $(EXEDIR) ] || mkdir -p $(EXEDIR)
	cp -r gitlab/bin/* $(EXEDIR)

test: build  ## test a build.
	source $(VIRENV)/bin/activate
	test_images
	test_links
	test_static
