httpd:
  pkg.installed:
    - name: httpd
    - file: httpd
  service.running:
    - enable: True
    - require:
      - pkg: httpd
  file.managed:
    - name: /etc/httpd/conf/httpd.conf 
    - source: salt://httpd/httpd.conf
    - require:
      - pkg: httpd
