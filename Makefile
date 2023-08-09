AUTOTEST_NAME=ansible-autotest
AUTOTEST_PATH=/tmp

.PHONY: test ## Testing YAML syntax and generating a test playbook
test: clean
	ansible-lint -x ANSIBLE0012 .
	test/ansible-meta-role -e name=${AUTOTEST_NAME} -e path=${AUTOTEST_PATH}
	ansible-lint -x ANSIBLE0012 ${AUTOTEST_PATH}/${AUTOTEST_NAME}

.PHONY: clean ## Deleting the auto-generated testing role
clean:
	rm -rf /tmp/ansible-autotest

.PHONY: help ## This help message
help:
	@awk -F: \
		'/^([a-z-]+): [a-z\/- ]*## (.+)$$/ {gsub(/: .*?\s*##/, "\t");print}' \
		Makefile \
	| expand -t20 \
	| sort

.PHONY: all ## Cleanup and full test
all: clean test

