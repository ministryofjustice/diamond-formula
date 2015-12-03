{% from "diamond/map.jinja" import diamond_settings with context %}

/etc/init.d/diamond:
  file.managed:
    - source: salt://diamond/files/init.d/diamond
    - user: {{ diamond_settings.user }}
    - group: {{ diamond_settings.group }}
    - mode: 644
    - template: jinja
    - watch_in:
      - service: diamond-service

/var/log/diamond:
{{ diamond_settings.collectors_dir }}:
  file.directory:
    - user: {{ diamond_settings.user }}
    - group: {{ diamond_settings.group }}
    - dir_mode: 755
    - file_mode: 644
    - makedirs: True
    - require_in:
      - service: diamond-service

diamond-service:
  service.running:
    - name: {{ diamond_settings.service }}
    - enable: True
    - require:
      - pkg: {{ diamond_settings.pkg }}
