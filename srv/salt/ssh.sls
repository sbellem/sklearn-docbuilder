include:
  - user


/home/sklearn/.ssh:
    file.directory:
        - user: sklearn
        - group: sklearn
        - mode: 755
        - makedirs: True
        - require:
            - user: sklearn

/home/sklearn/.ssh/id_rsa:
    file.managed:
        - user: sklearn
        - group: sklearn
        - mode: 600
        - source: salt://files/docbuilder_rsa
        - require:
            - file: /home/sklearn/.ssh

/home/sklearn/.ssh/id_rsa.pub:
    file.managed:
        - user: sklearn
        - group: sklearn
        - source: salt://files/docbuilder_rsa.pub
        - require:
            - file: /home/sklearn/.ssh
