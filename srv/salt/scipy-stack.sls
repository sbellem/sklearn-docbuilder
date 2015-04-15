scipy-stack-packages:
    pkg:
        - installed
        - names:
            # Salt optional stuff
            - vim
            - make
            - optipng
            - python-numpy
            - python-scipy
            - python-coverage
            - python-nose
            - ipython

            # Required for building a more recent matplotlib from source
            - libfreetype6-dev
            - libpng12-dev
            - pkg-config

            # Latex packages for math expressions in sphinx
            - latex209-base
            - texlive-latex-extra
            - dvipng

            # Linear Algebra routines
            - libatlas-dev
            - libatlas3gf-base

