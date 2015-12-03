# diamond-formula

A salt formula that installs and configures [python-diamond](https://github.com/python-diamond), a metrics collection daemon.

-------------
### Contents


--------------- 
### Usage


### Example

   diamond:
      handlers:
        - diamond.handler.graphite.GraphiteHandler
          diamond.handler.archive.ArchiveHandler
    handler:
      graphite:
        host: localhost
        port: 2003
    collectors:
      rabbitmq:
        host: localhost
         port: 55672
      elasticsearch:
        host: localhost
        port: 9200
      redis:
        host: localhost
        port: 6379
        