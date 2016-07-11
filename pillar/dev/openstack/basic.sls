basic:
  mariadb:
    HOST: node-11

  mongod:
    HOST: node-11

  rabbitmq:
    HOST: node-11
    USER: openstack
    PASS: EiYiuPechooroh7x

  nova:
    CONTROLLER:
      HOST:
        node-11: 172.16.100.11
    COMPUTES:
      HOST:
        node-11: 172.16.100.11
        node-12: 172.16.100.12

