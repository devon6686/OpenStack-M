basic:
  mariadb:
    HOST: controller

  mongod:
    HOST: controller

  rabbitmq:
    HOST: controller
    USER: openstack
    PASS: EiYiuPechooroh7x

  nova:
    CONTROLLER:
      HOST:
        controller: 10.0.0.1
    COMPUTES:
      HOST:
        controller: 10.0.0.1
        node2: 10.0.0.2

