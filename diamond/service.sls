{% from "diamond/map.jinja" import diamond_settings with context %}

diamond-service:
  service.running:
    - name: {{ diamond_settings.service }}
    - enable: True
    - require:
      - pkg: {{ diamond_settings.pkg }}
