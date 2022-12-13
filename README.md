# ansible-meta-role

Ansible role generator including monitoring, clustering and docker
packaging.

## Requirements

`ansible-galaxy` must be in $PATH.

## Role Variables

Two variables must exist:

* `name`: role’s name
* `path`: role’s path

## Dependencies

This is a standalone role.

## Example Playbook

This is a simple script using the role:

```yaml
#! /usr/bin/ansible-playbook
---

- name: Bootstrap ansible role
  hosts: localhost
  gather_facts: no
  roles:
  - role: ansible-meta-role
```

The command line should be:

``` bash
$ chmod +x ansible-meta-role
$ ansible-meta-role -e name=my-role -e path=/tmp/
```

## License

GPL-3+

## Author Information

Mathieu GRZYBEK
