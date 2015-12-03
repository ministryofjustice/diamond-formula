{% from "diamond/map.jinja" import diamond_settings with context %}

include:
  - diamond

{{ diamond_settings.collectors_dir }}/RabbitMQCollector.conf:
  file.managed:
    - source: salt://collectd/files/collectors/RabbitMQCollector.conf
    - user: {{ diamond_settings.user }}
    - group: {{ diamond_settings.group }}
    - mode: 644
    - template: jinja
    - watch_in:
      - service: diamond-service
