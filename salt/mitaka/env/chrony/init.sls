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
    - mode: 644
    - defaults:
{% set CONTROLLER = salt['pillar.get']('basic:nova:CONTROLLER:HOST')%}
      CONTROLLER: {{ CONTROLLER.keys() }}

time-sync:
  cmd.run:
    - name: chrony sources
    - require:
      - service: chronyd
