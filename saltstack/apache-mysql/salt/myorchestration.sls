db_setup:
  salt.state:
    - tgt: '11*'
    - highstate: True
web_setup:
  salt.state:
    - tgt: '12*'
    - highstate: True
    - require:
       - salt: db_setup
