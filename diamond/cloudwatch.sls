{% from "diamond/map.jinja" import diamond_settings with context %}

include:
  - diamond

{{ diamond_settings.handlers_config_path }}/cloudwatch.conf:
  file.managed:
    - source: salt://diamond/files/handlers/cloudwatch.conf
    - user: {{ diamond_settings.user }}
    - group: {{ diamond_settings.group }}
    - mode: 644
    - template: jinja
    - watch_in:
      - service: diamond-service