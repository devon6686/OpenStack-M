mariadb-packages:
  pkg.installed:
    - pkgs:
      - mariadb
      - mariadb-server
      - python2-PyMySQL
  service.running:
    - enabled: True
    - require: 
      - file: /etc/my.cnf
      - pkg: mariadb-packages

/etc/my.cnf:
  file.managed:
    - source: salt://mitaka/env/mariadb/templates/my.cnf.template
    - template: jinja
    - mode: 0644
    - defaults:
      IP: {{ salt['pillar.get']('basic:mariadb:HOST') }}

