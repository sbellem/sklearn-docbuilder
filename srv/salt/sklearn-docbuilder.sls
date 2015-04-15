scipy-stack-packages:
    pkg:
        - installed
        - names:
            # Salt optional stuff
            - git
            - vim
            - python-git
            - python-numpy
            - python-scipy
            - python-pip
            - python-coverage
            - python-virtualenv
            - python-nose
            - ipython
            - make
            - optipng

            # Required for building a more recent matplotlib from source
            - libfreetype6-dev
            - libpng12-dev

            # Latex packages for math expressions in sphinx
            - latex209-base
            - texlive-latex-extra
            - dvipng

            # Linear Algebra routines
            - libatlas-dev
            - libatlas3gf-base

sklearn:
    user.present:
        - shell: /bin/bash
        - home: /home/sklearn

/home/sklearn/public_html:
    file.directory:
        - user: sklearn
        - group: sklearn
        - mode: 755
        - makedirs: True
        - require:
            - user: sklearn

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
        - source: salt://docbuilder_rsa
        - require:
            - file: /home/sklearn/.ssh

/home/sklearn/.ssh/id_rsa.pub:
    file.managed:
        - user: sklearn
        - group: sklearn
        - source: salt://docbuilder_rsa.pub
        - require:
            - file: /home/sklearn/.ssh


# A system upgrade of distribute is required to install matplotlib
# with pip
distribute-upgrade:
    pip.installed:
        - names:
            - distribute
        - upgrade: True

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

sklearn-git-repo:
    git.latest:
        - name: https://github.com/scikit-learn/scikit-learn.git
        - rev: master
        - target: /home/sklearn/scikit-learn/
        - user: sklearn
        - require:
            - user: sklearn
