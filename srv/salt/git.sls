include:
  - user


git:
  pkg.installed

python-git:
  pkg.installed

sklearn-git-repo:
  git.latest:
    - name: https://github.com/scikit-learn/scikit-learn.git
    - rev: master
    - target: /home/sklearn/scikit-learn/
    - user: sklearn
    - require:
      - user: sklearn
