# ansible-postfix

Ansible playbook to deploy a postfix server, primarily as a limited relay.  This is probably not much use to anybody but the author, but you're welcome to take any bits you like or offer suggestions.

With a few variable set, it will install and configure postfix on either CentOS or Ubuntu and configure it to relay for certain domains.  This includes RBL SPAM filtering and will include SSL as well when finished.

### Role Variables

**postfix_myhostname** - You can override the hostname that postfix reports if required, otherwise it will just use {{ ansible_fqdn }}

**postfix_relay_domains** - Domains that you want to relay mail for

**postfix_relay_aliases** - Addresses you want to relay for and where to (See example playbook below).  They are run through in order, so put the most specific aliases first, catch all @domain last

**postfix_rbl_client_exceptions** - Addresses/Hosts that you don't want to perform SPAM RBL lookups for.  For example, if you use BT as your home ISP, their subnets are often blocked, this can be used to unblock your home network

### Example Playbook

This is pretty straight forward to use:

    - hosts: all
      vars_files:
        - "vars/{{ ansible_os_family|lower }}.yml"
        - vars/defaults.yml

      vars:
        - postfix_relay_domains:
          - mydomain.com

        - postfix_relay_aliases:
          - { orig_to "@mydomain.com", relay_to: "my.actual.address@gmail.com"}

      roles:
        - postfix
