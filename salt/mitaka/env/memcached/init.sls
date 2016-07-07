Memcached:
  pkg.installed:
    - pkgs:
      - memcached
      - python-memcached
  service.running:
    - name: memcached
    - enable: True
