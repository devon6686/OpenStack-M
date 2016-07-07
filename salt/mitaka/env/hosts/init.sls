/etc/hosts:
  file.managed:
    - source: salt://mitika/env/hosts/templates/hosts.template
    - template: jinja
    - defaults:
      HOST: {{ salt['pillar.get']('basic:nova:COMPUTES:HOST','') }}
