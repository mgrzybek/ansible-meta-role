AUTOTEST_NAME=ansible-autotest
AUTOTEST_PATH=/tmp

.PHONY: test # Testing YAML syntax and generating a test playbook
test:
	ansible-lint -x ANSIBLE0012 .
	test/ansible-meta-role -e name=${AUTOTEST_NAME} -e path=${AUTOTEST_PATH}

.PHONY: clean # Deleting the auto-generated testing role
clean:
	rm -rf /tmp/ansible-autotest

.PHONY: help # This help message
help:
	@grep '^.PHONY: .* #' Makefile \
		| sed 's/\.PHONY: \(.*\) # \(.*\)/\1\t\2/' \
		| expand -t20 \
		| sort
