include:
  - user
  - scipy-stack

python-pip:
  pkg.installed

python-virtualenv:
  pkg.installed:
    - require:
      - pkg: python-pip

# A system upgrade of distribute is required to install matplotlib
# with pip
distribute-upgrade:
    pip.installed:
        - names:
            - distribute
        - upgrade: True
        - require:
            - pkg: python-pip

/home/sklearn/venv:
    virtualenv.managed:
        - python: /usr/bin/python
        - system_site_packages: True
        - distribute: True
        - user: sklearn
        - require:
            - user: sklearn
            - pkg: python-virtualenv
            - pip: distribute-upgrade
    pip.installed:
        - names:
            - sphinx
            - coverage
            - nose
            - ipython
            - matplotlib
        - bin_env: /home/sklearn/venv
        - user: sklearn
        - require:
          - pkg: pkg-config
