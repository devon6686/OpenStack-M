system-upgrade:
  cmd.run:
    - name: yum -y upgrade
    - require:
      - file: openstack-repo
      - file: base-repo

bake-repo:
  file.directory:
    - name: /etc/yum.repos.d/bak

mv-repo:
  cmd.run:
    - name: mv /etc/yum.repos.d/CentOS-*.repo /etc/yum.repos.d/bak/
    - require:
      - file: bake-repo
    - unless: test -e /etc/yum.repos.d/Mitaka.repo

openstack-repo:
  file.managed:
    - name: /etc/yum.repos.d/Mitaka.repo
    - source: salt://mitaka/env/repo/templates/Mitaka.repo

base-repo:
  file.managed:
    - name: /etc/yum.repos.d/Base163.repo
    - source: salt://mitaka/env/repo/templates/Base163.repo

python-openstackclient:
  pkg.installed:
    - require:
      - cmd: system-upgrade
