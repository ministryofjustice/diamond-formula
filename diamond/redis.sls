{% from "diamond/map.jinja" import diamond_settings with context %}

include:
  - diamond

{{ diamond_settings.collectors_config_path }}/RedisCollector.conf:
  file.managed:
    - source: salt://diamond/files/collectors/RedisCollector.conf
    - user: {{ diamond_settings.user }}
    - group: {{ diamond_settings.group }}
    - mode: 644
    - template: jinja
    - watch_in:
      - service: diamond-service
