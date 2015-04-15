include:
  - sklearn-docbuilder

# Upload a bash script that builds the doc and upload the doc on
# http://scikit-learn.org/dev 
/home/sklearn/update_doc.sh:
    file.managed:
        - user: sklearn
        - group: sklearn
        - source: salt://update_doc.sh
        - require:
            - user: sklearn


# Register the execution of the script in a cron job
update-doc-cron-job:
  cron.present:
    - name: bash /home/sklearn/update_doc.sh
                 > /home/sklearn/public_html/update_doc.log 2>&1
    - user: sklearn
    - minute: 2
    - hour: '*/1'
    - require:
        - git: sklearn-git-repo
        - file: /home/sklearn/update_doc.sh
        - file: /home/sklearn/public_html


# Once in a while build the doc from a clean folder
update-doc-clean-cron-job:
  cron.present:
    - name: bash /home/sklearn/update_doc.sh clean
                 > /home/sklearn/public_html/update_doc_clean.log 2>&1
    - user: sklearn
    - minute: 32
    - hour: 2
    - require:
        - git: sklearn-git-repo
        - file: /home/sklearn/update_doc.sh
        - file: /home/sklearn/public_html
