# Effectivemobile-test-repository
Докеризированное веб приложение (nginx, php, mysql) с использованием docker-compose.yml для разворачивания на удалённом сервере.

Структура каталогов Ansible проекта докеризированного веб приложения:
```
Ansible
├── ansible.cfg
├── inventory
├── playbook.yml
└── roles
    ├── docker
    │   ├── tasks
    │   │   └── main.yml
    ├── nginx
    │   ├── handlers
    │   │   └── main.yml
    │   ├── tasks
    │   │   └── main.yml
    │   └── templates
    │       └── nginx.conf.j2
    └── app_php
        ├── files
        │   ├── docker-compose.yml
        |   └── Dockerfile
        └── tasks
            └── main.yml
```
