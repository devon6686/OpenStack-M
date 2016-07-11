chrony:
  pkg.installed: []

  service.running:
    - name: chronyd
    - enable: True
    - require:
      - pkg: chrony
      - file: /etc/chrony.conf

/etc/chrony.conf:
  file.managed:
    - source: salt://mitaka/env/chrony/templates/chrony.conf.template
    - template: jinja
    - mode: 644
    - defaults:
      CONTROLLER: {{ salt['pillar.get']('basic:mariadb:HOST') }}

time-sync:
  cmd.run:
    - name: chronyc sources
    - require:
      - service: chronyd
