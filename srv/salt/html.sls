include:
  - user


/home/sklearn/public_html:
  file.directory:
    - user: sklearn
    - group: sklearn
    - mode: 755
    - makedirs: True
    - require:
      - user: sklearn
