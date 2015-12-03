{% from "diamond/map.jinja" import diamond_settings with context %}

include:
  - diamond.service

diamond:
  pip.installed:
    - name: {{ diamond_settings.pkg }}
    {%- if diamond_settings.pkg_version is defined and diamond_settings.pkg_version %}
    - version: '{{ diamond_settings.pkg_version }}'
    {%- endif %}

{{ diamond_settings.config }}:
  file.managed:
    - source: salt://diamond/files/diamond.conf
    - user: {{ diamond_settings.user }}
    - group: {{ diamond_settings.group }}
    - mode: 644
    - template: jinja
    - watch_in:
      - service: diamond-service

{{ diamond_settings.collectors_dir }}:
  file.directory:
    - user: {{ diamond_settings.user }}
    - group: {{ diamond_settings.group }}
    - dir_mode: 755
    - file_mode: 644
    - makedirs: True
    - require_in:
      - service: diamond-service

{{ diamond_settings.configs_dir }}:
  file.directory:
    - user: {{ diamond_settings.user }}
    - group: {{ diamond_settings.group }}
    - dir_mode: 755
    - file_mode: 644
    - makedirs: True
    - require_in:
      - service: diamond-service
